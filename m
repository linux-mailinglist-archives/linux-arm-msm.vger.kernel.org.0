Return-Path: <linux-arm-msm+bounces-88399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE61D0F77C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Jan 2026 17:50:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7AAFF30186B9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Jan 2026 16:50:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B95ED34CFB4;
	Sun, 11 Jan 2026 16:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JGRN0Yy5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d05+K+su"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C965E38D
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 16:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768150229; cv=none; b=VZ3ONEjCY9VyQluslvms5hl2H6YrPBTzWc9Xnnfag1p0Ply2VXnb15HItAPBmhKxg+JKrNPnIUjQQrxxvEH3mi2Iro4IGvNe8zr7RMG9BN+AIYIWJKx5+ppLUHe4zHo6g05mDbEhzy2+hRrhg33ZjUzj860ENjnWeaE/zwuFUz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768150229; c=relaxed/simple;
	bh=4NxPxoCZvpiVAPZppmK3orfq5RwI/4SOA48oKsTZlgw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H7Mfxde8aZdn1Uvkv0MXnyJX6AMf/pLIFlGYHVhTMDiV2G29tQTBoKbl7k3r/vfxwE6qySgFu0ECV3bhV2XvxXvMk5yMv5xbyzVodzua7UfeKbx8i9iOoCbfmqDuqM2mdcOPPeP1ItASQ/kDoYmolmWYRW7t2GgNvqqQYwDL3FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JGRN0Yy5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d05+K+su; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BAvcfU1636136
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 16:50:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rRk4AbUOzi+/H5CTJqOkDCLC
	SDPusl2C5U2GZhOe9qg=; b=JGRN0Yy5nb+gE8B9yntwWSBE+OFpw2kVVNwyWG3s
	/5cWfyN5ENpcSaCW+2nmKjstqnowVQK+SN5UuQBVGs/JIIA876nL9uMvCyOJnKre
	wXKJriwAoOGZcpagcTPnDpTO3IMu+lb9+AoDwflytKkqDuBxD7imGLC91fMHD14I
	HSP2+B84W1QR0Bf95KlIPEZHSZzZfbGw6GGoTxJfq+Vkg6ziUeAUkMfhSncNgYWx
	hq7i7k+X/nWEjU7PRjEX9zhxhaFSS6uikyfGLpHk1c6zbXDvaLVt6rUSeVDtqEAp
	hhyU5TYMYt6LRjurlh8+7q76cMqIDsJgW6kUNi5uHCJXMA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkmem1y8c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 16:50:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c277fe676eso1743814985a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 08:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768150225; x=1768755025; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rRk4AbUOzi+/H5CTJqOkDCLCSDPusl2C5U2GZhOe9qg=;
        b=d05+K+suRICr+0u2LKGKxgf9KlzY8xKXmeQFhPI/BeMNYaMMZSH8oK82l6XCfxP8UB
         DXdL1YzUP8BOElydE8/hrGhJZJJMjCYAXl++3dUNIP15R/9tnZ3em8mPivbmC717AuMW
         MKCBprGiNuppIk/6NL2z9b1c/wQ1xNdqhRV6nCYDuxT0aafT77wj+lUUQS9hecQiaPRW
         xxVM/U7sUq0ABKho/WFNaE+Aa1Xp+F0JgV0Y+g/HwZw3YsPUfkLeqWBe3T3nwKKyYCmE
         OiWfUKZgHADhzQfCHS+f96exhpRQEwa3vbUK96iRs0hSQ3GyzTKh0qYu6fS2//o/4fqe
         ioQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768150225; x=1768755025;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rRk4AbUOzi+/H5CTJqOkDCLCSDPusl2C5U2GZhOe9qg=;
        b=MMGQhlVsTw160nsQiY6tU59UNJ6IfGkX+BX5dIdGnjNRd8K8P/LnLaym/NOj1PV+lC
         imZs4rxNgRStzNklnxNvQ0dq54URVj6LuEHXDK+qrjI4wsViT5eS9qw6EnU45UDZwXRd
         PeKD10TVso7kxR5Yz6TqmJb/aYgqdmUAN7mTH1m+HVJaVbv+iFhCkc9vGhGO85QB7XSK
         okzVodBFp2O1ZYwtNDmpomv9yIBsZ9AvRL2RMR+t3t8C9SSKz9u6YdW8NlW7+wKQda01
         roLagFvLoIqa/EgUFeFafdkYM+koudP2n7X3r+PPHLxZTehXcSw0N36MUHc3+FqEB7hA
         m4wg==
