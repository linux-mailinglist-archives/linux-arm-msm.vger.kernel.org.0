Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C7CC380778
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 May 2021 12:38:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229554AbhENKjn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 May 2021 06:39:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:45926 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229525AbhENKjn (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 May 2021 06:39:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3CA8061457;
        Fri, 14 May 2021 10:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620988712;
        bh=mOpzQx5hfR8rcNY8S8uuarhuN/WjFaes5/dIxgPAEzI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=couzxGbMlwfzbJn6BDauX9QR9FI8zVAO0K1sZlCSMc+CfciCs8nlCXu+Uwoh6XuLb
         6Bjg2Vj6ogy8jA0dkG6HKWqsAYQKCvyqACvS35aTmNDtLEFY9Ihaye24dVirJFbFf/
         RLhi+HOGU6xSurdm6RkSIRXlL/+/pzFMToDzpy+SDFiRRo7QZK3c/SnkgNUXHchmWv
         VTun1RcHqaRRPmN+v9SW39tgQQXImZgiCzegmRQD1vCZw05A3xLpb3I19IWXVv5yCa
         9JRcXiPizs/Vofik9Qhxk5QBdJkCOXWmqXkNve5+jTJ5rPMft+hZztikBBl3vr/9n/
         CSZFaZ7WAusWw==
Date:   Fri, 14 May 2021 16:08:28 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Clark <robdclark@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, sbillaka@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] phy: qcom: Introduce new eDP PHY driver
Message-ID: <YJ5TJFD/RFEQc5z+@vkoul-mobl.Dlink>
References: <20210511041930.592483-1-bjorn.andersson@linaro.org>
 <20210511041930.592483-2-bjorn.andersson@linaro.org>
 <CAE-0n50qWuny_1oYEMSZ+cfmCvnumk_UTPxUvZ-3wWdgOCioNA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n50qWuny_1oYEMSZ+cfmCvnumk_UTPxUvZ-3wWdgOCioNA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10-05-21, 22:22, Stephen Boyd wrote:
> Quoting Bjorn Andersson (2021-05-10 21:19:30)
> > Many recent Qualcomm platforms comes with native DP and eDP support.
> > This consists of a controller int he MDSS and a QMP-like PHY.
> >
> > While similar to the well known QMP block, the eDP PHY only has TX lanes
> > and the programming sequences are slightly different. Rather than
> > continuing the trend of parameterize the QMP driver to pieces, this
> > introduces the support as a new driver.
> 
> Thank you for not slamming it into the same mega driver.
> 
> >
> > The registration of link and pixel clocks are borrowed from the QMP
> > driver. The non-DP link frequencies are omitted for now.
> 
> Can we make some library code for "DP" stuff in qmp that the two can
> call to share the logic?

I think we should split QMP into a library of common code which the
respective function driver DP, UFS, USB QMP drivers (re)use across...

-- 
~Vinod
