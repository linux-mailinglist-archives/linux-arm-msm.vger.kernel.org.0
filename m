Return-Path: <linux-arm-msm+bounces-83674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D136EC907A9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 02:20:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5107434C9CF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 01:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BAB81E7C2E;
	Fri, 28 Nov 2025 01:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sEzO12M+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF446A33B
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 01:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764292801; cv=none; b=sHe4s+yUenxTTI9VyzdeA4iiY+Ic1UVdN2dWKbKDXcTynkPhsnU0gdpvHAPQy6owZN2tRvwup49OhUf9VhLVH00uvL/shFav3eMxV6xy7GHxlkLdq2Gry6Gv+PczPAnx+P5WzxDRm8zzqXAeSTpErTP6PrnJml8vaf6IzIDk7zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764292801; c=relaxed/simple;
	bh=Xh8FidNQEs184MgopMgAshY0wsFIouLntNkVMgKSSFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SVWyyhqePRwSZAnWD8bwT6T0AKKILLUYjfd+osCjPSqKQVINSUWwGkOvRhs8/7f8gX/Q5H7kjXeR/2Omfp8I2aAY6J39rn7q6qd61BJdccoG0CmM9SjaLLQrU3ARhAOLcweSoGB9F71BhMWS2sZFWBbxVsxLNp4u4QjSiVA5SsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sEzO12M+; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-37b657f6e24so2010461fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 17:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764292797; x=1764897597; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1xDF0EDM6IMGCavyFBHjGw9HJGxUae+QwmkNBhQa+yU=;
        b=sEzO12M+XCcTVo6dXmJp80fvvoPFgbgiBTikS980gkg9T8p3vVj/dkCM8W1e0QUWQY
         sbxKDiAax3XzlQYJHLTth+vzuAx+AGiSM/6hmoA0CcGxUurIMl9EKWEjM7JTd5EC9bkh
         zWysY64/1EEy0LqDdmj+qJGfrsuSRe1yqCGMqgPTC03iv5NsDRAoVFC1Wl9mnm9uWAhJ
         xKCl3AwEWkbFTHKi8D1cqZqp2JjkPQrV0imiOAHd3tAmgTEPZkmzNEaeNys64UlqYikj
         ZB5REQAiBZ0GSZh+TFhuMqbzHyXeqWLEX84CHBWCbiwP/DGMuN06E/DcRjdtMDLAKZij
         T7cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764292797; x=1764897597;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1xDF0EDM6IMGCavyFBHjGw9HJGxUae+QwmkNBhQa+yU=;
        b=CdS8zI6rjMhcKfmyYOXLWMKDO6+IDui+Y9+uM75lZ/YZsnWzqmt1mgtZQ71ldUBuI8
         9WohjK3nsX81s4Rw3Oz+AqOwxzHm9D2ka8OWZLS+dOu09K5W/RgWhh7chEuybTyBqhkC
         BUuI4bbql7Hbi3uZdFTzFE0u6JiFivXAsULxMbsHfp/kM0rMjTdiqcJ4FHcVdszT0Bb8
         bLf+slbeM5A95vwms5fsJOrprgZdLtO7tnk10NPXteMoYBU5BeIfpYR3ufNPUB17xa1r
         qNDlseWO3xjG/ZjGY3vNZW3pcz5RP5Zuv+y3Z/Ah1P/bSVU50AztdPu+pJUkZqamGbeF
         m/jg==
X-Forwarded-Encrypted: i=1; AJvYcCVuy4Q3wqFospYSoYYJqj7S5/4TLkuPcpn89jMMcOIIdfr75njcOhvGhrFyKdVXsk6PfqZYdE2k8YjnC/j1@vger.kernel.org
X-Gm-Message-State: AOJu0YwC4jK99hQJMtEdItKbu8uLotlA38JxqG4GLZ7K/eLO4Rk2n/r6
	AmW9BbtnZgvFcrxPY1Sky6shiUWhxkbdTRFI+LfHpxeVXLEeFHcxtNFYVW/L+MwWVsA=
X-Gm-Gg: ASbGncsWtciEWGKxhiNxxkSHcMo3jL/Cet//xaVeC0VnkejlJO75qJ5wQGoSRcISje7
	2FON1fugnzgMubgAAh1QAr7YP95dU7gJ/BReqNQPPRral0V/7ixbK9cFCrD/4xqF21NBEl87T/b
	IXUMCWECb9CTbomL11zUktK+nR3qlL4eNyNV71gS/pgb7a+o7wNB46ABQCScSmOaBdEp4hXM4Ro
	7nFjsCllBvLkVkxx79slAT5aSVVA85HcMf39SKfiubK+QfGImxneBp6yCNkU/Ezo96klfKuNinB
	WAH684UteYRWjqShuSg6t4U755Mes2hPuLsNe4Kbent5n7bEnE8TrpIbDITUpG8wowm1luKgTpM
	8FRSS3F9NbhBhyV3YqhGdyMsAs2p8qc3B7vW/n6A/joGzTctxb3AEJZBBmtZgrQkRrRWAnWR/Hj
	0lFzEe6ilZpRI9+eR4diIUfmRUsoiPv1F9Tk4jla3N1JtU3vNN6/QxqV9e0cf+iYWF+A==
