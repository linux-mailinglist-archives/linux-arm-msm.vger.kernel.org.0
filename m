Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACB30F1CDE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2019 18:54:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729007AbfKFRyr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Nov 2019 12:54:47 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:56199 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726963AbfKFRyr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Nov 2019 12:54:47 -0500
Received: by mail-wm1-f67.google.com with SMTP id b11so1785743wmb.5;
        Wed, 06 Nov 2019 09:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Mp8PmEfmEPEAcc2ofDS4BS1efFDXiszJx2M4n5KAdao=;
        b=ff8fs7QOtR+Z9b/UJVi2IJ9dy5ChIuEBWx0s53X0lM93+sSd5V6nahWjZiEj36RAww
         14kAlycXxLvErSV0lf2/CsORQyl8daFs8RnOgvdVmxE7t2EKeOwPrDJRjAWly0XEuROt
         d5PXbY+GTaI9aqPzD/g19PSwx9k7AUeDXYA9zE+2rYCdmZe77ipVdqLHEtfTUguv5Rfh
         gyalQ1YiAGrD3ZQYpTHVVUSn2vS+YojOwxpm/Vw4eibQcAKbt07npzPo3ElkoxUQTQ4x
         zSleWC3LZ7EY8fC+h45aA03gn3mBpS7cTzScxDKJcVu95fYWWzDP/RLb1FJ5frbFIjX+
         IKdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mp8PmEfmEPEAcc2ofDS4BS1efFDXiszJx2M4n5KAdao=;
        b=uAzJbxxvA0EC4WHMZC/89DswgrXyTSZ5wWtxfPhzMrNVQsPMuUDu/HIa672a2W6W28
         o3kdPeoJTxBosfzfMbLBDsZqxoOiuwMc2XieCBR2dpPUejR8X+DeYhftVi1CRM0kEF1B
         qtEx3LhT2COuSLnzaYSq1CRe66kL6Ay3qjHYyH9AnMHTaq2IBnhZCX7GdtPidJcHPYNE
         jbzfUpjUv3jcJdsA/7BQfUDKHSzS2YLqeDLf43WT9WT+g4dhZB8XwjnKyV6W3rGBDx8K
         881rjyVvLcETanl51SOvmSeqYFDFFIlYUZCLo4LgUP9eWMHlCEna6NAwAGvphzdZH0rS
         2JhQ==
X-Gm-Message-State: APjAAAVgVGoRK24anYl7IoGr48kWZuPCgUaa0G1vt43p5+ypdC65Z0UT
        JX9oJ8ZoNjTGjVUquV1sdp5Hs2dEuD7yDi7ux+E=
X-Google-Smtp-Source: APXvYqzpNch3Fb9b/d445GdZWn3E6PoWeBtZwRgMHeqLULbfRueuM+F7ivK+F0o85jwv0nU0iHxmivm9mRyubqG9xfI=
X-Received: by 2002:a1c:6542:: with SMTP id z63mr3780423wmb.29.1573062885109;
 Wed, 06 Nov 2019 09:54:45 -0800 (PST)
MIME-Version: 1.0
References: <20191031111645.34777-1-kholk11@gmail.com> <20191031111645.34777-2-kholk11@gmail.com>
 <20191105184211.GA30975@bogus>
In-Reply-To: <20191105184211.GA30975@bogus>
From:   AngeloGioacchino Del Regno <kholk11@gmail.com>
Date:   Wed, 6 Nov 2019 18:54:34 +0100
Message-ID: <CAK7fi1bJh53i2i7K_584X7QE7D7obQ0fU6i6QSCQi-pSmETWNg@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: iio: spmi-vadc: Add definitions for
 USB DP/DM VADCs
To:     Rob Herring <robh@kernel.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>, devicetree@vger.kernel.org,
        ccross@android.com, Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        marijns95@gmail.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Il giorno mar 5 nov 2019 alle ore 19:42 Rob Herring <robh@kernel.org>
ha scritto:
>
> On Thu, 31 Oct 2019 12:16:41 +0100, kholk11@gmail.com wrote:
> > From: AngeloGioacchino Del Regno <kholk11@gmail.com>
> >
> > Some PMICs, like PMI8950, feature two ADCs, at 0x43 and 0x44,
> > respectively used for USB D+ and USB D- (DP/DM): add the definition
> > for them as VADC_USB_DP and VADC_USB_DM.
> >
> > Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> > ---
> >  include/dt-bindings/iio/qcom,spmi-vadc.h | 3 +++
> >  1 file changed, 3 insertions(+)
> >
>
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
>
> If a tag was not added on purpose, please state why and what changed.

I'm sorry, that wasn't intentional. Nothing changed in this patch.
