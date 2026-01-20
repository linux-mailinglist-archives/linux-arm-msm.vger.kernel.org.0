Return-Path: <linux-arm-msm+bounces-89772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CC7D3C0CA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 08:45:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B1F0642265C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 07:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 892CC3A9600;
	Tue, 20 Jan 2026 07:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dj+KAAzv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OYHRVd9u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6633A900E
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 07:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768895053; cv=none; b=QGpTXhmYeeEh2MhEQq20PJ3xYNcrwbjysE8agW+Ah8WNVp35Klqd5ZYPwkQW57Y37Pml48rS0T2G02cIFPeYEE5QbT+QtvgWa7UQzbqSxmpZiK7QcXyr8SZkOVrg7XYjaVKsCRyyeTFb1LsB2ZO4DV882WnKSU7SvK2vlokie2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768895053; c=relaxed/simple;
	bh=tgkkzqoO0G4mYk0/GXSoZ8EthAD4tWHBZzRjI39EgPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OxwQzMgFpXZnG4/AxwPBwRknUZt901Sv9Q6tnlksIc9ec5URY3XnUw17NEzD1O4QOGmk1HQfL/IcpVLSKAz7eGnFyQomVmUiH0gUF0f+IW7ZVRW1f9gcWoUjtV5oKBVhU1Cv6844rQXBeuY30J1QLECT9nkfwUyV1+W55mAoQqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dj+KAAzv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OYHRVd9u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K18p3t3367154
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 07:44:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XZundmcTW/jI0iQO3o3R/Ru+
	SvmumIKnfRA2UgYRNu4=; b=Dj+KAAzvr+GeRuEU6ixufisUVOsBk8jphM+ZcCsV
	SMfN5iCtVQU8G8npu3PFW2lOhf23l9L/pnhzjzYFYdS0SMIvCSInxuRGacMQAYaD
	uzedhHKSeeEA5/kYj3tFhoIB97zpY7goTK1U0yulz5SxCtWklDBQeiPGsiZe/cqX
	19DYQQ+C0H5ESrdh5D6KYjISV6DYQee+z16Xk2rFxWI5kO6SHnJeC0ORoWJspaZE
	u56mrM/KvsrjiisSW4atPCnWk7mOeC6UXUqxbr7KIz/udhBw4q3JZUxXfutxylKQ
	+Fi/LdNUSVjuET6+1MrzC2N2A4zn5Rto1N7tAUqnB9eBow==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsysb102q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 07:44:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6ae763d03so362704985a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 23:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768895048; x=1769499848; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XZundmcTW/jI0iQO3o3R/Ru+SvmumIKnfRA2UgYRNu4=;
        b=OYHRVd9u+HHWh+iX1OYpoEEhzzkW4yEVB4B7HMMvrP80AAZH11yxCVQoP7X2dBnKxw
         fJXmIzY5I3b5FHlVI+0dadlmcCG7j4s2DVkvReqMeX2knJly8woC4ZuXkLTuRv7haliS
         kNZdPMoKLuMk2NPkGuUtbu/lMJjxJPggtssmJk43njJiAgNQKfnTDNisCfIVvoiGKV2j
         7p5VYaGXj45lvk2xE0fTdsdZIcb7Uw+ZHFO9ogVGP2LEjVGAJPcO7zQG1xjnbAPdc79M
         JUuQHy2EXruFJqvC7rUdFu6S8MhlsBqas7cYkan7rYXmtOatPJ+crdI9wKKhWDf//ObL
         0zyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768895048; x=1769499848;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XZundmcTW/jI0iQO3o3R/Ru+SvmumIKnfRA2UgYRNu4=;
        b=sWbR+dBTfQ0qzdLVgtNKyfiunP3ig/204Nh72Ym+tcz5p0qLA90SXvOhmSWIpUv3DF
         7h9d7naXFnUBNokbOX6mp7P9YQ17QVR3LLmMJ4HO1zI4/POMiHiqontzBvwMXZqHP8Wg
         Id5e1RuG7C7faSs0FDNtNLRRKcNcfpMPeM9W9sPsOulZsPUbLVYQ0DMtrqL4TX9U3GJW
         xHMFWx/eSDYb7DZWDSs2zb4Zm+FXbPnpgYVOQQrsjEirRrc4vwjsahzg1Rab8F4xeFXj
         Ge6Bo80BsPNlquR+Gba4W9oTHA+/fH+o1/kEjbfwxRHf8gkjb974Xd02uSMjcW6Ak2Yv
         s+Kg==
