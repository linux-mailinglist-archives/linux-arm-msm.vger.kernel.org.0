Return-Path: <linux-arm-msm+bounces-96340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBcFBskhr2myOQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 20:38:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CC24824030B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 20:38:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 980CC30233DB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 19:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4C8140FD96;
	Mon,  9 Mar 2026 19:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fn75mzDY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jIyWL4Ic"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439A240F8DA
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 19:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773085059; cv=none; b=Jz610Ejgwc3xfcgB/YRtSoxMdGwBiJIYruQ1bLTswCkBkTM4/+RsLsf7GcUU6K7ZnRcw3VJUE6dewfUGniKAw7NFyJBZrO34LS8KMwLJhyMiLaeJR5XThdeZRNibaNkvgzTvSC3tX6M5w4K9KLt1daDhdd5nJMFCpASqAVaBLCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773085059; c=relaxed/simple;
	bh=MN4Bipv/OrLG3DZ7XROpDs9KFurbpF10YTGfPuIqz/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a1wSsUQN4wHmKcDYFWjYakVM72CPaB4ZR3rlmzRP3MsvJ/6rq8yqAMoj02UAwBFTiLavW6PyJlGaT+TpvXa8z3CEfNBiJrN5oEeb0xWAKcDGMQUjoklI5wlKA2/CyS6OEhKzA0Oyx+bZMELLpaKxu4ZLMHC7iG8yrXYy847h41Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fn75mzDY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jIyWL4Ic; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBrGF3148263
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 19:37:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wthQAeEjUduREYohLRk4Hc/eFANVikIh+fbWGoQaBaE=; b=fn75mzDYtqvS8Kkh
	WqnsJBQ8Eip9z8qlIlKSyUJ77HR8gtXXW6j0CxzI/n6jQvbabycomgjRtsLjn/my
	b/mF+S8DBILNLzx0mFXa262IVnhc2kvHRnfJFR6ZQWv2x7L/YtWW54NF0zWMBBIg
	P0Y4w5q30HHIN2xZPCyEWE3t/UuEIGoWPz5hzZzUEPTWtlwxRlF90Q3pKYA7+84T
	fxgdpRl0r+uSCjFlJ4MOyPc3/ito/y9nMKlM2trZTi9H2ql67rEPh/GsmnZT0xvl
	vUh1l7HjMsbGvjaWWCUZqTIUtvyE5viJvuzdTMq9qY/MHAGv25PtNnGhcNX6WrX4
	UcgoGA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csv5u9vmw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 19:37:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-509011403a7so169572681cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 12:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773085056; x=1773689856; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wthQAeEjUduREYohLRk4Hc/eFANVikIh+fbWGoQaBaE=;
        b=jIyWL4Icu5zpcgW4hlpeiTyOEJSVRSD/gUZ/p5BSujpnaU04nhydhxNOaf5T/9F29E
         c1T72eQwLVPghNPq3yhRZlTB9sEbgIQ1QAoxPD8j1GpaDCeQT/55wZjwYShbHgUS+fhv
         bjJC7E3sq8bcKrMxV89QK7ct/3fRH/Yph3wo3+6D8+rlo5UXROIPb1h9bGcIkhu1XlGH
         Gf2HBEeuvMSQ/OiKDPKcmU7Uoq8fnAlIbmLPcmRKuh0nZK5wBKlmCMGIhUOAPl1KSX+4
         95w7dJSX2n4/H8WoxjTqm6FJm+jmKvb83io7t4MVcjlPAvWtMGwLkLWPweb2uSUDwssn
         JW4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773085056; x=1773689856;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wthQAeEjUduREYohLRk4Hc/eFANVikIh+fbWGoQaBaE=;
        b=p5IU+yfEPZNQXlo+0YN5tBT2dw3o8WDh/4o58rtGl60cbVLzYGcpt8e4N8zEyJw7qS
         iauKcr9GD8gUseD5N3nFNnGINtd2do1xKEVaq2EE1zJYWADx0WQeEFwfYuSu4ZjDRyac
         MPJo4RXROndxsyCHRkyMzKAL6ErJI2ri95Zrs2Hv33CF78pPWuQ0kFaVmEhdoFhjm6AS
         5RQfNABAHXfXWoPd3QcAH80lTidGNTw6e0MVpX8opIv7ZPqTpcqwcHeVXlvOe4bjw5X7
         4jXjCVSyZ4/4JHmOuBU7G8gkkXMMnNuFqLTu9ZWB+Qh/2ec+YoAM7yaDs+f9TzD5TRLW
         Ne4g==
