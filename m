Return-Path: <linux-arm-msm+bounces-60028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 923DAACA965
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 08:17:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6ECD13AB025
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 06:17:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD3D82C3255;
	Mon,  2 Jun 2025 06:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="euq5XaOu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680ED801
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Jun 2025 06:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748845067; cv=none; b=ptwgB3pO/Th7v8wAXLRMNy4FMNE0lBAVv/AiA9ov7qQYjsqLio3hIm01vyQpArh9ypvFS0xHaLNhfkXslq2FVOk8XIGnZsnzLFSN9lug7F0rs/ezHfaaMoO37hA/0J76m/9/Mj2iqoPWQ2B4xAAONf8y3P/iR9E1pZ4gfNWE84k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748845067; c=relaxed/simple;
	bh=CPZaR4EI368+qAI3lHWNS2wXQVdHRdGqRCZIxygqlUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=piWQ378IECuWPfzW2GoID1Kv1IN5b+nf3MwSfuWK6p8ZYj1ov+xD2qzUVFQAMvAhMHEGfZpnl/EQgovVbwT4p/mpknO3G5hKM1WgfPFi3DcbvuVoJ5gi4lA60k9Dp4SgRj2QK/ghm6eaTboOSrVeLJfwsFxUdUDMxKRCckjhNUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=euq5XaOu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 551NA2P6018969
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Jun 2025 06:17:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uWhhuDrzJ7payPyIOKXiW673
	AvOva7B7U3C0U9pnehA=; b=euq5XaOuYWh86iSwhgsrlsNO+OuI8kL5F+GKjV3n
	mXv+Pn8XGh5G014Z0gKEkLqTpNe4rdYWblFrUl4ZPYsaOxnJU9pfIVqQ+8+0oFIw
	E9SkRUU8abO9Nn2ECJ9/26keA7WuhrUFBV9WANWBqg7V9Tef+kot032a3D+/GHHQ
	pXG314+MxTJUAXlYOoFQcW6Bu3Zq34ecomILrMZrVMMYW7mkXJSpnq4nU1aiUVpk
	D0/OnHMbwCtJhJyJgNx90kxhh9xzDHYSUCtTJaOPk54wovX7oWoBEFnZIZmOHGGU
	YZF3pMYZM0RL4uGchiaxBuZc/HKQM4w5i3vBeDKmYT6XLg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46ytm4kgsj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Jun 2025 06:17:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7caee990715so1237026885a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Jun 2025 23:17:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748845064; x=1749449864;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWhhuDrzJ7payPyIOKXiW673AvOva7B7U3C0U9pnehA=;
        b=mt19r/M5wzfJTxyJvY2ulkjeQrH8VFbdXnTFiIG1vqYeJe6vDE9uqa+1asa2D5hypp
         i8toox9a734VAzPu2RmAseB5OKBhRKIKn1BJBITncx+Jxe+fICCeBDV8WyAibGUzGX2P
         x8WEOC4roupz01nV5nKHs1xfiBz4sxYRy8+P90yF9+kU38KkJuyWg2oTsrWxHbSNxivZ
         AaQqO/U3iEIsOOD9E5SgK/804SM1Sj240+49O1u6PY+MoxIDJIxCSx9UGxhse7WFybmL
         mEZ5r1Ay/N7UfYrFwuwbM/Prh2/m94lRbOCLr8i46Tz+eNs9W5x+5ieScNgj7TN7ri9o
         4Rkg==
X-Forwarded-Encrypted: i=1; AJvYcCUBFPmm1Dh6lrF3/kuxW6kw4A/el3RYNXtkK2ru2JsyqfxlwiZmmz8ySQqjcar3MkMAQP330pSnOLlqz5qC@vger.kernel.org
X-Gm-Message-State: AOJu0YxslI36++UMB0VVn/Jy38WJtMGDCfqnd/ui8jGoj8NsOTEymqGx
	Zl1/x3/q+ARWVoE+m5fY9ROrKDmptkUs4ARUoOLOiFB421Cm4klfr2HBVfa7I7FjPhjdhUDANBG
	ufATSZEo4vEO0teljUlUsljdxsB2zsT37DSvNvSZyN+5PomnHzpLp7eu38xRHAtO5KNe6
