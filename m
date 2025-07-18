Return-Path: <linux-arm-msm+bounces-65677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E6CB0A7C6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 17:42:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2485E5C53A3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 15:37:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B4032DFA3C;
	Fri, 18 Jul 2025 15:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N1P8AJ5C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7E22DECD8
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 15:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752852821; cv=none; b=khaZSFUm7FR/Z7urzQ4MK0C2wWqPdNUd+GriHPkVQDz5euniHN1f8LZbncJKKUtF2T3w5xoNhzsCcrjH6JCowkTnz0Y4q3U8i3F41vrH7R/bdImvUCTiMocTceeJKb0fFpkcPl4RwANZiIrp6/7/e2w75faYQchvnhTujvYx+1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752852821; c=relaxed/simple;
	bh=NUPPjzQw7dGgTkvCLFi5dWXDBs4P8eRQSl4qCNFSjo4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=st92cs3tLdwOgJ/oydggXZRMyPKI1g6WG1rSmWEyvnoIaI53wZ3BKAhh+QbHyLz7m4o5tTsf4xlM7lQ1G3l4n3GweZwHnu6rAJbvMA+nzUfa0qGM2gF22Kc90wkrBQN3dQGWDLmeipjoOTFJuQzR/o342i4KcGwtfmEP5jqN+iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N1P8AJ5C; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-4563cfac19cso7524435e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 08:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752852818; x=1753457618; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5mLNgva7o4H9P0w+y2sRHhUB0YorutSqhR/DNWyiJiU=;
        b=N1P8AJ5CAxdBLZZ392Wls4DcyXShOATcZwByQS0JBZlgvHPSTxFVe8oC3mpUa6A3Gn
         rtDnyzzjzQbMs4Dqws8yo2Jj+gPMrql+DL1CGvAhnnuu6g0xiPZVCtjOxde3sq9iTUgF
         qT3TZmjoz08MBh4tJ3aHpGOb3lsbiG+1QFQcx0E+drBt1Sgsf5cITQETrZRbgGLtP2BX
         ia4Yaokk427PrgOJN6Z1Cc+I48aMQbeSiRTP5KAdoB2Fzp/tHar3tiof/i99aWqPs0jc
         GytHCn+8iHnftQgPdoC3KDMLx1pKMFjGeNYvEeuyaIh4mkr14MR12/wkYZeM416aa65I
         q1uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852818; x=1753457618;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5mLNgva7o4H9P0w+y2sRHhUB0YorutSqhR/DNWyiJiU=;
        b=mm+edczXqGpIerWLXeNF+0L94y4v+coWDUDXXfhYE+03VRT7CwbVgNVRePrf8rEIG0
         rkKXUkylgzihVQ8Rnl1PVYRphXj1vmE9YUUvIH/JqujKSw7iAVic2YuzeAfDi3RV9Gm7
         LoM27jTwk2iSjN6BBkLcN8ldXad+zOJUPcLJTg3BRg8zWl/v8F6fPndq+8c9qrpD6++J
         qMIjHG/2QvEFa+jQkaEby8r6t736qaLIQQ1Uym77PWcxf6jKmqdbb6fp8cj6pTA/+bvG
         J0P8r4mvRqn7jPMh5MnSaHClyqjwwTOs8yx7XlWZCU02Tukt/F+0OnRDMoU0qzBeL/oe
         v9DA==
X-Forwarded-Encrypted: i=1; AJvYcCUpry1HwLKZoMIyjXC4X9Bxx0GwtGv8CMElhdLSodcxca8c7gmpNmh/Ce+IPQsKv02f0SLzCrX36aXtfgty@vger.kernel.org
X-Gm-Message-State: AOJu0YxE+bBpCLCtKyjWDA7jzZJosSIJbufFWC9ULeHtJI2D+M10qvwF
	zk09W9Vn9ZlfZyt7cve41jeLhNNjz0+nE/AmotbAPbVCYq2AKMN8ehWRGFmr89Jdj9Y=
