Return-Path: <linux-arm-msm+bounces-90305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCtvOVk7c2kztgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 10:11:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 88889730AA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 10:11:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E786C3003633
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 09:11:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 934AD316919;
	Fri, 23 Jan 2026 09:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mgi/Q/iB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA9B303A05;
	Fri, 23 Jan 2026 09:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769159511; cv=none; b=ZyeGomrBj6t0TxtQST+2ygBx7wXJSnbqIX8DMNAXX2HloR9TXJLKqsyU+7rSkE3gTYmQGEYtZSK+YjQi274QNY4eqPRGvZgLQQeIaOiXKofjAJRQ4n2E+emnlSSr4i5xek9aQzSZhpyM87I9zdeg4FbHxBK38TQzkOwtF3u0yLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769159511; c=relaxed/simple;
	bh=jliK6HGeroY22rdlTlF7rfTd8jXQadZe9hVX0slatrI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t+hSttwa7XRYGjFWK3r8+5ww+XTuzfS75QlCUY1ZFQaGzoscQkIPjorlqecETi2p7z1clJCaDoifz3iFpD8LaEeM6RFoBYoovoXXZ1eEh6EglcgvLZ8mVCOIBsZe5cPwPAdvOyRX1h0KnUKyJg9LxbRQopiw7WB1v+v1AQrZWUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mgi/Q/iB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2B44C4CEF1;
	Fri, 23 Jan 2026 09:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769159511;
	bh=jliK6HGeroY22rdlTlF7rfTd8jXQadZe9hVX0slatrI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Mgi/Q/iBpj8XQH1yqzEkEjLtN0vCpJxP9LS+wNdSSFffWe3DZ5n3Vx6c0Xe3Uqz7C
	 J7xhqkeb/hGNkIg9U5Lrul/4yY4Hz7nYt8jN4fPh364LeySslKFhhK81veB4ouB4hp
	 YCJbKRfY7DU95Ae2vnaBMgtCu8D5it3ppb3qCmDnfaE75jOmQisvC5B/czdZmyi4Ws
	 mt6KUdO1rdwyqZUyQiGT6t4xghs3ec8hBTJoprJFuuWiTViBs7NhNYubBYg8GJqagy
	 zJWY2XbLfrRAP3x1YjYlabNLxaJG6S/fgPZrpEguZe+XAKvIuP8z1sP4e+/XwE9fdm
	 lA/40qI+mGHVw==
Date: Fri, 23 Jan 2026 09:11:41 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Petr Hodina via B4 Relay <devnull+petr.hodina.protonmail.com@kernel.org>
Cc: petr.hodina@protonmail.com, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, David Heidelberg <david@ixit.cz>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/3] iio: light: add AMS TCS3400 RGB and RGB-IR color
 sensor driver
