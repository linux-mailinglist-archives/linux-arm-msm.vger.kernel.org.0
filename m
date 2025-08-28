Return-Path: <linux-arm-msm+bounces-71129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4617FB39EB3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 15:24:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B145E560C5A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 13:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3E3D313E05;
	Thu, 28 Aug 2025 13:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lL7Q5tev"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D1E311C07
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 13:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756387328; cv=none; b=g455C7qe6v4Uiy5uwN6k12sMzkQcc9HpoAvoHbTw9pi7HejNWcfMUUeGqZDVBraCd1Rs5KM7d7J/7EifmhyCQ6HZeLU+2Wr63wacBi0S/pnXKWeAw/pDV9CAU3M2XDidCKbcD9bJ9r1kKrZBliKjOJykheLsDEhGZTVMaSmGof0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756387328; c=relaxed/simple;
	bh=5XTE+m+s7gCBnjAYMBLxzzkoPX0/i4ayIw1uWSSs0VU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZFqjqrcpF4vtlbrta6/Bb42/KXSSHriCyqQ7LuwX4N/F41UTN1BT8JWNE2EC979twXAfqBlNCXfSZyhkmDPYrFB/liKhRqX6qmGhlx7zKBLHSKhYA4AKign6fpyPzhA67gDM6e3xxbLHUJuT6ZN0cSscKSkmOXW8Zif7DdaODsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lL7Q5tev; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-afee6037847so110698466b.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 06:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756387325; x=1756992125; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qi55o5psDKNexWDsg9drcRiKGnBJjMSdfWzuesdk1og=;
        b=lL7Q5tevqEro8Xu3p4QvA/2Gwlde2cJ76gkz52FQT6N402qOMOU2hW0vB+ShJot7ki
         fZyPiIcjsTiJ+8MhOgoS60DS7FqhvOeFufpqiRYy9LiWLq/DjTlS6V3pheiaNxqvXjuE
         U+G9USWmDs3klFmMI9rTJJX79EkOFAi+vRo2OVUlfoVkXam2H/Nm/MvbYfSFrDNMqjJE
         86E968adXlRH81Mice70FqKlvJyhT15fxv9HRWSma8JoVPEAWVLOk7fC2LpkvILzVhBd
         zO7TYY5EuBfG72oyKDUqSrCbK38tWhgpdR7aYiZ8im0Qx1f95PxaO1ISlZnRTIdTL46l
         OwfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756387325; x=1756992125;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qi55o5psDKNexWDsg9drcRiKGnBJjMSdfWzuesdk1og=;
        b=V+hlr7jnxOuDAA/KGdsED0FlVxRwVFgIJPjVpLBQiUSZTPIuqn75pfrups7jHQOIRD
         DpPAF0Kw1feH0qgQZxnpFFD/Jkow08zDYBQ7rjJfHpOeBlj+QyI1W65cbDjihLuUbTtN
         MA+nL+1rNbrM/AS5PUCq+ItgNIyj9gCuORqpVZ4LFPoH3UDLR5jm8es604OXZb5SXwnU
         qORPAAT1Md1URS0pLRQS/3R6qPFc+YVmKZ+UyWKcT9VHy6qZ9e1Lwa9tNY/gxA58i14V
         58AOP1Bst5t312Qe5/j8Pn3ehb5Zd9bgKJ9zpygbD9LMbGoJ/3H1ZUfVToF5izZZ8Grq
         QCjg==
X-Forwarded-Encrypted: i=1; AJvYcCUpIOpSXhFY82jhmK+51Ro/88xiFtLAEeaAEvq8iERMlJLVtAy905LRSNn9YK5S56aLvhVMKJ7NVsXarCga@vger.kernel.org
X-Gm-Message-State: AOJu0YzywK+/Kh99MhgEVLatYaS8UuEILoZdCPpouEL88nPg/bMWVlcQ
	UIPAQJ1GHPO0UYvISViPFeFGEvj/G8KLIpVb25Vcnk2wVOCPcait2LyBYoNGjeySaIo=
