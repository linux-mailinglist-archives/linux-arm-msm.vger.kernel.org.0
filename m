Return-Path: <linux-arm-msm+bounces-27451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD1A942371
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 01:37:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65CFD1F2184E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 23:37:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B2831922C9;
	Tue, 30 Jul 2024 23:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U9CRTTqn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936181917E8
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jul 2024 23:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722382655; cv=none; b=NlvLWbMb9l5fszLBfBzdpQwWqaAbMlF22LZuGpGEqMkrjntiJTHK4qmsNd0KE8FxBUckDLeVzFILZ3RJe3DbnMxSzAhym9OKiTBUaq7YHaYnhkrFEEW9Ifw9mjArQxBcLFan4FcLYLkWzp6LSdh32T0K+74HOknPrALf52jhu4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722382655; c=relaxed/simple;
	bh=YNZYfYn4w5ke9RW0tyQxu79sOTptrm5gk82g0CxqW+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p2m3l1KlrsX+bKeDg+r3py5jWj7j4YRJhw9zKWO7WkKDvubKHnLPfE1tSnkrGZ5eG9PIL0nh/Y5OSaSwBoBKjyMRri2MQiLmuCR6F1nuv1mIbTmMCvxQ67gI8Yne1WDbXc+vjeDdtKxKgte7O1dCS4d/BtDIyNDnmuqhaDC7hU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U9CRTTqn; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e0b9d344d66so1441048276.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jul 2024 16:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722382652; x=1722987452; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=apsj18L5RiLbCE3V7d5wYObDfke+MtN7b20V/SGi9LI=;
        b=U9CRTTqnTYi4/j+xi+A6odKLNzbyuWfFzoVktm08YjJMkSj5KOsVfV3GjSt4HjTwQ2
         AELjFBhR9Ph9EdJPAH+V10tdif9ob0Mm72xdelJpbmCDYSkxy2Cf90EE7fJNgJ1pj+XD
         7B2o6ALWd/Iw0fr0IbNI2YJO6t7A39cuBaBJfYB8RxuDRB47p81WB+J+hkvuI/RtdcmE
         j4UC/YIkwox2V+qyApn6FTm7rfprg/xD/vM4yq+sXIjqtaIBGp05eUhdLgl58M7H60K4
         Q5xZrIoXv3mopfr4ZeYWMKNnHSEcvloNVB+7cJMkXT/AbQj2LoAk8n36//OZiq6056sB
         ZLXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722382652; x=1722987452;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=apsj18L5RiLbCE3V7d5wYObDfke+MtN7b20V/SGi9LI=;
        b=noCBM+7IVKnqxSbWmpcvEnaIKCDuP2D7CRb3fFBQfCLin6ddXlZKIOWIZlY1V3uJOI
         a0EI8bC9kQKBx03OiBmhz3WV6V4wbhfMl2C+xgOWMcNbyaWWUFiyHuh6BP3STK6ne0Bm
         Ung3oAz8KU6jUp/hhADSjyUwsYBueKePrP6EdaE1TOhAr36W+wWRfmoX4nNxtHL7nRP0
         nU3kKi4Q+dAmdXWfYC+eN7aXJ/9LlWb8FJ1cS4L4tlqkI2s1uzOZnnOTN6fRK0vMMTqi
         NoCVvwQOCUKILaqaH3F9Q+7Q2PNRuAvW7aNNZ0WM2ZVTuyxQGv4shgZGRVWXo0WvX8yK
         J+2g==
X-Forwarded-Encrypted: i=1; AJvYcCUBN5z5TZwu/tCgQz7lxq4+2fJS1vpfw+5HbI/k0ueDlVzOCeLO4D6U/A858REID5jZvp8TfJid/5rDLbq4BHzpIuKJe0kCsk5GIhUMAQ==
X-Gm-Message-State: AOJu0Yyo+O/fDlc9afO8+akQlP//7XXZBv6n9VCp+3M0y7M4JIN8+IqV
	evh6srwHFYymXBBOUz/Hs3I4Q6CS226G6EDzbwOi369lyxWUN8XfMgQP0UVf2YZhpWoqgWL/z82
	glMRU9BZXxp+h+C5z/KXpl4bYgUReB6Dn4UBhrA==
