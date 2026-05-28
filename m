Return-Path: <linux-arm-msm+bounces-110138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AArqM8JdGGrVjQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 17:22:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 733535F4529
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 17:22:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 204A1314BBAE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 15:12:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EC8B3F0A8A;
	Thu, 28 May 2026 15:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XvUJjWtB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cEJ3o7GK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C217A3FADFD
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 15:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779981060; cv=none; b=C2a7Skb8N1ZX+0Sx3Lmeb1ZQblLaq2grjeNWaXdGia5xx/wN6xap0zOwNZ370LX70ZNCmUmFoiICxXYnOoBxf2L2cUSP7rAL4a0a53llC1ZeZ4K2td6ADEK9IiIk9pQfdWEV5hOcOilJZsZFEz5QzcYkhfb2/cgVNeQHlCDOHm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779981060; c=relaxed/simple;
	bh=qB59GDxeOzfFEo2ABLadizqzu4u+BHGe5oO0iPJROwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SA182Tz71Xv8P8fzu01bG/g555+5VA7A6Ix2aehE94HnBmxz4dGM1vnMpO1iEUFS3jBPStFog6+IwU8jcs8fR1bJtLIcqYjP37MlQDfMbRYJG3BUixMDMV5kh8VD4if/qSOdZt2TZOu34V3ywuKgjf4Kj7MCo2RepJBvQztozN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XvUJjWtB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cEJ3o7GK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vRTf2793722
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 15:09:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MrTyGK6KcoIsnvoY5xT4plln
	nzDePsNnnJ9IKqp9/J4=; b=XvUJjWtBGXR2teUs2k8VcFJ+kfwqrRC+BgUhrPch
	qlLPIrze4ugRNe95tp/HEYFb+qHghNddhOqt0oglVJ6TIDjYJ44HXLrAqiZEIP9n
	l34t3jw6CNbsLJQETIWM3CDeM8h8RYTMu7FC6NLN1WqdyBMWfNnMy2Cj5SQ2e2bu
	PGLyzym8BE6DXQMDGMIvWR1RLRtcy6qt8wEPLSbMH/k5PjW30N9/GS9gC/aFb9E8
	AfKF9137LoFHb1/6GnNSKV9LESMVjhFsBnb4B94UmcmNu0OxZBSJ9l8OpFiqWn9m
	MnUuMNJuQYiERr/Lpa34OUOnkL+81Su+hEBVeIZV8X78Qg==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7y1u9v3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 15:09:37 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e65a0125c3so5705216a34.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 08:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779980977; x=1780585777; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MrTyGK6KcoIsnvoY5xT4pllnnzDePsNnnJ9IKqp9/J4=;
        b=cEJ3o7GKiYI0GBAMjL5TLjVITbovmvZbfcG8mvSngqnXNhBAds2Vp3U9GHaRCOu1lf
         84DUkXZH/9POoAbgMEUxRII7Qu0XRJqpZh8+GlLXAJk5PH7mLRmDCMBGnh7Llx3YMykx
         xhjIBGQXW1Ukgqmv8eWbrr4xtcpdMI+A1clxPewJzmPfplH3f5GPY888KLBkglQyXDcJ
         rvVtJtmJxZRcnQab5R6CpR5+H3qieFMDIjPCCBaxpxdcZOrdawyOn/g2BpYY7GpxepPq
         VUpLumr1TSQ3A1aQWCfc9lqFH0kYBKX+sA7vvTPZu9jGdxOMmvynTcMM2b8mTS8JMhgz
         qR8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779980977; x=1780585777;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MrTyGK6KcoIsnvoY5xT4pllnnzDePsNnnJ9IKqp9/J4=;
        b=HVAqlaYMDgfRzCqwKbYLqe15f1EMdLjy34eGHoEAsc7kXKzrGLApVdOAiWRxEDdnG6
         WDs0/NKIVGetnf4R4zBEak1g8dHZyrqYu6m45OV0fuGLlH5vh8MmieQcgfTNYUoM4H/l
         byEO1VYtvopcivE2SWIBZDDBejdbSWjeq+kY8dgtVF6NsYXiXfRabzHpd48b+e9tMPcx
         Xw/GDX2KsSKNXR8glmiB6//6MJcmWzFmqEMdOKJ10avaZUvvdmXTRXItp63r5XaQTO1V
         mEaBmDY03eovA9DR2EDFA6hUc3pbJ4EFOO4CDWU5pNfR97Dw0Kq+Jv1/6iA2S5GAs/WW
         UmFw==
