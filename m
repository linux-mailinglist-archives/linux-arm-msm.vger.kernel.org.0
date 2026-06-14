Return-Path: <linux-arm-msm+bounces-113061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id c9h7CQMhL2pT8AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 23:45:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 791C3682585
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 23:45:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=TviYmSh1;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EmJ01zw3;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113061-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113061-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 453A73008A6B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 21:45:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B647833C507;
	Sun, 14 Jun 2026 21:45:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F62333A6E9
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 21:45:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781473512; cv=none; b=ByUcjQ1uGl4/xbIL1BqkV5wNAuzNgWCpyFIXB/3NO9d8HC7CAPBwi4GPan3+ajRAzuOSeb4WW4NEJi3hXCb6aG5yXpAUgMCkTWAWaYaseTr+gACLf1OOFCs4rOMU2/BkTJCvzinQmIj32k1UUa810VS+Cs5S+J8ObeqwJPnBEtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781473512; c=relaxed/simple;
	bh=5dt+6MqXiKrj3D2CDAiUhVtJRZipaEavqbORD3dum7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SpN1wc8L/m1zn3xvGiy66S5WXA8dC72WB+uh5v63l1XqwmCSygJHug2w3QNd14IPYhrlFO2DCJljHAk1IevQ22SNlrLhmE4mWCob2F6G4vVgMr2N8OcBJ5ufDi7i5sZwaNUqWwcZjH1VavGZ3kKKdVZ7QHFqGh0pR0Vj29MBR8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TviYmSh1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EmJ01zw3; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ELFAxP2669431
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 21:45:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jn5ac4uChm1MWfrdldPnTXsvBVQiX9Jc69C3l224ZSA=; b=TviYmSh1hB4nHkzu
	6HGrSrTw/5Cfb8hAQkDnRn7DIHYSeqV9eMC+GQjyEZG8DDuD5lDi6l2sRrOG/QiD
	1OVxpZZ65xuXYmGAWH7vR8jq+1pMpFAQ8Q0W8fAHc4NPypJXrLWO5CHRjgYXvDu0
	FkIV5aWEWgz7zCbkx7UMQ2f1LdL8SxaUhbREX/yP4iUtYEsGJKvD6me94CrUInBX
	xfS4lYC34Gs466eFGP9QDRigasgfG6qyk6cNVWFqHoIXtUJy0tA9rdLU1ux4CoXX
	VPdC+n4vo4ElyBGOUqPCasBpsHZGeZwcR9SyGYHvX0ivv3FNTYQGWrfXz2rTaJ7U
	bXrRJw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery7u4kd3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 21:45:09 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8cce1c3c26bso89497576d6.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 14:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781473509; x=1782078309; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jn5ac4uChm1MWfrdldPnTXsvBVQiX9Jc69C3l224ZSA=;
        b=EmJ01zw3O1E6eOYjdAMhWVQgd+yXThzDbCaUHtaSeyuwJaFdIxXK5b9n6hs0Fyz9yl
         F087AQ782d4GITOF5KnyyXCOo6nzKYKf1hVjZsGCwLjgsKC6hTK43yiuoW/ITQEtVZEi
         EehHCKowRX6BCoO2e7hPxQpk+pUbIvu5UH5IGN3qQlK1tZzSC7gwi/QoKORo+RVdKLVN
         Fql99orTVexTA+ef1LLGbs822CcrdaTiHTE9BfvhVJvfw55BtdtPDpHyqbzCCvMSo8lu
         5SidSsmyLzdt51g+Ra08iw7EFz1ZPhzkn+Ouhal+ClP0sVMio773Fd0xl/ZL/zma6GMg
         Rfpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781473509; x=1782078309;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jn5ac4uChm1MWfrdldPnTXsvBVQiX9Jc69C3l224ZSA=;
        b=WxnsJjuMGUpVdScWHpKvCAChtQlmPnZFarM/JX283bHoZf5QnK5Qk8WzLtyoguTA1p
         j1875TbiuJ0jjuknYWVL8Y6yVb2x+WrI1Yci19CS+UAKLSgI6AG5woZTzGsKAhJ+vKwx
         Ou7HmACBZQ83NoZitkoqC3Jjc58BJyeG/5amiRHd8KjouwTOwn/7o5gNsK6MCQ8GTU1r
         JQLEIv3L0hGeDlCUbuQoIUi8WCcgZKxmvkQrWweGGqN6NBTvNNdJDNDPLg+jxF3aEKn6
         q3gxTTySfSRjjTGNjIT2ZXz8VPkEL4tqvy4iJHntctzDNc9ZVPGl7QFH63vDhakk8oL6
         W8HQ==
