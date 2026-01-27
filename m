Return-Path: <linux-arm-msm+bounces-90880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMy+EvgzeWmlvwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 22:54:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AF20C9AD80
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 22:53:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 57C1F3006234
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 21:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D6F62FD1DC;
	Tue, 27 Jan 2026 21:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ymLLB1PZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C0E32D45C
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 21:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769550835; cv=none; b=HspCV5UBskvnP5P4dqcdLBSWChFHLwgeEsi4YaenVEwvx9l45duZYtgFaS35ial4ZYyagydHdwtzHJCcEKzCk2E3P0gc0NkIROA16EiAfV7g2ICXc5V/wnrwEtuEZgxGiQvhpVZxyPdTSpE9KySFQngUoMcRvCphFEjUBJ5soSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769550835; c=relaxed/simple;
	bh=0dVm4VUbznq0Tn+3bAgXEVSu5pdNdqlLlwfbGeK3pRc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=fHGtZoRzv/bj737WX9nGCfrDVd3YvDmUv+2/PJf8kEqlo0N3CbRVB1zE8pQKF7RU6BCNGScvOHiuGS927eezzuGTWlXv0uR8J0Zj3rHHYUCNUBSG9knQ0rovoxh6p6x02DCS1vbrcrOxHIKDT8rSiYg6/QmpccEnnATU9dn5DMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ymLLB1PZ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48049955f7fso53803225e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 13:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769550832; x=1770155632; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S6ONBdBrWL44g/dbc6EELGm2hRjj8YYj2H+Yh0hSCJs=;
        b=ymLLB1PZHVZMhBAdRPW4Cp9u6XhS8NQt+auxfDUk+cpL3v2nfZuSB5kmTmCaa7An9f
         8AcoYLGy9pw1ERSFWqw6CypNjR+XmUytE9+kyulZKl7x2CK2cNqMjo1qZnZlryShH/c4
         NxdxUZjlqbdcb5FRpwkWQ53KNx5rOJeV+369Kl5MwA3lEkBWuKK3ZvtQmuqrSQwXSvhu
         HjryP0q3Y7Jw8eHmlxGpX79VNxczrNuOyxSlgiqV3OQtGcXjLGI7EyFlfkiB4n4NbE2n
         ziAb6XVB3PGaz9eeZEeoCbpnEHxL6Mv3KoHV6rF2jcQeCKwbxNYJgYrncQ9fGHbigBot
         UdCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769550832; x=1770155632;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S6ONBdBrWL44g/dbc6EELGm2hRjj8YYj2H+Yh0hSCJs=;
        b=AGjEXONjCwu8VdH+jLjIbzjLrRDdZWftDstcppgXU8pbkWJG8+njM+VEfX6Mit9G02
         ygfeVDtXumxOLlkxcNQrAfJl8uMJEbhTue4It6/RoPYLUzOyR4dBJrfixnjdG5n+YSpO
         v+7CQdiTgEvHGYuDQ6wD2BXg0DiRuOePi3sBLfw9JIEHfJTJh0aIsfuRjBPBhyWheDOw
         IGMyeMIwJdpfHyKKTbQRuCH0jDAIk90J6pC7Ss1XR4yqTnVaj6pxbFQWFn1efRj2OwRP
         eiPOe+SMSfI+4GuWwgRVLQQxn8BZOyMys7VbAQ0ON2xQ+/6lWUMhU/N5G89G1cawzI5k
         dNtg==
X-Forwarded-Encrypted: i=1; AJvYcCWa/ErT6WxK5cxhvTEFE4pU6ppFOMaljqF5gzMo0uCiK3EcYpyo+OTTcMrRdRqIvJXwKueItVWo13xPFzCX@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4dehT86oOscaxwG85Tx+1/N6szSV4TSmJpouIWMje0r2L0RF0
	7hBQPkFVZrgPwDYUtrgfcsACSg8dNDHaJMWsG4I2XbJNXyYs0FSKUtJJWoWoUeXve9o=
