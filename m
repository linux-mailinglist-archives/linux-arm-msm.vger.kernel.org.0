Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E06AC8E664
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2019 10:31:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730456AbfHOIba (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Aug 2019 04:31:30 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:37060 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730987AbfHOIb2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Aug 2019 04:31:28 -0400
Received: by mail-lj1-f196.google.com with SMTP id t14so1568314lji.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Aug 2019 01:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i/yfx5NeV3piU61gQdhfpnzlq/6GHBCfJ8yX0HleDDU=;
        b=rild4YlbRJU5wL1IgqlE2vanKqYTSRQWlpn+ut7lNDUUlySGDV7+Y8nqmVm+tCwfxP
         fF1pS/jvkhsXhDQfovqqUYoMMEuBrEOoaEvG9VehZ0mOPwEwFthyG/8t4T9NhYyj+9z7
         FzROK9y8F90mbOlCBpBB3Cs0Wsy2z2VXmF2A6AIthCV1UjCJy3cWW4NUevVl6c7gzRFE
         lhuLhtLiW5z6R3PgaVYhzlPmCe/GYpAoE3SKp03R8Th06dkcUEhoaSCZMhVg87OOSPKi
         C2YXbDeXfFo9O6FWqdUSAYbCNXAkpH48L0fivxYoziaZy8TFVo0Sel5vSyvt7y6cgRW6
         L1UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i/yfx5NeV3piU61gQdhfpnzlq/6GHBCfJ8yX0HleDDU=;
        b=EB3qQt7v47BwNaOivwRNKWGPqUWtZy6qNyA8dr4rXKGDNbQk1gyFCVXLb473rFCtCF
         lT0YrTFmE76vH4o0YKHH/42+Nmvv7WYmJCpFSoVbSkk2pJmRK1zrL4cS20bWH8HzEomN
         NO4nSiKTqYBIAueLhAUeddCix72rpHZIeJQngpcKk+iL0CFSB14gK4UIGJ89a3DFKtYi
         YKgUspqvOtaq/X+0qkZYkSMgiYuDfGk5zh07zo9R4Ggf6ShOrVJTrVnjRh41j+Qcb8Nn
         F4aUOElgp/LCabCYb/6lmD6YhA+fTgelogA12+bQObiilGAMlCbihWgq/oPqNmZKKSEF
         e3GQ==
X-Gm-Message-State: APjAAAUBucEe7rpKO4128nE2Eu3j3kf6jIXJJ7GALsRevt52uTdSscPZ
        KMcg4qDZQTloy4I3SBDxrfb4kzwaOrjRXd8AdmQXMA==
X-Google-Smtp-Source: APXvYqzsrobqE4nMFnjhW6qVN2v/WuS6+a4azs9xd0z0wQrNczcpbiWvts190l19juTT3G+lBBGs1PS8c9qSK1SDMvQ=
X-Received: by 2002:a2e:3a0e:: with SMTP id h14mr2084652lja.180.1565857886156;
 Thu, 15 Aug 2019 01:31:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190815004854.19860-1-masneyb@onstation.org> <20190815004854.19860-12-masneyb@onstation.org>
In-Reply-To: <20190815004854.19860-12-masneyb@onstation.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 15 Aug 2019 10:31:14 +0200
Message-ID: <CACRpkdYSHHqY50=3yo0QDinTaXbO9GzHoOFqMS4K3SiNghssGA@mail.gmail.com>
Subject: Re: [PATCH RFC 11/11] ARM: dts: qcom: msm8974-hammerhead: add support
 for external display
To:     Brian Masney <masneyb@onstation.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 15, 2019 at 2:49 AM Brian Masney <masneyb@onstation.org> wrote:

> Add HDMI nodes and other supporting infrastructure in order to support
> the external display. This is based on work from Jonathan Marek.
>
> Signed-off-by: Brian Masney <masneyb@onstation.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