X-Google-Smtp-Source: AGHT+IHeUKobSKShByGKOG8AH/8FuEh/1k4+K0a8G021A9UAm4AYIoKpHsWdJBUNVgcktttj9wAAzA==
X-Received: by 2002:a2e:2a41:0:b0:375:f6b9:c95d with SMTP id 38308e7fff4ca-37cdc3e3c4fmr34380401fa.8.1764292796702;
        Thu, 27 Nov 2025 17:19:56 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37d236efb16sm6918701fa.20.2025.11.27.17.19.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 17:19:56 -0800 (PST)
Message-ID: <820ac446-a55c-402a-8c53-e83ca0c3f654@linaro.org>
Date: Fri, 28 Nov 2025 03:19:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] arm64: dts: qcom: sm8x50: Enable UHS-I SDR50 and
 SDR104 SD card modes
To: Val Packett <val@packett.cool>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20251126012043.3764567-1-vladimir.zapolskiy@linaro.org>
 <bdf3f54d-a223-4eff-aa71-0d74a83ef46d@packett.cool>
 <3b609409-e19f-4685-848d-807a4e840ad8@oss.qualcomm.com>
 <f820c42b-4cd9-430f-a1ee-4f380dc9ca8a@packett.cool>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <f820c42b-4cd9-430f-a1ee-4f380dc9ca8a@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/27/25 21:33, Val Packett wrote:
> On 11/27/25 10:47 AM, Konrad Dybcio wrote:
>> On 11/26/25 5:14 PM, Val Packett wrote:
>>> Hi,
>>>
>>> On 11/25/25 10:20 PM, Vladimir Zapolskiy wrote:
>>>> The reported problem of some non-working UHS-I speed modes on SM8450
>>>> originates in commit 0a631a36f724 ("arm64: dts: qcom: Add device tree
>>>> for Sony Xperia 1 IV"), and then it was spread to all SM8450 powered
>>>> platforms by commit 9d561dc4e5cc ("arm64: dts: qcom: sm8450: disable
>>>> SDHCI SDR104/SDR50 on all boards").
>>>>
>>>> The tests show that the rootcause of the problem was related to an
>>>> overclocking of SD cards, and it's fixed later on by commit a27ac3806b0a
>>>> ("clk: qcom: gcc-sm8450: Use floor ops for SDCC RCGs").
>>>>
>>>> Due to a missed setting of an appropriate SDCC clock operations in
>>>> platform GCC driver the workaround of dropping SD card speeds from UHS-I
>>>> to high speed was spread to SM8550 and SM8650 platforms, and since
>>>> the fixes in the clock controller drivers are ready [1], it should be
>>>> safe to remove the speed mode restrictions from SM8450, SM8550 and
>>>> SM8650 platforms.
>>>> [..]
>>> I see you have tested with dd on the raw block device, but have you tested hotplugging SD cards that have partition tables and filesystems on them?
>>>
>>> We have this kind of issue on Hamoa where we get I/O errors early, right after the card is inserted and the partition table / filesystem headers are being read:
>>>
>>> [  714.057106] mmc0: new UHS-I speed SDR104 SDXC card at address 0001
>>> [  714.060567] mmcblk0: mmc0:0001 EC2QT 59.6 GiB
>>> [  714.503873] I/O error, dev mmcblk0, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 2
>>> [  714.505660] Buffer I/O error on dev mmcblk0, logical block 0, async page read
>>> [  714.513632] I/O error, dev mmcblk0, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 2
>>> [  714.516469] Buffer I/O error on dev mmcblk0, logical block 0, async page read
>>> [  714.516512]  mmcblk0: unable to read partition table
>> Before we start debugging, could you please confirm it's using the internal
>> (&sdhc_2) MMC controller, and not one connected over PCIe, like it's the
>> case on the Surface Laptop?
> Of course it is. I'm quite familiar with the DTS on this device, I
> pushed it over the finish line into upstream myself :)
>> Are the regulators supplying vmmc and vqmmc in high power mode?
> 
> Yes. regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>; and no
> allow-set-load / allowed-modes (..hm, maybe we can actually add those to
> save power since sdhci-msm *does* do regulator_set_load..)
> 
> But turns out this is not a consistent problem with every card!.. At
> least *now* one of the two Kingston Canvas Select Plus cards I have
> attaches perfectly every time. (Another one of those though often fails
> to probe with "error -84 reading general info of SD ext reg" and
> sometimes has an early I/O error, but exFAT mounts even after that error
> — but this seems like just a "microSD cards are crap" thing.)
> 
> It's the Samsung Evo Plus card that consistently has early I/O errors
> preventing the partition table scan from succeeding (or if that

For the last 10 years it's known that a multitude of Samsung Evo SD cards
are fake.

> succeeds, prevents the exFAT mount). There is a *card compat* issue here
> for sure, as the card is not corrupted, it mounts every time on a
> different laptop with a PCIe card reader [1217:8621] in the same SDR104
> mode. But consistently has these errors on sdhci-msm.
> 

Please check the actual I/O speed of this card on a host, the given dd
command should be sufficient for that purpose. It might happen that if
the actually supported max speed is not close to SDR104, however the mode
is set by the Qualcomm SDHC driver due to info read from the card out,
the I/O may be faulty.

-- 
Best wishes,
Vladimir

