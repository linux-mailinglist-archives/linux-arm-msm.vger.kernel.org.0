Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E13143F44AF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Aug 2021 07:43:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232724AbhHWFnw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Aug 2021 01:43:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:57932 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231267AbhHWFnv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Aug 2021 01:43:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5879F61250;
        Mon, 23 Aug 2021 05:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629697389;
        bh=ENt6Gvo69RkjDVOcI0av9vDd/lxfGMgyK2xcZh9yxz4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TpugyQMn/k6vhOOy7pstrvsLC82VFA7D7mfTMSuyJbBibOHQocz4+hBWSI1tBz8Mc
         GOkNGY2JKwQjYy3/21Be5vxSM8jcxRASL3VQu8M4OhPPD9eNmFzOaGgtA06C5tA6XG
         CDmGyIACCUdbwiC7neGaTU1nOlCUNYje6wCy7zEI73NIFWYJirRiO5zrd5BK4nJ18P
         2ToI9Q0kavh4/lZvc8LULEnXttWhZfA4KIIaQleVXOESejg0jjv3vxfqcoL1VtFmyT
         gzUiLc9tRF+VHDTbSGlhA5VApDaN0/8KlkU+gqSPmwYMdXJVzY8YxHJN8OKYZ/g8ld
         +JfLh4xW9OWcg==
Date:   Mon, 23 Aug 2021 11:13:04 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v3 0/2] Add UFS PHY support for SM6115/4250
Message-ID: <YSM1aBktwKqMUxXe@matsya>
References: <20210821155657.893165-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210821155657.893165-1-iskren.chernev@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21-08-21, 18:56, Iskren Chernev wrote:
> The UFS PHY found on SM6115/4250 has a lot of common registers with ufs phy v2,
> even though in downstream it is named v3-660. Due to register similarity with
> v2, the few extra registers that are needed are added as v2 registers.
> 
> The register values/sequences are taken from OnePlus repo [1].

This looks very good, thanks for cleaning it up

Applied now

-- 
~Vinod