X-Gm-Gg: AZuq6aJh79UOSDvan9ijr95NTC04iS9WAYk+QYZ4k7ZLFBvGy7tnZ64nkKtvzH7k4J4
	c5UXFnJiiP99/P4NR4+bmWsK41xS7qAcCfyIzHETOI2w6OWCmgweicNN3p/X7i4EYkhI4a1D865
	waKYO1ho9uFHXDxUAmRdNmV1QS0UENaSrAAEDNx8aRJag61Y86bSIrWvCjKBDReIWM/caeEs/WC
	ktIRlX9BsX6C9ue6NWE7fEZsBCiBmHkiqeLf69s1vtQwDxTkJ8+6g4AA9p1o32kqPXrjctHP4Sg
	XSd0mGQxwmmm3AyihFghiyz5T9qKsN2NSPlmBm3WbFHvUfbhR88NOHgkQ3K528UoG6FKZXzpozR
	ynjykLyQd3IVPyKUzYdfg63RG1POOo+GAkjg2eT5RtFSmnK4GzRXiKAkQxLkG0LrM0AOxmpu/m2
	6lNSTFm7EXYXhyIek/FPSQkvjXr17EtLAh04aaV0jAWZcOsFIZR4alCWLY0q49kS+8Z+njnJS6F
	g==
