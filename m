Return-Path: <linux-arm-msm+bounces-59550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0895CAC4EAB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 14:26:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16A90188B25B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 12:27:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C6EF269833;
	Tue, 27 May 2025 12:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GeGwdqaq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8804B2561A2
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 12:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748348809; cv=none; b=QhFEdXeSY/WS7NVOhcCw3E+HV5gNkNNbBwhcvSL8EwIxbrOu7tnvN/RQNbOPSb5dKfYwYKIq3k3JaMqPyXrfE7lhEJ78ut9O/oMwIOI9vRPjIGbYLGoegH8OYhNzejZfy7YKVFOoKoVrLw+cfAiseuhPij9sg2g2zUrz4oK5Pf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748348809; c=relaxed/simple;
	bh=ETmolC8mc8rvZzb243ydKbjuAJfkDZlxQOzO+DUrdOk=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=KK0/DNjUSxtvtdQFAzksv1Lr8Z7s7toQ3IXRvX5fpfIY/DBit8LVeK90ip4r1jItcmi08puziP1ObfIpuoLOYD7esl0Ekkt0GCs9xsbgksxPVirawOXl44QS6I6frZbQMVR3z+N75IELSoceRho8Z3jVUYUUHzs1PztvThX78Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GeGwdqaq; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-23449dde9ccso17359825ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 05:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748348806; x=1748953606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DcDmZ8/rAa9+ie79VXTrHQE2ydRz2OYw5HXZLKKYTvE=;
        b=GeGwdqaqOlos5gpigx0f6uJIsc0xvV+R0R8umO+iMGfEm0l7+TmyP0j0xIjTZzi9ZD
         F4OTnYraPzkvzHvCd2heWh6l/IyYhzdg43bDx1A9/YMNOuCmoIkHbcA7+vWgbHlLH9Ao
         w86fZYpzCv0Gws4GIWezdBhYdhhhXwkR9SLASbBjKp/8hXO5Wqgs9p5BpkTHE95vHK2e
         h4Kh0WXDJHYs128q7hQ76YTWZWldJK/4MK5CUGBUGuclh1s5/Qbt5rTUOnpdlnP1fG+r
         7ObQLXzCxgfNmHP3sh0M4XgL6tfhT0N5zGu+Mt/gigxghB1ldPS0jF2ccwwRcxsV0u26
         3bhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748348806; x=1748953606;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DcDmZ8/rAa9+ie79VXTrHQE2ydRz2OYw5HXZLKKYTvE=;
        b=TEYvBtITzepC8s5FiP54rnpTj7OeCDRTSl6wJj+mQsUkB0ftB029EOE09KEi4TgbF6
         ELmvkhGdzbLxOknXLHtheHxA784bbtFQT59W7AJ7vmqRaihaPj8NnWTa2VvfxQ8b6cE/
         8ibDfUK6quRzetEURIzM0nnR3f2Adn6olOAaWSNXMN+AulgwWhrAUq1Ws97FRcprIeQg
         TCG9JTyCrUSZisxeYPhO1O/VlhpCACmAzD0KPYG8kTkGePImOT8d9Ww0jOwF7kXmh4sW
         tk5MdIFHDep11p3c608Hu4IkyvOdnkQBCapnE1LHfXjdu3KCe9rF0N762kyqX0oyEXAR
         ayPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHMHt3fet5WwaDpxGgemhloOpS2FD8ee1+v4Hzm5QzwRGjQ5UIV5Lh/wMQJm0FzbURdLU3rDG5BUgZgjEV@vger.kernel.org
X-Gm-Message-State: AOJu0YymfNo4f1IbeStqIhV8MnVApLeowldy+I4bQAuspwncBODKCGCF
	Qj7xDwnIB1vxiN1cuk18z90n1DKv4NUQVz2O6951Nvw6XPY7s6ioE3JXZXM2vEqGmQ==
X-Gm-Gg: ASbGncuvJ/Y1AcAVnjS+6CgwZxQEl4Y9GVn0epowa7iKOKnhHTarTBSujj3RnEuaeWO
	kNwXjAeu//hy4HLvofl827V5+bfHkI9q2qo4HRKYFBINLEdy+PA0uxq986DFCaPui1tEoyTe7Ex
	O7FVu6ZfAL6twFoVg3IGi6qjr+lCPj6+1FMGi6QSvAINwfjvbGq6hGLtCVszfA/zQpmV0PWJZCN
	Bo2dUt6JQflOPMeERtpvw9UKfBewCaDn+uF5XiYRwH9MGhSASFcFVCZTq38wCJalOipfHCiMAXX
	58Ska5Sp3SwXPfLK5OlCElnIsKR+TRlhZ+MD8+ZwkPRIE1b9JA==
X-Google-Smtp-Source: AGHT+IH+FAE9D1Sl6dfRRrI4A/37zsOEnw1yDdpbC5eo4+xQr9uZbaMGA6GyVxQh7Vq3j3QCCeVLQQ==
X-Received: by 2002:a17:903:228c:b0:215:b473:1dc9 with SMTP id d9443c01a7336-23414fc957dmr200237005ad.46.1748348805606;
        Tue, 27 May 2025 05:26:45 -0700 (PDT)
