Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95BF89E7CC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2019 14:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729159AbfH0MVy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Aug 2019 08:21:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:44340 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726125AbfH0MVy (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Aug 2019 08:21:54 -0400
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3152022CF5;
        Tue, 27 Aug 2019 12:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566908513;
        bh=eit3RrFqNrNE4vZrZrZF8s6p9Ki/i527M3cLIrYgSgk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=K+bhF6LQlv0PWuqu69sB60FlA8VjbX6q7t88std4fDvwW+Qdv9KvM0+06G4BpppUE
         Tq7Cm1xEVtY69dumS4ki+R8Lx4ZUFhuF9PEy4Xz7vrH+kntlW5Qv1SH6JUm28eC46r
         UVt7J4YMad9VT8qigX+DqJi8v3/FaWGHckQXRWjE=
Received: by mail-qt1-f175.google.com with SMTP id a13so251816qtj.1;
        Tue, 27 Aug 2019 05:21:53 -0700 (PDT)
X-Gm-Message-State: APjAAAVSZkctW86tZeY4a8DwYOE7qx2kYiC25d3J++dfr1JW9/L/onfu
        zLqsZka/A5t4jveqKbxFxr1LDOpgEBdnJ2djPQ==
X-Google-Smtp-Source: APXvYqyA08IogmVH6/eLxgDuudG/7vlKnuGh62iApaH8ZRCJvpE+Z067YCE/LHZReBYhVH85YjaQVbcpek7HBHvUyfc=
X-Received: by 2002:ac8:386f:: with SMTP id r44mr22938146qtb.300.1566908512316;
 Tue, 27 Aug 2019 05:21:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190823121637.5861-1-masneyb@onstation.org> <20190823121637.5861-3-masneyb@onstation.org>
In-Reply-To: <20190823121637.5861-3-masneyb@onstation.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 27 Aug 2019 07:21:41 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLmaE+6Lj6KDgscK3OO=fsCGM=90eRCYK_gBA7bdkEbEg@mail.gmail.com>
Message-ID: <CAL_JsqLmaE+6Lj6KDgscK3OO=fsCGM=90eRCYK_gBA7bdkEbEg@mail.gmail.com>
Subject: Re: [PATCH v7 2/7] dt-bindings: display: msm: gmu: add optional ocmem property
To:     Brian Masney <masneyb@onstation.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        devicetree@vger.kernel.org, Jordan Crouse <jcrouse@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Aug 23, 2019 at 7:16 AM Brian Masney <masneyb@onstation.org> wrote:
>
> Some A3xx and A4xx Adreno GPUs do not have GMEM inside the GPU core and
> must use the On Chip MEMory (OCMEM) in order to be functional. Add the
> optional ocmem property to the Adreno Graphics Management Unit bindings.
>
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> ---
> Changes since v6:
> - link to gmu-sram in example
> - add ranges property to ocmem example to match bindings
>
> Changes since v5:
> - rename ocmem property to sram to match what TI currently has.
>
> Changes since v4:
> - None
>
> Changes since v3:
> - correct link to qcom,ocmem.yaml
>
> Changes since v2:
> - Add a3xx example with OCMEM
>
> Changes since v1:
> - None
>
>  .../devicetree/bindings/display/msm/gmu.txt   | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
