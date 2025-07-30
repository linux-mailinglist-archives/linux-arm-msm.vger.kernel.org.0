Return-Path: <linux-arm-msm+bounces-67143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5D3B1608A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 14:45:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B1753AC79E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 12:44:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B49732C85;
	Wed, 30 Jul 2025 12:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PGoJrr4z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68BA94207A
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 12:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753879524; cv=none; b=TBWnYjFweT+eXeGyLmG44JKVfjJFKem3f0Fes4sXIR99l/Yb3nGIh+qw+nP+aaRiWW3px40b+8DwcS6TE+4rinaLPS8lb+OQJZTnxuOFaQ6P4EeodndA0nSW7RwtHpap6ayFGPI/M3sZ7Qs24HAiGF5dnVoh1qq55QWWo5ftiCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753879524; c=relaxed/simple;
	bh=eR/zuSmJZH0jf1czY0eWikoB4WjQbyO+so5KHHNY4fc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GhdWeQE7T+/wFK8FXfB0sRdr4JeOZMMsH0F+E3c2UFdOI0TgojvHv1WAEJbEJfkjGVDOmcEO98UwqsSzi+K2NWOos6blGIF+fQfxTUQm+sfpIbb9+jhRd8xNQtaw+nvVutlQfEilcH7w/DDwblXqwNyMfMaYe0jLdE01mpyPJe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PGoJrr4z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56UCbbTS013037
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 12:45:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tGD7An+ORZOjh//giVMxSzmnuZTa775G5JSoHE0guvU=; b=PGoJrr4zHtCSTMPk
	m4+MGP3v7i8nvYY6l/IeF+O/VzXc/JOJkvDKxkB/WnwfCUMbbY+mQ/vtfeylc9+q
	GvDQMiv4Sl2WCjxQZSuOvTQQGE5nVD5AwxOTPBhakMxacyKtC+rGtNIqsEV8bLD4
	/6NEs+qZEnPJ9NbcgY6C5HtPpq1RzWlGRp/jCRVxDez8RGDUWKvmqHtiB03I2kQq
	Ac9owKDs8M8roGeVDkoI4YndtHPlFrFkLLqb14inLTFeN9RjNueWdOukdmpLof6V
	rc13k8IJO+/z4KUVlA+HGHma5Sus/CxAA/QH4HKno8Xkpj6zA5LTHNg+ASv7VzkV
	moBH/g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pbm3nh8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 12:45:22 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70737a93008so2861606d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 05:45:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753879521; x=1754484321;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tGD7An+ORZOjh//giVMxSzmnuZTa775G5JSoHE0guvU=;
        b=bFQAkG3l8B4VjPsq3o99jUEFds9+B9nub/A9S0fRtJ8tlWsWTH3iJth8oGimUWMsd6
         gGtW7nv18hkOBuGQaO6RylC1k7KnwtU8xaHgVkGRjn1buBMi9iyLMCBgUGJrGxvjLM/d
         YZfWMtBIW0w/cYqDBJx2OpfW5oTgsv587i4n6PRQ+YBZDILGpUHVn3tJrex9iBxfQd8J
         imWcvUCjVOXDQ1tWnNKX9m6QiBAn0xrNOXgK0/TAaPPXr8OlQRriFssuhg2VYeBPLEor
         W1e2tMRGmarPnEcG6mNtfTbIsBCXmKGYWqDWUS9KVN6SB1u/pXrTk2bRHL+xWC2pugcE
         Z0hQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDS4MoUm57UJXbHlYi6Z3S7IZQRDFNWJQrV9xmrfLlc8DX9I5bljWt/RDggCnolT4SDH8ueXUBqaGP1iRd@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhoy69pHjXeKNuQxdQjpymZk90ByZ3ZEfDzK1awyTySzPBck7s
	CRzSH9cqei3tG5LIpTZHsOAJVFZWs0jeRLMgBxGGA515BeHfleW1Po4bVDhx7ur9ULi53BJMG4Z
	jmUQtm9pRlWDTJP7/he88GPzus2XiFJ6WN6s0qwmTzFqc6JgEVAZSG+pwVsyMSfEsS6dq
X-Gm-Gg: ASbGncsTVPRv0xbRzQLAc3nrGKAV3n0XkpVastu2BUYV0Inbu7hOGSAWY3qptwwAZvz
	HdMSDSGHBnlnpGSurtW73BNmPM4NSK+CuusPsFly/vOmOUbFHKuq54TRhAxwsH/hFmojGwHxHd9
	+3leAU7G8zGJsbS86A6AIZiUR123/FDZ/3swJTdZlwp+WzScLIPprTkFy5QtXpcqxkSz634Jkdl
	ohJ/Ja4ZQ3Mh5LqYXfMzDatjXK0AZ7c2ZNdAn9yO+aGO8WQI/HS9MDCYOhZaaA6ZcADb1Dd4yFa
	pTQaAHOFDpAmq/5HeHD3Io0Cqo2Qk+34Zt6uqWBt67mrHUZkI5meECDEVUoYXHIk8+h58uAS0zz
	g1zXWO47LZ9MwiGIXYw==
X-Received: by 2002:a05:620a:c55:b0:7e3:3c02:4c10 with SMTP id af79cd13be357-7e66f340dbemr204406385a.10.1753879521320;
        Wed, 30 Jul 2025 05:45:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdISRDnj4LdKwJnA5RwUTBCM101PtZrNYA6In3rDGQz1QjGYTyHcrpf0LJ3CYc1iz1Xdis+g==
