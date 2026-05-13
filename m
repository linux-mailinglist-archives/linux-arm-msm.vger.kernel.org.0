Return-Path: <linux-arm-msm+bounces-107410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFYKOsG8BGrrNQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 20:02:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E7692538823
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 20:02:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F29A130055CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 17:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A22641C310;
	Wed, 13 May 2026 17:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BSiYKVO2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KBSn9CKF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E520A4D2EF5
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 17:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778695136; cv=none; b=Vfony3sncYKakerU8luR1/JRGKBCDgPb4Bmvb8yYRz9KTyDZrwmlIY6damWEYx6ofnLiXiKJfMQSPp3kcR5BPe/IsSw3xGWgDrTsFIV5OhnRyVrlQ3BQ1mhjKHEDZlBAVO7S0OXRgURhMs7U7UNBsRI/Ut3q8hU2414usPrS3Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778695136; c=relaxed/simple;
	bh=nTeuEk1UVUVYb0OVRGIhQKZbyIFPSssLEukrTo1Ne0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j5n9wT/45tx2Al/8Xckz5fiYWp3aShYYLwishKZFuyeVaEPcfa4ItdTI4eIhM4n5y0APyBgaxf4rYUPHgH7BnxOrA0KJGSLe2L1dtUi6kjvz6oYDWK9t2Dht1jK+DE0SzV6IEU83r1rj5k74wYcju1tGArptnAaUkmoKjjTLwvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BSiYKVO2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KBSn9CKF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DGuKEU3995650
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 17:58:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1WKKWsy30d8mA0DD+ETWJZ8a
	7Kl1AqNPvhJoq/q794g=; b=BSiYKVO2YMfkIG0fCZORzl+GyoJ1WQGw3vbcbbJX
	8+9rUtHAknD4szJjVD2PyovYSne2u7TPE/ASEOLa4No36Hzvp7uzkDB0Tqf/2P29
	1/ZeazSJ8P7tg6+iaRkoeRsTkSF7w3QNT0bwgoqxRNYB6WkiAvlP/1BHx9FF6oTk
	9heosIJAZ5EMNHfbHUM5gjo59+jT8cVZ0e7YFWAVzlSeRAYzJ5DDtI1tLB8+HZT8
	+cvhs4NMw1bVrZ030VsrKZuVPUGE7cb1nT/ZUubeZRa7GGxW2jTmaSkzZHvG9ZuR
	DwGgp15vFE22t4i6QbCU3wvMdHCRzrSMRJ3bjqJ91CfjNg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4w8ur7xx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 17:58:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5163ade1583so11335521cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 10:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778695132; x=1779299932; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1WKKWsy30d8mA0DD+ETWJZ8a7Kl1AqNPvhJoq/q794g=;
        b=KBSn9CKFAe6CiRv39m3W5Uoe5ZetnYikvctjGkKmllyrFtmDoJZWOn4RZIDXTdK6uM
         +pWT0o/hFTpbt3zetE8bqolcSDmscchKOddRu5dBKsWpK8Wwyf4VIzxltfly0Ky/a2xz
         6+95iRYMJKXFMASJkZPeCLaBL/qraV8ZhK3lUTvxHfRKq+H+eDxN6npR/n4znl2sPx1g
         KjSRTXeeFmsheBphvhJsams5frX50k+pL9qHyRHbxpIHig3EKcbYyifgNlCXkLaK//t5
         CZd8uwZrbDfFxd33vaIrCgcyBN+OshwDjBfUvNk9FYJ6ebsk3hW7Y6bxI7EqdbJIpsPX
         Sh3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778695132; x=1779299932;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1WKKWsy30d8mA0DD+ETWJZ8a7Kl1AqNPvhJoq/q794g=;
        b=MMLBrIJF0TL7u0o9M6HSuIrUNKu3skeqcFnzFE7bs/xjDkMDhGQ8SIOV0Ba4K+vlSR
         SKXJovwN/R78FetzR01uvuJLdeqQmU3RQokTxc3Krl/ulju9HZ2gHqh/LCZtHSBTw5da
         F8PrwhSkOf2cIl4/pzxPwjWDPAQXG73WmsUucvxsX6/Ks0xHZ1iCbOfSTMBkKfZ9g2tW
         3e3pan3brvXd+hRghLQd14fPA+PXUuB4OiGlQQOJfdj2Yts5YaTrKfjeV55+q3wxV/tb
         ivcIBs4jUOEgPviVvU7em9Hiqk+JOPDhFGcdFAyYn52XRaMbN7D4XM8pCIXVOGFUuZ52
         ANWw==
X-Forwarded-Encrypted: i=1; AFNElJ8+PxJWsM9aWBNcAFyjE4DzV/+X1IyjIH+kNeaRjldosqhA1CS15oV7Zj7usOc3O3si6+oCO0iMzT5ugNWi@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3fJ8Zj184KeY2m5U66pRK7pwEmJaXENxvvLPD6rjg7wlnfsd5
	huYYY8pA6QdBEFbzM2IDUaym6pnt4vTJaIeBGL4/7rEOUtgbNuZOJE8rhmLZrbfC5oFwrOwEOWL
	2A2ZLDzIcbZQICUGjZ4LWXLC+nLxE7Pz548s3hmugwiqIWnLC0nUBLw2h9hgRH/9x1UjT
