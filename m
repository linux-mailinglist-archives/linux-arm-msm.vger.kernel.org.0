Return-Path: <linux-arm-msm+bounces-88531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 25019D12100
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 11:54:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 94E38304EBEA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 10:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65B142EFDA2;
	Mon, 12 Jan 2026 10:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KpialMrg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gj7rfta9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CBF34DCE3
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 10:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768215196; cv=none; b=KS0i2ttxcxYbqPJNOA5AeXO2tyeMcUc43dyG4Jbq79SS33uoUuEkrqcVasgbe6robkboC1tuUpl7NKDWPt9QEvGe7YEirQzq2ktFfAD91+j/2xqM2viZ7oyELDYse05voQ/XgAew0/ABJJW3ElZcIsPeV3D17vlnuRlg0G6wxhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768215196; c=relaxed/simple;
	bh=rlpIv0ycJjkCAsKg+mMdi4WwvlUgHV7XC3sdtp0sf9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CAsw4mT//QzC4zjkTDW1KM28/jjvq28Qmr0lvhGbSbiMCTD7suGofE0m4NrAonD4Kn95TIDpaiEa83LQW0qhnurvce4OJaKnqnduJeDEJT8L8B2nv3yEFIGPoQnaxk3XKaunwer1/prNkeV0kXPNaIuI7sWlFNh3AVB6bSmRXy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KpialMrg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gj7rfta9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60CAEW3l1315821
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 10:53:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OkgnGiPcXZE1+IL3sJO0MEHpll3AaDBeVk5e9Q9pCTw=; b=KpialMrgxgvEkQHP
	nFMg8Ih4zdclL8k4rCzcvKPx9G4OGDA6Ww1XrU5SlzrOmcM0wSNpkd7O00irHmSI
	Rcq24hYEaW97zNQFsSj2NV/ILL21pNcs/S+qhOmxUSZnUCVjfT6c/q1Uf2vqJTSE
	oCXqHPrcbHxa1ieQ4nM5yWUUGbupDJOjPUTwQ5Lrb8h1IxaitOMrUvDTWvi62kHL
	AsXEos1OX6qg9H/ecpnEM0diL5qFyNevv9/R27++p7UfVYlpN8fy6PNwC7Qj65GI
	sAApmQpNL5SMAFOxdieK6oPQM+bHHOf6YL+9uN622EamCLWD47cC63TuRIQc+K3m
	8YxOHA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmy1hg39n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 10:53:14 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee05927183so11566521cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 02:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768215193; x=1768819993; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OkgnGiPcXZE1+IL3sJO0MEHpll3AaDBeVk5e9Q9pCTw=;
        b=gj7rfta9y70gXKSlQksQ0mKPJvccIXW9dDu8Aeh0YF7SbLHKmECd65v6sdj/gs+RTk
         TA/sryyQox5hmF29LKEsEOD4usVGjOAorwMLjnyKvsKVKEgG4x72gmPheiLGbuAQMR7u
         ReLiuzduHoiTVxGMzsdtbc+88b2T/jRbaEBGP2WAvAOeRXFO5P0Gs1HnV1ixaew6z9iS
         UjZO0QOFhiN+q+xxn30kndtUT0hwNnyur3wqacF/rqKa551eBkzAY8thN2URr5jBMIkR
         mxxw3ZsX2oG9JPkZvPXBsKsBxTYpF3IKGE/JdVXC4r2jjXWVPxeXH52NxDjSrZ48kC1c
         h+hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768215193; x=1768819993;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OkgnGiPcXZE1+IL3sJO0MEHpll3AaDBeVk5e9Q9pCTw=;
        b=qSgesOqtSTxsObcQarX4b0U6YqoUfhiyewdZEy7axMGXudw5l+UUJxiJYsTYl8kbY2
         HiCSXYqd//BTeqGggWv4pS3YGOVN6WwJLBzMNR3LlZQT1FeG0Ocggmlsiob361FotzfN
         aruRs6raAkXTEtS+xKOgMoOeHHcfi7LOPn6V2Wg8ITMZ/mwiZlwZcDtguAX+NqARkKvX
         tWEvIm4RPIyoGOQM/9LLSr2LRELmTkXGhZUjQYHTEW9JkpzmzmZTAh42J6dqpkVCFJsh
         wxigsKdZ2+fhf7Ujof1VrB0CyZmhrrQ31ZWIQ4QQEm1wCtu+/e7yAzyedwJLpXZ+sV6X
         JTCQ==
X-Gm-Message-State: AOJu0Yy8RQr+u2EJ4+mJF60fB4HAyzpjzBjEWeGn2ZUW6sUfzULTlVdr
	r0SILGPv/RZo1ZT+uhiKS66kRpmbDOTh9IN0i7l5OoDZWTRYEFvwLELlZ0o5W8Eqc1HiX73TEoJ
	s+2TyBfoSs+XQg3ZbYRCcuK4LY5haKV0CDBneePzPDxGrco4jJz19AoZW7RELsLI4ZUqK
