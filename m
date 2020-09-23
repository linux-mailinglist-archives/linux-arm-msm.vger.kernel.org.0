Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9387E275CA6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Sep 2020 18:01:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726178AbgIWQBs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Sep 2020 12:01:48 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:37320 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726156AbgIWQBs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Sep 2020 12:01:48 -0400
Received: by mail-io1-f65.google.com with SMTP id y13so24304900iow.4;
        Wed, 23 Sep 2020 09:01:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UUMntkLcXXSXvxzYo5HR63zxDJ+TazuPkjC8x62Vk3Q=;
        b=AsrkXgMWJbkNA8I+fvG6KM9yFIDaEoHPgCDZ6tcXc1YcNwJwnNR6fMqemQx/kX5lYT
         TJqS73hIBMOC2sUQyjW8dr0c+3a5rhT9EACi0Y/eVl3QUjFujEzbR6mc5oNHeXh7w2LL
         nU+NG1XtV9t4RgDeOR29DZ0TuOpT8cOS3tS7+ICkAkLcJzrsZ6djt9CYoCvwG0YC48Zv
         qnmrSizzpur5qpJKp2WiNhQRwQlWVRbDvWrzB9DDcLasNV10F+CCSOhE3ekK7FcSIDmi
         h9dsMHn/JazfpRhnjT1BBQBBVFMhdhrJb3/yIMfl0Sbz4rRP8IcEUu5dI86nEdnk2Iwk
         pvcQ==
X-Gm-Message-State: AOAM53318NIsMpj0gOyjfbozZzi6TagNSHluqZIblePp7diSxvBH3GSl
        I11TcDOFz3PVPnSnR8YAWFYNrqLjQT7+PGI=
X-Google-Smtp-Source: ABdhPJwardiZv7RYG1M5Ig/Up4odNfjH9iGWEOf+kukVwX94Q8LfgdZb4+jj9YPn4aGnAjUBb/TRug==
X-Received: by 2002:a05:6602:2f8a:: with SMTP id u10mr198995iow.72.1600876907051;
        Wed, 23 Sep 2020 09:01:47 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id m18sm29587ila.27.2020.09.23.09.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 09:01:46 -0700 (PDT)
Received: (nullmailer pid 833599 invoked by uid 1000);
        Wed, 23 Sep 2020 16:01:44 -0000
Date:   Wed, 23 Sep 2020 10:01:44 -0600
From:   Rob Herring <robh@kernel.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Vara Reddy <varar@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Sean Paul <seanpaul@chromium.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Clark <robdclark@chromium.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 01/10] dt-bindings: phy: qcom,qmp-usb3-dp: Add DP phy
 information
Message-ID: <20200923160144.GA833543@bogus>
References: <20200916231202.3637932-1-swboyd@chromium.org>
 <20200916231202.3637932-2-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200916231202.3637932-2-swboyd@chromium.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 16 Sep 2020 16:11:53 -0700, Stephen Boyd wrote:
> This binding only describes the USB phy inside the USB3 + DP "combo"
> phy. Add information for the DP phy and describe the sub-nodes that
> represent the DP and USB3 phys that exist inside the combo wrapper.
> Remove reg-names from required properties because it isn't required nor
> used by the kernel driver.
> 
> Cc: Jeykumar Sankaran <jsanka@codeaurora.org>
> Cc: Chandan Uddaraju <chandanu@codeaurora.org>
> Cc: Vara Reddy <varar@codeaurora.org>
> Cc: Tanmay Shah <tanmay@codeaurora.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Manu Gautam <mgautam@codeaurora.org>
> Cc: Sandeep Maheswaram <sanm@codeaurora.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Sean Paul <seanpaul@chromium.org>
> Cc: Jonathan Marek <jonathan@marek.ca>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: <devicetree@vger.kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Rob Clark <robdclark@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  .../bindings/phy/qcom,qmp-usb3-dp-phy.yaml    | 95 ++++++++++++++++---
>  1 file changed, 84 insertions(+), 11 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
