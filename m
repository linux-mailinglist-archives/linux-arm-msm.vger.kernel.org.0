Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB4B0143A32
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2020 11:02:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728797AbgAUKBv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jan 2020 05:01:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:34300 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728741AbgAUKBv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jan 2020 05:01:51 -0500
Received: from localhost (unknown [171.76.119.14])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B832A24654;
        Tue, 21 Jan 2020 10:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579600910;
        bh=L7pGj0K4OmYi7Bt/O4MH8s/VWD3cqLIrXyoEw3u5PYE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=2EADTaXyU2j95uHWs/K3mXdgWw2WbOYzA30wwACofuT5qtZ1Ytw1TJi4tkwuwjP0d
         9fyS4nFUERoOlRg/IYHVJRox5mW/GGd2ACL5IPrmDdZfNqdPCp+XOMxC18/KaUihXM
         8LAztJ8Sd4VOHcrRemkTFqYfOZDTuEWZZyrYl10Y=
Date:   Tue, 21 Jan 2020 15:31:45 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, psodagud@codeaurora.org,
        tsoni@codeaurora.org, jshriram@codeaurora.org, tdas@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] clk: qcom: clk-alpha-pll: Refactor and cleanup trion
 PLL
Message-ID: <20200121100145.GM2841@vkoul-mobl>
References: <1579217994-22219-1-git-send-email-vnkgutta@codeaurora.org>
 <1579217994-22219-4-git-send-email-vnkgutta@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1579217994-22219-4-git-send-email-vnkgutta@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16-01-20, 15:39, Venkata Narendra Kumar Gutta wrote:
> From: Taniya Das <tdas@codeaurora.org>
> 
> The PLL run and standby modes are similar across the PLLs, thus rename
> and refactor the code accordingly.
> 
> Remove duplicate function for calculating the round rate of PLL and also
> update the trion pll ops to use the common function.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