Message-ID: <20260123091141.7ce41a22@jic23-huawei>
In-Reply-To: <20260119-tsc3400-v1-2-82a65c5417aa@protonmail.com>
References: <20260119-tsc3400-v1-0-82a65c5417aa@protonmail.com>
	<20260119-tsc3400-v1-2-82a65c5417aa@protonmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90305-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[protonmail.com,baylibre.com,analog.com,kernel.org,ixit.cz,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-arm-msm,petr.hodina.protonmail.com,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[protonmail.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 88889730AA
X-Rspamd-Action: no action

On Mon, 19 Jan 2026 18:19:07 +0100
Petr Hodina via B4 Relay <devnull+petr.hodina.protonmail.com@kernel.org> wrote:

> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Add support for the AMS TCS3400 I2C color light-to-digital converter.
> The driver supports RGBC and RGB-IR modes, programmable integration
> time, optional interrupt-driven buffered capture, and regulator-based
> power control.
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
Hi Petr,

Seems you have a lot of reviews already.  I'll take a quick look
as well but may well overlap with others.

Thanks,

Jonathan

>  M:	Mudit Sharma <muditsharma.info@gmail.com>
> diff --git a/drivers/iio/light/Kconfig b/drivers/iio/light/Kconfig
> index ac1408d374c9..73419d80e3a7 100644
> --- a/drivers/iio/light/Kconfig
> +++ b/drivers/iio/light/Kconfig
> @@ -580,6 +580,17 @@ config ST_UVIS25_SPI
>  	depends on ST_UVIS25
>  	select REGMAP_SPI
>  
> +config TCS3400
> +	tristate "AMS TCS3400 color light-to-digital converter"
> +	depends on I2C
> +	default n
Drop that as it's the default with nothing said.
> +	help
> +	  If you say yes here you get support for the AMS TCS3400.
> +	  This sensor can detect ambient light and color (RGB) values.
> +
> +	  This driver can also be built as a module.  If so, the module
> +	  will be called tcs3400.

> diff --git a/drivers/iio/light/tcs3400.c b/drivers/iio/light/tcs3400.c
> new file mode 100644
> index 000000000000..22c8c4e803cf
> --- /dev/null
> +++ b/drivers/iio/light/tcs3400.c
> @@ -0,0 +1,505 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * TCS3400 - AMS/TAOS color light sensor with RGBC and RGB-IR channels
> + *
> + * Copyright (c) 2025 Petr Hodina
> + *
This trailing blank line adds little other than more scrolling. Drop it.
> + */
> +
> +#include <linux/module.h>
Alphabetical order and sanity check that you are following the
include what you use philosophy for includes (see threads
on list currently about that).

> +#include <linux/i2c.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/interrupt.h>
> +#include <linux/delay.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/iio/iio.h>
> +#include <linux/iio/sysfs.h>
> +#include <linux/iio/buffer.h>
> +#include <linux/iio/triggered_buffer.h>
> +#include <linux/iio/trigger.h>
See below for comments on this.
> +#include <linux/iio/trigger_consumer.h>
> +
> +#define TCS3400_DRV_NAME "tcs3400"
> +#define TCS3400_CMD_REG(reg) (0x80 | (reg))
> +#define TCS3400_CMD_SPECIAL 0xE0
> +#define TCS3400_CMD_ALS_INT_CLR 0xE6
> +#define TCS3400_CMD_ALL_INT_CLR 0xE7
> +#define TCS3400_ENABLE 0x00

I'd add _REG postfix to the register addresses. Makes it
easier to tell what is address and what is field..

> +#define TCS3400_ATIME 0x01
> +#define TCS3400_WTIME 0x03
> +#define TCS3400_PERSIST 0x0C
> +#define TCS3400_CONTROL 0x0F /* Gain */
> +#define TCS3400_STATUS 0x13
> +#define TCS3400_CDATAL 0x14 /* Clear low */
> +#define TCS3400_RDATAL 0x16
> +#define TCS3400_GDATAL 0x18
> +#define TCS3400_BDATAL 0x1A
> +#define TCS3400_ID 0x12
> +#define TCS3400_CHSEL 0xC0 /* Access IR channel: 0x00 RGBC, 0x80 RGB-IR */
> +#define TCS3400_EN_PON BIT(0)
Fine a way to clearly associate fields with register.
Normally repeat the prefix. So this is maybe
TCS3400_ENABLE_PON

Put the fields with each register address define and it is
worth looking at some of the indentation tweaks we often
do to make it easier to read.


> +#define TCS3400_EN_AEN BIT(1)
> +#define TCS3400_EN_AIEN BIT(4)
> +#define TCS3400_STATUS_AVALID BIT(0)
> +#define TCS3400_STATUS_AINT BIT(4)
> +#define TCS3400_GAIN_1X 0x00
> +#define TCS3400_GAIN_4X 0x01
> +#define TCS3400_GAIN_16X 0x02
> +#define TCS3400_GAIN_64X 0x03
> +#define TCS3400_MAX_ATIME 256
> +
> +#define TCS3400_IIO_CHANNEL(_index, _mod) { \
> +	.type = IIO_INTENSITY, \
> +	.modified = 1, \
> +	.channel2 = IIO_MOD_##_mod, \
> +	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) | \
> +			      BIT(IIO_CHAN_INFO_SCALE), \
> +			      BIT(IIO_CHAN_INFO_SCALE) | \
> +			      BIT(IIO_CHAN_INFO_INT_TIME), \
> +	.indexed = 1, \
> +	.channel = _index, \
> +	.scan_index = _index, \
> +	.scan_type = { \
> +		.sign = 'u', \
> +		.realbits = 16, \
> +		.storagebits = 16, \
> +		.endianness = IIO_LE, \

Looks wrong with a le16_to_cpu in the read path.
Arguably that shouldn't be in the buffered path, but given it's i2c and
the cost of even talking to the device is high I don't mind if that
simplifies your code.


> +	}, \
> +}
> +
> +struct tcs3400_data {
> +	struct i2c_client *client;
> +	struct mutex lock;
> +	struct regulator *vdd_supply;
> +	u8 atime;
> +	u8 gain;
> +	u8 channel_mode; /* 0x00 or 0x80 */
> +	u16 clear_ir; /* clear when mode=0x00, IR when mode=0x80 */

Sounds like you should control your ir_mode based on what channel is requested
not a separate attribute that changes the meaning of the data.

> +	u16 red;
> +	u16 green;
> +	u16 blue;
> +};
> +
> +static const int tcs3400_gains[] = {1, 4, 16, 64};

 = { 1, 4, 16, 64 };

