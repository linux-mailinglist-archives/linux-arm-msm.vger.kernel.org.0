Return-Path: <linux-arm-msm+bounces-106579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOR2D15//WnnegAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 08:14:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 412D14F24F5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 08:14:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 665A6301C030
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 06:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3577B3328FC;
	Fri,  8 May 2026 06:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="af9Aq9W0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A7834B1A4
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 06:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778220714; cv=none; b=jJODVDZuk4gG573wiCPEm1dTfR8L8Iu1ATw8zhM0X/7Jj6haFQqhTRxnmWHZtDZIFQeimarwHAwwJ7+B5VypxKYlFmp93i0NKV7qf01tI4/MBVK7fXEioPFL5nYSJotqUVhKjHwFT+/uxmw2loOdoYTmDydm+9b0HFhkLzi35Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778220714; c=relaxed/simple;
	bh=UOMQRXoAVwk70uaufZhCWFNt7EA3VOTwF7G0ARoU3VM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ccwG9R89zIQesfqaMTf2lAt66yYCVY4A9SyT3N5+QZ7RUdipxEI0KSMHKtSsV1T4ujHQfvJs1LVbKhePn+LnbP4M0NS8vIw5JIItK8MCMRKOw5hmtVvVTLuRKmrjjykaRqsTD5K87s/mk0i1CtHJGfuTfSzKCjnMaR0qT+awLEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=af9Aq9W0; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2c15849aa2cso2113580eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 23:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778220704; x=1778825504; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jXb0SR/K0dwEQwnGYT+FJTHi8ls55dvpbTwOnKCIOSw=;
        b=af9Aq9W0YoPBm3194Lof4H08dGP+IF1d0al6sFdkh25soZ66jiCO1V56mxofiQLRJ1
         eS29CYpT7QFelcSRA652MmQA4IzaC9kXNqM7iiKrvPPacrX3MP+ZwdlSIUs6VOVpYi9B
         d98xZfJPhigLxZYybmnXEW6phB0VJUA13jsXMmLZekAV94oI0DCV46Zv0NkpTMH4MtQQ
         NyvdNSRG/TOyc1wlWiwT9tQG8ytP7EqafxbQKQP6zBffcx5QnC9qk/41pQDKKW4PAt7u
         gh9jzhkmp3sDLj24NDARc8itE86iV1UMnvsDT3U4YP1rfnsFzrsSxRCvfuSbE4lpjxHU
         HU+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778220704; x=1778825504;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jXb0SR/K0dwEQwnGYT+FJTHi8ls55dvpbTwOnKCIOSw=;
        b=GEtagRztcP4Qy/huBLLYWVuMxWJ7CdQNCwfnt66Nwenae8JTf4n1xcMSwEvZIS0pQs
         dsS5EeKihAgO0SyWpcydJBkaIsPeEJH5hHnWh62mBzKPX71fQ6qEjnv2NiQTwDSJNa6y
         B3Itb1aZheTa1lkdheEDsi5driOtYMex7/6/QfFkmw3oCGTGsKEkSGhE2puFBulfS2EX
         LfJXWJEzmO9He+sH/g+nyQQaIRtHNluv8QrsjK9YI6YWhH/v3TR93dQxajcrfEVPjyo1
         WA3a7e1xI46HOuXXghcYtK/hSIN092Y1d9tww2tcZOBL05uF0buodqmLmUFziUcFoevX
         e1iw==
X-Forwarded-Encrypted: i=1; AFNElJ8pUS4Qdf2yITmdhfJkjW9jVn6YooEAsFLGT3AFZBa59gYxaUeR3Pn+9suzzlYva+5xW3WmfrlDavM82OTd@vger.kernel.org
X-Gm-Message-State: AOJu0YyEhD9GXC8pcbeybt8YpPzXtZtQhpGSGChw4rC5HhEsPK7SYj8L
	MWZHqZoSST8zh1CeaH/eVXaj4ke5b4sI5gj9t+2pbc4iLpAG2g4aQkRp
X-Gm-Gg: Acq92OEnOiX/2AFqeSMf35pPE17LUDQCF0ock0H73VRbvqZqZlLt+9DaILJi8HWqRIe
	+vzSzxAEyM5xnuHKavyTpDZpGQwmk0wXGywzmrgnPJFRyy5vpRqSVUNPMdHaUhnRMw7JOx7UZ4/
	xBgLG1I3UKWToMBb5WaB58SQo7CFhwoZPOUHiH8YJtu68TGV7HXTu336KSU1Suwm6LfIDN2mq4Z
	9k/lA/4ksTqT8xPXNvbd4zpDSpKkQkD4N7jeXnAzGEtzVfjCnfz+7VoeMd7GhwVQoLdUhyrBymV
	AFORFoL63mFX+EJCglTsZpH6v5m8mYj3/LcfOMY+n8ewmtVuwRjtVkgU6e7jPGoJhKRAuoyZ9sG
	Ab51L2XBuOJtX1W03dmjLeAhaXPuQL7BrwQCDg2qYCYG7LfPxWLWlP0OAC5TAm7JalJ8mMcQcrW
	I2zMv0slmmNcCiJTD73YpIcXYwCbDLm0Mj5bZJopYuJ74RGQKVhxRjt74jWNgcBzNFfORdCfObn
	ts=
