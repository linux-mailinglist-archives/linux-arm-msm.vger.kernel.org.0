Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFA6C3992A1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 20:34:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbhFBSgU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 14:36:20 -0400
Received: from mail-ot1-f53.google.com ([209.85.210.53]:38628 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbhFBSgU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 14:36:20 -0400
Received: by mail-ot1-f53.google.com with SMTP id i14-20020a9d624e0000b029033683c71999so3332549otk.5;
        Wed, 02 Jun 2021 11:34:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=v7bb35jhHDO5KmSChe6UgzAJ2YLdRNf6+3Ot3N3cHEw=;
        b=DqzDZr5Ap0HnT0ZHmQ3J5qfde43vKW9lVMV6Sh+FbIDnfdLwwHTh2suhlqBMs7G/MS
         qvqlP5KBYtdPMe01khKFxjSV4QRDwHjESUcPehs5AS2rFBILgnxmr6d5GZz2dULMITmw
         oj0Oht+OAlsA7oqIqWmEK2tI6kaZwPrHu4fUMzJyS7dzRiLBO+tK+BhyOYnZzaOvNb8/
         r8jTJ9f7Fqjo9Z9cm1OwlEHOaZrKCR2JooR4SUcsfQaGBoTk89C8bRNcFjuqPPQMpUnS
         BNYIAa5FjHgcM7WhJFDmVjIeaJR8/rVdO4RWy7YfwC83/XXOiEAdGF/gRQ7Fr5TMTBSn
         5veg==
X-Gm-Message-State: AOAM533vlvZN8Tt5vmJPiSnvofna0YeOfyESUubfceLFjrulMoWxwjcx
        gFCi1AVwG8tPSasqZcqXnw==
X-Google-Smtp-Source: ABdhPJwpbSJ+FHTZMygd+tTbazR6JvvrPj4e9XhrvI/pZhiv08sY74HxC/wpj1Zvl/Ep4SQSbB2U3g==
X-Received: by 2002:a9d:460b:: with SMTP id y11mr17785207ote.330.1622658876193;
        Wed, 02 Jun 2021 11:34:36 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 88sm151977otb.7.2021.06.02.11.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 11:34:35 -0700 (PDT)
Received: (nullmailer pid 3735855 invoked by uid 1000);
        Wed, 02 Jun 2021 18:34:33 -0000
Date:   Wed, 2 Jun 2021 13:34:33 -0500
From:   Rob Herring <robh@kernel.org>
To:     Rajeev Nandan <rajeevny@codeaurora.org>
Cc:     thierry.reding@gmail.com, linux-kernel@vger.kernel.org,
        hoegsberg@chromium.org, sam@ravnborg.org, seanpaul@chromium.org,
        lyude@redhat.com, kalyan_t@codeaurora.org,
        daniel.thompson@linaro.org, abhinavk@codeaurora.org,
        laurent.pinchart@ideasonboard.com, devicetree@vger.kernel.org,
        dianders@chromium.org, linux-arm-msm@vger.kernel.org,
        a.hajda@samsung.com, robdclark@gmail.com,
        freedreno@lists.freedesktop.org, jani.nikula@intel.com,
        dri-devel@lists.freedesktop.org, mkrishn@codeaurora.org
Subject: Re: [v5 4/5] dt-bindings: display: simple: Add Samsung ATNA33XC20
Message-ID: <20210602183433.GA3735793@robh.at.kernel.org>
References: <1622390172-31368-1-git-send-email-rajeevny@codeaurora.org>
 <1622390172-31368-5-git-send-email-rajeevny@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1622390172-31368-5-git-send-email-rajeevny@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 30 May 2021 21:26:11 +0530, Rajeev Nandan wrote:
> Add Samsung 13.3" FHD eDP AMOLED panel.
> 
> Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> (no changes since v4)
> 
> Changes in v4:
> - New
> 
>  Documentation/devicetree/bindings/display/panel/panel-simple.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