X-Forwarded-Encrypted: i=1; AFNElJ/lFunK8YxecKww128U7aEPE6A1wmLLaxJtIZSDAs+vrB2ubi3WEAWQiP1QzmXEaOX5HLxqpzmHRsUv/Tir@vger.kernel.org
X-Gm-Message-State: AOJu0YxWhbQDANUKE2UpPDG/tfTq+rNkiTdhgA1CduRxwfFhx4nwgRE+
	ULhy75Z+nDIpW2AGz1D4be42f7q+HMXKWR+trNIpC4VFDWqgbh5eu32NBVkYl5zCZ9PHl4kfnws
	WqWBhDywQ7L/M0TdaufIAvpFo6Z8TKMDh4fBUNJR9V39h1wA6xwuDMGRzL6s+UuXCQiqpawg8g7
	j161M=
X-Gm-Gg: Acq92OFr6fkv43/jiOlBj8lLwGcM6NJ7P6Y3FS7PEDeoqqFnttazyRGfHk7+m4RMnFR
	jw8fJtnd889Bfrv+7mwPSvpXG86wo+1Av+0ak7QDDC27T8WLv4A9vYDqFlOWiAGebmXlbhjaBJM
	ZnO9XdaibsQaQ0i6Api7XUH3zHKCTf6UTGmYPZuVacMcj/CO/yfxR5kY4KEwuACtwZxes475sF8
	VUH4bEGQB9s8UI4ZwlpXzz+maW26sHGPeVHm4tNs2sl8L5R/2vZ1cOqbvWfvzEgmyS/G4y3ogGA
	QwpvKwPsIqygYjbud4PS1s9bLvUWHHO6msTQVf9vrZqfJM/21O01UoJsAfRzEyqan3AabXPSiRr
	lW/Zq7V4oDCcbeH6v3AQcQOU2LV15wYyG/hmZNrPi9+BTDxYil4sLJCVxBDMwg0VNUu7hHpNQpN
	20S7hKp62EiMYhsxxbhi4wWEmAj5A2PHdpkCjr1fYbUm09Iw==
X-Received: by 2002:a05:6820:8c6:b0:696:1cb2:20d6 with SMTP id 006d021491bc7-69d7ec6ef65mr13725852eaf.30.1779980976969;
        Thu, 28 May 2026 08:09:36 -0700 (PDT)
X-Received: by 2002:a05:6820:8c6:b0:696:1cb2:20d6 with SMTP id 006d021491bc7-69d7ec6ef65mr13725844eaf.30.1779980976487;
        Thu, 28 May 2026 08:09:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa46322390sm1983716e87.53.2026.05.28.08.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 08:09:35 -0700 (PDT)
Date: Thu, 28 May 2026 18:09:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jie Zhang <quic_jiezh@quicinc.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: talos: Fix GMU unit address
Message-ID: <yqsjjn4ubx2t6rinwuvsxyxs7f3r2nzsqgjhfgrggjwcsfthb4@2th5dv2ydmyp>
References: <20260528120342.46343-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528120342.46343-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=DsNmPm/+ c=1 sm=1 tr=0 ts=6a185ab1 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=rz0GGPVgkkwhC3TLr2YA:9 a=CjuIK1q_8ugA:10 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-ORIG-GUID: pAkphkabKNQJI7Hv5YgFqPW_Zzj6kGHT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDE1MyBTYWx0ZWRfX0mCVX/OLVKTt
 EPNgvIoXDAA3ScvogRAfo1BCOYCBJ1gefijiJn/uzEY/qE/PTIdnv6/a2cyAzO9nKDEDNxpFMpW
 cVHR402QD+/yTBt7u0LZ4hJKlvParEye5DgeKm5EcqffTv8+3Wtpc4atYzeifisey2Up67Bw/CS
 Rvygr3J9Ar9TCLFztIxYhXgOSTxyodF6SF+6Ze57pR6R9Mrku48M2MuIRHZhgXrOnS6h3zzdcy5
 DeAG5+h2GIg1r5EV/dxFEeqNqL8nojLKzrVWAMdqY1fyzb4a+2UryeopW8y+Uebo2JTxL21n0Og
 lbsQ8/Uf7RlJaj2MlrZaVnvppRPXmNe4N1wPccUlBjznSqzlBsI9J2I/TIZh3dFm2BSPJJEryQL
 5i0dVzifmh1t/gJka8atSuxks/teO31Lt+vt54cM3/zCfppeTiA7eG7AscMbSg389Xo7jqlcWmT
 8ddVZFxHGMcyipPyGxA==
X-Proofpoint-GUID: pAkphkabKNQJI7Hv5YgFqPW_Zzj6kGHT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605280153
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110138-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,0.0.0.0:email,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 733535F4529
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 28, 2026 at 02:03:43PM +0200, Krzysztof Kozlowski wrote:
> Correct unit address of GMU node to match 'reg' property and fix dtc W=1
> warnings like:
> 
>   talos.dtsi:2020.20-2055.5: Warning (simple_bus_reg): /soc@0/gmu@506a000: simple-bus unit address format error, expected "506d000"
> 
> Fixes: 8de397a5618a ("arm64: dts: qcom: talos: Add gpu and rgmu nodes")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/talos.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

