Return-Path: <linux-arm-msm+bounces-78959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EE6C0EA2A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 15:55:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2461F4F0859
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 14:51:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5361E21C9E1;
	Mon, 27 Oct 2025 14:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lpOgYQKZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB44D25A62E
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 14:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761576681; cv=none; b=aj9H7tnB/+xMu3GdJGAuQb0hhCys1en/AchOJBVDk238F6U6o0pSZNagMic6poaS4WuXAaPLEApHOHd4f75CTwvzIL6ZmMdNaRfOUlXbfFb/Ln3Jr3cqcWMTbbMERQq/rFQnwglig4tz7FzY2xWvD3rK4Dcsd4Dq9wWipLPlPvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761576681; c=relaxed/simple;
	bh=w2scIzCJawUHdhTEiz3a1p5JgeVvgpY7OgJxfOYUwks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sO4U4D0E49Oen5DpclaSmJ1HbOC+Crzk39lcj5EbWycre01g7duWddYr1scV+BSuoaEqmsw+FA7wf9/+BZpUXGCSR6NZkfZ3bExqOXJ7a9flYCg+Ttf952oWzg7OBWec/2HdaLkUnTFp7fWixOVpnpcoTcl4KNCzx+uaGv0aiHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lpOgYQKZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R8VuN61049326
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 14:51:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=f4DqxtuN9nlhxgCUOC0DnLP2
	/8uuFvaIdVhxdAYsyKs=; b=lpOgYQKZTRYOzZ27lIz8PA+NFuG2L/ERr9g3C2sD
	jCqtFkUlxkPPT4BZ2SkjLoGKYmgwLCaLJAsDT9VpMaAt01MaoRVl29kpamkpyLCB
	hM7MEE4fNwCsGw4wG163OEp6/YUGBk27a7k60tmOxA7yP4e6LdMpove5rJSe0fVu
	mwF9RaOnb5SwDmFxXjKOD8VVu00w3mMtzp6hCw9JOZe0SjB98tx3ZoJjTcokeZSN
	u3+GEj/rW9ICZ89JfxIJAPJNqozTzyqO8cJXMTFENFIdVn0QGSAImQe8RPQyHfVF
	yV/qcbm7uC7y3LjbNemsWNaknemXB5J74W1NH654HaRNdQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0ps14ydu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 14:51:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4eb7853480dso153081271cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 07:51:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761576677; x=1762181477;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f4DqxtuN9nlhxgCUOC0DnLP2/8uuFvaIdVhxdAYsyKs=;
        b=dfpMOIjLMhjps+vKgNXYjw0ZRftqV/DjmlUDKVMQSAHpmXo4j1rAeXla9AxBvd8cIB
         Qx1d+4sDZhFN6cTQD1xeWpPFEkTB0eTuQrMGm89B+8AhfCq1DmZyCWFhAOsxYSnG9Zdq
         WflVwsWMspBJuXESZ7VUfr4FC1RqBQDUgj2DdjV5LuaUE2/tcDUc+u34E+Z/yXHLo+L0
         VbjzvNx2rXVcNz7tjB9G7TPzc/2nESU+C5qbQx2sAGQz5JIOl37zSr4Lk/dVZBBQNg0F
         e5QxyAJ6aBBOlSawr+P47yuDFJgseLasCsJAq7/aPw3ZXgvQqZUxeK+9clKS7jBBh1eq
         ZxbA==
X-Gm-Message-State: AOJu0Yx41dV6bO+R/rv/+jmZXTRz0u4UU978m2EF9wmnMWqzk+0Da0Nt
	cWpVjwXU0StTVEiJ1WiPgzQaa8sAywrad7vxgvCMzhsBFwoL9Jzqr4q4ViNAAHI0aZOBwyy+g30
	ns/S+CP8gQ6Dz2NQF1/gw6nSnlnq0ADowkgkXyTHNkeTaZLVQtUue4GA/23uOZ2ZGtWGb
X-Gm-Gg: ASbGncvJPU49kLIQG9zDNGxsJLz8C6sMZqfOeZqHwtxyyEHzAQQT5iv1eVHHStkGyHQ
	LUzxPvxJCkTJpEFeTSYyZd65fzPX5nAx0gsXl6ydS0N8xvWFM4xJw5615mc3H5grUUXEmXVPhJe
	n1zgudzgiaKOT9i596ce5TEYE8B9Xul95uAHrox9Njc1A/XvBbPuUKrY1deZypC9QG/zSuD4+RO
	BZBiMuJInpN1mpFk4+nUVMCxap2ghyKvuSTWAVDhtSrJXPwIJmj9ErWwzn5Nr7if1QukEljcQTL
	dCItRuT7ekkFDFA+SWRUrcnD3Jaw+L6jiAR+hx/kjhohEyPFO0xTQD5vTFlEUDrOxswcNDjpslk
	PKKl/IkxBw4qyOYQf7M4Fz3+NVNfVK/hNda8fD/Gkj7kQBcoAs1XzHfcRcvv2VqYWsact0ir3rY
	WIgSlS6r7Zejvc
X-Received: by 2002:a05:622a:cb:b0:4eb:a27b:b47c with SMTP id d75a77b69052e-4ed076028acmr2878981cf.80.1761576676466;
        Mon, 27 Oct 2025 07:51:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlMttULBlexQROsEf8h+hpEsiCRPrlAI+P0elBhvYiejQgn/UXLvELwdyL0v1fyWdDyurnFQ==
