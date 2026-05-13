Return-Path: <linux-arm-msm+bounces-107405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qK8VJL+6BGplNQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 19:54:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA1E53865B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 19:54:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E8F033011359
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 17:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AA924DD6D5;
	Wed, 13 May 2026 17:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IBlM2wlM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PX/En1Kd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEC3349CE6
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 17:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778694836; cv=none; b=HmSQn/qFWdyyiakzPMg8E5GediE6Abv18KEqQRlKAHA6TvN5xOcp1jOyV8TCohI4jMPOvxssAk2Yxqhpbi5wChfYFM0UL5HYOY5HAlETwui4qcjVPnCbIS1suXBaTfjmU8ItAk9GwaV/nVjPoYsxYSEs70PMZRGySytF/cPSWEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778694836; c=relaxed/simple;
	bh=Jx9uvFmPRh4k6c6pHREQspkKkEE2qitXAOzyNLdTR9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kerqN6tk9jUzTshgoPPnSoSQU+3dVpxkxGgmyEOPzjqdFhd/xcrIx9Zz3HL88g8AZ5WrKFz+NBux74TbJkuFb2QA7jcIt4iogsuFF4rmZyGUFaKhEmwVMHKeOLflx0RVVMDnqf+Lg5DFXlB09KTwqd3/Od9VYCeRskNXQAj8Qc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IBlM2wlM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PX/En1Kd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DH0JXV2321422
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 17:53:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	amWzFW2AhltZZiBpdafVGSL8sTRgUnuUyXbxrb/TJ1c=; b=IBlM2wlMmqeFHzE2
	wOWomBDbwP7QrhCvlVkGxcI9aMBJLS5dDoXUAUC00axbhIBBeU6oOEyHJWA/kVY0
	FrZHO2ySgFs6qJBcYOLLd/+oKkcBb6oiMEAa7MsmhE7tE5XsFsg0rvujVPuK4zmB
	riOzJp+hD4PbmO4Kx4+wl00kLYv4tsdzH8VGmTzGWE/fgRrmvunji+kr6o7uc9d4
	K72iuduBvH+MCTPK5MeQhitzF42fS3xuqLWIwt8OFzt2S4kKpwYM7IJ3dd5pNljR
	rWJmEll7upmriXcTaPhJymm0GzIEi6yrNGXEY9nCiM4MX79mf4Uta1hTzFOkfbma
	xtKEJA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4hgub93u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 17:53:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-514ae0e3ad6so107430781cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 10:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778694831; x=1779299631; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=amWzFW2AhltZZiBpdafVGSL8sTRgUnuUyXbxrb/TJ1c=;
        b=PX/En1KdI+o72BLH/J+fTLjIb0AnSOdKf8HhBPxcpAXy45ZWmqz3vMiEwLtOFHccIj
         oXjp2KoEHqu8me2d+X/yI6TjQ61ASeMIK/+aEyZINmB2g+a3w1gEQfQrrsrflpI/iU7E
         uAyPt6mihHj+DkfBR0JbyMEvG7Z+01+g2EfJZKyWDjb3E2egD77xaXGaB5/HoulWjL9c
         MBTYkTtlunvWLYIW0ZVaIYLHXtIgnsd5OMCKKSkhg+kXTMtMXs1Hn3XnyCmO7aoS+v5p
         8BRyH8KkP8JgwFgT5DRZcgj3k3wEUi/PLeCQ0WK5csIa3o7lRaJjNf0WxVDf6OyFW1hc
         6Ghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778694831; x=1779299631;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=amWzFW2AhltZZiBpdafVGSL8sTRgUnuUyXbxrb/TJ1c=;
        b=El+tLNEoX7+y8f0iD1z8EA6NZgfvsfG6JskmtbBoGLd7jW0pUf8zfushN46jVtTXzZ
         bE1u7mFXcvrRzDfsiI98gcW2P3P657mlzmoTWxa61bkTVbMd9zBWRFOmqF/CNHDsmHCf
         cj3e69tinl3hGFpno2WNJneWOcTpNvbIlFat5TvAZoZ7cF38FQHGi05/5mWI7fdvK/zG
         qXcp4TQlu9YrXHOe6Hnb96IJLsX+Q7MOJiUZjQmhQIg2wPruzb8Baynqae1Rr2+MP3sP
         ES5a2dx6UKbTUBolWvQ5GnzmARbzRg8g0Yj1KV46qsiebGmpNsnk3NfJ6NYNeMSzjFUZ
         u5rQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Zk+azs/JqP/A+Z50y1fasXqXJClM7vz/oQQWlSAO9jDdhsmKo330IH83Dj67jT/dclz9j93uLI7OVHW9p@vger.kernel.org
X-Gm-Message-State: AOJu0YwcDx4e/tmoDj+fNaFviFyLiR+zfAt8ZnDbdsh6hqZB819CZ1wI
	+hHvCKerOs1/iIz7dKnzjKprtmdR4NbTDg1NPTerb0eSeswNa18M28Zv9CquMr9qgC/2GX/sCez
	5/n38YDoy2GRiizSVzqFJwGTNKS0ylnaGafdYMoCa53BSC/wkJvAoR9WrpPLWvelbl3Gg
