Return-Path: <linux-arm-msm+bounces-73572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1459B57ACD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 14:25:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDB25176B0F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 12:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0D6830B52C;
	Mon, 15 Sep 2025 12:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d92NrA21"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D98302758
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 12:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757938994; cv=none; b=Y7IbjCkzY43/WVC0kjLl5mO0mruFv2sYqGoP6eoRDEKai3zc8ogycj5dD/C/FsBX0HgEkh5gPXqmDUas0GNH4jEU+/bQKbqBAPJM+piFmb8VA04Ih+aDf2srbcI7uJgLczU+Nlk4Z3TCRBfnMOb2s4mgGVQ9p0wvY4BOXCAnjtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757938994; c=relaxed/simple;
	bh=5xrfPKBwasccncGpp1riHATGItrRFQA9e7fK5DOChWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bf9KeMvEyNQa96Fz0mQ/IBvPbd2yDFUeTg/lUQagl4PXSn9ESQnsPZwuMaygHUWlS+96hFaMhHp23KzpjYQW0mosCXOkaWxuoOVFq24wSLV25qyY9Fn2GW6sr16W/rE4pS4brtN34u44Om4ByGhnNcLmFtOtk0yo7yRH6GUn6yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d92NrA21; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-26058a9e3b5so14005625ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 05:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757938992; x=1758543792; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BLsV2Z+nUo8sMXEFFkNLHMe788HpOvgGfih/dxbv8/Q=;
        b=d92NrA21wzXp3ih/7mn0bssucgDcPyelS4/1QZV7A5WQH0PTmiAvF/VjLvEyIrWxMj
         Lll60/S1SO+dKKSdWKEMGMD+PRDJjas1f/lpuWOZDxJ4qmly5KUMcwx0Li0DS3EG9MBb
         AV3dkyhxyWqRFBsFc39NNm6mE01aHlFJDoZ0YFW1+09PKIq4/dqGm7NABWa8esiG+Gsu
         xIj7yM1BjOqS+AezjL7X5ldNHX724YvR6JDCOTdQxl4vsMu2I/pzvFsP0vgywnEWMooh
         yYljsovinRclSbpmIiyOpscELrlZZsYwD/YqVxXPx85hwRNsnm4Jt3sA/lfgnAa812Hq
         5JUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757938992; x=1758543792;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BLsV2Z+nUo8sMXEFFkNLHMe788HpOvgGfih/dxbv8/Q=;
        b=L+nfZrp4gtaCmTd7WKJNgiuLbRYSwKy5km8oO4CFQcdfuql+HLckqW7hf5DOOzZCKF
         GAoWx/cAMp8j6Ssmi4Xa79z/cxIfDxap4Db5OYQNx+MWd/8MhL6eaUA5TvpMXrLryeQN
         KucXdcDHn/gx3+WK4Ha8KBdr6glK7eaTc1QMjS4f3tO3eX76/QyNBpOLI565OxU1uxiu
         IGhQFnoPikVQmelMnvQMKAOMD6DsmQx3mrJ0EPIOqmMtf9ZopnBeu4JFEEuBwtQfVAAK
         sF8PywEbOvQ5bZycUYrgLl7hcwPan5JNK4CEifwXbsDI5to2L/pWzT8kDl8IZwJKMPaj
         BO5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVd8ghvLkFsJpBPSvNAyaAXly/cPI/cvWiM2D4h+SRsgZ6vFNROHpl0a91ZVNHv/hlrKIUYem6OvetnXe2B@vger.kernel.org
X-Gm-Message-State: AOJu0YxtqkKKSilfOjgVTcrajpGFzQTJPDzTUKcF6Mc9a9FR2NS0WIMX
	GxJlhYir8MCjeTowbXUX/ypUxXSo9obTrUZBO3VQxzHJnP/FH9eyVvWhGB0PHA==
X-Gm-Gg: ASbGncsFRyDfzs9jnyk4aJfWOwO/EvfahaKRphR+OExRGIOZKi2KPZGxnEYUIqIJ2vK
	oGhBVaS7eL3HnHQb9I+HEPS/cyvN2gAqq7eAkk3cq2Xxi2DOjyKYA0Ir6ME0JMaoqcq05qvd0hH
	OgSEsLUbQVEQI/lxjUucJ378D5Yq/KRUCpb9xWRy3qUzAZi5WKUmJ6vULmHRcYOzaPcJDPrK/iv
	Wj3lfFU4P7GcHxGYlNnw48/nlf8bFsb+0nZrO77+PGFh6AhpBbrONWDJcLkSehlGpXVTgDy+R+r
	v5DsWCEau9uHTsEq8Hq7+OMnA5uN8D5kYFkILeTQdXyRC8CdwrX4ivSzmtHJYm4fkW3trr0HQRc
	glvZ7ha+qbBdfXpVccsm+0siSaB3IQmVnMT+Y4wvDCqM=
