Return-Path: <linux-arm-msm+bounces-74631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D29DB9B17B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 19:41:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B89687B7DBB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 17:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 752C13164BD;
	Wed, 24 Sep 2025 17:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U5MwI4CK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A9F31A045
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 17:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758735660; cv=none; b=qjBfR0VPSp+zXtBZApPAHqbhrC6sk8FE/UbL5J+WJO4v+QrYvdcmKNSwByKmGz3uKGl7SpY1BY0xHUNUkZ89VUexACJuzxq2q+XrGADr3ayEGq7TkMZtJE79MgQAK68IaCuaJj/QryOGDUIFCWFhpZYeRNTOJoTH60Y8fH890M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758735660; c=relaxed/simple;
	bh=Jd3XSTxGM4Q22N1dG+tW5KDZXcmSM0Ma2aY5YrZxO0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sJ+399ICiw7jdZ9UJCjPSzsxOmMjhGSBP2hynMAIxFtTy2IepBGAOv/56TIWHDZyIpGUHSb2UJcOtiDUIBTs1V4dx8glfsrHa+prYQiEplrE4l/duMvhVFsAPNczf3K9NCT9ea+RWs599FXALRbOKUr28k+qBRBb0ZNvLBGYYpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U5MwI4CK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCnk19018615
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 17:40:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pTiJ5Pc7vkwSPQCrq+hH+cJr
	zG5MUKp6OKL7MzMQT0o=; b=U5MwI4CKDd/G5oT/QXPylnAdIQiplkQaWc3Q6V2h
	a5nMJTdnRqFVeIYOCGCdsFmNtTZ+yIHxRgNa1MS/w/gQ37ashFKPCUhkYudDFBjI
	BM05X+XV4C5ouh9CQnzUqfJs16dSJFLOzwXUcb3DfQB8xl10iej8H9c3CJbYV8xY
	m/2LDNQW1ns5usCX5zsOKVxOrM1wc3T2IJZzwM8dXQX+kzY3CkikVkkxFcpiJbtE
	2W/VEuv2Pff1UGwD6pEp79i3Gx7YGX469QQqniXjy9seqAHN6pDv/5MqYN7ssDXS
	vV0D4fyuiBBPQTlgjENoO+ErVS52Sp4i6oQTeCSIzSc2Rw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bhvjxjr4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 17:40:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b78fb75a97so1143791cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 10:40:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758735652; x=1759340452;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pTiJ5Pc7vkwSPQCrq+hH+cJrzG5MUKp6OKL7MzMQT0o=;
        b=Sm4XOLllRhOsLMMSJ+elxrxVPDWfnMVb7ZvguYh8t062vXHYspTH8pSrIhyLVtuTbB
         bOkrLuP5JGZcoUBIqNZzU1pi1y0SCxc2wJPid+GwO30OWu6yUJNc5j0uHMg+DZy0gyhA
         F0c6bMmR2teLdP3Ygg8Z+0a5HsNZApQFqjnl6KA6CZAKqGu92w5EHXoxyFu8iX6IAaLW
         llIYpxvrWwlqrM2l73nDQ9wyoe3TRNC4tbr3sn9BZrUo5n7BISKxnxA9v4tjgTJUpve5
         rhTn5WAkIHKqxh0FjA4Ie2oihalSHbqFCTMNIVKBbD4Py2lBK40Qip9ufpwOs+AX1u3q
         XaZQ==
X-Gm-Message-State: AOJu0YwG+dGYpAaZUPZJO07dP4Dt5lMmQIoWt2ue9Up87S0LpQzShPWs
	tz0FEOzUDKvHpNKPeb8SwLSjAGPBkLE4Chzo2O4wkCnPP+DaM/ooDbRBhrx8ll6HZlb4hvnYxTd
	meb2PwkxXvMvLRfvAx1o8Gahg5W/7nE04bjf1OFMNS2KNhIT7E7HRX5+HUysrDln5+hm2l7bq2X
	ZCV84=