X-Gm-Gg: ASbGncvbVL/9F0/aA9+UB/84pAHIjG5j5Kncj7G9iP8TqUZ4Q/l53QfemDDeXLbBR9q
	B/4IXy7GHzBv1ve+IcEKFgnJQVpL3k4whFNsP7X7S+ayCGG/PPCaw5nnpZHx1MAxzoKRroVDIsA
	6wqgc4qp0X2AfFoYOhMPsjtG6QmniFPnZW8W4xx7wiJDHBeLQQDFtl3CtqTp3VJy7FsNG3Q0wl5
	xTjuigx/LkBEIwh84ysCqHsYdW+qYcRFjL+cvdtdjCSNfuX5Z3TTaA5SEnkaPYj0mjH4gRr29UA
	We+8YHFnj2UPx/3Wf8pnWiTwcWMIjXzMEgDcY413hB6owLKRB3LYfA2eUlIqCujrMyKL6nHuxQP
	tLEs0KBj0oqp6SiMFAuFz9Th8d0lusgsYW2tRqxiHCigDz8AJxssWgXYiK+hQXwc=
X-Google-Smtp-Source: AGHT+IEOv5eYenwRTG2hZckYeMdjm6KgDbHwVUbcn3C9vLpAWVl0GFbqjTSswGAchOI7AcxMI/rkRQ==
X-Received: by 2002:a05:600c:820f:b0:43c:ec0a:ddfd with SMTP id 5b1f17b1804b1-4562ed57638mr102816315e9.6.1752852817737;
        Fri, 18 Jul 2025 08:33:37 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca2bc6fsm2227347f8f.28.2025.07.18.08.33.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 08:33:37 -0700 (PDT)
Message-ID: <316007b6-6e24-4095-be24-fbd4ae7d425c@linaro.org>
Date: Fri, 18 Jul 2025 16:33:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] Add Dell Inspiron 7441 / Latitude 7455
 (X1E-80-100)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Val Packett <val@packett.cool>
Cc: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250716003139.18543-1-val@packett.cool>
 <a2681844-a96a-465a-a48d-49e1ede526c6@linaro.org>
Content-Language: en-US
In-Reply-To: <a2681844-a96a-465a-a48d-49e1ede526c6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16/07/2025 11:53, Bryan O'Donoghue wrote:
> On 16/07/2025 01:26, Val Packett wrote:
>> Since v3[1]:
>>
>> - Applied R-b tags
>> - Skipping the eDP panel ID patch now since it's been applied
>> - Fixed the last remaining '-names before -0' order issue
>> - Changed usb_mp: keep the unused PHYs enabled in the DT
>>    (to let them go to sleep), like how it is done for the XPS
>>
>> [1]: https://lore.kernel.org/all/20250706205723.9790-2-val@packett.cool/
>>
>> Bryan O'Donoghue (2):
>>    dt-bindings: arm: qcom: Add Dell Inspiron 14 Plus 7441
>>    arm64: dts: qcom: Add support for Dell Inspiron 7441 / Latitude 7455
>>
>> Val Packett (2):
>>    dt-bindings: arm: qcom: Add Dell Latitude 7455
>>    firmware: qcom: scm: Allow QSEECOM on Dell Inspiron 7441 / Latitude
>>      7455
>>
>>   .../devicetree/bindings/arm/qcom.yaml         |    2 +
>>   arch/arm64/boot/dts/qcom/Makefile             |    4 +
>>   arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi   | 1666 +++++++++++++++++
>>   .../x1e80100-dell-inspiron-14-plus-7441.dts   |   52 +
>>   .../dts/qcom/x1e80100-dell-latitude-7455.dts  |   53 +
>>   drivers/firmware/qcom/qcom_scm.c              |    2 +
>>   6 files changed, 1779 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
>>   create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-dell- 
>> inspiron-14-plus-7441.dts
>>   create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-dell- 
>> latitude-7455.dts
>>
> 
> Just tested on the 14p this updated version seems to work just about 
> fine - or no worse than previous.
> 
> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Ah I was booting my old dts with the spelling mistake "inspir I on" 
booting the insprion.dtb here is a no-boot for me.

Please hold off on applying this, until its root-caused.

---
bod

