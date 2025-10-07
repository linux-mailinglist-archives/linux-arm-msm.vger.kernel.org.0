Return-Path: <linux-arm-msm+bounces-76205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D82E2BC161A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 14:39:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F53619A11C0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 12:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2337B2DF15B;
	Tue,  7 Oct 2025 12:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="deNIUuG6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6519E2DECC6
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 12:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759840770; cv=none; b=Hrt8hF3ygCgY+P4HWoH0xCrmPwr2YcSnfeId/inMPEDaEBQ2fsTMmww/3cUukaMkI0mqscEKtot77VYXSZmJkK+XT2aiAWPYuN7TwxKhfzyMp4mI1gYvPvgNo2TaZbDNooU1/8WbwZy5Yye7xE+BANVIMrV4eJBuqwrNOuxIL44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759840770; c=relaxed/simple;
	bh=UPnFCkbAAqYodYYvidAkc2Mw5hSlfS7wopk3IkQjvIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cRtC0Dsr8jldUK3dDu3jblfc2BFVswWLibYnuLsmlBGIGiO6y8vfbQJFGjMf9I4mOqlVBDyrX48J1MZ/o3YpEVCO8x/tfd8r5J9JSnI0u+XRW1fQXVYT0WXO5/MIVcytH0THRQFJqh+K3H5sEdCYL3NzDnmvnUE45Sn2NmnfiO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=deNIUuG6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59740kI6020690
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 12:39:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZrWyGE3gs9+GLL34onELkx++qF0tEM4y9SytX+wbbUM=; b=deNIUuG6MAaSiEih
	79Yj7xhMjsEva8COdIUzR3DRV2L/fgm7E3AiEFExXhnGZnQPmEcGj49XqoXHYeD0
	OSIqf6rMzFTdQwNpTW6lGZ7l6Ek7CZmVSf3EYzlHiL//MGbxZtvIzMSXW4+rmoQU
	oQLJUGvR1rxirkbUCyiOzPwja6p0qrH+3QmC6SDp+Rt2qAD0jDdgM3boVpYQUHba
	IN28eXrStO8O3aS9brbJXluFZ2OnuRBJrcGZOsT7pcKmt4XFu/a2atwa0Hcf0TTm
	ONbLovEQumn7FZ0oJEil0lIZxe1i61Y6yJ6tJbceuf0D/IlIaGGNKKuVIfASHsHN
	N1+4xw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49juy6y5hh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 12:39:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4d6c3d10716so11594701cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 05:39:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759840766; x=1760445566;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZrWyGE3gs9+GLL34onELkx++qF0tEM4y9SytX+wbbUM=;
        b=Uv8NZd7a4NJ+ZK8Kqaj6penk5Q6KL7NAJ4hfFRxgZUeAg/QucQ0CUoNWVdu1QwaSVd
         bycGfCcm7iA4uCvMfMxyJ0YaTK60PlptUUiSRzAFECuQSHz9t0mUKjsNa+ds/8j0XFsX
         LkMe4k7imTWWrXXkwOvm1ap5LaeHlabF5vJHmDEoQcNkHUa7MxYbjYR6oeaUWYEZ007f
         VbYZlXlSmKedW7ekoX7P448IU7L2V6x3jqdt3OfJb8bWQeCiwOFtDCm8JYlE8RdRWblP
         6sZAruIfuI+uuULNHnXi57/EjJaq0jF7WzCTLUwRFf2AUuLsRSWuxAcxUS5xGe+qadVV
         Yy5g==
X-Forwarded-Encrypted: i=1; AJvYcCWxYdUJWaW08Cgo4mHtf9wlEtXIdinUFaBCQLzvK68b+BToVEEcwcqsxrvZWhTHVSK9o2PDKXSnJWjSfaPV@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6K9tP8vWs3/oYDYf3aKQewMRC7oQskihupoMNlj6e7+Eiujp2
	0hQbjyAWOb7rn5KV02suE82OADohF/oneDG/mUGeSlFdQYmJEdalRt1ARALpmNvZEEaMChDWP04
	lsT3Q+eohhuA1X4LuL4q76QRp6u4GB6sx/TUWIFrW2zWfzg9g3PKPzaCJcYhEMdk1jf1P
