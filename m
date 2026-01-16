Return-Path: <linux-arm-msm+bounces-89337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A2576D2D902
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 08:57:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 444D13008E00
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 07:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F7F32C11E5;
	Fri, 16 Jan 2026 07:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DVgrRwM1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dljdT4GR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DEA254B18
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 07:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768550225; cv=none; b=P6O4LygpFvuLUlVzQfWLvo/k82cR9nx865cOYPaY7oVFueum8BdTZzy/2Et+FerJrtJO3G04aNuS4EIKL+AuVmI4H+nkYZ0cKxJtf5WQmUQY/h46Oc7xCOsT90EflXUUYKC+qU7Rkq193OWs8hW2gvtS0B3HT4pFXfiipfEUoxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768550225; c=relaxed/simple;
	bh=QYjOiB2qTIccPAcI5WCiBteFnSuy27FBPPZ3dJ1cK6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WvsBbP/+348bJOcF+iU8CplsO0dXCTnWbO/KlWUJsLnOZZknYscvQ0O3lfMjEwZNaCeAokAjpFgDALdzPZGjETSwMOCGBXqr4y/5ta2DqHpLDh1ixgLqKIC7M2kwTVMrkjQgwMpe3w4gS/dQqMpxcLQr/OigJLH/CF/SyPDm52A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DVgrRwM1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dljdT4GR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G7pjE33759048
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 07:57:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IKZPxasrpx3XmiuLkLHihcyRbciy0hG4GnVIT0h1kh4=; b=DVgrRwM1FHwvDGbi
	GvGCuy3RwsaX7RkeKKQ85xT1JHHu8FCppXLFe5wCP6iiK827TiC1KaXRwgoRm97T
	xHFXohv45TLukRh7yeIwcd6eBfmf8nixO3urYElJ9tPbH4zzWGVbX1qbMPGXFgKJ
	EFzw3QrcpOGq1U/dBdumOd4YwOa4yJUY28vmr6+XxT2p6j3zUiQ7Q+auhxRekiCG
	svwRuL5oXtNs6mmKOkwKEGja40CaQLBkDJoJ8tBukiJ2fiDh49rVHZLsg35ffXCS
	xx7aNfa3/fxIAX8c2PjP/Mz3/YGW5sao08vR9ZXbLklk66d+EN8V29J3e+qADBTt
	FafDeA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq96ssb5c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 07:57:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8bbe16e0a34so468929985a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 23:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768550222; x=1769155022; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IKZPxasrpx3XmiuLkLHihcyRbciy0hG4GnVIT0h1kh4=;
        b=dljdT4GRd1Qb41xFsMuiN+r5AH89s8iV6Ls2OqGTS1jJQ+BqfkRKKx0MR85GN+TSds
         OG+8DaSrDxKUl/lrzvmQJM3EruyNka/kWB98qQ1ilO3BqtzUiarcKfgaBJAmVx+9rD5U
         WSVLbNwaWF4s/9W3QtsKXsaoETETvxsmBRjtS+ymxk7sfmcM/bHChc5hb4cWqApSMTyJ
         GXWIYwFA71JJLob2dKIcm2eiTIyWzDnhUummmm9OoFAiEs/R8SFGhCovuKfLizBhIQoQ
         NDmcUvapH0pNYwkoaOHUd3lnwRAuh51MbacnYUFsGlm6dTmjNQ0GVFz4+HLDg8PVD2Hc
         Bu9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768550222; x=1769155022;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IKZPxasrpx3XmiuLkLHihcyRbciy0hG4GnVIT0h1kh4=;
        b=YninYUkoMj5Ja8Rsc/eV+L75hHokFdTbNIia4UdSWYdOx6AivM6u6msZqtvFIl7RFD
         C+vPEW0e512BKxIAKosCBW2MZy7EQ7HRDYrvu2bxUtpyNVPB5ZXFuSc9baPqq1v6ut+o
         akHzHFYYQASrkb7Sg/obvrJf/3Lzz6l3UAT9MjFxihVbFLZOKekJAeJe1HF8r/bUBzJ+
         /1rAp4UKuCjMcLoZMVpJJN6hAcb/h8LKAaqJbPytThUeB0RJ/laU688DToiEDSFLLb5A
         jRNPzVpTvxatI+MwWDShaxrVufbzaijjVDcS2ZDoTAUM4Rk4NOw8zMVrO2rOl5J8DXy3
         m9wQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTdK2BhWp9O/qjX44N5IpqHQhsynE3THWLYb+7gHP6Akay0Axfw/TOoonPq0eRvix0C2xFCzbRZnk1Ual5@vger.kernel.org