X-Gm-Gg: ASbGncunA3g/lQu/XXPfRY8V6eXdTM1b1J7SfW+TXM7Cq8Ybd5q7GC4VxZJMBoIzKxk
	06wiog0LM5+MmOMt/NIlO0ZRyIKo91TyW0aKGmJrHiLkH9F2KME3Mp/dvSTh5Bo1FT1dvxChXOU
	DH235zNHrX4DxT6yQLxKvI+97pe26Yc34V8HVdd9UPqHlfJ1zW9ARS+JSlwj5z10dacsW8pc+3e
	Ze9uBPDMGOzt25+Xpdk4OiAOhGWPg+LmqhCm0rc+3U+OUbf/rBlaiH1dwP9Cjq7mrqxGhSjDF11
	BONiHAdw4qGZmUSAaFYceNfYWBoZNxXGGhfETqEO+9xkN/F6iQhy20ix62hYPMs/sEzVKcKpFT0
	Ys619sXMLsj6YIDYnslYLXcDeTE6AyFg1Sjr2LaIzSyxkxncpC4HKO/cTjBK6rQ62M7sFdpQiCO
	LT
X-Google-Smtp-Source: AGHT+IGjzycD3I8jpbmQVU59Xd7O/26hTjS+y9agnGzek0/A/beiz9E8xi5Rv70X95Pxh+1hKUOYSQ==
X-Received: by 2002:a17:907:9403:b0:afe:f92d:9178 with SMTP id a640c23a62f3a-afef92d9a2cmr10323866b.60.1756387324635;
        Thu, 28 Aug 2025 06:22:04 -0700 (PDT)
Received: from [192.168.1.36] (p4fc3dd6f.dip0.t-ipconnect.de. [79.195.221.111])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe81890cd7sm865837266b.109.2025.08.28.06.22.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Aug 2025 06:22:03 -0700 (PDT)
Message-ID: <88ee0a26-8d64-4060-b703-40156cd011a7@linaro.org>
Date: Thu, 28 Aug 2025 15:22:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 03/10] power: reset: reboot-mode: Add support for 64
 bit magic
Content-Language: en-US
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Rob Herring <robh@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Konrad Dybcio <konradybcio@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 Vinod Koul <vkoul@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
 Stephen Boyd <swboyd@chromium.org>, Andre Draszik
 <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 Elliot Berman <quic_eberman@quicinc.com>,
 Srinivas Kandagatla <srini@kernel.org>
References: <20250815-arm-psci-system_reset2-vendor-reboots-v14-0-37d29f59ac9a@oss.qualcomm.com>
 <20250815-arm-psci-system_reset2-vendor-reboots-v14-3-37d29f59ac9a@oss.qualcomm.com>
From: Casey Connolly <casey.connolly@linaro.org>
In-Reply-To: <20250815-arm-psci-system_reset2-vendor-reboots-v14-3-37d29f59ac9a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Shivendra,

On 15/08/2025 16:35, Shivendra Pratap wrote:
> Current reboot-mode supports a single 32-bit argument for any
> supported mode. Some reboot-mode based drivers may require
> passing two independent 32-bit arguments during a reboot
> sequence, for uses-cases, where a mode requires an additional
> argument. Such drivers may not be able to use the reboot-mode
> driver. For example, ARM PSCI vendor-specific resets, need two
> arguments for its operation – reset_type and cookie, to complete
> the reset operation. If a driver wants to implement this
> firmware-based reset, it cannot use reboot-mode framework.
> 
> Introduce 64-bit magic values in reboot-mode driver to
> accommodate dual 32-bit arguments when specified via device tree.
> In cases, where no second argument is passed from device tree,
> keep the upper 32-bit of magic un-changed(0) to maintain backward
> compatibility.

How about adding a n_magic_args property to struct reboot_mode_driver?
Then in struct mode_info change magic to be a u32 array of a fixed
length (currently two in-keeping with the DT bindings).

