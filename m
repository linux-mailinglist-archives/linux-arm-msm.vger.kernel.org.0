Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D22F2311C7A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Feb 2021 10:57:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbhBFJ4Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 6 Feb 2021 04:56:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:38916 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229562AbhBFJ4I (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 6 Feb 2021 04:56:08 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1AE5664E59;
        Sat,  6 Feb 2021 09:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612605328;
        bh=dVYA6oWp1GEX1fhArWhzZslhwBKjxmZlK/TPLT+tf64=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iFzYTwCM+FfAUAY/NMPcnKq/pSk/h9IyeD8zVkBr7qFca7cyCyrGRFAzZywoviq0S
         +eHzrGt5HGdYAzSyU6D88uqK0WLtWMTW/pV+aEFaWFdx+23sxm7MagY1+iZNRAHkJZ
         fjEo1IFlxLRRY7Fy0XH4rgY7h7eiR0cG3kNL919GE53ylwOfDB3rN9s0bLkldLSSmh
         WfYyeHZEUwyo6Ah/4Edl+qOZi+zf4RwoHLVYoEknwIQJ0qSTtRVllqrAiyO4Epk94m
         wnmvMF4BzLwlwrwX9NyyxlpQQ1LyLS/tEF40snJ6Ji0y0tFC/q9KACFUwz3NEfmeAH
         AnUtNR3ZwQsHQ==
Date:   Sat, 6 Feb 2021 15:25:22 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Jack Pham <jackp@codeaurora.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] phy: Add Support for SM8350 UFS
Message-ID: <20210206095522.GI2656@vkoul-mobl.Dlink>
References: <20210204165805.62235-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210204165805.62235-1-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04-02-21, 22:28, Vinod Koul wrote:
> This series adds support for UFS found in SM8350 SoC.
> 
> We add binding for UFS phy and new regsiters for QMPv5 followed by UFS phy
> tables.

Applied, thanks

-- 
~Vinod
