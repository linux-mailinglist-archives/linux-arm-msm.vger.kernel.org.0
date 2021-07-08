Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA34B3BF816
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jul 2021 12:10:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231482AbhGHKMo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Jul 2021 06:12:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231372AbhGHKMn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Jul 2021 06:12:43 -0400
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AC5DC061574
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jul 2021 03:10:01 -0700 (PDT)
Received: by mail-vs1-xe35.google.com with SMTP id h18so3296515vsj.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jul 2021 03:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8XkfH9+fTTan24v4bvoti+pLXgKwMSUgTJQx2o0Bllo=;
        b=gVmQ9nGXksd1SX9wHOHv2tLAo7F7JUgz0O1xj5BfEkwI9cnxv4Ts62oSThPZ6D6wCO
         ZgUTmFBeNQYsuF2cVN6u9NWRyNeouHi1kaXG2xoT3wrXl9C/j6PC3badxUTUigGqAw0J
         VC02TiDBaRv8k0IBH9yBV4KG9UUI/w25RN5OEZ3po6WJuAkuqyF23eLJwn9mqmWmO6np
         RFcpWgayy7jKRBATf1fAY8oh4tpxVDdEFf3o+om1R1a7WhscmFLKNykB6rKxAuCXpVr9
         hskxkSIgU2PxMaoL0dg07cHH8uymm3r2i2X7pEhreyex/UIqliMN5ob/EVG6kzz0xzNj
         e1JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8XkfH9+fTTan24v4bvoti+pLXgKwMSUgTJQx2o0Bllo=;
        b=dS/sp0jorw3nEvK6Uugmlg0nK7D3hZGf6dvCGjC5dz63dq+988dqIKnT3UgsJvQhvJ
         PLKCw/By/lcP9d/AYGc9RwIihJK8wlIfV+fY8P/3FHqNsDbyQ4qLDzMinfurGkLoGW5k
         Xi/i89EnfWzQQ45my2xs50Fgc5r3ZyY9rHXr3ouU5zXRVHue6vcbZG1OidR82OVdKLvj
         3DPtjvkU0lz0r9eMkCbeJ0VOP0vINYQ+0uqdtZ4M1Efsdlud1c2pywHI9w/Kj0OdmYRT
         5Jb9NT1Q7ErxS9rHs6PKEmQpI1ZputRaKVTui/wy0fBUhq0kPTFrxNvE4EwBEBcsBGtP
         Vzlw==
X-Gm-Message-State: AOAM5321IB9U4QyKB/igaar4c402mfYG5MeG3J08hlmhD3YmKPghGudp
        rF4g1Vzx+7dQn+cF4hPUSPRpCv2EAYWx/jEx+CFb1A==
X-Google-Smtp-Source: ABdhPJwHgh40ete+mWshNgBzlFotTAKewBYMMJyK7LdPKgcW1MKGOya9/zroMMERxNBQ9ffFUG/OviGrGS35sgyMGLQ=
X-Received: by 2002:a05:6102:2324:: with SMTP id b4mr3247152vsa.48.1625739000496;
 Thu, 08 Jul 2021 03:10:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210621223141.1638189-1-dmitry.baryshkov@linaro.org>
 <20210621223141.1638189-3-dmitry.baryshkov@linaro.org> <CAPDyKFo6dmjw0TnaK7=35dq5Si_6YYpeeSa=gU++1od7WkQZ7A@mail.gmail.com>
 <20210706115517.GB4529@sirena.org.uk>
In-Reply-To: <20210706115517.GB4529@sirena.org.uk>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 8 Jul 2021 12:09:24 +0200
Message-ID: <CAPDyKFr=8spZBD+bTe3SjS=nATL-ByFu_epnT2Z4chSuQNke2w@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] regulator: qca6390: add support for QCA639x
 powerup sequence
To:     Mark Brown <broonie@kernel.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-bluetooth@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

- Peter (the email was bouncing)

On Tue, 6 Jul 2021 at 13:55, Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, Jul 06, 2021 at 09:54:03AM +0200, Ulf Hansson wrote:
> > On Tue, 22 Jun 2021 at 00:32, Dmitry Baryshkov
>
> > > Qualcomm QCA6390/1 is a family of WiFi + Bluetooth SoCs, with BT part
> > > being controlled through the UART and WiFi being present on PCIe
> > > bus. Both blocks share common power sources. Add device driver handling
> > > power sequencing of QCA6390/1.
>
> > Power sequencing of discoverable buses have been discussed several
> > times before at LKML. The last attempt [1] I am aware of, was in 2017
> > from Peter Chen. I don't think there is a common solution, yet.
>
> This feels a bit different to the power sequencing problem - it's not
> exposing the individual inputs to the device but rather is a block that
> manages everything but needs a bit of a kick to get things going (I'd
> guess that with ACPI it'd be triggered via AML).  It's in the same space
> but it's not quite the same issue I think, something that can handle
> control of the individual resources might still struggle with this.

Well, to me it looks very similar to those resouses we could manage
with the mmc pwrseq, for SDIO. It's also typically the same kind of
combo-chips that moved from supporting SDIO to PCIe, for improved
performance I guess. More importantly, the same constraint to
pre-power on the device is needed to allow it to be discovered/probed.

Therefore, I think it would be worth having a common solution for
this, rather than a solution per subsystem or even worse, per device.

Unfortunately, it looks like Peter's email is bouncing so we can't get
an update from him.

Kind regards
Uffe
