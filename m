Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8411D4C237
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2019 22:17:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbfFSURM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Jun 2019 16:17:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:32810 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726175AbfFSURM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Jun 2019 16:17:12 -0400
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4282D217D9;
        Wed, 19 Jun 2019 20:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560975431;
        bh=541XiS0AbaClh3nYwpHX5EEggdOh+N+d4mSDoxX/Rpg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=YVVZo+x89SxPwT5avxM6SUocpzWOqaV1fttnSeTufy/f48lKwzYOPqQV0k6yp4Ixf
         GYbD1O/Lg6MbfB6VUF6kG2MAP8QOp3B2cucQt2I/CtVGotYf/GsYzQ2gSRnHctarOg
         +VmQNytdY3f/ykQO4q1Ij6clsBS3a+LvOI0ddnQw=
Received: by mail-qt1-f176.google.com with SMTP id h21so545584qtn.13;
        Wed, 19 Jun 2019 13:17:11 -0700 (PDT)
X-Gm-Message-State: APjAAAUFkK/fWdO4xLeia1qjFJdaivB8eeWh5jIm0q9dH9IVYs3yLn33
        E4h4XTtIcYbQG540bhHAh+z0PpuDct/wAC909A==
X-Google-Smtp-Source: APXvYqxlXaUhYK7Rc1Fe1p9kGyCNNEK0+tjQBq7joBikhFVY5XwyssWYCZlgH1+7TyA7AeG2N/Rd9++exvETdBgfXxg=
X-Received: by 2002:a0c:8a43:: with SMTP id 3mr36153698qvu.138.1560975430399;
 Wed, 19 Jun 2019 13:17:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190616132930.6942-1-masneyb@onstation.org> <20190616132930.6942-3-masneyb@onstation.org>
In-Reply-To: <20190616132930.6942-3-masneyb@onstation.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 19 Jun 2019 14:16:57 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+Ne=NEcLbO6C19iOny4bwm_m5QEtcsM78ZDeBmDUVO_Q@mail.gmail.com>
Message-ID: <CAL_Jsq+Ne=NEcLbO6C19iOny4bwm_m5QEtcsM78ZDeBmDUVO_Q@mail.gmail.com>
Subject: Re: [PATCH 2/6] dt-bindings: display: msm: gmu: add optional ocmem property
To:     Brian Masney <masneyb@onstation.org>
Cc:     Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Jun 16, 2019 at 7:29 AM Brian Masney <masneyb@onstation.org> wrote:
>
> Some A3xx and A4xx Adreno GPUs do not have GMEM inside the GPU core and
> must use the On Chip MEMory (OCMEM) in order to be functional. Add the
> optional ocmem property to the Adreno Graphics Management Unit bindings.
>
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> ---
>  Documentation/devicetree/bindings/display/msm/gmu.txt | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/msm/gmu.txt b/Documentation/devicetree/bindings/display/msm/gmu.txt
> index 90af5b0a56a9..c746b95e95d4 100644
> --- a/Documentation/devicetree/bindings/display/msm/gmu.txt
> +++ b/Documentation/devicetree/bindings/display/msm/gmu.txt
> @@ -31,6 +31,10 @@ Required properties:
>  - iommus: phandle to the adreno iommu
>  - operating-points-v2: phandle to the OPP operating points
>
> +Optional properties:
> +- ocmem: phandle to the On Chip Memory (OCMEM) that's present on some Snapdragon
> +         SoCs. See Documentation/devicetree/bindings/soc/qcom/qcom,ocmem.yaml.

We already have a couple of similar properties. Lets standardize on
'sram' as that is what TI already uses.

Also, is the whole OCMEM allocated to the GMU? If not you should have
child nodes to subdivide the memory.

Rob
