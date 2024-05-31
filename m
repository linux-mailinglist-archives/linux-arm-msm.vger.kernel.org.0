Return-Path: <linux-arm-msm+bounces-21300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 301158D647B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 16:26:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92EF91F223D9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 14:26:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 781B81BF40;
	Fri, 31 May 2024 14:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yFhP3Kl2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FA41C6B4
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 14:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717165566; cv=none; b=u7NKEx6VE8+gxJPJuX78pml13lVcUIl37BUFmRbD68+bNiILJ9gK5zC0YwOa3PUbVtd0a3xNY+84wmXVTRD6cq13Z0iY4AcF8DNILOfRpDbPMn9K1mpNn7Wh9wGIDvYNfCQNt8iAIzOcp4oAKRuKr/x9aJ1GsMs5VHIp1BJAu7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717165566; c=relaxed/simple;
	bh=LqRcRR1cFi1+thtnTUt29DnULSfs9Z8g1CGzHs6MSzM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PcHmWlaUXBjVO+qiCU/W26wN8V1Dk6uePmuf7uouU3qpFFEs1s0yzVc0DMb9k4K00vcW+kh2og2Ta8qox0T5csXsDWC6iE38ndTPGqPZEMsT9qOL4kPpVjzrjc++I8GYpqOK1btWAkMqZJ13vcBjL0AqfqQwB/Qm2MvA9taTuio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yFhP3Kl2; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52b8b638437so781693e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 07:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717165563; x=1717770363; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TFd7dzhMFZkIzJzGiLdET+zEuG1GiWj/+wfLNFxwkBg=;
        b=yFhP3Kl24gu2TI/vB4R3o+qc7gEIlb4beXVBcXn1mGUPYmmYVqtu8BpzyVyEmVB3hj
         jsQ0/wsW3n6dnlpfw+gGeBMhip+dHxCyn0YbZK0tB+mx9PoqZuO2PSoRgJIEL7/e5idB
         VNECOq4BSvweoZSf9jSCTnEnCgDTnMcrGYULzRrwJ9tme/i2HFCAx1d10NIkiYn/HA6C
         +hkXpl+/3+GLg32HV9hnm8pUJe9WYaQY2ZJLcTtLgYLiXxDctSLwNt0/Eq+5ejBrBx1e
         41hQWVE/1LQg0xoIed1/T/xwGqLBDverk7OLTJ8cSzdCMZTG0UJ/U48inv9JwVnCrpVS
         7mcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717165563; x=1717770363;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TFd7dzhMFZkIzJzGiLdET+zEuG1GiWj/+wfLNFxwkBg=;
        b=fYMfA+tjFk4L7WYlz0pLK1grOZtu87SapNIF4u2tbdETcFb9Oz3INfm/FokW3IbcJa
         Z2DY4LS5oNSXoEHZVYQhfiyhTe5lgw1qIZSgTNEQG8B1O4lHRQCbjKmg55InJrLkPD/r
         Nwc43Df3cGHffED7Z4GuHJTAPlKz+vDBrquP2rr2fMkkxRj6pUuCHZYNA1eAaxKvpTUc
         VD82W2/EqlLZWRxMxHHnRe9QFn0z+oheJIkC0xIQz2XZdBgVKTVzeisk3XCmpZ97jFQy
         1hMPMivH1CBSjkSqTOQQrEP9tmJcaFEqkUdiME3+TFjnJKSoYRd4mMTHclcbyoks5Q7U
         aq0g==
X-Forwarded-Encrypted: i=1; AJvYcCWy7aSkRHABgBXMdlQPbZODHKIKUKOxVeDscfqYR5kp69S5Uhi2RyKLs7rJP6eQUG2q73gx2C27nM362O0Hcrrb+fKHdJO4QzRdybQQRg==
X-Gm-Message-State: AOJu0YyTGCadMx4+xFhByIzdGi8nOQsafkoOl2KEfqPG3zPe+2zcdeMH
	NYgHCQfyW+e/wWPAIW4xZcoX3dkcl4U0jWbUcHmbQn2cE2rdvT+XScW/bgcVhgtvUw3aVrfhMu1
	F4Hg=
X-Google-Smtp-Source: AGHT+IFc4CdzwrD/1uDBczJOhAz9Yly8TMnZUxBNCzlrntRUhMCMlLQJIqLJ7jUAXAiUvLODNW4HjA==
X-Received: by 2002:a19:4314:0:b0:523:72b8:8002 with SMTP id 2adb3069b0e04-52b896b4832mr1292417e87.30.1717165562633;
        Fri, 31 May 2024 07:26:02 -0700 (PDT)
