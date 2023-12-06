Return-Path: <linux-arm-msm+bounces-3594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C63D18078D4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 20:46:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BAE11F211A2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 19:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C327547F6E;
	Wed,  6 Dec 2023 19:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="STs7399F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC425D3;
	Wed,  6 Dec 2023 11:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=ZbbXGJgus1UbpDCDhjXLGsD3yiGnIIyarmStVlys6bI=; b=STs7399FPv9DtRiqDNmedwrjo2
	ek3GCT9XkOwEGqLFaJXUSDTbkjNzGtFAzEKjKiYr+RL/0w/eYSZhZ4S6zG2omW2ieS9II7c4W1cj1
	bwc52+Vm9AwzrM3qYgyft5xLrGuLpSz2Qag56ACkdJcKzZ4kpn1KvY+zUnaO4aHwKz6I5gNZAxkVl
	N3hQp19J3OSpEOyKqcaOoRW7iIYpUFGU9a5fIFMqzEv8jAvd1Tf5NIGKShjWNOVXyWX7taO0n5QHD
	3JSGq8FONvFKpwoHH/7BoUUgj0N+UkSynnOcmLYYj1LMEXiHE7dFLYoSCQw9K7rzRhAjLupiaDwzf
	TzeT2Fvg==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rAxqi-00B9PW-1j;
	Wed, 06 Dec 2023 19:46:24 +0000
Message-ID: <0c1bb5e8-1ad2-4bda-b038-456d9791f9b7@infradead.org>
Date: Wed, 6 Dec 2023 11:46:22 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: typec: qcom-pmic: add CONFIG_OF dependency
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>
References: <20231206172037.12072-1-rdunlap@infradead.org>
 <d0323841-a3a7-45b7-b702-0a08f9250c55@roeck-us.net>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <d0323841-a3a7-45b7-b702-0a08f9250c55@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/6/23 10:49, Guenter Roeck wrote:
> On Wed, Dec 06, 2023 at 09:20:37AM -0800, Randy Dunlap wrote:
>> DRM_AUX_BRIDGE depends on CONFIG_OF, so that is also needed here
>> to fix a kconfig warning:
>>
>> WARNING: unmet direct dependencies detected for DRM_AUX_HPD_BRIDGE
>>   Depends on [n]: HAS_IOMEM [=y] && DRM_BRIDGE [=y] && OF [=n]
>>   Selected by [y]:
>>   - TYPEC_QCOM_PMIC [=y] && USB_SUPPORT [=y] && TYPEC [=y] && TYPEC_TCPM [=y] && (ARCH_QCOM || COMPILE_TEST [=y]) && (DRM [=y] || DRM [=y]=n) && DRM_BRIDGE [=y]
>>
> 
> All but impossible for me to determine if this patch or
> https://lore.kernel.org/all/20231205-drm_aux_bridge-fixes-v1-2-d242a0ae9df4@kernel.org/
> is more appropriate.
> 
> Guenter

I guess that Bryan is the person to ask about that.

I don't see anything wrong with Nathan's patch. It should clear up the kconfig warning,
so as long as it builds cleanly, it seems OK.

> 
>> Fixes: 7d9f1b72b296 ("usb: typec: qcom-pmic-typec: switch to DRM_AUX_HPD_BRIDGE")
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>> Cc: Guenter Roeck <linux@roeck-us.net>
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Cc: linux-arm-msm@vger.kernel.org
>> Cc: linux-usb@vger.kernel.org
>> Cc: Arnd Bergmann <arnd@arndb.de>
>> ---
>>  drivers/usb/typec/tcpm/Kconfig |    1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff -- a/drivers/usb/typec/tcpm/Kconfig b/drivers/usb/typec/tcpm/Kconfig
>> --- a/drivers/usb/typec/tcpm/Kconfig
>> +++ b/drivers/usb/typec/tcpm/Kconfig
>> @@ -80,6 +80,7 @@ config TYPEC_QCOM_PMIC
>>  	tristate "Qualcomm PMIC USB Type-C Port Controller Manager driver"
>>  	depends on ARCH_QCOM || COMPILE_TEST
>>  	depends on DRM || DRM=n
>> +	depends on OF
>>  	select DRM_AUX_HPD_BRIDGE if DRM_BRIDGE
>>  	help
>>  	  A Type-C port and Power Delivery driver which aggregates two

-- 
~Randy

