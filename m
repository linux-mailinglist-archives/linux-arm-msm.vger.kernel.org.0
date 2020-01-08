Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59243134E4B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2020 22:01:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726836AbgAHVBa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jan 2020 16:01:30 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:36056 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbgAHVBa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jan 2020 16:01:30 -0500
Received: by mail-ot1-f68.google.com with SMTP id 19so5015050otz.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jan 2020 13:01:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cfgEMc+35hwGrpRDO6jOoEHppPRh3rhAd34tDj1m5RU=;
        b=c4JqF/hOyvm64391KF0wkfoew7Gov7niBS5t3sv+56rkT8h701ciWDYpD72n/RLuzn
         rRA+LbnjNFLoCcxW47PQ+Xb75JLMA2mpZzJ3ONyHu97jx2+sKC4bXbNIWooDqJWiLsVF
         A9hOjSRwqEATIrJbVIihZbPAuh7okeGASGNzt8imOwXARH726buD0wHStQAxf4ffgaw3
         gDJYuvocLE9ApGA98YFq0VLgyYOxUxRAqFlzkRQiMCoSTIDrqRFi/VUznapz+kOhJDuI
         +0lw7fVWW0Wiqw+IWvUiwza5ymUsEcFSVS5iG69yuhQ0k3G1FOv/HiM/M0FUuDanGIos
         sn6g==
X-Gm-Message-State: APjAAAXEt1wXFv7AbSAm9qEHEaM+sOQZJio13ad1kIMNsg/Ei4Affnts
        LigQJX205twO8mJU58nwSBK/uSE=
X-Google-Smtp-Source: APXvYqylOxbJdcE5yAHiGvjgt/DHmyBDea6zo84ae9hsxx+bm/sJbfi905vU9dJp1gmWi4ahsa48Hw==
X-Received: by 2002:a9d:7f83:: with SMTP id t3mr5290361otp.115.1578517289480;
        Wed, 08 Jan 2020 13:01:29 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 26sm1491838oij.9.2020.01.08.13.01.28
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 13:01:28 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 220333
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 08 Jan 2020 15:01:27 -0600
Date:   Wed, 8 Jan 2020 15:01:27 -0600
From:   Rob Herring <robh@kernel.org>
To:     Harigovindan P <harigovi@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        robdclark@gmail.com, seanpaul@chromium.org, sean@poorly.run
Subject: Re: [PATCH v2 1/2] dt-bindings: display: add sc7180 panel variant
Message-ID: <20200108210127.GA17138@bogus>
References: <1578396597-18324-1-git-send-email-harigovi@codeaurora.org>
 <1578396597-18324-2-git-send-email-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578396597-18324-2-git-send-email-harigovi@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jan 07, 2020 at 04:59:56PM +0530, Harigovindan P wrote:
> Add a compatible string to support sc7180 panel version.
> 
> Changes in v1:
> 	-Added a compatible string to support sc7180 panel version.
> Changes in v2:
> 	-Removed unwanted properties from description.
> 	-Creating source files without execute permissions(Rob Herring).
> 
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> ---
>  .../bindings/display/visionox,rm69299.txt          | 48 ++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/visionox,rm69299.txt

As I send in v1, please make this a DT schema. See 
Documentation/devicetree/writing-schema.rst.

Rob
