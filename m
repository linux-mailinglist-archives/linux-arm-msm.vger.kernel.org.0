Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7673F3E2A54
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Aug 2021 14:07:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229865AbhHFMH6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Aug 2021 08:07:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:39988 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1343569AbhHFMHx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Aug 2021 08:07:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6FA2D60EBC;
        Fri,  6 Aug 2021 12:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628251657;
        bh=trJ9Z3faJZBdsB26UbkrL7NjdFaz2Lf/2t4wxXkRJC8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rZJkg34J24lKWwl6HiikaEtJHyTbnH6qgvZwwm7RSz/T9rdlyjmWVeXQtRrIsXnVx
         uE3MepPnKIZJMZz5pKqtJ0p4H15KH8WkC3vTr6zJJMX6nw3Z/RoI8Z6gpThTnuwwMV
         9rnwU6ezY2yT4qs41u7GBActmFu3QiZ8WC9Cl+b5culhJswy5MTWCuK+/zR1ko14Ep
         hb1QqAWoz8w44LDCFtQU/R+dMa73he5OPY4dv88nFP3BhYIrJSFD7AesE4huP5ofCW
         jPig6Q1jgIbKuIE8enAGygILg+E/8cp6StSb1zMCHa3NZlExdPbgz9KgkhzIhuDgob
         I8m9acKqQVkIg==
Date:   Fri, 6 Aug 2021 17:37:33 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom,qmp-usb3-dp: Add support for
 sc8180x
Message-ID: <YQ0mBRBgjT6pE/HM@matsya>
References: <20210721225630.3035861-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210721225630.3035861-1-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21-07-21, 15:56, Bjorn Andersson wrote:
> The SC8180x has two instances of the QMP USB/DP combo PHYs, add a
> compatible for these.

Applied all, thanks

-- 
~Vinod
