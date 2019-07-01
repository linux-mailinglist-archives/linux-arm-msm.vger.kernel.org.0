Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51B215BFB4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2019 17:26:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728808AbfGAP0K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Jul 2019 11:26:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:38172 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727810AbfGAP0K (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Jul 2019 11:26:10 -0400
Received: from localhost (unknown [122.167.76.109])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 87AEA208E4;
        Mon,  1 Jul 2019 15:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561994769;
        bh=f6Vhp2JOFVYPly+oy0IG8d1NArRJ8kNupx/z8r2urwo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eiiDwTWvFvNOl3K8T00Vo2UnctJIxYxlt6zhzuO7ORU54jGeuPKdtwfTUf5502fzU
         0wu7iTvRGN0MoLWVhliMIZI5Osqz8gGpVyrbVSI5pLOCVSjzOUQT5o7qHplOxU2XtV
         pSXSQoMsD4jqvZzQDUJcb4yQzOVu4b5WFN72xhFo=
Date:   Mon, 1 Jul 2019 20:52:57 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc:     agross@kernel.org, adrian.hunter@intel.com, ulf.hansson@linaro.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        khasim.mohammed@linaro.org
Subject: Re: [PATCH v2] mmc: sdhci-msm: fix mutex while in spinlock
Message-ID: <20190701152257.GM2911@vkoul-mobl>
References: <20190701150125.2602-1-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190701150125.2602-1-jorge.ramirez-ortiz@linaro.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01-07-19, 17:01, Jorge Ramirez-Ortiz wrote:
> mutexes can sleep and therefore should not be taken while holding a
> spinlock. move clk_get_rate (can sleep) outside the spinlock protected
> region.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
