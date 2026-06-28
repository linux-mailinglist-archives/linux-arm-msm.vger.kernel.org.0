Return-Path: <linux-arm-msm+bounces-114767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id L1dHFeMTQWo1kwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 14:30:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFEE6D3CBE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 14:30:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pWpOcBkA;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HJLdel1d;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114767-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114767-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9C0363006507
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 12:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 164082E888C;
	Sun, 28 Jun 2026 12:30:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36ED35292A
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 12:30:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782649824; cv=none; b=k20RBm1/BxL7Hg4jb6Wu1nTEUgMNAgsHJy8boztYZuoU+u72KFSwi8L0yLzhSkwTQLZj0F+0tozXHGFvNJNljga2BGRqu3PZm9T8r2lh6I+vJg6VmwwuYwDuOO/hc8BaBlE7JXNxc+Wr0CcPnnEHQPfyl6x9IEGw9B8e6fBolTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782649824; c=relaxed/simple;
	bh=nlQrCj00riR0EPax6kUc4wuqh/N0BisTiryWssEftqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ViDEuToHj39bqLMhnXnFIci7g78IA4dYUETvBOeHFbU+gI+zcKuVu8QXEzMC3exHyD5Xyld++tMwgs4a5IXjrAMmDa+kWKWa9e02GtN80NYOPuNuTotA7NEzwYwImjTDvuj4rhoQo3vakOynoQcdr2EFA1y5VrLgspzThbJQzHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pWpOcBkA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HJLdel1d; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65S9P2sX3625519
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 12:30:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZdYiLkF2UfqveInvwKAoPFcw
	SaJB+1umchG3KdW84vw=; b=pWpOcBkAPFVxgfT+AgYO4LoVSsVd7GXPYKV0YsQZ
	NMje/+2YEFmMLL31x4VlzSEm83Mwiei4ycumrmqoAWGcoJl2+0jI+/Ypb8axngFo
	OOx3gj2xyNr5fYJwUIBkJiHchHHAFtwtW1WmslWR+g7a7VXAc3HLC8XTyCTM5oR3
	yJG5VQyw2AgaOBR0cnJJVv+VyUrKu7Y0oejiGzwgA8qkTAu4ONzyD3FdegIpLVnX
	zcRIa+EWzY7aXLOrKwYdXkXtVArN4rwNabGPPh6fQMT5kDB8sSUUDvmmzvMqgBUu
	DeSyMIEnP2/TuKEKSDRJXeFV9pTIm84hLde3bRvH1BfxgQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26tujus9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 12:30:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92ae405b5eeso280746185a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 05:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782649821; x=1783254621; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZdYiLkF2UfqveInvwKAoPFcwSaJB+1umchG3KdW84vw=;
        b=HJLdel1dj0+9BRnGH9iq6WZp92Sj7e22HMNdz/MnM4jQhvFDHxbKiB73gv/qGBogyP
         p+ci9FhpfwtrFGXKpTVpT3ZAmwHMiudIZXJAWdaZXdey/q1+PfbbceAUOvTaczEQuTfV
         kLNsU4dNhdPKOcl14L7wTmDABZlR5mKCbJjn1u0qz9yO6GIC+YKG8yRYNU0WPueZlx3a
         n6kV3RXNrHmhIpI0Y8Q8d46MbCUC/lepJ5ok7C3XhwtJia1t2PWQOtu0tJ8RLfA4VyK0
         5r86vkVMzfOWnz1Bugcze7VmPueJ6MGfjAP31gRiAM1RSOK8C1d1zjbT23bVQxfbDXNg
         gDlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782649821; x=1783254621;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZdYiLkF2UfqveInvwKAoPFcwSaJB+1umchG3KdW84vw=;
        b=T/dQkokG+x+cO2sXrX9Ltl77qu6unFEVqDXPnuF2UDPAeaozQtBTfu+h8vT9vFawAf
         IQYcx0tQ4fOBaS8SdxGC5AC2rDRQT2YkJGQc+u0OfHDKcjoX1xa72cDDrC/MRe8SpNsk
         Ipr4ogpCvPGflMtFKu+rp/Q5PnnMMZLX6TBEbunvrv3D4oSvkrjIaE/uuEVF2u3uwRvB
         jp3YiZoZu2pO1donh+LwNymdrbIQAw8PxLUeGni3i51JJviB1HQWR1Bd8R3hDMz0PZs/
         RlnPIpYxqvtsZW7M4Rqh/Y5DY1A/fr5Dw0pm7BqLFsVv3cQ6xJb76+BFQmMFy3rUOJGT
         SEXA==
