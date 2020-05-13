Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61C0C1D2026
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2020 22:24:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390671AbgEMUYY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 May 2020 16:24:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732650AbgEMUYX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 May 2020 16:24:23 -0400
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AB52C061A0C;
        Wed, 13 May 2020 13:24:22 -0700 (PDT)
Received: by mail-il1-x143.google.com with SMTP id b71so1028722ilg.8;
        Wed, 13 May 2020 13:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/0PPB26EjKCEK4FysNGX/JGmScpUolfSHa5EDihTllg=;
        b=DpjJjWPSkGc4uBWZSWOu3a8gE6D6kgBELTVAJpfcmJe1rw9c6mQsnxzKwM1zWR0/ep
         P5fMP0DWk7itrunwNIy89fS79ZFHjAytH+q8pUfPM9MhERs1zJOWV7zlLf7OOSsvAF19
         DtiOpo1mT/B0SkrptWiIV+aE8JC8gnj880EUrOE0MfzlUy38V89twiW3UMD84y0VR0hX
         dyOZuCVuwgoZ12QiEUTSS8IBOi40/2l3zvwbFqJ3y2DmIRGRSGXXFnZbmI+P5pnpxvl3
         kJHFFx1Zys8+ZbxEPxXWEgBBO9GIMc3agGS3DdgKeZFeppAcemofiiHSfdCoO3gGLeqk
         ynjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/0PPB26EjKCEK4FysNGX/JGmScpUolfSHa5EDihTllg=;
        b=PNj/PM/Hyok/+3kDFIpMreIuOf8otYIyQ4SHSbk3Ay8BAQ7zlxBAdJxLWd23gDIXkH
         HstACWlY4NNjGz2++d1Msg2elZaE8XdRvyf4ItXZp8jZJJWKAVxpFmiGziscASE+amdi
         ids1aXmHQiyjLSsLvQWIuVoO74Riqe7V2rVBNp7BKFnWkzdVodZYDc4no4eJpxns23BB
         Swh4FCLD+ZOquguMk8srf+0z+A7sUdxxXMwoubKOzpFzJtDzJhieMjm5rdcFCynbmy0K
         Jb7cGCcDNTsWjxcnQ+2zwEef0ooCNCCtDhkOPK7uKIPbjym3LzU5XkthNjKdOT+k0K/g
         ckaA==
X-Gm-Message-State: AOAM531dsFiIrk3JXs6EeGYpLv4OGPvzpGgp2/9tfzQHexr8wq237aqk
        8zZ8XaHM5dUtVz/9Kk37DIPsH0fSRHucDV3efqQ=
X-Google-Smtp-Source: ABdhPJxbUfrjvMOE70gMloZvlIhKbhNjJILxo1CxWouTHXmQImiYKQ7qMPsPb6ZN1UHsnym1/2QR7EQ6Tgsn6w7xjDI=
X-Received: by 2002:a92:4b11:: with SMTP id m17mr1298260ilg.42.1589401461922;
 Wed, 13 May 2020 13:24:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200513184735.30104-1-michael.srba@seznam.cz>
In-Reply-To: <20200513184735.30104-1-michael.srba@seznam.cz>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Wed, 13 May 2020 14:24:10 -0600
Message-ID: <CAOCk7No9mnXwsmCZF14Hsx=oikCRe=PVcjoRsFsR5ZjftHPndw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: msm8916: Disable coresight by default
To:     michael.srba@seznam.cz
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 13, 2020 at 12:50 PM <michael.srba@seznam.cz> wrote:
>
> From: Michael Srba <michael.srba@seznam.cz>
>
> On some msm8916 devices, attempts at initializing coresight cause the boot to
> fail. This was fixed by disabling the coresight-related nodes in the board dts
> files. However, a cleaner approach was chosen for fixing the same issue on
> msm8998: disabling coresight by default, and enabling it in board dts files
> where desired.
>
> This patch implements the same solution for msm8916, removes now redundant
> overwrites in board specific dts files and and enables coresight in db410c's
> board dts in order to keep the current behavior.
>
> Fixes: b1fcc5702a41 ("arm64: dts: qcom: msm8916: Add CTI options")
> Signed-off-by: Michael Srba <michael.srba@seznam.cz>

Reviewed-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