X-Gm-Gg: ASbGncsyWrZTP2CDFNeHuvPb8i9JTo03SzIoyaAunUy0+NfhWqWZvcyGYsTY3Vz5N8P
	KogolIRzKrplNH5nb0pW7gO3jssJoSGySuAPr69q3xHFrFcKBNhCHmrBOf7iFXtuEOFP2YZemK6
	+eBPbE1WbXd3GfUB82yF/oj3hXIAxcq5hHMRU2fJVRlBq7YAbeMroxWbWDYcRhBkaPT03FIhqId
	a0Yctx6+PHgjvCTROS4uzWm+d8smD04L4kIYFcwcR4LKM49HHzz1ZZXrjO7vnF/H8tgYi/YUOSU
	OjxalSrcmUKKoD2JzSiJ6aWERJgukpSl02Qbi0JeG+tWI3RstgS/495jZAqmPMQOa91R2fNe5l7
	SspOuGogBLwOlj4w9x385vN5Ze4f5u71n7g6HvQBmtwddTI0fjAU1
X-Received: by 2002:a05:622a:2609:b0:4b3:17dd:7766 with SMTP id d75a77b69052e-4da4b141c34mr8408051cf.43.1758735652063;
        Wed, 24 Sep 2025 10:40:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGG5Mv9xMdMS+Yl7FydpviDuU50WjwEf+eOplhzhGQyBac3JZ4a57hMeiCLxKHdwmrhe+mcsQ==
X-Received: by 2002:a05:622a:2609:b0:4b3:17dd:7766 with SMTP id d75a77b69052e-4da4b141c34mr8407671cf.43.1758735651354;
        Wed, 24 Sep 2025 10:40:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5798016361fsm4790612e87.149.2025.09.24.10.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 10:40:50 -0700 (PDT)
Date: Wed, 24 Sep 2025 20:40:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Cc: linux-arm-msm@vger.kernel.org, casey.connolly@linaro.org,
        christopher.obbard@linaro.org, loic.minier@oss.qualcomm.com,
        andersson@kernel.org, Roger Shimizu <rosh@debian.org>
Subject: Re: [PATCH v3] arm64: dts: qcom: rubikpi3: Add qcs6490-rubikpi3
 board dts
Message-ID: <24r6754xf4frkb2uccyi6532lse54yfhtfmwbtv3fzgukdgfgz@xq6whbswflpm>
References: <20250924161120.27051-1-hongyang.zhao@thundersoft.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924161120.27051-1-hongyang.zhao@thundersoft.com>
X-Proofpoint-ORIG-GUID: _7jMCgiZ_fAl9YQM4-jV7qyAo7twnfhD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAxMSBTYWx0ZWRfX05h84227YqFR
 LeMQbXWVgvVDxdbUvuweRNw0XTeYCWHnP225YEvndVsJQb/ty1pzyXDTPamLS0tQH8l/mh4RuBe
 /wmsl6CXNPYkI6ELt73yu308uPNPiJpEKpPYzP2JqqUR5qnvlYeqV1S/6k0eo8+tw3pzTfjjh3o
 tk2lvYcHIdVfrUx39Yy12DKXjhQJC7rMQMqawQL9C4CTs70ZtWbDCmM8DXbmk75wW+HWC7SZcDR
 8w8WuWyCASho9w8JQ6NlFZcCO7KbhS+9CNJdLRfrIU0LJH3NYu2cv3CmLKAPwZCfTRc77W4t/PK
 oi3Z9+yZcgmU6U/T7RmrKEA7WwEwEEapSPKLDHmiF1ySQPPvQb3h7c6RPGFzSdhUN3bzcp2j3bb
 orTTQmEg
X-Proofpoint-GUID: _7jMCgiZ_fAl9YQM4-jV7qyAo7twnfhD
X-Authority-Analysis: v=2.4 cv=Csq/cm4D c=1 sm=1 tr=0 ts=68d42d26 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=Wdb1h0LgAAAA:8 a=xNf9USuDAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=bpOBA-JM5Ns_bzfydWoA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=j5gyrzqu0rbr1vhfHjzO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_04,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230011

