Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 415CA3AD394
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jun 2021 22:25:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233005AbhFRU1x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Jun 2021 16:27:53 -0400
Received: from mail-oi1-f180.google.com ([209.85.167.180]:36709 "EHLO
        mail-oi1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230430AbhFRU1w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Jun 2021 16:27:52 -0400
Received: by mail-oi1-f180.google.com with SMTP id r16so11887359oiw.3;
        Fri, 18 Jun 2021 13:25:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WVZFxq0uwab/s1SzBZaz7rJYhU+TMH4wQVGntZpYwYw=;
        b=T5ObHyUloSllXMRsOZg8bOOQ6+1Xg6YVC3e90a0taQeYgj7CuAbyY61IVnPGJeTDPA
         bWMjdn4I0xLJUBkOa97omtfwPeihAskdBB1KNtlXuMOTP+ehraFA+lXCC8z1hpBSjLMD
         er1OfitWK96VPNtntwzoEpBCXNPnECAzhOi8Wq1Luh845+9qmsjIWAniULA5ypUfutpb
         WWE1iqWfo2R0k4icuacEwvE1AXqdVnrUoLlxrqAfyzX+cxHeQB2nmeUJzbw1b3K9edMB
         jB3jZz096ktlNMmOFdhyhOKrun6gSpVAB4XUNcxfWMK+WrK+Be5iAbGyFkxzmA4FnQOw
         v1ZQ==
X-Gm-Message-State: AOAM5301Fr/bpa7np/32y9tChoBvegqO9aWYn5wT5es3Vgakxztsz37A
        QyB40wHEdZUZQvI4nYr/sw==
X-Google-Smtp-Source: ABdhPJxFKFsQb927hYOCKVZGkpQgWv9cj77tBwO/Ytkk9skPRgKEjJO81E0tgzUBO0Djq6r6Drc1ew==
X-Received: by 2002:a05:6808:141:: with SMTP id h1mr8789395oie.15.1624047941887;
        Fri, 18 Jun 2021 13:25:41 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id p65sm2037712oop.0.2021.06.18.13.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 13:25:41 -0700 (PDT)
Received: (nullmailer pid 2819508 invoked by uid 1000);
        Fri, 18 Jun 2021 20:25:35 -0000
Date:   Fri, 18 Jun 2021 14:25:35 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     ulf.hansson@linaro.org, rjw@rjwysocki.net,
        linux-kernel@vger.kernel.org, swboyd@chromium.org, ohad@wizery.com,
        mathieu.poirier@linaro.org, rishabhb@codeaurora.org,
        dianders@chromium.org, sidgup@codeaurora.org, agross@kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 12/13] dt-bindings: msm/dp: Remove aoss-qmp header
Message-ID: <20210618202535.GA2819457@robh.at.kernel.org>
References: <1623080372-13521-1-git-send-email-sibis@codeaurora.org>
 <1623080372-13521-13-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1623080372-13521-13-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 07 Jun 2021 21:09:31 +0530, Sibi Sankar wrote:
> Remove the unused aoss-qmp header from the list of includes.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
