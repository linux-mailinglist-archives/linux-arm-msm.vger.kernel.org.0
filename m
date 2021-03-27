Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D11AA34B7E4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Mar 2021 16:19:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230240AbhC0PSD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 27 Mar 2021 11:18:03 -0400
Received: from mail-oi1-f172.google.com ([209.85.167.172]:41673 "EHLO
        mail-oi1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230187AbhC0PSC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 27 Mar 2021 11:18:02 -0400
Received: by mail-oi1-f172.google.com with SMTP id z15so8818132oic.8;
        Sat, 27 Mar 2021 08:18:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mRsXly+RxVFW6q+eaFwk4j9QBv6mhLEJ0KZQv7gm/oo=;
        b=IqOrssPzosVt/ZhlbSC+JiZjCJflG5bzQOvOHnDyx/yAr8dJ4TWs58taSvuS8g4+4U
         HFmBS3qamygaXR7t/+qo/X1VCZgBhLNpcyVxhcNtLbQwGaJpVq8H9qRhYEw33sI3HghI
         oOhc7ESnTYRTHRMR4chGSwej9WHcbAXJF9vb9Z0U2K5o62ByREAZzF2EOjmsP6wl1qLD
         9RuZim8h3mcLgtlF92Setkzhm9ZzPZ4WSBNCCHjCcXGA/9XgrAwRXwUlg36twN+0igas
         Z8BUA7lJVy44Fh04nT+MIF7cmHbhP7scY9tIiyONGZ3Z2kQyfE52/mxIzHYzfbYabzre
         jvWQ==
X-Gm-Message-State: AOAM530CNK39a9vnRjNmGIl+kp5OwIrc3KUaokFKxNiUaINVlkPIRXt4
        L0RrvjrNmxgEInWivU1F9w==
X-Google-Smtp-Source: ABdhPJzbzyJ57Ib01gjWdjSi6adGZkj1zs0hA//smxfk/+loB0Np9usklk33UZceSViKRyaQ2ODELQ==
X-Received: by 2002:aca:4990:: with SMTP id w138mr13677238oia.116.1616858281620;
        Sat, 27 Mar 2021 08:18:01 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.102.185])
        by smtp.gmail.com with ESMTPSA id 62sm1102128oto.60.2021.03.27.08.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 08:18:00 -0700 (PDT)
Received: (nullmailer pid 136209 invoked by uid 1000);
        Sat, 27 Mar 2021 15:17:57 -0000
Date:   Sat, 27 Mar 2021 09:17:57 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>
Subject: Re: [PATCH v4 1/7] dt-bindings: phy: qcom,qmp-usb3-dp-phy: move usb3
 compatibles back to qcom,qmp-phy.yaml
Message-ID: <20210327151757.GA136162@robh.at.kernel.org>
References: <20210326175809.2923789-1-dmitry.baryshkov@linaro.org>
 <20210326175809.2923789-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210326175809.2923789-2-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 26 Mar 2021 20:58:03 +0300, Dmitry Baryshkov wrote:
> The commit 724fabf5df13 ("dt-bindings: phy: qcom,qmp-usb3-dp: Add DP phy
> information") has support for DP part of USB3+DP combo PHYs. However
> this change is not backwards compatible, placing additional requirements
> onto qcom,sc7180-qmp-usb3-phy and qcom,sdm845-qmp-usb3-phy device nodes
> (to include separate DP part, etc). However the aforementioned nodes do
> not inclue DP part, they strictly follow the schema defined in the
> qcom,qmp-phy.yaml file. Move those compatibles, leaving
> qcom,qmp-usb3-dp-phy.yaml to describe only real "combo" USB3+DP device nodes.
> 
> Fixes: 724fabf5df13 ("dt-bindings: phy: qcom,qmp-usb3-dp: Add DP phy information")
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: Sandeep Maheswaram <sanm@codeaurora.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml         | 2 ++
>  Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml | 2 --
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