X-Received: by 2002:a05:693c:2b08:b0:2ea:cd38:f921 with SMTP id 5a478bee46e88-2f54aa78245mr5844784eec.26.1778220703475;
        Thu, 07 May 2026 23:11:43 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:852e:ebf3:8de1:32e1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888e3e285sm1132502eec.27.2026.05.07.23.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 23:11:42 -0700 (PDT)
Date: Thu, 7 May 2026 23:11:39 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: david@ixit.cz
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Petr Hodina <petr.hodina@protonmail.com>, 
	linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 10/11] Input: stmfts - support FTS5
Message-ID: <af13d0-zM8Qjtjcj@google.com>
References: <20260409-stmfts5-v4-0-64fe62027db5@ixit.cz>
 <20260409-stmfts5-v4-10-64fe62027db5@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409-stmfts5-v4-10-64fe62027db5@ixit.cz>
X-Rspamd-Queue-Id: 412D14F24F5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106579-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,foss.st.com,kernel.org,bitmath.org,protonmail.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi David,

On Thu, Apr 09, 2026 at 12:15:53AM +0200, David Heidelberg via B4 Relay wrote:
> @@ -101,12 +129,27 @@ struct stmfts_data {
>  
>  	struct completion cmd_done;
>  
> +	unsigned long touch_id;
> +	unsigned long stylus_id;

I wonder why do you track contacts yourself instead of telling input
core to do it for you and report BTN_TOUCH as needed? You just need to
call input_mt_sync_frame() when you are done processing input frame.

Does the device send all contacts state in one transmission or it can
transmit contacts one by one?

> +
> +	/* Boundary check - some devices report max value, adjust */
> +	if (x >= sdata->prop.max_x)
> +		x = sdata->prop.max_x - 1;
> +	if (y >= sdata->prop.max_y)
> +		y = sdata->prop.max_y - 1;

It is allowed to exceed declared min and max, so this clampin is not
needed.

>  
> +static int stmfts5_set_scan_mode(struct stmfts_data *sdata, const u8 val)
> +{
> +	int err;
> +
> +	u8 scan_mode_cmd[3] = { STMFTS5_SET_SCAN_MODE, 0x00, val };
> +	struct i2c_msg msg = {
> +		.addr = sdata->client->addr,
> +		.len = sizeof(scan_mode_cmd),
> +		.buf = scan_mode_cmd,
> +	};
> +
> +	err = i2c_transfer(sdata->client->adapter, &msg, 1);

Is this i2c_master_send()?

> +	if (err != 1)
> +		return err < 0 ? err : -EIO;
> +
> +	return 0;
> +
> +}
> +
>  static int stmfts_input_open(struct input_dev *dev)
>  {
>  	struct stmfts_data *sdata = input_get_drvdata(dev);
> @@ -371,6 +622,28 @@ static int stmfts_input_open(struct input_dev *dev)
>  	return 0;
>  }
>  
> +static int stmfts5_input_open(struct input_dev *dev)
> +{
> +	struct stmfts_data *sdata = input_get_drvdata(dev);
> +	int err;
> +
> +	err = pm_runtime_resume_and_get(&sdata->client->dev);
> +	if (err)
> +		return err;
> +
> +	mutex_lock(&sdata->mutex);
> +	sdata->running = true;
> +	mutex_unlock(&sdata->mutex);

	scoped_guard(mutex, &sdata->mutex)
		sdata->running;

> +
> +	err = stmfts5_set_scan_mode(sdata, 0xff);
> +	if (err) {
> +		pm_runtime_put_sync(&sdata->client->dev);

Reset "running"?

> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
>  static void stmfts_input_close(struct input_dev *dev)
>  {
>  	struct stmfts_data *sdata = input_get_drvdata(dev);
> @@ -404,6 +677,23 @@ static void stmfts_input_close(struct input_dev *dev)
>  	pm_runtime_put_sync(&sdata->client->dev);
>  }
>  
> +static void stmfts5_input_close(struct input_dev *dev)
> +{
> +	struct stmfts_data *sdata = input_get_drvdata(dev);
> +	int err;
> +
> +	err = stmfts5_set_scan_mode(sdata, 0x00);
> +	if (err)
> +		dev_warn(&sdata->client->dev,
> +			 "failed to disable touchscreen: %d\n", err);
> +
> +	mutex_lock(&sdata->mutex);
> +	sdata->running = false;
> +	mutex_unlock(&sdata->mutex);

scoped_guard()

> +
> +	pm_runtime_put_sync(&sdata->client->dev);
> +}
> +
>  static ssize_t stmfts_sysfs_chip_id(struct device *dev,
>  				struct device_attribute *attr, char *buf)
>  {
> @@ -484,10 +774,8 @@ static ssize_t stmfts_sysfs_hover_enable_write(struct device *dev,
>  	guard(mutex)(&sdata->mutex);
>  
>  	if (hover != sdata->hover_enabled) {
> -		if (sdata->running) {
> -			err = i2c_smbus_write_byte(sdata->client,
> -					   value ? STMFTS_SS_HOVER_SENSE_ON :
> -						   STMFTS_SS_HOVER_SENSE_OFF);
> +		if (sdata->running && sdata->ops->set_hover) {
> +			err = sdata->ops->set_hover(sdata, hover);
>  			if (err)
>  				return err;
>  		}
> @@ -612,7 +900,7 @@ static int stmfts_power_on(struct stmfts_data *sdata)
>  	if (sdata->reset_gpio)
>  		stmfts_reset(sdata);
>  
> -	err = stmfts_configure(sdata);
> +	err = sdata->ops->configure(sdata);
>  	if (err)
>  		regulator_bulk_disable(ARRAY_SIZE(stmfts_supplies),
>  				       sdata->supplies);
> @@ -620,6 +908,29 @@ static int stmfts_power_on(struct stmfts_data *sdata)
>  	return err;
>  }
>  
> +static int stmfts5_configure(struct stmfts_data *sdata)
> +{
> +	u8 event[STMFTS_EVENT_SIZE];
> +	int ret;
> +
> +	/* Verify I2C communication */
> +	ret = i2c_smbus_read_i2c_block_data(sdata->client,
> +					    STMFTS_READ_ALL_EVENT,
> +					    sizeof(event), event);
> +	if (ret < 0)
> +		return ret;
> +
> +	enable_irq(sdata->client->irq);
> +
> +	return 0;
> +}
> +
> +static void stmfts5_chip_power_off(struct stmfts_data *sdata)
> +{
> +	i2c_smbus_write_byte(sdata->client, STMFTS_SLEEP_IN);
> +	msleep(20);
> +}
> +
>  static void stmfts_power_off(void *data)
>  {
>  	struct stmfts_data *sdata = data;
> @@ -629,10 +940,73 @@ static void stmfts_power_off(void *data)
>  	if (sdata->reset_gpio)
>  		gpiod_set_value_cansleep(sdata->reset_gpio, 1);
>  
> +	if (sdata->ops->power_off)
> +		sdata->ops->power_off(sdata);
> +
>  	regulator_bulk_disable(ARRAY_SIZE(stmfts_supplies),
>  			       sdata->supplies);
>  }
>  
> +static int stmfts_setup_input(struct stmfts_data *sdata)
> +{
> +	struct device *dev = &sdata->client->dev;
> +
> +	input_set_abs_params(sdata->input, ABS_MT_ORIENTATION, 0, 255, 0, 0);
> +	input_set_abs_params(sdata->input, ABS_DISTANCE, 0, 255, 0, 0);
> +
> +	sdata->use_key = device_property_read_bool(dev, "touch-key-connected");
> +	if (sdata->use_key) {
> +		input_set_capability(sdata->input, EV_KEY, KEY_MENU);
> +		input_set_capability(sdata->input, EV_KEY, KEY_BACK);
> +	}
> +
> +	return input_mt_init_slots(sdata->input, STMFTS_MAX_FINGERS,
> +				   INPUT_MT_DIRECT);
> +}
> +
> +static int stmfts5_setup_input(struct stmfts_data *sdata)
> +{
> +	struct device *dev = &sdata->client->dev;
> +
> +	sdata->mode_switch_gpio = devm_gpiod_get_optional(dev, "mode-switch",
> +							  GPIOD_OUT_HIGH);
> +	if (IS_ERR(sdata->mode_switch_gpio))
> +		return dev_err_probe(dev, PTR_ERR(sdata->mode_switch_gpio),
> +				     "Failed to get GPIO 'switch'\n");
> +
> +	/* Mark as direct input device for calibration support */
> +	__set_bit(INPUT_PROP_DIRECT, sdata->input->propbit);
> +
> +	/* Set up basic touch capabilities */
> +	input_set_capability(sdata->input, EV_KEY, BTN_TOUCH);

This will be done by input_mt_init_slots(..., INPUT_MT_DIRECT). 

> +
> +	/* Set resolution for accurate calibration */
> +	if (!input_abs_get_res(sdata->input, ABS_MT_POSITION_X)) {
> +		input_abs_set_res(sdata->input, ABS_MT_POSITION_X, 10);
> +		input_abs_set_res(sdata->input, ABS_MT_POSITION_Y, 10);
> +	}
> +
> +	input_set_abs_params(sdata->input, ABS_MT_DISTANCE, 0, 255, 0, 0);
> +
> +	/* Enable stylus support if requested */
> +	sdata->stylus_enabled = device_property_read_bool(dev, "stylus-enabled");
> +
> +	/* Initialize touch tracking bitmaps */
> +	sdata->touch_id = 0;
> +	sdata->stylus_id = 0;
> +
> +	/* Initialize MT slots with support for pen tool type */
> +	return input_mt_init_slots(sdata->input, STMFTS_MAX_FINGERS,
> +				   INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);

Why INPUT_MT_DROP_UNUSED?

> +}
> +
> +static int stmfts_set_hover(struct stmfts_data *sdata, bool enable)
> +{
> +	return i2c_smbus_write_byte(sdata->client,
> +				    enable ? STMFTS_SS_HOVER_SENSE_ON :
> +					     STMFTS_SS_HOVER_SENSE_OFF);
> +}
> +
>  static int stmfts_enable_led(struct stmfts_data *sdata)
>  {
>  	int err;
> @@ -678,6 +1052,8 @@ static int stmfts_probe(struct i2c_client *client)
>  	mutex_init(&sdata->mutex);
>  	init_completion(&sdata->cmd_done);
>  
> +	sdata->ops = of_device_get_match_data(dev);
> +
>  	err = devm_regulator_bulk_get_const(dev,
>  					    ARRAY_SIZE(stmfts_supplies),
>  					    stmfts_supplies,
> @@ -697,8 +1073,8 @@ static int stmfts_probe(struct i2c_client *client)
>  
>  	sdata->input->name = STMFTS_DEV_NAME;
>  	sdata->input->id.bustype = BUS_I2C;
> -	sdata->input->open = stmfts_input_open;
> -	sdata->input->close = stmfts_input_close;
> +	sdata->input->open = sdata->ops->input_open;
> +	sdata->input->close = sdata->ops->input_close;
>  
>  	input_set_capability(sdata->input, EV_ABS, ABS_MT_POSITION_X);
>  	input_set_capability(sdata->input, EV_ABS, ABS_MT_POSITION_Y);
> @@ -706,19 +1082,9 @@ static int stmfts_probe(struct i2c_client *client)
>  
>  	input_set_abs_params(sdata->input, ABS_MT_TOUCH_MAJOR, 0, 255, 0, 0);
>  	input_set_abs_params(sdata->input, ABS_MT_TOUCH_MINOR, 0, 255, 0, 0);
> -	input_set_abs_params(sdata->input, ABS_MT_ORIENTATION, 0, 255, 0, 0);
>  	input_set_abs_params(sdata->input, ABS_MT_PRESSURE, 0, 255, 0, 0);
> -	input_set_abs_params(sdata->input, ABS_DISTANCE, 0, 255, 0, 0);
> -
> -	sdata->use_key = device_property_read_bool(dev,
> -						   "touch-key-connected");
> -	if (sdata->use_key) {
> -		input_set_capability(sdata->input, EV_KEY, KEY_MENU);
> -		input_set_capability(sdata->input, EV_KEY, KEY_BACK);
> -	}
>  
> -	err = input_mt_init_slots(sdata->input,
> -				  STMFTS_MAX_FINGERS, INPUT_MT_DIRECT);
> +	err = sdata->ops->setup_input(sdata);
>  	if (err)
>  		return err;
>  
> @@ -789,13 +1155,62 @@ static int stmfts_runtime_suspend(struct device *dev)
>  	return ret;
>  }
>  
> -static int stmfts_runtime_resume(struct device *dev)
> +static int stmfts_chip_runtime_resume(struct stmfts_data *sdata)
> +{
> +	return i2c_smbus_write_byte(sdata->client, STMFTS_SLEEP_OUT);
> +}
> +
> +static int stmfts5_chip_runtime_resume(struct stmfts_data *sdata)
>  {
> -	struct stmfts_data *sdata = dev_get_drvdata(dev);
>  	struct i2c_client *client = sdata->client;
> +	struct device *dev = &client->dev;
> +	u8 int_enable_cmd[4] = {0xB6, 0x00, 0x2C, 0x01};
> +	struct i2c_msg msg = {
> +		.addr = client->addr,
> +		.len = sizeof(int_enable_cmd),
> +		.buf = int_enable_cmd,
> +	};
>  	int ret;

"int err" everywhere where the variable carries error code or 0.


Thanks.

-- 
Dmitry