X-Forwarded-Encrypted: i=1; AFNElJ/Nbe5qhz5LXC1kD+kexggaM5BZdfyzcDYJ1dZXVTAlJRwDwXZzeDWGenW2wm1KlfA/PXyz2KxfJSmJbULq@vger.kernel.org
X-Gm-Message-State: AOJu0YxhmrIBIWbHZh878Jhu7OYXghcG6TWWc83/sTNmjeyw70cmCEbE
	BHqHsULfcHRzhOJ70IlR//xcR1yxG14nEN814UGA6zKA4SAC6eYnW3cgteYoO179NXXMdHhZOep
	ZJx/4Dx1jVaJHIYc2Cnuh/c6XYrke6mUL/eYJycW7GkO5lzzBx06G3wBj6+QyBiyQG7FR
X-Gm-Gg: AfdE7clojhq7zB8wYp8yhUseN9mUk1qYrvOMCr2mUbWaWfYh031TK7FdVEY6nQy6bj1
	Q+JP/oaO+Y2CROWasDJ0i53y10XE+EZpexDH1oAM4JAbSFRGDAzdsELObwOLuqK+BaSJVcsNxRr
	A56OBsVF6yzG2kHwASwXufOZFABrNQYxW9Vi1CV2B/2lJgHSRb9sC/pHN46ltv5hos+KQ5QOZ0g
	cMSCckKV+cKZvzGv5UjuM2/Pw618/8arLN/AqC4ABbahdXSr0AurkWV6q9kaIrYCHKmF1yfgj+o
	aHEdTFlrn4dK1qDOjXrH3IVxSS43zwbltpTnZZKgiPr67mlLVHQDVCb+IdQLPbxJ5PtS4XoHyeK
	w4iarq82QK0xfapG9Ry+g69ncwwXFJ28OUZR9x/+eSggDqqAyQZCNqg1RxpH3oKygO/162wUmXV
	x95CRO26YR5TKxYPotDdjDREEk
X-Received: by 2002:a05:620a:488c:b0:916:10f6:77c3 with SMTP id af79cd13be357-9293d4b30eemr1983089885a.28.1782649820839;
        Sun, 28 Jun 2026 05:30:20 -0700 (PDT)
X-Received: by 2002:a05:620a:488c:b0:916:10f6:77c3 with SMTP id af79cd13be357-9293d4b30eemr1983076685a.28.1782649819895;
        Sun, 28 Jun 2026 05:30:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aea0de7d3esm3022094e87.30.2026.06.28.05.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 05:30:18 -0700 (PDT)
Date: Sun, 28 Jun 2026 15:30:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        arpit.saini@oss.qualcomm.com, mohit.dsor@oss.qualcomm.com
Subject: Re: [PATCH 2/5] arm64: dts: qcom: shikra-cqm-evk: Enable display and
 add ili7807s panel
Message-ID: <ypic3vctnnci7mkv4bg62n5xsgzpd4e3mam5kt2nvt7dxzyim4@zdzpup6uydtl>
References: <20260627-shikra-dt-changes-v1-0-449a402673d0@oss.qualcomm.com>
 <20260627-shikra-dt-changes-v1-2-449a402673d0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260627-shikra-dt-changes-v1-2-449a402673d0@oss.qualcomm.com>
