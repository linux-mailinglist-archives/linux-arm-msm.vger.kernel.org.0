Return-Path: <linux-arm-msm+bounces-12146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C50F85F457
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 10:28:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E06A1C211F7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 09:28:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E23CD374CF;
	Thu, 22 Feb 2024 09:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YfHdWlla"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F09017BA5
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 09:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708594104; cv=none; b=qNeQ9tSWNZsy5CYbiu39Ft9pfMmqMgdgzXGN1bCXlOd2OW93iPoIYtCTpqpa4IBlBdn131SNg+q/GnXP6hWixd5qHF/L0iSTyV3sgedrv16qqkMzyYDKKITQw3O1hOvJUfJ0m28DpblEASHWJ4PRZt3+Uh6DV6jw2d9wqwugpvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708594104; c=relaxed/simple;
	bh=/jB8xKzooqLDBQRRMv2U89IaFGgAJUReNNqxAOq8geE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZIqjKky+ph9Bk2+74FhyXGEhvN4nTbgRNqxEbMmFpZhM5r+uyoLEFCZtjDOcS+oaE7E3oRw9tMyLfAhX7UUhOLGGQRMnhB9/Kj/hDTKOY2GxwdlCjclMo2j8/dH9Pi5ev1d9+ktcaRZOY+bQV7yRum3fJJgNMpP+Dlv1sHnV7zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YfHdWlla; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d208be133bso84429461fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 01:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708594101; x=1709198901; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=afxYQISKwoDQxjr1GUcN5bUK+FSZJNALOlRyIMUtSrs=;
        b=YfHdWllas8Q5Gqw44hP+07N694c5ACr/a8VUqBF2vdyha3m5q7eIhFt89vseHucg5X
         6ifk5fSJFxNR4G3BLugT4lChpmiEJcwUNZi73iWnkrXVl0um1xjxpGuSpXrY2YHbzA+Y
         /KYeDczdHewFwEAMULYep9U7GjhF8SFav+mIDu/gdzb8uedFwZ4iT+gwVcljSjMxJNvH
         ImwEao35KcyBFuTBoJPeJHqRIa4FlUM1N57/pb9mtP+9Kfw8/lkqeHbJPA9YBuMQMeEd
         uMdJoc5kudQSx1moDr0E7C/5Uwv1Zus4Dtzv1alZ9Gm58h7MUEt+q6uXaceDh04dFkOw
         vkiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708594101; x=1709198901;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=afxYQISKwoDQxjr1GUcN5bUK+FSZJNALOlRyIMUtSrs=;
        b=qTM5a0mAj+tFwGw+8SSKi3W40petovdGT8LUkv0uyegTCGKwn6nQNHT6LXdGQAznS/
         ca6BX5XIKFAdwOvbzTbpyP1KmwuuF8dlQ8iokSt8ufNsoeyhtPcNl0xFdMSRfRGTONC5
         mo1CqJiW61BuQPbzkcN2Ua8z79NLFf0qELnl3UQleDIwtV9q4kSLahFZegMQ63w+nMF8
         G7X4Ct3nfylzXZLzG44nGAHzcjETjwB5whrXys7J1HvqNynW2+f+EO5fD7gZAn1YlP0W
         CJeQBDE/BhqoGR+yrY0djdNxMMS+O9PbCz7zt3+0n6aMkub+lfki980toTjYjYJlxJoX
         svow==
X-Forwarded-Encrypted: i=1; AJvYcCXE1mbBazVox9WSpihYLY+1cvCwGQILxn1OyJ14BYnLBvvyj4N30pgG4IzuPGwZJnadvzgGAXk9158oNwXfjbb4ph6TsMEf6+t/DvkPKg==
X-Gm-Message-State: AOJu0YwRfvCwwNb3aaixCtErslCgy47Mq2rliCra7aqaxDB3MqKCUhaE
	lxolptXq6dQ+EW3nQLGgdrDllkIc2n+IriT4umP1VS0TXYBcYiJ6xaLY04FUEo8=
X-Google-Smtp-Source: AGHT+IFGHclsIGY09YVRHR/OaiuAmuqnwj+msdJgmr6dF0K5qvEVB4HdflgvI1iN1TebKlQSDUpGnQ==
X-Received: by 2002:a2e:9dd1:0:b0:2d2:3a18:aa11 with SMTP id x17-20020a2e9dd1000000b002d23a18aa11mr7488948ljj.39.1708594101469;
        Thu, 22 Feb 2024 01:28:21 -0800 (PST)
Received: from [87.246.222.6] (netpanel-87-246-222-6.pol.akademiki.lublin.pl. [87.246.222.6])
        by smtp.gmail.com with ESMTPSA id j5-20020a2e8505000000b002d2556a6e08sm590077lji.30.2024.02.22.01.28.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Feb 2024 01:28:21 -0800 (PST)
Message-ID: <8fcb5816-2d59-4e27-ba68-8e0ed6e7d839@linaro.org>
Date: Thu, 22 Feb 2024 10:28:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] arm64: dts: qcom: sc7280: Enable MDP turbo mode
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <quic_bjorande@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 cros-qcom-dts-watchers@chromium.org, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20240221-rb3gen2-dp-connector-v1-0-dc0964ef7d96@quicinc.com>
 <20240221-rb3gen2-dp-connector-v1-3-dc0964ef7d96@quicinc.com>
 <CAA8EJpo=9vhM+5YzaFxUoYRuEWQyrMS8wLNPSF3K=bN5JwWyDw@mail.gmail.com>
 <8313a7c3-3ace-4dee-ad27-8f51a06cd58c@linaro.org>
 <CAA8EJpqFj5nf8d_=Uoup7qg+nQrxqQU-DHbL3uSP138m9AcXLw@mail.gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAA8EJpqFj5nf8d_=Uoup7qg+nQrxqQU-DHbL3uSP138m9AcXLw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/22/24 10:04, Dmitry Baryshkov wrote:
> On Thu, 22 Feb 2024 at 10:56, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>>
>>
>> On 2/22/24 00:41, Dmitry Baryshkov wrote:
>>> On Thu, 22 Feb 2024 at 01:19, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>>>>
>>>> The max frequency listed in the DPU opp-table is 506MHz, this is not
>>>> sufficient to drive a 4k@60 display, resulting in constant underrun.
>>>>
>>>> Add the missing MDP_CLK turbo frequency of 608MHz to the opp-table to
>>>> fix this.
>>>
>>> I think we might want to keep this disabled for ChromeOS devices. Doug?
>>
>> ChromeOS devices don't get a special SoC
> 
> But they have the sc7280-chrome-common.dtsi, which might contain a
> corresponding /delete-node/ .

What does that change? The clock rates are bound to the
SoC and the effective values are limited by link-frequencies
or the panel driver.

Konrad