X-Gm-Gg: Acq92OHWmTg5i3H8C9MRDZ9RUmfGUF8Bv14jAs2zi+MpVq0mP4KViEqB7Qm32xpxkLK
	zhsismX5allbukW5nCDkvHHikBLMbpvkq9CZ2f3dNSjENd/ETv6m8NNL8QocbFMuzUC1K8QJHfV
	Lz8pSoYMonZaYngYWyuhY3iiHTaWArqLDSaCwEgSxrvT390brmqZ7VL2ER0vHJas7EShc1OlAoY
	+D0vyLseSi3WjOLqk8ocjbpS1qAv3PDImpy5atjWbd1XxpojAC/6b4g0iei1qC/CyAM6jZnRpYy
	Yooxfm6gHzi95XrAwi1DAwpYdWrod1+3QiYwXltBqkEF7lVad4MZrCbChHr07Oj0/miNst8QubQ
	4M/QS4CYOf4LTloypjC9rPV84/1+13oQE8F+PhjpHY+Qd7mVd/T0EfT+monZm6VzbckVcVMMZtN
	RXuupHv47Nna8RYo+MfCOcS780llokXm9Uyts=
X-Received: by 2002:a05:622a:1e0f:b0:50f:c5f0:f2fd with SMTP id d75a77b69052e-5162ff577efmr52620391cf.47.1778695132255;
        Wed, 13 May 2026 10:58:52 -0700 (PDT)
X-Received: by 2002:a05:622a:1e0f:b0:50f:c5f0:f2fd with SMTP id d75a77b69052e-5162ff577efmr52620041cf.47.1778695131770;
        Wed, 13 May 2026 10:58:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a956b2acsm4133502e87.82.2026.05.13.10.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 10:58:50 -0700 (PDT)
Date: Wed, 13 May 2026 20:58:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
        Yifei Zhan <yifei@zhan.science>
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: add support for pixel 3a xl
 with the tianma panel
Message-ID: <sxfr24cgzfa7vr5jvgjpnq3vdhqwoasycyjrphydleucsrip25@vtlul22nzqv3>
References: <20260513172549.1345-1-mailingradian@gmail.com>
 <20260513172549.1345-3-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513172549.1345-3-mailingradian@gmail.com>
X-Authority-Analysis: v=2.4 cv=WP1PmHsR c=1 sm=1 tr=0 ts=6a04bbdc cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=nkUbddICNmq_qF48:21 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=0n9J7lFBbKc1xmsM6LIA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: ccSx5RmDaK_5Tde8EXNkJYC2AtMP4X-t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE3OSBTYWx0ZWRfX3KjaZoPiXMm3
 ST3Fo5RwL4UperArwl54yXwR8q/6cbh7OS73izQU0MYkCTYxBBIol76aqYWC5gSoaqHibs5yB3e
 TQuJ7KaPyML7VkM0lSFGuxE6XXC72S8qOyrYeq7UhYKU0cIAhcrP3Pz3/dNDY+ovy2CGh8f54mQ
 SOtShlyjUwDKBpUfFxkn70iXbCsLvC6Khk5Zrr0InLArJMzuDCekRBqeBoWSlt0JXL0lQOlDj11
 sXyAhNZIdtRqft7Ilz7VuzyXyAeqJk0y2mQ/yvTUKNZx5vSSSinRouu1cttpKex3tCUb8RepY0m
 C9IACqQ3Zt7AZkl+Gmkf0xHYMi7fDP9ehtQOOGT9o1lDDCPSMnvn7sNjLldRd2iokvZyo/p7EVD
 T/xScQhYVEUHQdQ0+Rdg5iHVB5V1K5QuEjCFG6yqjty9YYOf1Oa+fW0jkiwsvyJrlhjQ7cPMXto
 cQh/6RcF2lUBvTU6kOg==
X-Proofpoint-ORIG-GUID: ccSx5RmDaK_5Tde8EXNkJYC2AtMP4X-t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 bulkscore=0 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130179
X-Rspamd-Queue-Id: E7692538823
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107410-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,linaro.org,gmail.com,ffwll.ch,linux.intel.com,suse.de,ravnborg.org,lists.freedesktop.org,zhan.science];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 01:25:49PM -0400, Richard Acayan wrote:
> The Pixel 3a XL has variants with either a Samsung Display Controller (SDC)
> panel or a Tianma panel. Add the device tree for the variant with the
> Tianma panel.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Assisted-by: "Claude Code Review Bot":claude-opus-4-6
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |  1 +
>  .../dts/qcom/sdm670-google-bonito-tianma.dts  | 32 +++++++++++++++++++
>  2 files changed, 33 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sdm670-google-bonito-tianma.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 169cc9b9ccd3..d909c527d848 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -303,6 +303,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm632-fairphone-fp3.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm632-motorola-ocean.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm636-sony-xperia-ganges-mermaid.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm660-xiaomi-lavender.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sdm670-google-bonito-tianma.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm670-google-sargo.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c.dtb
>  

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

