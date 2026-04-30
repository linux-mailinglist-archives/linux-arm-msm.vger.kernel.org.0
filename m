Return-Path: <linux-arm-msm+bounces-105379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEfwIR9p82ky2QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 16:37:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFCE4A41D6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 16:37:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 889E7300D960
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 14:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AACE236C9C2;
	Thu, 30 Apr 2026 14:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DnRAFZC/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEC93FE65D
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 14:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777559836; cv=none; b=gZEEJsNUTMFTczobUfo+HwRJSdAKPA9NZ4HozroskyGBn92QG3i66J3HnJbXSAUue/etJV0t69VS6XImFotnSJxi4Sv9wpljwtYO1ZyLcKcelZEVELkwm7M0bVzx08GrrFEqF97oIa8prWUfnMJHAYdjaH7ucDQkYI6hQjpmRuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777559836; c=relaxed/simple;
	bh=cLHFBgxXuOylS+uWF5DnMm8BAeTBOO6WNqytWVj7o5k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hLrojdgI8BdTdi4WWWFOth/XiHADWswZKgXPwPCmKLWhkat4SsrlcogMEIjPC/vlzgWlHNCZ6BHune197KLG2c9oqWA2EsyZRmkX7rUTVmcOWDqgi/gAqg1VMgSV+B09KeHwiKyQoJPvIbf1VovYOXdloa/uOvz7k2NwStdAW+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DnRAFZC/; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2c156c4a9efso1856879eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 07:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777559834; x=1778164634; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Js6aId6FN2yQKqYUB83nxCTiWNe5/vath4m1QAYTxIA=;
        b=DnRAFZC/9tCIk+3nj+rSwWed1+ZLMHJElubbRUTsMc46lOPfQFaLSahQKju6TPC8uR
         ub6KxJaWjvZasaU7ODNxq0VGlmWP1LLsnP687H1/1yNxiLIwUn2TpVONfq42Ip/04KLH
         dQ/hsmBuCWfoLN+jhmAhkazdQO/PGMGEqgWL75J4DMa8kNdPA+yFtZ8w65PN1go+qkVv
         C6F+69XNBxN9XVR0kyBrK7lqZu8AD8FELHGk43EO6Fn2cPoZ8a6G6hEvwRGSNzD/5kHv
         v7I9zv2x6U2D8cgCrTzsGGpvWTxAizLVQ05+mYmtHauKUiGJ6O9IOZYyQIDhyCalKRGL
         M0XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777559834; x=1778164634;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Js6aId6FN2yQKqYUB83nxCTiWNe5/vath4m1QAYTxIA=;
        b=RL6qtpphK9yzrgL5YjKIYHbwTG3v6ErSFX2Nu9eGC0y1cfhZYjpON9HtYWpvu6ta3S
         Mr6SjKl57UcKVMv4Ch5PKS6USbxsV6rWNV/cTJH3l7Gh7olN2pHfVmjLrdRFM8/7aD+m
         cPYzSjsrRkY6y92GxcFypWCdo9MEj2B14G4/oHljYfvJPN4wxpqfV2LCDzBWU9L8vxNV
         60tcvgoEwnPxaE37yNPqxGBC1stSlBEhhGcSfwJofGHfDfBO6W/4byrt1himpw8hzJlh
         Fg8CUmRbnGhiW7I9qrewHPY2nIM1r26ahkkU7/XBbL2Bovulc2KFYq0nXsCsX3+hKvyL
         yPqA==
X-Forwarded-Encrypted: i=1; AFNElJ9bEdXSwz7xCf2KbhIaWfp98fPuiOGufyCQ157qFoYdaY/k3KFaKofgAjcTYODTdNWyrjXBlU/qJxLZnde4@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc18JS+9Zo0IvUpwhswZYHdC5uAH3YzkwLkGf32qIKatXu2LA0
	OxfdTM+dqmPWGdCztCTKy78IimmlzhhWkLQQQAEgZF3o62gV7gZgjxdJ