X-Forwarded-Encrypted: i=1; AFNElJ99UaPG4Cw4snI9cFssB+V9CiU/93HvXlMHas66zjiiBaRaGSAkt8ax60jSXuJy/S40CnjBKyYNfEJDHO7t@vger.kernel.org
X-Gm-Message-State: AOJu0YzBur2tuDbl2LCF4IHQYQHhkET7liaq7Nz8CMq1YWN5cwgTVjRc
	K1qw9MEsCcrIx36UwRZ4+tCfZ40U1v+9s09zGpzEK+y9kMrzZwHMJyn2LSun4uPYqxv2FM27ubY
	G5+a5/HXKuQeoAeCiX1wlqPHMwuNL7cEwWgEAOys5apKTdOwOloYXX7RvXlchzLajsaKO
X-Gm-Gg: Acq92OGSij21TFJaStOrULXb0C/Jpp/ELDV87Zl2RDEBYS+BbOXJCAd5bT7tpNMozAc
	Hd48rbtLzcon+X/cIKpzYzllsXKI1rsZPomgZJ8qBF0P+UEEisrS2JZ3KxLu7h5jJDm3xnaXioo
	9vVID8F0LKr1IaQDAQ0j+7rcWcY8Zz4FDvou3H7V244q49GIujrCE1+/3IOMerGu4mgB0kBoEhU
	tUttWUJX+4rOswxRGsXcVuRCK67GWW7811EqoOGETL7uSDYtXrG3zUC0ynDMxHP+Q9FFykHUxxy
	n7AiXBz8KTQ5WVuRhYwaL21bR4ivbnD4hYa6gZXpFWkCAdxSObeTGXFYCGYmpL9wsGa/PrvS3UJ
	SceID9Z8RsmHloZ70P8FwlCopJSrwlpYx+j9OUpyxCGfQHX5epIIQgUZwLP661FVqazHL49MSed
	NtrGD0QSxKK8nilCzTCX+/yqYwbMCDJgdpr8s=
X-Received: by 2002:a05:620a:2888:b0:90e:6dd4:5d6d with SMTP id af79cd13be357-917efcb1645mr1373576885a.10.1781473508986;
        Sun, 14 Jun 2026 14:45:08 -0700 (PDT)
X-Received: by 2002:a05:620a:2888:b0:90e:6dd4:5d6d with SMTP id af79cd13be357-917efcb1645mr1373571185a.10.1781473508410;
        Sun, 14 Jun 2026 14:45:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-399313e9385sm17503081fa.7.2026.06.14.14.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 14:45:05 -0700 (PDT)
Date: Mon, 15 Jun 2026 00:45:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add PMIC thermal support for
 Shikra CQ2390M SoM platform
Message-ID: <ry5y452gxtnjdzux32saufyvolrkvudlaldmwxdvkcqgrkmaxn@53ikkvwsazkw>
References: <20260613-shikra_adc_support-v1-0-57d5e6c7f47d@oss.qualcomm.com>
 <20260613-shikra_adc_support-v1-3-57d5e6c7f47d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260613-shikra_adc_support-v1-3-57d5e6c7f47d@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=F8BnsKhN c=1 sm=1 tr=0 ts=6a2f20e5 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=W1BDsSXQsNOK9CrRnycA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: MWsOmoARJbXm1SrRw7mRY9htN-6gEUTV