X-Received: by 2002:a05:622a:cb:b0:4eb:a27b:b47c with SMTP id d75a77b69052e-4ed076028acmr2878461cf.80.1761576675753;
        Mon, 27 Oct 2025 07:51:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f840dfsm2348877e87.104.2025.10.27.07.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 07:51:15 -0700 (PDT)
Date: Mon, 27 Oct 2025 16:51:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Cc: linux-arm-msm@vger.kernel.org, casey.connolly@linaro.org,
        christopher.obbard@linaro.org, loic.minier@oss.qualcomm.com,
        andersson@kernel.org, Roger Shimizu <rosh@debian.org>
Subject: Re: [PATCH v5 1/2] arm64: dts: qcom: rubikpi3: Add qcs6490-rubikpi3
 board dts
Message-ID: <4krvjztwy56ycnbrynz2ok4hs2vwehdg4ta7rdueccgn3hgvqp@sgxqw4pvoq3j>
References: <20251025122724.633766-1-hongyang.zhao@thundersoft.com>
 <20251025122724.633766-2-hongyang.zhao@thundersoft.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251025122724.633766-2-hongyang.zhao@thundersoft.com>
X-Authority-Analysis: v=2.4 cv=Ju78bc4C c=1 sm=1 tr=0 ts=68ff86e5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Wdb1h0LgAAAA:8 a=xNf9USuDAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=mUsOkUbQHfOfVwKEXoEA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=j5gyrzqu0rbr1vhfHjzO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 0NwfBBrr81n2AxChnBxSWjBxcrxDdoh3
X-Proofpoint-GUID: 0NwfBBrr81n2AxChnBxSWjBxcrxDdoh3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDEzNyBTYWx0ZWRfX3fDX+GVvcqTm
 nwomAwUymsB+yoEB0t6QNECbFcwqkP7/8Zww5HAyH3odrknYoF5xU5ono9pzlebXiaJZix4Yjha
 SHBIqKF5rVYaQ00ZeRI3izTE8oSShpxbJllRvSGVcRbCb2bMfaBxIx6ZtnIPxqH84eT/skMqpX2
 nQ2ZFtLUkZIJp8DpSgEVYne+u5LSeOzS4R9mcBitirx0DZ9d2FksHP65xvlKPNdQ8omJSk+P4re
 9MBGJ5KwCBFmQlRZFtBH+xFKAnpGEixBlZb844cfmhav4sDLqFi2rphxpkG+bm+c4HK0gkBwji2
 AAya6Qdm9qnhfG6eUXGff4kxLOizhgf3V9C/fShiuWml0QSQjYI/NtVgILGS2S17uVi35Ek3oWt
 +AyXpG5URHJmXCOG92A+C1qsXBheJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_06,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270137

