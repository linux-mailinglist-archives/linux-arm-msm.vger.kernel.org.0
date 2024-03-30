Return-Path: <linux-arm-msm+bounces-15851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE26892D95
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Mar 2024 23:04:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 181A9282A7C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Mar 2024 22:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF6CB4AEF8;
	Sat, 30 Mar 2024 22:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="buDtfqkv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740A342AAB
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Mar 2024 22:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711836289; cv=none; b=WuLazYBXFshdfCYRIe4cKq+YdfnEzESgh+0PYMZ6bVCIqZ6YlpscaYvpCegAK1EAy6ZzJC4NMLvwK4hMLvMWnTLcaYlhL9EsK8/qh0pDaarGrh2fSC+CEYmABWFgwCAo1Phuf8VWZ19vrbZxTqFXOy5+WLNlUjQnQEzvvmAjlzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711836289; c=relaxed/simple;
	bh=PVVuSm2i/BrAi3YIHH//s+w5qN2c55N1o8exyPZvdcs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rXxJ8ehiIYQuPPVOoWlRmKCBNgGKmpf3LZTAVNmG5JfZGIa5jUle/+kteleEus7vNFQ+14NUcQwfE0pLSmp9Gidq+C+h0z+kbFbfUZaddK0TWZVh6YZMLog+b1af/mY7NleL9z29xg7qzt121bBfv491q8wQoES3suBLIOk9CWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=buDtfqkv; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4154464f150so15049205e9.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Mar 2024 15:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1711836286; x=1712441086; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SGCYWWp9GMIyWYRiLUIkswqhBEjJW45xVVdYqohDnyQ=;
        b=buDtfqkvqBxlLnqS65zqJ/cACtrKMeM9fj5jx5lMWTOMOcuIYa0nfXs2Z+dl71xqT2
         oR1oCdo2BGufKALhmivXoJzSHgFcROcJPMM6+L0YPnNOHmlUzb9e9OENal6o2lfc1gC4
         Jm1fVicJtjJCR4SPRJZnnZH6ndOzeX8WjMWzWh+FKCZOdkFTy9awAAYUySDQWy1sGGw6
         E1Ry+70LUA/XxJropwgjZ+yoazuCAPGNRhhfBJ/XZgHdgqoedABv9ts0SkcJJ+v+dwDa
         LJrHmLFtCIhUUcP8mX1tKu4AeS+KZSNi9P9OhpIM/sBgzUYy0IdUA18MXyoCVhVEEGh/
         Mpzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711836286; x=1712441086;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SGCYWWp9GMIyWYRiLUIkswqhBEjJW45xVVdYqohDnyQ=;
        b=foDsriaQmEpzdp/oSx4jVDNFRAF406FoRCscLCFEWcMI+HSg+S6drfawNPT7J8Aco8
         6Ps7pzbWSwZsgNKl02777ATHVtg/+2DX28MwfjNR9mJbZ4jMpruq0k0D2WD06LlKToCF
         znbd5fitcH/NlOoCeNywoyhvT+ZwYnRNU4+8GcdEEEoG59y7ITvPux56NfnBb8z5uCGu
         Tr8Q6fOXNNNBquKwDM67OmANzgvLqfq5OmoiSeMQwBeWo869ZRouOfyPx1rb83Ug/Zj/
         aFLIcMFckQPspGDcUPKeqV8C30e24CLi+E7r/mJMmC8DOKTqZWu/70xLXaBCXIwNxGBI
         vkyw==
X-Forwarded-Encrypted: i=1; AJvYcCU/egECZ2poO602iPMEnvg1cbTu614Id95jmd5g0Bt0ZE73URcqE5HL1e2XrsZekfS5eQTqPeF/VP5tOUD/4Wbbh7whbBeoYRCF0r6YgA==
X-Gm-Message-State: AOJu0YwM+iMKjfGA3b0ujcoMp3GvA7a8kUAGeL8+BlEyAoH+Jw/DnMgq
	xFW0f8G/t+miqtCajn5Gh4NWdIz1y3s2C3JpaLCkeIH7HCTejRmrn/YT7yD8dGM=
X-Google-Smtp-Source: AGHT+IHQblUi6EhvJVc2vxBWhRa0CSocPGwpe4Y/225yNjIZknidoGHYR6Qi/0vpH2PCTsPbf1WZ4Q==
X-Received: by 2002:a05:600c:3d99:b0:415:475c:2cb7 with SMTP id bi25-20020a05600c3d9900b00415475c2cb7mr6808179wmb.3.1711836285597;
        Sat, 30 Mar 2024 15:04:45 -0700 (PDT)
Received: from ?IPV6:2a02:8428:2a4:1a01:2b43:edfc:7d3f:4878? ([2a02:8428:2a4:1a01:2b43:edfc:7d3f:4878])
        by smtp.gmail.com with ESMTPSA id bp29-20020a5d5a9d000000b00341d28586afsm7512161wrb.2.2024.03.30.15.04.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Mar 2024 15:04:45 -0700 (PDT)
Message-ID: <ea18f91a-710a-4eac-903d-90928caa3090@freebox.fr>
Date: Sat, 30 Mar 2024 23:04:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: net: wireless: ath10k: add
 qcom,no-msa-ready-indicator prop
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>,
 ath10k <ath10k@lists.infradead.org>
Cc: wireless <linux-wireless@vger.kernel.org>, DT
 <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jami Kettunen <jamipkettunen@gmail.com>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
References: <fd26ce4a-a9f3-4ada-8d46-ed36fb2456ca@freebox.fr>
 <84f20fb5-5d48-419c-8eff-d7044afb81c0@freebox.fr>
 <72c162cc-45e0-48b6-8d90-d59fac299375@linaro.org>
 <6bd3db0f-2e18-4ad1-abc2-f59c6acc8037@linaro.org>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <6bd3db0f-2e18-4ad1-abc2-f59c6acc8037@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/03/2024 19:23, Krzysztof Kozlowski wrote:

> On 30/03/2024 19:20, Krzysztof Kozlowski wrote:
> 
>> On 28/03/2024 18:36, Marc Gonzalez wrote:
>> 
>>> The ath10k driver waits for an "MSA_READY" indicator
>>> to complete initialization. If the indicator is not
>>> received, then the device remains unusable.
>>>
>>> cf. ath10k_qmi_driver_event_work()
>>>
>>> Several msm8998-based devices are affected by this issue.
>>> Oddly, it seems safe to NOT wait for the indicator, and
>>> proceed immediately when QMI_EVENT_SERVER_ARRIVE.
>>
>> This is v2, so where is the changelog?
> 
> Expecting reviewer to dig previous discussions will not help your case.
> It helps reviewers if you provide necessary information, like resolution
> of previous discussion in the changelog.
> 
> I dig the previous discussion, since you did not mention it here, and it
> seems you entirely ignored its outcome. That's not a DT property.
> 
> NAK, sorry. Please go back to v1 and read the comments you got there.

My apologies for omitting the changelog.

And I don't blame you for missing the thread's resolution,
since I made a bit of a mess of it with my various messages.

The firmware-5.bin approach was deemed DOA since these files
are parsed too late with respect to the required work-around.
Thus, we went back to either DT or a to-be-written system used
in the vendor driver.

Jeff Johnson (one of the maintainers) concluded with:
"But I'm OK with the DT option as well. Kalle?"

Thus, I spun v2 to get Kalle's Ack, and more crucially to give
a heads-up to the msm8998 users my patch would impact.

Regards