is the preferred formatting in IIO.

> +
> +static int tcs3400_power_on(struct tcs3400_data *data)
> +{
> +	int ret;
> +
> +	ret = regulator_enable(data->vdd_supply);
> +	if (ret)
> +		return ret;
> +
> +	msleep(20);
> +
> +	return 0;
> +}
> +
> +static void tcs3400_power_off(struct tcs3400_data *data)
> +{
> +	regulator_disable(data->vdd_supply);
After changes suggested below, this will not be needed.
> +}
> +
> +static int tcs3400_write_reg(struct tcs3400_data *data, u8 reg, u8 val)
> +{
> +	return i2c_smbus_write_byte_data(data->client, TCS3400_CMD_REG(reg), val);
> +}
> +
> +static int tcs3400_read_reg(struct tcs3400_data *data, u8 reg, u8 *val)
> +{
> +	int ret = i2c_smbus_read_byte_data(data->client, TCS3400_CMD_REG(reg));
> +
> +	if (ret < 0)
> +		return ret;
> +	*val = ret;
> +
> +	return 0;
> +}
> +
> +static int tcs3400_read_word(struct tcs3400_data *data, u8 reg, u16 *val)
> +{
> +
> +	__le16 buf;
> +	int ret = i2c_smbus_read_i2c_block_data(data->client,
> +						TCS3400_CMD_REG(reg), 2, (u8 *)&buf);

sizeof(buf) rather than 2.

> +	if (ret < 0)
> +		return ret;
> +	*val = le16_to_cpu(buf);
> +	return 0;
> +}
> +static int tcs3400_clear_interrupt(struct tcs3400_data *data)
> +{
> +
> +	return i2c_smbus_write_byte(data->client, TCS3400_CMD_ALS_INT_CLR);
> +}
> +
> +static int tcs3400_read_channels(struct tcs3400_data *data)
> +{
> +
> +	int ret, retries = 20;
> +	u8 status;
> +
> +	do {
> +		ret = tcs3400_read_reg(data, TCS3400_STATUS, &status);
> +		if (ret)
> +			return ret;
> +		if (status & TCS3400_STATUS_AVALID)
> +			break;
> +		usleep_range(5000, 6000);

Need a comment on why this sleep.  Mostly likely fsleep will be better choice.

> +	} while (--retries);
> +	if (!retries) {
> +		dev_warn(&data->client->dev, "Timeout waiting for valid data\n");
> +		return -ETIMEDOUT;
> +	}
> +	ret = tcs3400_read_word(data, TCS3400_CDATAL, &data->clear_ir);
> +	if (ret)
> +		return ret;
> +
> +	ret = tcs3400_read_word(data, TCS3400_RDATAL, &data->red);
> +	if (ret)
> +		return ret;
> +
> +	ret = tcs3400_read_word(data, TCS3400_GDATAL, &data->green);
> +	if (ret)
> +		return ret;
> +
> +	ret = tcs3400_read_word(data, TCS3400_BDATAL, &data->blue);

Datasheet is really vague on how much of the i2c protocol is supported.
Any idea if bulk reads are an option?

If not I'd suggest for read_raw at least you read only what is actually wanted.
I2C busses are pretty slow! Might even be worth doing that for buffered
reads.


> +	if (ret)
> +		return ret;
> +	return 0;
return tcs...

> +}
> +
> +static irqreturn_t tcs3400_trigger_handler(int irq, void *p)
> +{
> +	struct iio_poll_func *pf = p;
> +	struct iio_dev *indio_dev = pf->indio_dev;
> +	struct tcs3400_data *data = iio_priv(indio_dev);
> +	u16 buf[4];
> +	int ret;
> +
> +	mutex_lock(&data->lock);
> +	ret = tcs3400_read_channels(data);
> +	if (!ret) {		
> +		buf[0] = data->clear_ir;
> +		buf[1] = data->red;
> +		buf[2] = data->green;
> +		buf[3] = data->blue;
> +		iio_push_to_buffers_with_timestamp(indio_dev, buf,
> +						   iio_get_time_ns(indio_dev));

Use iio_push_to_buffers_with_ts() and fix the error you'll see as a result.
This function is deprecated because it makes it too easy to write a bug
like you have done where the timestamp is off the end of the buffer.

> +	}
> +	mutex_unlock(&data->lock);
> +
> +	iio_trigger_notify_done(indio_dev->trig);
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t tcs3400_irq_handler(int irq, void *priv)
> +{
> +	struct iio_dev *indio_dev = priv;
> +	struct tcs3400_data *data = iio_priv(indio_dev);
> +	int ret;
> +
> +	mutex_lock(&data->lock);
> +	ret = tcs3400_read_channels(data);
> +	if (!ret)
> +		iio_trigger_poll_nested(indio_dev->trig);

I'm not sure what intent of this is... You seem to be poking a
trigger that wasn't yours. That's a hard no as it could
do absolutely anything.

Superficially it looks like the driver should be registering
a trigger of it's own and at least some of this logic
belongs on that side of the trigger / device driver
boundary.

> +
> +	tcs3400_clear_interrupt(data);
> +	mutex_unlock(&data->lock);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int tcs3400_read_raw(struct iio_dev *indio_dev,
> +			    struct iio_chan_spec const *chan,
> +			    int *val, int *val2, long mask)
> +{
> +	struct tcs3400_data *data = iio_priv(indio_dev);
> +	int ret;
> +
> +	mutex_lock(&data->lock);
> +	ret = tcs3400_read_channels(data);
> +	if (ret) {
> +		mutex_unlock(&data->lock);
Guard will help here as well. See below.

> +		return ret;
> +	}
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		switch (chan->channel2) {
> +		case IIO_MOD_LIGHT_CLEAR:
> +			*val = data->clear_ir;
> +			break;
> +		case IIO_MOD_LIGHT_RED:
> +			*val = data->red;
> +			break;
> +		case IIO_MOD_LIGHT_GREEN:
> +			*val = data->green;
> +			break;
> +		case IIO_MOD_LIGHT_BLUE:
> +			*val = data->blue;
> +			break;
> +		default:
> +			ret = -EINVAL;
> +			break;
> +		}
> +		ret = IIO_VAL_INT;
> +		break;
> +	case IIO_CHAN_INFO_INT_TIME:
> +		*val = 0;
> +		*val2 = (TCS3400_MAX_ATIME - data->atime) * 2780000; /* 2.78 ms per cycle */
> +		ret = IIO_VAL_INT_PLUS_MICRO;
> +		break;
> +	default:
> +		ret = -EINVAL;
> +	}
> +	mutex_unlock(&data->lock);

Use a guard() and early returns so the code flow is simpler.

> +
> +	return ret;
> +}

> +
> +static const struct iio_chan_spec tcs3400_channels[] = {
> +	TCS3400_IIO_CHANNEL(0, LIGHT_CLEAR),
> +	TCS3400_IIO_CHANNEL(1, LIGHT_RED),
> +	TCS3400_IIO_CHANNEL(2, LIGHT_GREEN),
> +	TCS3400_IIO_CHANNEL(3, LIGHT_BLUE),
> +	IIO_CHAN_SOFT_TIMESTAMP(4),
> +};
> +
> +static ssize_t tcs3400_enable_show(struct device *dev,
> +				   struct device_attribute *attr,
> +				   char *buf)
> +{
> +	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
> +	struct tcs3400_data *data = iio_priv(indio_dev);
> +	u8 enable;
> +	int ret;
> +
> +	ret = tcs3400_read_reg(data, TCS3400_ENABLE, &enable);
> +	if (ret)
> +		return ret;
> +	return sprintf(buf, "%d\n", !!(enable & (TCS3400_EN_PON | TCS3400_EN_AEN)));
> +}
> +
> +static ssize_t tcs3400_enable_store(struct device *dev,
> +				    struct device_attribute *attr,
> +				    const char *buf, size_t len)
> +{
> +	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
> +	struct tcs3400_data *data = iio_priv(indio_dev);
> +	bool enable;
> +	int ret;
> +	u8 val;
> +
> +	ret = kstrtobool(buf, &enable);
> +	if (ret)
> +		return ret;
> +	mutex_lock(&data->lock);
> +	if (enable)
> +		val = TCS3400_EN_PON | TCS3400_EN_AEN;
> +	else
> +		val = 0;

Not clear why you set up val under the lock.  Keep lock
scope minimal where it doesn't hurt readability.


> +	ret = tcs3400_write_reg(data, TCS3400_ENABLE, val);
> +	mutex_unlock(&data->lock);
> +	if (ret)
> +		return ret;
> +
> +	if (enable)
> +		msleep(20);
> +	return len;
> +}
> +
> +static ssize_t tcs3400_ir_mode_show(struct device *dev,
> +				    struct device_attribute *attr,
> +				    char *buf)
> +{
> +	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
> +	struct tcs3400_data *data = iio_priv(indio_dev);
> +
> +	return sprintf(buf, "%d\n", !!data->channel_mode);
> +}
> +
> +static ssize_t tcs3400_ir_mode_store(struct device *dev,
> +				     struct device_attribute *attr,
> +				     const char *buf, size_t len)
> +{
> +	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
> +	struct tcs3400_data *data = iio_priv(indio_dev);
> +	bool enable;
> +	int ret;
> +
> +	ret = kstrtobool(buf, &enable);
> +	if (ret)
> +		return ret;
> +	mutex_lock(&data->lock);
> +	data->channel_mode = enable ? 0x80 : 0x00;

Looks like it's setting 1 bit. Probably want a define for that field's mask.
Is there anything else in that register?

> +	ret = tcs3400_write_reg(data, TCS3400_CHSEL, data->channel_mode);
> +	mutex_unlock(&data->lock);
> +	return ret ? ret : len;
> +}
> +
> +static IIO_DEVICE_ATTR(enable, 0644, tcs3400_enable_show, tcs3400_enable_store, 0);
> +static IIO_DEVICE_ATTR(ir_mode, 0644, tcs3400_ir_mode_show, tcs3400_ir_mode_store, 0);
> +
> +static struct attribute *tcs3400_attributes[] = {
> +	&iio_dev_attr_enable.dev_attr.attr,
Why?  Generally expect a light sensor to be enabled and disabled automatically 
based on other config. E.g. whether we have asked for data, enabled buffered capture
or turned events on.

> +	&iio_dev_attr_ir_mode.dev_attr.attr,

Looks like custom ABI.  This is hard to get through review, but starting point
is an ABI document in Documentation/ABI/testing/sysfs-bus-iio-*
so we can easily see what the interface is.

> +	NULL
> +};
> +
> +static const struct attribute_group tcs3400_attribute_group = {
> +	.attrs = tcs3400_attributes,
> +};
> +
> +static const struct iio_info tcs3400_info = {
> +	.read_raw = tcs3400_read_raw,
> +	.write_raw = tcs3400_write_raw,
> +	.attrs = &tcs3400_attribute_group,
> +};
> +
> +static int tcs3400_probe(struct i2c_client *client)
> +{
> +	struct tcs3400_data *data;
> +	struct iio_dev *indio_dev;
> +	int ret;
> +	u8 id;
> +
> +	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
> +	if (!indio_dev)
> +		return -ENOMEM;
> +
> +	data = iio_priv(indio_dev);
> +	data->client = client;
> +	mutex_init(&data->lock);

	ret = devm_mutex_init() in new code.

> +
> +	i2c_set_clientdata(client, indio_dev);

Check if you still need this after the other changes suggested below.

> +
> +	data->vdd_supply = devm_regulator_get(&client->dev, "vdd");
> +	if (IS_ERR(data->vdd_supply))
> +		return dev_err_probe(&client->dev, PTR_ERR(data->vdd_supply),
> +				     "Unable to get VDD regulator\n");
> +
> +	ret = tcs3400_power_on(data);

Given you only turn it on at probe and off at remove
devm_regulator_get_enable() is something you should be using.  Then just
code the sleep inline here.

> +	if (ret)
> +		goto err_power_off;
> +
> +	ret = i2c_smbus_read_byte_data(client, TCS3400_CMD_REG(TCS3400_ID));
> +	if (ret < 0) {
> +		ret = -ENODEV;
> +		goto err_power_off;
> +		return ret;
> +	}
> +
> +	id = ret;
> +	if (id == 0x90)
> +		dev_info(&client->dev, "TCS3401/5 Chip ID: 0x%02x\n", id);
> +	if (id == 0x93)
> +		dev_info(&client->dev, "TCS3403/7 Chip ID: 0x%02x\n", id);
> +	else {
> +		dev_err(&client->dev, "Unknown chip ID: 0x%02x\n", id);
> +		ret = -ENODEV;

you set ret then do nothing with it.  However, you should only dev_info
on a mismatch anyway as failing probe on an ID miss match breaks the
dt concept of fallback compatibles.   If the ID is miss matched, follow what
the firmware told you it was.

> +	}
> +
> +	data->atime = 0xF6; /* ~27.8 ms integration */
> +	data->gain = TCS3400_GAIN_1X;
> +	data->channel_mode = 0x00;
> +
> +	tcs3400_write_reg(data, TCS3400_ATIME, data->atime);

These look likely to need error checks.

> +	tcs3400_write_reg(data, TCS3400_CONTROL, data->gain);
> +	tcs3400_write_reg(data, TCS3400_PERSIST, 0x00); /* interrupt every cycle */

This seems like you have a data ready interrupt. Look at how we register
triggers for those in other drivers.

> +	tcs3400_write_reg(data, TCS3400_CHSEL, data->channel_mode); /* RGBC mode */
> +
> +	tcs3400_write_reg(data, TCS3400_ENABLE,
> +			  TCS3400_EN_PON | TCS3400_EN_AEN | TCS3400_EN_AIEN);
> +
> +	indio_dev->name = TCS3400_DRV_NAME;

Prefer it hard coded string inline here.  There is no particular reason
it should match the driver name, particularly as you are adding multiple
part support. It should match what you think the part is.

> +	indio_dev->channels = tcs3400_channels;
> +	indio_dev->num_channels = ARRAY_SIZE(tcs3400_channels);
> +	indio_dev->info = &tcs3400_info;
> +	indio_dev->modes = INDIO_DIRECT_MODE | INDIO_BUFFER_TRIGGERED;

Look for whether other drivers do this (and more importantly why they don't).

> +
> +	ret = devm_iio_triggered_buffer_setup(&client->dev, indio_dev,
> +					      NULL,
> +					      tcs3400_trigger_handler,
> +					      NULL);
> +	if (ret)
> +		goto err_power_off;
> +	if (client->irq > 0) {
> +		ret = devm_request_threaded_irq(&client->dev, client->irq,
> +						NULL, tcs3400_irq_handler,
> +						IRQF_TRIGGER_FALLING | IRQF_ONESHOT,

Firmware is responsible for direction of irq in modern drivers.
We have some historical ones we can't risk 'fixing' this in. So should 
be just IRQF_ONESHOT.


> +						"tcs3400_irq", indio_dev);
> +		if (ret)
> +			goto err_power_off;
> +	}
> +
> +	ret = devm_iio_device_register(&client->dev, indio_dev);
> +	if (ret)
> +		goto err_power_off;
> +	return 0;
> +err_power_off:
> +	tcs3400_write_reg(data, TCS3400_ENABLE, 0);
> +	tcs3400_power_off(data);
> +	return ret;
> +}
> +
> +static void tcs3400_remove(struct i2c_client *client)
> +{
> +	struct iio_dev *indio_dev = i2c_get_clientdata(client);
> +	struct tcs3400_data *data = iio_priv(indio_dev);
> +
> +	tcs3400_write_reg(data, TCS3400_ENABLE, 0);
> +	tcs3400_power_off(data);

Look at how and when devm managed cleanup happens.  This is turning the
power off before removing the userspace interfaces, never
a recipe for success! :)

Hint, see how we use devm_add_action_or_reset for this sort of driver
specific cleanup -> that ensures correct sequencing and allows
you to pair turn off with turn on.


> +}



