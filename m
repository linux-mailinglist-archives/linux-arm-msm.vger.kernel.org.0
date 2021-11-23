Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE43F459B61
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Nov 2021 06:10:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230160AbhKWFNq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Nov 2021 00:13:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:54568 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229468AbhKWFNp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Nov 2021 00:13:45 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 45A8B6056B;
        Tue, 23 Nov 2021 05:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637644238;
        bh=Rpx9dU9uGnI5Tr8daUSRruJAR8SV1hZNZuYPOlZ31Ig=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WbR1eSstZWm3zEGjkxa6EfI+E6ur/2hRAL4RiPmwflfHvHbPCu/z1BR3wbouKOkqQ
         uGNDOwHPAYO9fo3gecS+04EMWk1jZV/7BbGCuxKnEUbUZ75sNbVcdmoeCac59Lx4aU
         rKuVVXyGgOoBn8L8XmZOI3uUKNuN+a+wOMKllFefA5hcp75asewgRAR7QxGVk9+ZlI
         yQARh1VD7SyPwOe9Yrq4RQu/BkFYWJz060EWd58wHIPtJwYZ3hMubGdYO7lKr2JmCA
         UlnIdHqQiEdhsMgbXkxwAtUu/PSvyRjxLeaWBt56N53hZxyx/QRSaE67oVfZ9eayTu
         geum2ledSTMsg==
Date:   Tue, 23 Nov 2021 10:40:33 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: Introduce Qualcomm eDP PHY
 binding
Message-ID: <YZx3yfl8lXVTib68@matsya>
References: <20211103234410.1352424-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211103234410.1352424-1-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03-11-21, 16:44, Bjorn Andersson wrote:
> Introduce a binding for the eDP PHY hardware block found in several
> different Qualcomm platforms.

Applied all, thanks

-- 
~Vinod
