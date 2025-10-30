Return-Path: <linux-arm-msm+bounces-79679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8AEC1FD7D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 12:34:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0664B401AB9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 11:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9BBA2D8395;
	Thu, 30 Oct 2025 11:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uq3eLJh9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E/VG6QaZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3134B199931
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 11:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761823949; cv=none; b=r89dA3+4bpDUxhjCryXk7lksdI5g7x2syS8PpyCetwH6WEcDPF7Im9bjh6gDtdggTOBUHKEt6FMQ/qtfL2dFAygtq5GSZRT8I2cgtsa0IYy3Mgvr6I9DpoQniQHWSIHF0G8aCa5dK9d1h7j4lA9OEDwu4alfiPhvy1JuC4TX1Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761823949; c=relaxed/simple;
	bh=lf2SZXPHOeNKfnR+2AGHeP0WDmv17afwkbv4+3+gA8s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T8e+Vm2t9DUR00u1NyZ61NiW3eerpETj7EvKiq2xoTaFIAsoSQluYR/z54G44ynj926VHB1HQjsBsXaR+vs2+dg3zKAIazkZl1hT6s3MYCfMUXubYgSFGzA0C8Tg4ygtd2xHQ//Zde731jMgDkoO6CB4SjeLz2ZUv6vMcIAiZFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uq3eLJh9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E/VG6QaZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U7lhVg1696883
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 11:32:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YNULkZggaBVWafuH6G2UI48mTzyPJboSv12GQ652rF4=; b=Uq3eLJh9ra6dJgB8
	dG4OIxQmZZlTKSlBq7XkdfbuzNTwrhA25TyyDfC7sI8w1uhUHyun2tCTk/GjmB9h
	O0Cjn+MJVOt7uLg+BxoZz4i+QTanLGrQpRFfqoY5QUkXYemjF91rz3qoDtXzkEjk
	VPvSdW8YEz4mbibu9xHJU01kgQeZL6FVUPAgjUGaJc2gQAZsQRxFkpG9XNDaZ8Vf
	RKHQgs+Fk8tFSJQ9BjZe3vWVTCu6/fLcruYAAy0hFLGRW9ljbBIl4B3VeAfbHz0/
	tJhCUNqm9vATl1exoKHMrl4uhikFRhm72BL5Rtbd4uF4XaCRhixgoAbYMOmWcsP1
	ltPTMA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3trv24xh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 11:32:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e890deecf6so1490481cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 04:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761823946; x=1762428746; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YNULkZggaBVWafuH6G2UI48mTzyPJboSv12GQ652rF4=;
        b=E/VG6QaZpJ1XiI1YHgOOd/EbJ7cKMfb2xU7nwN8PYIBqMFsrwA7Zs0XelGSzP7mbpF
         240jq0nPqxLfXEL8PMdbBQEkaCYpCkaYh3CWc9MdSNQAL65loo0LDU9cP36Da5uu1Inr
         Zi1cMMgiZkLDgQdUJHw1LDPo++tCzfB7J+B/+CBrq205bCcTO1OALdl8fL6m2hwn9hHA
         kkCnwur3LxHw/evHKG3yFvBSPuh84l7zAa7puiB24UsFVNHDu1qfWQ5/+bI32CCTf+P5
         6Ep6X/xcieDqTMlrM9ZTriJ2E+rmYHaHKxRRsNQcj1Buxx4xdhPzuTQ5PC1gmVjnsL6B
         ZFhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761823946; x=1762428746;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YNULkZggaBVWafuH6G2UI48mTzyPJboSv12GQ652rF4=;
        b=o3GKIkfCBZ7K6gWFU2lIxdaoj7wluhpkVXzLQlIB1htxqSZzc/Lh+ncchVZOM3R4FX
         T/7CXxvBegQYqlUWbgl++MNbG0iPsb7yDKThL3v7hOllfUQo5oJtyqZvh5xsdveK5fqb
         Tsv1TrIDBMwwkGkXmyqVI3ayLXnAHmHE+tqbrHc+eOGonym/FsVlW0kW7JHCrmjbJ4Hy
         nc0rBvpab1hpprSUBixbt4IzrDrhzTz63r9acQRlS/HeMeSDd1I9uh+e8w83knpeHkeZ
         3MWlcd5tFRNG49tx754xALBiEg8XLBPosJDDajOmmIf1LUuZxVD0CGz9lzAR3AuUISb6
         lcrg==