X-Gm-Message-State: AOJu0Yx67jftZfyF/RS1Bu3IR7Wu025Vz4qxGf0PoaHoREgYj4Kvg+jn
	5ing7NFPraI9UgOOQOwEMA7Z8jUVjfFSjv+jCF8ZVJaPCdEcc9rIiVV+9kAt5nrgYtmEMjKc1/p
	OQkleZVRI14Z0HOqWaoLcAI1V3M0tD3YZcMNVHyhCJ1FEGUnVMJ91lZ1LJxlXshygaWnO
X-Gm-Gg: AY/fxX7x5YIIhF1lydSsSmRjEJVi2NR+XAPOqjneSIfO6f/hgeC6XT1dkjYVgbI+vBH
	KlS2miWhCQpxp8GOhDTqWQJzs13Nx6vhiK47YPCd5AXktfvApbQCfHTu9hD9n2Jh0MIZKGthHAp
	KceU2ZbsPDYCc09bsVVBJAZTortutsmU8eccpeuHf5GFn8tWtY/SMrIY4nbWNLuPnBp/yXOLwnz
	//7luIR0lsW/ebnpm657zyi5Fg/ynYsTlgdNjL0Ws8l/MGDTKwch7p7tCk801x7arkr+2e4nVI4
	lW3a69TC0SYUoq30qGXTFpV02AM1WCRnblf/BVSwNDAu4ofPYrlPkJ+mcBw7cvbe6WD3HSbXpyy
	B1WwT24VdMrlqmgQctv6Mii7o1supgWJPyjHihPgQUmZDa4UVm53TTa6ii98chfDozKNdKic/ZO
	6LwMvnih6+GvbafsqjjQYZpNk=
X-Received: by 2002:a05:620a:4081:b0:8b2:3484:8e22 with SMTP id af79cd13be357-8c57e68a4c5mr668693485a.0.1768550221669;
        Thu, 15 Jan 2026 23:57:01 -0800 (PST)
X-Received: by 2002:a05:620a:4081:b0:8b2:3484:8e22 with SMTP id af79cd13be357-8c57e68a4c5mr668692085a.0.1768550221222;
        Thu, 15 Jan 2026 23:57:01 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf39c12fsm521393e87.83.2026.01.15.23.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 23:57:00 -0800 (PST)
Date: Fri, 16 Jan 2026 09:56:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: tessolveupstream@gmail.com
Cc: Qian Zhang <qian.zhang@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 4/4] arm64: dts: qcom: talos-evk: Add support for
 QCS615 talos evk board
Message-ID: <ei3zvx47jubvgrz25pemfeu6zt5be6dduqpllp5qyhbhqblvnp@c2tqv7hyicii>
References: <20260109095221.2847067-1-tessolveupstream@gmail.com>
 <20260109095221.2847067-5-tessolveupstream@gmail.com>
 <3a4e0513-5b2d-4890-a4df-5306a694cf50@oss.qualcomm.com>
 <530e2a7b-52e4-4119-ad54-8ff9e1d4fec0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <530e2a7b-52e4-4119-ad54-8ff9e1d4fec0@gmail.com>
X-Authority-Analysis: v=2.4 cv=OYaVzxTY c=1 sm=1 tr=0 ts=6969ef4e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=7UAkoh5n_bSw09qp7oEA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 55i76l40ZDKfb636rueI7uCKKFgUzwaN
X-Proofpoint-GUID: 55i76l40ZDKfb636rueI7uCKKFgUzwaN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA1OSBTYWx0ZWRfX6AmryDoOWveE
 +WvlNGkJKH3/RgIDz68BJbip3nkGXi6gACeQEm6ETvXNdy+lWf3RzSIJTc1CauKKN7vICK56nKo
 kpEuQxK0zP5FilKLWddW5v+6oSjaNZSKb56TXCqMbwbPRNksbjP/uxgpy/1DPv1EeShan5UpcdY
 npQjYH4etlANPhmVqVKRF3qxkXmicarbn2R5zgBo+q+CUgIhZ/LYb+CXijOUa9XDvDUZhqMmMJf
 N73hfq835QK3YlFNxbgzrmL0jseVwpO5B1rb1hkTojT7R7mkEdh93WhKlQSK1sYBw6Utg3/Hy7D
 eLilKi3fmK/wzbJO6NTNXNGbQPR5ouiRU2O1uE/5vPSyCzCeBaxtQT1+ss965ed+9llMk/9TOmZ
 zNjtA7zOnYtPNWDhzbXHXcjAhvH+V2yTf8PQyZ6GopMIdQCO3URXYqWz0KhgbJg41q0a+Fyl364
 qxGlmfs+hhNlNpwEfuQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_02,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160059