X-Forwarded-Encrypted: i=1; AJvYcCVCgOWMVpvb99A9bl7d0bbeIePPLvgCo5Jw7v5rFUPp19MrAiGKk3QGegn9tmzJIZt1Aoy1jKKJxyk75u7n@vger.kernel.org
X-Gm-Message-State: AOJu0YwxFLiRCYmiIAf8CoZsVkVa/ZnkvvCq+OOTMLu7Fg+JBwNjS2kL
	nnPMztJmFe65jgabdaIqNOcCVFsG649jrhxcS4eewA4qUfQNngupiFeltHpq7+WZh5Rwim3rdxG
	K/yh4AdK9GJwJbfuzSGW+5J1yucJkzYPNo8YLK+J7zIA3FRtkg1AjtbhGu+8WftwBhtlo
X-Gm-Gg: AY/fxX6hBwOHRjXTR8joj8P/W7cV5z15VfrdqeYh6xSEHiy4WBZ+8T5FcLcGcxj8+a7
	fjfxUx3qXEmrO7g0c68uXl53QY9KCKSC3rcIjnndUT0qYxCky0UOWq0865GuRpvphzb9Bh/asut
	AFxkWypthBYCd5H/Zm1T0BXIkqSsueYhVrbr4rgKlPEYIoCsEP/Mtads6sQY/X20jyy3vJC0ZJi
	OQdmzpS3p2B3h8k2zs7pTk1avB0rwRyGgfGLzcyO53ud3MMcVMFr0RGNM4KNqNKgAw3XEXOX253
	LPzfgQQdPXwX1JPYOh/kW1Tax1y/YVtGHONU1lqdwJLSJANnlmWRg6vW6JS45YkW5OvaxG0VQ4p
	YOp0kV8sSIou+Qyay1xQgCSBztqDQCv47pZRigDuOaMFZP2UBMM5MxkdQ3/WWcGMYCTQ27my7B7
	3a0GyWU3WXqdnfxwp+t6j5qvA=
X-Received: by 2002:a05:620a:2993:b0:8c3:7e51:94c6 with SMTP id af79cd13be357-8c6ccf1f45cmr96019685a.60.1768895047626;
        Mon, 19 Jan 2026 23:44:07 -0800 (PST)
X-Received: by 2002:a05:620a:2993:b0:8c3:7e51:94c6 with SMTP id af79cd13be357-8c6ccf1f45cmr96018085a.60.1768895047107;
        Mon, 19 Jan 2026 23:44:07 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf33eb76sm4046131e87.10.2026.01.19.23.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 23:44:06 -0800 (PST)
Date: Tue, 20 Jan 2026 09:44:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wei Zhang <wei.zhang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8] arm64: dts: qcom: qcs8300-ride: enable WLAN on
 qcs8300-ride
Message-ID: <i77z7i45g72k4hqzd33z643xiuol7olbk65dzv62fgdhcllsmc@kcixnktiyknq>
References: <20260120070650.3192679-1-wei.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120070650.3192679-1-wei.zhang@oss.qualcomm.com>
X-Proofpoint-GUID: eXn1KbYbXUJfmxVIiNwmEfzS_FnrCfP8
X-Authority-Analysis: v=2.4 cv=XJ89iAhE c=1 sm=1 tr=0 ts=696f3248 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=Izy8X8xn6fKOs-2nxi4A:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: eXn1KbYbXUJfmxVIiNwmEfzS_FnrCfP8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA2MyBTYWx0ZWRfXyqaF3gBnsTMe
 7S4dNSQD3RhMGNAbvcJprq6/BoIGjKAKF525IATrzITCw3WZhCZa+lKxzgHRfzznN3D/S7kNWTt
 xJaBwr45Wl+Mxp0SlNFyyVyCM1VRUOYFzo8lwPW9mmpEOvYMZV1yeqB/VUfs1LZNvU5DeP77No6
 0gCGJeBBS7OFBsjd3od9kf68kVgqaljdrphlDRwIjYuemFU/gVwia9rCIXuHuOk+tCbMnpEC818
 bS56315yjTV+WcaxNSESs/6ygk/wIAy+Hn5poTZc8oXA4U5vXcx13EN8dgSGwIgRqa/pcbwIznD
 T23MffxDOsHx7EId2MB5PpsQv9ni77Ge9Hul0GajtzVXCJgmPiL71n83uy4JD7xVYfXnNOWiKrl
 QvkJAQEUN2HGbUjDfaV7LjeIp1lcnvV78dC5OEroWSgporAP6ThNPI7MYM9QeFSpwxRPSpjdK4u
 o6W0EpS3Xs6U5WzBk0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_02,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 bulkscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200063