X-Proofpoint-ORIG-GUID: MWsOmoARJbXm1SrRw7mRY9htN-6gEUTV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE0MDIzMSBTYWx0ZWRfXw57ixMcHklkM
 Qvam35Tm+fF0Ps9kUu9qKP95hNq+MvMJhM9s1HbsYVavH4BjGPuhu1QKP/Hldo10BVSQYhr1+9y
 FcOQ71Y6of9wWFZbZjx/zu00PMKhoQaU3tcCRgFSqi55GPqPKdFMBsql3hALKeBe9UUXFJ5CaJT
 DCrx05sCxqX3+Oz5YSsS5wT0sViYxgq4gUCsIVn5rdliuh6C/HcQT0/tyF3I+8LOZDCyQeVhvJ3
 1M7WOKWFte3dt+37fuR2sQPdyxZ148e/Cgz4zUMtC68Pyo06ESRiy2ReKwx97UJSy4KrfY87pN8
 3uaSBB2VIgmKXRXBjk+KOjh2AhbW01+R4GkFQeT4ae+b76oq8rv7vXRDlCODdV0Or9/1LMv727d
 JP5+gIcRiGIYh/U2Lg7SWNUAvqTrmI3lhP24VHY6hzFtA91cDqjuXy3RATrpqTFWV8ZXxDd3Ikk
 cX64GoDLn3ci7O4YMcQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE0MDIzMSBTYWx0ZWRfXwRwvvlBBTRV+
 O7s7fLrrZNFYqZXe2AdfmmKFnb/nPR5MSIZxWbBsR/95VHv7AVzGv1YBJjlNgxDC4bbCoWKOqrw
 78B6lGUXYRow2djbJgv985QyacwKqq8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-14_05,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606140231
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113061-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jishnu.prakash@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:rakesh.kota@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 791C3682585

