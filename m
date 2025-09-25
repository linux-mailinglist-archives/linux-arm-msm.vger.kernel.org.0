Return-Path: <linux-arm-msm+bounces-74861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E51B9D18E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 04:09:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D55AD4E0230
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 02:09:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F5892E172E;
	Thu, 25 Sep 2025 02:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oAqpE0WX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615522E0921
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758766185; cv=none; b=WaV4JpPJaySbki+ZVPnAvvwnrlM9UEzg5ZuC8SvPiQ41wy9IVhS+QVGxhpHXZdv/uAEXs3rMEykqrq1yI1szqoZEfMmszz06enQO+d4vsAP90uYSFh0IGWi0YpeA/9nmBjMQm6HY1iRwcUBQXz8IM/VlDzsFp5lqLKIccZahDLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758766185; c=relaxed/simple;
	bh=KQZBkgd8PEhZC+eeB3pNQ0rqG3M5g2M7/5Gk3+tFhnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WKcZ4jo9G8kuDH6NQmxsj5T5o+rInX11ookL+fUw4w/JSbz7n8f7SGeSqdIN+akZi4vFe8J93sueEZ65bY1pqqOeGOX4ulVTY4d9XMVJZfqz4ehfujgNIQEbnkfhOI741k6t6/9RYhEHsFZL6CmEA/J3MBxldXvcdjBYw+93f+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oAqpE0WX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ONqWoC023856
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:09:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ijMwnq00KQMGyCqWB/+pBjCR
	blHDrvMixPuC+nbcymw=; b=oAqpE0WXS95C59So9jPVbVJF7381f7fO5PgtoryK
	qrtr4WxE7kTcShC9ixdk0p7FYKPAPWpH72+uSF3KdeL/STQIye59GD/U60VKO+ME
	PEJXbj8oPDJ41VNMbSBXDAnz7h8XdkHd71K7moGhq83DuYVsqb16UcDSl8wRRO0A
	clvp0bIKvDTb4UOInQGrjqt3r3/waWvLdKzQVt0AwIPMy1LxLZ5IEVda341Eywhh
	E5984oHnGpAqR8Xgm1NXdhxg3/8xT2sCvX1/D2IfCA4Y55y1l1Mu7rQLpsrJKQwm
	I8T+4/jBD9Shy6sxGvNqx0vYEhpLHey55L7T5pHGALmd7A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bwp0ddpf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:09:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b5f31ef7dfso33462971cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 19:09:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758766181; x=1759370981;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ijMwnq00KQMGyCqWB/+pBjCRblHDrvMixPuC+nbcymw=;
        b=u+QcDviFcAcnY+Cbz5DzTgTvEC/iDHFyDarHTFWxziKPy+r+JM6n8A1wU3RG9FB6lU
         oQbo4nadqa+HnzWd5BWUzGdrJazsLi2RMVxjcoYQlERJpigxDD3gKHwD90Q8SC2HwMV/
         Avtbo6E+g9kuP91hhB8gB1i9Ftr2k5j8qON3zKgT59fJdrVMhA+S3sQoaWucsogqh4We
         S28qvQMZ+4oIQjw/XK/QWPWxPkIvHwqm5LuGOEFV9cZAsq0i2Ugly+6Lxmm/or4IHuAg
         tPsDmJ1HIiLkZ5in5IY5MGv9Tr3RwtknFKRycXhGF+wMS6mrvf6MH+UP+47hkGC+7ZyX
         bukw==
X-Forwarded-Encrypted: i=1; AJvYcCW8JcPh4VXrEQIvfQEgLiFa+TnWgRZjNgw7ydrvqZ7rE/VJW6cl9/upcWVCfbHcdPpTulhVOZPZ0uKT7zcc@vger.kernel.org
X-Gm-Message-State: AOJu0YyKtNQh1aj5+Q5c5ZRjSRWxMyz+hSFrvWk7xRyOhc3u259Q4T/m
	l6GxQ0ddnI7j9EzQlTKVOcjQcayzcqahO9Ya5yW2WN2+weOLsQSjnYsOQEyGYU5vtTxq4XUkfHa
	hNpLsi1KrpeaRYFINY/7RgTNl/YJqAVE40zaUos6h69eLRxhZTeC0o6ZYuFwSxFYsw84Y
