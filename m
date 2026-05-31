Return-Path: <linux-arm-msm+bounces-110459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDvwGOP6G2qwIAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 11:09:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0152F615411
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 11:09:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB3B7302E43B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 09:09:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E62C0349CD9;
	Sun, 31 May 2026 09:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KKmDk9PY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qt4ad+fc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DE333F5B4
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 09:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780218588; cv=none; b=rlBI+8qN4eS9pfPHvQQI/ctrvEbAtOJQU/DL+zBI+LanzHG2NdNR/8R/l8Z+y3+M4Ob87Lp5Uatkf1a41d0EJQu5QhI3YzHlZPYLgW/Ugpjr1VWXG9X/uRX1d6Wro1bXFeRp/pkHxLv9pyQ7Ptjo8HRp/9NmFezfEBIzAwY4+d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780218588; c=relaxed/simple;
	bh=ATQcVAvp1HmKNaEgs932roDbLg512YFmXXFGjFzdtqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GmEEq95efNq5h874OVhisYSNF8dYuI9dvp6PkJKe2YI3tQOXRdeKslO/wh6PrMCt1S1xIhVEZlnvqcSspnfDeRMzJq60KkWQiOzdDqoQaDRd3zT9oVwMMqI7Q6yyMjXopkTVovfXRGp6WRXyoyywnSXhGav67Tig2gL2jrwo2KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KKmDk9PY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qt4ad+fc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64V8ssqT1309990
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 09:09:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=foegc0ml0k0+ipyBYI4YuHEj
	n4nzcMp7/HF3r3HeSAI=; b=KKmDk9PYf7GSIPB6r52rmmiIwz0+RFNUmfs9aMsH
	deRkMPJyUQ60vSmt87hnn7pHnOgKuSVk8qgTRA9Mi6XJhu4GFt1LV+a7p5QS5M9S
	IKfi0zhJLh97AaC+uRTc5LHsesVVa/+p6nJ269GJAsj9NW639vWYVDS6Jz3OIs/Z
	cLaNi1rPJkM+iBJ/9gTrm2Nr6hg+YtJpthRjuy3gk3d2CWeKyjYxmle83/bDz5F0
	k9ILnXOPAQZ2WjJI8Om7Gq6tQyFRKGjdthhOpPB5sO7au6sQbs6zMVLQMtM6TF8L
	/RydzRRJe0+u+MBq2zY4gusHOuXVoDuIZZ69atIJTDLyOw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efq7fb9qc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 09:09:45 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6cfd441619aso63265137.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 02:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780218585; x=1780823385; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=foegc0ml0k0+ipyBYI4YuHEjn4nzcMp7/HF3r3HeSAI=;
        b=Qt4ad+fcQ4HosI5yoRuh2+0fgnQlt8n0M5kUTdsP2qfNl4IafJ4PbWwob+YdzCCBKm
         DCyohtcwkLK/xS+GtItfpHucy5rEo7cqqFJReN9HnQydEcTzp3pRUH4Zxx2yUXIjkjpT
         +HWWQGOxv5iA91p/IYobYP45jF1BwFUWe5NjaGZbja8zMWQDs/r978QPqBuSqHHar29+
         aBXYiSCxVcvEJ7bteOICMO53uo1VFKxH8M3bbMWZ4TZ+L7JAJV+LUHpToHtn09sNASF6
         Wf6YOgV7Ejpm9n2I7tN64HyloZaWUDhKzmK9pmFRhoCmPgH8huiuetYQ039NeqsOODE/
         Z4hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780218585; x=1780823385;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=foegc0ml0k0+ipyBYI4YuHEjn4nzcMp7/HF3r3HeSAI=;
        b=XZlUfkUhOEQFQC5iCMFxO1PVFSCrbLDF8+smRskj1Y4k2p87Rk6iaFP6o+eb3qbO48
         BjCouIp02GhB4UdQszS3IzVjgvG9FKxlxRWvSyvyw7VhBMzejeeZSCzpgUP6ep+E/FuG
         q3KnYb//nDSFfTOGcA0ukg0ydY1bvzgbLuV669/LVI4hYgAilW2H/OE9r0MZB1MKEcb/
         qyj7/4SxCy1Hd5zoR2mw28cs7sgxpAPZNmJQHe40koGk4y04QtoYD7fv8tZyIwYAp1JT
         +0x+AvWnaVDE6HiNyh5fwNETdzamDzfooutJm/ABW9rLw0ILtp/mmdEbqk9vw5n9b3cZ
         nD1Q==