X-Google-Smtp-Source: AGHT+IEDA3z4HQLp7/ppDMSd/bRutuiaKfZkNuY77GF8ZdjW9ojdmDyxfn655oJsipNSIcC7k6lYxtXZwwsdVOne2mY=
X-Received: by 2002:a05:6902:1029:b0:dff:2ce8:cc1b with SMTP id
 3f1490d57ef6-e0b545bc297mr15384010276.35.1722382652566; Tue, 30 Jul 2024
 16:37:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240729231259.2122976-1-quic_amelende@quicinc.com>
 <20240729231259.2122976-5-quic_amelende@quicinc.com> <pzu2ijzkofzxpehpc4yphj5567ijdrxngqrepaq54njdagjenh@3vxmezjoepqg>
 <35402164-dce0-b972-bf98-c025fe5620f0@quicinc.com>
In-Reply-To: <35402164-dce0-b972-bf98-c025fe5620f0@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 31 Jul 2024 02:37:21 +0300
Message-ID: <CAA8EJprBZfO8mMoXAm0iw0u=VZhcSkT1iQ7m-AupdKFnk26Qyw@mail.gmail.com>
Subject: Re: [PATCH 4/5] thermal: qcom-spmi-temp-alarm: add support for GEN2
 rev 2 PMIC peripherals
To: Anjelique Melendez <quic_amelende@quicinc.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, amitk@kernel.org, 
	thara.gopinath@gmail.com, andersson@kernel.org, quic_collinsd@quicinc.com, 
	rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com, 
	lukasz.luba@arm.com, linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 31 Jul 2024 at 01:44, Anjelique Melendez
<quic_amelende@quicinc.com> wrote:
>
> >>
> >> +/* Configure TEMP_DAC registers based on DT thermal_zone trips */
> >> +static int qpnp_tm_gen2_rev2_update_trip_temps(struct qpnp_tm_chip *chip)
> >> +{
> >> +    struct thermal_trip trip = {0};
> >> +    int ret, ntrips, i;
> >> +
> >> +    ntrips = thermal_zone_get_num_trips(chip->tz_dev);
> >> +    /* Keep hardware defaults if no DT trips are defined. */
> >> +    if (ntrips <= 0)
> >> +            return 0;
> >> +
> >> +    for (i = 0; i < ntrips; i++) {
> >> +            ret = thermal_zone_get_trip(chip->tz_dev, i, &trip);
> >> +            if (ret < 0)
> >> +                    return ret;
> >> +
> >> +            ret = qpnp_tm_gen2_rev2_set_temp_thresh(chip, i, trip.temperature);
> >> +            if (ret < 0)
> >> +                    return ret;
> >> +    }
> >> +
> >> +    /* Verify that trips are strictly increasing. */
> >
> > There is no such requirement in the DT bindings. Please don't invent
> > artificial restrictions, especially if they are undocumented.
> >
>
> This is not an entirely new restirction. Currently the temp alarm driver
> has hardcoded temperature thresholds options which are "strictly increasing"
> (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/thermal/qcom/qcom-spmi-temp-alarm.c?h=v6.11-rc1#n44).
> The threshold values are initially configured based on the stage 2 critical trip
> temperature.
> For newer PMICs, we have individual temperature registers for stage 1, 2, and 3,
> so we instead configure each threshold temperature as defined in DT. In general
> since stage 1 = warning, stage 2 = system should shut down, stage 3 = emergency shutdown,
> we would expect for temperature thresholds to increase for each stage
> (https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/drivers/thermal?h=v5.4.281&id=f1599f9e4cd6f1dd0cad202853fb830854f4e944).
>
> I agree that we are missing some documentation but since the trips are defined in the
> thermal_zone node what is the best way to mention this requirement? Will adding a
> few sentences to qcom,spmi-temp-alarm.yaml description be enough? Do we need
> to make changes to thermal_zone.yaml so that dt_binding_check catches this requirement?

In my opinion the driver needs to be fixed to compile the state after
looking at all trip points, but Daniel / Amit / Thara can have a more
qualified opinion.

>
> >> +    for (i = 1; i < STAGE_COUNT; i++) {
> >> +            if (chip->temp_dac_map[i] <= chip->temp_dac_map[i - 1]) {
> >> +                    dev_err(chip->dev, "Threshold %d=%ld <= threshold %d=%ld\n",
> >> +                            i, chip->temp_dac_map[i], i - 1,
> >> +                            chip->temp_dac_map[i - 1]);
> >> +                    return -EINVAL;
> >> +            }
> >> +    }
> >> +
> >> +    return 0;
> Thanks,
> Anjelique



-- 
With best wishes
Dmitry