On Sat, Jun 13, 2026 at 01:39:23PM +0530, Jishnu Prakash wrote:
> Add ADC channels for system thermistors, used for thermal mitigation.
> Add ADC thermal bridge nodes for pa/quiet/msm thermistors. Enable temperature
> alarm nodes for PM4125 and PM8005. Add thermal zones for temp-alarm devices
> and system thermistors exposed as thermal bridge nodes.
> 
> Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 184 +++++++++++++++++++++++++++
>  1 file changed, 184 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> index dc3861489f64..c6c09d773abe 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/iio/qcom,spmi-vadc.h>
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  
>  #include "shikra.dtsi"
> @@ -27,9 +28,184 @@ key-volume-up {
>  			linux,can-disable;
>  		};
>  	};
> +
> +	pm4125_msm_therm_bridge: pm4125-msm-therm-bridge {

Generic node names, please. See, how other platforms name them.

> +		compatible = "generic-adc-thermal";
> +		io-channels = <&pm4125_adc ADC5_AMUX_THM3_100K_PU>;
> +		io-channel-names = "sensor-channel";
> +		#thermal-sensor-cells = <0>;
> +	};
> +
> +	pm4125_pa_therm_bridge: pm4125-pa-therm-bridge {
> +		compatible = "generic-adc-thermal";
> +		io-channels = <&pm4125_adc ADC5_AMUX_THM1_100K_PU>;
> +		io-channel-names = "sensor-channel";
> +		#thermal-sensor-cells = <0>;
> +	};
> +
> +	pm4125_quiet_therm_bridge: pm4125-quiet-therm-bridge {
> +		compatible = "generic-adc-thermal";
> +		io-channels = <&pm4125_adc ADC5_AMUX_THM2_100K_PU>;
> +		io-channel-names = "sensor-channel";
> +		#thermal-sensor-cells = <0>;
> +	};
> +
> +	thermal-zones {
> +		pm4125-thermal {
> +			polling-delay-passive = <100>;
> +			polling-delay = <0>;
> +			thermal-sensors = <&pm4125_tz>;

This should be a part of the pm4125.dtsi

> +
> +			trips {
> +				pm4125_trip0: trip0 {
> +					temperature = <105000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				pm4125_trip1: trip1 {
> +					temperature = <125000>;
> +					hysteresis = <0>;
> +					type = "hot";
> +				};
> +
> +				pm4125_trip2: trip2 {
> +					temperature = <155000>;
> +					hysteresis = <0>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		pm8005-thermal {
> +			polling-delay-passive = <0>;
> +			polling-delay = <0>;
> +			thermal-sensors = <&pm8005_tz>;

pm8005.dtsi

> +
> +			trips {
> +				pm8005_trip0: trip0 {
> +					temperature = <105000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				pm8005_trip1: trip1 {
> +					temperature = <125000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				pm8005_trip2: trip2 {
> +					temperature = <145000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +			};
> +		};
> +
> +		sys-1-thermal {
> +			polling-delay-passive = <2000>;
> +			polling-delay = <0>;
> +			thermal-sensors = <&pm4125_pa_therm_bridge>;
> +
> +			trips {
> +				active-config0 {
> +					temperature = <125000>;
> +					hysteresis = <1000>;
> +					type = "passive";

Passive cooling at 125°C sounds very strange. Especially without any
cooling device attached.

> +				};
> +			};
> +		};
> +
> +		sys-2-thermal {
> +			polling-delay-passive = <2000>;
> +			polling-delay = <0>;
> +			thermal-sensors = <&pm4125_quiet_therm_bridge>;
> +
> +			trips {
> +				active-config0 {
> +					temperature = <125000>;
> +					hysteresis = <1000>;
> +					type = "passive";
> +				};
> +			};
> +		};
> +
> +		sys-3-thermal {
> +			polling-delay-passive = <2000>;
> +			polling-delay = <0>;
> +			thermal-sensors = <&pm4125_msm_therm_bridge>;
> +
> +			trips {
> +				active-config0 {
> +					temperature = <125000>;
> +					hysteresis = <1000>;
> +					type = "passive";
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&pm4125_adc {
> +	pinctrl-0 = <&pm4125_adc_gpio5_default>, <&pm4125_adc_gpio6_default>;
> +	pinctrl-names = "default";
> +	status = "okay";

Empty line before status.

> +
> +	channel@4d {
> +		reg = <ADC5_AMUX_THM1_100K_PU>;
> +		label = "pa_therm";
> +		qcom,ratiometric;
> +		qcom,hw-settle-time = <200>;
> +		qcom,pre-scaling = <1 1>;
> +	};
> +
> +	channel@4e {
> +		reg = <ADC5_AMUX_THM2_100K_PU>;
> +		label = "quiet_therm";
> +		qcom,ratiometric;
> +		qcom,hw-settle-time = <200>;
> +		qcom,pre-scaling = <1 1>;
> +	};
> +
> +	channel@4f {
> +		reg = <ADC5_AMUX_THM3_100K_PU>;
> +		label = "msm_therm";
> +		qcom,ratiometric;
> +		qcom,hw-settle-time = <200>;
> +		qcom,pre-scaling = <1 1>;
> +	};
> +
> +	channel@54 {
> +		reg = <ADC5_GPIO3_100K_PU>;
> +		label = "chgr_skin";
> +		qcom,ratiometric;
> +		qcom,hw-settle-time = <200>;
> +		qcom,pre-scaling = <1 1>;
> +	};
> +
> +	channel@55 {
> +		reg = <ADC5_GPIO4_100K_PU>;
> +		label = "gnss_therm";
> +		qcom,ratiometric;
> +		qcom,hw-settle-time = <200>;
> +		qcom,pre-scaling = <1 1>;
> +	};
>  };
>  
>  &pm4125_gpios {
> +	pm4125_adc_gpio5_default: pm4125-adc-gpio5-state {
> +		pins = "gpio5";
> +		function = PMIC_GPIO_FUNC_NORMAL;
> +		bias-high-impedance;
> +	};
> +
> +	pm4125_adc_gpio6_default: pm4125-adc-gpio6-state {
> +		pins = "gpio6";
> +		function = PMIC_GPIO_FUNC_NORMAL;
> +		bias-high-impedance;
> +	};
> +
>  	vol_up_n: vol-up-n-state {
>  		pins = "gpio9";
>  		function = PMIC_GPIO_FUNC_NORMAL;
> @@ -45,10 +221,18 @@ &pm4125_resin {
>  	status = "okay";
>  };
>  
> +&pm4125_tz {
> +	status = "okay";
> +};
> +
>  &pm8005_regulators {
>  	status = "disabled";
>  };
>  
> +&pm8005_tz {
> +	status = "okay";
> +};
> +
>  &rpm_requests {
>  	regulators {
>  		compatible = "qcom,rpm-pm2250-regulators";
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

