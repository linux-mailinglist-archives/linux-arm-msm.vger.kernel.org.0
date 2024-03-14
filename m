Return-Path: <linux-arm-msm+bounces-14107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D35A887BA3B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 10:18:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 734341F241EA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 09:18:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E8786CDAC;
	Thu, 14 Mar 2024 09:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TFRhgQCP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5D86BFA2
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 09:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710407918; cv=none; b=QiVd6gFM0adATW0vag7mDg8Yv9OEBD7FFvzV0IqIpO5tKvyzuFwEzMWV7xCpqEhXE1EdTK87b4kuiacWfA9qeJcRg1Qhnd6nZx7Kb5/ZyMI1PjXBPOkR1L4N0seMW07vk8f1ICD9rWW48ek9aXqjA0cPATmaBJcB5cHHTrshnXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710407918; c=relaxed/simple;
	bh=6LioQ8SiqW7mEySzp3oMriDdwYTagl5EUgsfGYv1WHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IX/zFtXCmdBCbxFtA8nzx2VfNOqOvS8zWcNUi6Fx6KdwS8sj7w3OLXrcUgUfNoOwWI3hp0QWrx1GboLeEN5Xwm4WfyKacMxaYUvSBDgICeKr6dh6M+zDs5vA8/VCf4EiRyHH94VXnsOGRG4N2fciMpm56DMQAVox/181JXLXUJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TFRhgQCP; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2d27184197cso8270221fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 02:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710407914; x=1711012714; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=noVMlxbR0huw5UJpbPwBwYal3GKYvHZ6/X0NlMoLt/Y=;
        b=TFRhgQCP0UnLbaXB4/2mIF/j7zDXm43jtuJuGgzsL/++o6Ha0roAnh/57RSf6hTXtC
         iqVJPGrw5Ws8hWY2Pvz5wRSYWTAdAeYIVsUdUda7aITDGOH4M6I1kMiSjotHDlNhq6NV
         +qfiVLmmA0Uf9zqBX0Wh6zeYCi7DSBe/0yIlv3d3KePY/fCR8Nc4u3lss/FnpjP9zjU1
         HMRIIQwOIPhszYXmvH3WOVNGU5GaQYBar2Og4FWldCoog/vQBHuN548KoCM8baG8Quvx
         3B9xqJPXQbP2BTG2Td1CE3K0XSVTnyf/UnHBBMbp9wrnQnPr3d/MLKm6USTBOKbTk/sO
         P8Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710407914; x=1711012714;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=noVMlxbR0huw5UJpbPwBwYal3GKYvHZ6/X0NlMoLt/Y=;
        b=ksG4qhexG7XKIbqpdEtz2t4iWNJN242ktGNzc+cQnSZUZanal5wlym9arnL1ebiHUf
         dMkgN8gQywEpRKHts+TYwUY+KaSAsisjIxBfic/aOQ26Q1o60mLiUpn1vZ9VajwMk0os
         G07T3UT1oNKk4q6kwurPNG9SZ/XUeTxGyEHm+1vgm0BHooanp8uWn16nzuVYWd466dYy
         Ud98nVm6qeGRgEg0uFgbhhX75YW6v3PFDXI/4177OgeiXMyK4miczX1CN0C8k49V1Q9n
         si0STov8QbUsiIUxd988xVrfcaaSu0olXRwVX8H3PSyE3wxVmFRvC60dzWkQ+mftemmE
         wgLQ==
X-Gm-Message-State: AOJu0YzQYX9hrLeMDYTBtVv3bFwBaPpf0QwyABzc8DoWIcTyQbt0IA9t
	eHETHl8fGOwhGIG2pEi4OagqV76WJJ+dadcJEOGQI+NbYGf6jOltXthu79a2odg=
