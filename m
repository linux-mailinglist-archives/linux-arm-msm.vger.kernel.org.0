Return-Path: <linux-arm-msm+bounces-84333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 405A9CA301C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 10:32:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 06E503020341
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 09:29:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D34BB3081D4;
	Thu,  4 Dec 2025 09:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ETC6BYax";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OZnNWpQg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2679A23D7DD
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 09:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764840581; cv=none; b=TEUP+j6jKYfuHNPCUiP5t5ktZ2EdeD1c7vJBEGGQ7Yf1jS9YaiIoKDOqmHHjS/bfxQmqk4/QyUMxgF4m7kK2igfTtE+4plsBiKD24evT1afVqVpySetGVU7WGzcMtkCCulB/V72Gw+bqD3BP0TUT0OjNY6K8agzvohI12Pq0RZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764840581; c=relaxed/simple;
	bh=OUGbZfPoDKX93V3r/tvbNbwYVAVpf0/w7OZMXrIiBJ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X39ae3ch971n7wtdk37qEOa73cJmpouP2BE8pUbSZdWVtUxHqOtJUrKSRyJSoKqwb5y59tV74whXGI7wmB1CHrHjTnIOa0fsKQbXNPPphlXwnbpbDg8YvOHZsctK8I/LnymmwwMfcN4j6A/Q358vCXh21AaNwSEVi2qRT8jIbnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ETC6BYax; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OZnNWpQg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B47Tuhe996453
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Dec 2025 09:29:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	unIHf2bLbiUgKgdZ9j/dH/WmTNgmy72TLalZZX9Pogw=; b=ETC6BYaxzg5F3HR8
	UiNhSQUFxDv9gBs4HiRRhPOtnbNxORAAfBaQa0dxYFCrrtv9gVTIc7VMH5H7+MKy
	O4OG2tB8AiYpn8YQu7BwplB+22Skx1faisvQtCP9mmdoW/ZbWB2sQsk8RVVM97/F
	sux6WgakNdhMHjVrCoFM4XLTbh9fmK83znckLlLAxxFvULHLkb2lYAZysXUmwGtR
	6fHrHAPWhtBxM0cUXsyn9rGnDnouPvdpP39AlRcvWZZP1Wy6zIHZs0rvuzh9kQ6S
	q2gkXLh0ndxkUJ79UifqnBpokgMmjX86YviFqH8UFXSVaL64AlI47rbpM3SuRbNF
	XrmvoA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au5yc0cna-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 09:29:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee07f794fcso1291521cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 01:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764840578; x=1765445378; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=unIHf2bLbiUgKgdZ9j/dH/WmTNgmy72TLalZZX9Pogw=;
        b=OZnNWpQgQHq9Lq4ieYMrimRZDmomNoH9eNviAmPd9F5iLbL3hI7bCZvWh9A4J3p/vq
         heUFB8oD+HsSTqDPCJF/khX2ca6l1Z4LcqhvMAugjt6UZ645ybugABbw83BA8PaUqAEc
         WwHwAB+VXyIYYjeZe6m5jQ5eMZ/w1GHEsT/ZSF/i6T3lzYS+PffeaCA9W0CqWAnA1TPc
         9UHMF0mAIta1AHHIQ2NSr4qQFRUwFx3nnr+lUhh7Mf8w0mZJ3UF0WRkS9RKvB7kgyZDR
         ap/w+QWPIdXZPgBZ1+meEN3ERF97dXJPIdePqN3vpdhFMcoIhO1rJs4nEH6JFuD0s5xx
         3B7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764840578; x=1765445378;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=unIHf2bLbiUgKgdZ9j/dH/WmTNgmy72TLalZZX9Pogw=;
        b=ao3vHjheAMLH62t1+gFLJ5pkMuPLcnzBpFjlPzILB5GA3NHEg5KaoUe95aHqS+mZWg
         NXWqh3LOVT114vo0C9evY+4BEp/cZFc9pd5dQ415H93OcLTtg1/pQE7POYDoXU82m+RW
         qWBe8IytJ3RAKMaEpomtiW3uGz7EJKfgM1mkoByRhFpFD13dFb3M1Poz/54yIj6JqY6s
         6+GVBFVExUIDDm8sS+Q67m8IpnWwvuv8fM+fM2bNWiyvdL7ixcqwKg9mzG2MqF7QqOrv
         cEauj5Ooi3GLB8OV/U0MbvxFiHLQ+VTuKf4GM26HyL84dSOcHmEaRLM2lLKev8Bvi5Mf
         6zLw==
X-Forwarded-Encrypted: i=1; AJvYcCW9U67AmaWI+MUVAzyo1eMAHmesddaVoKL1+qhML8Ly+UHrTUCz+gZ0nD4W+sJo7WrSui3NP+tt9kB5gYLi@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7TymLYh1hoscvM89fowV5svX0cr2jz7UFCtBERYO7EJ87SLxP
	J8ve9GY9S85KDnudsQGW6WPOapKG9NDeL26ztniZfUBlpUsFVrsriocTSRdJ/JXvSae682qmj45
	ixMx1ielBIlplPjwCLsTLCVPeCY1vQbl6BwGhLTToWqVGiey8pmmrYoiioaYbGMA+JKTa
