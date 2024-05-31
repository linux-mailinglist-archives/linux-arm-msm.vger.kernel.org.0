Return-Path: <linux-arm-msm+bounces-21266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5A48D61CE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 14:34:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF95B1C223B1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 12:34:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 949A41586C1;
	Fri, 31 May 2024 12:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H36Xph5Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C910C156243
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 12:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717158836; cv=none; b=CZBE5R5tGEPOkz9lvVENEYMSLw3yV9TGb+K4B3S2TE/DbHf1Qn6ysGsOhE2cMzCZHCpG9ao5LzL4kVKdVifJQtI/J/QwZKFy37NRQ1vomBu//1PX9sGsB+DMIuaLT2g2cftq7VESNEd2KYhNsN+xjZUE8IDZ71EFY2BzD6flf8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717158836; c=relaxed/simple;
	bh=s5v2zgyKyx/7jhzq4r32Kqdi2fWhYc8qhUWF6o/V9Cc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HT0yBxLpsQl2a5varKCnNyWe+m7bcuBTnGo8NH4tN46ebuDJAj6QvXpyY5YvkVPDNWK44buL603sM2pzen8eY0tJ6I+NA7le3T4It6uxbPnKAGG/l1jTSfQ/zNTSzIlSrgs2iykN84EMksIWxRoqseOd8B3MYILw93MJmk/i5Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H36Xph5Z; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5751bcb3139so2367547a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 05:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717158833; x=1717763633; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kOG28w+Xt++8GjibapminGB/LWiUPIUiCSP8LYdYn9I=;
        b=H36Xph5Z7dknyyzKYZ0CEmRy1CYn5YmftzZQcKFiLlxC5l8zm0/5jTskaiVsG/w1fm
         t/+wbWhfWgfyOMCB028eeswnLVYVD8RXcTkqUvvK5Y/MAdBSd6OOHMz8WnsRGN3AP/zX
         SFhVCXtXUuCd36XGaTk4kziInvgT54KYhhq78/hqs30O1Q1Oc8kykUbLbxnxoNN3AXja
         EXEk7V+4nu9YGWiGxsDhH9IVWfAqCn3jJFthASVaR3y2/X47FTOWsz/2ZV3KSu9dkPtG
         kR/INZ3hSiYJwn+5rKFQRUBvQkZe7IBr1XpQ6T9lvReNH15J3ZTYZtlTjWrScOA2ETa/
         v4xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717158833; x=1717763633;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kOG28w+Xt++8GjibapminGB/LWiUPIUiCSP8LYdYn9I=;
        b=EEFGx10WyYKBb8C7VBRm0vrANuAK8vCOuh8mqtKUzUUMJqMkPNPa8WY96nNxkOFXqH
         Wwz+z6r7a694GXxKD/TAKTzWbgDqXkwTwDPmvTXrYTmyh1lCmn9s2+B8nm8DJtcD44Vc
         QzcZ9GtlxHMaL8KSb3T6AKejEO5gmpOL15Pj43PPOeWSvXobQf0qKR0UDEA5Gby9kRAt
         lkj1aymed0Im4ZVxssplwWLA8G8hMzYbsavxRMpmxN+MBbxsfXv6tzWhvCOyI4oUCVig
         CPcuVzDJTXu/R9K/rywLdtUOXZzzthU3N6Qvra1mZpUoc7XberQemcVJ+HSQhw6yA1i+
         qoBw==
X-Forwarded-Encrypted: i=1; AJvYcCWWNUSeJz1gaf/6+eYodTPVpGt4MszB87QK8X+vszNF9Wx6drRuEjVm1QNsV+aV0MYZiOaklEj+eeLUqFg9T9KfDG0LZ1SMLKmnmrjGeQ==
X-Gm-Message-State: AOJu0YwKPdyLH1OqAMR7ml5QiEmn3pnjV9Q8fr4bi+tFeHCGOVeg29OD
	stks7+FyOBkT6l3zDdJPwlMPWnjW3Sh84B41TQmSWhO4AQxf0Wdoi46laQAD2hU=
