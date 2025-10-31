Return-Path: <linux-arm-msm+bounces-79833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C68C2413F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 10:18:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08AB8188AE8F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 09:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A97632E6A9;
	Fri, 31 Oct 2025 09:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QzaK0tDZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7ECF32E139
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 09:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761902039; cv=none; b=AfnxMHoBYCAke9TRqiDfdaKphIcfIMVQYDyMwrnLJeMVE6rFvYK6TI6Ae2ZIZrMuiqPhjq6TI1QZ8ru6R4LQchVRr2J56dY7hiUPm1MY6a4QGfY9tT3ib8XRNOgG8tMH5GRX2hFKu/CCWVrpC6vJSm4ICOxTgiUO2TGDZRq/Dvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761902039; c=relaxed/simple;
	bh=fj2dDXJl6zM/ibn9uNkORebDcvcFug5dDwO39m4oqs8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ixOWPqyb2JPzQXPAND8BeSZo6agrXB/0rXIDMLRu3EyCqh5993AzIqR9WYUoBa/MTbABkpM5oTpXYa1ifvR5xUNTs0QI2K0/g6olOwHlpqc2XdE8FQ8/9mnucCsSDeOamtHYAJv2cssj2MTr1dzVWcFczlAC7cDNtmAxdClGYVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QzaK0tDZ; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-77f67ba775aso2566976b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 02:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761902037; x=1762506837; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HnoarLXb19bER3fZtEiYJsJttG37WwsFkpglznqPRcw=;
        b=QzaK0tDZ9R7UyWlx+XTeW5zBd7wMRle/um0rDcDeXBQxwKItKXu4mdQ8Z93w44XXsi
         PtPXfC/umH85jY0fbq+nb6Xg1iMyiyuHJN1+XdYA1ukARv5yIqZ0x2Clnh+jaumerlsI
         emcDCjWayEuONvD6DlnPzMALOIKJ4FOasuE+lBEm4hnpd0UvpWLu9okFz5JUGkLHZo2C
         zjw6m5SrCDxIjFKdpZNhYyQGXdfa0PDUfXZ0NApJVwEHzzCyCED7sCq9vbR506ti3ZF5
         CNIysl1mX0Q1tPnFO5Mzjnv0fGjKhHy9zrNeGGml/8opDCRclmEtS9q8medBz0tpgak/
         nQuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761902037; x=1762506837;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HnoarLXb19bER3fZtEiYJsJttG37WwsFkpglznqPRcw=;
        b=BbOS+QXUUf0Ka+zI/gPgM80mrVxjI4tvLXw+ycggP7E26Yrw6kkQ2ZUfW7qqp9EBDE
         +2Tt22DHrM9V/tnswIuMbmXJYCNBvjcBFkR34WxwqJVQ/6TpCjf0pL3rVhEMY5P5HRxE
         oRJOFSJW171PvboZPJ6CTrTODr5yzgx59LXldxCzymM2eH6WU2KlwzEZA+Jt0Zj8sQY4
         C60tN6+kvIZYLspLlxWbuFNb1sqj5tHqjHnw4zwXhVS5c4rS5ERjEuN/ltf/UuG/ZizW
         Uh0K2lV+PIXSJEGVPHu/4HJIKTaaunffArU/zXtp+SWjnypg/6EJmgDq9vw2ERjF1+/K
         jUaQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1GqyBTalFK8N8Vny3ljqPrX7zn8oTEP80f0TFYs2PiDkI73cLseFR4mBtKtz6sRMOXEHx/iV5sdbP8HcR@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc6weMcchJGT1r4lnCYkwDsRTLGaZw9vVGhyhG3Xt1RlY+TiMI
	9vZHH0iZl7fBF+KzbRFv7dMGLoe0hI8sZpG7SbkMwSzcjLkkwsOAXphq
