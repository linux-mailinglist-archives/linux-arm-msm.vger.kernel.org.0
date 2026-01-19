Return-Path: <linux-arm-msm+bounces-89586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA92D3A1F3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 09:45:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C8DC130056CF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 08:45:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F3DA347BA3;
	Mon, 19 Jan 2026 08:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dLZxPARZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZJ5YMLaK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBAB347FD8
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 08:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768812331; cv=none; b=p1422o/r4yNYktVEf85timlTTU7uvmMId9ATAuNLOVZJ3lfYm5sThxmVbWhSDhkyJm3KXLeZSoeockq/j/y7ogHOTBJk/SNzkQ6GhnUITdiQSpsVWB2jsnrkxnOZ2MXPQpwdd2V+SZx+eyRXzlO3TaJaq5wa3hpsgHI352t0QTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768812331; c=relaxed/simple;
	bh=ewfHaESyQdaQ7RSizYchr7OkxpvMgXkcPV4r28ALsN0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZXvbrdrhVps5PQNk4jgDCuAQLQoeEUfgnBXzWXjY14Z4MqSUXqVTeWLNsNbT33WH4y5RlvytcGhB/KK+URnpd6aUFWI488EiN2jHpbPY+2CPs9oaEouRBhrLH83AkpZf26HJ6ukq4imWqudysYlbbxVs0tSo7a94W2JwxtZHDAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dLZxPARZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZJ5YMLaK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J86FII276675
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 08:45:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zJ/WkhxGiqKNc/4wBHKonjzmBL6vC2PQiFeJeVHtZzU=; b=dLZxPARZJywEsxjy
	WA1iPQVIjaaX72YCOw6KJaeL8cSacCgnr8Qh7baWksNFAigC1aSBqY8NRSFTYmg4
	qODUVVDa23LdzmcQS8uFiOwTu4NxFotuAChQ0b9/Jx68/E3aVEk9Ytd4iBJwuCxb
	KBqXOc685AqhI2jKDGwGb3nPHn7kTogTIpeLzT/9yEYrKnXnBLnPF12vRG7u0VmB
	aB7Q4wxDnRYdzwGnLy0DqY9kZfdo1xGp/UxOcRqHlSLkxwEenIIvvrgyqfe3OOU+
	lLNtK0XRirPtx/EILk2d+aB8BbsfbOeDR6r5DCHd3z/RJ3nuSKbGecrbQufTOLXs
	2oj+Og==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br36dcc3r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 08:45:25 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b6ad399cd8so2328428eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 00:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768812325; x=1769417125; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zJ/WkhxGiqKNc/4wBHKonjzmBL6vC2PQiFeJeVHtZzU=;
        b=ZJ5YMLaKmMq6tQJkPI4r8cK+GU1Gdpy6V9jSeixjdltkntTQ5i1y7lFJpGG1hYRMkn
         szFUVOs2/Db7MBXqChlXc7qFmJKkTvcnLSm5BvztfQfxYPak+kVdJc1EjkxWiaCGXNSN
         6+Ru78N4oNyCx4o1HXmt20hcT4qvmm1w/VOVxhLLhD8cFfypNlrOYxnwXH7WGeLop3am
         d53SWMDr2LUMUvQri3D6/JaneuWfyn5F2D7vHZLDcKTOVGYhnVKPQQeqMWb5qT5/wEyX
         GH2Wgja0JyE3mPI7nRKWEjhwdh6FRyO2cAMiPpOF4VQ4VzEyHFnHra9sB8JkSOGgCZLB
         osHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768812325; x=1769417125;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zJ/WkhxGiqKNc/4wBHKonjzmBL6vC2PQiFeJeVHtZzU=;
        b=Ewgg8nKdLmdf3Dx0bF73HNjjfwh/6eet60DZGkZFqzHdyl37BTMU1nQi572lIE/8zL
         YRs7EYHvyFyzea8OZiLUGbNssmonJlnaflE6WjHexw1u2dRUZpw1jUJ/N3EeWYXg4D34
         A3G1no0OOxY6aYi9Q5bMxjKupubM+Y5u2bupXaoz+GV7uE4a8bZkdO1S0LFXu7eRpAV+
         /Ha35Ig61uhjHaCefWIQwo/2HSbkANfj7xzTYDxO2hBXO8BGF+8MSQy7kwDdTcSo7bSP
         r4opnX1NCLesh1kng4mJhkDINiJJrm688nUmp3PIjoeGXzqVB/7puYw5ClsizC7xEoKw
         jdQg==
X-Gm-Message-State: AOJu0YxCNMDEAMxbymkg72j6iSSjdI4SFzu2N33TMAbQV76EZLETBu9H
	xzJqOeZ1b9cwHglxviDHGlrWY/XLSesFw3IOeuE1izOs+mV0Wg/MOjTWsn7UdpYDsl05lW5HFoy
	4Lo9CqQwN2fmVgjXYRr0MEVoKzeglbwgWM5Ewjq6THmqoRCd+LMYo16dr6R4Kxj7sVYSU
X-Gm-Gg: AY/fxX50Iv6WkJ6X9l57Z2tqAq3vX7O1jr8rS98Yx+euzYv0PbHNXY42A5Wa6cg7wUe
	Y3ZNCLNvHiHXLViHlo98KkGhvTumqd9c1MGNcasBQesP/N8LmJjzSvo4wtn//fxg7ZNAcve0wKT
	lfdZvlMPY46vIU+olyLT4++42Q/qxBXwBYx7pp3mOp5tfJGZNmDvPxIKV6VL6x7nugZ7yUOMEcS
	TzMSAh1ZIigDDEmKFrsO1w8vGu/wRtHo7eD2SCxwtYUuH4yTl1XUBs3TO4Gs7OkYUhl5T6wQi/V
	96dfpsdLlN1nrJt3Lv6gjKGtAZXlcfuO8nOUO2un0DCZafNWTOhZ2Vl0yvM1WZTYtqssPze71xw
	VzneQQKUF6+VVefMe5CgkCfuOxJNzVNy6v9WDRdFUrC+7zidz/ImARNmSUg==