X-Received: by 2002:a05:600c:1e1c:b0:479:2f95:5179 with SMTP id 5b1f17b1804b1-48069c161d3mr43220935e9.15.1769550831789;
        Tue, 27 Jan 2026 13:53:51 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:7745:d752:5f0b:2b68? ([2a01:e0a:3d9:2080:7745:d752:5f0b:2b68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1354205sm1918002f8f.41.2026.01.27.13.53.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 13:53:51 -0800 (PST)
Message-ID: <0104896e-44d0-485a-a44e-694864c819b7@linaro.org>
Date: Tue, 27 Jan 2026 22:53:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/7] pci: pwrctrl: add PCI pwrctrl driver for the
 UPD720201/UPD720202 USB 3.0 xHCI Host Controller
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-pci@vger.kernel.org
References: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-0-c55ec1b5d8bf@linaro.org>
 <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-2-c55ec1b5d8bf@linaro.org>
 <llbnkm72mgcsrucnp7pdkwbgyzenvhe4kudxkdixplgaoirdem@3q3me34o5drf>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <llbnkm72mgcsrucnp7pdkwbgyzenvhe4kudxkdixplgaoirdem@3q3me34o5drf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linuxfoundation.org,glider.be,google.com,vger.kernel.org,lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-90880-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: AF20C9AD80
X-Rspamd-Action: no action

On 1/27/26 16:53, Manivannan Sadhasivam wrote:
> On Tue, Jan 27, 2026 at 10:57:29AM +0100, Neil Armstrong wrote:
>> Add support fo the Renesas UPD720201/UPD720202 USB 3.0 xHCI Host Controller
>> power control which connects over PCIe and requires specific power supplies
>> to start up.
>>
> 
> This driver only handles the supplies. So why can't you use the existing
> pwrctrl-slot driver as a fallback?

It would fit with no change, but the name "slot" doesn't match the goal here,
it's not a slot at all, it's an actual pcie IC.

Neil

> 
> - Mani
> 
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/pci/pwrctrl/Kconfig                 | 10 ++++
>>   drivers/pci/pwrctrl/Makefile                |  2 +
>>   drivers/pci/pwrctrl/pci-pwrctrl-upd720201.c | 88 +++++++++++++++++++++++++++++
>>   3 files changed, 100 insertions(+)
>>
>> diff --git a/drivers/pci/pwrctrl/Kconfig b/drivers/pci/pwrctrl/Kconfig
>> index e0f999f299bb..5a94e60d0d3e 100644
>> --- a/drivers/pci/pwrctrl/Kconfig
>> +++ b/drivers/pci/pwrctrl/Kconfig
>> @@ -11,6 +11,16 @@ config PCI_PWRCTRL_PWRSEQ
>>   	select POWER_SEQUENCING
>>   	select PCI_PWRCTRL
>>   
>> +config PCI_PWRCTRL_UPD720201
>> +	tristate "PCI Power Control driver for the UPD720201 USB3 Host Controller"
>> +	select PCI_PWRCTRL
>> +	help
>> +	  Say Y here to enable the PCI Power Control driver of the UPD720201
>> +	  USB3 Host Controller.
>> +
>> +	  The voltage regulators powering the rails of the PCI slots
>> +	  are expected to be defined in the devicetree node of the PCI device.
>> +
>>   config PCI_PWRCTRL_SLOT
>>   	tristate "PCI Power Control driver for PCI slots"
>>   	select PCI_PWRCTRL
>> diff --git a/drivers/pci/pwrctrl/Makefile b/drivers/pci/pwrctrl/Makefile
>> index 13b02282106c..a99f85de8a3d 100644
>> --- a/drivers/pci/pwrctrl/Makefile
>> +++ b/drivers/pci/pwrctrl/Makefile
>> @@ -5,6 +5,8 @@ pci-pwrctrl-core-y			:= core.o
>>   
>>   obj-$(CONFIG_PCI_PWRCTRL_PWRSEQ)	+= pci-pwrctrl-pwrseq.o
>>   
>> +obj-$(CONFIG_PCI_PWRCTRL_UPD720201)	+= pci-pwrctrl-upd720201.o
>> +
>>   obj-$(CONFIG_PCI_PWRCTRL_SLOT)		+= pci-pwrctrl-slot.o
>>   pci-pwrctrl-slot-y			:= slot.o
>>   
>> diff --git a/drivers/pci/pwrctrl/pci-pwrctrl-upd720201.c b/drivers/pci/pwrctrl/pci-pwrctrl-upd720201.c
>> new file mode 100644
>> index 000000000000..db96bbb69c21
>> --- /dev/null
>> +++ b/drivers/pci/pwrctrl/pci-pwrctrl-upd720201.c
>> @@ -0,0 +1,88 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Based on upd720201.c:
>> + * Copyright (C) 2024 Linaro Ltd.
>> + * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>> + */
>> +
>> +#include <linux/device.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/module.h>
>> +#include <linux/pci-pwrctrl.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regulator/consumer.h>
>> +#include <linux/slab.h>
>> +
>> +struct pci_pwrctrl_upd720201_data {
>> +	struct pci_pwrctrl ctx;
>> +	struct regulator_bulk_data *supplies;
>> +	int num_supplies;
>> +};
>> +
>> +static void devm_pci_pwrctrl_upd720201_power_off(void *data)
>> +{
>> +	struct pci_pwrctrl_upd720201_data *upd720201 = data;
>> +
>> +	regulator_bulk_disable(upd720201->num_supplies, upd720201->supplies);
>> +	regulator_bulk_free(upd720201->num_supplies, upd720201->supplies);
>> +}
>> +
>> +static int pci_pwrctrl_upd720201_probe(struct platform_device *pdev)
>> +{
>> +	struct pci_pwrctrl_upd720201_data *upd720201;
>> +	struct device *dev = &pdev->dev;
>> +	int ret;
>> +
>> +	upd720201 = devm_kzalloc(dev, sizeof(*upd720201), GFP_KERNEL);
>> +	if (!upd720201)
>> +		return -ENOMEM;
>> +
>> +	ret = of_regulator_bulk_get_all(dev, dev_of_node(dev),
>> +					&upd720201->supplies);
>> +	if (ret < 0) {
>> +		dev_err_probe(dev, ret, "Failed to get upd720201 regulators\n");
>> +		return ret;
>> +	}
>> +
>> +	upd720201->num_supplies = ret;
>> +	ret = regulator_bulk_enable(upd720201->num_supplies, upd720201->supplies);
>> +	if (ret < 0) {
>> +		dev_err_probe(dev, ret, "Failed to enable upd720201 regulators\n");
>> +		regulator_bulk_free(upd720201->num_supplies, upd720201->supplies);
>> +		return ret;
>> +	}
>> +
>> +	ret = devm_add_action_or_reset(dev, devm_pci_pwrctrl_upd720201_power_off,
>> +				       upd720201);
>> +	if (ret)
>> +		return ret;
>> +
>> +	pci_pwrctrl_init(&upd720201->ctx, dev);
>> +
>> +	ret = devm_pci_pwrctrl_device_set_ready(dev, &upd720201->ctx);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to register pwrctrl driver\n");
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct of_device_id pci_pwrctrl_upd720201_of_match[] = {
>> +	{
>> +		.compatible = "pci1912,0014",
>> +	},
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(of, pci_pwrctrl_upd720201_of_match);
>> +
>> +static struct platform_driver pci_pwrctrl_upd720201_driver = {
>> +	.driver = {
>> +		.name = "pci-pwrctrl-upd720201",
>> +		.of_match_table = pci_pwrctrl_upd720201_of_match,
>> +	},
>> +	.probe = pci_pwrctrl_upd720201_probe,
>> +};
>> +module_platform_driver(pci_pwrctrl_upd720201_driver);
>> +
>> +MODULE_AUTHOR("Neil Armstrong <neil.armstrong@linaro.org>");
>> +MODULE_DESCRIPTION("PCI Power Control driver for UPD720201 USB3 Host Controller");
>> +MODULE_LICENSE("GPL");
>>
>> -- 
>> 2.34.1
>>
> 