X-Gm-Gg: AY/fxX6kmRh4ssRno9b7UFJJjEwWvYX0IOgEg3eye8ugSSJTUMV1Ry3gj0ijMHCivz0
	wKNxxUnVrbkZxi9hJXPvcQnYlMnZViINnJqSmcotuhZCNoX0EGaJAjYju5VLuFvMvNCMxQ+jNgb
	6ia9DyWxTNnEFJ8gda8BxaGZVecm5lXb/sWS5wjrV1OmtcIJnZ1lbh9YL+PQbU5KVYMor7LQAbC
	5Aow2xwC3+Hi3zHdRpa41eWyTXMKvm8N1ml14rwavCfceg9PWKSLye06rX9ptgphiE6m3mnH8u7
	zRFr8Pbk2GqHqdvcD4K8B8XEFBELNGulrXIme7i5fbv1CxJlBC+pGziPTtdWZTs87hdtc7ZGJu+
	OocrgmKLEsl52jfWum8WSsDZU56GpngW9+gQEY+2d2jnUqAeiEresS2UdsCH1hhwnw6Q=
X-Received: by 2002:a05:622a:282:b0:4ed:b7f0:c76e with SMTP id d75a77b69052e-4ffb4a3ff5cmr192922041cf.8.1768215193417;
        Mon, 12 Jan 2026 02:53:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEBBDe3WY5BWTxclmarfUgDXSl0bKvw604XZyLa/A/MdaMvkOzX7Nt+RyRpTimruxD4LgaGDw==
X-Received: by 2002:a05:622a:282:b0:4ed:b7f0:c76e with SMTP id d75a77b69052e-4ffb4a3ff5cmr192921841cf.8.1768215193033;
        Mon, 12 Jan 2026 02:53:13 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507be65197sm17379733a12.19.2026.01.12.02.53.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 02:53:12 -0800 (PST)
Message-ID: <f562ba39-ebbc-4ff4-9ae2-f49c1fe82146@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 11:53:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: Add support for ECS LIVA QC710
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260111085726.634091-2-val@packett.cool>
 <20260111085726.634091-6-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260111085726.634091-6-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7RLtCmJLh1ToUZYL98oQBdpVZyjuyuZM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4NiBTYWx0ZWRfXw+YMpih3Mk2M
 PTkW5yT3uy+aWbsf3uQAPg9HNqqaWXGCcIIPWpZU9oFiFH/HIt1oudiQb8JaCzl3Fo4K73CjCxB
 xVAtC57d6upM0wbfmCgLlX1oK5KmxJEtp1G37+FNk+2vD0CB8ArnDFkiUq4OiAah38PtpPEO1//
 f9+AEcr6mLs/+OCZWpVllSC+DgmK3d2gDeiI2PTGpPyvsmpmsQOWCjuKacmMKa49uQP2uz34k8R
 QRxEEDT8nnoSvYw0GtV43xzX4XNfKy/D8mmpJlCjjdwD3NWJVAt655EEbINbpKFgD9N0m6Pv1Vn
 mQhcTXdPYsV0wE7c9XzS/lnKyuhMCQbdOazOFjH0SbQg8P/LqNLWcgf2tt2lpKvaUua8ziqwShT
 ieYEMX7nwH9xyXwQLi4TeS7n6L35ra5dzVkaNiTNrelT4qJ7JwmBS55bDgsNmzo0dEFng2dIeer
 YQr+V/ymXQoxUoKptIA==
X-Proofpoint-ORIG-GUID: 7RLtCmJLh1ToUZYL98oQBdpVZyjuyuZM
X-Authority-Analysis: v=2.4 cv=EovfbCcA c=1 sm=1 tr=0 ts=6964d29a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=GqzvmWBP9S_r8vv4g3cA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120086

On 1/11/26 9:35 AM, Val Packett wrote:
> Add a device tree for the ECS LIVA QC710 (Snapdragon 7c) mini PC/devkit.

[...]

> +&mdss_dp {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&dp_hot_plug_det>;

please keep the order of:

property-n
property-names

throughout the file

[...]

> +&remoteproc_adsp {
> +	memory-region = <&adsp_mem>;
> +	firmware-name = "qcom/sc7180/ecs/liva-qc710/qcadsp7180.mbn";
> +	status = "okay";

And a consistent \n before 'status'

[...]

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
> +		r8152: ethernet@4 {

You don't need this label


> +			compatible = "usbbda,8152";
> +			reg = <4>;
> +		};
> +	};
> +};
> +
> +&usb_1_hsphy {
> +	vdd-supply = <&vreg_l4a_0p8>;
> +	vdda-pll-supply = <&vreg_l11a_1p8>;
> +	vdda-phy-dpdm-supply = <&vreg_l17a_3p0>;
> +	qcom,imp-res-offset-value = <8>;
> +	qcom,preemphasis-level = <QUSB2_V2_PREEMPHASIS_15_PERCENT>;
> +	qcom,preemphasis-width = <QUSB2_V2_PREEMPHASIS_WIDTH_HALF_BIT>;
> +	qcom,bias-ctrl-value = <0x22>;
> +	qcom,charge-ctrl-value = <3>;
> +	qcom,hsdisc-trim-value = <0>;

Have you verified these values (e.g. by reading back the related
registers in Windows)?

[...]

> +&apps_rsc {
> +	regulators-0 {
> +		compatible = "qcom,pm6150-rpmh-regulators";
> +		qcom,pmic-id = "a";
> +
> +		vreg_s1a_1p1: smps1 {
> +			regulator-min-microvolt = <1128000>;
> +			regulator-max-microvolt = <1128000>;
> +		};

Similarly, have you verified these?

> +	soc_bkoff_default: soc-bkoff-deault-state {
> +		pins = "gpio10";
> +		function = "gpio";
> +		drive-strength = <16>;
> +		bias-disable;
> +	};

This entry is unused

Konrad