X-Gm-Gg: ASbGncvQHSa0c4XqhdChvWTofsW1D+E8Zo2lq0w7W6cD3jLLIgtpelpHtLoEIhMR3AI
	UqSdgYhAXTcSFJV3cMMr0Cu78XlOu+y2Self31oBLV8nBOruHGxXBGeCnBOihKZukU3aSgC1sR6
	iblth7xU4flhxmqHaC2TaOdhj93uBm55/C5drP6aXJ7ODvve7lwHfuMff2Nm4jEx+20wAchT9d3
	VyL41BVqwu1pTnu56fWEmahjtI36FNI6H8sfOl9fgcmw9HJd1UNRnaW6dqlnYhidqYOe1TrUO1X
	CSTjJKBGj+wJKmtqOIpMhFYzD9mZzgo/1013kuWgOrFBsjK/1Iz7EcYLLOGC15NbnU+d2H3UKA4
	=
X-Received: by 2002:a05:620a:1914:b0:7c9:6707:b466 with SMTP id af79cd13be357-7d0eac3ef5emr994660285a.11.1748845064646;
        Sun, 01 Jun 2025 23:17:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCTsG7gNV2L9uzFU78EGu/HBkU6UsfPpuVFGPKTZpetTg4RTTOeadhiy1mD9FC/+Ns4ZATsQ==
X-Received: by 2002:a05:620a:1914:b0:7c9:6707:b466 with SMTP id af79cd13be357-7d0eac3ef5emr994658285a.11.1748845064325;
        Sun, 01 Jun 2025 23:17:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533791cde4sm1476155e87.192.2025.06.01.23.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 23:17:42 -0700 (PDT)
Date: Mon, 2 Jun 2025 09:17:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: fenglin.wu@oss.qualcomm.com
Cc: Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 3/8] power: supply: qcom_battmgr: Add resistance power
 supply property
Message-ID: <4jnxp3pnr4aqy6jaqxnh7ki3uhf7q3552jxs3ixd6imtqlmrei@snohn5bjyt5w>
References: <20250530-qcom_battmgr_update-v2-0-9e377193a656@oss.qualcomm.com>
 <20250530-qcom_battmgr_update-v2-3-9e377193a656@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530-qcom_battmgr_update-v2-3-9e377193a656@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RrDFLDmK c=1 sm=1 tr=0 ts=683d4209 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=zDes-GqUf9req-RX5QcA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 69-Z3-6VJerEWjA2_nRV_I18WqgThgEL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAyMDA1MiBTYWx0ZWRfX7PVVXr01Bp9m
 4IEsFg1lNoriQOC4CC5tELSkI9pwNLhZ1e5ZEPibcDJfS2Uw0I25ySEhp0KNjZLvKYu4ezFk7i8
 3Hx6mjA95y4TWaXfJ6Z31/BgmJ+Ynz/oDdarhcqHyPcFZNew7lF5ZyckgwKeUNJgrQDT2Lj3PDf
 jkyda6N94x0QomiAN6Kk3CaLCAeXm1A3G7qJsd4rmirN5R128i6PXcMtc4//mRpcc+XMldbL+Ty
 dR8Ov6Qj0vu8FKf/w9kpJcLa0uKAfdGMC+rEmF4rJ745d/9gyYyxZpEqP/8K0dvTEtfQ6sdZPe7
 BAav614CUtUV3tbBepZiYLH1GYqSC+3m0bEPMlXlpc/ZQWcbKmM0Ep3bRZm5lhQr8V17BSKzLC7
 wtMJY7jyvaR3UF1coByRmmO+P8rQT95KCImtZxvziSlohBEWHg14Ooe0bHtuaz8/j/tAU1PY
X-Proofpoint-GUID: 69-Z3-6VJerEWjA2_nRV_I18WqgThgEL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_02,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 mlxlogscore=880 impostorscore=0 bulkscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2506020052

On Fri, May 30, 2025 at 03:35:08PM +0800, Fenglin Wu via B4 Relay wrote:
> From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> 
> Add power supply property to get battery resistance from the battery
> management firmware.
> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
>  drivers/power/supply/qcom_battmgr.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

