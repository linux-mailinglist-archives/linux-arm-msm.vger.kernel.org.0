Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFCAA2FF1E9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jan 2021 18:29:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733270AbhAUR15 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Jan 2021 12:27:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388036AbhAUR1x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Jan 2021 12:27:53 -0500
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D722C061756
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jan 2021 09:27:08 -0800 (PST)
Received: by mail-oo1-xc33.google.com with SMTP id v19so692913ooj.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jan 2021 09:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oa/WlyzI1t1uo49jIQ3nlsFVHbY2DgsZWB05ly/k8lg=;
        b=QluiuTKvgz/tsNDHzWjmgWjImUK5Qq6O9z8ss/nQki7j71tJHadQnqp/nLjuAPY/iY
         pZtRtkK8OLtO/CPidiugOZzJ+ZVa0omO/8B8cECJgHsSP7xh/zrVLvd1kxmjRmMmNF5S
         Nb+HY8UvcFoQiwwSbZ4HcNXiKRqlv6PlZDQxIMnMePpwQi3uMdi3nA/p5TuYyifdy0Qp
         sp6pIoZmspMP934FKTDyYCsgRGtSWbMel1dmNftC8T0/6Ue6XdmxJSEnNZAd75FtV/Y0
         agQZqX2KvO2buP9AGvHRi3BKxEvysCpWgPOOsrR0bSGLaX9iOBLD/qTEXrY7jyu8x8U3
         1PRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oa/WlyzI1t1uo49jIQ3nlsFVHbY2DgsZWB05ly/k8lg=;
        b=Vl9ru5aW9UTYDXxnJ41R0bii0gSb0S8AHWGaZOQhnYKTwVKvGU36bqWzOASMtEYRTx
         KS+FEMk8I9MPSwW7ia98vEFHaNpAVAZ2V51imJ++EoApu6zvZbb2/oZ75qcYNNtkgCss
         Y/CcdBYRsAv5DoEYozoHhTEG04iUqT1CIwxIfhTrnEuVELQFH1wcKrYYRMpE13aZnxjk
         HTaBOnDSCKs90aBTydtJ1o/Zkz0SEyWUF2T0UfN2ZyTgkMTbCUrvuT6+lGWlGpht1IzF
         n2WfTpmGz7/gHwgamBaGgR5ntjU7oygjKnr1EJ8/EWH0XBJF5gzHilduuVvs/pO8M3X0
         64xQ==
X-Gm-Message-State: AOAM533olhusFG8rtTjWk0EWqaoM8J5gJsB67VUg0xcnhB/8HlqmaUI0
        5AhzLAezvYlCCTqnwVRrCbs7UA==
X-Google-Smtp-Source: ABdhPJyBs3fFzgKIzhqWkdoZMbLxqO+3+KDvlPsoaZCMvaTQqmg6dx9sfO9UItazUxpFXL0ceEb/eg==
X-Received: by 2002:a05:6820:255:: with SMTP id b21mr572162ooe.0.1611250027694;
        Thu, 21 Jan 2021 09:27:07 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 69sm1151286otc.76.2021.01.21.09.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 09:27:07 -0800 (PST)
Date:   Thu, 21 Jan 2021 11:27:05 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Raghavendra Rao Ananta <rananta@codeaurora.org>,
        Jeevan Shriram <jshriram@codeaurora.org>
Subject: Re: [PATCH v5 2/2] pinctrl: qcom: Add SM8350 pinctrl driver
Message-ID: <YAm5afOWs95tN0vf@builder.lan>
References: <20210121171747.3161543-1-vkoul@kernel.org>
 <20210121171747.3161543-3-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121171747.3161543-3-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 21 Jan 11:17 CST 2021, Vinod Koul wrote:

> This adds pincontrol driver for tlmm block found in SM8350 SoC
> 
> This patch is based on initial code downstream by Raghavendra.
> 

> Signed-off-by: Raghavendra Rao Ananta <rananta@codeaurora.org>

With Raghavendra's s-o-b here he should be From:, but based on the
changes you've done I don't think he has certified the origin of this
patch anymore.

So the line crediting his work above and your alone S-o-b seems more
reasonable.


For the content of the patch:

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Jeevan Shriram <jshriram@codeaurora.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
