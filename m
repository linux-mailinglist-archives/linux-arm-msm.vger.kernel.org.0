Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB680361480
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Apr 2021 00:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234941AbhDOWEp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Apr 2021 18:04:45 -0400
Received: from mail-ot1-f50.google.com ([209.85.210.50]:37519 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234735AbhDOWEp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Apr 2021 18:04:45 -0400
Received: by mail-ot1-f50.google.com with SMTP id c8-20020a9d78480000b0290289e9d1b7bcso9921613otm.4;
        Thu, 15 Apr 2021 15:04:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cjrjUXHacNvGNDk7Q/C+ESbCLjg4Pa5yFyEf+O/Q6Rk=;
        b=qwEY+POX/67u1x//6jonW/ZjR6UcIb/ZjbFT39/33rBTbIjKdA4iNiMX9eAkTH3Hii
         qHgsCSBm8//LkMgn2+66nulMeeX0xXb6mipZFWzNqZA4aJG2ynuHhG8WmRdpy4Yqwwzn
         Mn3QNGMnPPR1Dp6wLk+WxuGY+IFbxQdWdutHYyPxnpnD+gVKFHWk2LNlro0u9ifKqh6j
         k7L/2xu0uZkMBMOy5AHTd2xKCnJ7vvbOEGEOy7P0RuEWE22ktBgFCFDkTPGEWkkPGgXo
         aZR9Zi81RBeFfjW4SAfTvGquGd6Fho9EmJ7+OnCyT0U+2XjCiHriFkm+rSR6jyDO1n3Q
         T5Bw==
X-Gm-Message-State: AOAM531JN3UyYcLuOFvjCeW8Z7jR6GFbw5rZF/kdjCTMTwSDZD9AQO8q
        +5WoPUmjMAUQRuUwkwUvAw==
X-Google-Smtp-Source: ABdhPJzs5cTY0YiItEz95ckGhd4fP2bum5/rIk1QKiYpZyI1sYfO1Yo40mAXSSBYGF8zxgIXNDa72A==
X-Received: by 2002:a05:6830:1e15:: with SMTP id s21mr1077237otr.334.1618524260057;
        Thu, 15 Apr 2021 15:04:20 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l9sm820713oog.32.2021.04.15.15.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 15:04:18 -0700 (PDT)
Received: (nullmailer pid 1959975 invoked by uid 1000);
        Thu, 15 Apr 2021 22:04:16 -0000
Date:   Thu, 15 Apr 2021 17:04:16 -0500
From:   Rob Herring <robh@kernel.org>
To:     Rajeev Nandan <rajeevny@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        dianders@chromium.org, mkrishn@codeaurora.org,
        kalyan_t@codeaurora.org, hoegsberg@chromium.org,
        abhinavk@codeaurora.org, seanpaul@chromium.org
Subject: Re: [v1 2/3] dt-bindings: drm/bridge: ti-sn65dsi86: Document
 use-aux-backlight
Message-ID: <20210415220416.GA1954887@robh.at.kernel.org>
References: <1618418390-15055-1-git-send-email-rajeevny@codeaurora.org>
 <1618418390-15055-3-git-send-email-rajeevny@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1618418390-15055-3-git-send-email-rajeevny@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Apr 14, 2021 at 10:09:49PM +0530, Rajeev Nandan wrote:
> If the panel connected to the bridge supports backlight control
> using DPCD registers on the DisplayPort aux channel, setting
> "use-aux-backlight" property in the bridge node will enable the
> registration of a DP aux backlight device from the bridge driver.
> 
> Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
> ---
>  .../devicetree/bindings/display/bridge/ti,sn65dsi86.yaml          | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> index 26932d2..c8d8c00 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> @@ -58,6 +58,12 @@ properties:
>    clock-names:
>      const: refclk
>  
> +  use-aux-backlight:

use-dp-aux-backlight perhaps.

> +    type: boolean
> +    description:
> +      The panel backlight to be controlled using DPCD registers on
> +      the DP aux channel.

Sounds like a property of the panel, not the bridge. So it should be in 
the panel node.

Rob
