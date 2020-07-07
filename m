Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A59A2165BD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2020 07:08:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727120AbgGGFIl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jul 2020 01:08:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726805AbgGGFIl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jul 2020 01:08:41 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58189C061794
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2020 22:08:41 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id d10so16260032pls.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2020 22:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+UI95l1NjQtL84FXutDU4Ky6htelMt/W5RLSG30AOlc=;
        b=FabY7ftFpQgr2PbvISTb0A6Y8y0eomX1VFrzE36jG7HJRpd0pIeXf6yMc8HbUp7U3H
         ZlI0VyXp7rTYj2/QxG2KGhvd3uN7wZ7ZytMEWcHO2Dkr1sl0bXQ/wlQTN1AUOeOvTtAM
         YndiBITGAm0w1aPbIwYyewqy5xvcau4jggaJR3sQEpxHUppqYz7HJslq1y8wy/5z3xuk
         IASUg2A/w+NB3PNKgCXFyokEZ8UaMSxpGAjn9UlyiaZVBg4IXw8c28L59Mei3ZQ0CG6O
         aDVbyHhcrQTHSY2OcNskZa5m6FCkRoOgoKkZ7nSB64gwFDJot+Ui5N4oXFQvuyHp1D0S
         n3Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+UI95l1NjQtL84FXutDU4Ky6htelMt/W5RLSG30AOlc=;
        b=RMAeTtr+tFPfSaVd2d+3uaVi1dYc6GPywJBk9zxHCaS/IOQ+QTCosKBo3rEKT/o/0R
         6nN+jJ8IGhtGHG2+F0D/eYX4PHmWs7OpxaNMs+SPPhpKIQMhvOPTWtOtryVmjzXvLUJ5
         5wPjopZ+FKwJtlqd9dpHFR+KUUfmNEbyPxe12S8Bb9+RHv/YQHVvY3TyqoWFDg0rdMi4
         cGbiJCNpu7xlD8TxghrB88AnJwqWdcb8nPngfKHJ3YnzNO3HZIcX23zOJoWjRKujDKOE
         +k7pJFZAdgwV70dnrUFjYOxfraYaj5d54iRZD4fRlbYl32rxWrUpyG8oi8mCYJT69N0w
         i7rg==
X-Gm-Message-State: AOAM530gYCxicfD+Xs+D7sNAXG1p4JlTXOJ+Wa2008BV+XgBpcjq8fGI
        08boXyYV0wndvGbWh79nzqBZkg==
X-Google-Smtp-Source: ABdhPJyNCgjyPVrDt9gQMwviLg7kAe7piMq3EJ2aEFfumscMwQafobSfVLxi9F1dEIy3LXZ7LNL6FQ==
X-Received: by 2002:a17:90a:2d7:: with SMTP id d23mr2517517pjd.57.1594098520758;
        Mon, 06 Jul 2020 22:08:40 -0700 (PDT)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id f2sm19775905pfb.184.2020.07.06.22.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 22:08:39 -0700 (PDT)
Date:   Mon, 6 Jul 2020 22:08:37 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: qcom: remove ufs qmp phy driver
Message-ID: <20200707050837.GN11847@yoga>
References: <20200629145452.123035-1-vkoul@kernel.org>
 <20200629192416.GJ388985@builder.lan>
 <20200630045426.GO2599@vkoul-mobl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200630045426.GO2599@vkoul-mobl>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 29 Jun 21:54 PDT 2020, Vinod Koul wrote:

> Hi Bjorn,
> 
> On 29-06-20, 12:24, Bjorn Andersson wrote:
> > On Mon 29 Jun 07:54 PDT 2020, Vinod Koul wrote:
> > 
> > > UFS QMP phy drivers are duplicate as we are supposed to use common QMP
> > > phy driver which is working fine on various platforms. So remove the
> > > unused driver
> > > 
> > 
> > This describes the current state, but the UFS QMP driver had a purpose
> > not that long ago and I would like the commit message to describe what
> > changed and why it's now fine to remove the driver.
> 
> Would below look better, also feel free to suggest as you have the
> more history on this :)
> 
> "UFS QMP driver is dedicated driver for QMP phy for UFS variant. We
> also have a common QMP phy driver which works not only for UFS but
> USB and PCIe as well, so retire this driver in favour of the common
> driver"
> 

How about:

"The UFS specific QMP PHY driver started off supporting the 14nm and
20nm hardware. With the 20nm support marked broken for a long time and
the 14nm support added to the common QMP PHY, this driver has not been
used in a while. So delete it."

Regards,
Bjorn

> > 
> > I'm happy with the patch itself (i.e. the removal of the driver) though.
> 
> Thanks
> -- 
> ~Vinod