X-Gm-Gg: ASbGncuVz340BxQ5XXOpC/cIPxPeCTQ5u7mpmUWRpLq3zT5OsHaCMZF4BuZ3kyXt539
	oEja8F6XEldDJCcxZK+peIwWflcmUJ/Oq2Ty2PdF865oUVx092g663Dyh9jpBqUwbJzLi0naDIK
	4r7zV2j4hpNNQ/1Rcg14c0y0E+Q1QsCKRE/F6pexcXqDA0FFUEG0i1wjUPFMuj+SD2bayk3+hQ5
	gF0vrDbLApmYdIMFJy5JqadDHAyxeddj6BzxNbiBCA1tmBLfTy5ufU5vHhPzvVVOjmBz7QtrZHj
	PMfhVXgzdQWKolJll5BSaW1MM9wIeIzgGoV2KvC3fIGRQvf6QCpPyzyf6L/pjSM3obbirjadnyW
	OPNKergZ4mNTFBMPBrGvwdXm2EKbU1IwrG837O2Iqj8XvQAULeKBZ
X-Received: by 2002:ac8:7f13:0:b0:4b7:7e3b:26d2 with SMTP id d75a77b69052e-4dacd244d39mr12284521cf.25.1758766181188;
        Wed, 24 Sep 2025 19:09:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEe0/BulJdAP14m2xhtPKN6khhD7s3V3RWEkz5ZDS21UR80IvlVPTk21e9TgoLukdvzzDr05Q==
X-Received: by 2002:ac8:7f13:0:b0:4b7:7e3b:26d2 with SMTP id d75a77b69052e-4dacd244d39mr12284151cf.25.1758766180620;
        Wed, 24 Sep 2025 19:09:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583134308b9sm233112e87.31.2025.09.24.19.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 19:09:39 -0700 (PDT)
Date: Thu, 25 Sep 2025 05:09:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com
Subject: Re: [PATCH 14/20] arm64: dts: qcom: kaanapali-mtp: Enable more
 features
Message-ID: <ejcchgc3isc5f6tmiqbxqihmk5efmbcyhv3ehuoerb5ulkd5an@g7a2wc422l6n>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <20250924-knp-dts-v1-14-3fdbc4b9e1b1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-knp-dts-v1-14-3fdbc4b9e1b1@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KNxaDEFo c=1 sm=1 tr=0 ts=68d4a466 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=bzJb5gqkE5SIJMwU7FwA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: rbbueONlngOxyCV7PrJFrHP8Y1nMdC8U
X-Proofpoint-ORIG-GUID: rbbueONlngOxyCV7PrJFrHP8Y1nMdC8U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDEzOCBTYWx0ZWRfX6VlNjPszBzM4
 H1pXyQ6kLnw5ek2Rjr+uECiJhS6LwmBJMONwscGtMX2MYCk5TxNZm9qenxrzcz0tNQZajM06If3
 fRCBGcQPjSfCQA+YUGSw5RRHM3TQm5A2R2C1dfEIxDKMmG3lfAy47aT4PcgYBmIMKknaUFZ59lG
 RRDEGVQ8jpVJXzEE1wCB6OeqqOU9MjBMlxS4Osuy5KIU/bP08RrFnr/R4JAFCO51Kstb0FDWmB0
 XTQnGS+fX7mgeGA4XsaT8eqYL2HwfbO9cmbNVXRB2dlLOpm+6QkPib31pbQWmj4792wzKrYy9Nz
 k5l8SFtcHA7tgRDsE+vFARj7OEw3YE73jyM2RP8MB0QgKqDs5tF18G4rMFfPMXXvjF18IrEkYR1
 6WPJz1fR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230138

