Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4DCA207A78
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2020 19:44:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405522AbgFXRoB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jun 2020 13:44:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405612AbgFXRoA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jun 2020 13:44:00 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BFC9C061795
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2020 10:44:00 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id k1so1336874pls.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2020 10:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=blPOdTajVn4OJWy527Nm/cJEP9dim0oSKgwxjjYh5Yk=;
        b=Wca+aKs6OCeCLlQZHE2jtvWB9Igz6JI4h9CAPSmdajSZfhp2ZUPUCRDHujdfiLw847
         RY+1k9HzrWuintQ1IOg0AvP8qZaBBwDF4rut0xOtMGygpnJK8PHQskMf03hSw+HiPVN1
         oxn1UkEEkBskJoSBUGnoEZcMTz1dNz834ktawILifAj0yQ4aUyK9pBs6xHm+h0Ljrf+y
         rFbYYzWRA5j14xgc5ygP+TrFiJ3HazqFe2tZLTx5XJ8stS8GbnLwxdSUQj0nGIGycoYP
         ZeXu3B8KwzSYDlcjgCzItlFn+A2QCmb5X4lC1VIJd3pDehc2NmqWTjMxU68j3EGSHcex
         Gr5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=blPOdTajVn4OJWy527Nm/cJEP9dim0oSKgwxjjYh5Yk=;
        b=McyHTnWRTYWLNlTLoAdLHCKwk21Inog/J9Y6xp5X7ZQDIwTqREZ8FzRiK+oUUbpJRo
         pzGe6GQKpbgiEJaySeTlEJtrvPjm+YNUtYYGQELZx2lQ0ulh/1OI4ss96aIrEB/DYZoc
         KJIcNBzn76rZtGQn5dFY5TrSzdtlC5mWo0hnrrI7EbrtiMu1Ep3zhpiIK+HU+qw8CfCF
         o0hBQuHjoEbe0WzE1TKKALayRXs+DJhJY/0JFDy4GdNh+1BWN/Mn7QrG4t4GqiUKq2/c
         hs1Mb3627xZif1B44t7BT1g6QQ+SKsv+XhHoH2tZlHMquUPicjA9az0DphS8gmJ7FSDW
         HLwg==
X-Gm-Message-State: AOAM530UL5vQfDI3g+n2TuB4HcCGreqD0rbV8VD8jFvzqb+MMD/SluyI
        Hgh5xd6neNiuqmyxsXA1n+dCGg==
X-Google-Smtp-Source: ABdhPJyNVz7Caxp0j/OEjoO/h6oiEfmM/aIeAAklNOAuzgysJYahbgohTEF9YUzi6hvucALYQ5uqlg==
X-Received: by 2002:a17:90b:238d:: with SMTP id mr13mr30519050pjb.19.1593020639461;
        Wed, 24 Jun 2020 10:43:59 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id h13sm20588371pfk.25.2020.06.24.10.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 10:43:58 -0700 (PDT)
Date:   Wed, 24 Jun 2020 10:41:17 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Sivaprakash Murugesan <sivaprak@codeaurora.org>, agross@kernel.org,
        kishon@ti.com, robh+dt@kernel.org, mgautam@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH V3 0/5] Enable USB support in IPQ8074
Message-ID: <20200624174117.GU128451@builder.lan>
References: <1591625479-4483-1-git-send-email-sivaprak@codeaurora.org>
 <20200624171834.GH2324254@vkoul-mobl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200624171834.GH2324254@vkoul-mobl>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 24 Jun 10:18 PDT 2020, Vinod Koul wrote:

> On 08-06-20, 19:41, Sivaprakash Murugesan wrote:
> > IPQ8074 has two super speed USB ports, with QMP and QUSB2 PHYs.
> > This patch set enables the USB PHYs and USB dwc3 in IPQ8074.
> 
> Applied 1 thru 4. Bjorn can take the 5th one, thanks
> 

Thanks Vinod, I've applied and pushed out patch 5.

Regards,
Bjorn