X-Forwarded-Encrypted: i=1; AJvYcCXflY1dqHeqLgWpdBcnCzMsUMunowzvZhRot0Lh+oQqDtwFkKqkvziVf2f1IfzAZ/KVAS90R+pHpu9sSclW@vger.kernel.org
X-Gm-Message-State: AOJu0YyO7l9I00E/RSGHs506fBmYBqJ13DgVPoQDPW0c/mPOofkihBWI
	uDfCm2CfnNX3GaAZgZL693NLMl2MZrhJc24XU3l9AHslS8UZNyJ7wHOTr1B4YAruXqBv2BBDyfr
	PwH2K2m6T1g8pd3oTrubaz2KvoL+YSSsK6+zWTbxea++7s6wGC+Eb1ycV1y2aipziJhY7
X-Gm-Gg: ATEYQzzXWgu8avx9WJNab0AcCOri/vPYAa42tlW2hYGprA/qCQNZnJBzJdUhOdAKKlS
	pFdkZeRxuEXtSLCMs32S855hGiLteK1o7jCsiGffvjkcxf4Zm7A0gpZH+CFATDy4JdAImXS6JKS
	N+YKzuu2Dr/CcNl7Bi+swQ7+tjXEE+GiEnYSe0JwGM6hUJ4Z7Z0R92MmLlQJK2r1GG+ytZKp6IF
	LreTNz4Dd1NCBa4xhcI4CMlc/xWviIsbIiORFf+UIQq7uW/GVmoxNuVNnFcaF8XZF+zRVPOCqPp
	07UrsFasRDDUHq8pET0+qwhRo23Fuh3lZYMTPCwcAaYJB4fkTNOHLyS0ZB4fbVXsPYeny23oPc7
	B1l7UIUtKBaAraTIuX79uNWk4cPjR8uLui7vSYyKl9VWhAgHvY8zgRmSzdAcVrXWV/+lR0NNzqt
	Z2WKFgR+3ZYv33sYJGZhYoKg0CjKSeAEc9D7A=
X-Received: by 2002:a05:620a:199e:b0:8cd:9020:f043 with SMTP id af79cd13be357-8cd90210524mr307723085a.7.1773085056319;
        Mon, 09 Mar 2026 12:37:36 -0700 (PDT)
X-Received: by 2002:a05:620a:199e:b0:8cd:9020:f043 with SMTP id af79cd13be357-8cd90210524mr307717785a.7.1773085055640;
        Mon, 09 Mar 2026 12:37:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d08c1cdsm2346943e87.79.2026.03.09.12.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 12:37:34 -0700 (PDT)
Date: Mon, 9 Mar 2026 21:37:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
        geert+renesas@glider.be, arnd@arndb.de, ebiggers@kernel.org,
        michal.simek@amd.com, luca.weiss@fairphone.com, sven@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        kuninori.morimoto.gx@renesas.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, m.facchin@arduino.cc, r.mereu@arduino.cc,
        loic.poulain@oss.qualcomm.com
Subject: Re: [PATCH 4/7] arm64: dts: qcom: Add Arduino Monza (VENTUNOQ) board
 support
Message-ID: <xkxk22xnv4nkwq6hdbwxy4a5lct3pzbzjoahvdpugectjscifi@tftbseheg5p3>
References: <20260309152420.1404349-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260309152420.1404349-5-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260309152420.1404349-5-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-GUID: rwgEG_1Iiz-I1kIeXjONKn1xSay-7p3y
X-Proofpoint-ORIG-GUID: rwgEG_1Iiz-I1kIeXjONKn1xSay-7p3y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE3NSBTYWx0ZWRfXwmvJRlGFq3hR
 9wxX0VU3mqvumvmPxjAaY7ks8EButvkx6/iuU6dUb6bJe8UWSPE9A/g36gW7Wzpcrdg0qpkt6A4
 WnwF6/Zr74Nlq02OvMMkAQvqb1mjJqY86ob9gG4jgxQ4+8SyF6lSea8h0EFY3zW35g8jnGkDfDk
 xv9y1UoOjJmWJcDqX7c7Hc36g3ttgR51LLXUo56Tzo5ezv1wEpvN74mXUgXaUQHZ4/N1M6E8esy
 6pyxVC5RDfwdYx1AbtNSjNE7Cq6hFtJXNVAHq1pXeNCRBhdjWCAENMQ5vIAaCZVnI1IT+R0zrlb
 F52PNQy4MyU5AHcVPtkLxFyLhary18ybpp69TymCBugnW5fw6F75kgV2IGD58aKs7pPb1r+Shpe
 MTGC4L50Ou/XP8qgsCpYEt7TMZanK6vCPlAgSmSEnF5kYi05g55tADSGbcLPXjPryBmdKJmwcNj
 CHzoNPvPwMB7ReqvZ1A==
