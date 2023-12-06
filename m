Return-Path: <linux-arm-msm+bounces-3597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A9A807A4F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 22:26:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A9B8CB20B0E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 21:26:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 216606F631;
	Wed,  6 Dec 2023 21:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="OElDPuUj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C40CF7;
	Wed,  6 Dec 2023 13:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=3j90ZFbMF32YiYwLgeelVPftRxouXRUNKvFk7M5BhLM=; b=OElDPuUj0WoPSBTrYyBEQZNUdV
	BKlCdrNoMn+A7LAzguP4PBqyQhSrYYhBP9qGZYgDZgsAHmneZpWqFHzuXBqQnqtTSLunseEL34TsN
	R7nsFasCYWQKzGoEdn+aOxrALz4rj/9uyItZelAzmXVjTagnuIWChlylvJ5g4MK6jN60KYuwU0d4D
	oalJQSu+6L/rf2UC4sblvoLt4c1ygpnZFtZkjWbr73OFoDI8tP7NtPv3cJcVEKYoa8QndEuaA/lkE
	H/d/Ew7jPqagBjA2jjIuJUPshEc9wM/QhjLip5POPp0cVi9g8qivxtnB20VFvar2gdfi37T7YlNUZ
	YcZjPD0g==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rAzOz-00BJSw-31;
	Wed, 06 Dec 2023 21:25:53 +0000
Message-ID: <b2ba3809-81b1-4da7-a441-9ce161a06505@infradead.org>
Date: Wed, 6 Dec 2023 13:25:53 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: typec: qcom-pmic: add CONFIG_OF dependency
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>
References: <20231206172037.12072-1-rdunlap@infradead.org>
 <d0323841-a3a7-45b7-b702-0a08f9250c55@roeck-us.net>
 <0c1bb5e8-1ad2-4bda-b038-456d9791f9b7@infradead.org>
 <a058827a-b025-4ee5-b2a4-d6c8963a6b73@linaro.org>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <a058827a-b025-4ee5-b2a4-d6c8963a6b73@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 12/6/23 13:21, Bryan O'Donoghue wrote:
> On 06/12/2023 20:46, Randy Dunlap wrote:
>>
>>
>> On 12/6/23 10:49, Guenter Roeck wrote:
>>> On Wed, Dec 06, 2023 at 09:20:37AM -0800, Randy Dunlap wrote:
>>>> DRM_AUX_BRIDGE depends on CONFIG_OF, so that is also needed here
>>>> to fix a kconfig warning:
>>>>
>>>> WARNING: unmet direct dependencies detected for DRM_AUX_HPD_BRIDGE
>>>>    Depends on [n]: HAS_IOMEM [=y] && DRM_BRIDGE [=y] && OF [=n]
>>>>    Selected by [y]:
>>>>    - TYPEC_QCOM_PMIC [=y] && USB_SUPPORT [=y] && TYPEC [=y] && TYPEC_TCPM [=y] && (ARCH_QCOM || COMPILE_TEST [=y]) && (DRM [=y] || DRM [=y]=n) && DRM_BRIDGE [=y]
>>>>
>>>
>>> All but impossible for me to determine if this patch or
>>> https://lore.kernel.org/all/20231205-drm_aux_bridge-fixes-v1-2-d242a0ae9df4@kernel.org/
>>> is more appropriate.
>>>
>>> Guenter
>>
>> I guess that Bryan is the person to ask about that.
>>
>> I don't see anything wrong with Nathan's patch. It should clear up the kconfig warning,
>> so as long as it builds cleanly, it seems OK.
>>
> 
> So, I see both versions of this fix
> 
> Nathan's
> drivers/gpu/drm/renesas/rcar-du/Kconfig

No, please see https://lore.kernel.org/all/20231205-drm_aux_bridge-fixes-v1-2-d242a0ae9df4@kernel.org/

> 
> Yours
> drivers/gpu/drm/tve200/Kconfig

No, please see https://lore.kernel.org/linux-usb/a058827a-b025-4ee5-b2a4-d6c8963a6b73@linaro.org/T/#m034fb56a750522f18813642259b18bb4867ceb46

> 
> and virtually equivalent commit text. I think we agree its 1:1
> 
> So, maybe stick with Nathan's since he posted first.

Sure, I'm OK with that.

-- 
~Randy

