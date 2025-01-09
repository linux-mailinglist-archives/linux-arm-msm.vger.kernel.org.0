Return-Path: <linux-arm-msm+bounces-44588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F06A07848
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 14:57:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2E4D1889F7C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 13:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83DE7219A73;
	Thu,  9 Jan 2025 13:57:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-gw02.astralinux.ru (mail-gw02.astralinux.ru [195.16.41.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3585218AA8;
	Thu,  9 Jan 2025 13:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.16.41.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736431055; cv=none; b=Erc8ebiY24ZqpU9wJbTJSK24mWK0PxMzILujJZtgLPxqAH1/LX9aYjvV7q7IHO5yIKX2xNc1Zb9XTS+k2IOpan3uoH8zUTzQDwZxAQU+bpkzEVQ22xcFGN8z4pDKbwBkUO+pxMiwTjGomPTVvBQO3U1Gwc8Uyq486brO4j9Vpxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736431055; c=relaxed/simple;
	bh=HAUYd8pPujz+OlTfEwxAXmywyIPMxeAgRfO0VfUlgh4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=khq0KrAk6jDu7naP5e/CMtcFzzB3YCjLhuBgIRX6rEFCqGe7SOg/EeAdLB2aRrAXDxQdJ5KPSSabjTRoUgRpObz1xtUxBYXj/8CbWQ0gUNajlIubLrSVdhpJUz8iP+O1KfoMnTfQDyFcPWonxH00M4zAE3inZf5XHIUynrY6rR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=astralinux.ru; spf=pass smtp.mailfrom=astralinux.ru; arc=none smtp.client-ip=195.16.41.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=astralinux.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=astralinux.ru
Received: from gca-msk-a-srv-ksmg01.astralinux.ru (localhost [127.0.0.1])
	by mail-gw02.astralinux.ru (Postfix) with ESMTP id 106F31F9F9;
	Thu,  9 Jan 2025 16:57:26 +0300 (MSK)
Received: from new-mail.astralinux.ru (gca-yc-ruca-srv-mail05.astralinux.ru [10.177.185.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-gw02.astralinux.ru (Postfix) with ESMTPS;
	Thu,  9 Jan 2025 16:57:24 +0300 (MSK)
Received: from [10.198.51.250] (unknown [10.198.51.250])
	by new-mail.astralinux.ru (Postfix) with ESMTPA id 4YTRDd5vYBz1c0sD;
	Thu,  9 Jan 2025 16:57:21 +0300 (MSK)
Message-ID: <a90660d8-1f1b-4497-a470-03ae00272ee7@astralinux.ru>
Date: Thu, 9 Jan 2025 16:57:20 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: clk-rpmh: add explicit casting in
 clk_rpmh_bcm_recalc_rate
Content-Language: ru
To: Fedor Pchelkin <pchelkin@ispras.ru>
Cc: Bjorn Andersson <andersson@kernel.org>, lvc-project@linuxtesting.org,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 David Dai <daidavid1@codeaurora.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-clk@vger.kernel.org
References: <20250109105211.29340-1-abelova@astralinux.ru>
 <qd6shnygj7mzyeq6h7z5gbhxvpzm4omtcl2usui7jeywow7spf@ggq6w7xcbvik>
From: Anastasia Belova <abelova@astralinux.ru>
In-Reply-To: <qd6shnygj7mzyeq6h7z5gbhxvpzm4omtcl2usui7jeywow7spf@ggq6w7xcbvik>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-KSMG-AntiPhishing: NotDetected, bases: 2025/01/09 12:26:00
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Envelope-From: abelova@astralinux.ru
X-KSMG-AntiSpam-Info: LuaCore: 49 0.3.49 28b3b64a43732373258a371bd1554adb2caa23cb, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, new-mail.astralinux.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;lore.kernel.org:7.1.1;astralinux.ru:7.1.1, FromAlignment: s
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 190234 [Jan 09 2025]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.0.7854, bases: 2025/01/09 12:21:00 #26963033
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected, bases: 2025/01/09 12:26:00
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 1

Right, I'm sorry to bother you


On 1/9/25 3:31 PM, Fedor Pchelkin wrote:
> On Thu, 09. Jan 13:52, Anastasia Belova wrote:
>> The result of multiplication of aggr_state and unit fields (rate
>> value) may not fit u32 type. Add explicit casting to a larger
>> type to prevent overflow.
>>
>> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>>
>> Fixes: 04053f4d23a4 ("clk: qcom: clk-rpmh: Add IPA clock support")
>> Cc: stable@vger.kernel.org # v5.4+
>> Signed-off-by: Anastasia Belova <abelova@astralinux.ru>
>> ---
> Already applied here [1], no?
>
> [1]: https://lore.kernel.org/lkml/173525273254.1449028.13893672295374918386.b4-ty@kernel.org/
>
>>   drivers/clk/qcom/clk-rpmh.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
>> index eefc322ce367..e6c33010cfbf 100644
>> --- a/drivers/clk/qcom/clk-rpmh.c
>> +++ b/drivers/clk/qcom/clk-rpmh.c
>> @@ -329,7 +329,7 @@ static unsigned long clk_rpmh_bcm_recalc_rate(struct clk_hw *hw,
>>   {
>>   	struct clk_rpmh *c = to_clk_rpmh(hw);
>>   
>> -	return c->aggr_state * c->unit;
>> +	return (unsigned long)c->aggr_state * c->unit;
>>   }
>>   
>>   static const struct clk_ops clk_rpmh_bcm_ops = {
>> -- 
>> 2.43.0