Received: from ?IPv6:::1? ([2409:40f4:2119:1d3:8000::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-234989777ccsm13247365ad.83.2025.05.27.05.26.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 05:26:45 -0700 (PDT)
Date: Tue, 27 May 2025 17:54:49 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Val Packett <val@packett.cool>
CC: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_2/4=5D_arm64=3A_dts=3A_qcom=3A_Add_?=
 =?US-ASCII?Q?support_for_X1E80100_Dell_Latitude_7455?=
User-Agent: K-9 Mail for Android
In-Reply-To: <a5tx3ekokrd5zif646ukd5z4gzkyod3b4vcjktwahtej7dpare@43djxfwza2jb>
References: <20250525095341.12462-2-val@packett.cool> <20250525095341.12462-4-val@packett.cool> <a5tx3ekokrd5zif646ukd5z4gzkyod3b4vcjktwahtej7dpare@43djxfwza2jb>
Message-ID: <9A47A2D6-93EA-4C73-A681-474C977474DD@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On May 25, 2025 6:55:42 PM GMT+05:30, Dmitry Baryshkov <dmitry=2Ebaryshkov=
@oss=2Equalcomm=2Ecom> wrote:
>On Sun, May 25, 2025 at 06:53:34AM -0300, Val Packett wrote:
>> Add a device tree for the Dell Latitude 7455 (X Elite) laptop=2E
>>=20
>> Working:
>> - Wi-Fi (WCN7850 hw2=2E0)
>> - Bluetooth
>> - USB Type-C x2 (with DP alt mode)
>> - USB Type-A
>> - USB Fingerprint reader
>> - eDP Display (with brightness)
>> - NVMe
>> - SDHC (microSD slot)
>> - Keyboard
>> - Touchpad
>> - Touchscreen
>> - Battery
>>=20
>> Not included:
>> - Audio
>> - Camera
>>=20
>> Signed-off-by: Val Packett <val@packett=2Ecool>
>> ---
>>  arch/arm64/boot/dts/qcom/Makefile             |    2 +
>>  =2E=2E=2E/dts/qcom/x1e80100-dell-latitude-7455=2Edts  | 1484 +++++++++=
++++++++
>>  2 files changed, 1486 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-745=
5=2Edts
>>=20
>
>> +	pmic-glink {
>> +		compatible =3D "qcom,x1e80100-pmic-glink",
>> +			     "qcom,sm8550-pmic-glink",
>> +			     "qcom,pmic-glink";
>> +		orientation-gpios =3D <&tlmm 121 GPIO_ACTIVE_HIGH>,
>> +				    <&tlmm 123 GPIO_ACTIVE_HIGH>;
>> +		#address-cells =3D <1>;
>> +		#size-cells =3D <0>;
>> +
>> +		/* Display-adjacent port */
>> +		connector@0 {
>> +			compatible =3D "usb-c-connector";
>> +			reg =3D <0>;
>> +			power-role =3D "dual";
>> +			data-role =3D "dual";
>
>What does UCSI tell about these connectors? Are they really
>dual-data-role?
>
>> +
>> +			ports {
>> +				#address-cells =3D <1>;
>> +				#size-cells =3D <0>;
>> +
>> +				port@0 {
>> +					reg =3D <0>;
>> +
>> +					pmic_glink_ss0_hs_in: endpoint {
>> +						remote-endpoint =3D <&usb_1_ss0_dwc3_hs>;
>> +					};
>> +				};
>> +
>> +				port@1 {
>> +					reg =3D <1>;
>> +
>> +					pmic_glink_ss0_ss_in: endpoint {
>> +						remote-endpoint =3D <&retimer_ss0_ss_out>;
>> +					};
>> +				};
>> +
>> +				port@2 {
>> +					reg =3D <2>;
>> +
>> +					pmic_glink_ss0_con_sbu_in: endpoint {
>> +						remote-endpoint =3D <&retimer_ss0_con_sbu_out>;
>> +					};
>> +				};
>> +			};
>> +		};
>> +
>> +		/* User-adjacent port */
>> +		connector@1 {
>> +			compatible =3D "usb-c-connector";
>> +			reg =3D <1>;
>> +			power-role =3D "dual";
>> +			data-role =3D "dual";
>> +
>> +			ports {
>> +				#address-cells =3D <1>;
>> +				#size-cells =3D <0>;
>> +
>> +				port@0 {
>> +					reg =3D <0>;
>> +
>> +					pmic_glink_ss1_hs_in: endpoint {
>> +						remote-endpoint =3D <&usb_1_ss1_dwc3_hs>;
>> +					};
>> +				};
>> +
>> +				port@1 {
>> +					reg =3D <1>;
>> +
>> +					pmic_glink_ss1_ss_in: endpoint {
>> +						remote-endpoint =3D <&retimer_ss1_ss_out>;
>> +					};
>> +				};
>> +
>> +				port@2 {
>> +					reg =3D <2>;
>> +
>> +					pmic_glink_ss1_con_sbu_in: endpoint {
>> +						remote-endpoint =3D <&retimer_ss1_con_sbu_out>;
>> +					};
>> +				};
>> +			};
>> +		};
>> +	};
>
>> +
>> +	vreg_wcn_3p3: regulator-wcn-3p3 {
>> +		compatible =3D "regulator-fixed";
>> +
>> +		regulator-name =3D "VREG_WCN_3P3";
>> +		regulator-min-microvolt =3D <3300000>;
>> +		regulator-max-microvolt =3D <3300000>;
>> +
>> +		gpio =3D <&tlmm 214 GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +
>> +		pinctrl-0 =3D <&wcn_sw_en>;
>> +		pinctrl-names =3D "default";
>> +
>> +		regulator-boot-on;
>> +	};
>> +
>> +	/*
>> +	 * TODO: These two regulators are actually part of the removable M=2E=
2
>> +	 * card and not the mainboard=2E Need to describe this differently=2E
>> +	 * Functionally it works correctly, because all we need to do is to
>> +	 * turn on the actual 3=2E3V supply above=2E
>> +	 */
>
>Indeed, it should be possible to describe just M=2E2 card, because in
>theory nothing prevents you from swapping it with some other card=2E
>I _think_, it should be possible to describe WiFI part by listing 3=2E3V
>supply as slot supply=2E However I don't think we have a way "random BT
>connected to the UART"=2E So, this is probably suitable=2E

If it is *just* an M=2E2 card, then why the PMU node for WLAN is defined? =
PMU is defining the internal supplies of the M=2E2 cards=2E If that's not r=
equired, you'd be better off with defining the slot supply alone in the PCI=
e bridge node=2E Like,

In SoC dtsi:

pcieport0: pcie@0 {
	compatible "pciclass,0604"
	=2E=2E=2E
};

In board dts:

&pcieport0 {
	vpcie3v3-supply =3D <&vreg_wcn_3p3>;
};

But I guess you are sticking with PMU for UART? Even in that case, the PCI=
e node should just define the slot supply=2E

- Mani

>
>> +	vreg_wcn_0p95: regulator-wcn-0p95 {
>> +		compatible =3D "regulator-fixed";
>> +
>> +		regulator-name =3D "VREG_WCN_0P95";
>> +		regulator-min-microvolt =3D <950000>;
>> +		regulator-max-microvolt =3D <950000>;
>> +
>> +		vin-supply =3D <&vreg_wcn_3p3>;
>> +	};
>> +
>> +	vreg_wcn_1p9: regulator-wcn-1p9 {
>> +		compatible =3D "regulator-fixed";
>> +
>> +		regulator-name =3D "VREG_WCN_1P9";
>> +		regulator-min-microvolt =3D <1900000>;
>> +		regulator-max-microvolt =3D <1900000>;
>> +
>> +		vin-supply =3D <&vreg_wcn_3p3>;
>> +	};
>> +
>> +	wcn7850-pmu {
>> +		compatible =3D "qcom,wcn7850-pmu";
>> +
>> +		vdd-supply =3D <&vreg_wcn_0p95>;
>> +		vddio-supply =3D <&vreg_l15b_1p8>;
>> +		vddaon-supply =3D <&vreg_wcn_0p95>;
>> +		vdddig-supply =3D <&vreg_wcn_0p95>;
>> +		vddrfa1p2-supply =3D <&vreg_wcn_1p9>;
>> +		vddrfa1p8-supply =3D <&vreg_wcn_1p9>;
>> +
>> +		wlan-enable-gpios =3D <&tlmm 117 GPIO_ACTIVE_HIGH>;
>> +		bt-enable-gpios =3D <&tlmm 116 GPIO_ACTIVE_HIGH>;
>> +
>> +		pinctrl-0 =3D <&wcn_wlan_bt_en>;
>> +		pinctrl-names =3D "default";
>> +
>> +		regulators {
>> +			vreg_pmu_rfa_cmn: ldo0 {
>> +				regulator-name =3D "vreg_pmu_rfa_cmn";
>> +			};
>> +
>> +			vreg_pmu_aon_0p59: ldo1 {
>> +				regulator-name =3D "vreg_pmu_aon_0p59";
>> +			};
>> +
>> +			vreg_pmu_wlcx_0p8: ldo2 {
>> +				regulator-name =3D "vreg_pmu_wlcx_0p8";
>> +			};
>> +
>> +			vreg_pmu_wlmx_0p85: ldo3 {
>> +				regulator-name =3D "vreg_pmu_wlmx_0p85";
>> +			};
>> +
>> +			vreg_pmu_btcmx_0p85: ldo4 {
>> +				regulator-name =3D "vreg_pmu_btcmx_0p85";
>> +			};
>> +
>> +			vreg_pmu_rfa_0p8: ldo5 {
>> +				regulator-name =3D "vreg_pmu_rfa_0p8";
>> +			};
>> +
>> +			vreg_pmu_rfa_1p2: ldo6 {
>> +				regulator-name =3D "vreg_pmu_rfa_1p2";
>> +			};
>> +
>> +			vreg_pmu_rfa_1p8: ldo7 {
>> +				regulator-name =3D "vreg_pmu_rfa_1p8";
>> +			};
>> +
>> +			vreg_pmu_pcie_0p9: ldo8 {
>> +				regulator-name =3D "vreg_pmu_pcie_0p9";
>> +			};
>> +
>> +			vreg_pmu_pcie_1p8: ldo9 {
>> +				regulator-name =3D "vreg_pmu_pcie_1p8";
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +&apps_rsc {
>> +	regulators-0 {
>> +		compatible =3D "qcom,pm8550-rpmh-regulators";
>> +		qcom,pmic-id =3D "b";
>> +
>> +		vdd-bob1-supply =3D <&vph_pwr>;
>> +		vdd-bob2-supply =3D <&vph_pwr>;
>> +		vdd-l1-l4-l10-supply =3D <&vreg_s4c_1p8>;
>> +		vdd-l2-l13-l14-supply =3D <&vreg_bob1>;
>> +		vdd-l5-l16-supply =3D <&vreg_bob1>;
>> +		vdd-l6-l7-supply =3D <&vreg_bob2>;
>> +		vdd-l8-l9-supply =3D <&vreg_bob1>;
>> +		vdd-l12-supply =3D <&vreg_s5j_1p2>;
>> +		vdd-l15-supply =3D <&vreg_s4c_1p8>;
>> +		vdd-l17-supply =3D <&vreg_bob2>;
>> +
>> +		vreg_bob1: bob1 {
>> +			regulator-name =3D "vreg_bob1";
>> +			regulator-min-microvolt =3D <3008000>;
>> +			regulator-max-microvolt =3D <3960000>;
>> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_bob2: bob2 {
>> +			regulator-name =3D "vreg_bob2";
>> +			regulator-min-microvolt =3D <2504000>;
>> +			regulator-max-microvolt =3D <3008000>;
>> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l1b_1p8: ldo1 {
>> +			regulator-name =3D "vreg_l1b_1p8";
>> +			regulator-min-microvolt =3D <1800000>;
>> +			regulator-max-microvolt =3D <1800000>;
>> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l2b_3p0: ldo2 {
>> +			regulator-name =3D "vreg_l2b_3p0";
>> +			regulator-min-microvolt =3D <3072000>;
>> +			regulator-max-microvolt =3D <3100000>;
>> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l4b_1p8: ldo4 {
>> +			regulator-name =3D "vreg_l4b_1p8";
>> +			regulator-min-microvolt =3D <1800000>;
>> +			regulator-max-microvolt =3D <1800000>;
>> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l6b_1p8: ldo6 {
>> +			regulator-name =3D "vreg_l6b_1p8";
>> +			regulator-min-microvolt =3D <1800000>;
>> +			regulator-max-microvolt =3D <2960000>;
>> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l7b_2p8: ldo7 {
>> +			regulator-name =3D "vreg_l7b_2p8";
>> +			regulator-min-microvolt =3D <2800000>;
>> +			regulator-max-microvolt =3D <2800000>;
>> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l8b_3p0: ldo8 {
>> +			regulator-name =3D "vreg_l8b_3p0";
>> +			regulator-min-microvolt =3D <3072000>;
>> +			regulator-max-microvolt =3D <3072000>;
>> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l9b_2p9: ldo9 {
>> +			regulator-name =3D "vreg_l9b_2p9";
>> +			regulator-min-microvolt =3D <2960000>;
>> +			regulator-max-microvolt =3D <2960000>;
>> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l12b_1p2: ldo12 {
>> +			regulator-name =3D "vreg_l12b_1p2";
>> +			regulator-min-microvolt =3D <1200000>;
>> +			regulator-max-microvolt =3D <1200000>;
>> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l13b_3p0: ldo13 {
>> +			regulator-name =3D "vreg_l13b_3p0";
>> +			regulator-min-microvolt =3D <3072000>;
>> +			regulator-max-microvolt =3D <3100000>;
>> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l14b_3p0: ldo14 {
>> +			regulator-name =3D "vreg_l14b_3p0";
>> +			regulator-min-microvolt =3D <3072000>;
>> +			regulator-max-microvolt =3D <3072000>;
>> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l15b_1p8: ldo15 {
>> +			regulator-name =3D "vreg_l15b_1p8";
>> +			regulator-min-microvolt =3D <1800000>;
>> +			regulator-max-microvolt =3D <1800000>;
>> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +	};
>> +
>> +	regulators-1 {
>> +		compatible =3D "qcom,pm8550ve-rpmh-regulators";
>> +		qcom,pmic-id =3D "c";
>> +
>> +		vdd-l1-supply =3D <&vreg_s5j_1p2>;
>> +		vdd-l2-supply =3D <&vreg_s1f_0p7>;
>> +		vdd-l3-supply =3D <&vreg_s1f_0p7>;
>> +		vdd-s4-supply =3D <&vph_pwr>;
>> +
>> +		vreg_s4c_1p8: smps4 {
>> +			regulator-name =3D "vreg_s4c_1p8";
>> +			regulator-min-microvolt =3D <1856000>;
>> +			regulator-max-microvolt =3D <2000000>;
>> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l1c_1p2: ldo1 {
>> +			regulator-name =3D "vreg_l1c_1p2";
>> +			regulator-min-microvolt =3D <1200000>;
>> +			regulator-max-microvolt =3D <1200000>;
>> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l2c_0p8: ldo2 {
>> +			regulator-name =3D "vreg_l2c_0p8";
>> +			regulator-min-microvolt =3D <880000>;
>> +			regulator-max-microvolt =3D <920000>;
>> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l3c_0p8: ldo3 {
>> +			regulator-name =3D "vreg_l3c_0p8";
>> +			regulator-min-microvolt =3D <880000>;
>> +			regulator-max-microvolt =3D <920000>;
>> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +	};
>> +
>> +	regulators-2 {
>> +		compatible =3D "qcom,pmc8380-rpmh-regulators";
>> +		qcom,pmic-id =3D "d";
>> +
>> +		vdd-l1-supply =3D <&vreg_s1f_0p7>;
>> +		vdd-l2-supply =3D <&vreg_s1f_0p7>;
>> +		vdd-l3-supply =3D <&vreg_s4c_1p8>;
>> +		vdd-s1-supply =3D <&vph_pwr>;
>> +
>> +		vreg_l1d_0p8: ldo1 {
>> +			regulator-name =3D "vreg_l1d_0p8";
>> +			regulator-min-microvolt =3D <880000>;
>> +			regulator-max-microvolt =3D <920000>;
>> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l2d_0p9: ldo2 {
>> +			regulator-name =3D "vreg_l2d_0p9";
>> +			regulator-min-microvolt =3D <912000>;
>> +			regulator-max-microvolt =3D <912000>;
>> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l3d_1p8: ldo3 {
>> +			regulator-name =3D "vreg_l3d_1p8";
>> +			regulator-min-microvolt =3D <1800000>;
>> +			regulator-max-microvolt =3D <1800000>;
>> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +	};
>> +
>> +	regulators-3 {
>> +		compatible =3D "qcom,pmc8380-rpmh-regulators";
>> +		qcom,pmic-id =3D "e";
>> +
>> +		vdd-l2-supply =3D <&vreg_s1f_0p7>;
>> +		vdd-l3-supply =3D <&vreg_s5j_1p2>;
>> +
>> +		vreg_l2e_0p8: ldo2 {
>> +			regulator-name =3D "vreg_l2e_0p8";
>> +			regulator-min-microvolt =3D <880000>;
>> +			regulator-max-microvolt =3D <920000>;
>> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l3e_1p2: ldo3 {
>> +			regulator-name =3D "vreg_l3e_1p2";
>> +			regulator-min-microvolt =3D <1200000>;
>> +			regulator-max-microvolt =3D <1200000>;
>> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +	};
>> +
>> +	regulators-4 {
>> +		compatible =3D "qcom,pmc8380-rpmh-regulators";
>> +		qcom,pmic-id =3D "f";
>> +
>> +		vdd-l1-supply =3D <&vreg_s5j_1p2>;
>> +		vdd-l2-supply =3D <&vreg_s5j_1p2>;
>> +		vdd-l3-supply =3D <&vreg_s5j_1p2>;
>> +		vdd-s1-supply =3D <&vph_pwr>;
>> +
>> +		vreg_s1f_0p7: smps1 {
>> +			regulator-name =3D "vreg_s1f_0p7";
>> +			regulator-min-microvolt =3D <700000>;
>> +			regulator-max-microvolt =3D <1100000>;
>> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +	};
>> +
>> +	regulators-6 {
>> +		compatible =3D "qcom,pm8550ve-rpmh-regulators";
>> +		qcom,pmic-id =3D "i";
>> +
>> +		vdd-l1-supply =3D <&vreg_s4c_1p8>;
>> +		vdd-l2-supply =3D <&vreg_s5j_1p2>;
>> +		vdd-l3-supply =3D <&vreg_s1f_0p7>;
>> +		vdd-s1-supply =3D <&vph_pwr>;
>> +		vdd-s2-supply =3D <&vph_pwr>;
>> +
>> +		vreg_l1i_1p8: ldo1 {
>> +			regulator-name =3D "vreg_l1i_1p8";
>> +			regulator-min-microvolt =3D <1800000>;
>> +			regulator-max-microvolt =3D <1800000>;
>> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l2i_1p2: ldo2 {
>> +			regulator-name =3D "vreg_l2i_1p2";
>> +			regulator-min-microvolt =3D <1200000>;
>> +			regulator-max-microvolt =3D <1200000>;
>> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l3i_0p8: ldo3 {
>> +			regulator-name =3D "vreg_l3i_0p8";
>> +			regulator-min-microvolt =3D <880000>;
>> +			regulator-max-microvolt =3D <920000>;
>> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +	};
>> +
>> +	regulators-7 {
>> +		compatible =3D "qcom,pm8550ve-rpmh-regulators";
>> +		qcom,pmic-id =3D "j";
>> +
>> +		vdd-l1-supply =3D <&vreg_s1f_0p7>;
>> +		vdd-l2-supply =3D <&vreg_s5j_1p2>;
>> +		vdd-l3-supply =3D <&vreg_s1f_0p7>;
>> +		vdd-s5-supply =3D <&vph_pwr>;
>> +
>> +		vreg_s5j_1p2: smps5 {
>> +			regulator-name =3D "vreg_s5j_1p2";
>> +			regulator-min-microvolt =3D <1256000>;
>> +			regulator-max-microvolt =3D <1304000>;
>> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l1j_0p8: ldo1 {
>> +			regulator-name =3D "vreg_l1j_0p8";
>> +			regulator-min-microvolt =3D <912000>;
>> +			regulator-max-microvolt =3D <912000>;
>> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l2j_1p2: ldo2 {
>> +			regulator-name =3D "vreg_l2j_1p2";
>> +			regulator-min-microvolt =3D <1256000>;
>> +			regulator-max-microvolt =3D <1256000>;
>> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l3j_0p8: ldo3 {
>> +			regulator-name =3D "vreg_l3j_0p8";
>> +			regulator-min-microvolt =3D <880000>;
>> +			regulator-max-microvolt =3D <920000>;
>> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +	};
>> +};
>> +
>> +&gpu {
>> +	status =3D "okay";
>> +
>> +	zap-shader {
>> +		firmware-name =3D "qcom/x1e80100/dell/latitude-7455/qcdxkmsuc8380=2E=
mbn";
>> +	};
>> +};
>> +
>> +&i2c0 {
>> +	clock-frequency =3D <400000>;
>> +
>> +	status =3D "okay";
>> +
>> +	keyboard@5 {
>> +		compatible =3D "hid-over-i2c";
>> +		reg =3D <0x5>;
>> +
>> +		hid-descr-addr =3D <0x20>;
>> +		interrupts-extended =3D <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
>> +
>> +		pinctrl-0 =3D <&kybd_default>;
>> +		pinctrl-names =3D "default";
>> +
>> +		wakeup-source;
>> +	};
>> +
>> +	touchpad@2c {
>> +		compatible =3D "hid-over-i2c";
>> +		reg =3D <0x2c>;
>> +
>> +		hid-descr-addr =3D <0x20>;
>> +		interrupts-extended =3D <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
>> +
>> +		pinctrl-0 =3D <&tpad_default>;
>> +		pinctrl-names =3D "default";
>> +
>> +		wakeup-source;
>> +	};
>> +};
>> +
>> +&i2c1 {
>> +	clock-frequency =3D <400000>;
>> +
>> +	status =3D "okay";
>
>Anything present on the bus? You can add a comment with chip names (if
>you know them) or just probed I2C addresses=2E
>
>> +};
>> +
>> +
>> +&i2c4 {
>> +	clock-frequency =3D <400000>;
>> +
>> +	status =3D "okay";
>> +};
>
>Same here
>
>> +
>> +
>> +&i2c20 {
>> +	clock-frequency =3D <400000>;
>> +
>> +	status =3D "okay";
>
>And here
>
>> +};
>> +
>> +
>> +&qupv3_0 {
>> +	status =3D "okay";
>> +};
>> +
>> +&qupv3_1 {
>> +	status =3D "okay";
>> +};
>> +
>> +&qupv3_2 {
>> +	status =3D "okay";
>> +};
>
>And no GPI DMA devices?
>
>> +
>> +&remoteproc_adsp {
>> +	firmware-name =3D "qcom/x1e80100/dell/latitude-7455/qcadsp8380=2Embn"=
,
>> +			"qcom/x1e80100/dell/latitude-7455/adsp_dtbs=2Eelf";
>> +
>> +	status =3D "okay";
>> +};
>> +
>> +&remoteproc_cdsp {
>> +	firmware-name =3D "qcom/x1e80100/dell/latitude-7455/qccdsp8380=2Embn"=
,
>> +			"qcom/x1e80100/dell/latitude-7455/cdsp_dtbs=2Eelf";
>> +
>> +	status =3D "okay";
>> +};
>> +
>> +&sdhc_2 {
>> +	cd-gpios =3D <&tlmm 71 GPIO_ACTIVE_LOW>;
>> +	pinctrl-0 =3D <&sdc2_default &sdc2_card_det_n>;
>> +	pinctrl-1 =3D <&sdc2_sleep &sdc2_card_det_n>;
>> +	pinctrl-names =3D "default", "sleep";
>> +	vmmc-supply =3D <&vreg_l9b_2p9>;
>> +	vqmmc-supply =3D <&vreg_l6b_1p8>;
>> +	bus-width =3D <4>;
>> +	no-sdio;
>> +	no-mmc;
>> +	status =3D "okay";
>> +};
>> +
>> +&smb2360_0 {
>> +	status =3D "okay";
>> +};
>> +
>> +&smb2360_0_eusb2_repeater {
>> +	vdd18-supply =3D <&vreg_l3d_1p8>;
>> +	vdd3-supply =3D <&vreg_l2b_3p0>;
>> +};
>> +
>> +&smb2360_1 {
>> +	status =3D "okay";
>> +};
>> +
>> +&smb2360_1_eusb2_repeater {
>> +	vdd18-supply =3D <&vreg_l3d_1p8>;
>> +	vdd3-supply =3D <&vreg_l14b_3p0>;
>> +};
>> +
>> +&tlmm {
>> +	gpio-reserved-ranges =3D <44 4>,  /* SPI11 (TPM) */
>> +			       <76 4>,  /* SPI19 (TZ Protected) */
>> +			       <238 1>; /* UFS Reset */
>> +
>> +	cam_rgb_default: cam-rgb-default-state {
>> +		mclk-pins {
>> +			pins =3D "gpio100";
>> +			function =3D "cam_aon";
>> +			drive-strength =3D <16>;
>> +			bias-disable;
>> +		};
>> +
>> +		reset-n-pins {
>> +			pins =3D "gpio237";
>> +			function =3D "gpio";
>> +			drive-strength =3D <2>;
>> +			bias-disable;
>> +		};
>> +	};
>> +
>> +	cam_indicator_en: cam-indicator-en-state {
>> +		pins =3D "gpio110";
>> +		function =3D "gpio";
>> +		drive-strength =3D <2>;
>> +		bias-disable;
>> +	};
>> +
>> +	cam_ldo_en: cam-ldo-en-state {
>> +		pins =3D "gpio91";
>> +		function =3D "gpio";
>> +		drive-strength =3D <2>;
>> +		bias-disable;
>> +	};
>> +
>> +	edp_bl_en: edp-bl-en-state {
>> +		pins =3D "gpio74";
>> +		function =3D "gpio";
>> +		drive-strength =3D <2>;
>> +		bias-disable;
>> +	};
>> +
>> +	edp_reg_en: edp-reg-en-state {
>> +		pins =3D "gpio70";
>> +		function =3D "gpio";
>> +		drive-strength =3D <16>;
>> +		bias-disable;
>> +	};
>> +
>> +	eusb3_reset_n: eusb3-reset-n-state {
>> +		pins =3D "gpio6";
>> +		function =3D "gpio";
>> +		drive-strength =3D <2>;
>> +		bias-disable;
>> +		output-low;
>> +	};
>> +
>> +	eusb5_reset_n: eusb5-reset-n-state {
>> +		pins =3D "gpio184";
>> +		function =3D "gpio";
>> +		drive-strength =3D <2>;
>> +		bias-disable;
>> +		output-low;
>> +	};
>> +
>> +	hall_int_n_default: hall-int-n-state {
>> +		pins =3D "gpio92";
>> +		function =3D "gpio";
>> +
>> +		bias-disable;
>> +	};
>> +
>> +	kybd_default: kybd-default-state {
>> +		pins =3D "gpio67";
>> +		function =3D "gpio";
>> +		bias-pull-up;
>> +	};
>> +
>> +	nvme_reg_en: nvme-reg-en-state {
>> +		pins =3D "gpio18";
>> +		function =3D "gpio";
>> +		drive-strength =3D <2>;
>> +		bias-disable;
>> +	};
>> +
>> +	pcie4_default: pcie4-default-state {
>> +		clkreq-n-pins {
>> +			pins =3D "gpio147";
>> +			function =3D "pcie4_clk";
>> +			drive-strength =3D <2>;
>> +			bias-pull-up;
>> +		};
>> +
>> +		perst-n-pins {
>> +			pins =3D "gpio146";
>> +			function =3D "gpio";
>> +			drive-strength =3D <2>;
>> +			bias-disable;
>> +		};
>> +
>> +		wake-n-pins {
>> +			pins =3D "gpio148";
>> +			function =3D "gpio";
>> +			drive-strength =3D <2>;
>> +			bias-pull-up;
>> +		};
>> +	};
>> +
>> +	pcie6a_default: pcie6a-default-state {
>> +		clkreq-n-pins {
>> +			pins =3D "gpio153";
>> +			function =3D "pcie6a_clk";
>> +			drive-strength =3D <2>;
>> +			bias-pull-up;
>> +		};
>> +
>> +		perst-n-pins {
>> +			pins =3D "gpio152";
>> +			function =3D "gpio";
>> +			drive-strength =3D <2>;
>> +			bias-disable;
>> +		};
>> +
>> +		wake-n-pins {
>> +			pins =3D "gpio154";
>> +			function =3D "gpio";
>> +			drive-strength =3D <2>;
>> +			bias-pull-up;
>> +		};
>> +	};
>> +
>> +	rtmr1_default: rtmr1-reset-n-active-state {
>> +		pins =3D "gpio176";
>> +		function =3D "gpio";
>> +		drive-strength =3D <2>;
>> +		bias-disable;
>> +	};
>> +
>> +	sdc2_card_det_n: sdc2-card-det-state {
>> +		pins =3D "gpio71";
>> +		function =3D "gpio";
>> +		drive-strength =3D <2>;
>> +		bias-pull-up;
>> +	};
>> +
>> +	tpad_default: tpad-default-state {
>> +		disable-pins {
>> +			pins =3D "gpio38";
>> +			function =3D "gpio";
>> +			output-high;
>> +		};
>> +
>> +		int-n-pins {
>> +			pins =3D "gpio3";
>> +			function =3D "gpio";
>> +			bias-pull-up;
>> +		};
>> +
>> +		reset-n-pins {
>> +			pins =3D "gpio52";
>> +			function =3D "gpio";
>> +			bias-disable;
>> +		};
>> +	};
>> +
>> +	ts0_default: ts0-default-state {
>> +		disable-pins {
>> +			pins =3D "gpio75";
>> +			function =3D "gpio";
>> +			output-high;
>> +		};
>> +
>> +		int-n-pins {
>> +			pins =3D "gpio51";
>> +			function =3D "gpio";
>> +			bias-pull-up;
>> +		};
>> +
>> +		reset-n-pins {
>> +			/* Technically should be High-Z input */
>> +			pins =3D "gpio48";
>> +			function =3D "gpio";
>> +			output-low;
>> +			drive-strength =3D <2>;
>> +		};
>> +	};
>> +
>> +	usb1_pwr_1p15_reg_en: usb1-pwr-1p15-reg-en-state {
>> +		pins =3D "gpio188";
>> +		function =3D "gpio";
>> +		drive-strength =3D <2>;
>> +		bias-disable;
>> +	};
>> +
>> +	usb1_pwr_1p8_reg_en: usb1-pwr-1p8-reg-en-state {
>> +		pins =3D "gpio175";
>> +		function =3D "gpio";
>> +		drive-strength =3D <2>;
>> +		bias-disable;
>> +	};
>> +
>> +	usb1_pwr_3p3_reg_en: usb1-pwr-3p3-reg-en-state {
>> +		pins =3D "gpio186";
>> +		function =3D "gpio";
>> +		drive-strength =3D <2>;
>> +		bias-disable;
>> +	};
>> +
>> +	wcn_sw_en: wcn-sw-en-state {
>> +		pins =3D "gpio214";
>> +		function =3D "gpio";
>> +		drive-strength =3D <2>;
>> +		bias-disable;
>> +	};
>> +
>> +	wcn_wlan_bt_en: wcn-wlan-bt-en-state {
>> +		pins =3D "gpio116", "gpio117";
>> +		function =3D "gpio";
>> +		drive-strength =3D <2>;
>> +		bias-disable;
>> +	};
>> +};
>> +
>> +&uart14 {
>> +	status =3D "okay";
>> +
>> +	bluetooth {
>> +		compatible =3D "qcom,wcn7850-bt";
>> +		max-speed =3D <3200000>;
>> +
>> +		vddaon-supply =3D <&vreg_pmu_aon_0p59>;
>> +		vddwlcx-supply =3D <&vreg_pmu_wlcx_0p8>;
>> +		vddwlmx-supply =3D <&vreg_pmu_wlmx_0p85>;
>> +		vddrfacmn-supply =3D <&vreg_pmu_rfa_cmn>;
>> +		vddrfa0p8-supply =3D <&vreg_pmu_rfa_0p8>;
>> +		vddrfa1p2-supply =3D <&vreg_pmu_rfa_1p2>;
>> +		vddrfa1p8-supply =3D <&vreg_pmu_rfa_1p8>;
>> +	};
>> +};
>> +
>> +&usb_1_ss0_hsphy {
>> +	vdd-supply =3D <&vreg_l3j_0p8>;
>> +	vdda12-supply =3D <&vreg_l2j_1p2>;
>> +
>> +	phys =3D <&smb2360_0_eusb2_repeater>;
>> +
>> +	status =3D "okay";
>> +};
>> +
>> +&usb_1_ss0_qmpphy {
>> +	vdda-phy-supply =3D <&vreg_l2j_1p2>;
>> +	vdda-pll-supply =3D <&vreg_l1j_0p8>;
>> +
>> +	status =3D "okay";
>> +};
>> +
>> +&usb_1_ss0 {
>> +	status =3D "okay";
>> +};
>
>Please order the chunks alphabetically=2E &usb_1_ss0_qmpphy can't be
>before &usb_1_ss0=2E
>
>> +
>> +&usb_1_ss0_dwc3 {
>> +	dr_mode =3D "host";
>
>This doesn't seem to match with the PMIC glink properties=2E
>
>> +};
>> +
>> +&usb_1_ss0_dwc3_hs {
>> +	remote-endpoint =3D <&pmic_glink_ss0_hs_in>;
>> +};
>> +
>> +&usb_1_ss0_qmpphy_out {
>> +	remote-endpoint =3D <&retimer_ss0_ss_in>;
>> +};
>> +
>> +&usb_1_ss1_hsphy {
>> +	vdd-supply =3D <&vreg_l3j_0p8>;
>> +	vdda12-supply =3D <&vreg_l2j_1p2>;
>> +
>> +	phys =3D <&smb2360_1_eusb2_repeater>;
>> +
>> +	status =3D "okay";
>> +};
>> +
>> +&usb_1_ss1_qmpphy {
>> +	vdda-phy-supply =3D <&vreg_l2j_1p2>;
>> +	vdda-pll-supply =3D <&vreg_l2d_0p9>;
>> +
>> +	status =3D "okay";
>> +};
>> +
>> +&usb_1_ss1 {
>> +	status =3D "okay";
>> +};
>> +
>> +&usb_1_ss1_dwc3 {
>> +	dr_mode =3D "host";
>
>This also doesn't match PMIC GLINK configuration=2E
>
>> +};
>> +
>> +&usb_1_ss1_dwc3_hs {
>> +	remote-endpoint =3D <&pmic_glink_ss1_hs_in>;
>> +};
>> +
>> +&usb_1_ss1_qmpphy_out {
>> +	remote-endpoint =3D <&retimer_ss1_ss_in>;
>> +};
>> +
>> +&usb_2 {
>> +	status =3D "okay";
>> +};
>> +
>> +&usb_2_dwc3 {
>> +	dr_mode =3D "host";
>> +};
>> +
>> +&usb_2_hsphy {
>> +	vdd-supply =3D <&vreg_l2e_0p8>;
>> +	vdda12-supply =3D <&vreg_l3e_1p2>;
>> +
>> +	phys =3D <&eusb5_frp_repeater>;
>> +
>> +	status =3D "okay";
>> +};
>> +
>> +&usb_mp {
>> +	status =3D "okay";
>> +};
>> +
>> +&usb_mp_dwc3 {
>> +	phys =3D <&usb_mp_hsphy0>, <&usb_mp_qmpphy0>;
>> +	phy-names =3D "usb2-0", "usb3-0";
>> +};
>> +
>> +&usb_mp_hsphy0 {
>> +	vdd-supply =3D <&vreg_l2e_0p8>;
>> +	vdda12-supply =3D <&vreg_l3e_1p2>;
>> +
>> +	phys =3D <&eusb3_typea_repeater>;
>> +
>> +	status =3D "okay";
>> +};
>> +
>> +&usb_mp_qmpphy0 {
>> +	vdda-phy-supply =3D <&vreg_l3e_1p2>;
>> +	vdda-pll-supply =3D <&vreg_l3c_0p8>;
>> +
>> +	status =3D "okay";
>> +};
>> --=20
>> 2=2E49=2E0
>>=20
>

=E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D

