Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 551A42B8F1B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Nov 2020 10:41:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726788AbgKSJgv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Nov 2020 04:36:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726920AbgKSJgv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Nov 2020 04:36:51 -0500
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 149D1C0613CF
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2020 01:36:51 -0800 (PST)
Received: by mail-ej1-x643.google.com with SMTP id f23so6979400ejk.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2020 01:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SEull2j6pe+OSY1/6fewJb3l7jXUXQXvziz6JvVkpHA=;
        b=aPNvJcK2E+p3xzBVQ+5hbx4P7xC1o10OXleYqtcdpACCO9IjYvy4aZK9ijuVbBJCRc
         ITWPxiGXyiC4DGjPJdZsBqClyXm38pjxSrKRkchwv515VGDB3Z0KD1WOs4xcIzL7Io9Y
         dhkWt5wz/v+eCzhlkWhdlfpg1XSYRFO8Qy/Ph7qqe3DPDR05n3uGrRy333BsOLIUn/jm
         UHHjspMP6gaOkBaaBSpO63cJehY8OJRKF4aCl2ymMOW+ExMvt2geV6VcsUErh18/R98a
         JiTHvaCSXgTqiF+mRyKADj58AkN/1+ki9ZPta9hMkwLXcPpFudgBBaDFItJCrHBT1KlQ
         cU3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SEull2j6pe+OSY1/6fewJb3l7jXUXQXvziz6JvVkpHA=;
        b=sxOibHrrP8FzQuT67iLLJSivTzo/hWRAhrttl8ykW3Isjg/eX2JroYHtVypE791JWP
         Ii8bK6Gj2LoQ6k+SwngGIlfIFEqiSME9AE+54ro3JqOnZKbifxqo0ZEHu1OgWg7RQpO/
         nB13oytUBLYzoGPix4ihnA/WZc+QRF+4t+CoYg3QCIsXr6ArrUDXBTAV1Jc021MDDyOk
         PQphfDzLIG3jeKzvWhFhR+VGkTxZol6j3Z8KKqB3cDDdCls1t1PvLldMgFJNiACKlSap
         xFTjdUTYo7xtRT6UHX0WfXqdOPh1FX1Y6L/K64zTn4U7SrosBpnL9FRkxtlWNvS56fQx
         i79w==
X-Gm-Message-State: AOAM533K1vLB7qzYZ0FTk0VnIQV1Ko2aNe8KUNN0uQOYMzwWUjSHFG/z
        Yhdt1WGPqByFafuE2rlx8HMuL71GOGJDB/zEfvvK0A==
X-Google-Smtp-Source: ABdhPJxQbGGrOS2ihVGgBjHdgrC5Z4v+NVSAwbKTvmEj2p0/O06iYW38OgIFRHIR3fXKP95BYJLKqMG4FLlNYOtEiKE=
X-Received: by 2002:a17:906:180b:: with SMTP id v11mr27317808eje.466.1605778609760;
 Thu, 19 Nov 2020 01:36:49 -0800 (PST)
MIME-Version: 1.0
References: <1605279602-18749-1-git-send-email-loic.poulain@linaro.org>
 <1605279602-18749-2-git-send-email-loic.poulain@linaro.org>
 <3e72e0fa-1bba-20af-1e2a-1b7981bfd39d@codeaurora.org> <CAMZdPi-BcjtF55DMJi60JsYNbOo+ypBmkqnq62NyeJ6G9X=w8w@mail.gmail.com>
 <9fcb71a8-8b85-1572-ad1f-2e3e6d341e1b@codeaurora.org>
In-Reply-To: <9fcb71a8-8b85-1572-ad1f-2e3e6d341e1b@codeaurora.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Thu, 19 Nov 2020 10:42:52 +0100
Message-ID: <CAMZdPi-Uhnicfb51GTprSDE8fOiSdK7VL+GZpN81zxzi-zpLmw@mail.gmail.com>
Subject: Re: [PATCH 1/8] mhi: pci-generic: Increase number of hardware events
To:     Hemant Kumar <hemantk@codeaurora.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Hemant,

On Thu, 19 Nov 2020 at 02:50, Hemant Kumar <hemantk@codeaurora.org> wrote:
>
> Hi Loic,
>
> On 11/18/20 12:26 AM, Loic Poulain wrote:
> > On Wed, 18 Nov 2020 at 04:54, Hemant Kumar <hemantk@codeaurora.org> wrote:
> >>
> >> Hi Loic,
> >>
> >> On 11/13/20 6:59 AM, Loic Poulain wrote:
> >>> If the IPA (IP hardware accelerator) is starved of event ring elements,
> >>> the modem is crashing (SDX55). That can be prevented by setting a
> >> it is because of event processing is getting starved ?
> >
> > Yes, and hardware does not like that.
> >
> >> Event ring elements = 2 x xfer ring is good for HW channels. Do you think NAPI
> >> polling would help when you start verifying higher data rates?
> >
> > That's a good question, I'll certainly test that. But we still need to
> > ensure this will
> > never ever happen with this higher event count.
> Once you move to burst mode, if device is running out of credit, it
> would send OOB and move to doorbell mode, and stop posting events until
> MHI Host rings DB with a TRE.

That not something I observe with my device/hardware, and I end with
the modem crashing:

[   47.607340] ipa_mhi_client ipa_mhi_gsi_ev_err_cb:1121 channel
id=100 client=42 state=2
[   47.608337] ipa_mhi_client ipa_mhi_gsi_ev_err_cb:1133 Received
GSI_EVT_EVT_RING_EMPTY_ERR
[   47.609310] ipa_mhi_client ipa_mhi_gsi_ev_err_cb:1138 err_desc=0x5000
[   47.610339] IPA: unrecoverable error has occurred, asserting

It's triggered from here:
https://source.codeaurora.org/quic/la/kernel/msm-4.14/tree/drivers/platform/msm/ipa/ipa_clients/ipa_mhi_client.c?h=APSS.FSM.7.6#n1134

Regards,
Loic