On Fri, Jan 16, 2026 at 12:28:22PM +0530, tessolveupstream@gmail.com wrote:
> 
> 
> On 15-01-2026 18:47, Qian Zhang wrote:
> > 
> > 
> > On 1/9/2026 5:52 PM, Sudarshan Shetty wrote:
> >> Add the device tree for the QCS615-based Talos EVK platform. The
> >> platform is composed of a System-on-Module following the SMARC
> >> standard, and a Carrier Board.
> >>
> >> The Carrier Board supports several display configurations, HDMI and
> >> LVDS. Both configurations use the same base hardware, with the display
> >> selection controlled by a DIP switch.
> >>
> >> Use a DTBO file, talos-evk-lvds-auo,g133han01.dtso, which defines an
> >> overlay that disables HDMI and adds LVDS. The DTs file talos-evk
> >> can describe the HDMI display configurations.
> >>
> >> The initial device tree includes support for:
> >> - CPU and memory
> >> - UART
> >> - GPIOs
> >> - Regulators
> >> - PMIC
> >> - Early console
> >> - AT24MAC602 EEPROM
> >> - MCP2515 SPI to CAN
> >> - ADV7535 DSI-to-HDMI bridge
> >> - DisplayPort interface
> >> - SN65DSI84ZXHR DSI-to-LVDS bridge
> >> - Wi-Fi/BT
> >>
> >> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
> >> ---
> >>   arch/arm64/boot/dts/qcom/Makefile             |   4 +
> >>   .../qcom/talos-evk-lvds-auo,g133han01.dtso    | 126 ++++
> >>   arch/arm64/boot/dts/qcom/talos-evk-som.dtsi   | 616 ++++++++++++++++++
> >>   arch/arm64/boot/dts/qcom/talos-evk.dts        | 139 ++++
> >>   4 files changed, 885 insertions(+)
> >>   create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso
> >>   create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
> >>   create mode 100644 arch/arm64/boot/dts/qcom/talos-evk.dts
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> >> index 76cf0115a00a..289b651ef0c5 100644
> >> --- a/arch/arm64/boot/dts/qcom/Makefile
> >> +++ b/arch/arm64/boot/dts/qcom/Makefile
> >> @@ -324,6 +324,10 @@ dtb-$(CONFIG_ARCH_QCOM)    += sm8650-mtp.dtb
> >>   dtb-$(CONFIG_ARCH_QCOM)    += sm8650-qrd.dtb
> >>   dtb-$(CONFIG_ARCH_QCOM)    += sm8750-mtp.dtb
> >>   dtb-$(CONFIG_ARCH_QCOM)    += sm8750-qrd.dtb
> >> +dtb-$(CONFIG_ARCH_QCOM)    += talos-evk.dtb
> >> +talos-evk-lvds-auo,g133han01-dtbs    := \
> >> +    talos-evk.dtb talos-evk-lvds-auo,g133han01.dtbo
> >> +dtb-$(CONFIG_ARCH_QCOM)    += talos-evk-lvds-auo,g133han01.dtb
> >>   x1e001de-devkit-el2-dtbs    := x1e001de-devkit.dtb x1-el2.dtbo
> >>   dtb-$(CONFIG_ARCH_QCOM)    += x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
> >>   x1e78100-lenovo-thinkpad-t14s-el2-dtbs    := x1e78100-lenovo-thinkpad-t14s.dtb x1-el2.dtbo
> >> diff --git a/arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso b/arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso
> >> new file mode 100644
> >> index 000000000000..ad058cf4cd93
> >> --- /dev/null
> >> +++ b/arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso
> >> @@ -0,0 +1,126 @@
> >> +// SPDX-License-Identifier: BSD-3-Clause
> >> +/*
> >> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> >> + */
> >> +/dts-v1/;
> >> +/plugin/;
> >> +
> >> +#include <dt-bindings/gpio/gpio.h>
> >> +
> >> +&{/} {
> >> +    backlight: backlight {
> >> +        compatible = "gpio-backlight";
> >> +        gpios = <&tlmm 59 GPIO_ACTIVE_HIGH>,
> >> +            <&tlmm 115 GPIO_ACTIVE_HIGH>;
> >> +        default-on;
> >> +    };
> >> +
> >> +    panel-lvds {
> >> +        compatible = "auo,g133han01";
> >> +
> >> +        ports {
> >> +            #address-cells = <1>;
> >> +            #size-cells = <0>;
> >> +
> >> +            /* LVDS A (Odd pixels) */
> >> +            port@0 {
> >> +                reg = <0>;
> >> +                dual-lvds-odd-pixels;
> >> +
> >> +                lvds_panel_out_a: endpoint {
> >> +                    remote-endpoint = <&sn65dsi84_out_a>;
> >> +                };
> >> +            };
> >> +
> >> +            /* LVDS B (Even pixels) */
> >> +            port@1 {
> >> +                reg = <1>;
> >> +                dual-lvds-even-pixels;
> >> +
> >> +                lvds_panel_out_b: endpoint {
> >> +                    remote-endpoint = <&sn65dsi84_out_b>;
> >> +                };
> >> +            };
> >> +        };
> >> +    };
> >> +};
> >> +
> >> +&hdmi_connector {
> >> +    status = "disabled";
> >> +};
> >> +
> >> +&i2c1 {
> >> +    clock-frequency = <400000>;
> >> +
> >> +    status = "okay";
> >> +
> >> +    hdmi_bridge: bridge@3d {
> >> +        status = "disabled";
> >> +    };
> >> +
> >> +    lvds_bridge: bridge@2c {
> >> +        compatible = "ti,sn65dsi84";
> >> +        reg = <0x2c>;
> >> +        enable-gpios = <&tlmm 42 GPIO_ACTIVE_HIGH>;
> >> +        ti,dsi-lanes = <4>;
> >> +        ti,lvds-format = "jeida-24";
> >> +        ti,lvds-bpp = <24>;
> >> +
> >> +        ports {
> >> +            #address-cells = <1>;
> >> +            #size-cells = <0>;
> >> +
> >> +            port@0 {
> >> +                reg = <0>;
> >> +
> >> +                sn65dsi84_in: endpoint {
> >> +                    data-lanes = <1 2 3 4>;
> >> +                    remote-endpoint = <&mdss_dsi0_out>;
> >> +                };
> >> +            };
> >> +
> >> +            port@2 {
> >> +                reg = <2>;
> >> +
> >> +                sn65dsi84_out_a: endpoint {
> >> +                    data-lanes = <1 2 3 4>;
> >> +                    remote-endpoint = <&lvds_panel_out_a>;
> >> +                };
> >> +            };
> >> +
> >> +            port@3 {
> >> +                reg = <3>;
> >> +
> >> +                sn65dsi84_out_b: endpoint {
> >> +                    data-lanes = <1 2 3 4>;
> >> +                    remote-endpoint = <&lvds_panel_out_b>;
> >> +                };
> >> +            };
> >> +        };
> >> +    };
> >> +};
> >> +
> >> +&mdss_dsi0 {
> >> +    vdda-supply = <&vreg_l11a>;
> >> +
> >> +    status = "okay";
> >> +};
> >> +
> >> +&mdss_dsi0_out {
> >> +    remote-endpoint = <&sn65dsi84_in>;
> >> +    data-lanes = <0 1 2 3>;
> >> +};
> >> +
> >> +&tlmm {
> >> +    lcd_bklt_en: lcd-bklt-en-state {
> >> +        pins = "gpio115";
> >> +        function = "gpio";
> >> +        bias-disable;
> >> +    };
> >> +
> >> +    lcd_bklt_pwm: lcd-bklt-pwm-state {
> >> +        pins = "gpio59";
> >> +        function = "gpio";
> >> +        bias-disable;
> >> +    };
> >> +};
> >> diff --git a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
> >> new file mode 100644
> >> index 000000000000..95ed335bcb08
> >> --- /dev/null
> >> +++ b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
> >> @@ -0,0 +1,616 @@
> >> +// SPDX-License-Identifier: BSD-3-Clause
> >> +/*
> >> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> >> + */
> >> +/dts-v1/;
> >> +
> >> +#include <dt-bindings/gpio/gpio.h>
> >> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> >> +#include "talos.dtsi"
> >> +#include "pm8150.dtsi"
> >> +/ {
> >> +    aliases {
> >> +        mmc0 = &sdhc_1;
> >> +        serial0 = &uart0;
> >> +        serial1 = &uart7;
> >> +    };
> >> +
> >> +    chosen {
> >> +        stdout-path = "serial0:115200n8";
> >> +    };
> >> +
> >> +    clocks {
> >> +        can_osc: can-oscillator {
> >> +            compatible = "fixed-clock";
> >> +            clock-frequency = <20000000>;
> >> +            #clock-cells = <0>;
> >> +        };
> >> +
> >> +        sleep_clk: sleep-clk {
> >> +            compatible = "fixed-clock";
> >> +            clock-frequency = <32764>;
> >> +            #clock-cells = <0>;
> >> +        };
> >> +
> >> +        xo_board_clk: xo-board-clk {
> >> +            compatible = "fixed-clock";
> >> +            clock-frequency = <38400000>;
> >> +            #clock-cells = <0>;
> >> +        };
> >> +    };
> >> +
> >> +    regulator-usb2-vbus {
> >> +        compatible = "regulator-fixed";
> >> +        regulator-name = "USB2_VBUS";
> >> +        gpio = <&pm8150_gpios 10 GPIO_ACTIVE_HIGH>;
> >> +        pinctrl-0 = <&usb2_en>;
> >> +        pinctrl-names = "default";
> >> +        enable-active-high;
> >> +        regulator-always-on;
> >> +    };
> >> +
> >> +    vreg_conn_1p8: regulator-conn-1p8 {
> >> +        compatible = "regulator-fixed";
> >> +        regulator-name = "vreg_conn_1p8";
> >> +        startup-delay-us = <4000>;
> >> +        enable-active-high;
> >> +        gpio = <&pm8150_gpios 1 GPIO_ACTIVE_HIGH>;
> >> +    };
> >> +
> >> +    vreg_conn_pa: regulator-conn-pa {
> >> +        compatible = "regulator-fixed";
> >> +        regulator-name = "vreg_conn_pa";
> >> +        startup-delay-us = <4000>;
> >> +        enable-active-high;
> >> +        gpio = <&pm8150_gpios 6 GPIO_ACTIVE_HIGH>;
> >> +    };
> >> +
> >> +    vreg_v3p3_can: regulator-v3p3-can {
> >> +        compatible = "regulator-fixed";
> >> +        regulator-name = "vreg-v3p3-can";
> >> +        regulator-min-microvolt = <3300000>;
> >> +        regulator-max-microvolt = <3300000>;
> >> +        regulator-boot-on;
> >> +        regulator-always-on;
> >> +    };
> >> +
> >> +    vreg_v5p0_can: regulator-v5p0-can {
> >> +        compatible = "regulator-fixed";
> >> +        regulator-name = "vreg-v5p0-can";
> >> +        regulator-min-microvolt = <5000000>;
> >> +        regulator-max-microvolt = <5000000>;
> >> +        regulator-boot-on;
> >> +        regulator-always-on;
> >> +    };
> >> +
> >> +    wcn6855-pmu {
> >> +        compatible = "qcom,wcn6855-pmu";
> >> +
> >> +        pinctrl-0 = <&bt_en_state>, <&wlan_en_state>;
> >> +        pinctrl-names = "default";
> >> +
> >> +        bt-enable-gpios = <&tlmm 85 GPIO_ACTIVE_HIGH>;
> >> +        wlan-enable-gpios = <&tlmm 84 GPIO_ACTIVE_HIGH>;
> >> +
> >> +        vddio-supply = <&vreg_conn_pa>;
> >> +        vddaon-supply = <&vreg_s5a>;
> >> +        vddpmu-supply = <&vreg_conn_1p8>;
> >> +        vddpmumx-supply = <&vreg_conn_1p8>;
> >> +        vddpmucx-supply = <&vreg_conn_pa>;
> >> +        vddrfa0p95-supply = <&vreg_s5a>;
> >> +        vddrfa1p3-supply = <&vreg_s6a>;
> >> +        vddrfa1p9-supply = <&vreg_l15a>;
> >> +        vddpcie1p3-supply = <&vreg_s6a>;
> >> +        vddpcie1p9-supply = <&vreg_l15a>;
> >> +
> >> +        regulators {
> >> +            vreg_pmu_rfa_cmn: ldo0 {
> >> +                regulator-name = "vreg_pmu_rfa_cmn";
> >> +            };
> >> +
> >> +            vreg_pmu_aon_0p59: ldo1 {
> >> +                regulator-name = "vreg_pmu_aon_0p59";
> >> +            };
> >> +
> >> +            vreg_pmu_wlcx_0p8: ldo2 {
> >> +                regulator-name = "vreg_pmu_wlcx_0p8";
> >> +            };
> >> +
> >> +            vreg_pmu_wlmx_0p85: ldo3 {
> >> +                regulator-name = "vreg_pmu_wlmx_0p85";
> >> +            };
> >> +
> >> +            vreg_pmu_btcmx_0p85: ldo4 {
> >> +                regulator-name = "vreg_pmu_btcmx_0p85";
> >> +            };
> >> +
> >> +            vreg_pmu_rfa_0p8: ldo5 {
> >> +                regulator-name = "vreg_pmu_rfa_0p8";
> >> +            };
> >> +
> >> +            vreg_pmu_rfa_1p2: ldo6 {
> >> +                regulator-name = "vreg_pmu_rfa_1p2";
> >> +            };
> >> +
> >> +            vreg_pmu_rfa_1p7: ldo7 {
> >> +                regulator-name = "vreg_pmu_rfa_1p7";
> >> +            };
> >> +
> >> +            vreg_pmu_pcie_0p9: ldo8 {
> >> +                regulator-name = "vreg_pmu_pcie_0p9";
> >> +            };
> >> +
> >> +            vreg_pmu_pcie_1p8: ldo9 {
> >> +                regulator-name = "vreg_pmu_pcie_1p8";
> >> +            };
> >> +        };
> >> +    };
> >> +
> >> +    wifi_1p8v: regulator-wifi-1p8v {
> >> +        compatible = "regulator-fixed";
> >> +        regulator-name = "wifi_1p8v";
> >> +        regulator-min-microvolt = <1800000>;
> >> +        regulator-max-microvolt = <1800000>;
> >> +        gpio = <&tlmm 91 GPIO_ACTIVE_HIGH>;
> > Please check this pin number
> >> +        enable-active-high;
> >> +        pinctrl-0 = <&wifi_reg_en_pins_state>;
> >> +        pinctrl-names = "default";
> >> +        regulator-boot-on;
> >> +        regulator-always-on;
> >> +    };
> >> +
> >> +    wifi_3p85v: regulator-wifi-3p85v {
> >> +        compatible = "regulator-fixed";
> >> +        regulator-name = "wifi_3p85v";
> >> +        regulator-min-microvolt = <3850000>;
> >> +        regulator-max-microvolt = <3850000>;
> >> +        gpio = <&tlmm 91 GPIO_ACTIVE_HIGH>;
> > Please check this pin number
> >> +        enable-active-high;
> >> +        pinctrl-0 = <&wifi_reg_en_pins_state>;
> >> +        pinctrl-names = "default";
> >> +        regulator-boot-on;
> >> +        regulator-always-on;
> >> +    };
> >> +};
> > 
> > Are these two node necessary?
> >
> 
> On this board, GPIO91 is wired as a common enable for both WiFi 
> power rails: WiFi 1.8V and WiFi 3.85V.
> I currently modeled them as two regulator-fixed nodes because these 
> are two distinct rails.
> Would you prefer modelling a single regulator node that controls the 
> shared GPIO as below:
> 
> wifi_en: regulator-wifi-en {
>     compatible = "regulator-fixed";
>     regulator-name = "wifi_en";
>     gpio = <&tlmm 91 GPIO_ACTIVE_HIGH>;
>     enable-active-high;
>     pinctrl-0 = <&wifi_reg_en_pins_state>;
>     pinctrl-names = "default";
>     regulator-boot-on;
>     regulator-always-on;
> };

What is the voltage of this regulator? What does it represent? What
should be represented in the DT?

BTW: what is powered on by those regulators? I don't see them being
wired to the PMU.

-- 
With best wishes
Dmitry