X-Gm-Gg: AeBDietWCso7Uep0DHrPUd3KJCC4+7r5HsjoYBQYLbwNFiLwqs7ksvjlnB7LKmybKwR
	+7rpHARfapfCDgQNR52wnf4FHcQKs5znZB56fyVjr3KgWlEt55tjzl4FeJCtsUZb75CAAOnO99k
	c+ZcJy5BUzFrm1jihUpiwcN0ojWiaa0Vxouh+vBo4YOOuc8JiXL06DxnQyF4GsqeSjX8UcxWjUg
	NsiYVcY+p5FD0XWqNTn971Uz0qSqKbjU1fEE9UVO6nSW4XOgydieuE2d4UqOzMk3UoeJfLSC4OS
	c6XE26bcY7jHZqJJMOqg1f9wpXhCdmaNHbQuArZZduiXjsDoT4lmHCTDVh91rb6EAqtEw6Nb7St
	fQydExNF4arqagWbU7SPiFir5zi1vsRtusZ6xGPVXn8D8MDgNyGj9UQcEZJ8RdBkeTG0BJ/hAQ5
	nwhAsDBWyj51U6tMmdAiOxjasIjYU93gHWtmaPuv3OvHQcunYqFH+Kv8zot1ZufeMTQQYn1OvlA
	lsOUupgF08=
X-Received: by 2002:a05:7300:e125:b0:2e2:27bb:a48c with SMTP id 5a478bee46e88-2ed3c7c835cmr1579972eec.14.1777559834155;
        Thu, 30 Apr 2026 07:37:14 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3b29b2e0sm69553eec.16.2026.04.30.07.37.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 07:37:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f2386cf2-c790-4ce4-91ab-115a29399e25@roeck-us.net>
Date: Thu, 30 Apr 2026 07:37:12 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v8 2/2] watchdog: Add driver for Gunyah Watchdog
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
 Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>,
 Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260311-gunyah_watchdog-v8-0-4c1c0689de22@oss.qualcomm.com>
 <20260311-gunyah_watchdog-v8-2-4c1c0689de22@oss.qualcomm.com>
 <acqEc_urKggA5s62@baldur> <db85ddc1-b302-45f4-be26-f835c63ef069@quicinc.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <db85ddc1-b302-45f4-be26-f835c63ef069@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: DBFCE4A41D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-105379-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[roeck-us.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,qualcomm.com:email]

On 4/29/26 23:15, Pavan Kondeti wrote:
> On Mon, Mar 30, 2026 at 09:11:48AM -0500, Bjorn Andersson wrote:
>> On Wed, Mar 11, 2026 at 11:16:31AM +0530, Pavankumar Kondeti wrote:
>>> From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
>>>
>>> On Qualcomm SoCs running under the Gunyah hypervisor, access to watchdog
>>> through MMIO is not available on all platforms. Depending on the
>>> hypervisor configuration, the watchdog is either fully emulated or
>>> exposed via ARM's SMC Calling Conventions (SMCCC) through the Vendor
>>> Specific Hypervisor Service Calls space.
>>>
>>> Add driver to support the SMC-based watchdog provided by the Gunyah
>>> Hypervisor. Device registration is done in the QCOM SCM driver after
>>> checks to restrict the watchdog initialization to Qualcomm devices
>>> running under Gunyah.
>>>
>>> Gunyah watchdog is not a hardware but an SMC-based vendor-specific
>>> hypervisor interface provided by the Gunyah hypervisor. The design
>>> involving QCOM SCM driver for registering the platform device has been
>>> devised to avoid adding non-hardware nodes to devicetree.
>>>
>>> Tested-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> Signed-off-by: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
>>> Signed-off-by: Pavankumar Kondeti <pavan.kondeti@oss.qualcomm.com>
>>
>> Guenter, there's no build-time dependency between the two patches. I'm
>> applying patch 1 through the qcom tree, please apply this patch through
>> the watchdog tree.
>>
> Thanks Bjorn. I noticed that 1/2 is available in v7.1-rc1 , however 2/2
> is missing. Guenter, can you please pick it up for next release?
> 

I don't send watchdog patches upstream; that has always been handled by Wim.

Guenter



