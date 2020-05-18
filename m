Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 242CB1D89B9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2020 23:00:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727812AbgERVAF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 May 2020 17:00:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726250AbgERVAF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 May 2020 17:00:05 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB003C061A0C
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 14:00:04 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id u7so3237625vsp.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 14:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4vQAvXs8YebqJQNpvsgx+YOpDZkNHLr4/g7pen09M+Y=;
        b=UzmCAWI3Et1k/ZetXQXo8P7q5FAsHXBwwnFSCGgtDVWBYyDfVAPaFJFOP+/jbBxQPZ
         x63KZMFIM/dDJIh3QlTuH2yECcrZwYZCpiYH9MFtMCDOG8n18NeS6lZ7oPGMpcTGWu85
         xnn+GfXK8uB79yIF6irfWr1brh/7UoNiSPDHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4vQAvXs8YebqJQNpvsgx+YOpDZkNHLr4/g7pen09M+Y=;
        b=qstDW6Yuy4vSenocs7Ka5xjGyBHyeKN6mPQ1pdH8O4vYis4KY/0+MNXYbqSQ+uuISJ
         hPfdVPhO59qpzpxVqlBAcL5+5EpJ2uQLQiYl6arv9wWJeMKDazd+D5+eV9cnm/uurUQ0
         5mufsQw7r3hMNApC3q5nLq7Bd2SICfHGmdoFatxr1se+/wUJS03DFa9cA4ZGkHdD3DWE
         cnhfqdjmeMnuSk1X8xr6UHksVykTS7ZGihGLKsOHEvha54AR1m91sBy9NF06X3K8JLnu
         K1GfaZzACA6SpDRusLh0xpeyF7lPv5SL6UGJM6gc+vHekHur9UYI/qdnXmoIv/o3KrSa
         sqow==
X-Gm-Message-State: AOAM533ywl2HJWHdH0DVMyzzocZdrl6HWhdi2pZyZu/S/1fqOQP6pbqr
        MkWFwJF9JyAxo7tluJauyN4xn5V3iAI=
X-Google-Smtp-Source: ABdhPJxhChZp6TDwzqhD/Oqdw654QnykIdLVaj1rCtCMx8GahW1UAK4QxCxMP0kKSIoXooBj71L1dw==
X-Received: by 2002:a67:2504:: with SMTP id l4mr12195324vsl.228.1589835602509;
        Mon, 18 May 2020 14:00:02 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id s130sm3468173vka.17.2020.05.18.14.00.00
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2020 14:00:01 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a11so3981679uah.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 14:00:00 -0700 (PDT)
X-Received: by 2002:ab0:b13:: with SMTP id b19mr12713480uak.91.1589835600274;
 Mon, 18 May 2020 14:00:00 -0700 (PDT)
MIME-Version: 1.0
References: <1588329036-18732-1-git-send-email-smasetty@codeaurora.org>
 <1588329036-18732-2-git-send-email-smasetty@codeaurora.org>
 <CAD=FV=WXv9DYf7LWoFBvro=7Bzeb1_0bXAvRH-suzxnrCu+V2A@mail.gmail.com> <20200518143920.GJ32394@willie-the-truck>
In-Reply-To: <20200518143920.GJ32394@willie-the-truck>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 18 May 2020 13:59:49 -0700
X-Gmail-Original-Message-ID: <CAD=FV=We2+5QHimzr+ukit9qkDKQaaTHYEZGkVbOwsNuy11k9A@mail.gmail.com>
Message-ID: <CAD=FV=We2+5QHimzr+ukit9qkDKQaaTHYEZGkVbOwsNuy11k9A@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: arm-smmu: Add sc7180 compatible string
To:     Will Deacon <will@kernel.org>
Cc:     Sharat Masetty <smasetty@codeaurora.org>,
        Robin Murphy <robin.murphy@arm.com>,
        freedreno <freedreno@lists.freedesktop.org>,
        dri-devel@freedesktop.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, May 18, 2020 at 7:39 AM Will Deacon <will@kernel.org> wrote:
>
> On Fri, May 15, 2020 at 12:05:39PM -0700, Doug Anderson wrote:
> > On Fri, May 1, 2020 at 3:30 AM Sharat Masetty <smasetty@codeaurora.org> wrote:
> > >
> > > This patch simply adds a new compatible string for SC7180 platform.
> > >
> > > Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> > > ---
> > >  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > > index 6515dbe..986098b 100644
> > > --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > > +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > > @@ -28,6 +28,7 @@ properties:
> > >            - enum:
> > >                - qcom,msm8996-smmu-v2
> > >                - qcom,msm8998-smmu-v2
> > > +              - qcom,sc7180-smmu-v2
> > >                - qcom,sdm845-smmu-v2
> > >            - const: qcom,smmu-v2
> >
> > Is anything blocking this patch from landing now?
>
> I thought updates to the bindings usually went via Rob and the device-tree
> tree, but neither of those are on cc.
>
> Perhaps resend with that fixed?

Ah, I guess I wasn't familiar with how things worked for this file, or
maybe things have changed recently?  I'm used to most bindings going
through the same tree as the drivers that use them.  Usually if things
are at all complicated maintainers wait for an Ack from Rob (so he
should have been CCed for sure) and then land.

In this case it actually looks like Bjorn landed it in the Qualcomm
and I just didn't realize it.  That seems like it should be fine since
it's in the middle of a clause that's all Qualcomm and the change
shouldn't be controversial in any way.  :-)

Thanks!

-Doug