X-Proofpoint-GUID: fTXgfjKPKcbvJCee_UM79IrnoQ-Hrw1g
X-Authority-Analysis: v=2.4 cv=A8Rc+aWG c=1 sm=1 tr=0 ts=6a4113de cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=Jsedhb4udUXVVV5JfpgA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: fTXgfjKPKcbvJCee_UM79IrnoQ-Hrw1g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDEwOSBTYWx0ZWRfXwjTWZsBjjyld
 HSB2SUW8SX2A7ZAmzoBYfYzJt68GgwyAc+BWvUFkiTKFZtJyHd4XO/lcGpbgnIPKTmkU0N9dUkm
 xnHjH/krfdJqiJgiqtehrVOpvNyDVVsr52EiRmOq2+zDLJmzpCvY9nXpVSbHZP+2mSpkNzwSilT
 GeXR5yirBwsJixTd0Uclh6E7oBC6vgDmizZE9MwIhhDAmYd2i1JqmvHL4FcLRZkr3VpXPafObAD
 qgw8uD4CtB8Yywhkdh8sla7ro/QFlcAbTIhXweizinQTWU27vwerVUmgrTHZ5ZMzvNocZR8EZ5B
 8vF69idZTsdgZ8gpGdnGKKVPSkGDvLEFqNOsQNvIGtJFNMj5UFBMhzqGLhDv22o9xBnVKMsRZL3
 HTloMI3MN5jBKnjJB/2Pj20nlHUxBBz+foyVHoPZruL34suhZJPaT5DiwZ+EHYGHoYrJHsyX9SU
 WdLggB4GRJors28dyjg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDEwOSBTYWx0ZWRfX9P22przjoiTo
 o2Gc6fv+CBeD3Ez7dz4bPjyBKmAnx/fdgCFIA0aCnQe/ydGR3SKrLYYF9QIa/mqat3rZSDqSKDy
 ma+WO7ws6acDMHBfJwZp/7tQJqb2cDY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280109
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114767-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS(0.00)[m:nabige.aala@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:arpit.saini@oss.qualcomm.com,m:mohit.dsor@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AFFEE6D3CBE

On Sat, Jun 27, 2026 at 03:31:36PM +0530, Nabige Aala wrote:
> From: Arpit Saini <arpit.saini@oss.qualcomm.com>
> 
> Enable the Shikra MDSS display subsystem on the Shikra CQM EVK
> board and add the DLC0697 MIPI DSI display panel node.
> Pin pm4125_l5 to 1.232V with regulator-allow-set-load
> for DSI PHY PLL stability.
> 
> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 104 ++++++++++++++++++++++++++++
>  1 file changed, 104 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> index 683b5245923b..c9ea093cd8ca 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> @@ -23,6 +23,18 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	lcd_bias: regulator-lcd-bias {
> +		compatible = "regulator-fixed";
> +		regulator-name = "lcd_bias";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&pm4125_l17>;
> +		gpio = <&tlmm 151 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		pinctrl-0 = <&lcd_bias_en>;
> +		pinctrl-names = "default";
> +	};
> +
>  	wcn3988-pmu {
>  		compatible = "qcom,wcn3988-pmu";
>  
> @@ -60,6 +72,52 @@ vreg_pmu_ch1: ldo4 {
>  	};
>  };
>  
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_dsi0 {
> +	vdda-supply = <&pm4125_l5>;
> +	status = "okay";

Empty lines before the status property, please.

> +
> +	panel@0 {
> +		compatible = "dlc,dlc0697", "ilitek,ili7807s";
> +		reg = <0>;
> +
> +		reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
> +
> +		vddi-supply = <&pm4125_l15>;
> +		avdd-supply = <&lcd_bias>;
> +		avee-supply = <&lcd_bias>;

AVEE is typically the negative / ground supply. How can it be supplied
by the same regulator as AVDD?

> +
> +		pinctrl-0 = <&panel_bl_en &panel_rst_n &panel_te_pin>;
> +		pinctrl-1 = <&panel_bl_en_suspend &panel_rst_n_suspend>;
> +		pinctrl-names = "default", "sleep";
> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&mdss_dsi0_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&mdss_dsi0_out {
> +	remote-endpoint = <&panel_in>;
> +	data-lanes = <0 1 2 3>;
> +};
> +
> +&mdss_dsi0_phy {
> +	status = "okay";
> +};
> +
> +&pm4125_l5 {
> +	/* DSI VDDA - must be at NOM voltage for PHY PLL lock */
> +	regulator-min-microvolt = <1232000>;
> +	regulator-max-microvolt = <1232000>;
> +	regulator-allow-set-load;
> +};
> +
>  &remoteproc_cdsp {
>  	firmware-name = "qcom/shikra/cdsp.mbn";
>  
> @@ -116,3 +174,49 @@ &wifi {
>  
>  	status = "okay";
>  };
> +
> +&tlmm {
> +	lcd_bias_en: lcd-bias-en-state {
> +		pins = "gpio151";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	panel_bl_en: panel-bl-en-state {
> +		pins = "gpio91";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-high;

I think, recent recommendation is to sort these entries by the pin
number.

> +	};
> +
> +	panel_bl_en_suspend: panel-bl-en-suspend-state {
> +		pins = "gpio91";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +		output-low;
> +	};
> +
> +	panel_rst_n: panel-rst-n-state {
> +		pins = "gpio3";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-disable;
> +	};
> +
> +	panel_rst_n_suspend: panel-rst-n-suspend-state {
> +		pins = "gpio3";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
> +	panel_te_pin: panel-te-pin-state {
> +		pins = "gpio86";
> +		function = "mdp_vsync_p";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +};
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