X-Gm-Gg: Acq92OFriWlI94AqDybuUOFP4I1GsLYj9N1TD134m4+dPLuwbOFgBad0VeL407xrzfq
	ZhkQKry1SCzEDDtwfzIj9NpcR+kO4Yc5JvBmt5m282nMSqtwXbpqKOqj2INFhES8jbZkSu6go1W
	jUfoAU9f39BzZ/+dYViqndDdShpJWdcMVIRdNk5UmVq1GHkKQDhgpnc1Nxad4QMpjqxPe6VYo5M
	y2NfjGCqjYogevGUOBtrMq/6+HEzYtrUJ6A+bv0rewi0CwFmT9pi0eeqa2qdfhS/C7SFeWOp5vH
	4RmPK54WDiGyZD27E6o6ztx3aaE6M8lvRYa5coFmK91Khhl9Z43xbA4WyHkCFU9xnIPFeWtzjgC
	eqwED3b2ehd9fMeeQxIvYjCJDXLtrlFjpsPaBJtv2FgfhmCJxyJ5RWH/ygiys6TFEh/q9kdNSS5
	LTdBr2kNDu/YfL+j3OPqPUaGex8isEcMeBiy/nlNVRzy/Tjw==
X-Received: by 2002:a05:622a:215:b0:516:35fe:5524 with SMTP id d75a77b69052e-5164155bc78mr7504681cf.5.1778694830835;
        Wed, 13 May 2026 10:53:50 -0700 (PDT)
X-Received: by 2002:a05:622a:215:b0:516:35fe:5524 with SMTP id d75a77b69052e-5164155bc78mr7504061cf.5.1778694830374;
        Wed, 13 May 2026 10:53:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3945cae06b4sm109561fa.28.2026.05.13.10.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 10:53:49 -0700 (PDT)
Date: Wed, 13 May 2026 20:53:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: Re: [PATCH 6/8] arm64: dts: qcom: kaanapali: Add GPU cooling
Message-ID: <iun4ziuei3tzvr75qbbqgxytto6vptvtd7j5mr5ol5aqviaafz@5m4yxgnqjavc>
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
 <20260512-kaana-gpu-dt-v1-6-13e1c07c2050@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260512-kaana-gpu-dt-v1-6-13e1c07c2050@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=X4di7mTe c=1 sm=1 tr=0 ts=6a04baaf cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=U2egry7Pn7Pb3urGTtEA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 1fTQDd-HC8xvl-AfWplXcNqJDkRsGCAQ
X-Proofpoint-ORIG-GUID: 1fTQDd-HC8xvl-AfWplXcNqJDkRsGCAQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE3OSBTYWx0ZWRfX6oEVndcrvO97
 upaKiAeOIuJu3y9e/kXlQ2yLiu/OlIlPdah4d4Xw2K2UqPAiKGugiythy5FBhvdr/8/BJOs8DIA
 WP2HT81I/c4Atlzex06Qh8bT5LDuW+wlA8jviYZQx7Su1mrA3A0XM+71qfyBH1My1rY/HbZGEzs
 bQ5Xw6MAPGgCxzY7Q1pUohk/4qS6M+TWFnRz8PkcSIqzqsu5R/keU4bu82ElzYjdyFZgie1K5zK
 j0BLz2pG93USwSVFEiAMB1OwA0P3yFl3IyBztdaftNiyPNe6xv6sRCaH3L1qNZw8ZNamisYiEsv
 tyc4NRVqdbFZReHUwvU4pwL6QnFI4abPifC8sc0vrc1ZRvNYvRhLrPmDbhc+AIzvnHcm5PMHIff
 jSNV3ycWV6H0B0XvZ0pUWP+jxkiHRtReqWhIK53QLCOh/vwZmFfU9H731RBt2DB6YfC+MX0H87M
 DQ3rrHWKY2EC0o3DLew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130179
X-Rspamd-Queue-Id: 2BA1E53865B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107405-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,8bytes.org,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,linux.intel.com,suse.de,ffwll.ch,poorly.run,lists.infradead.org,lists.linux.dev,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 03:53:20AM +0530, Akhil P Oommen wrote:
> From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> 
> Unlike the CPU, the GPU does not throttle its speed automatically when it
> reaches high temperatures.
> 
> Set up GPU cooling by throttling the GPU speed
> when reaching 105°C.
> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 165 ++++++++++++++++++++++++++------
>  1 file changed, 135 insertions(+), 30 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> index c57aea44218e..5089416ec32c 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> @@ -26,6 +26,7 @@
>  #include <dt-bindings/soc/qcom,gpr.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>  #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
> +#include <dt-bindings/thermal/thermal.h>
>  
>  #include "kaanapali-ipcc.h"
>  
> @@ -7045,13 +7046,15 @@ nsphmx-3-critical {
>  		};
>  
>  		gpuss-0-thermal {
> +			polling-delay-passive = <200>;

Other DT files use 10 for GPU thermal zones polling interval.

> +
>  			thermal-sensors = <&tsens5 0>;
>  
>  			trips {
> -				gpuss-0-hot {
> -					temperature = <120000>;
> +				gpuss_0_alert0: gpuss-0-alert0 {
> +					temperature = <105000>;
>  					hysteresis = <5000>;
> -					type = "hot";
> +					type = "passive";
>  				};

Why don't we keep both passive and hot trip points?

>  
>  				gpuss-0-critical {
> 

-- 
With best wishes
Dmitry

