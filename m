Return-Path: <linux-arm-msm+bounces-94934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCv7HamNpWmoDgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 14:16:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6F61D99BB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 14:16:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9248330514AB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 13:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF3AD3E0C4C;
	Mon,  2 Mar 2026 13:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nVXcuOWM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HSBadLxA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF043451A6
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 13:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772457210; cv=none; b=V0aGWzU/pgFJlCq56l/sWaAeYHEPV0M3v4GeJGhe8pqXbDbms4FgPKJ9HvUZY/Tf4g31ai+0vGdrIiFTAlAuTAW9HDdzg+u9YlMh9SVRBGsgEmxFhcYhIuKXX7I4mZTzk9sJDUrPVqz057Y+Hlw0AcEj+czrxZfBX0BCAhttSJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772457210; c=relaxed/simple;
	bh=KpP9QI803SicNOprcW5f0uD7Dl0i6yvL1fttm2+u5HQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jeDfpccOsSqCs3+7x75xoJvAhW3XwHWV3MCwWnyQxsFyFA/u9+txQmSYSFMr56nxskfbyBH07ksZ96/CPKPg6OfXpm3Ar+OrQsdqonK9DlSMT4TOlJbLQVSN8r5M8S4wugxdWBqrxBAPdhs/ba57UewXFKTgz++YYjvbUHrrFMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nVXcuOWM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HSBadLxA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6229K3Mf782736
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 13:13:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+6GJLR1TOWcAZHXTNBjSxJu8lJQ/T0tDHTDKHqFFUTU=; b=nVXcuOWMeRBgHlyH
	FeSfruPFCmDhzU7Xbqf9pu08zMdhzUvEn15iRMiDEfFwowWV1zzXLKOmn4YANUsj
	t8XOXgaSqX4jTHXqITqV8CFNyR/IEv4Ievahc9QSnDYmhLF393s/oNaan97qUgMN
	TmtYfCi2EqHBSUEoWez0E/oVPKDWccugB+UxA74x/DISvQ5yMLwljv+HCx5MMIYn
	uwEv9nnnnNeIw/9T+uK9ttJeyMBL7U4BSVcfP9F5U8dAhsU8UiuIgruCwbgWpojk
	ZYGflsAE8tAMsk5JV7Kp6HVdcL89+g+RvW4JOu6GZqLV4W64bmIE94fjO8giiUrC
	5yT55w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7u00rey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 13:13:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70b6a5821so2858309585a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 05:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772457207; x=1773062007; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+6GJLR1TOWcAZHXTNBjSxJu8lJQ/T0tDHTDKHqFFUTU=;
        b=HSBadLxAgLx3uR7zcDoptVipugDMI3n2pmo+oUuUhBL2UqR170hwVrqEBfxz2CmDgp
         L1LpfHsEUjQeN+hjYnVCpIEM9fLPaESjQUa1XbgTlhpT/SRf9w+EWKVboBKOIuGpDzj0
         FP/xGPETZdZSTwjxylMSa3c28wrRZnjKEaY5VhD2rWneDCjffKSFD978zIZkgYFJ2e5I
         +wVtvlCD5cKW9rWe5K+zVkwS6iGlG061Rlnzec5cJn9dslc+0L1103eyfGJyARZXydJ+
         eXzdMEdGI5c0u6QsQapUy86M1CU6yRSRpCXw5IPiFFe6xUw8Bp1i+FVHYz5tDoi3UgJt
         +I9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772457207; x=1773062007;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+6GJLR1TOWcAZHXTNBjSxJu8lJQ/T0tDHTDKHqFFUTU=;
        b=EbN9mDR7VlbP3/z8XzI78Pu0+BGZOkm2jo+rJWPC+1QTcgOUur+5XLKDfnHzcyvrDJ
         5nCbWVGpB3GsECCiqB/F3AKPMajt+bS4nGRFmZhgRkXCv19DzR87b8hBydp9fflpn4qD
         Sh5qJ9YlLBsADCYmnKsO6WR37+XCjZiqYaFVF0hoBtUT5wd5cP5v4YeMQZz7Y18nSmk0
         ZcxICd9ycuOjzKLSEkzeo3BIFLv90l5dK/zoxuwg6q5srpBpPlgvMi+wXlQwkPYo4275
         tIXtuKL9+lJLWcz/bpjKtV8+sYQsr2cm/dwqV75uiPgPY9KMSBTNbn1rbqcTZvosJRf5
         Pxlg==
X-Forwarded-Encrypted: i=1; AJvYcCUT46Rd9G9X6auLgq6Cx2xDQsQRGMbdx4kDJyhRHXUwNSc1K/PLomW3Dx1kyTXaV8wGDHQRk/SYpmle5JRF@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7cpT8ob+2IYLEVhg1E1VgDMV31j4cuEZOqiUbPREmbgpXxWUr
	9trdkEZwtxuG7RwTzW2q0bsOei3p/eV4CjLEFB0dYko7XN4UE7b1LAv/tY80BuF1xDtvVz/hYVG
	YjP4XuhcefQ2w23uVC6+KnHAaoC0f7pK4RIaFeRjrdso6CRcOrbPZcWukZsdJTOtMvzFs