On Wed, Sep 24, 2025 at 05:17:31PM -0700, Jingyi Wang wrote:
> Enable more features on Kaanapali MTP boards including PMIC peripherals,
> bus, SDHCI, remoteprocs, USB, PCIE, WLAN and Bluetooth.
> 
> Written with help from Jyothi Kumar Seerapu(added bus), Ronak Raheja
> (added USB), Manish Pandey(added SDHCI), Jishnu Prakash(added PMIC),
> Qiang Yu(added PCIE), Yijie Yang(Added WLAN) and Zijun Hu(Added Bluetooth).
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 663 +++++++++++++++++++++++++++++
>  1 file changed, 663 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> index 9cf3158e2712..2949579481a9 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> @@ -5,9 +5,23 @@
>  
>  /dts-v1/;
>  
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/linux-event-codes.h>
> +#include <dt-bindings/leds/common.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  #include "kaanapali.dtsi"
>  
> +#define PMH0110_D_E0_SID 3
> +#define PMH0110_F_E0_SID 5
> +#define PMH0110_G_E0_SID 6
> +#define PMH0110_I_E0_SID 8
> +#define PMH0104_J_E1_SID 9
> +
> +#include "pmk8850.dtsi"
> +#include "pmh0101.dtsi"
> +#include "pmh0110.dtsi"
> +#include "pmh0104.dtsi"
> +
>  / {
>  	model = "Qualcomm Technologies, Inc. Kaanapali MTP";
>  	compatible = "qcom,kaanapali-mtp", "qcom,kaanapali";
> @@ -15,6 +29,7 @@ / {
>  
>  	aliases {
>  		serial0 = &uart7;
> +		serial1 = &uart18;
>  	};
>  
>  	chosen {
> @@ -52,6 +67,304 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
>  			clock-div = <2>;
>  		};
>  	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		pinctrl-0 = <&key_vol_up_default>;
> +		pinctrl-names = "default";
> +
> +		key-volume-up {
> +			label = "Volume Up";
> +			linux,code = <KEY_VOLUMEUP>;
> +			gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
> +			debounce-interval = <15>;
> +			linux,can-disable;
> +			wakeup-source;
> +		};
> +	};
> +
> +	thermal-zones {
> +		pmh0101-thermal {
> +			polling-delay-passive = <100>;
> +
> +			thermal-sensors = <&pmh0101_temp_alarm>;
> +
> +			trips {
> +				trip0 {
> +					temperature = <95000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				trip1 {
> +					temperature = <115000>;
> +					hysteresis = <0>;
> +					type = "hot";
> +				};
> +			};
> +		};
> +
> +		pmh0104-thermal {
> +			polling-delay-passive = <100>;
> +
> +			thermal-sensors = <&pmh0104_j_e1_temp_alarm>;
> +
> +			trips {
> +				trip0 {
> +					temperature = <95000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				trip1 {
> +					temperature = <115000>;
> +					hysteresis = <0>;
> +					type = "hot";
> +				};
> +			};
> +		};
> +
> +		pmh0110-d-thermal {
> +			polling-delay-passive = <100>;
> +
> +			thermal-sensors = <&pmh0110_d_e0_temp_alarm>;
> +
> +			trips {
> +				trip0 {
> +					temperature = <95000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				trip1 {
> +					temperature = <115000>;
> +					hysteresis = <0>;
> +					type = "hot";
> +				};
> +			};
> +		};
> +
> +		pmh0110-f-thermal {
> +			polling-delay-passive = <100>;
> +
> +			thermal-sensors = <&pmh0110_f_e0_temp_alarm>;
> +
> +			trips {
> +				trip0 {
> +					temperature = <95000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				trip1 {
> +					temperature = <115000>;
> +					hysteresis = <0>;
> +					type = "hot";
> +				};
> +			};
> +		};
> +
> +		pmh0110-g-thermal {
> +			polling-delay-passive = <100>;
> +
> +			thermal-sensors = <&pmh0110_g_e0_temp_alarm>;
> +
> +			trips {
> +				trip0 {
> +					temperature = <95000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				trip1 {
> +					temperature = <115000>;
> +					hysteresis = <0>;
> +					type = "hot";
> +				};
> +			};
> +		};
> +
> +		pmh0110-i-thermal {
> +			polling-delay-passive = <100>;
> +
> +			thermal-sensors = <&pmh0110_i_e0_temp_alarm>;
> +
> +			trips {
> +				trip0 {
> +					temperature = <95000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				trip1 {
> +					temperature = <115000>;
> +					hysteresis = <0>;
> +					type = "hot";
> +				};
> +			};
> +		};
> +
> +		pmd8028-thermal {
> +			polling-delay-passive = <100>;
> +			thermal-sensors = <&pmd8028_temp_alarm>;
> +
> +			trips {
> +				pmd8028_trip0: trip0 {
> +					temperature = <95000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				pmd8028_trip1: trip1 {
> +					temperature = <115000>;
> +					hysteresis = <0>;
> +					type = "hot";
> +				};
> +			};
> +		};
> +
> +		pmih0108-thermal {
> +			polling-delay-passive = <100>;
> +			thermal-sensors = <&pmih0108_temp_alarm>;
> +
> +			trips {
> +				trip0 {
> +					temperature = <95000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				trip1 {
> +					temperature = <115000>;
> +					hysteresis = <0>;
> +					type = "hot";
> +				};
> +			};
> +		};
> +
> +		pmr735d-thermal {
> +			polling-delay-passive = <100>;
> +
> +			thermal-sensors = <&pmr735d_temp_alarm>;
> +
> +			trips {
> +				trip0 {
> +					temperature = <95000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				trip1 {
> +					temperature = <115000>;
> +					hysteresis = <0>;
> +					type = "hot";
> +				};
> +			};
> +		};
> +
> +		pm8010-m-thermal {
> +			polling-delay-passive = <100>;
> +
> +			thermal-sensors = <&pm8010_m_temp_alarm>;
> +
> +			trips {
> +				trip0 {
> +					temperature = <95000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				trip1 {
> +					temperature = <115000>;
> +					hysteresis = <0>;
> +					type = "hot";
> +				};
> +			};
> +		};
> +
> +		pm8010-n-thermal {
> +			polling-delay-passive = <100>;
> +
> +			thermal-sensors = <&pm8010_n_temp_alarm>;
> +
> +			trips {
> +				trip0 {
> +					temperature = <95000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				trip1 {
> +					temperature = <115000>;
> +					hysteresis = <0>;
> +					type = "hot";
> +				};
> +			};
> +		};
> +	};
> +
> +	wcn7850-pmu {
> +		compatible = "qcom,wcn7850-pmu";
> +
> +		pinctrl-0 = <&bt_default>, <&sw_ctrl_default>, <&wlan_en>;
> +		pinctrl-names = "default";
> +
> +		bt-enable-gpios = <&pmh0104_j_e1_gpios 5 GPIO_ACTIVE_HIGH>;
> +		wlan-enable-gpios = <&tlmm 16 GPIO_ACTIVE_HIGH>;
> +
> +		vdd-supply = <&vreg_s2j_0p8>;
> +		vddio-supply = <&vreg_l2g_1p8>;
> +		vddio1p2-supply = <&vreg_l3g_1p2>;
> +		vddaon-supply = <&vreg_s7g_0p9>;
> +		vdddig-supply = <&vreg_s1j_0p8>;
> +		vddrfa1p2-supply = <&vreg_s7f_1p2>;
> +		vddrfa1p8-supply = <&vreg_s8f_1p8>;
> +
> +		clocks = <&rpmhcc RPMH_RF_CLK1>;
> +
> +		regulators {
> +			vreg_pmu_rfa_cmn: ldo0 {
> +				regulator-name = "vreg_pmu_rfa_cmn";
> +			};
> +
> +			vreg_pmu_aon_0p59: ldo1 {
> +				regulator-name = "vreg_pmu_aon_0p59";
> +			};
> +
> +			vreg_pmu_wlcx_0p8: ldo2 {
> +				regulator-name = "vreg_pmu_wlcx_0p8";
> +			};
> +
> +			vreg_pmu_wlmx_0p85: ldo3 {
> +				regulator-name = "vreg_pmu_wlmx_0p85";
> +			};
> +
> +			vreg_pmu_btcmx_0p85: ldo4 {
> +				regulator-name = "vreg_pmu_btcmx_0p85";
> +			};
> +
> +			vreg_pmu_rfa_0p8: ldo5 {
> +				regulator-name = "vreg_pmu_rfa_0p8";
> +			};
> +
> +			vreg_pmu_rfa_1p2: ldo6 {
> +				regulator-name = "vreg_pmu_rfa_1p2";
> +			};
> +
> +			vreg_pmu_rfa_1p8: ldo7 {
> +				regulator-name = "vreg_pmu_rfa_1p8";
> +			};
> +
> +			vreg_pmu_pcie_0p9: ldo8 {
> +				regulator-name = "vreg_pmu_pcie_0p9";
> +			};
> +
> +			vreg_pmu_pcie_1p8: ldo9 {
> +				regulator-name = "vreg_pmu_pcie_1p8";
> +			};
> +		};
> +	};
>  };
>  
>  &apps_rsc {
> @@ -674,6 +987,304 @@ vreg_l7n_3p3: ldo7 {
>  	};
>  };
>  
> +&pmh0110_d_e0 {
> +	status = "okay";
> +};
> +
> +&pmh0110_f_e0 {
> +	status = "okay";
> +};
> +
> +&pmh0110_g_e0 {
> +	status = "okay";
> +};
> +
> +&pmh0110_i_e0 {
> +	status = "okay";
> +};
> +
> +&spmi_bus1 {
> +	pmd8028: pmic@4 {
> +		compatible = "qcom,pmd8028", "qcom,spmi-pmic";
> +		reg = <0x4 SPMI_USID>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		pmd8028_temp_alarm: temp-alarm@a00 {
> +			compatible = "qcom,spmi-temp-alarm";
> +			reg = <0xa00>;
> +			interrupts = <0x4 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
> +			#thermal-sensor-cells = <0>;
> +		};
> +
> +		pmd8028_gpios: gpio@8800 {
> +			compatible = "qcom,pmd8028-gpio", "qcom,spmi-gpio";
> +			reg = <0x8800>;
> +			gpio-controller;
> +			gpio-ranges = <&pmd8028_gpios 0 0 4>;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +
> +	pmih0108: pmic@7 {
> +		compatible = "qcom,pmih0108", "qcom,spmi-pmic";
> +		reg = <0x7 SPMI_USID>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		pmih0108_temp_alarm: temp-alarm@a00 {
> +			compatible = "qcom,spmi-temp-alarm";
> +			reg = <0xa00>;
> +			interrupts = <0x7 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
> +			#thermal-sensor-cells = <0>;
> +		};
> +
> +		pmih0108_gpios: gpio@8800 {
> +			compatible = "qcom,pmih0108-gpio", "qcom,spmi-gpio";
> +			reg = <0x8800>;
> +			gpio-controller;
> +			gpio-ranges = <&pmih0108_gpios 0 0 18>;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +
> +		pmih0108_eusb2_repeater: phy@fd00 {
> +			compatible = "qcom,pm8550b-eusb2-repeater";
> +			reg = <0xfd00>;
> +			#phy-cells = <0>;
> +			vdd18-supply = <&vreg_l15b_1p8>;
> +			vdd3-supply = <&vreg_l5b_3p1>;
> +		};
> +	};
> +
> +	pmr735d: pmic@a {
> +		compatible = "qcom,pmr735d", "qcom,spmi-pmic";
> +		reg = <0xa SPMI_USID>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		pmr735d_temp_alarm: temp-alarm@a00 {
> +			compatible = "qcom,spmi-temp-alarm";
> +			reg = <0xa00>;
> +			interrupts = <0xa 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
> +			#thermal-sensor-cells = <0>;
> +		};
> +
> +		pmr735d_gpios: gpio@8800 {
> +			compatible = "qcom,pmr735d-gpio", "qcom,spmi-gpio";
> +			reg = <0x8800>;
> +			gpio-controller;
> +			gpio-ranges = <&pmr735d_gpios 0 0 2>;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +
> +	pm8010_m: pmic@c {
> +		compatible = "qcom,pm8010", "qcom,spmi-pmic";
> +		reg = <0xc SPMI_USID>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		pm8010_m_temp_alarm: temp-alarm@2400 {
> +			compatible = "qcom,spmi-temp-alarm";
> +			reg = <0x2400>;
> +			interrupts = <0xc 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
> +			#thermal-sensor-cells = <0>;
> +		};
> +	};
> +
> +	pm8010_n: pmic@d {
> +		compatible = "qcom,pm8010", "qcom,spmi-pmic";
> +		reg = <0xd SPMI_USID>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		pm8010_n_temp_alarm: temp-alarm@2400 {
> +			compatible = "qcom,spmi-temp-alarm";
> +			reg = <0x2400>;
> +			interrupts = <0xd 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
> +			#thermal-sensor-cells = <0>;
> +		};
> +	};
> +};
> +
> +&pmh0101_flash {

spmi > pmh0101_flash

> +	status = "okay";
> +
> +	led-0 {
> +		function = LED_FUNCTION_FLASH;
> +		function-enumerator = <0>;
> +		color = <LED_COLOR_ID_YELLOW>;
> +		led-sources = <1>, <4>;
> +		led-max-microamp = <500000>;
> +		flash-max-microamp = <2000000>;
> +		flash-max-timeout-us = <1280000>;
> +	};
> +
> +	led-1 {
> +		function = LED_FUNCTION_FLASH;
> +		function-enumerator = <1>;
> +		color = <LED_COLOR_ID_WHITE>;
> +		led-sources = <2>, <3>;
> +		led-max-microamp = <500000>;
> +		flash-max-microamp = <2000000>;
> +		flash-max-timeout-us = <1280000>;
> +	};
> +};
> +
> +&pmh0101_pwm {
> +	status = "okay";
> +
> +	multi-led {
> +		color = <LED_COLOR_ID_RGB>;
> +		function = LED_FUNCTION_STATUS;
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		led@1 {
> +			reg = <1>;
> +			color = <LED_COLOR_ID_RED>;
> +		};
> +
> +		led@2 {
> +			reg = <2>;
> +			color = <LED_COLOR_ID_GREEN>;
> +		};
> +
> +		led@3 {
> +			reg = <3>;
> +			color = <LED_COLOR_ID_BLUE>;
> +		};
> +	};
> +};
> +
> +&tlmm {
> +	wlan_en: wlan-en-state {
> +		pins = "gpio16";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-pull-down;
> +	};

Why are the TLMM pin entries sorted?

> +
> +	sw_ctrl_default: sw-ctrl-default-state {
> +		pins = "gpio18";
> +		function = "gpio";
> +		bias-pull-down;
> +	};
> +
> +	key_vol_up_default: key-vol-up-default-state {
> +		pins = "gpio101";
> +		function = "gpio";
> +		output-disable;
> +		bias-pull-up;
> +	};
> +
> +	pcie0_default_state: pcie0-default-state {
> +		clkreq-n-pins {
> +			pins = "gpio103";
> +			function = "pcie0_clk_req_n";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +
> +		perst-n-pins {
> +			pins = "gpio102";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +
> +		wake-n-pins {
> +			pins = "gpio104";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +	};
> +};
> +
> +&pcie0 {

This is also in the wrong place. Please keep the nodes sorted.

> +	pinctrl-0 = <&pcie0_default_state>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +};
> +
> +&pcie0_phy {
> +	vdda-phy-supply = <&vreg_l3i_0p8>;
> +	vdda-pll-supply = <&vreg_l1d_1p2>;
> +
> +	status = "okay";
> +};
> +
> @@ -702,3 +1343,25 @@ &ufs_mem_phy {
>  
>  	status = "okay";
>  };
> +
> +&usb_1 {
> +	dr_mode = "peripheral";

Is it really peripheral-only?

> +
> +	status = "okay";
> +};
> +
> +&usb_1_hsphy {
> +	vdd-supply = <&vreg_l4f_0p8>;
> +	vdda12-supply = <&vreg_l1d_1p2>;
> +
> +	phys = <&pmih0108_eusb2_repeater>;
> +
> +	status = "okay";
> +};
> +
> +&usb_dp_qmpphy {
> +	vdda-phy-supply = <&vreg_l1d_1p2>;
> +	vdda-pll-supply = <&vreg_l4f_0p8>;
> +
> +	status = "okay";
> +};
> 
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry

