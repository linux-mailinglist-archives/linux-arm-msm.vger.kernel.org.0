Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 470B727D714
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Sep 2020 21:41:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728367AbgI2Tla (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Sep 2020 15:41:30 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:35378 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727700AbgI2Tla (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Sep 2020 15:41:30 -0400
Received: by mail-oi1-f194.google.com with SMTP id w16so6803679oia.2;
        Tue, 29 Sep 2020 12:41:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sJ7YkgOz8i3irzVIPv/sXkuM9djFbty0kO0zCwYqlSw=;
        b=dA1vMIbfD5gQXQab8g57mQe+x1T999Oq5obmaceakGsDDuoF9KBFGaPqyFzAZdWj8I
         XB0feeZUBHGlMu1LCe9+xfk/0YX+CPlUaG7D17e/R2F3nUhI/YexGIJbcMdXqZ2YwG9k
         ItNPb8lUIF6hiCH3ax2htqzXo8wIjv5E7+rNarfNrdsNxHt/Bwff9dOzJPtXAVDBauBO
         Q9PVqF4VGFE98fK/pwYtgW9lrGUdS9LqL6p6QYVHlDKt1cGpS9OuxKB8EQ3Hj9jHiu9L
         iFg3zO2WFiqXDNx6rU5qvEAWQViqSQNMm+L2GczbBCtRoWI5upqPeFoWOM36d8iFuABf
         KSiw==
X-Gm-Message-State: AOAM533KZlAVo9yda9eI3jOmOiaMIunC0LEB7RCdBSq8DUa9kp3X5zhP
        RPRpouHO/LGcmaYt5UnD/g==
X-Google-Smtp-Source: ABdhPJxM7cgu2wM21FpDnae9IpBVGD6PA3tfuQhAN79/9TJMzMoSsUN094B9V/aLWeOqzSBdwO+hLg==
X-Received: by 2002:aca:cfc2:: with SMTP id f185mr3733588oig.56.1601408489357;
        Tue, 29 Sep 2020 12:41:29 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id o13sm1225641otj.2.2020.09.29.12.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 12:41:28 -0700 (PDT)
Received: (nullmailer pid 1034926 invoked by uid 1000);
        Tue, 29 Sep 2020 19:41:26 -0000
Date:   Tue, 29 Sep 2020 14:41:26 -0500
From:   Rob Herring <robh@kernel.org>
To:     Ajye Huang <ajye.huang@gmail.com>
Cc:     Jaroslav Kysela <perex@perex.cz>, Andy Gross <agross@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Patrick Lai <plai@codeaurora.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        tzungbi@chromium.org,
        Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
        alsa-devel@alsa-project.org, dianders@chromium.org,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        cychiang@chromium.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] ASoC: qcom: dt-bindings: Modify sc7180 machine
 bindings
Message-ID: <20200929194126.GA1034850@bogus>
References: <20200928063744.525700-1-ajye_huang@compal.corp-partner.google.com>
 <20200928063744.525700-2-ajye_huang@compal.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200928063744.525700-2-ajye_huang@compal.corp-partner.google.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 28 Sep 2020 14:37:43 +0800, Ajye Huang wrote:
> Add compatible "qcom,sc7180-sndcard-rt5682-m98357-2mic"
> for 2mic case.
> 
> Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
> ---
> This patch depends on this patch series
> https://patchwork.kernel.org/patch/11773221/ .
> 
>  .../bindings/sound/qcom,sc7180.yaml           | 64 ++++++++++++++++++-
>  1 file changed, 63 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