X-Gm-Gg: ASbGnctgHI1mETycStIspFP/osnY6sY+nbipmL7VBUYeghPlbYgyKXQyHlwr1QVSluU
	FqhYL4EjOOTwTRl5gX36x0HzvgR++YpdP/8iH7CWkpLQFpyJqrnw3KaxtbYoUIpRPy0QWyNohYw
	vx1e5syUrFzHLHPpy5fH+5OUS6XRtrTs9kdwP7d9DXMkna3RY5GNz81qScInozQyrEc3IPmegKD
	4sJcbbq5ETcRxPZkRUODv85ycU0ltWkeMVMy2KVEp8XvQwMX5lplioEFNWm5wKIiwMcopPktumk
	k/FYu1paCjH6uzrIfuphZyV4x0ajylW3H7BQzFINz4CR41EulRKBDVPuP1V3g/M6h3fZ6L3I4oF
	Q9f/Ls6NnmevrZ4NFQjfsS/+pf3eFoPB0dHDam5vsN0DWGonaEmT1/Itcl5OggMIJWA==
X-Received: by 2002:ac8:5793:0:b0:4ee:1924:c6fc with SMTP id d75a77b69052e-4f01b0b0959mr46305611cf.1.1764840578382;
        Thu, 04 Dec 2025 01:29:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEFmWJJcCfG7Cy5tFaCOZPMPZvEVSgfUyJYtupxfO2ZUtQKd8azbDaBAGnvDPz39Cxu2XF9rA==
X-Received: by 2002:ac8:5793:0:b0:4ee:1924:c6fc with SMTP id d75a77b69052e-4f01b0b0959mr46305491cf.1.1764840577963;
        Thu, 04 Dec 2025 01:29:37 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f4975c88sm78004266b.35.2025.12.04.01.29.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 01:29:37 -0800 (PST)
Message-ID: <71366611-980f-4991-b7e4-f3713b70be6c@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 10:29:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: qcs8300-ride: add anx7625 DSI to
 DP bridge node
To: Ayushi Makhija <quic_amakhija@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: robdclark@gmail.com, dmitry.baryshkov@oss.qualcomm.com, sean@poorly.run,
        marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
        quic_vproddut@quicinc.com
References: <20251125013302.3835909-1-quic_amakhija@quicinc.com>
 <20251125013302.3835909-6-quic_amakhija@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251125013302.3835909-6-quic_amakhija@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QstTHFyd c=1 sm=1 tr=0 ts=69315483 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=rm2exvCS1sBdD0tWXWIA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Ts9ojO5tP7_werhnWJ-G0VUj6eljhxhp
X-Proofpoint-GUID: Ts9ojO5tP7_werhnWJ-G0VUj6eljhxhp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA3NiBTYWx0ZWRfX7+mW7sNIvQMW
 5/I2hXTzGVm5oasnzIqPzS08Um2Gy+4HkpIy46kI+AQv8hbT4ZBNJdy9gJC6SgznM46FGx36+RE
 DyMqJw8H7dNwO7tvrQu46RnhZyZqpLi/d7VlbCoHVSioQEaRlTosYM/jnopTY45X7+o8FI3VVwr
 jmxlnH8P5GvroQJuwZXATlMj4dMvW90KWNwfAkld3feizLTpIWx57xi35INKY4gB1+NZmqYSMkB
 nK/5Xw5TP3UkIO1YT+UEgOmIZkiUtYUzPP2sjFYv7evlZdsRbjr4saXRmsk46RhxwzNQ5Qyl0hW
 5coDoCVzJm/rLzJeVGgGQXNiUCkuqJOT7OReMjxxlPFIyx0KHVBzXgrH3ICAGbIjeKJg7nYFcge
 Soi2bkZuvwPKhq0KunMAuCK8Kh6H1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040076

On 11/25/25 2:33 AM, Ayushi Makhija wrote:
> Add anx7625 DSI to DP bridge device node.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Couple of nits

[...]

> +	vreg_12p0: regulator-vreg-12p0 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VREG_12P0";
> +
> +		regulator-always-on;
> +		regulator-boot-on;

These properties usually go at the end of the node (e.g. x1-crd.dtsi)

[...]

> +&i2c8 {
> +	clock-frequency = <400000>;
> +	status = "okay";

A \n before 'status' is customary

[...]

> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						dsi2dp_bridge_in: endpoint {

Also before the last property and each following subnode

[...]

>  &remoteproc_adsp {
>  	firmware-name = "qcom/qcs8300/adsp.mbn";
>  	status = "okay";
> @@ -419,6 +574,21 @@ dp_hot_plug_det: dp-hot-plug-det-state {
>  		function = "edp0_hot";
>  		bias-disable;
>  	};
> +
> +	io_expander_intr_active: io-expander-intr-active-state {
> +		pins = "gpio93";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	io_expander_reset_active: io-expander-reset-active-state {
> +		pins = "gpio66";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-high;

This conflicts with the ACTIVE_LOW definition, plus it's generally
handled by the code via GPIO APIs => please drop output-high

Please also keep the entries sorted by the GPIO pin index

Konrad