X-Forwarded-Encrypted: i=1; AJvYcCVhtRX6vKPp2hYRK5Q7H1fODWoCzrBPUOklJW+NgIOBsArg4SfEH51OaTGnN4ioWQRHRC0Zleq0eBXrm5IM@vger.kernel.org
X-Gm-Message-State: AOJu0Yxrxunj6m1viFu08+TZ1prWLLbI6KkoWa/BSX4wSm7UhqGZYfBJ
	zokC1phABelSEJ8+Bo++y/JHqb/f8HJHnIClhf+QbU4uttCHlInNZF2Rdfw4BDrnK3hmXRl0sAA
	TqEuxMEBrFFgHAGPjeVg1WcmWyJHnhE9pPZ/tKjakZ5RLawUqciDbs/6VMyfRhBi8c6gK
X-Gm-Gg: ASbGncuA+hFIJQndiPmrE2RvD4cRepy9d4aKx5oqyrkMxIxlthnSMGihV1zjyEZKDGn
	tPuRQ3jx+lVDD9X2bE2Oi3b7gx6LThvWP6xjcHTcxQOKS+wvmV9Gjllsgaq/WLbDAp1Ecj/Iaxv
	GT9T7lpmAjtMSE1XU3krl2q3mesPf6mZCXFlBoZ5qWt7hXC2x4MJR56HC0n9Hy+YOx3pnZkA16U
	68e1djiK2X3Aqi7XW1dFU0CIDDhKstnEo97w3il5gigmjwTBi1uRBlaJM28JBsnJkRvxRMsBWts
	cpDhSDI9yq6Ohr+lo2UQzcvN/aYVaOrGVuBj46iF9rKFxy5+bPrqn/pt6rNSl3FpNjh5dr0+DdP
	/QkEuE34kZdxaRUgAlmYPSZsy8bdtk0T4nyv4vwMLWshy/eAEh5Rzl8V2
X-Received: by 2002:a05:622a:93:b0:4eb:7dac:7b8d with SMTP id d75a77b69052e-4ed15b96605mr50153051cf.6.1761823946357;
        Thu, 30 Oct 2025 04:32:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGllTvEh/j7ZHlMm91hXr1OxceGb0VIuQkkd1NhOxJeediP+Nlwluw0PKrGl2uJiszadcidLA==
X-Received: by 2002:a05:622a:93:b0:4eb:7dac:7b8d with SMTP id d75a77b69052e-4ed15b96605mr50152721cf.6.1761823945826;
        Thu, 30 Oct 2025 04:32:25 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e7ef6be28sm14649254a12.2.2025.10.30.04.32.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 04:32:25 -0700 (PDT)
Message-ID: <8d32460d-894b-472a-a262-4c6a60fbcef1@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 12:32:22 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add support for Pixel 3 and
 Pixel 3 XL
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: phodina@protonmail.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, Amit Pundir <amit.pundir@linaro.org>,
        Casey Connolly <casey@connolly.tech>,
        Joel Selvaraj <foss@joelselvaraj.com>,
        Sumit Semwal <sumit.semwal@linaro.org>, Vinod Koul <vkoul@kernel.org>
References: <20251030-pixel-3-v2-0-8caddbe072c9@ixit.cz>
 <20251030-pixel-3-v2-2-8caddbe072c9@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251030-pixel-3-v2-2-8caddbe072c9@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4w5kSDz7pdltFE6ENylhyP-3ckOo8bwA
