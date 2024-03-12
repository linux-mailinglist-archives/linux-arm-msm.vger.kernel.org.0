Return-Path: <linux-arm-msm+bounces-13929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8068793C2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Mar 2024 13:08:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DBC02B2509C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Mar 2024 12:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C74379DDF;
	Tue, 12 Mar 2024 12:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mGTxnbab"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5C279DD9
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Mar 2024 12:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710245006; cv=none; b=aLCsWtKx0NccQldueWsgGrM6Y4eXcyunJ6YSN9kOvP3UOfdjMIfnxFTa95CbBVu0hY4NiznxV9tMns9Am9hevXBOeyoYfSlh7U9DpR4btNGIlACXqO+5OBybLki6ovkL971/vEIycW5ppyok3JlzybFwUoyGCuxegAIDx5aafpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710245006; c=relaxed/simple;
	bh=mYDXkLkmO306AaXyIF7M8YDLT22d1ev6IWwdSQV945U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TFRzm4wdhRdhrxXZJqbizq0enBY6bBbx5nWNnQ+isIQS/c3vKzMaB/c0j24pNX3gkUdFmGFyQxSvXnaejzpq+Ifp1U4QQ9AHmKUGPOj2GioQXwJ35REuB1IAhwjx4RTTRSUXzlMt6+xsZL6S+LeHW6RVN5NlyF+BnDXEkbotBlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mGTxnbab; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4132a348546so12574235e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Mar 2024 05:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710245002; x=1710849802; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nxq7pcJo3LT3VgGTpu291pG7RDcNuTFCrtjHrNFKvcY=;
        b=mGTxnbabxdYWLGAIXubZY9tyEEuFoDaOFe4Pr+bSTn51TERXsfOZ0eCkpvfteDcBNz
         LiY0j1O/ND9x5wTWZTaDvD1/ykVdY08OX20NdP0dz6c5YRQarJOw+teUcsfQD5Og1ZgR
         fqGhAC7AGB5Xouax6vXuUk7FuSr8UpqNWONF6T+/LPR77Kv7qBianqAzLijSaq4aza7t
         crtjuOI2EJ7TldFwua3VpyHYKqnHg8apWhgOjLhLirr6D7d2WMg2HSnD94jupKLyeWIE
         9ExEKi0nEHMNzs2hQS3haRBWMEwgD/yoLpbsVjrFtDweLH7ELnmftMcHlRNQbuLHAzhp
         nrCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710245002; x=1710849802;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nxq7pcJo3LT3VgGTpu291pG7RDcNuTFCrtjHrNFKvcY=;
        b=GjzXu5wcMii4xJv7DFuH7t3lXH7dvFp6HBkjZ8r4KTtl6CgTwqUUciHJvsvTq8SwAd
         43Q2eMRwHgoS/4GLKxM6L5YX7e5c7Na/1OLA7WTxoLXn+jTaYlIH1xEzz2ou+i9+TOYw
         8qUw1dJlauXhvrKJNYDDAbN/V97NFSgiZysAlpmauc/Y3Ey64sJZb7APsasoxC7Jsp9g
         BcziJdZh2Z1FPFTSNp4fhFJq68XR0ggAvzMCj7opKJHbazhPUENQzbtxV7TdFPWKzUzt
         A28J7HLb3sHnUxUU2W5mqBmEh47Drnad6dpdt1/SPfBS3Cos8cdLmQjc8n3sk8BpcAnG
         QNfg==
X-Forwarded-Encrypted: i=1; AJvYcCXc+9KiMAbGElXtKnaZ06npAWV6dbqNKz7TEZuW0dNhbJ2Vf2/KipaErMNzybLR12njeV3sk8yWeMOT+Pi9v4LoZoPwIh+O/B34qXlyEA==
X-Gm-Message-State: AOJu0Yy6E6n8iZ6vCjIwRoLQnBRqlKgmj2NC81ouSNgAN1cY49HOh1Hm
	zhm/qEnpdmmH0oIpdxt2D+qL+pGomRKjCXdTblbbHPsAHOhVmVJbR6/tFIJVV74=
X-Google-Smtp-Source: AGHT+IFbkRb22ArDTUOGRP1IZHMKrk8HwSfVZan9rWO8EdKfq4QaTVzPNGy+pUgZnDJQpfwohOaG+w==
X-Received: by 2002:a05:600c:43c4:b0:412:faa7:1398 with SMTP id f4-20020a05600c43c400b00412faa71398mr7505612wmn.21.1710245002001;
        Tue, 12 Mar 2024 05:03:22 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id fj3-20020a05600c0c8300b004131f5966f5sm11892371wmb.42.2024.03.12.05.03.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Mar 2024 05:03:21 -0700 (PDT)
Message-ID: <bc402b70-4b68-4768-b976-8fdbdc61d152@linaro.org>
Date: Tue, 12 Mar 2024 12:03:20 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] platform: Add ARM64 platform directory
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Nikita Travkin <nikita@trvn.ru>
Cc: Hans de Goede <hdegoede@redhat.com>, Sebastian Reichel <sre@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20240312-aspire1-ec-v4-0-bd8e3eea212f@trvn.ru>
 <20240312-aspire1-ec-v4-2-bd8e3eea212f@trvn.ru>
 <4b65793d-0196-0118-6304-b078eaacd482@linux.intel.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <4b65793d-0196-0118-6304-b078eaacd482@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/03/2024 11:40, Ilpo Järvinen wrote:
> On Tue, 12 Mar 2024, Nikita Travkin wrote:
> 
>> Some ARM64 based laptops and computers require vendor/board specific
>> drivers for their embedded controllers. Even though usually the most
>> important functionality of those devices is implemented inside ACPI,
>> unfortunately Linux doesn't currently have great support for ACPI on
>> platforms like Qualcomm Snapdragon that are used in most ARM64 laptops
>> today. Instead Linux relies on Device Tree for Qualcomm based devices
>> and it's significantly easier to reimplement the EC functionality in
>> a dedicated driver than to make use of ACPI code.
>>
>> This commit introduces a new platform/arm64 subdirectory to give a
>> place to such drivers for EC-like devices.
>>
>> A new MAINTAINERS entry is added for this directory. Patches to files in
>> this directory will be taken up by the platform-drivers-x86 team (i.e.
>> Hans de Goede and Mark Gross).
> 
> Mark -> me.
> 
>> +ARM64 PLATFORM DRIVERS
>> +M:	Hans de Goede <hdegoede@redhat.com>
>> +M:	Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
>> +L:	platform-driver-x86@vger.kernel.org
>> +S:	Maintained
>> +Q:	https://patchwork.kernel.org/project/platform-driver-x86/list/
>> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git
>> +F:	drivers/platform/arm64/
> 
> Is some ARM64 person going to pay attention to these patches (you or
> perhaps somebody else)?
> 
> It's perfectly fine to have some ARM64 person(s) listed as an additional
> maintainer there even if the patches themselves are routed through Hans
> and me (and pdx86 tree). With Mellanox and Surface platform drivers which
> are also routed through pdx86 tree, we have Hans + me + 3rd person listed
> as maintainers.

You can add me as a +R.

Perhaps Dmitry and Konrad would want to be on the list too.

Actually since Dmitry has already done some work on this, I think he 
should be on the review list for this series.

Adding..

> 
> (This is not to force anything on anyone but it could be beneficial if
> somebody more familiar with ARM64 is in the loop.)

---
bod

