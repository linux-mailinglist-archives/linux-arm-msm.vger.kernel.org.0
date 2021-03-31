Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4775A350402
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Mar 2021 18:01:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232951AbhCaQAp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 12:00:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:40654 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229787AbhCaQAd (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 12:00:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7EAC361005;
        Wed, 31 Mar 2021 16:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617206433;
        bh=Fo34UTeDtIj/odQUH8jDUnmS9mXN/pTfTtX/xYSyGl4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kVcdocY3K8u802isMNb23zmodK+t5OIowl1j7f8MGdn8krhiHfXnT9kmJfe3dKxxN
         H2L+I2Idd/X4Ht8Ock4hF0HSdC+ScUdB0ZD/6mtIT+5RTFsMg2PvRCtUN6B46F6qOP
         12/Bps6eaMgkjh3wClrLGJDQP4EmTKmDRuCx+hPm8yvIO2OhBjaln6bE9UAIHBNVCd
         Tzf0lqZXjKr7+VyQ3QWnMqPFGR6FfJydKxyGMwAe5w8zwk4f1JrofLyYwPQcqmCdEk
         Hpcct3EYz/3Y8Wu4QWXSQwqms7I/OZ2e/pupnOjrpny/THgmcDOi9SgpLYDx5ap+G3
         NPAC0U/bAmmdQ==
Date:   Wed, 31 Mar 2021 21:30:29 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v6 0/7] phy: qcom-qmp: provide DP phy support for sm8250
Message-ID: <YGScnQHbAUmg278S@vkoul-mobl.Dlink>
References: <20210331151614.3810197-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210331151614.3810197-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 31-03-21, 18:16, Dmitry Baryshkov wrote:
> Changes since v5:
>  - Rebase on top of phy-next
>  - Rework 'move DP functions to callbacks' patch to leave most of the
>    code in place, using function prototypes.

Applied 1 thru 5, thanks

Bjorn you can pick the dts bits.

-- 
~Vinod
