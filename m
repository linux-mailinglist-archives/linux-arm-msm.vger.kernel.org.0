Return-Path: <linux-arm-msm+bounces-108077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EK7YNhImCmq6xAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 22:33:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B348563C82
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 22:33:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B3FE3011BF4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 20:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 015D930C171;
	Sun, 17 May 2026 20:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eTRwjI/2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LKZpQyDS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40CD2DB7AE
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 20:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779049999; cv=none; b=IUIQXZz2SiIBQp7ECnlcAsrUVEOfynbAkzXfHsAmF/ImRfq5hDZWdBwp1+X+e/NADcrWUS3aMe4XSB6Og6ktogo24yRdH1LF1Me4e8IeRidYzdbQXC+IM1fFrZza3Ba1kGl2Wibb5UTDLXYmWgIK40WFpnscQYcTy4PU/92Knjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779049999; c=relaxed/simple;
	bh=NCXa2smXI5Sk6lIyKm+GjATDEzuCyAQ8FuGq9LlCVG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EyPpjOr7fMXiFKrbQFy36rJOrOoow5GbDb8AB2jCHZ/meNSZDSKhi5VDik2EsivGurCNmOLpxg0HpHkX5inkhUQiEG2yC2Etofd6t0SYdh0B1HFQ6y5vq6szmLo9DpdVul6pj8+yntetIjACB+wWpyafGrxKYd5ADycUBrPZi+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eTRwjI/2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LKZpQyDS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H4UNjj784662
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 20:33:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=T4pw0unNszXyTG55BrENIc1k
	yB+AqFsyc5jFxzO2O/U=; b=eTRwjI/2QB2u02PQWbbjI0tZRMKyovUsgr3tn9B7
	zR8eX/fi+PSSlh8Eweow92510jtzBcwDoG0f/4fj2jOzb7Y+RiTDYmhMDDKRrKZh
	o/SEEejVKvknHIzO95DKcZphq+rOIrwdMF5XSJMACCrt6lFV1LO3rkoRPOoqUB8i
	erO25kwcdSPRJfSVJuajtfsERlqpVzMVybmwOhydv/CyFN1rlpTY8VT9dmgHi/cG
	23OBsAYtQ3bbGfl3lpHbGRCpC/b53JeCgxfPdID0jsq2GsyazYcDUjIkwvRT9OjD
	cllCxn4n55Ji+82OnK2IokwVAiZK+HMu2iSKyJuNapeyPg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6hbcbg70-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 20:33:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fbc49bef6so35349611cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 13:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779049997; x=1779654797; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T4pw0unNszXyTG55BrENIc1kyB+AqFsyc5jFxzO2O/U=;
        b=LKZpQyDSYcwnZTv53ULOi9hZ0eZ4tlPu7A8GVIsHSBdQrLLrhQAdy+N7lizC11EjqI
         FahTSk+fnkQj3JPxgMHklNPWeVi9s0GdTux+NRmDFhYrosyrjQlH+yqJ/ylQdrWjh4af
         7oJxLPzrDG7IQe2D+YcTq4Z3+Stc6mtuYNSSvuoCNiZA/GhTVEZkCzJbd/+7g0kOk5mQ
         /KDlz0HNLRPia90/QsgdYnb6eiEVBISO/fAJMzLY2rjUyyZ+KSrSvyl20sts4tqpJUSB
         /vc5q1VBUGDXkPY9a1VMggaFdag3LYyXJHpn8NdJ2DJv5Sg1L0uZD9c2KKazt+6X+OOb
         YCEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779049997; x=1779654797;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T4pw0unNszXyTG55BrENIc1kyB+AqFsyc5jFxzO2O/U=;
        b=HjimLsD+4FBkPTZv7U5a503zLrfxqP5pRLHVChcte4Bpd+6wURq/YibzQljRyY0+Hq
         hdzNhmNWCwiPgxciQ/1g8nS1lGNgscZzpGiKqv9jHwzY0Dx9VNXHwya7BQ8z3M8Tyc8X
         BjxfWclUz4i6OQ2q8mDsN1Xuwr37Qjb42VxXEU8qpXQw+7WcPgyJrlAd+KDMvFQK2CCM
         p9cddlE2hOXSXACW51YdZfX+Vs43CXvw8AL9k0ZbqcGL2CFfRTvhW7BNBiGs4rMgIM26
         nW/9M3jKTy9Umyxm0EtLlBpv/DPIvwYrpfyT1IHrEGeu/VJGt/ptJlQm0yuQmf+Dawlc
         7M+g==
X-Forwarded-Encrypted: i=1; AFNElJ/tp1FPASt2k+HrvSY4f204n2AIWJQp8wH2tJc462Vk9xkmjonNf6P1NflN5eWpXjbrAfky26uNvGLCPalq@vger.kernel.org
X-Gm-Message-State: AOJu0YxmOeSB4uXhJMOur953GAubXCLdyhapRBJ6qCk9i5wLAVVNWmQ7
	thczZJLmYEvFb3hUElXnKTsNLptQw0D6jpjlpZRbCvXUuD5L6p93ckq5prmrarhoV6+3Y1CFDpS
	udLgqCZuypVTARwINzruS7f77+VXwPq6lHUKs7WEY8I7I9rtiSJ4lq6IwnzVG7ZNEQOoG
