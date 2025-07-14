Return-Path: <linux-arm-msm+bounces-64813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBB7B03EB8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 14:32:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 571BE167C3A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 12:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA240217F55;
	Mon, 14 Jul 2025 12:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ROHfuF0L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFD0246779
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 12:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752496342; cv=none; b=rkPZKChnHd+PUtISBaaNLGgHL6WxMJ4PKmLNv+Wcpd53Q5FiroX+WX5pA5Qn/lC5TPvqFxnSz8i5wAm5P5vvduL1gRxMx4WP5z3clsIaq6VGL6rbg3n2Me3wKysCWquQ1IOZJNkwW88PZ7IVFOJCOlfjRTYvdA45oqhmgu/P8LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752496342; c=relaxed/simple;
	bh=flFLNAWDk2urtyAkbTkLSFABCC4IEkAZoRUS6V2MQF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mq7eM2S1egkrY3r2J2LntaHosko00QrD1OOBU2AG+FvOi1Fj3GXj57GjQ7ELrNY6XdKwjex10B5eVwhHVd3o13hlW8N5QZn8eeOqtZN8VjZA3UTn9DJvUcfu/CMGDhdxsCGr+pIEojmRPbOOOodH+cPmL/mIdlx7ZhJYeTsOHVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ROHfuF0L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56E9xbIR011258
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 12:32:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7q2lysz52slfDvlR51XkXLPg
	9u1Mj3w8tjVs3VUtBXw=; b=ROHfuF0L2sw8STjmfZBWWQ047vDeEh3kZEyfIFJg
	JRluHY0SK41fUp23rFr6f8PrZ0MdFCyPVTSHaApr9ERSUQund++5gYloO8SVbOGI
	9dbAbWfwoVqhPJdJX6akFeMMir2dRIHIBVThzBR4yMgCLRJvkTOb4v6WGOXO/wcP
	7oEdMLlXwVqx2znScwvLXrULZPzIHF0Ka0qDjulLIMPyqOZA9q6ts2pfFWOzUIKD
	RQERtPerbQh2bA/Nu4ZMaQ+QpY+qTm8EzXrTK8p5Z7IMjUqiFoN6Ocryqf3Wm2vy
	HYQ671/j9a9ZLhzrUXmaZcaSVHiqeyNFkXgGeKrwl3Nm2g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47uftmcphs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 12:32:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d4576e83cdso1165680985a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 05:32:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752496339; x=1753101139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7q2lysz52slfDvlR51XkXLPg9u1Mj3w8tjVs3VUtBXw=;
        b=DvvY+7xR95HArbMtutafnpjghX4CwZ3kt90/XvBU28PToxrOsYvDsV8LQl9fG0uvwz
         OeWTsRL79wojeZudVMxMKWqxSovkvc8JBD+SE09tug6YdqqI73UJlYKeS0m5uJSUceyD
         fNOUwxc6QbCJR4VeVwH0xP7KDUESfHcxmoemQduKL+xxKt4lHmTPy8cAqbUHVC2W5ZeW
         U4bmFF6+Bxg86xL11Ku9vaqUr+ImXjjMZ0xtstctRar80u4u9MWfhQxp4Z8IKiMN+Pzy
         jRZ1cCRXdenYQC8Rgo/2T4hr/3hFgfB7/Jn4BGsL2K1IelbnfvLoIo4B8eHJov0XmC0P
         BuIg==
X-Forwarded-Encrypted: i=1; AJvYcCXINNXfMQ0a3ApHwbh8c3GzBknBg0kvkVhCQ5tfpxgy4NyOtv6zcWIpbjIeb1IKL2xsiePsOKmjdTVxoGD+@vger.kernel.org
X-Gm-Message-State: AOJu0YwX+kTs+OKLRDU3Kr1ECcZMSTi8dElgL1z82EzwUEKSIfEV2/ok
	LtY+FC1JauIIjO5/objCxYrqmQ+MElfPe3nxa45f/zwsdABIL3BhoXAJ9QfaYojwdBRcR1oARu9
	/nIU1O8pIxdSR5LIPIiaYG2Bt3Ea7f40qg+OLxXBco5ujd5HSYo0ytLDB6bFhBIifOfXiuPH4kf
	OW
X-Gm-Gg: ASbGnctqB0aUUCp+j+cQTceMn1IB7//R2oBohvnHMseGUW6hjl8EUwCwOLWc4lxjsgC
	BcMt9d2oJpc1E/OJ9Fs8QbxSgtyX9plbtW5Ukz/i2y/vqulQW2LHX44Tqm84HTkadRXKGdbhz2M
	uP+B/IxE9cPxnBTzgmzJPow7wY6cYwkGENE8585SmxLZU0jOl2i3rOqPgyra9BXfvXaN2bBr2wv
	jd2TKAq1XBzLENNC1pKyHTw5XC+YBngHOb4DsghVHfSGUS1dwd3tp6Rc+Joz+dbzVvFEsEjnluE
	h8h54OC0ZDa8TvXGoeJ2KyQaUVPuPv2m6jEo6q5TqYcYrDC6kLc2bXvB7GPRFnD6K7n2+vaLnDW
	vz/7qJgzulMluXo/zrEke5zINv+xohrL73wd3lRZdDXFNwBWMScP1
