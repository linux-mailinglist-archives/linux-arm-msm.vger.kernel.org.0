Return-Path: <linux-arm-msm+bounces-105202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENufH6/88WmElwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 14:42:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1939B494321
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 14:42:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EC532301487E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 12:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C7863F7A84;
	Wed, 29 Apr 2026 12:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hYSUqybE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B093F7860
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 12:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777466537; cv=none; b=d7VDpA6Gn2k54xlbDWIz2CyGhJv/EqjGuyDfA8PhIvi+lAmIA3VQltsL5amUP4yQ/dE4fgPnG4r3h2bAZXLFvLtrmn4T5ML/VFUn3Ueon38luOe02JWZ9703JYkDVEDSNxZGCi+nC9NiDW6fTlrzKD1wPfr4Exuehhs/XHXA1ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777466537; c=relaxed/simple;
	bh=1A2EDd/9ZFXW9B7wngZDMLHdvoHs8PLDGHjr5zxPytA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e0+e7im0r4YFmAud0vGR7JTmAeiaJz1LlZE2ZOffFmmBVog1TcKVQE8Ud1MT3N2gALpp5aClKoXQGyQrZROaKLii+ANrQyhgTh2bRkIUVw5KNQwgBApPqYUY0jnVLqchOMAKiuP9Pm5TGU0xJZXIsSWGcQkUS7t7Oq8x8DEGtcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hYSUqybE; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4486b5fcf3cso289672f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 05:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777466534; x=1778071334; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tEWUzkm/84gIEBZKZ1aGJfvpThsAR0MsD57R0RvbGsU=;
        b=hYSUqybEY414WCwF1ESX/JoRG/Ee+hysZc4svXr4q/NK1gS/DDqOE6UZG6dfOW9FGF
         Xw7oasUBQQyRkiDdTzzTzy26cKjBGYZjoe7FWxLHZWeR7fToCZpehlBAALEUAAO+yXKE
         UHe6LU7Gvh/Qz/8sUFfTKL2CIfQyA2GH5rEX6fgVsSPi9aj8dUjuAnzuqemDKBtC4JWF
         LfyN6YyUWpyctIqyqnneMgpw0Q/9nuqYWlmYQxSD0BILHXnMV6cQTcLdA3yIx0Yev67H
         A13wyX6NaneRygAWvHK59SkPUVA9PdD2i9J1VuWvxmkZnLGb1bV4Nt1Oeok/RJD9AQBc
         9NlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777466534; x=1778071334;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tEWUzkm/84gIEBZKZ1aGJfvpThsAR0MsD57R0RvbGsU=;
        b=LJa376IBiCOKmxhcQW6BDfX1epX1v576v9/pwDCrTyMBJz42a3HbKzpfmhGtA6Ypfc
         AS+QVqynUCC+KUTV0rMHm9q+/6F0bCtk0mdgwCudIIgqXWZZawBQLzv87fe4HHqF7A6F
         QUagp7E2ahMny665sNl5/+Z29kJLIordP8adu4S8gPdiju1BmvYIwtssb/3ZsITmBxYb
         Go+fREGYSCSas5p0MH01RDs7DvS/7wTNrEAjVpK7l094o7NqEyIo1M1PEkgv1OzDiQkb
         9vKB7TSi0eg0ULNVa2Mr/zvqZm8hRMuFBbUSL2hYvZYWLJRqnvsiVC4PGme42GuFaFXb
         OxlQ==
X-Forwarded-Encrypted: i=1; AFNElJ8g9nnMgl/yjN136ObCnmLTOQUeTUQXbN2tDS2NGfgGlGs/C/EfQ6OW8Qt4JX9Ofdf1jGOZqbRfQVEg10zO@vger.kernel.org
X-Gm-Message-State: AOJu0YyXyKCacl/9DFlZBZsKomPRSH1RHKWDyWoi8LB1qgNawuPO8XmC
	Nnj/0Ys+wVXE0/Icp1D0MbwGxyriF1pINRqJj1VDd6NtB4cSJVVxMLsX
X-Gm-Gg: AeBDieuq52JnVWC5dM2ep2v7PqaVW2GZyEfmCcIktb5jyM43euFEt6ZkbK2JguaO0xI
	K/cv47otLzWY+3Hk67b5zpzSAUlQTeI98jtM6OlkwOvTOmIDqngJwWFue9LRyBxqCTTuG+rLOuT
	l2lI8xv8TDc4lPgECs6gqAxtZuwSobsA51miqZD55ekqdfypmDbrLL67G/ES0nm18o1MtIKZwuB
	ZxGeUMiCTembBS5UYG74vB+pUyGFq+IZkjZLXp7X8N2ZUVOzXZe7uNMc/2pOFlBQNkq7U6p8LLP
	Ak7uSydzfV3ZR074vUqsDj3gpF6APfEgIua84/Lt1zc2dxD42EE7lPUbKUWZzhw+DGZc12ZcVtS
	Im2fyqSU+RflrSAWjgVKSi7nRG67Iev3hp2ipYru+sDCi9go2ABUIyufIIrDsQqkG41a23CFK8U
	DAHQlJaKBNz57YyEijNxSskZBuKlWZXygTJSPh0oyMAK+c77agIIxTwef06TSIcI7eiyVcMV/FY
	Q==
X-Received: by 2002:a05:600c:a11:b0:489:1a3a:9e45 with SMTP id 5b1f17b1804b1-48a77b1b405mr123401375e9.26.1777466533338;
        Wed, 29 Apr 2026 05:42:13 -0700 (PDT)
