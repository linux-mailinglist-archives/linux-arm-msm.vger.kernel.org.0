Return-Path: <linux-arm-msm+bounces-43564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2659FDD33
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Dec 2024 05:08:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2FD991882819
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Dec 2024 04:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB1C217578;
	Sun, 29 Dec 2024 04:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gUp4gJTr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C611112B93
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Dec 2024 04:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735445288; cv=none; b=qY/ZEdmEaKrr1IdcE+BzJtYaLJlDWnrpneeQnLGmZxQvqbOayQBCEZvuT0nNScc1MNRfPIVogiG6exWeDYtWCDf3WW4ps/W2OFnhYDWSq540nRBe5D2LxVhig37jnb/yWjyMrX4NOW+xOMMPGd+nPBAD3EZAP1Crw7Z/cUaxTC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735445288; c=relaxed/simple;
	bh=/quudPiktVZqE9WjTumurLTNm6H8nKE+1TLqFdezSjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e/YuW0o8LKIkT3WmWfjDbsYv1Q2NNkm5Q1xUG+fgnigxYyLgWpxF28q1NEIhb15T2uYK2g5vjIeeRPAQnmhxrsRYyuNLbr5Ijk6s40Hpg5CfsyrlT760BCGFIFx5OdPHVFDmj23+VEPNvX/VXdjcG4XBSiwycBNAGy/BEMkCrAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gUp4gJTr; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5401c68b89eso10199686e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Dec 2024 20:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735445285; x=1736050085; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dBYyXD4A7od+Hr4TN2s40+nz0C8Q9NU/oHkDiqfb3QY=;
        b=gUp4gJTrqt7tweU/u38PQzO+s2KE8d2UGokiI3sWerMyVWDyXw+hcpT2dUX5Zz2F68
         nm2Kz0Yq6WMUi5Ki/PPh9/gtPWV3IWoEwJc5Nc5gED2K7wACic4xRiB/5tb6LLqygasR
         adfpyJCZlSSJ+DUYLTJLsRGtvVMlZz5YaJhmw7unDMIAVlqVc7bcJZR1lgrPvyIxZ/7J
         Qdw7oipnUyoWKQbW+upJCF3b2UaIISg+i/PJfVaHV1hJ2DWaou9BX6KVc/i6iTZ0hpkA
         Z4kT+48q6Il/hlV+dP9IKh1BNOoBqhpAQfpXpjenr+dQjcDbOurBLExBur5iF5QvVpPX
         caeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735445285; x=1736050085;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dBYyXD4A7od+Hr4TN2s40+nz0C8Q9NU/oHkDiqfb3QY=;
        b=fX/M6gAEDwYtMB8FjtjAUeI/bDt+KdIhce/K2+wtqdk9DSuh/R9htMJbHgchS77mod
         x3HZj7BKz/4lY6n3PxyM6p3m3bv2Tn4lW5NgCfDL2MvIqITNpM+8SfYh+BdUFjgJyNn2
         PhrSmKXIgkYedSgTCxSbkaFUWEMnAMniQFNkjr2iF1MMYz1Q5UmY8+C6s0LgL6wVaw3+
         TyR72QvVM6YNXBYtYA2iljd5oVaNHt0KH5tKOhXPFpeU2zlFTxSZn+jmVmZxtGyqxn+6
         R0YiLRgsZ1U1ua3FwsYREMOXty9YWJEFOflpAaQoA8nx/Vdw2TN+toL11Qf8vDM7D/nj
         nnJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFK9H2aY4/XT3sZxFNI3AOCLWhvTLW1Eu3YOwZZj2NI1k/UvDna+k59vbfIi+tHPnM4QLYA+BKyEka1cUl@vger.kernel.org
X-Gm-Message-State: AOJu0YzOGTtY3tSkX31dSBykzZA40hBthzb1QoqGSSjENoPogkAqTKsB
	G/OKYGQCZNvDW/sB5wWc4rQENWGpMs1wrBBo6KzG5YiEEQkV4tGm7ZRlNwntMsZBaHTW46arXwv
	7
X-Gm-Gg: ASbGnctfVK3zNgzQbIqCQhw8qd0xxZ4Ox30wD1Skj3aYsLm3/0aHvOxMetlly8qAVBy
	5ncRbTqMlXRIEirfzOXYG/hl8gnzNGXAtoXpEoiofmkeoeTNKpB/9tnG3lO/+jWHDp0ghuzOak5
	kPqB3olJ6BOtZo+zwkCp+bacn7P/7B8N7/U/31+JELkQYyt6+p2QkDtCjB7bYuvcC3DPY3P317d
	1sgseACMWwTYRoHD8MLLCCv6OW6m4beszvI2aeyWw52xTDZtwiaUl0MfTlTYZ1QqBdHDPSXwkBp
	j9NwOb/T+vyMsAfGG5eHJzQrRG6cdAc9RHMG
X-Google-Smtp-Source: AGHT+IEmnQonNnCtCNCxnF10T/nU4V0yXQZtHkXo8ONEqj/q42yAyh+ZqfgVXb/gaGmlvzPHgq3v7w==
X-Received: by 2002:a05:6512:318e:b0:540:1db4:3c72 with SMTP id 2adb3069b0e04-542294434abmr9788309e87.10.1735445284611;
        Sat, 28 Dec 2024 20:08:04 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f6790sm2760827e87.2.2024.12.28.20.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2024 20:08:03 -0800 (PST)