X-Gm-Gg: ASbGncsbw9v32WRMNG1KwnNwKluH92an30ixZl6GnCgSPcgiDim8q7WENf1utialK4p
	TZVsHzB5WUBSxsKdNtUmZKEo+qLeZOJXlAL/1YKVQLNKk9Rxr9lmQ4ZrYEArbDHxIioRJ6gjIec
	ArzOqcG4g6XiU1wGbpvFyfbsPSicJ/C85rXVlQVZlFgl9MhnJ571HQQ2rOn8FHruI+yvU7vnO9y
	Y+I/OASjPZDImUP4oKHJJqh5Sj+OifM8jzB4f23yT8VWLbqmxhijFjktrGWZ9DCncDO9rKcYxjT
	LMNkIb4I5B3Gm7sfb26W1r1/5/86QiXlg0oSarcLfhqNy3AHopJP2hvEMBzhgk8h829xjI/DJJG
	VH1V6RES9MotiiAte0fQoDilXDt/M6xp3J1Q1P6ac+RrCGnIZZ4z1qTiu/OrZJmQCS359i/v42E
	nl4b9HX0RHgF3MUlVsn7jwN7M=
X-Google-Smtp-Source: AGHT+IGjFs4oElSscRZoSOJ7pWJlm5l1cLItFpZRGYqZAztSPJKqy71nHip2TTG9mQU6ECqE+BjsaA==
X-Received: by 2002:a05:6a20:158a:b0:340:ecf3:5fcc with SMTP id adf61e73a8af0-348cc8e36bdmr3933450637.45.1761902037173;
        Fri, 31 Oct 2025 02:13:57 -0700 (PDT)
Received: from [172.17.49.162] ([103.218.174.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7d8d71690sm1487905b3a.19.2025.10.31.02.13.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 02:13:56 -0700 (PDT)
Message-ID: <a0a18b53-dc1c-4f60-8cee-4f6e5c6baa4c@gmail.com>
Date: Fri, 31 Oct 2025 14:43:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/1] arm64: dts: qcom: Add dual-channel LVDS support on
 QCS615 Talos EVK
To: Bjorn Andersson <andersson@kernel.org>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251028061636.724667-1-tessolveupstream@gmail.com>
 <sygckhfcazo56jpmuldhctu3jnf3unekl4ahh7n3yels63ntpg@3esgqmoewfuo>
Content-Language: en-US
From: Tessolve Upstream <tessolveupstream@gmail.com>
In-Reply-To: <sygckhfcazo56jpmuldhctu3jnf3unekl4ahh7n3yels63ntpg@3esgqmoewfuo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 29/10/25 21:13, Bjorn Andersson wrote:
> On Tue, Oct 28, 2025 at 11:46:35AM +0530, Sudarshan Shetty wrote:
>> Hi all,
>>
>> This patch introduces a new device tree for the QCS615 Talos EVK platform
> 
> "This patch"? There shouldn't be a need for a cover letter for a single
> patch, the patch commit message should describe itself; as any
> information in the cover-letter is lost in the mail archive when the
> patch is merged.
> 
> 
> Also, please transition to b4, per our internal guidelines.
> 
> Regards,
> Bjorn

Understood, will take care.
> 
>> with dual-channel LVDS display support.
>>
>> The new DTS file (`talos-evk-lvds.dts`) is based on the existing
>> `talos-evk.dts` and extends it to enable a dual-channel LVDS display
>> configuration using the TI SN65DSI84 DSI-to-LVDS bridge.
>>
>> In this setup:
>> - LVDS Channel A carries odd pixels.
>> - LVDS Channel B carries even pixels.
>>
>> This patch only adds the new DTS and corresponding Makefile entry.
>>
>> Thanks,
>> Sudarshan
>>
>> ---
>>
>> Sudarshan Shetty (1):
>>   arm64: dts: qcom: talos-evk: Add support for dual-channel LVDS panel
>>
>>  arch/arm64/boot/dts/qcom/Makefile           |   1 +
>>  arch/arm64/boot/dts/qcom/talos-evk-lvds.dts | 128 ++++++++++++++++++++
>>  2 files changed, 129 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-lvds.dts
>>
>> -- 
>> 2.34.1
>>