X-Received: by 2002:a05:620a:c55:b0:7e3:3c02:4c10 with SMTP id af79cd13be357-7e66f340dbemr204403685a.10.1753879520804;
        Wed, 30 Jul 2025 05:45:20 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af635a669c8sm733134866b.72.2025.07.30.05.45.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 05:45:20 -0700 (PDT)
Message-ID: <74e3836e-af29-4b5f-b644-23bdff084c78@oss.qualcomm.com>
Date: Wed, 30 Jul 2025 14:45:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: update the high bitfield of certain DSI
 registers
To: Ayushi Makhija <quic_amakhija@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Cc: robdclark@gmail.com, lumag@kernel.org, sean@poorly.run,
        marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_jesszhan@quicinc.com
References: <20250730123938.1038640-1-quic_amakhija@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250730123938.1038640-1-quic_amakhija@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LsaSymdc c=1 sm=1 tr=0 ts=688a13e2 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=e5mUnYsNAAAA:8 a=COk6AnOGAAAA:8
 a=GqOxEGSAyoRmTf9NYtcA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA5MSBTYWx0ZWRfX71zVkM5gyOUp
 we/uLmJdUyCrqzYNcE2UKN5y++vwxajZzbr8aBG5WVehsSJMy+On7upb6WKbNDwuAI5kDJ/HDQy
 I6iIlJUulSPPrcUiL03PO3INOjhJ2W9PRVc99prnpsnF2aEf1TstMQdYO7KHyX66EFYfCSU+YwB
 UgKuso8RyAfywJhjPRL/yrvPkcEBfisxT4qL+MzmWd+n6QgAG0NS5PKqN2pmOCPdZdb0/SddmHs
 gbdspmL94JjZaODywqAOe1+naOs6lIjfqTgLKpf7tRy0cdM9+ZQkYrcY5vGFS4+G8p+9CgZdVle
 PpNazsmsrXc1FSYReBy86OKweNHpg7aPsDyvaMyF708S1mvEriuWYmAG6VTBxGpsLm3yqE8cqHK
 zXDHOAmRRN6BtUXyCJQ9f4jxOtLb3glyrEKBlxFjBc238P71OUOB6Z88X+XajMgBrigafz+U
X-Proofpoint-ORIG-GUID: xvYNl9JghWNIT-OJja70bucZDpCYrVSd
X-Proofpoint-GUID: xvYNl9JghWNIT-OJja70bucZDpCYrVSd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_04,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=919 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507300091

On 7/30/25 2:39 PM, Ayushi Makhija wrote:
> Currently, the high bitfield of certain DSI registers
> do not align with the configuration of the SWI registers
> description. This can lead to wrong programming these DSI
> registers, for example for 4k resloution where H_TOTAL is
> taking 13 bits but software is programming only 12 bits
> because of the incorrect bitmask for H_TOTAL bitfeild,
> this is causing DSI FIFO errors. To resolve this issue,
> increase the high bitfield of the DSI registers from 12 bits
> to 16 bits in dsi.xml to match the SWI register configuration.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  drivers/gpu/drm/msm/registers/display/dsi.xml | 28 +++++++++----------
>  1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/registers/display/dsi.xml b/drivers/gpu/drm/msm/registers/display/dsi.xml
> index 501ffc585a9f..c7a7b633d747 100644
> --- a/drivers/gpu/drm/msm/registers/display/dsi.xml
> +++ b/drivers/gpu/drm/msm/registers/display/dsi.xml
> @@ -159,28 +159,28 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
>  		<bitfield name="RGB_SWAP" low="12" high="14" type="dsi_rgb_swap"/>
>  	</reg32>
>  	<reg32 offset="0x00020" name="ACTIVE_H">
> -		<bitfield name="START" low="0" high="11" type="uint"/>
> -		<bitfield name="END" low="16" high="27" type="uint"/>
> +		<bitfield name="START" low="0" high="15" type="uint"/>
> +		<bitfield name="END" low="16" high="31" type="uint"/>
>  	</reg32>
>  	<reg32 offset="0x00024" name="ACTIVE_V">
> -		<bitfield name="START" low="0" high="11" type="uint"/>
> -		<bitfield name="END" low="16" high="27" type="uint"/>
> +		<bitfield name="START" low="0" high="15" type="uint"/>
> +		<bitfield name="END" low="16" high="31" type="uint"/>
>  	</reg32>
>  	<reg32 offset="0x00028" name="TOTAL">
> -		<bitfield name="H_TOTAL" low="0" high="11" type="uint"/>
> -		<bitfield name="V_TOTAL" low="16" high="27" type="uint"/>
> +		<bitfield name="H_TOTAL" low="0" high="15" type="uint"/>
> +		<bitfield name="V_TOTAL" low="16" high="31" type="uint"/>
>  	</reg32>
>  	<reg32 offset="0x0002c" name="ACTIVE_HSYNC">
> -		<bitfield name="START" low="0" high="11" type="uint"/>
> -		<bitfield name="END" low="16" high="27" type="uint"/>
> +		<bitfield name="START" low="0" high="15" type="uint"/>
> +		<bitfield name="END" low="16" high="31" type="uint"/>
>  	</reg32>
>  	<reg32 offset="0x00030" name="ACTIVE_VSYNC_HPOS">
> -		<bitfield name="START" low="0" high="11" type="uint"/>
> -		<bitfield name="END" low="16" high="27" type="uint"/>
> +		<bitfield name="START" low="0" high="15" type="uint"/>
> +		<bitfield name="END" low="16" high="31" type="uint"/>
>  	</reg32>
>  	<reg32 offset="0x00034" name="ACTIVE_VSYNC_VPOS">

FWIW looks like at least on 8280, ACTIVE_VSYNC_HPOS offset = 0x38
and HPOS doesn't exist

Konrad