Date: Sun, 29 Dec 2024 06:08:00 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: krzk@kernel.org, andersson@kernel.org, bryan.odonoghue@linaro.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, 
	hdegoede@redhat.com, heikki.krogerus@linux.intel.com, ilpo.jarvinen@linux.intel.com, 
	konradybcio@kernel.org, krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
	nikita@trvn.ru, platform-driver-x86@vger.kernel.org, robh@kernel.org, 
	sre@kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: platform: Add Huawei Matebook E Go EC
Message-ID: <xiwaq7fapkkmohg743v36uzpxv4ib4o6upibh7fgvmfjiupy2k@zqxw53prsith>
References: <53da6468-501c-4c0f-a73b-4eac99c72b8c@kernel.org>
 <20241228113438.591254-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241228113438.591254-1-mitltlatltl@gmail.com>

On Sat, Dec 28, 2024 at 07:34:37PM +0800, Pengyu Luo wrote:
> > On Sat, Dec 28, 2024 at 5:58 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > On 27/12/2024 18:13, Pengyu Luo wrote:
> > > +
> > > +#include <linux/platform_data/huawei-gaokun-ec.h>
> > > +
> > > +#define EC_EVENT             0x06
> > > +
> > > +/* Also can be found in ACPI specification 12.3 */
> > > +#define EC_READ                      0x80
> > > +#define EC_WRITE             0x81
> > > +#define EC_BURST             0x82
> > > +#define EC_QUERY             0x84
> > > +
> > > +
> > > +#define EC_EVENT_LID         0x81
> > > +
> > > +#define EC_LID_STATE         0x80
> > > +#define EC_LID_OPEN          BIT(1)
> > > +
> > > +#define UCSI_REG_SIZE                7
> > > +
> > > +/* for tx, command sequences are arranged as
> >
> > Use Linux style comments, see coding style.
> >
> 
> Agree
> 
> > > + * {master_cmd, slave_cmd, data_len, data_seq}
> > > + */
> > > +#define REQ_HDR_SIZE         3
> > > +#define INPUT_SIZE_OFFSET    2
> > > +#define INPUT_DATA_OFFSET    3
> > > +
> > > +/* for rx, data sequences are arranged as
> > > + * {status, data_len(unreliable), data_seq}
> > > + */
> > > +#define RESP_HDR_SIZE                2
> > > +#define DATA_OFFSET          2
> > > +
> > > +
> > > +struct gaokun_ec {
> > > +     struct i2c_client *client;
> > > +     struct mutex lock;
> >
> > Missing doc. Run Checkpatch --strict, so you will know what is missing here.
> >
> 
> I see. A comment for mutex lock.
> 
> > > +     struct blocking_notifier_head notifier_list;
> > > +     struct input_dev *idev;
> > > +     bool suspended;
> > > +};
> > > +
> >
> >
> >
> > ...
> >
> > > +
> > > +static DEVICE_ATTR_RO(temperature);
> > > +
> > > +static struct attribute *gaokun_wmi_features_attrs[] = {
> > > +     &dev_attr_charge_control_thresholds.attr,
> > > +     &dev_attr_smart_charge_param.attr,
> > > +     &dev_attr_smart_charge.attr,
> > > +     &dev_attr_fn_lock_state.attr,
> > > +     &dev_attr_temperature.attr,
> > > +     NULL,
> > > +};
> >
> >
> > No, don't expose your own interface. Charging is already exposed by
> > power supply framework. Temperature by hwmon sensors. Drop all these and
> > never re-implement existing kernel user-space interfaces.
> >
> 
> I don't quite understand what you mean. You mean I should use hwmon
> interface like hwmon_device_register_with_groups to register it, right?
> As for battery, get/set_propery allow us to handle charging thresholds
> things, but there are smart_charge_param, smart_charge and fn_lock to handle.

Please push the smart_* to the PSY driver. At least it makes sense to
move those. I'm not sure about the fn_lock one. If you have a separate
EC-based input device, it should go to it. If not, let's keep it in the
base device.

> 
> >
> > > diff --git a/include/linux/platform_data/huawei-gaokun-ec.h b/include/linux/platform_data/huawei-gaokun-ec.h
> > > new file mode 100644
> > > index 000000000..a649e9ecf
> > > --- /dev/null
> > > +++ b/include/linux/platform_data/huawei-gaokun-ec.h
> > > @@ -0,0 +1,90 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/* Huawei Matebook E Go (sc8280xp) Embedded Controller
> > > + *
> > > + * Copyright (C) 2024 Pengyu Luo <mitltlatltl@gmail.com>
> > > + *
> > > + */
> > > +
> > > +#ifndef __HUAWEI_GAOKUN_EC_H__
> > > +#define __HUAWEI_GAOKUN_EC_H__
> > > +
> > > +#define GAOKUN_UCSI_CCI_SIZE 4
> > > +#define GAOKUN_UCSI_DATA_SIZE        16
> > > +#define GAOKUN_UCSI_READ_SIZE        (GAOKUN_UCSI_CCI_SIZE + GAOKUN_UCSI_DATA_SIZE)
> > > +#define GAOKUN_UCSI_WRITE_SIZE       0x18
> > > +
> > > +#define GAOKUN_TZ_REG_NUM    20
> > > +#define GAOKUN_SMART_CHARGE_DATA_SIZE        4 /* mode, delay, start, end */
> > > +
> > > +/* -------------------------------------------------------------------------- */
> > > +
> > > +struct gaokun_ec;
> > > +struct notifier_block;
> >
> > Drop, include proper header instead.
> >
> 
> I agree, I copy 'struct notifier_block;' from
> include/linux/platform_data/lenovo-yoga-c630.h

Please don't pollute header files with extra dependencies. It's usually
better to just forware-declare the struct instead of adding unnecessary
include.


-- 
With best wishes
Dmitry