X-Authority-Analysis: v=2.4 cv=Xr/3+FF9 c=1 sm=1 tr=0 ts=69af2180 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=ra4WwR3Z5C1Kax7hxwcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090175
X-Rspamd-Queue-Id: CC24824030B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,glider.be,arndb.de,amd.com,fairphone.com,bp.renesas.com,renesas.com,vger.kernel.org,arduino.cc,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-96340-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,0.0.0.2:email,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 03:24:15PM +0000, Srinivas Kandagatla wrote:
> From: Loic Poulain <loic.poulain@oss.qualcomm.com>
> 
> Add device tree support for the Arduino VENTUNOQ board,
> based on the Qualcomm QCS8300 (Monaco) SoC.
> 
> The board features a Qualcomm Monza SoM and integrates various
> peripherals, including:
> - USB Type‑C connector with dual‑role support
> - ADV7535 DSI‑to‑HDMI bridge
> - MAX98091 audio codec
> - 2.5G Ethernet PHY (HSGMII)
> - PCIe0 (to onboard WiFi chipset and USB bridge)
> - PCIe1 (to M2/nvme)
> - Button (via GPIO‑keys)
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../boot/dts/qcom/monaco-arduino-monza.dts    | 446 ++++++++++++++++++
>  2 files changed, 447 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 6d87be639aac..8a9093c4b534 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -47,6 +47,7 @@ lemans-evk-el2-dtbs := lemans-evk.dtb lemans-el2.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
> +dtb-$(CONFIG_ARCH_QCOM) += monaco-arduino-monza.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
> diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> new file mode 100644
> index 000000000000..b6db2a7151f1
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> @@ -0,0 +1,446 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
> +
> +#include "monaco.dtsi"
> +#include "monaco-pmics.dtsi"
> +#include "monaco-monza-som.dtsi"
> +
> +/ {
> +	model = "Arduino VENTUNOQ";
> +	compatible = "arduino,monza", "qcom,qcs8300";
> +
> +	aliases {
> +		ethernet0 = &ethernet0;
> +		i2c1 = &i2c1;
> +		serial0 = &uart7;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	connector-0 {
> +		compatible = "usb-c-connector";
> +		label = "USB1-Type-C";
> +		data-role = "device";
> +		power-role = "dual";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				usb1_con_hs_ep: endpoint {
> +					remote-endpoint = <&usb_1_dwc3_hs>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				usb1_con_ss_ep: endpoint {
> +					remote-endpoint = <&usb_1_dwc3_ss>;

No intermediate QMP PHY, no DP support?

> +				};
> +			};
> +		};
> +	};
> +

[...]

> +
> +&pcie0 {
> +	pinctrl-0 = <&pcie0_default_state>;
> +	pinctrl-names = "default";
> +
> +	vddpe-3v3-supply = <&vdc_3v3>;

Is there a wired 3v3 support without an M.2 slot in play?

> +};
> +
> +&pcie1 {
> +	pinctrl-0 = <&pcie1_default_state>;
> +	pinctrl-names = "default";
> +
> +	vddpe-3v3-supply = <&vreg_nvme>;
> +};
> +
> +&pcieport0 {
> +	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> +
> +	pci@0,0 {
> +		#address-cells = <3>;
> +		#size-cells = <2>;
> +		device_type = "pci";
> +		bus-range = <0x01 0xff>;
> +		ranges;
> +		reg = <0x010000 0x00 0x00 0x00 0x00>;
> +
> +		pci@2,0 {
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +			device_type = "pci";
> +			bus-range = <0x00 0xff>;
> +			ranges;
> +			reg = <0x021000 0x00 0x00 0x00 0x00>;
> +
> +			usb@0 {
> +				compatible = "pci104c,8241";
> +				reg = <0 0 0 0 0>;
> +				ti,pwron-active-high;
> +			};
> +		};
> +	};
> +};
> +

[..]

> +
> +&usb_1 {
> +	maximum-speed = "super-speed-plus";

Do you need to specify it?

> +	usb-role-switch;

This should go to the monaco.dtsi.

> +	wakeup-source;
> +
> +	status = "okay";
> +};
> +
> +&usb_1_dwc3_hs {
> +	remote-endpoint = <&usb1_con_hs_ep>;
> +};
> +
> +&usb_1_dwc3_ss {
> +	remote-endpoint = <&usb1_con_ss_ep>;
> +};
> +
> +/* Internally connected to the MCU (e.g. for DFU). */
> +&usb_2 {
> +	dr_mode = "host";
> +
> +	status = "okay";
> +};
> -- 
> 2.47.3
> 

-- 
With best wishes
Dmitry