X-Received: by 2002:a05:7022:e29:b0:123:2c98:f65d with SMTP id a92af1059eb24-1244b335a6fmr8479300c88.13.1768812324792;
        Mon, 19 Jan 2026 00:45:24 -0800 (PST)
X-Received: by 2002:a05:7022:e29:b0:123:2c98:f65d with SMTP id a92af1059eb24-1244b335a6fmr8479276c88.13.1768812324115;
        Mon, 19 Jan 2026 00:45:24 -0800 (PST)
Received: from [10.110.3.4] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ac57fd0sm14129605c88.3.2026.01.19.00.45.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 00:45:23 -0800 (PST)
Message-ID: <8a17f04b-2bae-49e4-b777-7c9cfd5d610f@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 16:45:19 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] arm64: dts: qcom: qcs8300-ride: enable WLAN on
 qcs8300-ride
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260119080125.2761623-1-wei.zhang@oss.qualcomm.com>
Content-Language: en-US
From: "Wei Zhang (Stone)" <wei.zhang@oss.qualcomm.com>
In-Reply-To: <20260119080125.2761623-1-wei.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA3MSBTYWx0ZWRfXx1GOPwc4/ZLJ
 YXcGPrNdTPntGSKTNUDKQBIdtqegfO37JybPNdjmjSNAZfOB5SEUMe8N6ejEsMVXEWtlMXjb4i2
 ra74e6PvEBh98XIOjO/GJGlmquaKOiESuVku6X5kBZuv+7o021I23TUBTRV7TSKBKQ3FxxS8aCt
 WtaDk8ZQSdgaCYWp3SGqA2UZAPiG08pDXfToit0hdwZd42SOiWhPrsN4XWYxOk9P/VASCFyK5Yx
 y8KDrKzskrF+LfljQhNDr77TDzlCgDM1PWg7tYAJ+RnHGXaZq/kZa37ka5AWlHchfQHRKtqDzKm
 7L/0T7aJBKe7GmsY5OkEyPSkroA7AaVdMTJh9kqCbdgMBYidPJvVupc6tWqRYJQ0S4rNKDZoRIh
 YPzlIgLnPVRTwg2nt+r0Q9ajETSfurVqTd/f1zf3aDGXbHSGebwtPrp1y6ei6PKRmLLriMLxweN
 2CzobnJcrqrSx4vjE/g==
X-Proofpoint-GUID: qEt1sCv_3ckCb-WxwlaARnSTRRe1h37d
X-Authority-Analysis: v=2.4 cv=GJ0F0+NK c=1 sm=1 tr=0 ts=696def25 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=oYwhgj4Yc3e4-RwmJjMA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: qEt1sCv_3ckCb-WxwlaARnSTRRe1h37d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_01,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190071

Please ignore my previous patch. It was mistakenly tagged as v6.
I will resend the correct v7 version.

Wei

On 1/19/2026 4:01 PM, Wei Zhang wrote:
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
> Changes in v7:
> - Align regulator node names to match the existing naming style in the dts (Dmitry)
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
>   arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 107 ++++++++++++++++++++++
>   1 file changed, 107 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> index 68691f7b5f94..57cf1edb2d19 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> @@ -33,6 +33,88 @@ regulator-usb2-vbus {
>   		enable-active-high;
>   		regulator-always-on;
>   	};
> +
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
> +		vddrfa1p3-supply = <&vreg_conn_pa>;
> +		vddrfa1p9-supply = <&vreg_conn_1p8>;
> +		vddpcie1p3-supply = <&vreg_conn_pa>;
> +		vddpcie1p9-supply = <&vreg_conn_1p8>;
> +
> +		wlan-enable-gpios = <&tlmm 54 GPIO_ACTIVE_HIGH>;
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
> +			vreg_pmu_rfa_1p7: ldo7 {
> +				regulator-name = "vreg_pmu_rfa_1p7";
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
>   };
>   
>   &apps_rsc {
> @@ -355,6 +437,25 @@ &pcie1_phy {
>   	status = "okay";
>   };
>   
> +&pcieport0 {
> +	wifi@0 {
> +		compatible = "pci17cb,1103";
> +		reg = <0x10000 0x0 0x0 0x0 0x0>;
> +
> +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> +		vddaon-supply = <&vreg_pmu_aon_0p59>;
> +		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> +		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
> +		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> +		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> +		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
> +		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
> +		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
> +
> +		qcom,calibration-variant = "QC_QCS8300_Ride";
> +	};
> +};
> +
>   &qupv3_id_0 {
>   	status = "okay";
>   };
> @@ -461,6 +562,12 @@ perst-pins {
>   			bias-pull-down;
>   		};
>   	};
> +
> +	wlan_en_state: wlan-en-state {
> +		pins = "gpio54";
> +		function = "gpio";
> +		bias-pull-up;
> +	};
>   };
>   
>   &uart7 {
>
> base-commit: 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
> prerequisite-patch-id: 0e8aad7b8514142fb33c17829386f17c3a55127a
> prerequisite-patch-id: e641f09d4139ac77c34757bd08af2db746de3963
> prerequisite-patch-id: 4d16e87cf6213d6e25b2c40e2753d4e629778d53
> prerequisite-patch-id: 40187dae2c9518a10866104b9fcd5a481ac67d51
> prerequisite-patch-id: dd3bdf2aebda74f3603aff24a2c9aaa7f4fd6763

