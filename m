Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04775352D2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2019 00:46:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726416AbfFDWqU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Jun 2019 18:46:20 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:46440 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbfFDWqU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Jun 2019 18:46:20 -0400
Received: by mail-pg1-f194.google.com with SMTP id v9so11179714pgr.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2019 15:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:to:from:subject:user-agent:date;
        bh=HNg3o5ROoQgdK02OHVbYwiGmswQ8hOagouJccOyABeY=;
        b=RVju6t1XxNLJeFjIty1eoJNU/et5ydRuqjOyhqSO1apGiKCqkLfbvynpDoG5bZ5ocO
         qmvyNle6roWhBqyoulbFbm0eNYK3W/yDvCz8ugCflj6z+rn4FBP2YPeAIxWdzX76JJL9
         F+69GbFPeAgK16++cUuTM3loOcCKSsRvZcXYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:to:from:subject
         :user-agent:date;
        bh=HNg3o5ROoQgdK02OHVbYwiGmswQ8hOagouJccOyABeY=;
        b=TeZxq04Ea9RlYA8OpOZl3lar0lTY5vkVKOKtYE6KGcgT2SNPcVzCOa4xE1O/PbQuRc
         Eqx5aE/oi/5DBAUTBDoT3GmfAulOaJTefQEHrSW76sBQhNmfhtbICoPnNRIJ6ZC6vC8v
         JtfqEe7OTWiYgSKy5NeqhtqFMhr20oDunczPfhYpLqr1AfTRpuuKMk9Qjj3JvJ78dPMw
         dvb5wLsJnVIhY1SMooY0Mqyd84lDA0qGGajsohfdukwnBEQ9ZeOU0l8++CQk56BBfuFn
         pRk5TsnU6HGELLSI+NuucGy0q4AKy0/wfk2LbBBi8Eqo1zcXv420URl5sC7uIoHzkMly
         G5kw==
X-Gm-Message-State: APjAAAUYqnn0JURO4b/OCICqDcVmE/qLbIiTsyfsxmb4ZTa1zBLgsOv2
        OPt6q4a/ClynhjSWq7VQ8hDupw==
X-Google-Smtp-Source: APXvYqygLI8WnPs4qw0QVkzn9lq9ZFTKVy++g266OQ9qxsCh4x6f+MiebpCebJ46eFKnZv5xF6M59Q==
X-Received: by 2002:a17:90a:2641:: with SMTP id l59mr14684653pje.55.1559688379642;
        Tue, 04 Jun 2019 15:46:19 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id u1sm18316341pfh.85.2019.06.04.15.46.19
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jun 2019 15:46:19 -0700 (PDT)
Message-ID: <5cf6f4bb.1c69fb81.c39da.5496@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190604223700.GE4814@minitux>
References: <20190604222939.195471-1-swboyd@chromium.org> <20190604223700.GE4814@minitux>
Cc:     Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH] arm64: dts: sdm845: Add iommus property to qup1
User-Agent: alot/0.8.1
Date:   Tue, 04 Jun 2019 15:46:18 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2019-06-04 15:37:00)
> On Tue 04 Jun 15:29 PDT 2019, Stephen Boyd wrote:
>=20
> > The SMMU that sits in front of the QUP needs to be programmed properly
> > so that the i2c geni driver can allocate DMA descriptors. Failure to do
> > this leads to faults when using devices such as an i2c touchscreen where
> > the transaction is larger than 32 bytes and we use a DMA buffer.
> >=20
>=20
> I'm pretty sure I've run into this problem, but before we marked the
> smmu bypass_disable and as such didn't get the fault, thanks.
>=20
> >  arm-smmu 15000000.iommu: Unexpected global fault, this could be serious
> >  arm-smmu 15000000.iommu:         GFSR 0x00000002, GFSYNR0 0x00000002, =
GFSYNR1 0x000006c0, GFSYNR2 0x00000000
> >=20
> > Add the right SID and mask so this works.
> >=20
> > Cc: Sibi Sankar <sibis@codeaurora.org>
> > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sdm845.dtsi | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts=
/qcom/sdm845.dtsi
> > index fcb93300ca62..2e57e861e17c 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > @@ -900,6 +900,7 @@
> >                       #address-cells =3D <2>;
> >                       #size-cells =3D <2>;
> >                       ranges;
> > +                     iommus =3D <&apps_smmu 0x6c0 0x3>;
>=20
> According to the docs this stream belongs to TZ, the HLOS stream should
> be 0x6c3.

Aye, I saw this line in the downstream kernel but it doesn't work for
me. If I specify <&apps_smmu 0x6c3 0x0> it still blows up. I wonder if
my firmware perhaps is missing some initialization here to make the QUP
operate in HLOS mode? Otherwise, I thought that the 0x3 at the end was
the mask and so it should be split off to the second cell in the DT
specifier but that seemed a little weird.

