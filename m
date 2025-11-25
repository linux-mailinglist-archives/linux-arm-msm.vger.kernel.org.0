Return-Path: <linux-arm-msm+bounces-83263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEFDC8570A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 15:33:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A53B04E3E96
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 14:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53F44325719;
	Tue, 25 Nov 2025 14:33:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCCA31771E
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 14:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764081204; cv=none; b=dflI6PAREke3xDhhXOssFEwu8XdSO+D/cRjT8kHJu4Zw3XhiC0wwWMM1hPHUpdfA2p1qSd7KtO0uYOtc9lWCvieLTpjuh+li/aiDWrKcRA/5nmYKDHmtTByhWvvbyRFF9bm6sZ32lTbLbYajPiABOqVpz5ibUJJRuuDS7Ppy+Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764081204; c=relaxed/simple;
	bh=hUUrqFVKpiS53ziImxSZ3RnEwgozGk2te25nEj0CvUA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BlnqhXWs6q3KZ7z5ukTQw5CrPMlVaRApOAB0LyEkTDqrvhKxG9HOmnU5Qrmi0RcNirYICRpORNnGEI+cb3PZn751EWs68nWFecNGa2Qdf+1cllePtP+1/gZ/uj4ILgESafgMHs+Ussyada8fVNnQQVxkQX8KdBAvXnGo5Q9EFbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vNu6Y-0004Mq-Dc; Tue, 25 Nov 2025 15:33:18 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vNu6X-002Pr1-1t;
	Tue, 25 Nov 2025 15:33:17 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vNu6X-000000007sN-29MZ;
	Tue, 25 Nov 2025 15:33:17 +0100
Message-ID: <c478f7a0f3b91585618ec8e5ee57c5c4efd59f32.camel@pengutronix.de>
Subject: Re: [PATCH] reset: gpio: add a devlink between reset-gpio and its
 consumer
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski
 <krzk@kernel.org>,  Val Packett <val@packett.cool>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz
 Golaszewski <bartosz.golaszewski@linaro.org>
Date: Tue, 25 Nov 2025 15:33:17 +0100
In-Reply-To: <20251125-reset-gpio-add-devlink-v1-1-a1909fef227b@linaro.org>
References: <20251125-reset-gpio-add-devlink-v1-1-a1909fef227b@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-msm@vger.kernel.org

Hi Bartosz,

On Di, 2025-11-25 at 13:55 +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> The device that requests the reset control managed by the reset-gpio
> device is effectively its consumer but the devlink is only established
> between it and the GPIO controller exposing the reset pin. Add a devlink
> between the consumer of the reset control and its supplier. This will
> allow us to simplify the GPIOLIB code managing shared GPIOs when
> handling the corner case of reset-gpio and gpiolib-shared interacting.
>=20
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> This change will allow us to simplify the code in gpiolib-shared.c in
> the next cycle, so it would be awesome if it could make v6.19.
>=20
> Val: I'm Cc'ing you as you're already playing with audio on hamoa. If v2
> of the reset-gpios fix works for you, could you please also test this
> and make sure it doesn't break anything with soundwire?
>=20
> Thanks in advance,
> Bart
> ---
>  drivers/reset/core.c | 73 +++++++++++++++++++++++++++++++++++++++++-----=
------
>  1 file changed, 58 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/reset/core.c b/drivers/reset/core.c
> index 0135dd0ae20498396fdb5a682f913b6048cb5750..15b8da9ebcf196f7d5ce7921e=
4f8aba0ea6b0de4 100644
> --- a/drivers/reset/core.c
> +++ b/drivers/reset/core.c
> @@ -20,6 +20,7 @@
>  #include <linux/kref.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_platform.h>
>  #include <linux/reset.h>
>  #include <linux/reset-controller.h>
>  #include <linux/slab.h>
> @@ -82,6 +83,7 @@ struct reset_gpio_lookup {
>  	struct of_phandle_args of_args;
>  	struct fwnode_handle *swnode;
>  	struct list_head list;
> +	struct auxiliary_device *adev;
>  };
> =20
>  static const char *rcdev_name(struct reset_controller_dev *rcdev)
> @@ -829,16 +831,16 @@ static void reset_gpio_aux_device_release(struct de=
vice *dev)
>  	kfree(adev);
>  }
> =20
> -static int reset_add_gpio_aux_device(struct device *parent,
> -				     struct fwnode_handle *swnode,
> -				     int id, void *pdata)
> +static struct auxiliary_device *
> +reset_add_gpio_aux_device(struct device *parent, struct fwnode_handle *s=
wnode,
> +			  int id, void *pdata)

This function grows ever more similar to auxiliary_device_create().

s/add/create/?