On Mon, Jan 19, 2026 at 11:06:49PM -0800, Wei Zhang wrote:
> Enable WLAN on qcs8300-ride by adding a node for the PMU module
> of the WCN6855 and assigning its LDO power outputs to the existing
> WiFi module.
> 
> On the qcs8300-ride platform, the corresponding firmware and BDF
> are QCA6698AQ instead of WCN6855, which have been added in the
> 20250211 release.
> 
> Signed-off-by: Wei Zhang <wei.zhang@oss.qualcomm.com>
> ---
> This patch depends on:
> - PCIe
> https://lore.kernel.org/all/20251128104928.4070050-1-ziyue.zhang@oss.qualcomm.com/
> 
> Changes in v8:
> - Reordered regulator nodes to maintain alphabetical consistency (Dmitry)
> - Place wifi@0 node under existing pcieport0 label
> - Link to v7: https://lore.kernel.org/all/20260119090758.2780678-1-wei.zhang@oss.qualcomm.com/
> 
> Changes in v7:
> - Align regulator node names to match the existing naming style in the dts (Dmitry)
> - Link to v6: https://lore.kernel.org/all/20260119080125.2761623-1-wei.zhang@oss.qualcomm.com/
> 
> Changes in v6:
> - Rebase patches
> - Remove unintended 'output-low' from wlan-en-state pinctrl (Konrad)
> - Link to v5: https://lore.kernel.org/all/20251113055148.2729943-1-wei.zhang@oss.qualcomm.com/
> 
> Changes in v5:
> - Rebase patches
> - Flip the order of property-n and property-names (Konrad)
> - Flip the order of bias and output property (Konrad)
> - Link to v4: https://lore.kernel.org/all/20250325075331.1662306-1-quic_stonez@quicinc.com/
> 
> Changes in v4:
> - Rename the symbol pcieport0 to pcie0_port0 (Konrad)
> - Adjust the property order in node pcie0_port0 (Konrad)
> - Add to the commit message mentioning FW and BDF used by QCS8300 (Dmitry)
> - Specify the calibration data using the correct variant (Dmitry)
> - Link to v3: https://lore.kernel.org/all/20250318093350.2682132-1-quic_stonez@quicinc.com/
> 
> Changes in v3:
> - Complete the nodes property definitions according to DTS binding requirements (Bjorn)
> - Link to v2: https://lore.kernel.org/all/20250227065439.1407230-1-quic_stonez@quicinc.com/
> 
> Changes in v2:
> - Rename the nodes name according to DTS coding style (Konrad & Krzysztof)
> - Provide regulator-min/max-microvolt to the regulators (Konrad)
> - Link to v1: https://lore.kernel.org/all/20250210062910.3618336-1-quic_stonez@quicinc.com/
> ---
>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 105 ++++++++++++++++++++++
>  1 file changed, 105 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> index 68691f7b5f94..864b32503d29 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> @@ -24,6 +24,26 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	vreg_conn_1p8: regulator-conn-1p8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_conn_1p8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		startup-delay-us = <4000>;
> +		enable-active-high;
> +		gpio = <&pmm8650au_1_gpios 4 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	vreg_conn_pa: regulator-conn-pa {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_conn_pa";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		startup-delay-us = <4000>;
> +		enable-active-high;
> +		gpio = <&pmm8650au_1_gpios 6 GPIO_ACTIVE_HIGH>;
> +	};
> +
>  	regulator-usb2-vbus {
>  		compatible = "regulator-fixed";
>  		regulator-name = "USB2_VBUS";
> @@ -33,6 +53,68 @@ regulator-usb2-vbus {
>  		enable-active-high;
>  		regulator-always-on;
>  	};
> +
> +	wcn6855-pmu {
> +		compatible = "qcom,wcn6855-pmu";
> +
> +		pinctrl-0 = <&wlan_en_state>;
> +		pinctrl-names = "default";
> +
> +		vddio-supply = <&vreg_conn_pa>;
> +		vddaon-supply = <&vreg_conn_1p8>;
> +		vddpmu-supply = <&vreg_conn_pa>;
> +		vddpmumx-supply = <&vreg_conn_1p8>;
> +		vddpmucx-supply = <&vreg_conn_pa>;
> +		vddrfa0p95-supply = <&vreg_conn_1p8>;

How comes that 0.95V pin is powred on by 1.8V? How comes that 1.3V
pin is powered on by 1.8V?

> +		vddrfa1p3-supply = <&vreg_conn_pa>;
> +		vddrfa1p9-supply = <&vreg_conn_1p8>;
> +		vddpcie1p3-supply = <&vreg_conn_pa>;
> +		vddpcie1p9-supply = <&vreg_conn_1p8>;
> +
> +		wlan-enable-gpios = <&tlmm 54 GPIO_ACTIVE_HIGH>;
> +
-- 
With best wishes
Dmitry