X-Forwarded-Encrypted: i=1; AJvYcCWn++tn+H74wSPGxO2d9wcgYBJkwePrNMGB2Ox4CCP8n+HhiL39K6stbjk4fpT6bk99uEbwUJBnA6eweAET@vger.kernel.org
X-Gm-Message-State: AOJu0YyUVNzAujyNB/sxVdqjxZi2sxOdJhkgtuSVu5bSgo37sf+/jjhu
	G39C9FNB3EsE71YrfbxAcixCF2RNblPEH1nLWinCNpphs0lLuxFK86AmwHV9/tgiQtaYdTCqrCz
	qIVBsqyxSnXaocVIVreLGIWg1MFeYy74x1szpm+3+F2v8zJ58iviGF6jis1pnMzW2xTTE
X-Gm-Gg: AY/fxX7WcnDM5DlOQsdmBSo0+Sh5OnT8KMv7C7kEjBZgylKxlAQbFHs06qS0Ic7n87y
	E2+pake5+/GLcSjBsJ11WRZZgdoofpLZQkfb47VbSIxfHc8bOC48I4HAIP1dOncZlsbl++8uZ0n
	4ibKLY1mEVwvBIHHI7mC5tvAxmO6xEiugbnBgeh7bpJPPBoWAuu9nA67XGzL7h3l24GUHuzPOaV
	MedNQjt/URjxzIZ+G4vL4Ng3q+wNqbLCdXbTi7kbjJvstOWaE1TN8jXQNGe6sf8MoBhVnyKb+tF
	3Vfs1Uqg0NJnTT4Q7k1wt2su2tFQbz8zzHxINxqdDfQK+t2VwHLb6coK8arJG9/q4687MhPVNfV
	otZE9Sa0pVrIUFvteLOUcNLDVfxUGQkMKU9OnpD/fLNNJ6WpCcjfsJ95uLnQOyJ5cXw5ihcwiHC
	fikMkYJkF03ulPwkp9IYmy4ig=
X-Received: by 2002:a05:620a:4541:b0:8b2:1f21:ccdf with SMTP id af79cd13be357-8c38940926emr2420541785a.48.1768150224962;
        Sun, 11 Jan 2026 08:50:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHvHmufj8RuP6pen0dCkA23Ia2CNyV/3pStMiOsRosk+htDAAXr91AD/6+scyZ7QK1uTMEDoA==
X-Received: by 2002:a05:620a:4541:b0:8b2:1f21:ccdf with SMTP id af79cd13be357-8c38940926emr2420539385a.48.1768150224532;
        Sun, 11 Jan 2026 08:50:24 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b66697eaesm4191538e87.53.2026.01.11.08.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 08:50:23 -0800 (PST)
Date: Sun, 11 Jan 2026 18:50:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: qcom: Add support for ECS LIVA QC710
Message-ID: <wyqml5ywfzwh3uulp4gzlfzx24kb2545w36pkpnz5g27xtnqoi@yywysi37tdor>
References: <20260111085726.634091-2-val@packett.cool>
 <20260111085726.634091-6-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260111085726.634091-6-val@packett.cool>
X-Proofpoint-GUID: Ge0VXT9GleWSZmycziffSzZuFPu48sUg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTExMDE1NiBTYWx0ZWRfXw3/EntJ3cvYs
 W3jGExdjry02sAZHnUhBLdLh7/q5XyR89PWETPgKSrmzbdxqEo37WDg5dyXlWyNtU4uN1TZJ+lI
 aNnGASr+SSl/kRS906C6muDAvNZ9FryXdr9J5I/FHgW6TnLL4LWd0VgXJBAavrMXVrk06ewyEjc
 /ZfACe/gVvCzXgcnIABRgiIIyxYB8/Iux8H6/WMeo/2FyViFK2CTecjqHW8gENcJYpanX1RahTH
 PKvv74eIaOkKqaq/dbzZbxf74TsRb2N/tz/f2RXxJy3C7/5/m8hAvqg5pQlSGchUlPjMA2N0GVn
 vsn/O5FM8xJhOkOQ0Z0t/yrCmi0B0uXlUWwewHgR6rN7pV+KjFG4GrA+1fzrM6VxsIOoIOjF3yI
 DHYBZdNmf26VEVrroLfptgqnCl0KOleNG8cs4BbrMgTMJsNvyTvapJ80MIjdHLFtvxnFtNjZFE/
 ckdbl8QxmyZoQH1sw0g==