X-Gm-Message-State: AOJu0Yw6eCHe61XgfELNEjmyjymNR3gY7j5V+8oQbPD7wJoX+/lE5J0/
	MOZoiGHXqiOf4uaCPekAoySnW7eo/io0KS/Y+Zwnt904LFQNteGJIR0VBQFr5iNiwCVWYvvVfcH
	wb61OYwEkCh2sZzABDCCa15OlPG1C5Q/QG+scYkLx6mokUoBIaNTrVI90Zyw6YcIC0Jfloe9ogZ
	GNadw=
X-Gm-Gg: Acq92OEGe7zYPdzHCrCJR691FuKyiaMZIXPrW1cDvNVTO7wRo4+1d8XbFleRPK1omy9
	rEqXC73DW2nwjYP4lDDtscfVh3XnPUOA7vOL6GJd69tTr2aA5Ae5mn32FwznoQGBMmO+Oxjf41r
	NrF3Zskujxi11R9Y8Yr5YzmBFiOdQ42il9Z262gztoiJXPrWC78jXj2bsjM0ycnxxwut46sva1M
	UQGdxUcdSk80gQC+54wMw8iJZGnC1rgh6XPAl79zINedcYtwXwdNnvENLM/Nimsf0/j8+sPAmQb
	Y0hurFO1rzvKoOr6rcW9ThxOI1HatQUG0WXWUkOC8osevt28D8OpbY8l5lHMRaDV82KtOJdcaI2
	PZU54kT+mIF0Mmno/XYQkj+V6foimdp6CdJKa7f3/IbaVb9EyITsCUkDSRYjSi4OvbuLvKOwt5K
	/mJ2JWWR1/AnpS8YQ5LXam5Jpaa89QxD53fkbSDtsrehBEJw==
X-Received: by 2002:a67:e717:0:b0:639:3b08:d64c with SMTP id ada2fe7eead31-6c68cd85929mr1935444137.13.1780218585341;
        Sun, 31 May 2026 02:09:45 -0700 (PDT)
X-Received: by 2002:a67:e717:0:b0:639:3b08:d64c with SMTP id ada2fe7eead31-6c68cd85929mr1935437137.13.1780218584856;
        Sun, 31 May 2026 02:09:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5bdbd5d4sm1395643e87.72.2026.05.31.02.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 02:09:42 -0700 (PDT)
Date: Sun, 31 May 2026 12:09:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qian Zhang <qian.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] arm64: dts: qcom: monaco-arduino-monza: Add QCNFA725B
 WiFi support
Message-ID: <vvnecdwfbpzeuo2zjk7ajkfwaay7dexjncjuuhiu5ldqlp62wp@ybhqbzzj6x2f>
References: <20260531071409.3557734-1-qian.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260531071409.3557734-1-qian.zhang@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: aJd5ItR3KHf3DAhCOCf2ov4HTdELVJ9J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMxMDEwMCBTYWx0ZWRfX5dB/S+D973+0
 4B3Rhrj1fi3JcRL9oZCi2Md+ervB0P7IWH9fXpvFMj557UCBg2DgiHaYO3aXL3IRokWaly4HIiD
 pdvzSKMKwR3IAluZNPny1mrOqoQ+cvjRo1IOp+kWfytSV/3V8sYS9lTQo9vw9c4sN5c+szRZo/w
 xErjCyxzkDzlookpwHAWN+1Ys6+77enfPMuDoMSx44OlpULaNycVvjctfw8YegSQHjoP6vFUadH
 yIIEA/7T81+iuY61ZgkrWIaQM6IC6SiBIU2ZWLQ/Ug5P3WXp84CL2bcoC0bsE0GNMMKyuk0czof
 h9T2Vq6vxg22+wSdIJjrLVvqZKiErrDAvW1d2E+t6NoEPVOXJtxwJfy38zoJFgKHVacajk7bSUg
 8ZIQ8brKxSe+cxgFvyRrra1JAo36ISlR9jO+WQ4kHm8uNBqikYJznFIYMWcgKZKqCa+fCA++Q+m
 pAruuPAKtqRMb2Pwptw==
