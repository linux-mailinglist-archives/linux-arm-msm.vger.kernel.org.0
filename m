Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F1238E608
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2019 10:17:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730390AbfHOIRw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Aug 2019 04:17:52 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:42812 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730389AbfHOIRw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Aug 2019 04:17:52 -0400
Received: by mail-lf1-f66.google.com with SMTP id s19so1103979lfb.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Aug 2019 01:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Hw7jSAIgwN+rABLfqVTMGBvkTFu0H8DfDB1Vzehui0E=;
        b=R/3iJHmXmu4t2d6jYnZwXJFu7xRlQdiL0AFbNMTP+brJ+S84E6ruCuGVEBHQti/gRa
         38IeRutQH5E/LECRnqD33FqoSANwovOb/qZv0fv+uD6lZPVvKAIJnzwnLhqnbWNalp04
         +b0bDrWP8WZJ3EuCIB2Oz/uoLFeRv+Ib/cLyqBIbO9EJiksmb7SWopg3EKVlK+X4FVYr
         V/Y4E3ctoixt9AZibQ30MYyLa1t8aSkQ+pJ9Gg69+XCyeccigxKZ8/JNYwY3HhgxcJHz
         ZMkoV9yd2MoGlIfF+OX7OcmShgcxNw2DqDwRPCskd1Mxe7jWF/6AKEJbgip4dylfABTj
         QngA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Hw7jSAIgwN+rABLfqVTMGBvkTFu0H8DfDB1Vzehui0E=;
        b=tQHEC0LeNaPN4xcLu4bvtvXfdK1b3TDTTswWPVrELn9V0ltYw2xR7bSaQexrXoHYBU
         kAzfReAJHxDf41rV9iKdnA+9NyslYVJAM2CGU4ailLvdu0nSCSJcMtZmc/WECTw/Ke9Y
         NoQgTN7Q8+Fpyh0S6oIwq/WBnoqVLP7faCn/s6BWbrFTenzsbtVPwK/XGbxbWg6Iabcj
         6rbSMUZrwZVnmKaELvjZ1//O3u0M+tEwMmwJ9Y0QTWOX2qBzZYLBteY9oMDgY6pvYLX2
         KCn0jXTgEze4NBLM3Wd2cMBq4VaJicVX5qn1sULVDak1kcfQokSBjIVmtMIqa/JWkoFY
         zQFQ==
X-Gm-Message-State: APjAAAV70Sh6iF/2VsOvm7azF9pMX1dWERGyKdKKKUgiSTNsmjDZ/Vip
        24B05kcLhrRuRrSLVTmK7Y0iA5X0dyR4aIPQhmu7xQ==
X-Google-Smtp-Source: APXvYqxPxwQsBMfk/OX+yJdpAw36qGQSyoTJ+sTX7VpaAD6F51EWmcwNavIJr21um/O+pXUWt7FUxh9EGojVVK0Hj5o=
X-Received: by 2002:a19:ed11:: with SMTP id y17mr1749758lfy.141.1565857070180;
 Thu, 15 Aug 2019 01:17:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190815004854.19860-1-masneyb@onstation.org> <20190815004854.19860-2-masneyb@onstation.org>
In-Reply-To: <20190815004854.19860-2-masneyb@onstation.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 15 Aug 2019 10:17:38 +0200
Message-ID: <CACRpkdZxSPutW1QNkYQ-T8cVFQDbVBcVyQM00g_8_i8WiFEMDQ@mail.gmail.com>
Subject: Re: [PATCH 01/11] dt-bindings: drm/bridge: analogix-anx78xx: add new variants
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

> Add support for the analogix,anx7808, analogix,anx7812, and
> analogix,anx7818 variants.
>
> Signed-off-by: Brian Masney <masneyb@onstation.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
