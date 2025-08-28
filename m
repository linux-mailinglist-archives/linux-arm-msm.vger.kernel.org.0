Return-Path: <linux-arm-msm+bounces-71108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE707B39B52
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 13:19:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A87997C3E94
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 11:19:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D81F6279798;
	Thu, 28 Aug 2025 11:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nwwKne4G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A72214813
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 11:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756379938; cv=none; b=XaeSGcf8BT9lj7GwamNSb3vF8UM0c4WUSNqvStrDmc3HvifnNzowcnG6ogNsmUoN+CnjNNV0Vh8CkI6TW/6mqM98G2Kot/NaIwGjBtU9xeJX4NqCOcMGaeCSz08xzueFvCG0gsWmBSX+dUTVzKy6EN0kcd9E6EMPzXYvZW16ri0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756379938; c=relaxed/simple;
	bh=SCKcRJWmqHtxEF7IsJDqrGrAmJ3L4185ji6pD7bGKJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OSK/6XNuwN6n8HJE4jmzWlsz9/ah1fPJyed7fIHL9Fpr9r0mufXLTzdG+nhgJytLPkWXGuOMoZDJq4WbQICasF9noNU2bZZUr4gnxLW8VyB2L4WudHlD54E/Y1XQMsR81SfgdZBrQfXFRNLBWjUcfGGRvM4OVXhuDDsIk0CKzyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nwwKne4G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57S5uhYN014971
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 11:18:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3ist7SJCJ+5f8cLMEQxNQ3D1
	Sm0zQYjI94N7hC2HlrU=; b=nwwKne4GEWeH8gN54IOGd77nT7fbs6qdNOsTYQQ6
	PFt7hw7LHNpfbJoArepm0b/nTEfAjzNQv0XhKiTn4p8SqKMvJ0LYUH3knPXfe9rB
	4/+BWjW328gPO1YEpkKHKhj2jannZxnBN+98QfXPLGYW78sAlAsJgGU5a153srgB
	1MRuPlOYlH7aOsXR0vDnLwmy82RvPP7cMAF6xihJ6n1BGjH1bmQhcIuI7DJaVGPx
	gUtIGB906WLk1/p58fuPYuAIASUeWG6i7/vMd3dncCMELlnLinLyckM+SPOo03d7
	PrAeC7gKY0yeoDCFZXCRIHuNUSaC1le7nxAjntdR7tTZIQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5we7qkv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 11:18:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b2b3cd4d00so23281861cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 04:18:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756379935; x=1756984735;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ist7SJCJ+5f8cLMEQxNQ3D1Sm0zQYjI94N7hC2HlrU=;
        b=RI2osfpxWtxEn5uPaPTPcvQH+X3NmXJLJPg2MH0isjgA2c6nwqp7O+GAFibP72dQu7
         HdQnxJBGmOnxDHkcGNV/I4W4S1FPSUqWovAraV9L/DNdKkpmoeKiX7nI2C4z1+vXRWzc
         wGq/pglCOAmi7Z4DKg6V57pDuSTsOZuzswFi/6FQW/pWHoXhSlHVBfWMbY7gH1nGHqQv
         eHq+SmI51zRQYFkC9F0rXI3f3jXnPNJ/QGU3n/CJiCzHnjCd0EeQF5/GVbvReCXtY81M
         rT6a7VPUlUVmNcd9OOGe0cK1zbDCwG3HRAMfWCcOb/v6jllqWZFP96eXEwG3O5mUoGM5
         wTOA==
X-Forwarded-Encrypted: i=1; AJvYcCWDNv+AqKqLQdsWMVc/VaLnL4xlUFUmkF6Z/nqoe0Et+MWmpjOWdP2GWHgKr3vrsbuTRGeL9Qxucd8MaMd0@vger.kernel.org
X-Gm-Message-State: AOJu0YybauxhYQP2vLf9wUAOlHRZf62ZP2i8+aJKp0KJJslU+rFoI5ZK
	sViKpkM98ekghVkTU8VQYc6QRrTxQjEuy00s2/V+FhCMLgtJ5UIVBEnT68UUn16A62iBhbIjKA9
	Cmp4xxRyrOaFL6s6/gj9Y6ewVcoUnlJ7wG2dWnP7T9SJacqq8Y/C1qMjfoV/3fLG8BqKd
X-Gm-Gg: ASbGncvHBXSTF+ORzBJEk2RyF9kN2AH6q/HSykU5irpUZO/kB2tqSN0a5b/tCjB84B+
	JLxfNbpO3M7xVL9ifknnd05K5AQVB9stMz+xz8sWKrBTi7EyzAP+cWBEfJS0NAvqs5PFxvGecCq
	EopF4UGI5AHxdrVSkt+5GcLmJk2Sj0LOabgyK0dIAa5KA+yqiLzoJ37ONk9AGuRhAol9ITy3ghR
	yRohrBSlXN9ClsWmDNxQPWFB9ZnR2j8d4s4WQcnZ4thTdY2Qw4H00AhdUb8vPl7Inaf/pb5ocrt
	OasypNqHNOTf4tudsDav1P9PSm5353TbDXgunpx53dNADnfOec60w4/YR2NvLJ3z3Kj75J+hUNP
	fC2oJDmYwmWJE2j4VM3qlW1lwy4cDyURS6/l8UR7YTWqMGB3iZQ0P
X-Received: by 2002:a05:622a:4246:b0:4b2:8ac5:25ab with SMTP id d75a77b69052e-4b2aab7930cmr282470481cf.84.1756379935181;
        Thu, 28 Aug 2025 04:18:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtTkMC3fXrnqpNXHFDxY9alIzl5a3lzHFvhr/LMffc8LgvPM9UUPET6k2wPddfO6PuHJlk+w==
