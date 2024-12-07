Return-Path: <linux-arm-msm+bounces-40882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 995CD9E8254
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2024 22:45:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3AD3F28138B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2024 21:45:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E3CF15442A;
	Sat,  7 Dec 2024 21:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jlcu0dru"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB3834CC4
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Dec 2024 21:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733607926; cv=none; b=jAvmFKqRPpFv3TqLCEwgcVWtKt+flknniyBnisBAiCPi04RqslZybcHGjvjof7QLgm19DnLQdvTdWzrgat2kFn94XMYmVa9dJlQ8hGD2keCkFC00Nqs3TKuCPPsAvAD9WjghcIFgZv2XR3z/I2mpJl0eRm68xsRHcK2/yS/RMgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733607926; c=relaxed/simple;
	bh=GbMfEyZyfTl+hvcqFwByJfYLIt1azHdQcL6t3uoWWiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nYt/c6stBht9Rqz5+nfiIkRRAG5fPOnbf+LDaIiWM8vYbvOusXRudtUwdj0qb2MTrCAufaTtJKKwNl/ytIShsIKc0moi4faPIklfSb3qzmJrz1VDENH9JwV0EqxxRtCnsG+VB3smjYNA3YhTOzIzpwpLFo6FCOqpA1FoosmyQO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jlcu0dru; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-434ab938e37so20534945e9.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Dec 2024 13:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733607922; x=1734212722; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lxgoGBdhls5nv4ek0xiKWIbddWaRl6jEQoHyge208ao=;
        b=Jlcu0drucuxaECxJ8WSjfJz4fa56qwRAleYhnJcc8bYarn9rIVNnN3G6hRbyGaQD1L
         nDUP37RielDYPoWK90HlQ3nejKY4XwSXbm14KqmByJ6UPqdJ5Zbf/EJtMakb7/52LPxH
         qwsNUz4eTzcIFUe0rw6MfdZcg9zsaA1l9SQcXmN/jZOME/EINxf9SGoVC9dfbpBvQ90a
         zsBLNnuF76lJr9UPp7zZdeVXEnU3vp5YG0yWfujP59luUMvOcWbtW9j12GbwRqOee/q4
         aWJq6jJuotSqhBdTFq8zzV7ZGjDef2BfUix4UfX7Ul5gFRsXymgkw4orndPwoUzDLdt+
         lxNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733607922; x=1734212722;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lxgoGBdhls5nv4ek0xiKWIbddWaRl6jEQoHyge208ao=;
        b=B733WnrIWbQeiduuiT84kx/3I7s/fq0AxGhDCQ3nHP5RIUcO1zndFtn3k5AH6ueHgy
         gnQwf0dC+MR6BFEoSdMLeFNochTD2E1WGqJr7OieOmk5kCwbWkdQSzxXhBUSyGkZzuhU
         S0Z3wp+/PDmmffI/OOaNZSsL4joGGSK5CNFHJe6haybId/CrxvLTm6kJ4tQzLD4ZvXj8
         ZSGxaM1ud6BDwglLcsjRlSRjgt8Wsxx1mlD0GQB3RiL1IFEACBvsGf7AB9GN+0YCM2sf
         9EWdAdCSZcOwgVl3DvxWw/wm1isdtiY7VblEmrBW5ib1+R09J0xO5nZaLcD4E14FTNWR
         8Wew==
X-Forwarded-Encrypted: i=1; AJvYcCXHyLQbUWDwCIta+BKgAzkU7LjXoeREsk69WTjJi+rZEajN4A+NeZWMU1Exi3e+faIlJEysi6QyenRfhirJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzwxhIk7GnNiS4Wy9Oub1fH6ZNBavQdDdXB/oPlavzheu5jrxyW
	QkJu3Zg2mW8Rg9MlZUm9tZCpVHb0NZUG1xbzoGji8ZZUV5GLy/jSnx+iYkLL9wE=
X-Gm-Gg: ASbGncu/W7T8utpuo5Eo3qLSfQpnU9Al9fFqv7WBWGxWpgxNokUUpcpinfvdqmDjqhT
	cdv8G5NF6RgAlzpvjwbufdG/l49W6A/WVanmh+mGQRmiH/BJLv2BFrYMIiMdH1jovBjeEShRClX
	PsCX4oTsUFdt9ebRIu8rwitO0gzjXTPsRjAf0oNa4NBqZo1mKVoUsdaM4siYFwD5Y6exJ0ai28G
	949UGe6fUvyLnWaDOnZFQv2cyOngc7GRTKxWHkrc4aFDg/H
X-Google-Smtp-Source: AGHT+IFFI1Us3Z2/vHasFSbdxaGxBDEWfRpcJfWwef/hER0MAewSphyOZp6Iz5UkGslBjSBIO016YA==
X-Received: by 2002:a05:6000:4213:b0:385:fa2e:a33e with SMTP id ffacd0b85a97d-3862b3d08e2mr5027552f8f.43.1733607922136;
        Sat, 07 Dec 2024 13:45:22 -0800 (PST)
Received: from linaro.org ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3862eb06e00sm4619758f8f.99.2024.12.07.13.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 13:45:21 -0800 (PST)
Date: Sat, 7 Dec 2024 23:45:19 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Johan Hovold <johan@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 2/6] usb: typec: Add support for Parade PS8830 Type-C
 Retimer
