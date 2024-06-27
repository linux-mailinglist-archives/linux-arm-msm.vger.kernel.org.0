Return-Path: <linux-arm-msm+bounces-24516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B23AC91AD05
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 18:42:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F2BD1F26C6E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 16:42:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6ABB19539F;
	Thu, 27 Jun 2024 16:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="N4eaGq5R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFA21993B1
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 16:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719506521; cv=none; b=HScjz0nhu2mRSz7v7qHOq8iE5dzj74A9l3Uc42O99gmc56cjHVueIDOHJU5CDdfiqr2rMRnGNmZw/K9EuPJHiE2RW5vGxZ4BwDdVHyRkX9EYaO+FdO8UgeJlrNk3L2nTNz2LL9rcfFgn6T/uiQFCtfK9C8DcnRuMPEBFVggFlYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719506521; c=relaxed/simple;
	bh=7rvwN+5JAyIiGWGIyml+PLmYwXOYSMAVm9NJrmFCrDA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=BAWNemlxfgNHFOO7iRVrC7EzwjLQcf6wvh0CTtQMVEybSJK/am67lpMdtYRVseLGfIZUR15mCILToFuwWvelHF2fcm27lVSlG5rC/P0zWIyQ/lCDmvX4YwxwKcnI+mlqEvU51oT5bmEa7+TyStaoLvEFVGo6YUDZ37qLKz5UCis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=N4eaGq5R; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4248ea53493so36358465e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 09:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1719506518; x=1720111318; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eCkEwjsDLm0XGJB8xms/SKimkP02Q1zp6ZqAPKni7Cs=;
        b=N4eaGq5Ra0q7A4BUtRwRjkWuTyTBW81Bpnh68jZiQkLRodtcv50uDEuh7yGW1jy/e4
         Q2//3vDt2xyI2aDhWbKgHeay7tUnLhmGpgsf3elEd7F7ddherbgBbh9IT0cYU/f1YvKK
         YEpjEJrTstZ+4mkQGcn1Kv7Y2vIrgk3yvc6PcNMxaH7Vel1dVWjcpCBh2SrejZqi0btY
         o54UIfzf9FMEAHGwaTVMbGhAZranJ0N1yw37CDM7LTu+yOFTpJhEGVgA6x2faeXwzAz7
         hwFrcwDoSzlQUDH+VXDMy2IR/O8nCVmnqdTcvEnMOTgT2StPGdbnJb/MccRD1f2RsY3n
         W6TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719506518; x=1720111318;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eCkEwjsDLm0XGJB8xms/SKimkP02Q1zp6ZqAPKni7Cs=;
        b=oO5EjZeyq0hRa153uiW5RuN2+jxSxRd5XjzXp49hVNxeiqtoDifJIdG/ODaAx81dgB
         LdmttkEIH+nTVAovLJVkuGCujgMM+tYX+QtKAa5Ka2UEdC/IaFn9hYyp2n6z6bvFeq73
         sSTpWkQ0UVHZ4pa8ojWXBrNCg+0z6jLs/v5FrnIAnMRJLN3ZwZL2IqLJ7tInMSO9aonk
         B9wd20WjZV85MJjrqjXSLa8eFjwq8iC2zLLDm2gAQBExWS6ShCYDkAd1iAIYQQs9DSDi
         OX9bvxmrL3r2EH+w97VcrprHsf0W3r5bqJB2TjJtRpexUhqaaaYq7fLAtefYZGev+b5T
         TAtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvDgs3KZvrldfuWrDLrnbnbTooEk397QV+avtoAMYqpWtPnyuJo2SNqP6e9XjVSHLNvywNUAxs7iSxaw84AUyz7MDgsKOceocj0gTomg==
X-Gm-Message-State: AOJu0Yz48E7GbRB20xVu00s+wewNTxVWKiYLy723MZKzDvINKCkYJkWT
	vWuPkZF1FLn7QTm+F18gbPvHTJZfcdZ1NCQ/tUkx0D8TUy0FZwKhvzLLsz0uedY=
X-Google-Smtp-Source: AGHT+IFoughng9rudyhYvDZWWiOJXK0eg6Kt8g3iwAfz2BbedZzxIyaBmb2c2QaepjOkaw4EpuxaLA==
X-Received: by 2002:a05:600c:2e04:b0:424:ae0c:6587 with SMTP id 5b1f17b1804b1-424ae0c65efmr41006865e9.14.1719506517953;
        Thu, 27 Jun 2024 09:41:57 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c84245f0sm76109465e9.33.2024.06.27.09.41.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 09:41:57 -0700 (PDT)
Message-ID: <e34ee0f2-8bc0-453b-8869-e261ffb83e68@freebox.fr>
Date: Thu, 27 Jun 2024 18:41:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] Add support for qcom msm8998-venus (HW vdec /
 venc)
From: Marc Gonzalez <mgonzalez@freebox.fr>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
Cc: linux-media <linux-media@vger.kernel.org>,
 MSM <linux-arm-msm@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>
References: <8b2705b7-f33c-4ebe-a6a8-c5ef776fe9ad@freebox.fr>
 <abfedc39-43d6-4ab0-b7b2-de68371d5d28@freebox.fr>
Content-Language: en-US
In-Reply-To: <abfedc39-43d6-4ab0-b7b2-de68371d5d28@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,

It is still unclear to me exactly who is expected to merge patches 1 and 2.

In patchwork, patch 2 is marked as "Delegated to: Stanimir Varbanov"

https://patchwork.linuxtv.org/project/linux-media/patch/eb15a48b-6185-42dd-92ca-8df33b0ea4b5@freebox.fr/

Stanimir are you supposed to Ack? Review? Merge? None of the above?

Regards


On 17/06/2024 15:36, Marc Gonzalez wrote:

> Hello Mauro,
> 
> Can you merge patches 1 & 2 in time for 6.11 ?
> 
> Regards
> 
> 
> On 04/06/2024 18:41, Marc Gonzalez wrote:
> 
>> Changes in v5
>> - Collect latest Acks (from Vikash)
>> - Resend to Mauro
>>
>> Marc Gonzalez (1):
>>   dt-bindings: media: add qcom,msm8998-venus
>>
>> Pierre-Hugues Husson (2):
>>   arm64: dts: qcom: msm8998: add venus node
>>   media: venus: add msm8998 support
>>
>>  Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml |  4 ++-
>>  arch/arm64/boot/dts/qcom/msm8998.dtsi                           | 48 +++++++++++++++++++++++++++++
>>  drivers/media/platform/qcom/venus/core.c                        | 39 +++++++++++++++++++++++
>>  3 files changed, 90 insertions(+), 1 deletion(-)


