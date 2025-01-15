Return-Path: <linux-arm-msm+bounces-45166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A9FA12D7C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 22:16:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED84B3A18E5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 21:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B39C1DA63D;
	Wed, 15 Jan 2025 21:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xb38a0/9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399C71D90C9
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 21:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736975760; cv=none; b=YOBpIW0RD0NrFnBNq5JneTWbd6SIjw89ulU8we/oPrvuRRs0ha1vDLHgq60SdJCLeWL1neivDcaBLGZ/N6s9TOGlkckPREmDBkFyTc069uXAvS+0dEVMWkq0CzM5lrMuyOMrKggHyHisYPTUFrSuazJ/IpmMItjlcct42BYeCok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736975760; c=relaxed/simple;
	bh=c1EHEtIvSKg1nO9ynw1fPAGcrInwQqbzLwczlhOWJ10=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DbQMfLrwqIyZ7ttni6GYApT8drxc0g8BoCk9p5ZHf+FV+WIIumqJ4RliiNIgWY6mywv4hBjh9eOdLypYMxDrC0zmuyoLlujcRJU7gFwJDx34c4ydbJC4J2VB7mjfaPXedAoY3/Qoj/AkHUowkpqhZsNBnHZMgNu/iX514xhF2dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xb38a0/9; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-303548a9332so225891fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 13:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736975756; x=1737580556; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gcgdZ+Z+L9lynDfLj3RvGBYMv/uGR2T2g5tCjxLiaYU=;
        b=xb38a0/9piC/FBpxetKW7F/3ApGVPGAUHLaQojihK7Sv/KC2pSfdj/ew1wRq+Y/mPT
         8AEKXSBtPKQP6jhAmdH3/VaNvm88nEZRKnP/hNl+ZKvw2hE+tYPbIfKi919yvT8mxFmA
         Z1okGdBEPuLgLPcugJivKeQeH4fvMODx8dKNDkm+dFxSfXNhI8DRL4QFEQHWern8+Euw
         9lyucEJGJTgBo0yKfG9BwohJMm0dd/UJvsch8wBLsMlcF1y2bHN14iLgVHvHMDPVGU5R
         jbLgkgVXjpcDkrewOGAEvhFZAaQe7oJmvDvSAjwgqvmj6t/48MJkexyo80QNzS1BTowS
         tbjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736975756; x=1737580556;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gcgdZ+Z+L9lynDfLj3RvGBYMv/uGR2T2g5tCjxLiaYU=;
        b=XlxMd5hq1ol03Xh0OtvZdBjJn2WeP7ORVIXG2+AyMSBMPUMWnQqKD0YbTw7f+rAOAY
         NtDAPz2IHSDhwWinW1MH4JInLYj6bccuN0xe2ULvS6U3LxRfmLFLJ181FxA8KA5+Q/sx
         qnqOhiTrt7vZ3t8CHLj8o17YcLmNDaV6r5FUEpgQmxex6EQ2y1DOej8IoDyI91asqosL
         ZP9BAyg1+ek0s461A0TGtPCZlifzXNamVpuAB735akBmok44cWf3PoeazOwUn4VakUT+
         7zBiGPAwJigzK6c487O28iDpKyUlbWA3VT7Bs2OF7/G6zc8Myecy9z/L05F+QocCvtNa
         6wlA==
X-Forwarded-Encrypted: i=1; AJvYcCUKXh5PndQqXwOi2s3yoXLis+ddgr8glidHyKFdofd73C1Fb2K8tkpYKvcdhh02qHLy+eGnG40EM5wh9aH6@vger.kernel.org
X-Gm-Message-State: AOJu0YzEF7Ir04O5imwSwiW5tAV7ro0ga1ofqRlXj1XkcT6OfTffzgM9
	kmiuZZtyFSr6VqUWLQkhiB8S7rj8pKo1v/CMcc0kpe9IUDzCcfmtFv7VqwRwjEA=
X-Gm-Gg: ASbGncvdOVyVudiX9LeCE61qu/BhDaQxdyVJGq8Gns5+6tMzbXuZ8oifO99j1GV5Jtv
	DzO4x8jriRzQktOQqRwA9Fg94X8bUNqnCCyAiXC5L00i0RYLGnZcETUshnxegL1wrgaN7OuQrGt
	xK2UlAn0Y/Haeo7CMFJHECOK5R1URR5P1ZU66A2CRMUS7qfi4bbSukhkDIxJU0ylzD306NA62u9
	HFXvBHCTeA0vElj5e+AZLP4lKeXF531mHgxGT3ywlxEhCoRU022xmisqQpQAg1r4z16ClVVaiGz
	3WzbH3Xsluer64wQyXE98KDDF4RVzVj5+Ic=
X-Google-Smtp-Source: AGHT+IGVizluabYaRtLiT2Wa+Zt6KCM3prN4UlCD3gfiXYvm8B9MdIQlKG9KCsexDXKhXSGVXnZ0VQ==
X-Received: by 2002:a05:651c:b29:b0:302:2bd8:2685 with SMTP id 38308e7fff4ca-305f45cb6c2mr35751601fa.8.1736975756277;
        Wed, 15 Jan 2025 13:15:56 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-305ff0ad0dcsm23041711fa.3.2025.01.15.13.15.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 13:15:54 -0800 (PST)
Message-ID: <f268a604-09ed-4150-9401-de82cc206ce7@linaro.org>
Date: Wed, 15 Jan 2025 23:15:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 05/16] media: qcom: camss: csiphy-3ph: Move CSIPHY
 variables to data field inside csiphy struct
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Laurentiu Tudor <tudor.laurentiu.oss@gmail.com>,
 Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, hverkuil@xs4all.nl
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20250108143733.2761200-1-quic_depengs@quicinc.com>
 <20250108143733.2761200-6-quic_depengs@quicinc.com>
 <79b3e4d6-becf-4bcd-91fa-768b4098d01d@gmail.com>
 <238411cd-1bcc-496a-9077-07bb6c4892ec@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <238411cd-1bcc-496a-9077-07bb6c4892ec@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/15/25 23:01, Bryan O'Donoghue wrote:
> On 15/01/2025 18:01, Laurentiu Tudor wrote:
>>> Reviewed-by: default avatarVladimir Zapolskiy
>>> <vladimir.zapolskiy@linaro.org>
>>
>> Nit: Something's not right with this tag.

Thank you for reporting. The original uncorrupted tag comes from this message:

https://lore.kernel.org/all/4fdf4f1c-fac0-4c85-8154-45f797c6acfd@linaro.org/

>> ---
>> Best Regards, Laurentiu
> 
> Doh.
> 
> @Hans could you possibly drop the "default avatar" when applying ?
> 

FWIW this particular problem has been fixed in v9, while the v9 series
itself should gain some time to be reviewed/tested.

--
Best wishes,
Vladimir

