Return-Path: <linux-arm-msm+bounces-17599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 595918A6EF3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Apr 2024 16:50:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0FAB21F217C2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Apr 2024 14:50:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A834130A47;
	Tue, 16 Apr 2024 14:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KcH/DCXH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C3F12FB07
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Apr 2024 14:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713278936; cv=none; b=k7qhm72apJ32n+z7hvT6MDWfx6lG/MIKywRZLPNEuZu19wJl26TEwA5ztxZbqdPFHHEBr8cjWqPX+4h/Oipsk40EM5mPcnpO98YvHu7UnvHIXh1f+8NW5DvIsfeWri/iumLIwRd+7VHF612JaZ3r7Ly9TSlVBtBpb4Xe+H12OfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713278936; c=relaxed/simple;
	bh=qv8o5hhH38UTAvt4yDxgWYargetk899Ucn2PZF21ckg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hb4Vv9BoztOl5PA4GMdUph8Yk0Ffhl3Hm2erx41APG6wj4UCjVrku0p97+bL+/D+Dv+3hasxGVugLfqMUCwJLRagmGe/CVwa5izT+4/Hw9H5WSCMDlWDMTQjir/x44fw/7qMaBjMku9DYkTVexG/SMLKN1FQCbhuLkCvV1m9Bsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KcH/DCXH; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dc74435c428so4386655276.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Apr 2024 07:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713278934; x=1713883734; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dkC9HeIhznIftL0Ye+AK9W/2NXZL9l/CimUWQciD92s=;
        b=KcH/DCXH0v1SM+yruW0KCDSmky8T1P11lbQNNXceh7BrncWTGR6CiYapAy270aZyQw
         bxLHGjhNs0COXGmB5Pyu431vAOFmU3Zyc8uDmL0w7L4KmuJG95fjsHoAkOkVpGMIWpX1
         DBwGgVbntwdL//92x/R0J3YoH6z3Q/rq1MmRl5sgU2jDgTdt9X0T0WMXoMApOkH9NS7d
         SqYhXQbSwyolIjpGDpD9WJlq5gVVGsryyobmf3SVxhHCKGOb8/f/QkcoDiwNCx34jg2D
         7R8tOOtci0Xaq2dyZTultf2X2V5wCKhtaDQUlij0Ubz4WvzFshHZ0XeXfe83ngOOCVHT
         ZbuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713278934; x=1713883734;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dkC9HeIhznIftL0Ye+AK9W/2NXZL9l/CimUWQciD92s=;
        b=tlBlOJ2M8OnyYQY3x7h+sQFwtoVbbuRLsj0cLxIOutmWwWdd9Wby09U4luyj6I25Ja
         6r8ZWMS8j5JxUIxzs8NNRVKw57seGc4tuBCmYqNjDUdgBJEhLt0/Xj1BSKC0ThRFrogI
         Vb+OS6ls3swoPEDkaVagAOpnLz2hid0oagjWakZefI9z1jEixsI/31WGXvJIrWO3Vw3i
         r4ocvcMOsiQa1DYsvvy3ka9Y/KZe3niQVPTRSbnQI/NHbmRPySYMXk4d6MXnMFUAv8WZ
         OK67DIP/dcf6w/nxzm5bA6MJuDfPNqBKgr0MSrve+zIYc3QRtMS4AMk1U9kX1AlL6STz
         15jA==
X-Forwarded-Encrypted: i=1; AJvYcCU0sAhQHIsUS2/KiLMt6fQD39Mmo6UOsmjd3HGdo2pG07bWrnczLDnKA3yBx/ecwzEBvejBjRXI3e5jbW0CztfuKK39FqRFUzF1jPlweQ==
X-Gm-Message-State: AOJu0YzYQS8YKDzG2A9Mhu/F8RQKRfTI9uz2FldHvP6k+H3s//JWSiaH
	4OYadtt1KNsoLPXpZypjIj9Py77iMP9R360gi8Kllp6EzJJNGsbJHH5T1UM4xoKWT9DK5Cbqbb+
	6exAlg5p6vqp502lh38opI6UIE92Yvl9BJhUIFw==
X-Google-Smtp-Source: AGHT+IGCYC5gD6+YiSV9qWfXxjR6Cc2xLYT1BNzarPUPBA5r2G201kk38iJ8HXhUjD3GioRz607Dd5DjZJEtcn7/0SY=
X-Received: by 2002:a25:2742:0:b0:dc7:5a17:6c3 with SMTP id
 n63-20020a252742000000b00dc75a1706c3mr11773509ybn.53.1713278933771; Tue, 16
 Apr 2024 07:48:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240416-ucsi-glink-altmode-v1-0-890db00877ac@linaro.org>
 <20240416-ucsi-glink-altmode-v1-2-890db00877ac@linaro.org> <c129b349-dfaa-4b10-9b8c-6098d04b9373@linaro.org>
In-Reply-To: <c129b349-dfaa-4b10-9b8c-6098d04b9373@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 16 Apr 2024 17:48:42 +0300
Message-ID: <CAA8EJpqH2_ENE6am=m9dtwk_+_Vbc4pZG9=Y_4-b-p0fKQ4sBg@mail.gmail.com>
Subject: Re: [PATCH 2/8] usb: typec: altmode: add low level altmode
 configuration helper
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 16 Apr 2024 at 17:32, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 4/16/24 04:20, Dmitry Baryshkov wrote:
> > In some obscure cases (Qualcomm PMIC Glink) altmode is completely
> > handled by the firmware. Linux does not get proper partner altmode info.
> > Instead we get the notification once the altmode is negotiated and
> > entered (or left). However even in such a case the driver has to switch
> > board components (muxes, switches and retimers) according to the altmode
> > selected by the hardware.
> >
> > We can not use existing typec_altmode_enter() / typec_altmode_exit() /
> > typec_altmode_notify() functions in such a case, since there is no
> > corresponding partner's altmode instance.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
>
> Should this now be called from e.g. typec_almode_notify to limit
> duplication?

typec_altmode_notify works only if there is an altmode->partner (which
we don't have with pmic-glink).


-- 
With best wishes
Dmitry