>  {
>  	struct auxiliary_device *adev;
>  	int ret;
> =20
>  	adev =3D kzalloc(sizeof(*adev), GFP_KERNEL);
>  	if (!adev)
> -		return -ENOMEM;
> +		return ERR_PTR(-ENOMEM);
> =20
>  	adev->id =3D id;
>  	adev->name =3D "gpio";
> @@ -850,23 +852,55 @@ static int reset_add_gpio_aux_device(struct device =
*parent,
>  	ret =3D auxiliary_device_init(adev);
>  	if (ret) {
>  		kfree(adev);
> -		return ret;
> +		return ERR_PTR(ret);
>  	}
> =20
>  	ret =3D __auxiliary_device_add(adev, "reset");
>  	if (ret) {
>  		auxiliary_device_uninit(adev);
>  		kfree(adev);
> -		return ret;
> +		return ERR_PTR(ret);
>  	}
> =20
> -	return ret;
> +	return adev;
> +}
> +
> +static void reset_gpio_add_devlink(struct device_node *np,
> +				   struct reset_gpio_lookup *rgpio_dev)
> +{
> +	struct device *consumer;
> +
> +	/*
> +	 * We must use get_dev_from_fwnode() and not of_find_device_by_node()
> +	 * because the latter only considers the platform bus while we want to
> +	 * get consumers of any kind that can be associated with firmware
> +	 * nodes: auxiliary, soundwire, etc.
> +	 */
> +	consumer =3D get_dev_from_fwnode(of_fwnode_handle(np));

If called via __reset_control_get(), this just reconstructs the device
from dev->of_node. I think it would be better to move the linking into
__reset_control_get() and use the passed in consumer device directly.

> +	if (consumer) {
> +		if (!device_link_add(consumer, &rgpio_dev->adev->dev, DL_FLAG_STATELES=
S))

Who removes this link when the consumer puts the reset control, or if
we error out later?

> +			pr_warn("Failed to create a device link between reset-gpio and its co=
nsumer");
> +
> +		put_device(consumer);
> +	}
> +	/*
> +	 * else { }
> +	 *
> +	 * TODO: If ever there's a case where we need to support shared
> +	 * reset-gpios retrieved from a device node for which there's no
> +	 * device present yet, this is where we'd set up a notifier waiting
> +	 * for the device to appear in the system. This would be a lot of code
> +	 * that would go unused for now so let's cross that bridge when and if
> +	 * we get there.
> +	 */
>  }
> =20
>  /*
> - * @args:	phandle to the GPIO provider with all the args like GPIO numbe=
r
> + * @np: OF-node associated with the consumer
> + * @args: phandle to the GPIO provider with all the args like GPIO numbe=
r
>   */
> -static int __reset_add_reset_gpio_device(const struct of_phandle_args *a=
rgs)
> +static int __reset_add_reset_gpio_device(struct device_node *np,
> +					 const struct of_phandle_args *args)
>  {
>  	struct property_entry properties[2] =3D { };
>  	unsigned int offset, of_flags, lflags;
> @@ -916,8 +950,14 @@ static int __reset_add_reset_gpio_device(const struc=
t of_phandle_args *args)
> =20
>  	list_for_each_entry(rgpio_dev, &reset_gpio_lookup_list, list) {
>  		if (args->np =3D=3D rgpio_dev->of_args.np) {
> -			if (of_phandle_args_equal(args, &rgpio_dev->of_args))
> -				return 0; /* Already on the list, done */
> +			if (of_phandle_args_equal(args, &rgpio_dev->of_args)) {
> +				/*
> +				 * Already on the list, create the device link
> +				 * and stop here.
> +				 */
> +				reset_gpio_add_devlink(np, rgpio_dev);

I think instead of linking here ...

> +				return 0;
> +			}
>  		}
>  	}
> =20
> @@ -950,11 +990,14 @@ static int __reset_add_reset_gpio_device(const stru=
ct of_phandle_args *args)
>  		goto err_put_of_node;
>  	}
> =20
> -	ret =3D reset_add_gpio_aux_device(parent, rgpio_dev->swnode, id,
> -					&rgpio_dev->of_args);
> -	if (ret)
> +	rgpio_dev->adev =3D reset_add_gpio_aux_device(parent, rgpio_dev->swnode=
,
> +						    id, &rgpio_dev->of_args);
> +	if (IS_ERR(rgpio_dev->adev)) {
> +		ret =3D PTR_ERR(rgpio_dev->adev);
>  		goto err_del_swnode;
> +	}
> =20
> +	reset_gpio_add_devlink(np, rgpio_dev);

... and here, we could just create a device link between the passed in
consumer dev and rstc->rcdev->dev in __reset_control_get().

regards
Philipp