Received: from ?IPV6:2a00:f502:160:68fe:a26c:adcb:8da8:2? ([2a00:f502:160:68fe:a26c:adcb:8da8:2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c31fb8asm17976745e9.30.2026.04.29.05.42.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 05:42:12 -0700 (PDT)
Message-ID: <89f2b7ab-2335-4029-a074-4d9bf956c14f@gmail.com>
Date: Wed, 29 Apr 2026 15:42:10 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 04/11] arm64: dts: qcom: msm8939: Add venus node
To: Bryan O'Donoghue <bod@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
References: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
 <Xfiq_WNTU9P-ThZLMs4plWE5hwtmwyVyKJc1bD5BKdhERGouucNpyuenIoKQiKfZKaRzP-PdamsNlQ8vezjrRg==@protonmail.internalid>
 <20260427-msm8939-venus-rfc-v3-4-288195bb7917@gmail.com>
 <56d609dd-62be-47eb-8ba3-c5d70d773113@kernel.org>
 <QRkqY_zK7EC4e0ZMoLVyLUhgI9A5RrBcJLm22d69xKT17HzJMXsEDdz_qodBN9qogvuS1XqN4zdemqcoByY5CA==@protonmail.internalid>
 <34627be5-75cc-469b-af23-f1f08ce29820@gmail.com>
 <2846fc60-bf8c-43b3-ae64-58faad6aed2f@kernel.org>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <2846fc60-bf8c-43b3-ae64-58faad6aed2f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1939B494321
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105202-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,pastebin.com:url]



On 4/28/26 4:36 PM, Bryan O'Donoghue wrote:
> On 28/04/2026 10:47, Erikas Bitovtas wrote:
>>
>>
>> On 4/28/26 10:10 AM, Bryan O'Donoghue wrote:
>>> On 27/04/2026 18:58, Erikas Bitovtas wrote:
>>>> +            video-decoder {
>>>> +                compatible = "venus-decoder";
>>>> +                clocks = <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
>>>> +                     <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
>>>> +                clock-names = "core0", "core1";
>>>> +                power-domains = <&gcc VENUS_CORE0_GDSC>,
>>>> +                        <&gcc VENUS_CORE1_GDSC>;
>>>> +                power-domain-names = "core0", "core1";
>>>> +            };
>>>> +
>>>> +            video-encoder {
>>>> +                compatible = "venus-encoder";
>>>> +                clocks = <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
>>>> +                     <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
>>>> +                clock-names = "core0", "core1";
>>>> +                power-domains = <&gcc VENUS_CORE0_GDSC>,
>>>> +                        <&gcc VENUS_CORE1_GDSC>;
>>>> +                power-domain-names = "core0", "core1";
>>>> +            };
>>>
>>> So to be fair in this case you do have a reason to have an encoder and
>>> decoder compatible here _but_ it should be the case that one one of the
>>> sub-devices contains CORE0 related stuff and the other CORE1 related
>>> stuff.
>>>
>>> Because in that case the sub-devices actually represent individual
>>> hardware settings.
>>>
>>> So listing power-domains and clocks for both cores in each node like
>>> this militates against that.
>>>
>>> The other thing is to double check of the encoder and decoder are inter-
>>> changable here i.e. can either core be encoder or decoder or is it
>>> fixed ?
>>>
>>> I believe on older generations - perhaps not on 8939 it is not
>>> interchangable.
>>>
>> I found this in LA.BR.1.2.9.1_rb1.5:
>> https://github.com/msm8916-mainline/linux-downstream/blob/
>> b20608408caff817ec874f325127b07609fbaeb8/arch/arm/boot/dts/qcom/
>> msm8939-common.dtsi#L1589
>> Only decoder bits are being set in bus configs. This suggests that the
>> cores are not interchangeable.
>> Then again, I never managed to get encoding working on MSM8939. Testing
>> it with
>> gst-launch-1.0 videotestsrc ! videoconvert ! v4l2vp8enc ! queue !
>> v4l2vp8dec ! xvimagesink
>> Fails with the following log: https://pastebin.com/nmZcLgPV
>> And in dmesg it reports a firmware error:
>> [  784.461031] qcom-venus 1d00000.video-codec: no valid instance(pkt
>> session_id:dead, pkt:21001)
>> [  784.461126] qcom-venus-decoder 1d00000.video-codec:video-decoder:
>> dec: event session error 0
>> [  784.461200] qcom-venus-encoder 1d00000.video-codec:video-encoder:
>> enc: event session error 0
>> [  784.468799] qcom-venus 1d00000.video-codec: SFR message from FW:
>> QC_IMAGE_VERSION_STRING=VIDEO.VE.1.8-00099, Err_Fatal -
>> Z:\b\venus\utils\src\vbuffer.c:1319:
>> [  785.791641] qcom-venus 1d00000.video-codec: System error has
>> occurred, recovery failed to init HFI
>> [  787.018339] qcom-venus 1d00000.video-codec: System error has
>> occurred, recovery failed to init HFI
>> [  787.097253] qcom-venus 1d00000.video-codec: system error has occurred
>> (recovered)
>> This happens regardless of whether I enable the cores for encoding too
>> or not. The same errors were happening on MSM8916 as well. So I can't
>> tell if these cores are interchangeable just by testing.
> 
> Right so if you swap around the definition of which core is encoder and
> which decoder do you get the same or different result ?
> 
If I set the core0 to be decoder, only HEVC decoding works. If I set
core1, only non-HEVC decoding works. Encoding doesn't work regardless.>
i.e. is it because you are trying to get encoder running generally or
> because of the core you are doing it on ?
> 
> How about declaring both cores a decoder ?
> 
That is what I did on v1. Ideally we'd decide which core we want to
power up based on what codec we are dealing with, but given there is no
easy way to do so on mainline yet, it could work.> ---
> bod