X-Gm-Gg: Acq92OGUcB2prylAz9iC2C6gBDy26wVIM8+Sb+x4yupeevBeWg3Hly+I54LeUJ/jmXW
	z0JjqNH7MYuiJu//max2F4KsJJgTbC6hR96fbZtUdGinqovZQjwbShopnO+B/eXIsUcqFZ0O9q7
	4BXW5ltTSfKhdovM/CzZxP3iOlAcAcYK/xhj1ABXiswNsKGNFSjYYrNkssPlx0F04vJMCkF0jRS
	hlAE/EEu7ykpMj1WqD5YjnVQ0zujVRTGiX4Wcrr/K0b6xE85gmYGZ8965mdzZyOW/BAMPtnuGUY
	4L4IyG4VjCc5toC3IE6o1mS/dBF0jttQGsvuHzDF1u9nO+fqS6ejsq6OAi4QPfRWGPNsa4Lp1hO
	gcmFrPxPXTFHJdCY7lPBzRwF4wPm6MYeBMyHG7JQnpfSZ+PgLqcYdDRb9e+mRxyrpNX3SQFrhQm
	aXU+e8lM4ZmjTHurXm6JuBLIjwCSCC5AhVMgc=
X-Received: by 2002:a05:622a:1b90:b0:50d:efc1:841d with SMTP id d75a77b69052e-5165a0607b5mr186192391cf.23.1779049996954;
        Sun, 17 May 2026 13:33:16 -0700 (PDT)
X-Received: by 2002:a05:622a:1b90:b0:50d:efc1:841d with SMTP id d75a77b69052e-5165a0607b5mr186192171cf.23.1779049996582;
        Sun, 17 May 2026 13:33:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c89bsm2921695e87.13.2026.05.17.13.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 13:33:14 -0700 (PDT)
Date: Sun, 17 May 2026 23:33:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: azkali.limited@gmail.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] arm64: dts: qcom: sm8550: add labels for thermal
 zones
Message-ID: <5bxq3x4oodbzjw7nwlv7skg7v2gypna2mrm7h7ch2gx35b6dv7@m5kjlyldb7hy>
References: <20260517-pocketds-v3-0-d5910c801756@gmail.com>
 <20260517-pocketds-v3-2-d5910c801756@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517-pocketds-v3-2-d5910c801756@gmail.com>
X-Authority-Analysis: v=2.4 cv=cuSrVV4i c=1 sm=1 tr=0 ts=6a0a260d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pGLkceISAAAA:8
 a=jiQX-HWlOwuQXeZHxC8A:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDIyMiBTYWx0ZWRfX+INhtY02iqPK
 Zpq2OIIXX9YfH21Ff4u5JpOrOAgVNrd/OEjMuZywqG9qoHg5Xx2ngbxh9GtHy94e2Qhw3kd7oMt
 /6foabSd9685AwvJQSo5O1ttGJ1r43drjNIEH5Ri+jcsEnjDBKRbIpoHqoTzCfJ4zYeZMyiwXxi
 gMPXbjAzM/L4m6wxmuRKt5pO5Y34fhITBweUmTBawoHUMTc5GFq3TKwHJmTvfEF4AxDObALKN9F
 h3Dg2+PnyUv8vfQACtoLvPyEZZ7H8kiHUTbSvG6GvBxa9i34JKhPSr+R9QDFSCP2U234+m/fTO4
 2SvBSzP5R80oqR0OGhbgPqLVn7hNMVGlxCmptSMxZG7ifJ22rwgsMQh5tK2ZkMI5BtA/Wtwni/a
 +mUs3mRpWz+5jZsLJN99paYnqdtMyrO/TV86SNlP/su0YiG+WTfyS7AvxQp2w3PCxqfLh90QcdL
 6pE2e/CEMCpQYoqMTyw==
X-Proofpoint-GUID: KLBtyHVk1NsHmDkSVplkG5M6p-UxQCEt
X-Proofpoint-ORIG-GUID: KLBtyHVk1NsHmDkSVplkG5M6p-UxQCEt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_05,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605170222
X-Rspamd-Queue-Id: 3B348563C82
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108077-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Sun, May 17, 2026 at 08:14:21PM +0700, Alexandre Hamamdjian via B4 Relay wrote:
> From: Alexandre Hamamdjian <azkali.limited@gmail.com>
> 
> Add labels for the cpuss, cpu and gpuss thermal zones so board files
> can extend them with trip points and cooling maps through the &label
> override syntax, instead of redeclaring the zones by path.
> 
> Signed-off-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index 912525e9bca6..a9c678fc9cb2 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -5764,7 +5764,7 @@ reset-mon-config {
>  			};
>  		};
>  
> -		cpuss0-thermal {
> +		cpuss0_thermal: cpuss0-thermal {

thermal_cpuss0, so that all thermal nodes are grouped in .dts file.

>  			thermal-sensors = <&tsens0 1>;
>  
>  			trips {

-- 
With best wishes
Dmitry

