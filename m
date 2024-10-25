Return-Path: <linux-arm-msm+bounces-35970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AEF9B0F3D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 21:39:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D31B31C21D2F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 19:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BE5E20EA51;
	Fri, 25 Oct 2024 19:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mkZWIwbt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C35220EA39
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 19:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729885183; cv=none; b=ld45zNDLBgAHuX/vaOcyUERuy/FcLltpWIghoiPlnQ4E8iL29pk36ifXIRpG8fPUcyRILFuNCFoKz4vqT0IWyGySiuW5HevAKKAVax9jLfZerRgkvcpSKsSvzmY4Q0pl16eRKXIngasAiPsvJEtQ3ODi2QG4ZLmidyXVR6MDeXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729885183; c=relaxed/simple;
	bh=h3swVIaCm3gH7Ok3aF1n02u5px+9KfKP7NCgLtPvcuw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YRZ0Dk2EeKgV/M82lLFJRmoIseIcX2BwOVmPDZMyhrPZy5EMlVGAYK1SDselOKuFaqEXJKIDNQUJ754YESgwkUHkPGxAw4d6Ii1tEjwL/B823CgqKX+7kRegYXNYy3/5zRqj+Oxqd7PgIHO0AMVm8mSyeAzA0Y+SB6nYPsqjiO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mkZWIwbt; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-431616c23b5so17154915e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 12:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729885179; x=1730489979; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rNudOakrgi09S9+yizP0qtRalV2gTsXxi5NDtk4FIIo=;
        b=mkZWIwbtA5nFwj4Fyz7/LyY7WhvPrzRWWnqvZbfvWehopHlcyAyMfa62/4wc8K6k6X
         PipJAX3qdP8wunX0ULERO7Z7gKpu1X/t9DdCE9fqOZnLRYubMpGdHNjRbWQu+na1fgxF
         N0HGSKMFycBU/+H7PYu/IaGNrUngqMcnMWxS9F1LlZqefJs7wUbevmZknBT2f0Msb47b
         C8RNyrLMvOblGeqoujZg5m4T4lfecntejg53pMBb+OklFXwxZRthK+wyWFvE0sr+pyuq
         BE13AmU0tKuUkb4YgX3oObaF7y69MhzXmfY7Wf1T3of2tm0ZtfaIq0vDJ588zyGgAwdF
         lv1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729885179; x=1730489979;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rNudOakrgi09S9+yizP0qtRalV2gTsXxi5NDtk4FIIo=;
        b=sWCatfFobZIkmbX1fCH4G+Ja2kFsz+sJU4iaMnBst6q3fffp6u95YH51ZVsvpHu7uK
         oNK8cu96wv2P2vGdrjSh1ogiUtlxGEa03WFLKCRl7OesOTJ0NS8P1voapcuahKyQhO4h
         bf+ncPDhZYs1u7G9+MSHdqzYbpXzW0Jfk4DKNybbHQvfO8cbgH5AXoutPtI160BqaBnX
         ZliVH4s6QmTnwm+arVRnadWIaRa4QJg0hX5iUCosK6ZIYNDFfwHv7C3nY0NhuWSKg0Fo
         u3+FBTnAJwwbZ6yanp99xALxd0J43f0ab2NI7w8za5u/QYkjss59KcHIJQI4fdd5HJ+e
         wnYw==
X-Forwarded-Encrypted: i=1; AJvYcCWqD+OVqavRn1d/HgeBC717MTB++FJqObU6bdxBPbRoKgHFJvBE8kGa1EAXWdKdtkMkFsUgI2N3xSj0I+BM@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7diPi/Ekw9kwYvHVKfdXfHdZyBKRhNCypHUVIRdUfRaF01VST
	LGORK6ZOeZ2XlVmKLt5DFe+ZPlz4tBE126oTUYKj72+jINmT2T2v1vYwWK6rEhE=
X-Google-Smtp-Source: AGHT+IFAsGfICqjFEVag/1dSMIzHpMXghtsoTxIwbYv1J4KwUX5ZFmRRVF/tsXOYk/1h2HaqEmKmmQ==
X-Received: by 2002:a05:600c:45c3:b0:431:55af:a220 with SMTP id 5b1f17b1804b1-4319a5bbffemr5287305e9.12.1729885177852;
        Fri, 25 Oct 2024 12:39:37 -0700 (PDT)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43193573cd4sm26695675e9.5.2024.10.25.12.39.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 12:39:37 -0700 (PDT)
Message-ID: <1bd45da1-0b14-441c-8ad8-1837e31eb449@linaro.org>
Date: Fri, 25 Oct 2024 20:39:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] arm64: dts: qcom: sc8280xp-x13s: Drop redundant
 clock-lanes from camera@10
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Depeng Shao <quic_depengs@quicinc.com>,
 Vikram Sharma <quic_vikramsa@quicinc.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241025-b4-linux-next-24-10-25-camss-dts-fixups-v1-0-cdff2f1a5792@linaro.org>
 <20241025-b4-linux-next-24-10-25-camss-dts-fixups-v1-3-cdff2f1a5792@linaro.org>
 <7620b929-dbf0-47f1-bedc-1ce87bf6e988@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <7620b929-dbf0-47f1-bedc-1ce87bf6e988@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/10/2024 18:23, Konrad Dybcio wrote:
> On 25.10.2024 5:43 PM, Bryan O'Donoghue wrote:
>> clock-lanes does nothing here - the sensor doesn't care about this
>> property, remove it.
>>
>> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # x13s
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
> 
> drivers/media/platform/qcom/camss/camss.c : camss_of_parse_endpoint_node()
> 
> seems to reference it and pass it on to the PHY drivers
> 
> Konrad

Yep but that parses the clock-lane indicator in camss ports

&camss {
         vdda-phy-supply = <&vreg_l6d>;
         vdda-pll-supply = <&vreg_l4d>;

         status = "okay";

         ports {
                 port@0 {
                         csiphy0_lanes01_ep: endpoint@0 {
                                 reg = <0>; // HERE
                                 clock-lanes = <7>;
                                 data-lanes = <0 1>;
                                 remote-endpoint = <&ov5675_ep>;
                         };
                 };
         };
};

this patch and its sister patch remove clock-lanes form the sensor

&cci2_i2c1 {
         camera@10 {

		<snip>
                 port {
                         ov5675_ep: endpoint {
				clock-lanes = <0>;//HERE
                                 data-lanes = <1 2>;
				<snip>
                         };
                 };

         };
};

This is removing the camera@10{} clock-lanes not the camss{} clock lanes 
which you're right is referenced.

---
bod