X-Gm-Gg: ATEYQzwdESKY9XbFteX1/PbUYvQuVF27O13Ns71ugQ+DDngtjzvf8CWePpO0ctqKVBw
	OslHTt57nbzCHilqpkgb6GvYbELjgQmaq6fZKeKYI6FMGLMHZJXL34ls09/uvWQ1iEqweLG+6aQ
	WBQcllHRXppU1B79Cls0RK62NgTAGmaDecPXDDKgOQtv/eCz7V2j5Je5sJrLJwFBjSCrkvmhqWM
	suOgbxawAaA1mOWgMmFPOBM0iQgjoJrdkZyBqxKIelcZvLiZMDYEwj9Y2SXHOpI7mHUHLG/eLKX
	bD7y2r/HreVyj23QPmlS5+IRc273NGLSji4v3HYaaBqB6xRANPmzGz7KgcPOWLHhbGs2j+DSPOu
	RXRYNmcL1Hv+5orM4ZWri3BA1rAOcnHcCRmRZxXzKIp8wakPWiyhKuQsSiB/SeQKEt3+ZuY2DTe
	NGZmnPO4tuUKJzNy2qOwzyy2ne6Cmc2FQmq1k=
X-Received: by 2002:a05:620a:711b:b0:8c6:ed6b:5865 with SMTP id af79cd13be357-8cbc8cc9c0cmr1474137485a.0.1772457207332;
        Mon, 02 Mar 2026 05:13:27 -0800 (PST)
X-Received: by 2002:a05:620a:711b:b0:8c6:ed6b:5865 with SMTP id af79cd13be357-8cbc8cc9c0cmr1474132585a.0.1772457206726;
        Mon, 02 Mar 2026 05:13:26 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a115bd26eesm1643781e87.8.2026.03.02.05.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 05:13:25 -0800 (PST)
Date: Mon, 2 Mar 2026 15:13:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sudarshan Shetty <tessolveupstream@gmail.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v15 3/3] arm64: dts: qcom: talos-evk: Add support for
 QCS615 talos evk board
Message-ID: <rco6vpc2cnn7y52hyuf3btt2mo7apv46romvi3onakc5axjuef@sbghvgoknspy>
References: <20260302121159.1938694-1-tessolveupstream@gmail.com>
 <20260302121159.1938694-4-tessolveupstream@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260302121159.1938694-4-tessolveupstream@gmail.com>
X-Authority-Analysis: v=2.4 cv=GMMF0+NK c=1 sm=1 tr=0 ts=69a58cf7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=z6SWYhlxSYCt4y5xu4EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDExMSBTYWx0ZWRfXxi9b5qwNXSKo
 TZIFXu2EoF2LQyXYsLq/fO6Z3zchF+rSluHEacB7T2IEhWrsfIrJoMk40+oh9RD7aaW2csf6UE0
 qVZEB/9NwU3jOWMDrRMRzlX5ZxrBVahIrVD1QINNI0HLr22mpPllokDmY7pVyIynCsOsFJbrEFJ
 oe+uKLFUwjbW4r1A8vgwf7DpntxP5MKs6SFHEcLfDasmrB5cwi2fMPD39C5VTi2oi/A6oGjLr54
 z++CINnxi4iqeNfEt2BOUMHkzpVL0S0Xd0gIsgmnDDH4o7uZm1KVzHKCM1R2KVcWiNZuQG3CX71
 UXSFjINWYr7z59CQ0Ezu79uMrK+SdiyYEFjBseE9v18VMKg5EraGeYnePeUMYga53YKNkeOpwvl
 JrCjDyzXeJ4AKCjrauehNG+IW/irYj/80TVdGrfNGOHIecHNmGV5XRe0mWC4bcjssPXfHdXNHml
 YrrXc/FjMSCuIbqp58A==