X-Authority-Analysis: v=2.4 cv=D+ZK6/Rj c=1 sm=1 tr=0 ts=69034ccb cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=aBSXULQCl1RkmNN2VsYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 4w5kSDz7pdltFE6ENylhyP-3ckOo8bwA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA5NCBTYWx0ZWRfX+v9fjBecLR/s
 DjZrOuD0bDUq4S0HeYt/TsePIWZEri8hAuidLSEBHB8yJ6kbzenA5X22mstJaK5nz06Q0tawDBf
 gkdkPzX2k4kwwOrva1yCYj5uVAUVu8PsK1YCYOSTPEWxZjdFG2j/fAAciKSGkw/i99V5jlRMJxg
 R5ypHoAFwfY47TYd7vnCX3ZKw+ILTF7a7XOfDl8WIQphh3PsFHdLDlGHgefW+zwR1rMoaGDAAks
 Y7P3+MHYnLMPcbjnOXT+Db246+VPqq9lGuzn6O2NHgCNACCf+x0WcHwOkA0dotjQid1yt53G65B
 4WqUyjkLo8WQHq7md1H/8C0QrshdEOk42WSdcArTFfWvmzjB5h6wMKSN6CvViLh/KjTZuoRvGR8
 SaTTeHCUHew3g1vionm/pPO1LgftVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300094

On 10/30/25 8:24 AM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> This adds initial device tree support for the following phones:
> 
>  - Google Pixel 3 (blueline)
>  - Google Pixel 3 XL (crosshatch)

[...]

> +#include <dt-bindings/arm/qcom,ids.h>
> +#include <dt-bindings/dma/qcom-gpi.h>
> +#include <dt-bindings/input/linux-event-codes.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +
> +#include "sdm845.dtsi"
> +#include "pm8998.dtsi"
> +#include "pmi8998.dtsi"
> +
> +/delete-node/ &mpss_region;
> +/delete-node/ &venus_mem;
> +/delete-node/ &cdsp_mem;
> +/delete-node/ &mba_region;
> +/delete-node/ &slpi_mem;
> +/delete-node/ &spss_mem;
> +/delete-node/ &rmtfs_mem;
> +
> +/ {
> +	chassis-type = "handset";
> +	qcom,board-id = <0x00021505 0>;
> +	qcom,msm-id = <QCOM_ID_SDM845 0x20001>;
> +
> +	aliases {
> +		serial0 = &uart9;
> +		serial1 = &uart6;
> +	};
> +
> +	battery: battery {
> +		compatible = "simple-battery";
> +
> +		status = "disabled";

You added support for both non-proto boards based on this platform,
there is no usecase for you to disable the battery, remove this line

[...]

> +	reserved-memory {
> +		cont_splash_mem: splash@9d400000 {
> +			/* size to be updated by actual board */
> +			reg = <0x0 0x9d400000 0x0>;

Don't define it here then

Normally the bootloader allocates a bigger buffer here BTW
(although it shooould be reclaimable without issues)

> +			no-map;
> +
> +			status = "disabled";

ditto

[...]

> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		label = "Volume keys";
> +		autorepeat;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&volume_up_gpio>;

property-n
property-names

in this order, please

[...]

> +&tlmm {
> +	gpio-reserved-ranges = <0 4>, <81 4>;

Could you add a comment (like in x1-crd.dtsi) mentioning what these
pins correspond to? Usually it's a fingerprint scanner or things like
that

> +
> +	touchscreen_reset: ts-reset-state {
> +		pins = "gpio99";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-pull-up;
> +	};
> +
> +	touchscreen_pins: ts-pins-gpio-state {
> +		pins = "gpio125";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	touchscreen_i2c_pins: qup-i2c2-gpio-state {
> +		pins = "gpio27", "gpio28";
> +		function = "gpio";
> +
> +		drive-strength = <2>;

stray \n above

> +		bias-disable;
> +	};
> +};
> +
> +&uart6 {
> +	pinctrl-0 = <&qup_uart6_4pin>;
> +
> +	status = "okay";
> +	bluetooth {

Please add a \n above, to separate the properties from subnodes

[...]

> +&mdss {
> +	/* until the panel is prepared */
> +	status = "disabled";
> +};

Is it not the same as on the little boy, except the resolution?
(don't know, just asking)

Konrad

