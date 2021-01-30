Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFC5D309697
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Jan 2021 17:18:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232386AbhA3QSq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Jan 2021 11:18:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232290AbhA3QNu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Jan 2021 11:13:50 -0500
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0635CC06174A
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Jan 2021 08:12:37 -0800 (PST)
Received: by mail-qv1-xf34.google.com with SMTP id u20so1995690qvx.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Jan 2021 08:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9u+YQGFsbxaqSC+O1bAY5JRmBj2ohq+/cyFoF3rmfcA=;
        b=JvHA2ouYUv5VMC10IJxQ2OeH+845vhpkVOxUeeGM4nuIaXcabgehf1HFCDgP4KMWf+
         xJ5B8cNT/4UfBn8yIlZ84MZBfKA1eXvAmFh9zYjkbEnXzwjLyTNiyuATqPR2JjROC3AJ
         U23QCuVMcPKDsF4rvGzfCtqA/F9WuZurP3y4mn0C1OG3G1NNCqR8uLSPr7jIsFRJp2cL
         9gdm338c4PQ1OvLC+Zd+Wz78fOg/Rh7UYBxUMM4Hr9Q+3PfnrRzlZf++IY6VUH0XL9ME
         QFd4rkVmg/cUqrWtRd4Xh4Uth4Xnz+1Eeg7KMtkFQXrVXmZOL72uZ40aveBn6g95+xdG
         Z2Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9u+YQGFsbxaqSC+O1bAY5JRmBj2ohq+/cyFoF3rmfcA=;
        b=GowWxA8b4jRCG8w1SxL5cR4EuAuGtOdG4Dgqzqb+OBUibHsLh9J/yUfcdvurqnalfl
         6WKtMwa6vouaBRp0rknw/QJZUS2hVMbGluzYBHDabYGF/OhYS9JF9QN7OmJvZX//qd70
         ecOWreGIW/4w4UdTwmi9GYvNWkuPSEZRyu8NYNe8a+w6lGjOWpyltTz96G3Unz3meUmM
         /cFX+OHFUMggOFUS+yoD9+w3ZmW7iOsxtq07mrl85k0JYoLUctoqFYR75wM3nVjL5e5J
         /sKVEktURBZ5mH7z0fWIrQHIsqDuAe6Gpd/5QqCtfFZSVRP0TNxCPjU5GZOuWxg1r8Rk
         BbbA==
X-Gm-Message-State: AOAM5337y/wH4pOyPfEV9dOlRLAC/YX9O6JsjUolwlYqPr4IaU5VCgW4
        T1DIagYdKdJg6KwTSM3GXIibmLaSWZAscom2slfoSQ==
X-Google-Smtp-Source: ABdhPJwXXrdwv7HtV6m76V6gfORG5FAzN+LpL189uBR63KfaDVgGrTi2te5BwJ9hJZevYOSALLrr6Q7NfH+WY+Yi30Q=
X-Received: by 2002:a0c:c78c:: with SMTP id k12mr8612491qvj.47.1612023157148;
 Sat, 30 Jan 2021 08:12:37 -0800 (PST)
MIME-Version: 1.0
References: <Y6qqfCwC-O5b_bSR-8HY9-0aCeREaoAPsyOw5EVhv6YkZgPkzafs28dd5ldWZvT1Pkln-XfkB0t2gLFOClvJNDuny7zFAfYxbQzt0UMNjrE=@protonmail.com>
In-Reply-To: <Y6qqfCwC-O5b_bSR-8HY9-0aCeREaoAPsyOw5EVhv6YkZgPkzafs28dd5ldWZvT1Pkln-XfkB0t2gLFOClvJNDuny7zFAfYxbQzt0UMNjrE=@protonmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 30 Jan 2021 19:12:25 +0300
Message-ID: <CAA8EJpqeMgfWz2XJKxTb=9AuShVtwHGp0xjGmcESBf5CNUv4CA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] pcie-qcom: provide a way to power up qca6390 chip
 on RB5 platform
To:     Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     "agross@kernel.org" <agross@kernel.org>,
        "bhelgaas@google.com" <bhelgaas@google.com>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
        "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>,
        "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "svarbanov@mm-sol.com" <svarbanov@mm-sol.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 30 Jan 2021 at 11:04, Yassine Oudjana <y.oudjana@protonmail.com> wrote:
>
> On Thu, Jan 28, 2021 at 11:52 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > Some Qualcomm platforms require to power up an external device before
> > probing the PCI bus. E.g. on RB5 platform the QCA6390 WiFi/BT chip needs
> > to be powered up before PCIe0 bus is probed. Add a quirk to the
> > respective PCIe root bridge to attach to the power domain if one is
> > required, so that the QCA chip is started before scanning the PCIe bus.
>
> I'm lead to believe that this is also needed for QCA6174. I tried taking
> the driver you wrote and changing regulators to match the ones used by QCA6174,
> but I found that it gets probed after PCIe, which makes it get -EPROBE_DEFER
> when it tries to attach to the power domain, which it doesn't handle it and
> just proceeds to scan the bus and not find the chip as usual.

As a quick hack, you can try using this power domain for the pci_phy
(see my v1). Rob declined this approach, but it is useful to check if
QCA6174 wakes up properly and deferring PCIe probing till the chip is
powered up.



-- 
With best wishes
Dmitry