On Thu, Sep 25, 2025 at 12:11:20AM +0800, Hongyang Zhao wrote:
> Add DTS for Thundercomm qcs6490-rubikpi3 board which uses
> QCS6490 SoC.
> This will add support for debug uart, usb-typec, wifi,
> bluetooth, fan, m.2, i2c and uart on the 40-pin connector,
> usb2.0, and some voltage regulators to the board.
> 
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> Reviewed-by: Roger Shimizu <rosh@debian.org>
> Cc: Casey Connolly <casey.connolly@linaro.org>
> Cc: Christopher Obbard <christopher.obbard@linaro.org>
> Cc: Loic Minier V1<loic.minier@oss.qualcomm.com>
> ---
> Changes in v3:
> - Rebase on linux-next/master
> Changes in v2:
> - Fix problems found when running device tree check.
> - Enable USB2.0 interface.
> 
> v1 Link: https://lore.kernel.org/linux-arm-msm/20250923064330.518784-1-hongyang.zhao@thundersoft.com/

Please settle all discussions first, before posting new versions. You've
responded to the comments, but you didn't provide time for the reviewers
to respond.

I'm going to skip this version until we settle on something there.

> 
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |    1 +
>  .../dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 1348 +++++++++++++++++
>  2 files changed, 1349 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 4bfa926b6a08..f104f80e65f5 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -124,6 +124,7 @@ qcs6490-rb3gen2-industrial-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2
>  
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-industrial-mezzanine.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-vision-mezzanine.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-thundercomm-rubikpi3.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
> new file mode 100644
> index 000000000000..f3d66821b437
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
> @@ -0,0 +1,1348 @@
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
> +/delete-node/ &ipa_fw_mem;
> +/delete-node/ &rmtfs_mem;
> +/delete-node/ &adsp_mem;
> +/delete-node/ &cdsp_mem;
> +/delete-node/ &video_mem;
> +/delete-node/ &wlan_ce_mem;
> +/delete-node/ &wpss_mem;
> +/delete-node/ &xbl_mem;
> +/delete-node/ &wifi;
> +
> +/ {
> +	model = "Thundercomm RUBIK Pi 3";
> +	compatible = "thundercomm,c6490p", "qcom,qcm6490";
> +
> +	chassis-type = "embedded";
> +
> +	aliases {
> +		serial0 = &uart5;
> +		serial1 = &uart7;
> +		serial2 = &uart2;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	fan0: pwm-fan {
> +		compatible = "pwm-fan";
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
> +		wpss_mem: wpss@84800000 {
> +			reg = <0x0 0x84800000 0x0 0x1900000>;
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
> +		ipa_fw_mem: ipa-fw@8b300000 {
> +			reg = <0x0 0x8b300000 0x0 0x10000>;
> +			no-map;
> +		};
> +
> +		ipa_gsi_mem: ipa-gsi@8b310000 {
> +			reg = <0x0 0x8b310000 0x0 0xa000>;
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
> +		xo-thermal {
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
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_lt9611_3p3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		enable-active-high;
> +		gpio = <&tlmm 83 0>;
> +
> +		pinctrl-0 = <&lt9611_vcc_pin>;
> +		pinctrl-names = "default";
> +	};
> +
> +	vph_pwr: vph-pwr-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vph_pwr";
> +		regulator-min-microvolt = <3700000>;
> +		regulator-max-microvolt = <3700000>;
> +	};
> +
> +	vreg_m2_1p8: vreg_m2_1p8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_m2_1p8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-enable-ramp-delay = <50000>;
> +		enable-active-high;
> +		gpio = <&tlmm 56 0>;
> +
> +		pinctrl-0 = <&m2_vcc_pin>;
> +		pinctrl-names = "default";
> +	};
> +
> +	vreg_sdio_wifi_1p8: vreg_sdio_wifi_1p8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_sdio_wifi_1p8";
> +		regulator-enable-ramp-delay = <50000>;
> +		regulator-always-on;
> +		enable-active-high;
> +		gpio = <&tlmm 125 GPIO_ACTIVE_HIGH>;
> +
> +		pinctrl-0 = <&wifi_reset_active>,
> +			    <&wifi_host_wake>,
> +			    <&wifi_power_on>;
> +		pinctrl-names = "default";
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
> +&pcie1 {
> +	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> +
> +	pinctrl-0 = <&pcie1_reset_n>,
> +		    <&pcie1_wake_n>,
> +		    <&pcie1_clkreq_n>;
> +	pinctrl-names = "default";
> +
> +	vdda-supply = <&vreg_m2_1p8>;
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
> +	};
> +};
> +
> +&pm8350c_gpios {
> +	fan_pwm_out_default: fan-pwm-out-default-state {
> +		pins = "gpio8";
> +		function = "func1";
> +		power-source = <1>;
> +		drive-push-pull;
> +		output-high;
> +		qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
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
> +&qup_uart7_cts {
> +	/*
> +	 * Configure a bias-bus-hold on CTS to lower power
> +	 * usage when Bluetooth is turned off. Bus hold will
> +	 * maintain a low power state regardless of whether
> +	 * the Bluetooth module drives the pin in either
> +	 * direction or leaves the pin fully unpowered.
> +	 */
> +	bias-bus-hold;
> +};
> +
> +&qup_uart7_rts {
> +	/* We'll drive RTS, so no pull */
> +	drive-strength = <2>;
> +	bias-disable;
> +};
> +
> +&qup_uart7_rx {
> +	/*
> +	 * Configure a pull-up on RX. This is needed to avoid
> +	 * garbage data when the TX pin of the Bluetooth module is
> +	 * in tri-state (module powered off or not driving the
> +	 * signal yet).
> +	 */
> +	bias-pull-up;
> +};
> +
> +&qup_uart7_tx {
> +	/* We'll drive TX, so no pull */
> +	drive-strength = <2>;
> +	bias-disable;
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
> +&remoteproc_mpss {
> +	firmware-name = "qcom/qcs6490/modem.mbn";
> +
> +	status = "okay";
> +};
> +
> +&remoteproc_wpss {
> +	firmware-name = "qcom/qcs6490/wpss.mbn";
> +
> +	status = "okay";
> +};
> +
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
> +&uart2 {
> +	status = "okay";
> +};
> +
> +&uart5 {
> +	status = "okay";
> +};
> +
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
> +	status = "okay";
> +};
> +
> +&usb_1_dwc3 {
> +	usb-role-switch;
> +};
> +
> +&usb_1_dwc3_hs {
> +	remote-endpoint = <&pmic_glink_hs_in>;
> +};
> +
> +&usb_1_dwc3_ss {
> +	remote-endpoint = <&usb_dp_qmpphy_usb_ss_in>;
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
> +	orientation-switch;
> +
> +	status = "okay";
> +};
> +
> +&usb_2 {
> +	status = "okay";
> +};
> +
> +&usb_2_dwc3 {
> +	/* USB type A port */
> +	dr_mode = "host";
> +	/delete-property/ usb-role-switch;
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
> +&usb_dp_qmpphy_usb_ss_in {
> +	remote-endpoint = <&usb_1_dwc3_ss>;
> +};
> +
> +&usb_dp_qmpphy_dp_in {
> +	remote-endpoint = <&mdss_dp_out>;
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
> +		};
> +	};
> +
> +	gpuss0-thermal {
> +		trips {
> +			gpuss0_alert0: trip-point0 {
> +				temperature = <95000>;
> +				hysteresis = <5000>;
> +				type = "passive";
> +			};
> +		};
> +	};
> +
> +	gpuss1-thermal {
> +		trips {
> +			gpuss1_alert0: trip-point0 {
> +				temperature = <95000>;
> +				hysteresis = <5000>;
> +				type = "passive";
> +			};
> +		};
> +	};
> +
> +	nspss0-thermal {
> +		trips {
> +			nspss0_alert0: trip-point0 {
> +				temperature = <95000>;
> +				hysteresis = <5000>;
> +				type = "hot";
> +			};
> +		};
> +	};
> +
> +	nspss1-thermal {
> +		trips {
> +			nspss1_alert0: trip-point0 {
> +				temperature = <95000>;
> +				hysteresis = <5000>;
> +				type = "hot";
> +			};
> +		};
> +	};
> +};
> +
> +/* PINCTRL - ADDITIONS TO NODES IN PARENT DEVICE TREE FILES */
> +
> +&sdc2_clk {
> +	bias-disable;
> +	drive-strength = <16>;
> +};
> +
> +&sdc2_cmd {
> +	bias-pull-up;
> +	drive-strength = <10>;
> +};
> +
> +&sdc2_data {
> +	bias-pull-up;
> +	drive-strength = <10>;
> +};
> +
> +&tlmm {
> +	bt_device_wake: bt-device-wake-state {
> +		pins = "gpio39";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	bt_host_wake: bt-host-wake-state {
> +		pins = "gpio137";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	bt_reset: bt-reset-state {
> +		pins = "gpio17";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	lt9611_vcc_pin: lt9611-vcc-pin-state {
> +		pins = "gpio83";
> +		function = "gpio";
> +		output-high;
> +		input-disable;
> +	};
> +
> +	lt9611_irq_pin: lt9611-irq-state {
> +		pins = "gpio20";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	lt9611_rst_pin: lt9611-rst-state {
> +		pins = "gpio21";
> +		function = "gpio";
> +		output-high;
> +		input-disable;
> +	};
> +
> +	m2_vcc_pin: m2-vcc-state {
> +		pins = "gpio56";
> +		function = "gpio";
> +		output-high;
> +		input-disable;
> +	};
> +
> +	pcie1_reset_n: pcie1-reset-n-state {
> +		pins = "gpio2";
> +		function = "gpio";
> +		drive-strength = <16>;
> +		output-low;
> +		bias-disable;
> +	};
> +
> +	pcie1_wake_n: pcie1-wake-n-state {
> +		pins = "gpio3";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};
> +
> +	qup_uart7_sleep_cts: qup-uart7-sleep-cts-state {
> +		pins = "gpio28";
> +		function = "gpio";
> +		/*
> +		 * Configure a bias-bus-hold on CTS to lower power
> +		 * usage when Bluetooth is turned off. Bus hold will
> +		 * maintain a low power state regardless of whether
> +		 * the Bluetooth module drives the pin in either
> +		 * direction or leaves the pin fully unpowered.
> +		 */
> +		bias-bus-hold;
> +	};
> +
> +	qup_uart7_sleep_rts: qup-uart7-sleep-rts-state {
> +		pins = "gpio29";
> +		function = "gpio";
> +		/*
> +		 * Configure pull-down on RTS. As RTS is active low
> +		 * signal, pull it low to indicate the BT SoC that it
> +		 * can wakeup the system anytime from suspend state by
> +		 * pulling RX low (by sending wakeup bytes).
> +		 */
> +		bias-pull-down;
> +	};
> +
> +	qup_uart7_sleep_rx: qup-uart7-sleep-rx-state {
> +		pins = "gpio31";
> +		function = "gpio";
> +		/*
> +		 * Configure a pull-up on RX. This is needed to avoid
> +		 * garbage data when the TX pin of the Bluetooth module
> +		 * is floating which may cause spurious wakeups.
> +		 */
> +		bias-pull-up;
> +	};
> +
> +	qup_uart7_sleep_tx: qup-uart7-sleep-tx-state {
> +		pins = "gpio30";
> +		function = "gpio";
> +		/*
> +		 * Configure pull-up on TX when it isn't actively driven
> +		 * to prevent BT SoC from receiving garbage during sleep.
> +		 */
> +		bias-pull-up;
> +	};
> +
> +	usb1_sbu_default: usb1-sbu-state {
> +		oe-n-pins {
> +			pins = "gpio53";
> +			function = "gpio";
> +			bias-disable;
> +			drive-strength = <16>;
> +			output-high;
> +		};
> +		sel-pins {
> +			pins = "gpio52";
> +			function = "gpio";
> +			bias-disable;
> +			drive-strength = <16>;
> +		};
> +	};
> +
> +	wifi_host_wake: wifi-host-wake-state {
> +		pins = "gpio38";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	wifi_power_on: wifi-power-on-state {
> +		pins = "gpio125";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	wifi_reset_active: wifi-reset-active-state {
> +		pins = "gpio16";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		output-high;
> +		bias-disable;
> +	};
> +};
> +
> +/*
> + * Update the lpassaudio node to support the new compatible as the
> + * lpassaudio needs to support the reset functionality on the
> + * QCS6490 RUBIK Pi 3 board and the rest of the Audio functionality would be
> + * provided from the LPASS firmware.
> + */
> +&lpass_audiocc {
> +	compatible = "qcom,qcm6490-lpassaudiocc";
> +	/delete-property/ power-domains;
> +};
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