X-Proofpoint-GUID: aJd5ItR3KHf3DAhCOCf2ov4HTdELVJ9J
X-Authority-Analysis: v=2.4 cv=XqzK/1F9 c=1 sm=1 tr=0 ts=6a1bfad9 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=6o1Pfrvaqi4n_z-QX6IA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-31_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605310100
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110459-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,0.0.0.0:email,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0152F615411
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, May 31, 2026 at 12:44:09PM +0530, Qian Zhang wrote:
> Add support for the QCNFA725B M.2 WiFi module (WCN6855-based) connected
> to PCIe0 on the Arduino VENTUNO Q board. The following DT nodes are
> required:
> 
> - qcom,wcn6855-pmu: manages GPIO56 (wlan_en) through the
>   pwrseq-qcom-wcn power sequencer, and exposes the WCN6855 internal
>   LDO regulators consumed by the wifi@0 node.
> 
> - rfkill-gpio: exposes GPIO54 to the rfkill subsystem for RF state
>   management.

Instead of just providing a summary of the patch, write something
useful. What is GPIO54, how does it control the RF, why is it rfkill?

> 
> - wifi@0: describes the WCN6855 endpoint on the PCI tree.

Drop the useless parts. It's obvious from the patch. Try describing why,
not what (yes, AIs are bad at it).

> 
> Signed-off-by: Qian Zhang <qian.zhang@oss.qualcomm.com>
> ---
>  .../boot/dts/qcom/monaco-arduino-monza.dts    | 108 ++++++++++++++++++
>  1 file changed, 108 insertions(+)
> 
> The Arduino VENTUNO Q board uses a QCNFA725B M.2 PCIe WLAN module

Is it just WLAN of WiFi/BT?

> connected to PCIe0. Two GPIOs are required for proper WLAN operation:
> 
> - GPIO56 (wlan_en): The WLAN module enable line
> - GPIO54 (rfkill): The RF kill line

This should have been a part of the commit message.

> 
> Testing:
> - WLAN module (QCNFA725B) successfully enumerated on PCIe after boot
> - WiFi scan detects available networks
> - rfkill block/unblock correctly toggles GPIO54

Drop.

> 
> Changes in v4:
> - Replace regulator-fixed + vddpe-3v3-supply with qcom,wcn6855-pmu for
>   GPIO56 (wlan_en) power sequencing
> - Fix module name QCNFA765 -> QCNFA725B
> - Link to v3: https://lore.kernel.org/all/20260511-linux-next-v3-1-3e22737e71eb@oss.qualcomm.com/
> 
> Changes in v3:
> - Replace regulator-fixed with rfkill-gpio for GPIO54 (rfkill)
> - Reference wlan_en from PCIe node via vddpe-3v3-supply
> - Fix subject prefix
> - Link to v2 (wrongly named v1): https://lore.kernel.org/all/20260501051918.1990713-1-qian.zhang@oss.qualcomm.com/
> 
> Changes in v2:
> - Clarified GPIO roles: GPIO54 for wlan_rf_kill, GPIO56 for wlan_en
> - Improved commit message readability with bullet list format
> - Link to v1 (wrongly named v0): https://lore.kernel.org/all/20260425031712.3800662-1-qian.zhang@oss.qualcomm.com/
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> index ca14f0ea4dae..bd5b8a161e7f 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> +++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> @@ -153,6 +153,78 @@ vreg_nvme: regulator-3p3-m2 {
>  		enable-active-high;
>  		startup-delay-us = <20000>;
>  	};
> +
> +	rfkill-wlan {
> +		compatible = "rfkill-gpio";
> +		label = "wlan";
> +		radio-type = "wlan";
> +		shutdown-gpios = <&tlmm 54 GPIO_ACTIVE_HIGH>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&wlrfkill_default_state>;
> +	};
> +
> +	wcn6855-pmu {
> +		compatible = "qcom,wcn6855-pmu";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&wlan_en_state>;
> +
> +		wlan-enable-gpios = <&tlmm 56 GPIO_ACTIVE_HIGH>;

No bt-enable-gpios?

> +
> +		vddio-supply    = <&vdc_3v3>;

Please explain in the commit message why 0.9V, 1.3V and 1.9V pins are
supplied by the 3.3V supply.

> +		vddaon-supply   = <&vdc_3v3>;
> +		vddpmu-supply   = <&vdc_3v3>;
> +		vddpmumx-supply = <&vdc_3v3>;
> +		vddpmucx-supply = <&vdc_3v3>;
> +		vddrfa0p95-supply  = <&vdc_3v3>;
> +		vddrfa1p3-supply   = <&vdc_3v3>;
> +		vddrfa1p9-supply   = <&vdc_3v3>;
> +		vddpcie1p3-supply  = <&vdc_3v3>;
> +		vddpcie1p9-supply  = <&vdc_3v3>;
> +

-- 
With best wishes
Dmitry