X-Google-Smtp-Source: AGHT+IGUEIOiw0ueXFMgATDRvPcynZKPrc4/cgdb5YbG/FgVQTRxUxntoIcA6OnBLS6XRh6vdNMMjw==
X-Received: by 2002:a50:aad4:0:b0:56d:faa2:7aca with SMTP id 4fb4d7f45d1cf-57a3638b411mr1397407a12.17.1717158833147;
        Fri, 31 May 2024 05:33:53 -0700 (PDT)
Received: from [192.168.128.139] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a31bb8225sm937435a12.24.2024.05.31.05.33.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 May 2024 05:33:52 -0700 (PDT)
Message-ID: <e732257d-cd16-4e81-9a20-af481184ce0e@linaro.org>
Date: Fri, 31 May 2024 14:33:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Disable SS instances in park mode for SC7180/ SC7280
To: Doug Anderson <dianders@chromium.org>,
 Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: cros-qcom-dts-watchers@chromium.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Kaehlcke <mka@chromium.org>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 quic_ppratap@quicinc.com, quic_jackp@quicinc.com
References: <20240530082556.2960148-1-quic_kriskura@quicinc.com>
 <CAD=FV=UhrCKCv5R-LAAugrLXFp=cDcj2=Pp9-N3qk5pk2=sGEg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <CAD=FV=UhrCKCv5R-LAAugrLXFp=cDcj2=Pp9-N3qk5pk2=sGEg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.05.2024 3:34 PM, Doug Anderson wrote:
> Hi,
> 
> On Thu, May 30, 2024 at 1:26 AM Krishna Kurapati
> <quic_kriskura@quicinc.com> wrote:
>>
>> When working in host mode, in certain conditions, when the USB
>> host controller is stressed, there is a HC died warning that comes up.
>> Fix this up by disabling SS instances in park mode for SC7280 and SC7180.
>>
>> Krishna Kurapati (2):
>>   arm64: dts: qcom: sc7180: Disable SS instances in park mode
>>   arm64: dts: qcom: sc7280: Disable SS instances in park mode
>>
>>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 1 +
>>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 1 +
>>  2 files changed, 2 insertions(+)
> 
> FWIW, the test case I used to reproduce this:
> 
> 1. Plug in a USB dock w/ Ethernet
> 2. Plug a USB 3 SD card reader into the dock.
> 3. Use lsusb -t to confirm both Ethernet and card reader are on USB3.
> 4. From a shell, run for i in $(seq 5); do dd if=/dev/sdb of=/dev/null
> bs=4M; done to read from the card reader.
> 5. At the same time, stress the Internet. If you've got a very fast
> Internet connection then running Google's "Internet speed test" did
> it, but I could also reproduce by just running this from a PC
> connected to the same network as my DUT: ssh ${DUT} "dd of=/dev/null"
> < /dev/zero
> 
> I would also note that, though I personally reproduced this on sc7180
> and sc7280 boards and thus Krishna posted the patch for those boards,
> there's no reason to believe that this problem doesn't affect all of
> Qualcomm's SoCs. It would be nice if someone at Qualcomm could post a
> followup patch fixing this everywhere.

Right, this sounds like a more widespread issue

That said, I couldn't reproduce it on SC8280XP / X13s (which does NOT mean
8280 isn't affected). My setup was:

- USB3 5GB/s hub plugged into one of the side USBs
  - on-hub 1 Gb /s network hub connected straight to my router with a
    600 / 60 Mbps link, spamming speedtest-cli and dd-over-ssh
  - M.2 SSD connected over a USB adapter, nearing 280 MB/s speeds (the
    adapter isn't particularly speedy)

So it stands to reason that it might not have been enough to trigger it.

Konrad

