Return-Path: <linux-arm-msm+bounces-84447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EF665CA7AD8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 14:04:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 326C0337B8FA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 10:52:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 217A5329C4C;
	Fri,  5 Dec 2025 10:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JGOjW09O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EV8DFVLR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7542E31C57B
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Dec 2025 10:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764931971; cv=none; b=HAuQfppdl/4c3fBJAG9c8Wjf2hNicIehM0k2TRS4Fz+5uTF7Pu2iEbAS4/6eooGNDkVx1AWF9127T5u/a2Pecexj9jpYKqct2SYLAI6bEUOktztfolEQfZnG5LozUCDDoe8eN9vUlmmm7zoToYrIY9bgg7bOLPpgFfKK8J/17qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764931971; c=relaxed/simple;
	bh=nqcawpVkiwPEsJ0F03SaS+EheZYNnxy0lK/qCyEJLNs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QHHdRZ9+c6f6V8SiCf7VdycSZ3IEV69SGle4oVsWKlgIhbfDjqpLAFqdf7+gD2pNbpkG8S8KI/vszyRvX2qxvUBlm1h2g+DuuEov1Z2QfDKC65wTIpSIjOJ9aJj7N178oxJQ6AWfl5e0toxDvIBPfZ/oUBSanO8FLq5tM0UIPdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JGOjW09O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EV8DFVLR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B58LCwm2299106
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Dec 2025 10:52:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7/Un1GmZYJ+koS+OuHzHOv0o7FqfJp2R3Y4bEKI04Sk=; b=JGOjW09OLA4UM/yQ
	9AKKw+pskOmT6/OSE+gHQQIwoTzN69P39s2v7ffxKX/+W/n1IkWHnIL4mgknVUET
	fBV3FSOkSv4u3EqREEC+y8MO1OEE0f9dF5JNfFzyrJrOXgsfw5idMn2iZlitQgxI
	dP7KT5OQ0iYNZEFJmncaYgJNq7m2J1KUkTQk5/LVEJFjgYvQk4FjwIFxg9JRRVi4
	pioi4rS/NMZ8OK3gP03cLAobyAgZWbwf/AeC5ldWNfBWpGPL/Ysb7ti/WjIojfLn
	zMhA3LoSH5ITCk99S56TCAf/14jTYnivbOjFYt3rO/zj3UEAkOjB3VlelC4mwZ+D
	Ohdi2Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4auknf9qug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 10:52:42 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed83a05863so5504311cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 02:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764931961; x=1765536761; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7/Un1GmZYJ+koS+OuHzHOv0o7FqfJp2R3Y4bEKI04Sk=;
        b=EV8DFVLRV2iVXwRDcMzN7V9MK4HNTyNXC4EJcz/mZ+IPt4gq1Cit6m10q6brnnfrQa
         mnJhIlo/TaXie5JhAB40yn5IReiIV18PEgEgYE5xd2alTpyMLtDisTSb2RtoTqDokpaa
         aaE5y0moKj/mxzpPnWMePSwtbF2N0H1LkKok46+5xFSj88ma8D1GVxy3Oe62B6VDv935
         M1dK0YvHde0rEvEZXOYItvvihRp7yAimk4m8MWqCUffiQw1+GXkarDxDOxLdlomBQb7T
         dvHkEZUxCL1mqQ5Oc2gAkmCY2aJIJMwkd3szJIxLe3r5VoHVZccUM14/xQ4ko+M4Oujd
         x83w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764931961; x=1765536761;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7/Un1GmZYJ+koS+OuHzHOv0o7FqfJp2R3Y4bEKI04Sk=;
        b=b4DDjT0cML1esXKNEJpXiM7HQOLLulOdGcT9KifgXCSzwDHoFCObZ/ztfnlWfHiHcf
         KhdMAVAQgtAkFkv09lo8kglq5AE/yo9GCZTaqNPyt2oSaNlP6Mjlxiw8NZJcgUMZvsb4
         siz9Ipca+0i1oRixfeL7dtT15gf2P4ZFSnCWJg0LUNEFFV9yX9GvEIRwj22Y4/15jirx
         BUefEs9sstxyamXvABIDsvuuG3gbbeG9mI81hRoz+/B6hHtNIsQQjjL8dciBIHou/URy
         HYBN3Rmt0qfxanumsQaZoQCseO2LLb3zTpcVH6IaJVBSZv6WAW8U2WTyUiazQuVymBLD
         lFPw==
X-Forwarded-Encrypted: i=1; AJvYcCVzZ+q4FLNWAKijZNV/3KzF7+xyKZOJsyN5UXgkgrz+ZDz8caiif3umKGDIk/zXCb8fGb5/iw3OhZHsrjDM@vger.kernel.org
X-Gm-Message-State: AOJu0YxXAB1yNRVfzJ5oqJoRLT/J5sXGD+2B7cftiHPTYV6iXSbIxvv7
	HbOAEXb4dutE4PTIyPaKw4tHA0FYQ13DIPD28cmk2oqXVeMT3/Yvqc4G/ApIgR9fyIWuqOc6heX
	/nFolTKL0xbjtEtZmlEAVkxky1uijGTCQh5tyLBUxLBo60zOBygMvaLWlI8rtV5sD3cHX