X-Google-Smtp-Source: AGHT+IEW9gCiZta7hHYCblKo4F5fpIBSlZsSIdmDSLDdyis2WfGhsR/LdESPU04YGU9cZUHjJIGy+g==
X-Received: by 2002:a2e:88d6:0:b0:2d4:25df:b8eb with SMTP id a22-20020a2e88d6000000b002d425dfb8ebmr709480ljk.41.1710407914046;
        Thu, 14 Mar 2024 02:18:34 -0700 (PDT)
Received: from [172.30.205.0] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id p10-20020a2e804a000000b002d0bf097af1sm53315ljg.123.2024.03.14.02.18.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Mar 2024 02:18:33 -0700 (PDT)
Message-ID: <d82ab1f8-e677-485f-9a6b-4115acfd7239@linaro.org>
Date: Thu, 14 Mar 2024 10:18:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: apq8016: Add Schneider HMIBSC
 board DTS
To: Sumit Garg <sumit.garg@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 andersson@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, stephan@gerhold.net, caleb.connolly@linaro.org,
 neil.armstrong@linaro.org, laetitia.mariottini@se.com,
 pascal.eberhard@se.com, abdou.saker@se.com, jimmy.lalande@se.com,
 benjamin.missey@non.se.com, daniel.thompson@linaro.org,
 linux-kernel@vger.kernel.org, Jagdish Gediya <jagdish.gediya@linaro.org>
References: <20240313123017.362570-1-sumit.garg@linaro.org>
 <20240313123017.362570-4-sumit.garg@linaro.org>
 <c0e10cbf-c6f3-4b0c-8616-983da2a40236@linaro.org>
 <CAFA6WYNMjCaa0FKjNv6a8VFkco3=GBfgWNDuckGZdiZ9dGmHgg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAFA6WYNMjCaa0FKjNv6a8VFkco3=GBfgWNDuckGZdiZ9dGmHgg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/14/24 10:04, Sumit Garg wrote:
> Hi Konrad,
> 
> On Wed, 13 Mar 2024 at 18:34, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>>
>>
>> On 3/13/24 13:30, Sumit Garg wrote:
>>> Add Schneider Electric HMIBSC board DTS. The HMIBSC board is an IIoT Edge
>>> Box Core board based on the Qualcomm APQ8016E SoC.
>>>
>>> Support for Schneider Electric HMIBSC. Features:
>>> - Qualcomm Snapdragon 410C SoC - APQ8016 (4xCortex A53, Adreno 306)
>>> - 1GiB RAM
>>> - 8GiB eMMC, SD slot
>>> - WiFi and Bluetooth
>>> - 2x Host, 1x Device USB port
>>> - HDMI
>>> - Discrete TPM2 chip over SPI
>>> - USB ethernet adaptors (soldered)
>>>
>>> Co-developed-by: Jagdish Gediya <jagdish.gediya@linaro.org>
>>> Signed-off-by: Jagdish Gediya <jagdish.gediya@linaro.org>
>>> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
>>> ---
>>
>> [...]
>>
>>> +     memory@80000000 {
>>> +             reg = <0 0x80000000 0 0x40000000>;
>>> +     };
>>
>> I'm not sure the entirety of DRAM is accessible..
>>
>> This override should be unnecessary, as bootloaders generally update
>> the size field anyway.
> 
> On this board, U-Boot is used as the first stage bootloader (replacing
> Little Kernel (LK), thanks to Stephan's work). And U-Boot consumes
> memory range from DT as Linux does but doesn't require any memory to
> be reserved for U-Boot itself. So apart from reserved memory nodes
> explicitly described in DT all the other DRAM regions are accessible.

Still, u-boot has code to fetch the size dynamically, no?

[...]

>>
>>> +
>>> +             compatible = "adi,adv7533";
>>> +             reg = <0x39>;
>>> +
>>> +             interrupt-parent = <&tlmm>;
>>> +             interrupts = <31 IRQ_TYPE_EDGE_FALLING>;
>>
>> interrupts-extended
>>
> 
> Please see Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml.

Okay, and what am I supposed to see there?

Konrad