X-Authority-Analysis: v=2.4 cv=Z7zh3XRA c=1 sm=1 tr=0 ts=6963d4d1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=UWtPkuyo7FYnxAHutw4A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Ge0VXT9GleWSZmycziffSzZuFPu48sUg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601110156

On Sun, Jan 11, 2026 at 05:35:12AM -0300, Val Packett wrote:
> Add a device tree for the ECS LIVA QC710 (Snapdragon 7c) mini PC/devkit.
> 
> Working:
> - Wi-Fi (wcn3990 hw1.0)
> - Bluetooth
> - USB Type-A (USB3 and USB2)
> - Ethernet (over USB2)
> - HDMI Display
> - eMMC
> - SDHC (microSD slot)
> 
> Not included:
> - HDMI Audio
> - EC (IT8987)
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   2 +
>  .../boot/dts/qcom/sc7180-ecs-liva-qc710.dts   | 625 ++++++++++++++++++
>  2 files changed, 627 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-ecs-liva-qc710.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 0ccd6ec16dfb..27a2dbb2f11c 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -163,6 +163,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sa8775p-ride.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sa8775p-ride-r3.dtb
>  sc7180-acer-aspire1-el2-dtbs	:= sc7180-acer-aspire1.dtb sc7180-el2.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-acer-aspire1.dtb sc7180-acer-aspire1-el2.dtb
> +sc7180-ecs-liva-qc710-el2-dtbs	:= sc7180-ecs-liva-qc710.dtb sc7180-el2.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-ecs-liva-qc710.dtb sc7180-ecs-liva-qc710-el2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-idp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-coachz-r1.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-coachz-r1-lte.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-ecs-liva-qc710.dts b/arch/arm64/boot/dts/qcom/sc7180-ecs-liva-qc710.dts
> new file mode 100644
> index 000000000000..692085bc6169
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc7180-ecs-liva-qc710.dts
> @@ -0,0 +1,625 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/sound/qcom,q6asm.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +
> +#include "sc7180.dtsi"
> +
> +#include "pm6150.dtsi"
> +#include "pm6150l.dtsi"
> +
> +/delete-node/ &tz_mem;
> +/delete-node/ &ipa_fw_mem;
> +
> +/ {
> +	model = "ECS LIVA QC710";
> +	compatible = "ecs,liva-qc710", "qcom,sc7180";
> +	chassis-type = "desktop";
> +
> +	aliases {
> +		bluetooth0 = &bluetooth;
> +		hsuart0 = &uart3;
> +		wifi0 = &wifi;
> +	};
> +
> +	hdmi-bridge {
> +		compatible = "algoltek,ag6311";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				hdmi_bridge_dp_in: endpoint {
> +					remote-endpoint = <&usb_1_qmpphy_dp_out>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				hdmi_bridge_tmds_out: endpoint {
> +					remote-endpoint = <&hdmi_con>;
> +				};
> +			};
> +		};
> +	};
> +
> +	hdmi-connector {
> +		compatible = "hdmi-connector";
> +		type = "a";
> +
> +		port {
> +			hdmi_con: endpoint {
> +				remote-endpoint = <&hdmi_bridge_tmds_out>;
> +			};
> +		};
> +	};
> +
> +	reserved-memory {
> +		gpu_mem: zap-shader@80840000 {
> +			reg = <0x0 0x80840000 0 0x2000>;
> +			no-map;
> +		};
> +
> +		venus_mem: venus@85b00000 {
> +			reg = <0x0 0x85b00000 0 0x500000>;
> +			no-map;
> +		};
> +
> +		mpss_mem: mpss@86000000 {
> +			reg = <0x0 0x86000000 0x0 0x2000000>;
> +			no-map;
> +		};
> +
> +		adsp_mem: adsp@8e400000 {
> +			reg = <0x0 0x8e400000 0x0 0x2800000>;
> +			no-map;
> +		};
> +
> +		wlan_mem: wlan@93900000 {
> +			reg = <0x0 0x93900000 0x0 0x200000>;
> +			no-map;
> +		};
> +	};
> +
> +	usb_a_connector: usb-a-connector {
> +		compatible = "usb-a-connector";
> +
> +		port {
> +			usb_a_connector_ss_in: endpoint {
> +				remote-endpoint = <&usb_1_qmpphy_usb_ss_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&dpu_intf1_out {
> +	/delete-property/ remote-endpoint;

Why? It should not be necessary.

> +};
> +
> +&gpu {
> +	status = "okay";
> +};
> +
> +&gpu_zap_shader {
> +	firmware-name = "qcom/sc7180/ecs/liva-qc710/qcdxkmsuc7180.mbn";
> +};
> +
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_dp {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&dp_hot_plug_det>;
> +
> +	status = "okay";
> +};
> +
> +&mdss_dp_out {
> +	data-lanes = <0 1>;
> +	remote-endpoint = <&usb_1_qmpphy_dp_in>;

Ack for now. Probably we should make it a default and (temporarily)
delete in the Chrome setup.

> +};
> +
> +&mdss_dsi0_in {
> +	/delete-property/ remote-endpoint;
> +};
> +
> +&pm6150_pon {
> +	status = "disabled";

Do you know, how is Power-On routed?

> +};
> +
> +&pm6150_rtc {
> +	status = "okay";

No need for qcom,uefi-rtc-info ?

> +};
> +
> +&qfprom {
> +	vcc-supply = <&vreg_l11a_1p8>;
> +};
> +
> +&qupv3_id_0 {
> +	status = "okay";
> +};
> +
> +&qupv3_id_1 {
> +	status = "okay";
> +};
> +
> +&remoteproc_adsp {
> +	memory-region = <&adsp_mem>;
> +	firmware-name = "qcom/sc7180/ecs/liva-qc710/qcadsp7180.mbn";
> +	status = "okay";
> +};
> +
> +&remoteproc_mpss {
> +	firmware-name = "qcom/sc7180/ecs/liva-qc710/qcmpss7180_nm.mbn";
> +	status = "okay";
> +};
> +
> +&sdhc_1 {
> +	pinctrl-0 = <&sdc1_default>;
> +	pinctrl-1 = <&sdc1_sleep>;
> +	pinctrl-names = "default", "sleep";
> +	vmmc-supply = <&vreg_l19a_2p9>;
> +	vqmmc-supply = <&vreg_l12a_1p8>;
> +
> +	status = "okay";
> +};
> +
> +&sdhc_2 {
> +	pinctrl-0 = <&sdc2_default>;
> +	pinctrl-1 = <&sdc2_sleep>;
> +	pinctrl-names = "default", "sleep";
> +	vmmc-supply = <&vreg_l9c_2p9>;
> +	vqmmc-supply = <&vreg_l6c_2p9>;
> +
> +	cd-gpios = <&tlmm 69 GPIO_ACTIVE_LOW>;
> +
> +	status = "okay";
> +};
> +
> +&uart3 {
> +	/delete-property/ interrupts;
> +	interrupts-extended = <&intc GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>,
> +			      <&tlmm 41 IRQ_TYPE_EDGE_FALLING>;
> +
> +	pinctrl-1 = <&qup_uart3_sleep>;
> +	pinctrl-names = "default", "sleep";
> +
> +	status = "okay";
> +
> +	bluetooth: bluetooth {
> +		compatible = "qcom,wcn3991-bt";
> +		vddio-supply = <&vreg_l10a_1p8>;
> +		vddxo-supply = <&vreg_l1c_1p8>;
> +		vddrf-supply = <&vreg_l2c_1p3>;
> +		vddch0-supply = <&vreg_l10c_3p3>;
> +		max-speed = <3200000>;
> +	};
> +};
> +
> +&usb_1 {
> +	status = "okay";
> +};
> +
> +&usb_1_dwc3 {
> +	dr_mode = "host";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	hub@1 {
> +		compatible = "usb5e3,608";
> +		reg = <1>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +

Are other ports routed somehow?

> +		r8152: ethernet@4 {
> +			compatible = "usbbda,8152";
> +			reg = <4>;
> +		};
> +	};
> +};
> +

-- 
With best wishes
Dmitry