X-Gm-Gg: ASbGncuV/Hoc4+q/BMexvxs2/KfowPJAPtwN7mhySDN6yW3PVwopWMfe2nM7ZNorXMt
	dLajI7Ht+gRXNIJOs6odfGsVuY5/HOlDgoshKK3tGX1nUWEM9a1SyIE79MX8KexH9GIxE57DAU1
	FIUtfXqNlIh8MsC/79866dnWqhB7ITrb5ByLQYQ9YBFYZtCqXu9jG+7sEHh0jZ/bJgIHVur69vZ
	pgnQOh5X7ZavDxMrwRD6Pm4JfdGi+C4qV/FcaLCTFk/pchKvjul7VMK77rLnlxeyOXMc2qX3x6l
	ZJ3KBvLlN2EEuqwFUKah/o2EK+YCr6WLQtiRV5ElRQcC47al8l/YMhWWx+x2QRKpUesZrc5lvsK
	Df40itPzn3uY9oM6LOUbLJ6H18RcOd65jBLeo9V5zWB4gaWigAjozf9Zslh9+Ks2Y7Q==
X-Received: by 2002:a05:620a:2947:b0:8b2:6eba:c45d with SMTP id af79cd13be357-8b5f8bff8f4mr884869685a.2.1764931961402;
        Fri, 05 Dec 2025 02:52:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHZbHcNR6axz8tSp07KmmHDbe9sl3VQv6RR4qS119UiVIx0rvMgiLUzbQyHsRAay6CXXLQFKw==
X-Received: by 2002:a05:620a:2947:b0:8b2:6eba:c45d with SMTP id af79cd13be357-8b5f8bff8f4mr884868685a.2.1764931960985;
        Fri, 05 Dec 2025 02:52:40 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f49b7177sm336592266b.50.2025.12.05.02.52.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 02:52:40 -0800 (PST)
Message-ID: <846a5cc1-fa0b-4952-ab40-852a07607eb7@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 11:52:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/2] arm64: dts: qcom: talos-evk: Add support for
 QCS615 talos evk board
To: Sudarshan Shetty <tessolveupstream@gmail.com>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251201172222.3764933-1-tessolveupstream@gmail.com>
 <20251201172222.3764933-3-tessolveupstream@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251201172222.3764933-3-tessolveupstream@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA4MCBTYWx0ZWRfX15vPTe2T+8RF
 qhmoP1/AzUJENhpovuF9l+lTiQ18CnW8eIqmAnn6aPz3PWsPpaNVf7orkp9PJXSIdThLTSWhYkW
 DwjMja54midla3QeO0qXbYwYLBAIEz2hbudDtIBz4QyyT8bJ8g1TSbMW94vU08VSUHvDjr1/JY4
 FQzIT4NlRUc5i7UkNgDP6MQo7WgpChIvgJD+rltposKiNG4/xZOk5r1N14rbw784YV5AiQIfuYY
 OShpv4MSeMsX7Y0Y77OnKGgBOQZmDn18NSgNJDpcXi14Jpu5nDryb0Z59Uhdyioz58KdivQ+iO6
 0M9HvX9hEZaPk4HxovtkapsM4oR1AREUYkyhC6rRNhEH5rQsyCD9P6rTdqpQFHOoBKhKDMxA6nJ
 /O3bTfxq4TvpAdlJ8zVR5iaHLm+PBw==
X-Authority-Analysis: v=2.4 cv=P/Y3RyAu c=1 sm=1 tr=0 ts=6932b97a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6q-ckXwDscysDfU1ynwA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: UPwA_xa2eYBsyje5v19f0_pXS2sVN1qk
X-Proofpoint-ORIG-GUID: UPwA_xa2eYBsyje5v19f0_pXS2sVN1qk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_04,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050080

On 12/1/25 6:22 PM, Sudarshan Shetty wrote:
> Add the device tree for the QCS615-based Talos EVK platform. The
> platform is composed of a System-on-Module following the SMARC
> standard, and a Carrier Board.

[...]

> +	hdmi-out {

You must refer to existing nodes by &label references - let's call
this one hdmi_connector: hdmi-out {}

[...]

> +&i2c1 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	bridge@3d {
> +		status = "disabled";
> +	};

Similarly here - hdmi_bridge: bridge@3d {}

> +
> +	bridge: bridge@2c {

lvds_bridge:

[...]

+
> +				sn65dsi84_in: endpoint {
> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&mdss_dsi0_out>;

The formatting fell apart a little here - please give it a touch-up

[...]

> +&tlmm {
> +	pcie_default_state: pcie-default-state {
> +		clkreq-pins {
> +			pins = "gpio90";
> +			function = "pcie_clk_req";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +
> +		perst-pins {
> +			pins = "gpio101";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-down;

bias-disable - this pin is active-low

[...]

> +&i2c1 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +	bridge: bridge@3d {

This really needs a \n above
> +		compatible = "adi,adv7535";
> +		reg = <0x3d>;
> +		avdd-supply = <&vreg_v1p8_out>;
> +		dvdd-supply = <&vreg_v1p8_out>;
> +		pvdd-supply = <&vreg_v1p8_out>;
> +		a2vdd-supply = <&vreg_v1p8_out>;
> +		v3p3-supply = <&vreg_v3p3_out>;
> +		interrupts-extended = <&tlmm 26 IRQ_TYPE_LEVEL_LOW>;
> +		adi,dsi-lanes = <4>;
> +		ports {

And here

Konrad