X-Received: by 2002:a05:620a:414f:b0:7e3:2f19:deb1 with SMTP id af79cd13be357-7e32f19e3c9mr222594785a.33.1752496338610;
        Mon, 14 Jul 2025 05:32:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJHWSGVbWAfapT1Efo8CREUZ3rbnR+lvZ30NNYQVSM3Nje58DWmrPudsFI7Ni6msJCAqNm6w==
X-Received: by 2002:a05:620a:414f:b0:7e3:2f19:deb1 with SMTP id af79cd13be357-7e32f19e3c9mr222590185a.33.1752496338111;
        Mon, 14 Jul 2025 05:32:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32fab916bebsm15512601fa.105.2025.07.14.05.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 05:32:17 -0700 (PDT)
Date: Mon, 14 Jul 2025 15:32:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <quic_tdas@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>
Subject: Re: [PATCH v2 01/11] clk: qcom: common: Add support to register rcg
 dfs in qcom_cc_really_probe
Message-ID: <ovquneide5g4tpaqr5ptw7b3yr77u4hgzei6z6u7tieysbi62p@6vjbgzhjxd6u>
References: <20250704-sm7635-clocks-v2-0-9e47a7c0d47f@fairphone.com>
 <20250704-sm7635-clocks-v2-1-9e47a7c0d47f@fairphone.com>
 <64e27035-d124-470a-bc5b-66d254b6ff4f@quicinc.com>
 <DB7I1Q9TD02L.2A18QMRU7VXHD@fairphone.com>
 <b60d3297-8267-460f-9c4c-1519c511ac36@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b60d3297-8267-460f-9c4c-1519c511ac36@quicinc.com>
X-Authority-Analysis: v=2.4 cv=AI4FyeZ1 c=1 sm=1 tr=0 ts=6874f8d4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=6H0WHjuAAAAA:8 a=tQVf4dIAefa0khsDELoA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: N9xYQNM-tV50euugru70qV8BiQ5OswJN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA3MyBTYWx0ZWRfX5JUoIE9IeUmR
 d6K6lqNlRczxgEL1kmbzy2t7p1Avz5DHGZg8J6tQr4cttnhcTR6pdSGzY33loVu6sFc8nyrucv1
 tdGYx9+1/ixtda99kEZJvnSDSPsqqvxLmqMFPk+TRQQTiPBpPVAzHl4XmwspkMXuph+/kNzLcr4
 YlupkKUwRvrRC78ngKs3ykszsHcOz09opZZb+W0yzs95z3rfaU6kqr0+vzgBxAq0t0PAfE5xzwn
 1dy1rqKG+A2epewDKmXLD1XudnOxL4gwQlLHThAr09iOw824KEmJWgEHuzNR9bgJztRnsZCjFra
 rippeLehCsMM/FNEv/MDSLt3610HhxsOmcf9tNf6gbIvUfmsk0sh6mlY5bA9StUEcF85TJz5p90
 RXfqXoOrMmucjCka8G/7yGcfLrEx5hTB1SSxZOnJpegv+WumvLlQbhO+6M6+AUDh9d3MDzCX
X-Proofpoint-GUID: N9xYQNM-tV50euugru70qV8BiQ5OswJN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140073

On Mon, Jul 14, 2025 at 04:34:39PM +0530, Jagadeesh Kona wrote:
> 
> 
> On 7/9/2025 5:18 PM, Luca Weiss wrote:
> > Hi Jagadeesh,
> > 
> > On Tue Jul 8, 2025 at 7:34 AM CEST, Jagadeesh Kona wrote:
> >>
> >>
> >> On 7/4/2025 12:46 PM, Luca Weiss wrote:
> >>> Add support to register the rcg dfs in qcom_cc_really_probe(). This
> >>> allows users to move the call from the probe function to static
> >>> properties.
> >>>
> >>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> >>> ---
> >>>  drivers/clk/qcom/common.c | 8 ++++++++
> >>>  drivers/clk/qcom/common.h | 2 ++
> >>>  2 files changed, 10 insertions(+)

> >>> diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
> >>> index 0f4b2d40c65cf94de694226f63ca30f4181d0ce5..dbe7ebe5b8710fb03c1671ac9022e608a6aad35f 100644
> >>> --- a/drivers/clk/qcom/common.h
> >>> +++ b/drivers/clk/qcom/common.h
> >>> @@ -43,6 +43,8 @@ struct qcom_cc_desc {
> >>>  	size_t num_gdscs;
> >>>  	struct clk_hw **clk_hws;
> >>>  	size_t num_clk_hws;
> >>> +	const struct clk_rcg_dfs_data *dfs_rcgs;
> >>> +	size_t num_dfs_rcgs;
> >>
> >> Since all other probe configurations are added in qcom_cc_driver_data struct, it is better to
> >> add rcg dfs data also to qcom_cc_driver_data struct instead of qcom_cc_desc.
> > 
> > Dmitry suggested to use struct qcom_cc_desc:
> > https://lore.kernel.org/linux-arm-msm/w4eujq72uqflqpsqshc7zhu6lkc7owufep2g2rjacvzgj44vmf@auonp4ugbgow/
> > 
> > I personally don't have a preference.
> > 
> 
> Hi Luca, 
> 
> As other probe configurations like critical clock cbcrs & pll configurations are part of driver_data, it is better
> to include this DFS data also in driver_data.
> 
> Dmitry, I hope it is fine to move the above DFS data to qcom_cc_driver_data struct instead of qcom_cc_desc.

Yes, of course.


-- 
With best wishes
Dmitry