Parsing the DT values then gets simpler (u32_array) and the magic value
can be passed into the ->write() cb as a pointer since all the
reboot_mode drivers already know how big the array is. Unpopulated DT
values would just be 0.

Kind regards,

> 
> Update the current drivers using reboot-mode for a 64-bit magic
> value.
> 
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  drivers/power/reset/nvmem-reboot-mode.c  | 13 +++++++++----
>  drivers/power/reset/qcom-pon.c           | 11 ++++++++---
>  drivers/power/reset/reboot-mode.c        | 19 +++++++++++++------
>  drivers/power/reset/syscon-reboot-mode.c | 11 ++++++++---
>  include/linux/reboot-mode.h              |  3 ++-
>  5 files changed, 40 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/power/reset/nvmem-reboot-mode.c b/drivers/power/reset/nvmem-reboot-mode.c
> index 41530b70cfc48c2a83fbbd96f523d5816960a0d1..5d73dde585b1fd438b1847f884feb37cd9e4dd5c 100644
> --- a/drivers/power/reset/nvmem-reboot-mode.c
> +++ b/drivers/power/reset/nvmem-reboot-mode.c
> @@ -16,15 +16,20 @@ struct nvmem_reboot_mode {
>  	struct nvmem_cell *cell;
>  };
>  
> -static int nvmem_reboot_mode_write(struct reboot_mode_driver *reboot,
> -				    unsigned int magic)
> +static int nvmem_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
>  {
> -	int ret;
>  	struct nvmem_reboot_mode *nvmem_rbm;
> +	u32 magic_32;
> +	int ret;
> +
> +	if (magic > U32_MAX)
> +		return -EINVAL;
> +
> +	magic_32 = magic;
>  
>  	nvmem_rbm = container_of(reboot, struct nvmem_reboot_mode, reboot);
>  
> -	ret = nvmem_cell_write(nvmem_rbm->cell, &magic, sizeof(magic));
> +	ret = nvmem_cell_write(nvmem_rbm->cell, &magic_32, sizeof(magic_32));
>  	if (ret < 0)
>  		dev_err(reboot->dev, "update reboot mode bits failed\n");
>  
> diff --git a/drivers/power/reset/qcom-pon.c b/drivers/power/reset/qcom-pon.c
> index 7e108982a582e8243c5c806bd4a793646b87189f..d0ed9431a02313a7bbaa93743c16fa1ae713ddfe 100644
> --- a/drivers/power/reset/qcom-pon.c
> +++ b/drivers/power/reset/qcom-pon.c
> @@ -27,17 +27,22 @@ struct qcom_pon {
>  	long reason_shift;
>  };
>  
> -static int qcom_pon_reboot_mode_write(struct reboot_mode_driver *reboot,
> -				    unsigned int magic)
> +static int qcom_pon_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
>  {
>  	struct qcom_pon *pon = container_of
>  			(reboot, struct qcom_pon, reboot_mode);
> +	u32 magic_32;
>  	int ret;
>  
> +	if (magic > U32_MAX || (magic << pon->reason_shift) > U32_MAX)
> +		return -EINVAL;
> +
> +	magic_32 = magic << pon->reason_shift;
> +
>  	ret = regmap_update_bits(pon->regmap,
>  				 pon->baseaddr + PON_SOFT_RB_SPARE,
>  				 GENMASK(7, pon->reason_shift),
> -				 magic << pon->reason_shift);
> +				 magic_32);
>  	if (ret < 0)
>  		dev_err(pon->dev, "update reboot mode bits failed\n");
>  
> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
> index 9bb97bcd33cd3d58c75c791e9b568024e810e5b0..ac81b8b0a9b7fc31f8ef21024333a050087ce90f 100644
> --- a/drivers/power/reset/reboot-mode.c
> +++ b/drivers/power/reset/reboot-mode.c
> @@ -19,12 +19,11 @@
>  
>  struct mode_info {
>  	const char *mode;
> -	u32 magic;
> +	u64 magic;
>  	struct list_head list;
>  };
>  
> -static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
> -					  const char *cmd)
> +static u64 get_reboot_mode_magic(struct reboot_mode_driver *reboot, const char *cmd)
>  {
>  	const char *normal = "normal";
>  	struct mode_info *info;
> @@ -66,7 +65,7 @@ static int reboot_mode_notify(struct notifier_block *this,
>  			      unsigned long mode, void *cmd)
>  {
>  	struct reboot_mode_driver *reboot;
> -	unsigned int magic;
> +	u64 magic;
>  
>  	reboot = container_of(this, struct reboot_mode_driver, reboot_notifier);
>  	magic = get_reboot_mode_magic(reboot, cmd);
> @@ -89,6 +88,8 @@ int reboot_mode_register(struct reboot_mode_driver *reboot, struct device_node *
>  	struct mode_info *next;
>  	struct property *prop;
>  	size_t len = strlen(PREFIX);
> +	u32 magic_arg1;
> +	u32 magic_arg2;
>  	int ret;
>  
>  	if (!np)
> @@ -108,12 +109,18 @@ int reboot_mode_register(struct reboot_mode_driver *reboot, struct device_node *
>  			goto error;
>  		}
>  
> -		if (of_property_read_u32(np, prop->name, &info->magic)) {
> -			pr_err("reboot mode %s without magic number\n", info->mode);
> +		if (of_property_read_u32(np, prop->name, &magic_arg1)) {
> +			pr_err("reboot mode without magic number\n");
>  			kfree(info);
>  			continue;
>  		}
>  
> +		if (of_property_read_u32_index(np, prop->name, 1, &magic_arg2))
> +			magic_arg2 = 0;
> +
> +		info->magic = magic_arg2;
> +		info->magic = (info->magic << 32) | magic_arg1;
> +
>  		info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
>  		if (!info->mode) {
>  			ret =  -ENOMEM;
> diff --git a/drivers/power/reset/syscon-reboot-mode.c b/drivers/power/reset/syscon-reboot-mode.c
> index e0772c9f70f7a19cd8ec8a0b7fdbbaa7ba44afd0..3cbd000c512239b12ec51987e900d260540a9dea 100644
> --- a/drivers/power/reset/syscon-reboot-mode.c
> +++ b/drivers/power/reset/syscon-reboot-mode.c
> @@ -20,16 +20,21 @@ struct syscon_reboot_mode {
>  	u32 mask;
>  };
>  
> -static int syscon_reboot_mode_write(struct reboot_mode_driver *reboot,
> -				    unsigned int magic)
> +static int syscon_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
>  {
>  	struct syscon_reboot_mode *syscon_rbm;
> +	u32 magic_32;
>  	int ret;
>  
> +	if (magic > U32_MAX)
> +		return -EINVAL;
> +
> +	magic_32 = magic;
> +
>  	syscon_rbm = container_of(reboot, struct syscon_reboot_mode, reboot);
>  
>  	ret = regmap_update_bits(syscon_rbm->map, syscon_rbm->offset,
> -				 syscon_rbm->mask, magic);
> +				 syscon_rbm->mask, magic_32);
>  	if (ret < 0)
>  		dev_err(reboot->dev, "update reboot mode bits failed\n");
>  
> diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
> index 98f68f95c9e8460be23282c51ef7fcbed73887bd..370228b5161963aac1d75af752ada0e8282b1078 100644
> --- a/include/linux/reboot-mode.h
> +++ b/include/linux/reboot-mode.h
> @@ -3,11 +3,12 @@
>  #define __REBOOT_MODE_H__
>  
>  #include <linux/mutex.h>
> +#include <linux/types.h>
>  
>  struct reboot_mode_driver {
>  	struct device *dev;
>  	struct list_head head;
> -	int (*write)(struct reboot_mode_driver *reboot, unsigned int magic);
> +	int (*write)(struct reboot_mode_driver *reboot, u64 magic);
>  	struct notifier_block reboot_notifier;
>  	/*Protects access to reboot mode list*/
>  	struct mutex rb_lock;
> 

-- 
// Casey (she/her)