X-Proofpoint-GUID: CtNU7WoYiUsgHHA9SBIsjXxyVlDp2q9O
X-Proofpoint-ORIG-GUID: CtNU7WoYiUsgHHA9SBIsjXxyVlDp2q9O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020111
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94934-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2D6F61D99BB
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 05:41:59PM +0530, Sudarshan Shetty wrote:
> Add the device tree for the QCS615-based Talos EVK platform. The
> platform is composed of a System-on-Module following the SMARC
> standard, and a Carrier Board.
> 
> The Carrier Board supports several display configurations, HDMI and
> LVDS. Both configurations use the same base hardware, with the display
> selection controlled by a DIP switch.
> 
> Use a DTBO file, talos-evk-lvds-auo,g133han01.dtso, which defines an
> overlay that disables HDMI and adds LVDS. The DTs file talos-evk
> can describe the HDMI display configurations.
> 
> According to the hardware design and vendor guidance, the WiFi PA
> supplies VDD_PA_A and VDD_PA_B only need to be enabled at the same time
> as asserting WLAN_EN.
> 
> On this platform, WiFi enablement is controlled via the WLAN_EN GPIO
> (GPIO84), which also drives the VDD_PA_A and VDD_PA_B power enables.
> Remove the VDD_PA_A and VDD_PA_B regulator nodes from the device tree
> and rely on WLAN_EN to enable WiFi functionality.
> 
> Add talos-evk-usb1-peripheral.dtso overlay to enable USB0 peripheral
> (EDL) mode. The base DTS will keep USB0 host-only due to hardware
> routing through the EDL DIP switch, and the overlay switches the
> configuration for device-mode operation.
> 
> The LVDS backlight hardware has been updated to use a simplified
> design. The backlight enable signal is now permanently pulled up
> to 3.3V and is no longer controlled via GPIO59.
> 
> Remove the GPIO59 based backlight configuration from the device
> tree, as it is no longer routed to the LVDS interface.
> 
> The initial device tree includes support for:
> - CPU and memory
> - UART
> - GPIOs
> - Regulators
> - PMIC
> - Early console
> - AT24MAC602 EEPROM
> - MCP2515 SPI to CAN
> - ADV7535 DSI-to-HDMI bridge
> - DisplayPort interface
> - SN65DSI84ZXHR DSI-to-LVDS bridge
> - Wi-Fi/BT
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   6 +
>  .../qcom/talos-evk-lvds-auo,g133han01.dtso    | 127 ++++
>  arch/arm64/boot/dts/qcom/talos-evk-som.dtsi   | 614 ++++++++++++++++++
>  .../dts/qcom/talos-evk-usb1-peripheral.dtso   |  10 +
>  arch/arm64/boot/dts/qcom/talos-evk.dts        | 139 ++++
>  5 files changed, 896 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso
>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-usb1-peripheral.dtso
>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk.dts

> +
> +	regulator-usb2-vbus {
> +		compatible = "regulator-fixed";
> +		regulator-name = "USB2_VBUS";
> +		gpio = <&pm8150_gpios 10 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 = <&usb2_en>;
> +		pinctrl-names = "default";
> +		enable-active-high;
> +		regulator-always-on;
> +	};

Hmm. I hoped that we are past this stage. Please order the nodes.

> +
> +	vreg_conn_1p8: regulator-conn-1p8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_conn_1p8";
> +		startup-delay-us = <4000>;
> +		enable-active-high;
> +		gpio = <&pm8150_gpios 1 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	vreg_conn_pa: regulator-conn-pa {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_conn_pa";
> +		startup-delay-us = <4000>;
> +		enable-active-high;
> +		gpio = <&pm8150_gpios 6 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	vreg_v3p3_can: regulator-v3p3-can {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg-v3p3-can";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	vreg_v5p0_can: regulator-v5p0-can {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg-v5p0-can";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +

[...]

> +
> +/*
> + * USB0 routing and EDL mode:
> + *
> + * The USB0 controller’s HS differential pair is switched (manually)
> + * between the Micro-USB port for EDL/ADB and the on-board USB 3.0 hub.
> + *
> + * During EDL (Emergency Download) mode, the HS lines are explicitly
> + * routed to the Micro-USB port to allow the SoC to enter device mode
> + * for flashing.
> + *
> + * After EDL the switch is normally toggled so the HS lines stay
> + * connected to the hub’s Type-A downstream ports, leaving no electrical
> + * path to the Micro-USB connector — therefore USB0 runs host-only in
> + * normal runtime and device mode must not be advertised.
> + *
> + * USB0 is configured host-only in the base device tree; a separate
> + * device-tree overlay enables the Micro-USB peripheral configuration for
> + * ADB. For ADB to work during normal runtime the DIP switch SW1 must be
> + * manually toggled to the off position (reconnecting the HS pair to the
> + * Micro-USB port).
> + */
> +
> +&usb_1 {
> +	status = "okay";
> +};
> +


> diff --git a/arch/arm64/boot/dts/qcom/talos-evk-usb1-peripheral.dtso b/arch/arm64/boot/dts/qcom/talos-evk-usb1-peripheral.dtso
> new file mode 100644
> index 000000000000..2f4630a6ba66
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/talos-evk-usb1-peripheral.dtso
> @@ -0,0 +1,10 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +/dts-v1/;
> +/plugin/;

Comment, what should be changed to make use of it.

> +
> +&usb_1_dwc3 {
> +        dr_mode = "peripheral";
> +};

-- 
With best wishes
Dmitry