Message-ID: <Z1TB7wQ3FkCdybmX@linaro.org>
References: <20241112-x1e80100-ps8830-v5-0-4ad83af4d162@linaro.org>
 <20241112-x1e80100-ps8830-v5-2-4ad83af4d162@linaro.org>
 <Z1CCVjEZMQ6hJ-wK@hovoldconsulting.com>
 <v7konhz4x7fzfseyeyiazcw35zqmpjb6tjv5ukdlttzs74ykgb@lpftcociq257>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <v7konhz4x7fzfseyeyiazcw35zqmpjb6tjv5ukdlttzs74ykgb@lpftcociq257>

On 24-12-05 17:05:17, Bjorn Andersson wrote:
> On Wed, Dec 04, 2024 at 05:24:54PM +0100, Johan Hovold wrote:
> > On Tue, Nov 12, 2024 at 07:01:11PM +0200, Abel Vesa wrote:
> > > The Parade PS8830 is a USB4, DisplayPort and Thunderbolt 4 retimer,
> > > controlled over I2C. It usually sits between a USB/DisplayPort PHY
> > > and the Type-C connector, and provides orientation and altmode handling.
> > > 
> > > The boards that use this retimer are the ones featuring the Qualcomm
> > > Snapdragon X Elite SoCs.
> > 
> > > +static int ps883x_sw_set(struct typec_switch_dev *sw,
> > > +			 enum typec_orientation orientation)
> > > +{
> > > +	struct ps883x_retimer *retimer = typec_switch_get_drvdata(sw);
> > > +	int ret = 0;
> > > +
> > > +	ret = typec_switch_set(retimer->typec_switch, orientation);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	mutex_lock(&retimer->lock);
> > > +
> > > +	if (retimer->orientation != orientation) {
> > > +		retimer->orientation = orientation;
> > > +
> > > +		ret = ps883x_set(retimer);
> > > +	}
> > > +
> > > +	mutex_unlock(&retimer->lock);
> > > +
> > > +	return ret;
> > > +}
> > 
> > This seems to indicate a bigger problem, but I see this function called
> > during early resume while the i2c controller is suspended:
> > 
> > [   54.213900] ------------[ cut here ]------------
> > [   54.213942] i2c i2c-2: Transfer while suspended
> > [   54.214125] WARNING: CPU: 0 PID: 126 at drivers/i2c/i2c-core.h:56 __i2c_transfer+0x874/0x968 [i2c_core]
> > ...
> > [   54.214833] CPU: 0 UID: 0 PID: 126 Comm: kworker/0:2 Not tainted 6.13.0-rc1 #11
> > [   54.214844] Hardware name: Qualcomm CRD, BIOS 6.0.231221.BOOT.MXF.2.4-00348.1-HAMOA-1 12/21/2023
> > [   54.214852] Workqueue: events pmic_glink_altmode_worker [pmic_glink_altmode]
> > ...
> > [   54.215090] Call trace:
> > [   54.215097]  __i2c_transfer+0x874/0x968 [i2c_core] (P)
> > [   54.215112]  __i2c_transfer+0x874/0x968 [i2c_core] (L)
> > [   54.215126]  i2c_transfer+0x94/0xf0 [i2c_core]
> > [   54.215140]  i2c_transfer_buffer_flags+0x5c/0x90 [i2c_core]
> > [   54.215153]  regmap_i2c_write+0x20/0x58 [regmap_i2c]
> > [   54.215166]  _regmap_raw_write_impl+0x740/0x894
> > [   54.215184]  _regmap_bus_raw_write+0x60/0x7c
> > [   54.215192]  _regmap_write+0x60/0x1b4
> > [   54.215200]  regmap_write+0x4c/0x78
> > [   54.215207]  ps883x_set+0xb0/0x10c [ps883x]
> > [   54.215219]  ps883x_sw_set+0x74/0x98 [ps883x]
> > [   54.215227]  typec_switch_set+0x58/0x90 [typec]
> > [   54.215248]  pmic_glink_altmode_worker+0x3c/0x23c [pmic_glink_altmode]
> > [   54.215257]  process_one_work+0x20c/0x610
> > [   54.215274]  worker_thread+0x23c/0x378
> > [   54.215283]  kthread+0x124/0x128
> > [   54.215291]  ret_from_fork+0x10/0x20
> > [   54.215303] irq event stamp: 28140
> > [   54.215309] hardirqs last  enabled at (28139): [<ffffd15e3bc2a434>] __up_console_sem+0x6c/0x80
> > [   54.215325] hardirqs last disabled at (28140): [<ffffd15e3c596aa4>] el1_dbg+0x24/0x8c
> > [   54.215341] softirqs last  enabled at (28120): [<ffffd15e3bb9b82c>] handle_softirqs+0x4c4/0x4dc
> > [   54.215355] softirqs last disabled at (27961): [<ffffd15e3bb501ec>] __do_softirq+0x14/0x20
> > [   54.215363] ---[ end trace 0000000000000000 ]---
> > [   54.216889] Enabling non-boot CPUs ...
> > 
> > This can be reproduced on the CRD (or T14s) by disconnecting, for
> > example, a mass storage device while the laptop is suspended.
> > 
> 
> I wonder if this is because drivers/rpmsg/qcom_glink_smem.c line 309
> registers the GLINK interrupt as IRQF_NO_SUSPEND as a remnant from being
> used for rpm communication...

Yes. Seems like dropping the flag fixes this.

> 
> This is no longer needed (glink/rpm code path is now different), but
> iirc the cleanup got stuck in the question of dealing with wakeup
> capabilities (and priorities).

I'll send a patch to drop the flag and we then can debate there if it's
the right thing to do w.r.t. wakeup.

> 
> Regards,
> Bjorn