X-Received: by 2002:a05:622a:4246:b0:4b2:8ac5:25ab with SMTP id d75a77b69052e-4b2aab7930cmr282469921cf.84.1756379934617;
        Thu, 28 Aug 2025 04:18:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f35c8bb64sm3285014e87.94.2025.08.28.04.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 04:18:53 -0700 (PDT)
Date: Thu, 28 Aug 2025 14:18:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yijie Yang <yijie.yang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 3/3] arm64: dts: qcom: Add base HAMOA-IOT-EVK board
Message-ID: <qgirqibqvsld7n2ac4cvuvtqknhqkq535jkxnxjjqvss5wpm36@i3mbp7qgqxju>
References: <20250828-hamoa_initial-v8-0-c9d173072a5c@oss.qualcomm.com>
 <20250828-hamoa_initial-v8-3-c9d173072a5c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250828-hamoa_initial-v8-3-c9d173072a5c@oss.qualcomm.com>
X-Proofpoint-GUID: kkoHkIxWOrfTwzWyxebSFgywPaE4xOLu
X-Proofpoint-ORIG-GUID: kkoHkIxWOrfTwzWyxebSFgywPaE4xOLu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfXwg2jNWoN/mP+
 rNZhT7rfrQJ+8AOu82q7qDhpV6dputi7w/5O3fS2FLxU1yR2he+NWuHl2xlfw+e3f3BpkU8xtzo
 TJ9S1Bf8eTAZ1KvtHgMFhQNYNeD4Sus+GAPacuM83gN/se7azq7+CC+u3W8sodB/YBbHK/+QN55
 aJGtjJwNitCSwu4n4qtLw3XSzQSL54T/PPNFWGqb+h5/4hFMDQtksPdYszvkib0dXD8uk19Js3d
 8+SykNBDuoy64s/hui8Pq/UCMCocCriNhL0HAj/oQX5kppXOHilMzqtozMFs0BUnOqYyHAGBOzm
 cA9fUsGv5l9zClxve/s0zv+io79Qj1rl5HSu+2oVBPvGDItKO7Xe7nsGWGPkhyfr4iRYZpZ0nKK
 7rbQa3rB
X-Authority-Analysis: v=2.4 cv=BJazrEQG c=1 sm=1 tr=0 ts=68b03b20 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=Kyid7Z_SZgMD8xIH7KUA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230033

On Thu, Aug 28, 2025 at 12:48:47PM +0800, Yijie Yang wrote:
> The HAMOA-IOT-EVK is an evaluation platform for IoT products, composed of
> the Hamoa IoT SoM and a carrier board. Together, they form a complete
> embedded system capable of booting to UART.
> 
> This change enables the following peripherals on the carrier board:
> - UART
> - On-board regulators
> - USB Type-C mux
> - Pinctrl
> - Embedded USB (EUSB) repeaters
> - NVMe
> - pmic-glink
> - USB DisplayPorts
> - Bluetooth
> - Graphic
> - Audio
> 
> Written in collaboration with Quill Qi (Audio) <le.qi@oss.qualcomm.com>,
> Jie Zhang (Graphics) <quic_jiezh@quicinc.com>, Shuai Zhang (Bluetooth)
> <quic_shuaz@quicinc.com>, and Yongxing Mou (USB DisplayPorts)
> <quic_yongmou@quicinc.com>.
> 
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile          |    1 +
>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 1247 ++++++++++++++++++++++++++++
>  2 files changed, 1248 insertions(+)
> 
> +
> +	wcd938x: audio-codec {
> +		compatible = "qcom,wcd9385-codec";
> +
> +		pinctrl-0 = <&wcd_default>;
> +		pinctrl-names = "default";
> +
> +		reset-gpios = <&tlmm 191 GPIO_ACTIVE_LOW>;
> +
> +		qcom,micbias1-microvolt = <1800000>;
> +		qcom,micbias2-microvolt = <1800000>;
> +		qcom,micbias3-microvolt = <1800000>;
> +		qcom,micbias4-microvolt = <1800000>;
> +		qcom,mbhc-buttons-vthreshold-microvolt = <75000 150000 237000 500000
> +		500000 500000 500000 500000>;

Other platforms use a single line here. If you don't want to do it,
align data to start from the same column rather than restarting from the
column 1.

> +		qcom,mbhc-headset-vthreshold-microvolt = <1700000>;
> +		qcom,mbhc-headphone-vthreshold-microvolt = <50000>;
> +		qcom,rx-device = <&wcd_rx>;
> +		qcom,tx-device = <&wcd_tx>;
> +
> +		vdd-buck-supply = <&vreg_l15b_1p8>;
> +		vdd-rxtx-supply = <&vreg_l15b_1p8>;
> +		vdd-io-supply = <&vreg_l15b_1p8>;
> +		vdd-mic-bias-supply = <&vreg_bob1>;
> +
> +		#sound-dai-cells = <1>;
> +	};
> +
> +	wcn7850-pmu {
> +		compatible = "qcom,wcn7850-pmu";
> +
> +		vdd-supply = <&vreg_wcn_0p95>;
> +		vddio-supply = <&vreg_l15b_1p8>;
> +		vddaon-supply = <&vreg_wcn_0p95>;
> +		vdddig-supply = <&vreg_wcn_0p95>;
> +		vddrfa1p2-supply = <&vreg_wcn_1p9>;
> +		vddrfa1p8-supply = <&vreg_wcn_1p9>;
> +
> +		bt-enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;

Okay, so how is WiFi controlled? Is there a GPIO? The DT should be
describing the hardware, not the UEFI behaviour.

> +
> +		pinctrl-0 = <&wcn_bt_en>;
> +		pinctrl-names = "default";
> +

-- 
With best wishes
Dmitry

