Return-Path: <linux-arm-msm+bounces-58008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BC0AB77E2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 23:25:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 351771B67E3D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 21:25:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9794296721;
	Wed, 14 May 2025 21:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SgqZVKFE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA6929345E
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 21:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747257897; cv=none; b=ixeX/EAgCgGqFDApKe4a2z+Ptxy/xzRxhIWqMPA6Cxjdk9Ei7Krh1rL+uD4P/pz62aU65G17cG/xKrtUS0FnmrSy6MhSkRdDV7dydyki41EW8L+Wudj7ea6733ByctUsX03feczgpfHNg/Je12opnuJivK2C6yCSs114uj0R6W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747257897; c=relaxed/simple;
	bh=JI3aO0Xne4gz/l4xJjjb0rARPJK5BMCjNKXHpnP5bvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SRslkSR+5goiWOXnlXi8GrNQI4oJSwOWhk2VdktKjUqK5IRskwzP0aF9yhFWfNq/MIoQLghF48ShXrjwV/Hr7eM8JGgNvCE8xHg2kvv8rV6M0OX9QC4JctJyFXLO7btHm4nNLNQIA5Sg3YpnzRA80IQy0f73DlVMrgyHpYx32WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SgqZVKFE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EL3u4i020099
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 21:24:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YpCv2M1J8qzljfnb2RwyvX/O
	s/BNN0wmNB7GwTmqRLk=; b=SgqZVKFEDGoHSFKcbbqYyrrbH6u0zscpsZ7JYhVY
	G4Jgz0tQq20f5cST/134JUbiart+X1+6ffJzXEbArECfVZ5pnqZ4Gf8X4roYiq6U
	WAywHby6F1IfqQPnV89Qx/q8/GZvdvs6ovydlRxHHAGrUFyXdPcetH74rKqtOQHM
	e6hbRLo7AIefJlcaEFRZ/CiiKIWWyGrixHeOHZzj0FIImXnCcOMvd1pow3d40feJ
	UbLQ3oddss5gn8rMe46uQs24hJvRCEsg9R2Ysn04En/zn/6yfIUd/mXleLEdh4q8
	iodvB3D/pGWCYWxmtrxqj+3F5Ytw0z4GSF48dl8JdkU8OA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnm424-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 21:24:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c760637fe5so36698585a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 14:24:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747257894; x=1747862694;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YpCv2M1J8qzljfnb2RwyvX/Os/BNN0wmNB7GwTmqRLk=;
        b=cMUu8xTh14cKwdXL0rsTHNQtL+hR7xxDLidNv6GIfH5pUCuNO2KnIPanwH0VORX7fA
         99aJxzX/IYVZAr6LK63yl/bqyLiTYvO3shx6vJtUJvSKxJMPJXnJ/FIVVGqXt1TpQ9vF
         mETcah/p2k81OO7gRVqNg5y30RBNAtd7EntWdoLpKNQ9ZCDjc7j44To2lEVQsq1wUg6f
         A41V9JV1ucuisdJYyisV4FGCP19JJZ1PKn7AZO9urWOQlpiQCFG8TVSDviysuuH/gAlx
         gMNnnmB91yJaWob6r3KoLw4hsG+KA7tQ9GfvchO+nOdsLTjVypRb8arBTHrTHg0dZ7un
         GOKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWseFkGYtz2P37bv+GuRoWdWyddhMN2UQRWpC3NNGQxA6OqZBsZCmqzcjMeaO0oleJuDiNXA+aXmQdw48T+@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz+08bQl3MyuVQLrOL90N81opBIeIkOFPDBAYfg2lcoEf3A6/o
	ZLPqvM2rqS0aKyP4QiD/qlFpWOpi14lZejTx0ICVIUhInPaUmqiSTB0Dl5o7RWKgmENaJTS7dZc
	m6RxMbd0hn+v06KeKCaFzIFbKUXcX5Qt7iYuoaq98dTf2XLMsB4QBmbVforpLQt1y