On Sat, Oct 25, 2025 at 08:27:22PM +0800, Hongyang Zhao wrote:
> Add DTS for Thundercomm qcs6490-rubikpi3 board which uses
> QCS6490 SoC.
> 
> Works:
> - Bluetooth (AP6256)
> - Wi-Fi (AP6256)
> - Ethernet (AX88179B connected to UPD720201)
> - FAN
> - Two USB Type-A 3.0 ports (UPD720201 connected to PCIe0)
> - M.2 M-Key 2280 PCIe 3.0
> - RTC
> - USB Type-C
> - USB Type-A 2.0 port
> - 40PIN: I2C x1, UART x1
> 
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> Reviewed-by: Roger Shimizu <rosh@debian.org>
> Cc: Casey Connolly <casey.connolly@linaro.org>
> Cc: Christopher Obbard <christopher.obbard@linaro.org>
> Cc: Loic Minier <loic.minier@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |    1 +
>  .../dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 1390 +++++++++++++++++
>  2 files changed, 1391 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 296688f7cb26..74938791f62d 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -133,6 +133,7 @@ qcs6490-rb3gen2-industrial-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2
>  
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-industrial-mezzanine.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-vision-mezzanine.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-thundercomm-rubikpi3.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
> new file mode 100644
> index 000000000000..e08c2afbf849
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
> @@ -0,0 +1,1390 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2025, Thundercomm All rights reserved.
> + */
> +
> +/dts-v1/;
> +
> +/* PM7250B is configured to use SID8/9 */
> +#define PM7250B_SID 8
> +#define PM7250B_SID1 9
> +
> +#include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
> +#include <dt-bindings/iio/qcom,spmi-adc7-pm7325.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include "sc7280.dtsi"
> +#include "pm7250b.dtsi"
> +#include "pm7325.dtsi"
> +#include "pm8350c.dtsi"
> +#include "pmk8350.dtsi"
> +
> +/delete-node/ &adsp_mem;
> +/delete-node/ &cdsp_mem;
> +/delete-node/ &ipa_fw_mem;
> +/delete-node/ &mpss_mem;
> +/delete-node/ &remoteproc_mpss;
> +/delete-node/ &remoteproc_wpss;
> +/delete-node/ &rmtfs_mem;
> +/delete-node/ &video_mem;
> +/delete-node/ &wifi;
> +/delete-node/ &wlan_ce_mem;
> +/delete-node/ &wlan_fw_mem;
> +/delete-node/ &wpss_mem;
> +/delete-node/ &xbl_mem;
> +
> +/ {
> +	model = "Thundercomm RUBIK Pi 3";
> +	compatible = "thundercomm,rubikpi3", "qcom,qcm6490";
> +
> +	chassis-type = "embedded";
> +
> +	aliases {
> +		serial0 = &uart5;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	fan0: pwm-fan {

'pwm' > 'gpio'

> +		compatible = "pwm-fan";
> +		/* cooling level (0, 1, 2, 3) : (0% duty, 25% duty, 50% duty, 100% duty) */
> +		cooling-levels = <0 64 128 255>;
> +		#cooling-cells = <2>;
> +		pwms = <&pm8350c_pwm 3 1000000>;
> +		pinctrl-0 = <&fan_pwm_out_default>;
> +		pinctrl-names = "default";
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		pinctrl-0 = <&kypd_vol_up_n>;
> +		pinctrl-names = "default";
> +
> +		key-volume-up {
> +			label = "Volume Up";
> +			gpios = <&pm7325_gpios 6 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_VOLUMEUP>;
> +			linux,can-disable;
> +		};
> +	};
> +
> +	hdmi-connector {
> +		compatible = "hdmi-connector";
> +		type = "a";
> +
> +		port {
> +			hdmi_con: endpoint {
> +				remote-endpoint = <&lt9611_out>;
> +			};
> +		};
> +	};
> +
> +	pmic-glink {
> +		compatible = "qcom,qcm6490-pmic-glink", "qcom,pmic-glink";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		orientation-gpios = <&tlmm 140 GPIO_ACTIVE_HIGH>;
> +
> +		connector@0 {
> +			compatible = "usb-c-connector";
> +			reg = <0>;
> +			power-role = "dual";
> +			data-role = "dual";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					pmic_glink_hs_in: endpoint {
> +						remote-endpoint = <&usb_1_dwc3_hs>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					pmic_glink_ss_in: endpoint {
> +						remote-endpoint = <&usb_dp_qmpphy_out>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					pmic_glink_sbu_in: endpoint {
> +						remote-endpoint = <&usb1_sbu_mux>;
> +					};
> +				};
> +			};
> +		};
> +	};
> +
> +	reserved-memory {
> +		xbl_mem: xbl@80700000 {
> +			reg = <0x0 0x80700000 0x0 0x100000>;
> +			no-map;
> +		};
> +
> +		cdsp_secure_heap_mem: cdsp-secure-heap@81800000 {
> +			reg = <0x0 0x81800000 0x0 0x1e00000>;
> +			no-map;
> +		};
> +
> +		camera_mem: camera@84300000 {
> +			reg = <0x0 0x84300000 0x0 0x500000>;
> +			no-map;
> +		};
> +
> +		adsp_mem: adsp@86100000 {
> +			reg = <0x0 0x86100000 0x0 0x2800000>;
> +			no-map;
> +		};
> +
> +		cdsp_mem: cdsp@88900000 {
> +			reg = <0x0 0x88900000 0x0 0x1e00000>;
> +			no-map;
> +		};
> +
> +		video_mem: video@8a700000 {
> +			reg = <0x0 0x8a700000 0x0 0x700000>;
> +			no-map;
> +		};
> +
> +		cvp_mem: cvp@8ae00000 {
> +			reg = <0x0 0x8ae00000 0x0 0x500000>;
> +			no-map;
> +		};
> +
> +		gpu_microcode_mem: gpu-microcode@8b31a000 {
> +			reg = <0x0 0x8b31a000 0x0 0x2000>;
> +			no-map;
> +		};
> +
> +		tz_stat_mem: tz-stat@c0000000 {
> +			reg = <0x0 0xc0000000 0x0 0x100000>;
> +			no-map;
> +		};
> +
> +		tags_mem: tags@c0100000 {
> +			reg = <0x0 0xc0100000 0x0 0x1200000>;
> +			no-map;
> +		};
> +
> +		qtee_mem: qtee@c1300000 {
> +			reg = <0x0 0xc1300000 0x0 0x500000>;
> +			no-map;
> +		};
> +
> +		trusted_apps_mem: trusted-apps@c1800000 {
> +			reg = <0x0 0xc1800000 0x0 0x1c00000>;
> +			no-map;
> +		};
> +
> +		debug_vm_mem: debug-vm@d0600000 {
> +			reg = <0x0 0xd0600000 0x0 0x100000>;
> +			no-map;
> +		};
> +	};
> +
> +	thermal-zones {
> +		xo-thermal {

quiet, sdm, xo.

> +			thermal-sensors = <&pmk8350_adc_tm 0>;
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
> +		quiet-thermal {
> +			thermal-sensors = <&pmk8350_adc_tm 1>;
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
> +		sdm-skin-thermal {
> +			thermal-sensors = <&pmk8350_adc_tm 3>;
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
> +
> +	usb1-sbu-mux {
> +		compatible = "pericom,pi3usb102", "gpio-sbu-mux";
> +		enable-gpios = <&tlmm 53 GPIO_ACTIVE_LOW>;
> +		select-gpios = <&tlmm 52 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 = <&usb1_sbu_default>;
> +		pinctrl-names = "default";
> +		mode-switch;
> +		orientation-switch;
> +
> +		port {
> +			usb1_sbu_mux: endpoint {
> +				remote-endpoint = <&pmic_glink_sbu_in>;
> +			};
> +		};
> +	};
> +
> +	vreg_lt9611_3p3: vreg_lt9611_3p3 {

regulator-foo-bar-baz, please. This way VPH PWR doesn't stand out.

> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "vreg_lt9611_3p3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 83 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&lt9611_vcc_pin>;
> +		pinctrl-names = "default";
> +	};
> +
> +	vreg_m2_1p8: vreg_m2_1p8 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "vreg_m2_1p8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-enable-ramp-delay = <50000>;
> +
> +		gpio = <&tlmm 56 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&m2_vcc_pin>;
> +		pinctrl-names = "default";
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
> +	vph_pwr: vph-pwr-regulator {

Otherwise you currently stuffed it in the middle of other regulators,
although it doesn't belong here.

> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "vph_pwr";
> +		regulator-min-microvolt = <3700000>;
> +		regulator-max-microvolt = <3700000>;
> +	};
> +
> +	vreg_sdio_wifi_1p8: vreg_sdio_wifi_1p8 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "vreg_sdio_wifi_1p8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-enable-ramp-delay = <50000>;
> +
> +		gpio = <&tlmm 125 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&wifi_reset_active>,
> +			    <&wifi_host_wake>,
> +			    <&wifi_power_on>;
> +		pinctrl-names = "default";
> +
> +		regulator-always-on;
> +	};
> +
> +	vreg_usbhub_1p8: vreg_usbhub_1p8 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "vreg_usbhub_1p8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-enable-ramp-delay = <50000>;
> +
> +		gpio = <&tlmm 86 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&usbhub_power>;
> +		pinctrl-names = "default";
> +
> +		regulator-always-on;
> +	};
> +
> +	vreg_usb_eth_1p8: vreg_usb_eth_1p8 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "vreg_usb_eth_1p8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-enable-ramp-delay = <50000>;
> +
> +		gpio = <&tlmm 7 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&usb_eth_power>;
> +		pinctrl-names = "default";
> +
> +		vin-supply = <&vreg_usbhub_1p8>;
> +	};
> +
> +	vreg_usbhub_rest: vreg_usbhub_rest {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "vreg_usbhub_rest";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-enable-ramp-delay = <50000>;
> +		regulator-max-microvolt = <1800000>;
> +
> +		gpio = <&tlmm 136 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&usbhub_rest>;
> +		pinctrl-names = "default";
> +
> +		vin-supply = <&vreg_usb_eth_1p8>;
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +};
> +
> +&apps_rsc {
> +	regulators-0 {
> +		compatible = "qcom,pm7325-rpmh-regulators";
> +		qcom,pmic-id = "b";
> +
> +		vdd-s1-supply = <&vph_pwr>;
> +		vdd-s2-supply = <&vph_pwr>;
> +		vdd-s3-supply = <&vph_pwr>;
> +		vdd-s4-supply = <&vph_pwr>;
> +		vdd-s5-supply = <&vph_pwr>;
> +		vdd-s6-supply = <&vph_pwr>;
> +		vdd-s7-supply = <&vph_pwr>;
> +		vdd-s8-supply = <&vph_pwr>;
> +		vdd-l1-l4-l12-l15-supply = <&vreg_s7b_0p972>;
> +		vdd-l2-l7-supply = <&vreg_bob_3p296>;
> +		vdd-l3-supply = <&vreg_s2b_0p876>;
> +		vdd-l5-supply = <&vreg_s2b_0p876>;
> +		vdd-l6-l9-l10-supply = <&vreg_s8b_1p272>;
> +		vdd-l8-supply = <&vreg_s7b_0p972>;
> +		vdd-l11-l17-l18-l19-supply = <&vreg_s1b_1p872>;
> +		vdd-l13-supply = <&vreg_s7b_0p972>;
> +		vdd-l14-l16-supply = <&vreg_s8b_1p272>;
> +
> +		vreg_s1b_1p872: smps1 {
> +			regulator-name = "vreg_s1b_1p872";
> +			regulator-min-microvolt = <1840000>;
> +			regulator-max-microvolt = <2040000>;
> +		};
> +
> +		vreg_s2b_0p876: smps2 {
> +			regulator-name = "vreg_s2b_0p876";
> +			regulator-min-microvolt = <570070>;
> +			regulator-max-microvolt = <1050000>;
> +		};
> +
> +		vreg_s7b_0p972: smps7 {
> +			regulator-name = "vreg_s7b_0p972";
> +			regulator-min-microvolt = <535000>;
> +			regulator-max-microvolt = <1120000>;
> +		};
> +
> +		vreg_s8b_1p272: smps8 {
> +			regulator-name = "vreg_s8b_1p272";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1500000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_RET>;
> +		};
> +
> +		vreg_l1b_0p912: ldo1 {
> +			regulator-name = "vreg_l1b_0p912";
> +			regulator-min-microvolt = <825000>;
> +			regulator-max-microvolt = <925000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2b_3p072: ldo2 {
> +			regulator-name = "vreg_l2b_3p072";
> +			regulator-min-microvolt = <2700000>;
> +			regulator-max-microvolt = <3544000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3b_0p504: ldo3 {
> +			regulator-name = "vreg_l3b_0p504";
> +			regulator-min-microvolt = <312000>;
> +			regulator-max-microvolt = <910000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l4b_0p752: ldo4 {
> +			regulator-name = "vreg_l4b_0p752";
> +			regulator-min-microvolt = <752000>;
> +			regulator-max-microvolt = <820000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		reg_l5b_0p752: ldo5 {
> +			regulator-name = "reg_l5b_0p752";
> +			regulator-min-microvolt = <552000>;
> +			regulator-max-microvolt = <832000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l6b_1p2: ldo6 {
> +			regulator-name = "vreg_l6b_1p2";
> +			regulator-min-microvolt = <1140000>;
> +			regulator-max-microvolt = <1260000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l7b_2p952: ldo7 {
> +			regulator-name = "vreg_l7b_2p952";
> +			regulator-min-microvolt = <2952000>;
> +			regulator-max-microvolt = <2952000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l8b_0p904: ldo8 {
> +			regulator-name = "vreg_l8b_0p904";
> +			regulator-min-microvolt = <870000>;
> +			regulator-max-microvolt = <970000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l9b_1p2: ldo9 {
> +			regulator-name = "vreg_l9b_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l11b_1p504: ldo11 {
> +			regulator-name = "vreg_l11b_1p504";
> +			regulator-min-microvolt = <1504000>;
> +			regulator-max-microvolt = <2000000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l12b_0p751: ldo12 {
> +			regulator-name = "vreg_l12b_0p751";
> +			regulator-min-microvolt = <751000>;
> +			regulator-max-microvolt = <824000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l13b_0p53: ldo13 {
> +			regulator-name = "vreg_l13b_0p53";
> +			regulator-min-microvolt = <530000>;
> +			regulator-max-microvolt = <824000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l14b_1p08: ldo14 {
> +			regulator-name = "vreg_l14b_1p08";
> +			regulator-min-microvolt = <1080000>;
> +			regulator-max-microvolt = <1304000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l15b_0p765: ldo15 {
> +			regulator-name = "vreg_l15b_0p765";
> +			regulator-min-microvolt = <765000>;
> +			regulator-max-microvolt = <1020000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l16b_1p1: ldo16 {
> +			regulator-name = "vreg_l16b_1p1";
> +			regulator-min-microvolt = <1100000>;
> +			regulator-max-microvolt = <1300000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l17b_1p7: ldo17 {
> +			regulator-name = "vreg_l17b_1p7";
> +			regulator-min-microvolt = <1700000>;
> +			regulator-max-microvolt = <1900000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l18b_1p8: ldo18 {
> +			regulator-name = "vreg_l18b_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <2000000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l19b_1p8: ldo19 {
> +			regulator-name = "vreg_l19b_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <2000000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	regulators-1 {
> +		compatible = "qcom,pm8350c-rpmh-regulators";
> +		qcom,pmic-id = "c";
> +
> +		vdd-s1-supply = <&vph_pwr>;
> +		vdd-s2-supply = <&vph_pwr>;
> +		vdd-s3-supply = <&vph_pwr>;
> +		vdd-s4-supply = <&vph_pwr>;
> +		vdd-s5-supply = <&vph_pwr>;
> +		vdd-s6-supply = <&vph_pwr>;
> +		vdd-s7-supply = <&vph_pwr>;
> +		vdd-s8-supply = <&vph_pwr>;
> +		vdd-s9-supply = <&vph_pwr>;
> +		vdd-s10-supply = <&vph_pwr>;
> +		vdd-l1-l12-supply = <&vreg_s1b_1p872>;
> +		vdd-l2-l8-supply = <&vreg_s1b_1p872>;
> +		vdd-l3-l4-l5-l7-l13-supply = <&vreg_bob_3p296>;
> +		vdd-l6-l9-l11-supply = <&vreg_bob_3p296>;
> +		vdd-l10-supply = <&vreg_s7b_0p972>;
> +		vdd-bob-supply = <&vph_pwr>;
> +
> +		vreg_s1c_2p19: smps1 {
> +			regulator-name = "vreg_s1c_2p19";
> +			regulator-min-microvolt = <2190000>;
> +			regulator-max-microvolt = <2210000>;
> +		};
> +
> +		vreg_s2c_0p752: smps2 {
> +			regulator-name = "vreg_s2c_0p752";
> +			regulator-min-microvolt = <750000>;
> +			regulator-max-microvolt = <800000>;
> +		};
> +
> +		vreg_s5c_0p752: smps5 {
> +			regulator-name = "vreg_s5c_0p752";
> +			regulator-min-microvolt = <465000>;
> +			regulator-max-microvolt = <1050000>;
> +		};
> +
> +		vreg_s7c_0p752: smps7 {
> +			regulator-name = "vreg_s7c_0p752";
> +			regulator-min-microvolt = <465000>;
> +			regulator-max-microvolt = <800000>;
> +		};
> +
> +		vreg_s9c_1p084: smps9 {
> +			regulator-name = "vreg_s9c_1p084";
> +			regulator-min-microvolt = <1010000>;
> +			regulator-max-microvolt = <1170000>;
> +		};
> +
> +		vreg_l1c_1p8: ldo1 {
> +			regulator-name = "vreg_l1c_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1980000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2c_1p62: ldo2 {
> +			regulator-name = "vreg_l2c_1p62";
> +			regulator-min-microvolt = <1620000>;
> +			regulator-max-microvolt = <1980000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3c_2p8: ldo3 {
> +			regulator-name = "vreg_l3c_2p8";
> +			regulator-min-microvolt = <2800000>;
> +			regulator-max-microvolt = <3540000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l4c_1p62: ldo4 {
> +			regulator-name = "vreg_l4c_1p62";
> +			regulator-min-microvolt = <1620000>;
> +			regulator-max-microvolt = <3300000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l5c_1p62: ldo5 {
> +			regulator-name = "vreg_l5c_1p62";
> +			regulator-min-microvolt = <1620000>;
> +			regulator-max-microvolt = <3300000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l6c_2p96: ldo6 {
> +			regulator-name = "vreg_l6c_2p96";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l7c_3p0: ldo7 {
> +			regulator-name = "vreg_l7c_3p0";
> +			regulator-min-microvolt = <3000000>;
> +			regulator-max-microvolt = <3544000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l8c_1p62: ldo8 {
> +			regulator-name = "vreg_l8c_1p62";
> +			regulator-min-microvolt = <1620000>;
> +			regulator-max-microvolt = <2000000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l9c_2p96: ldo9 {
> +			regulator-name = "vreg_l9c_2p96";
> +			regulator-min-microvolt = <2700000>;
> +			regulator-max-microvolt = <3544000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l10c_0p88: ldo10 {
> +			regulator-name = "vreg_l10c_0p88";
> +			regulator-min-microvolt = <720000>;
> +			regulator-max-microvolt = <1050000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l11c_2p8: ldo11 {
> +			regulator-name = "vreg_l11c_2p8";
> +			regulator-min-microvolt = <2800000>;
> +			regulator-max-microvolt = <3544000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l12c_1p65: ldo12 {
> +			regulator-name = "vreg_l12c_1p65";
> +			regulator-min-microvolt = <1650000>;
> +			regulator-max-microvolt = <2000000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l13c_2p7: ldo13 {
> +			regulator-name = "vreg_l13c_2p7";
> +			regulator-min-microvolt = <2700000>;
> +			regulator-max-microvolt = <3544000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_bob_3p296: bob {
> +			regulator-name = "vreg_bob_3p296";
> +			regulator-min-microvolt = <3008000>;
> +			regulator-max-microvolt = <3960000>;
> +		};
> +	};
> +};
> +
> +&gcc {
> +	protected-clocks = <GCC_CFG_NOC_LPASS_CLK>,
> +			   <GCC_MSS_CFG_AHB_CLK>,
> +			   <GCC_MSS_GPLL0_MAIN_DIV_CLK_SRC>,
> +			   <GCC_MSS_OFFLINE_AXI_CLK>,
> +			   <GCC_MSS_Q6SS_BOOT_CLK_SRC>,
> +			   <GCC_MSS_Q6_MEMNOC_AXI_CLK>,
> +			   <GCC_MSS_SNOC_AXI_CLK>,
> +			   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
> +			   <GCC_QSPI_CORE_CLK>,
> +			   <GCC_QSPI_CORE_CLK_SRC>,
> +			   <GCC_SEC_CTRL_CLK_SRC>,
> +			   <GCC_WPSS_AHB_BDG_MST_CLK>,
> +			   <GCC_WPSS_AHB_CLK>,
> +			   <GCC_WPSS_RSCP_CLK>;
> +};
> +
> +&gpi_dma0 {
> +	status = "okay";
> +};
> +
> +&gpi_dma1 {
> +	status = "okay";
> +};
> +
> +&gpu {
> +	status = "okay";
> +};
> +
> +&gpu_zap_shader {
> +	firmware-name = "qcom/qcs6490/a660_zap.mbn";
> +};
> +
> +/* Pin 3, 5 in 40-pin connector */
> +&i2c1 {
> +	status = "okay";
> +};
> +
> +&i2c9 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	lt9611_codec: hdmi-bridge@39 {
> +		compatible = "lontium,lt9611";
> +		reg = <0x39>;
> +
> +		interrupts-extended = <&tlmm 20 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
> +
> +		vdd-supply = <&vreg_lt9611_3p3>;
> +		vcc-supply = <&vreg_lt9611_3p3>;
> +
> +		pinctrl-0 = <&lt9611_irq_pin>,
> +			    <&lt9611_rst_pin>;
> +		pinctrl-names = "default";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				lt9611_a: endpoint {
> +					remote-endpoint = <&mdss_dsi0_out>;
> +				};
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +
> +				lt9611_out: endpoint {
> +					remote-endpoint = <&hdmi_con>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&lpass_audiocc {
> +	compatible = "qcom,qcm6490-lpassaudiocc";
> +	/delete-property/ power-domains;
> +};
> +
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_dp {
> +	status = "okay";
> +};
> +
> +&mdss_dp_out {
> +	data-lanes = <0 1>;
> +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> +
> +	remote-endpoint = <&usb_dp_qmpphy_dp_in>;
> +};
> +
> +&mdss_dsi {
> +	vdda-supply = <&vreg_l6b_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&mdss_dsi0_out {
> +	remote-endpoint = <&lt9611_a>;
> +	data-lanes = <0 1 2 3>;
> +};
> +
> +&mdss_dsi_phy {
> +	vdds-supply = <&vreg_l10c_0p88>;
> +
> +	status = "okay";
> +};
> +
> +&pcie0 {
> +	status = "okay";
> +};
> +
> +&pcie0_phy {
> +	vdda-phy-supply = <&vreg_l10c_0p88>;
> +	vdda-pll-supply = <&vreg_l6b_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&pcie1 {
> +	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
> +
> +	pinctrl-0 = <&pcie1_reset_n>,
> +		    <&pcie1_wake_n>,
> +		    <&pcie1_clkreq_n>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +};
> +
> +&pcie1_phy {
> +	vdda-phy-supply = <&vreg_l10c_0p88>;
> +	vdda-pll-supply = <&vreg_l6b_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&pm7325_gpios {
> +	kypd_vol_up_n: kypd-vol-up-n-state {
> +		pins = "gpio6";
> +		function = PMIC_GPIO_FUNC_NORMAL;
> +		power-source = <1>;
> +		bias-pull-up;
> +		input-enable;
> +	};
> +};
> +
> +&pm7325_temp_alarm {
> +	io-channels = <&pmk8350_vadc PM7325_ADC7_DIE_TEMP>;
> +	io-channel-names = "thermal";
> +};
> +
> +&pmk8350_adc_tm {
> +	status = "okay";
> +
> +	xo-therm@0 {
> +		reg = <0>;
> +		io-channels = <&pmk8350_vadc PMK8350_ADC7_AMUX_THM1_100K_PU>;
> +		qcom,ratiometric;
> +		qcom,hw-settle-time-us = <200>;
> +	};
> +
> +	quiet-therm@1 {
> +		reg = <1>;
> +		io-channels = <&pmk8350_vadc PM7325_ADC7_AMUX_THM1_100K_PU>;
> +		qcom,ratiometric;
> +		qcom,hw-settle-time-us = <200>;
> +	};
> +
> +	sdm-skin-therm@3 {
> +		reg = <3>;
> +		io-channels = <&pmk8350_vadc PM7325_ADC7_AMUX_THM3_100K_PU>;
> +		qcom,ratiometric;
> +		qcom,hw-settle-time-us = <200>;
> +	};
> +};
> +
> +&pm8350c_pwm {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	status = "okay";
> +
> +	led@1 {
> +		reg = <1>;
> +		color = <LED_COLOR_ID_GREEN>;
> +		function = LED_FUNCTION_INDICATOR;
> +		function-enumerator = <3>;
> +		linux,default-trigger = "none";
> +		default-state = "off";
> +		panic-indicator;
> +		label = "red";

So, is it "red" or LED_COLOR_ID_GREEN?

> +	};
> +
> +	led@2 {
> +		reg = <2>;
> +		color = <LED_COLOR_ID_GREEN>;
> +		function = LED_FUNCTION_INDICATOR;
> +		function-enumerator = <2>;
> +		linux,default-trigger = "none";
> +		default-state = "off";
> +		label = "green";
> +	};
> +
> +	led@3 {
> +		reg = <3>;
> +		color = <LED_COLOR_ID_GREEN>;
> +		function = LED_FUNCTION_INDICATOR;
> +		function-enumerator = <1>;
> +		linux,default-trigger = "none";
> +		default-state = "off";
> +		label = "blue";

Likewise, why is this blue?

> +	};
> +};
> +
> +&pmk8350_rtc {
> +	allow-set-time;
> +
> +	status = "okay";
> +};
> +
> +&pmk8350_vadc {
> +	channel@3 {
> +		reg = <PMK8350_ADC7_DIE_TEMP>;
> +		label = "pmk8350_die_temp";
> +		qcom,pre-scaling = <1 1>;
> +	};
> +
> +	channel@44 {
> +		reg = <PMK8350_ADC7_AMUX_THM1_100K_PU>;
> +		label = "xo_therm";
> +		qcom,hw-settle-time = <200>;
> +		qcom,pre-scaling = <1 1>;
> +		qcom,ratiometric;
> +	};
> +
> +	channel@103 {
> +		reg = <PM7325_ADC7_DIE_TEMP>;
> +		label = "pm7325_die_temp";
> +		qcom,pre-scaling = <1 1>;
> +	};
> +
> +	channel@144 {
> +		reg = <PM7325_ADC7_AMUX_THM1_100K_PU>;
> +		qcom,ratiometric;
> +		qcom,hw-settle-time = <200>;
> +		qcom,pre-scaling = <1 1>;
> +		label = "pm7325_quiet_therm";
> +	};
> +
> +	channel@146 {
> +		reg = <PM7325_ADC7_AMUX_THM3_100K_PU>;
> +		qcom,ratiometric;
> +		qcom,hw-settle-time = <200>;
> +		qcom,pre-scaling = <1 1>;
> +		label = "pm7325_sdm_skin_therm";
> +	};
> +};
> +
> +&pon_pwrkey {
> +	status = "okay";
> +};
> +
> +&pon_resin {
> +	linux,code = <KEY_VOLUMEDOWN>;
> +
> +	status = "okay";
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
> +	firmware-name = "qcom/qcs6490/adsp.mbn";
> +
> +	status = "okay";
> +};
> +
> +&remoteproc_cdsp {
> +	firmware-name = "qcom/qcs6490/cdsp.mbn";
> +
> +	status = "okay";
> +};
> +
> +/* WIFI part of the AP6256 connected with SDIO */
> +&sdhc_2 {
> +	vmmc-supply = <&vreg_l9c_2p96>;
> +	vqmmc-supply = <&vreg_l6c_2p96>;
> +
> +	non-removable;
> +	keep-power-in-suspend;
> +	/delete-property/ cd-gpios;
> +
> +	status = "okay";
> +};
> +
> +/* Pin 19, 21, 23, 24 in 40-pin connector */
> +&spi12 {
> +	status = "okay";
> +};
> +
> +/* Pin 8, 10 in 40-pin connector */
> +&uart2 {
> +	status = "okay";
> +};
> +
> +&uart5 {
> +	status = "okay";
> +};
> +
> +/* BT part of the AP6256 connected with UART */
> +&uart7 {
> +	/delete-property/ interrupts;
> +	interrupts-extended = <&intc GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>,
> +			      <&tlmm 31 IRQ_TYPE_EDGE_FALLING>;
> +	pinctrl-1 = <&qup_uart7_sleep_cts>,
> +		    <&qup_uart7_sleep_rts>,
> +		    <&qup_uart7_sleep_tx>,
> +		    <&qup_uart7_sleep_rx>;
> +	pinctrl-names = "default",
> +			"sleep";
> +
> +	status = "okay";
> +
> +	bluetooth {
> +		compatible = "brcm,bcm4345c5";
> +		clocks = <&sleep_clk>;
> +		clock-names = "lpo";
> +		device-wakeup-gpios = <&tlmm 39 GPIO_ACTIVE_HIGH>;
> +		host-wakeup-gpios = <&tlmm 137 GPIO_ACTIVE_HIGH>;
> +		shutdown-gpios = <&tlmm 17 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 = <&bt_device_wake>,
> +			    <&bt_host_wake>,
> +			    <&bt_reset>;
> +		pinctrl-names = "default";
> +		vbat-supply = <&vreg_sdio_wifi_1p8>;
> +		vddio-supply = <&vreg_sdio_wifi_1p8>;
> +		max-speed = <3000000>;
> +	};
> +};
> +
> +&usb_1 {
> +	dr_mode = "otg";

Not necessary, this is default.

> +
> +	status = "okay";
> +};
> +
> +&usb_1_dwc3_hs {
> +	remote-endpoint = <&pmic_glink_hs_in>;
> +};
> +
> +&usb_1_hsphy {
> +	vdda-pll-supply = <&vreg_l10c_0p88>;
> +	vdda33-supply = <&vreg_l2b_3p072>;
> +	vdda18-supply = <&vreg_l1c_1p8>;
> +
> +	status = "okay";
> +};
> +
> +&usb_1_qmpphy {
> +	vdda-phy-supply = <&vreg_l6b_1p2>;
> +	vdda-pll-supply = <&vreg_l1b_0p912>;
> +
> +	status = "okay";
> +};
> +
> +&usb_2 {
> +	dr_mode = "host";
> +
> +	status = "okay";
> +};
> +
> +&usb_2_hsphy {
> +	vdda-pll-supply = <&vreg_l10c_0p88>;
> +	vdda18-supply = <&vreg_l1c_1p8>;
> +	vdda33-supply = <&vreg_l2b_3p072>;
> +
> +	status = "okay";
> +};
> +
> +&usb_dp_qmpphy_out {
> +	remote-endpoint = <&pmic_glink_ss_in>;
> +};
> +
> +&ufs_mem_hc {
> +	reset-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
> +	vcc-supply = <&vreg_l7b_2p952>;
> +	vcc-max-microamp = <800000>;
> +	vccq-supply = <&vreg_l9b_1p2>;
> +	vccq-max-microamp = <900000>;
> +	vccq2-supply = <&vreg_l9b_1p2>;
> +	vccq2-max-microamp = <900000>;
> +
> +	status = "okay";
> +};
> +
> +&ufs_mem_phy {
> +	vdda-phy-supply = <&vreg_l10c_0p88>;
> +	vdda-pll-supply = <&vreg_l6b_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&venus {
> +	status = "okay";
> +};
> +
> +&thermal_zones {

Why is it here?`

> +	cpu0-thermal {
> +		trips {
> +			cpu_tepid: cpu-tepid {
> +				temperature = <65000>;
> +				hysteresis = <5000>;
> +				type = "active";
> +			};
> +
> +			cpu_warm: cpu-warm {
> +				temperature = <80000>;
> +				hysteresis = <5000>;
> +				type = "active";
> +			};
> +
> +			cpu_hot: cpu-hot {
> +				temperature = <90000>;
> +				hysteresis = <5000>;
> +				type = "active";
> +			};

This has the same value as trip-point0. Is it intentional?

> +		};
> +
> +		cooling-maps {
> +			map-cpu-tepid {
> +				/* active: set fan to cooling level 1 */
> +				cooling-device = <&fan0 1 1>;
> +				trip = <&cpu_tepid>;
> +			};
> +
> +			map-cpu-warm {
> +				/* active: set fan to cooling level 2 */
> +				cooling-device = <&fan0 2 2>;
> +				trip = <&cpu_warm>;
> +			};
> +
> +			map-cpu-hot {
> +				/* active: set fan to cooling level 3 */
> +				cooling-device = <&fan0 3 3>;
> +				trip = <&cpu_hot>;
> +			};
> +		};
> +	};
> +};
> +

-- 
With best wishes
Dmitry