X-Gm-Gg: ASbGncun0jlcysPBgD4QY/njiuZcmccHngQhx7ULcfgN8MdujImMI9oRqKBAPL76xp2
	dzSR3ypRXOWq7BMCq8OhCly+3bpDZcKLN4C8dlVEQeIS6dWxibl/ovAUGhQS5Qd60SWda9QL2vc
	u3xUIq3zqmYhDE2pETxKNR8hgY20hhVxkCE7T1ul0nBfbYLt6smhbEqegSob9oOPNYCfDsqccdS
	HbYgQyGalREvypgZHy+e8gZka2Xsupyk1u4LQbLPwm7gSyfp2athwHF9TqLkLs3LixNOdLakeuH
	EhYN1/fdvEqhuW/goksjzNcoS2SC6sUPyMutl9jl1VSD0dUFMiN0APXOIu5lAU1y33PdST5esUa
	Z5OVHAfS6Dzoj57OsvZx+klPocnA=
X-Received: by 2002:ac8:5a96:0:b0:4d2:c24f:8495 with SMTP id d75a77b69052e-4e576ab6f37mr145453601cf.10.1759840766073;
        Tue, 07 Oct 2025 05:39:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBOfqIkALCYby5/GHjIjhxo1RktcdDyNxe0vMnZPbSP14BURV+Jd5BfDc/NgetMniX/+yEhQ==
X-Received: by 2002:ac8:5a96:0:b0:4d2:c24f:8495 with SMTP id d75a77b69052e-4e576ab6f37mr145453201cf.10.1759840765488;
        Tue, 07 Oct 2025 05:39:25 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970b2basm1386434866b.51.2025.10.07.05.39.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 05:39:24 -0700 (PDT)
Message-ID: <b6223af9-2d9e-4ccd-b297-79f63167242b@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 14:39:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: qcm2290: add LPASS LPI pin
 controller
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20251007-rb1_hdmi_audio-v2-0-821b6a705e4c@linaro.org>
 <20251007-rb1_hdmi_audio-v2-3-821b6a705e4c@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251007-rb1_hdmi_audio-v2-3-821b6a705e4c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IrITsb/g c=1 sm=1 tr=0 ts=68e509ff cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=83KosTCz9JabPjGXDAIA:9 a=QEXdDO2ut3YA:10 a=5XHQ0vS7sDUA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: LgTVh3StmgReP5Q2PIixPgmGzyvC4qCG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyOSBTYWx0ZWRfX1w6A4xEhRV2M
 ue8FLDwOPfFsUAc/F+fD0Hfcxmm61bOKCWZGXvT0VhGxrQF3yTMHGSz6z7LattiGgAj8/bO6zfn
 S7oZqVVVWMGAR0urvLBdX2uYV8HEh/oK2ASekVI52kzuOhffx8SfALatoAMthEseIbBqF7LPak9
 nCBsSQwceTyI/L3zTQb2XVZHTtXSdEq1BjtRjmwTATo9RBaAU9V3NP0XCrloDfUY+xxXa79ziqV
 putcXI5lrqBJP4VtKRuza2CY4VxpJAyJYuf/9HG3q7gHfl2pf3F4Y+FyJQmn+C5CtEPwtrzjJG0
 YSJ/q8p3TdWvDd+rme3jbU3Zn+Owa+0w/tMfn6y/g/LoXo9EmkcYUo9A69M2XyORSfhTvSGihP6
 0jDs2BEXS7OHsVqK6/rMbP3Ys2Rjiw==
X-Proofpoint-ORIG-GUID: LgTVh3StmgReP5Q2PIixPgmGzyvC4qCG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040029

On 10/7/25 4:03 AM, Alexey Klimov wrote:
> Add the Low Power Audio SubSystem Low Power Island (LPASS LPI) pin
> controller device node required for audio subsystem on Qualcomm
> QRB2210 RB1. QRB2210 is based on qcm2290 which is based on sm6115.
> 
> While at this, also add description of lpi_i2s2 pins (active state)
> required for audio playback via HDMI/I2S.
> 
> Cc: Srinivas Kandagatla <srini@kernel.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

[...]

> +			lpi_i2s2_active: lpi-i2s2-active-state {
> +				data-pins {
> +					pins = "gpio12";
> +					function = "i2s2_data";
> +					bias-disable;
> +					drive-strength = <8>;
> +					output-high;

I.. doubt output-high is what you want?

> +				};
> +
> +				sck-pins {
> +					pins = "gpio10";
> +					function = "i2s2_clk";
> +					bias-disable;
> +					drive-strength = <8>;
> +					output-high;
> +				};
> +
> +				ws-pins {
> +					pins = "gpio11";

Please re-sort pin entries by the gpio index

https://docs.kernel.org/devicetree/bindings/dts-coding-style.html#order-of-nodes

Konrad