X-Gm-Gg: ASbGncu2rWfEextuMBfqet4MRwoKDhangvymgSOkhhX2spzVXjtfhV9AUntLa7lMfY1
	m3HSGJ+krBDfc+lujEZkC/vuxLPabBMnEfEw7gmDQKKERtEdh88xq8+UbRA2H+fWzb6IyHP4Psk
	DC6WzyjAyTgbtQ5EkGKs+FdfJi7mNV9eoZui9ofeLYDhuLbQ/LvOPWwwR3RCFWTDdBH7YIpPq1b
	LSp5d4OXYbKL2ZkJmUPIMjVy/ZWpxuIJpbqPy/cbzUHSNvf+z9cXCyBAMsPptBm1gZv2uvg9i2r
	Tk897A6YHeve3y7hhvFpuD5wbXb9eSyqpjLQyZFdXXMPElXD8ZcBCJgVajGwF/aXpxcou3ixN2I
	=
X-Received: by 2002:a05:620a:40cf:b0:7c5:4949:23ea with SMTP id af79cd13be357-7cd28860614mr852301085a.47.1747257894362;
        Wed, 14 May 2025 14:24:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjymjeWbky+bWc5HrmqLom065mk8ADlHApOiZ5U1I8t7wQBMAnqsg5tbDDJ56iHxHun566yg==
X-Received: by 2002:a05:620a:40cf:b0:7c5:4949:23ea with SMTP id af79cd13be357-7cd28860614mr852296685a.47.1747257893968;
        Wed, 14 May 2025 14:24:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-327ee94cf00sm3404131fa.4.2025.05.14.14.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 14:24:51 -0700 (PDT)
Date: Thu, 15 May 2025 00:24:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v4 06/18] clk: qcom: common: Add support to configure clk
 regs in qcom_cc_really_probe
Message-ID: <s23nv4tgfkqz6ymc7mtyea5ch62jhfqgznhqptkknmauzywis7@t7a7x2a3d6j3>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-6-571c63297d01@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-6-571c63297d01@quicinc.com>
X-Proofpoint-ORIG-GUID: zmA8Xy-iVqoDgRnc8e1jYDlOWvaGO5LD
X-Authority-Analysis: v=2.4 cv=aIbwqa9m c=1 sm=1 tr=0 ts=68250a27 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=iQDCAvNWiRZ5lwmz5SwA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: zmA8Xy-iVqoDgRnc8e1jYDlOWvaGO5LD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE5OCBTYWx0ZWRfX7Qhwy36+3nPr
 wuY3aAibQPGUn6CnD81wZOaguvU9K7AwP4YoKvE8Dj0nMYRlSWfzaca7ho+0Z6WBm8cqybkvkgu
 grCYmEg+j2ruJpTPfA+uChcXfwXlcf3e245RvnvetwQVa/zvv6npCPRP3jmsSqhZ3hO4WW1r+iZ
 5W2Lda3iBVC5lNlFH6SaEo58whEFNm5OUenFHCa53hpotvQmMxv/4mb/ChJS0wN+cAmcs3uIZv3
 PNkq3dFwgOiM8C+189o/1dnQjuVg6uXZTVwraKAp9eyBP09BPijXClt21XX08c2sWz6E80QIIyC
 000ZFcxw5193IIDz+yqbbqmX8K/gWWDB3shrbiPzX+xXQ48MAV6I4vfNTNacfU5xX0aylEBc8l0
 u1ZL/ELrd0VVx0Zzsi+6zAMyLSBwUtgNnR2bcIQJZ25eRzTkYJOTk9etQURFehGvysAFOVjA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140198

On Thu, May 15, 2025 at 12:38:51AM +0530, Jagadeesh Kona wrote:
> Add support to configure PLLS and clk registers in qcom_cc_really_probe().
> This ensures all required power domains are enabled and kept ON by runtime
> PM code in qcom_cc_really_probe() before configuring the PLLS or clock
> registers.
> 
> Add support for qcom_cc_driver_data struct to maintain the clock
> controllers PLLs and CBCRs data, and a pointer of it can be stored in
> clock descriptor structure. If any clock controller driver requires to
> program some additional misc register settings, it can register the
> clk_regs_configure() callback in the driver data.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>  drivers/clk/qcom/common.c | 39 +++++++++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/common.h |  9 +++++++++
>  2 files changed, 48 insertions(+)

Not quite what I expected, but it works and looks good.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