X-Google-Smtp-Source: AGHT+IHsgD4HtGNllz3TJgLmEZtL9+Q2yo+F+oIRA9Ql5MSTHWjzJksW/qpE9gNeCm4EfBk9gupLBA==
X-Received: by 2002:a17:902:ced2:b0:25c:a9a0:ea60 with SMTP id d9443c01a7336-25d26d4cb18mr154813005ad.42.1757938992402;
        Mon, 15 Sep 2025 05:23:12 -0700 (PDT)
Received: from [172.17.44.75] ([49.249.92.90])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2623fd4d163sm63722225ad.80.2025.09.15.05.23.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 05:23:11 -0700 (PDT)
Message-ID: <42b297e8-b7ab-4527-962d-7689f7efcbdf@gmail.com>
Date: Mon, 15 Sep 2025 17:53:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add support for QCS615 talos evk
 board
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: konradybcio@kernel.org, andersson@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 tingweiz@qti.qualcomm.com
References: <20250909125255.1124824-1-tessolveupstream@gmail.com>
 <20250909125255.1124824-2-tessolveupstream@gmail.com>
 <5oytapnerwmttc62q7s2vxlrtmcfg3bhiycpw4enak6zyaioyh@s4drz5x7hoi4>
 <45f1c0b9-d9be-4d95-b27f-e3a1a015d24f@kernel.org>
Content-Language: en-US
From: Tessolve Upstream <tessolveupstream@gmail.com>
In-Reply-To: <45f1c0b9-d9be-4d95-b27f-e3a1a015d24f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 09/09/25 19:35, Krzysztof Kozlowski wrote:
> On 09/09/2025 16:02, Dmitry Baryshkov wrote:
>> On Tue, Sep 09, 2025 at 06:22:55PM +0530, Sudarshan Shetty wrote:
>>> Introduce the device tree support for the QCS615-based talos-evk
>>> platform, which follows the SMARC (Smart Mobility ARChitecture)
>>> standard. The platform is composed of two main hardware
>>> components: the IQ-QCS615-SOM and the talos-evk carrier board.
>>>
>>> The IQ-QCS615-SOM is a compact System on Module that integrates the
>>> QCS615 SoC, PMIC, and essential GPIO connectivity. It follows the
>>> SMARC standard, which defines a modular form factor allowing the SoM
>>> to be paired with different carrier boards for varied applications.
>>>
>>> The talos-evk is one such carrier board, designed for evaluation
>>> and development purposes. It provides additional peripherals
>>> such as UART, USB, and other interfaces to enable rapid
>>> prototyping and hardware bring-up.
>>>
>>> This initial device tree provides the basic configuration needed
>>> to boot the platform to a UART shell. Further patches will extend
>>> support for additional peripherals and subsystems.
>>>
>>> The initial device tree includes basic support for:
>>>
>>> - CPU and memory
>>>
>>> - UART
>>>
>>> - GPIOs
>>>
>>> - Regulators
>>>
>>> - PMIC
>>>
>>> - Early console
>>>
>>> - AT24MAC602 EEPROM
>>>
>>> - MCP2515 SPI to CAN
>>>
>>> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
>>> ---
>>>
>>> This series depend on the below patch changes
>>> https://lore.kernel.org/linux-arm-msm/20250625063213.1416442-1-quic_ziyuzhan@quicinc.com/T/#t
>>> https://lore.kernel.org/all/20241224-fix-board-clocks-v3-0-e9b08fbeadd3@linaro.org/
>>> https://lore.kernel.org/linux-arm-msm/20250604-qcs615-sm6150-v1-0-2f01fd46c365@oss.qualcomm.com/T/#t
> 
> Huge dependency list... basically unmergeable. But some of these were
> applied months ago, so you claiming there is dependency is just
> misleading. Or you are working on some old, downstream fork... In such
> case it would be NAK.
Thanks — you’re right. I mistakenly listed patches as dependencies that are already merged. I’ll rebase
this series on top of current upstream/qcom, remove merged entries from the cover letter, and resend
a cleaned-up series.>>> ---
>>>  arch/arm64/boot/dts/qcom/Makefile        |   1 +
>>>  arch/arm64/boot/dts/qcom/qcs615-som.dtsi | 414 +++++++++++++++++++++++
>>>  arch/arm64/boot/dts/qcom/talos-evk.dts   |  42 +++
>>>  3 files changed, 457 insertions(+)
>>>  create mode 100644 arch/arm64/boot/dts/qcom/qcs615-som.dtsi
>>>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk.dts
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>>> index 4bfa926b6a08..588dc55995c5 100644
>>> --- a/arch/arm64/boot/dts/qcom/Makefile
>>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>>> @@ -117,6 +117,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-shift-otter.dtb
>>>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
>>>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
>>>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs615-ride.dtb
>>> +dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
>>>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
>>
>> BTW, 'talos' > 'qsc6490'. I think the list is expected to be sorted.
> Yes it is.
> 
> Best regards,
> Krzysztof


