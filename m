Return-Path: <linux-arm-msm+bounces-35320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B089B9A97E0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 06:29:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 10E16B21D08
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 04:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8CE57DA7C;
	Tue, 22 Oct 2024 04:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="hn8cyO40"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8383F38B
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 04:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729571360; cv=none; b=q7i/vNijGrIqn5t5xE4usNb74u5BYXMFtCI7N+6RsVHRkEpCiRxskJzwo0KITbcfVLXByhgrHJXl5+NUELtBNz0wcfkg4CbMRYZoUFo1MNE2UfUlXR7MzOJOlwqUFjwdpjOdr3pym7/ZL/8tI8xeP8GtWo0vlcYg/bNqX8oO8W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729571360; c=relaxed/simple;
	bh=3vn8UdTm2vZ8iRF6+NWU3XRwJYYFBfTvmGiraajlAPc=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=MOtrJVCnbDPmo56IXMn9up+vk9/hQrpRZmTEtvHt9VrCm+MafpjVeBRggZrWLiG+sxTB7ydyAe0/ZlAugUP3exBLmz0Kq5UaG6X7qFryfr/uU/2krucG6Mm6Rph3eW4Faq59juMMUpjScZ7No3uei93Iq/tc2esifMeC7jAN4dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=hn8cyO40; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7b153047b29so302606085a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 21:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1729571357; x=1730176157; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gQCeQESSGdnWu3CIfb5Og/6oYW/wkrRIWKBMInOCmnM=;
        b=hn8cyO403y7ZlsM20VX/SKSSP9metkcKN0nx6C2XiQu7CYjFUJ7qcVr+iN7CQE6/3p
         koJY/c46l7dkt4ew+SjtTl7hscKEgq8BONL6c2XNM/whvb3qqZX7p2mO/oxXECKd5NqT
         xBPB8oTHdOqTSlhuFAQp+MuTzbzaAebZ62a2ElF3Y8syLMD4LbotARpizj6IUMpGk0s1
         5C6aQQX2BEoU3FMyTB9jPySTclo1uvnRgRPoK7LASuzn1IjHfTiUdr3WkmDlQA319NQM
         lJxJ4xHnYiWpyxxV58km7t3i8ZupkwkMZ03WgXyv4W+CIyFizI2n8i/7LWTrAiAGoxy2
         S/mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729571357; x=1730176157;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gQCeQESSGdnWu3CIfb5Og/6oYW/wkrRIWKBMInOCmnM=;
        b=ADKx0T2PsRok5viQVXxI0NXIavEyzEw+n1JsDxnZ0mehzWjXT4H5wl8IL4GIBnnjaS
         +hWCD6LAV/tyL5bxgQLQ+a9h+lAHkOGiilx94O6FNU4l3qNrn6UJ8RiTwJ6yrmRx1Igv
         cwcsv5Uji/hxalFfv/Vre4H2NnHiEYxTwpSb1Ad9XLP7bjCtjrfrnyvf6D1M8XOmLp1x
         8sI9Vo1mDbkr8Dmdij9AjW6ZZCoOWW6JcAes9f45Lenm3NyhvyUrbHyDdLicNnZqVBTd
         Xc4g9ymtZmM6sdmROuzUqhJRjfjFIEw7Vi+mLvloPDc1BTAsnfQbyk4wcsyhW1A1YLeu
         c3Ew==
X-Gm-Message-State: AOJu0YyfRipQ1Xgmq/iq2OtbK7TaIRU0YYdgI7+mQ/tKiDKyo39iF/w4
	DMMuACwMCJbhHIikaviE8fNnPab1e3bGEmEo8m3Er+S0OVxgREPXPBbJYIcPJW8=
X-Google-Smtp-Source: AGHT+IG2vf84iHRnL7reLpo6EFw4xTQRM7dGVwb9R/9+8Iat8D/hAdv07jr8otPh32dSSQP0/CrWVQ==
X-Received: by 2002:a05:620a:2a0b:b0:7b1:11ea:1f62 with SMTP id af79cd13be357-7b157b40d94mr2036300785a.8.1729571357284;
        Mon, 21 Oct 2024 21:29:17 -0700 (PDT)
Received: from [192.168.0.189] (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b165a710a7sm242547785a.106.2024.10.21.21.29.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 21:29:16 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: x1e80100-crd: enable otg on usb
 ports
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>
References: <20241011231624.30628-1-jonathan@marek.ca>
 <20241011231624.30628-2-jonathan@marek.ca> <ZxZO6Prrm2ITUZMQ@linaro.org>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <8e7b99e0-2649-fa3d-4fbd-e027a65aff6a@marek.ca>
Date: Tue, 22 Oct 2024 00:25:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <ZxZO6Prrm2ITUZMQ@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/21/24 8:54 AM, Stephan Gerhold wrote:
> +Cc Abel and Johan
> 
> FYI, this landed in qcom for-next last week for CRD and T14s.
> 
> On Fri, Oct 11, 2024 at 07:16:22PM -0400, Jonathan Marek wrote:
>> The 3 USB ports on x1e80100-crd are OTG-capable, remove the dr_mode
>> override to enable OTG.
>>
>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> 
> This is a bit problematic, because dr_mode = "otg" seems to imply
> gadget/peripheral mode by default and we are currently unable to detect
> the role at runtime until the ADSP is started. Being in peripheral mode
> by default will break USB installers; they won't be able find the rootfs
> via USB. Unfortunately, they wouldn't be able to detect it once in the
> rootfs either, because usually you first need to copy the ADSP firmware
> from Windows (at least on the laptops).
> 
> I think the best quick fix would be to set
> 
> 	role-switch-default-mode = "host";
> 

I have no objection to this but its a hack to workaround qcom's broken 
design and perhaps should include a comment along those lines. The 
situation is also the same on anything sm8350 and newer.

FYI upstream doesn't support a rootfs on USB because loading a new ADSP 
firmware breaks it (cuts off vbus for a moment I guess), but I guess 
that doesn't apply to the USB installer case. (maybe the people making 
these USB installers should just have to carry a patch with this?)

> for now to restore the old behavior in initrd, while still allowing to
> switch to peripheral mode once detected by the ADSP later.
> 
> It would be nice to have gadget mode in initrd as well, since e.g.
> postmarketOS needs that to set up the USB debug shell. But I'm not sure
> how we could support that:
> 
>   - We could designate some of the ports as "peripheral by default" and
>     some as "host by default". E.g. usb_1_ss0 is also used for EDL and
>     Fastboot on CRD, so it's more likely to be used in peripheral mode.
>     But there still would be users confused about why they cannot plug in
>     their USB installer into one of the ports...
> 
>   - Long term, I wonder if there is any way we could reuse the reduced
>     ADSP firmware from UEFI for USB detection until we start the full one
>     later? Perhaps it provides a similar interface?

This is what I do (minus the "start the full one later" part), with a 
hack [1] to make the remoteproc driver skip loading any firmware and 
trying to boot the DSP. The UEFI-loaded ADSP firmware has the same 
charging/usb functionality as the full ADSP firmware.

[1] 
https://github.com/flto/linux/commit/36921742d28b55dc02d8e5a8d6598e567e7874ab

