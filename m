Return-Path: <linux-arm-msm+bounces-35275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1429A72D8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 21:03:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2889A1C214F4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 19:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D7521FB3F8;
	Mon, 21 Oct 2024 19:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P+0liDSW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B3F1FB3F6;
	Mon, 21 Oct 2024 19:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729537387; cv=none; b=OzuS7q/lkYWj/J8UPcKMvdR/rDZhFUocn9N9TSoUVagNrfiTP8QX3/YeerztMcaAUn/pIyu2B6zT/xOKkQOQbCSg33upLb1ykk9TUcAii/CAlvMFKvpB5pvLsRAsEFQJyfZNVgu3z5BhFwRJcNklCYB3lJXQbCbri0dD08I6ys8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729537387; c=relaxed/simple;
	bh=vHC3/UHe8JImpp2npCqoOg9PwX18eDeQiBuWYyIulso=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c1hKQTFokdouk6juro2Oq6T7DcavWF6/CX+CiGv7a0Z0B09tnNp1agqJtHFF9OE/nPxK/xi/vhchTVyQFGla22lXmJBRHESLE5+ehmk87lpi+6JjztCf0pmcKOd9Al/+oj1Avn6x1Jus8Zs7sdHg6df2JKJOhGynA9giY4nj1rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P+0liDSW; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43169902057so24102805e9.0;
        Mon, 21 Oct 2024 12:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729537383; x=1730142183; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5AYyZebDpWob+iueDyC8gkIB3IrofLZfNi1uSmxyuEo=;
        b=P+0liDSW5IL7twFPv6SU6MPj98p8g5mLk14MfX70hA0fAYby6W6RRGB4wgOCBXHaqQ
         cstb6XzX1onuiAWeOedtcbix71vpWJz9ksOAY58tnhpZI0NlGO76UkooYKWktdHwoAj3
         qb+BqI2PCVy13zMY1/F4lT4nzpDnPylX8fFyofsV8EFlJdBpIC8qTX9kkerq7KuLnHPM
         z1eBq5BSuD3u6KvLc2HL5/LxOd0wfehlAvyijx+TI1qJiJ3BhYA1kgLsUIkpluHIrsGa
         irdAVGtVauezEjuHpDldP49eRheAwZuOzv44F9JLwAOzsMGKIZBLc4Q84jjKk/UqvE4t
         Ibqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729537383; x=1730142183;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5AYyZebDpWob+iueDyC8gkIB3IrofLZfNi1uSmxyuEo=;
        b=kWcqiaAOob/a0dYkSQ0IjyUcdwSxHNCFggAMzvYQAQZMLijTsBFEdJ3S4M1LTVuoms
         WayAuqocjp1qxU6GuLu7Jmhslc/ylLrzy+lsd0bX0HtJBsHMpZdzjXGqO15dJf2diPa5
         L8Fxd5gf+j+pp395xo+5esPGq8XxZ5QAuk1mZXPfDaxDN7EKeocLIVFB5qOfJNjmT3eh
         pvb/P2QQc8NV98hsWb6/fPLh1/uZm4sSALTvUr/7QWNWvZiNqBmKraLYrqiV7tqWwaVY
         oEHc+BCKLU7NyTtk1/TTqsiPq+YUVVbBf5MC9T+DWxMTD3x5DsmfGr0EAjoZEX8a85+l
         YmDw==
X-Forwarded-Encrypted: i=1; AJvYcCW8+zgFg8ZvS1q4zKXLbpKSomRpIrTLrECeIWlLhdoLjFQtlxPYW4Z0NBgFi5WIhk7H7m1tRvUS@vger.kernel.org, AJvYcCWdyfkdn10X5WVpgHFgbNWYte3cQFsUbX1TqqvWoso3Bd5ZTjL1aqJGeJ7e895KnZ3m5iU0681ZwtY=@vger.kernel.org, AJvYcCXLih6C1TKFZ4CY7Hl1qlVTX+w9zOj1kRGl3cVBm0s0dTrqRHALzgg7xclZUobKFqnuzSL+GshJkXlXgqAf@vger.kernel.org
X-Gm-Message-State: AOJu0YwI8yHWGsG//VNPiC8+5nztmSrFjY/FHrx1iMEba8yVno5mZmrr
	dOj4GHH0lni7k9rnJ4L3uVVBtK/0TFYpMX6OFupHorJtBFKcADZj
X-Google-Smtp-Source: AGHT+IE3/fafT4prxw4+ifxyAxu4ITdxOWe2+Dq5H3IEiDPYdexl4Xh54tOtnbEABx0gzDIqWoXDQQ==
X-Received: by 2002:a05:600c:500d:b0:431:5f1c:8352 with SMTP id 5b1f17b1804b1-4317b8d6613mr9601815e9.5.1729537382804;
        Mon, 21 Oct 2024 12:03:02 -0700 (PDT)
Received: from [192.168.20.170] (5D59A6C7.catv.pool.telekom.hu. [93.89.166.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f57fc17sm64788785e9.15.2024.10.21.12.03.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 12:03:02 -0700 (PDT)
Message-ID: <f2a1dcc6-247b-44fd-97ae-977f8b3c4d41@gmail.com>
Date: Mon, 21 Oct 2024 21:03:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: clk-alpha-pll: fix alpha mode configuration
To: Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20241021-fix-alpha-mode-config-v1-1-f32c254e02bc@gmail.com>
 <5f39a93197f02fa7ec0de897a7ce646d.sboyd@kernel.org>
Content-Language: hu
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <5f39a93197f02fa7ec0de897a7ce646d.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

2024. 10. 21. 20:14 keltezéssel, Stephen Boyd írta:
> Quoting Gabor Juhos (2024-10-21 10:32:48)
>> Commit c45ae598fc16 ("clk: qcom: support for alpha mode configuration")
>> added support for configuring alpha mode, but it seems that the feature
>> was never working in practice.
>>
> [...]
>>
>> Applying the 'alpha_en_mask' fixes the initial rate of the PLLs showed
>> in the table above. Since the 'alpha_mode_mask' is not used by any driver
>> currently, that part of the change causes no functional changes.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: c45ae598fc16 ("clk: qcom: support for alpha mode configuration")
>> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
>> ---
>> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
>> index f9105443d7dbb104e3cb091e59f43df25999f8b3..03cc7aa092480bfdd9eaa986d44f0545944b3b89 100644
>> --- a/drivers/clk/qcom/clk-alpha-pll.c
>> +++ b/drivers/clk/qcom/clk-alpha-pll.c
>> @@ -421,6 +421,8 @@ void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>>         mask |= config->pre_div_mask;
>>         mask |= config->post_div_mask;
>>         mask |= config->vco_mask;
>> +       mask |= config->alpha_en_mask;
>> +       mask |= config->alpha_mode_mask;
>>  
> 
> This is https://lore.kernel.org/all/20241019-qcs615-mm-clockcontroller-v1-1-4cfb96d779ae@quicinc.com/

Oops, indeed. Sorry, I should have noticed that.

-Gabor