Received: from [192.168.128.139] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a31be6525sm1085330a12.56.2024.05.31.07.26.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 May 2024 07:26:02 -0700 (PDT)
Message-ID: <e5f6e9bd-e19e-4997-a646-f3ddee84a5c8@linaro.org>
Date: Fri, 31 May 2024 16:26:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Disable SS instances in park mode for SC7180/ SC7280
To: Doug Anderson <dianders@chromium.org>
Cc: Krishna Kurapati <quic_kriskura@quicinc.com>,
 cros-qcom-dts-watchers@chromium.org, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Kaehlcke <mka@chromium.org>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 quic_ppratap@quicinc.com, quic_jackp@quicinc.com
References: <20240530082556.2960148-1-quic_kriskura@quicinc.com>
 <CAD=FV=UhrCKCv5R-LAAugrLXFp=cDcj2=Pp9-N3qk5pk2=sGEg@mail.gmail.com>
 <e732257d-cd16-4e81-9a20-af481184ce0e@linaro.org>
 <CAD=FV=XO_8SwDLJfoNwwCKEO6CZyMRMY_BdsWMLPBkpczErppA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <CAD=FV=XO_8SwDLJfoNwwCKEO6CZyMRMY_BdsWMLPBkpczErppA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31.05.2024 4:17 PM, Doug Anderson wrote:
> Hi,
> 
> On Fri, May 31, 2024 at 5:33 AM Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>> On 30.05.2024 3:34 PM, Doug Anderson wrote:
>>> Hi,
>>>
>>> On Thu, May 30, 2024 at 1:26 AM Krishna Kurapati
>>> <quic_kriskura@quicinc.com> wrote:
>>>>
>>>> When working in host mode, in certain conditions, when the USB
>>>> host controller is stressed, there is a HC died warning that comes up.
>>>> Fix this up by disabling SS instances in park mode for SC7280 and SC7180.
>>>>
>>>> Krishna Kurapati (2):
>>>>   arm64: dts: qcom: sc7180: Disable SS instances in park mode
>>>>   arm64: dts: qcom: sc7280: Disable SS instances in park mode
>>>>
>>>>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 1 +
>>>>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 1 +
>>>>  2 files changed, 2 insertions(+)
>>>
>>> FWIW, the test case I used to reproduce this:
>>>
>>> 1. Plug in a USB dock w/ Ethernet
>>> 2. Plug a USB 3 SD card reader into the dock.
>>> 3. Use lsusb -t to confirm both Ethernet and card reader are on USB3.
>>> 4. From a shell, run for i in $(seq 5); do dd if=/dev/sdb of=/dev/null
>>> bs=4M; done to read from the card reader.
>>> 5. At the same time, stress the Internet. If you've got a very fast
>>> Internet connection then running Google's "Internet speed test" did
>>> it, but I could also reproduce by just running this from a PC
>>> connected to the same network as my DUT: ssh ${DUT} "dd of=/dev/null"
>>> < /dev/zero
>>>
>>> I would also note that, though I personally reproduced this on sc7180
>>> and sc7280 boards and thus Krishna posted the patch for those boards,
>>> there's no reason to believe that this problem doesn't affect all of
>>> Qualcomm's SoCs. It would be nice if someone at Qualcomm could post a
>>> followup patch fixing this everywhere.
>>
>> Right, this sounds like a more widespread issue
>>
>> That said, I couldn't reproduce it on SC8280XP / X13s (which does NOT mean
>> 8280 isn't affected). My setup was:
>>
>> - USB3 5GB/s hub plugged into one of the side USBs
>>   - on-hub 1 Gb /s network hub connected straight to my router with a
>>     600 / 60 Mbps link, spamming speedtest-cli and dd-over-ssh
>>   - M.2 SSD connected over a USB adapter, nearing 280 MB/s speeds (the
>>     adapter isn't particularly speedy)
>>
>> So it stands to reason that it might not have been enough to trigger it.
> 
> In my case I wasn't using anything nearly as fast as a M.2 SSD. I was
> just using a normal USB3 SD card reader. That being said, multiple
> people at Qualcomm were able to replicate the issue without lots of
> back and forth, so I'd guess that the problem isn't that sensitive to
> the exact storage device. I will also note that it's not sensitive to
> the exact network device as I replicated it with two Ethernet adapters
> with very different chipsets.
> 
> My only guess is that somehow SC8280XP is faster and that changes the
> timing of how it handles interrupts. I guess you could try capping
> your cpufreq in sysfs and see if that makes a difference in
> reproducing. ;-) ...or maybe somehow SC8280XP has a newer version of
> the IP where they've fixed this?

Well, great minds think alike :P I did cap it to f_min on all cores, but
that didn't change the situation. Might have been worth to check out powering
off all cores except 0.. I might do that at one point.

My guess is that with a process node change, they might have used some
newer/better ip revision though. Remains to be seen.

Konrad

> 
> It would be interesting if someone with a SDM845 dragonboard could try
> replicating since that seems highly likely to reproduce, at least.
> 
> -Doug

