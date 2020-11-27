Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D12F82C6917
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Nov 2020 17:06:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730826AbgK0QGM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Nov 2020 11:06:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730324AbgK0QGM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Nov 2020 11:06:12 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21A17C0613D4
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2020 08:06:12 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id f17so4670671pge.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2020 08:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5y0cnCOSgeEuZwjF+lwNyk9ZCoaXsS5uH8ZnqDQJLGw=;
        b=tCTUScwH0byDPkT48N7M1GJPlekh3+TwXyKTpUudGHK3ODmu1Dda/NPabCIFKJA1pq
         6rU/C30wUUfgMrrNHYjIpriDpAs9V0g6yWCSMYmSgu/ucek7JCgCODNdz0CM/Knc3Rn5
         JGLGwuD+HO0pizkWONJ0dlc3xSqEew9ssP3xbMAp2+qgn9qSw0M9gblYy3BgsgVXLusp
         1v1S7hbPq1Q5L85LtddTcXBPznAoGvBuUIysz4NX8gDeNDmao6vOBDKnX19/KtuZhpH1
         AbxAWnViK43ShTtxjpwXRiZX6BhzBq3vqniBFJGZliRhfb8LjXvGU/XiyI7JsAJt81w1
         9qQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5y0cnCOSgeEuZwjF+lwNyk9ZCoaXsS5uH8ZnqDQJLGw=;
        b=AGFFlnvOgADSMEzbEj21Y5Z+ZUbKh8iWPz2bGk/82aihL4iaQQI3c8QrlffP0OyGab
         KhgVhz11SpjZGDxlnrFQ9SDVenl16EUQyWG1zxtJyGQkoby1sXdX13uwr7/z3FuxWVq/
         5tuz032oo8JBzIwNgsZbQN8rldfHGkwUZcADNIR2qFAHYeTAvDC72oM4IBsbp2bioxqG
         3iwBf6bCZyl6K5hGZLr0xAx7Rk1xgmNcf024p3Pw5Q20nR74PxQ0mxoYM/eXkZQVtETw
         Vp4PITjJfFfx/rNzp00iyO+VRxmLmfSnhVizvPaLj8vzEdRhlgKX//Y72qIc0diio0a5
         3adA==
X-Gm-Message-State: AOAM533q+tAs9kgHzfD2usESPPrcHuyeJKAC+9GzjiA1IPhd9maZJJGO
        5sfdunBVnKxrDvLJ4bDete08
X-Google-Smtp-Source: ABdhPJx4PpbtAXHxtk99kkXV1YNZJcl745XhfowqzK9csFKk/5laSELRUQqFg73QzUOtH09NSkk1QA==
X-Received: by 2002:a17:90a:68c3:: with SMTP id q3mr10906760pjj.135.1606493171411;
        Fri, 27 Nov 2020 08:06:11 -0800 (PST)
Received: from thinkpad ([2409:4072:88d:6f0d:1941:b53e:6208:a8c9])
        by smtp.gmail.com with ESMTPSA id h11sm8258263pfn.27.2020.11.27.08.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 08:06:10 -0800 (PST)
Date:   Fri, 27 Nov 2020 21:36:02 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Robert Foss <robert.foss@linaro.org>
Cc:     loic.poulain@linaro.org, bjorn.andersson@linaro.org,
        wsa@kernel.org, todor.too@gmail.com, vkoul@kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: qcom: Fix IRQ error misassignement
Message-ID: <20201127160602.GA3096@thinkpad>
References: <20201127133937.93208-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201127133937.93208-1-robert.foss@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 27, 2020 at 02:39:37PM +0100, Robert Foss wrote:
> During cci_isr() errors read from register fields belonging to
> i2c master1 are currently assigned to the status field belonging to
> i2c master0. This patch corrects this error, and always assigns
> master1 errors to the status field of master1.
> 
> Fixes: e517526195de ("i2c: Add Qualcomm CCI I2C driver")
> 

You don't need a new line here.

> Reported-by: Loic Poulain <loic.poulain@linaro.org>
> Suggested-by: Loic Poulain <loic.poulain@linaro.org>
> Signed-off-by: Robert Foss <robert.foss@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani
