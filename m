Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69F0A143A02
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2020 10:55:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728842AbgAUJyx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jan 2020 04:54:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:57344 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728797AbgAUJyx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jan 2020 04:54:53 -0500
Received: from localhost (unknown [171.76.119.14])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B208220882;
        Tue, 21 Jan 2020 09:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579600492;
        bh=rbea3hv11DlqYc6PEcYoLoQf6fMfbqdEMMWQJJW3TgQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=0xAmqxRj+RetoAUEJP3t6n2Ogtr8hDOLi9wYGdGYDtY1xSZevRo2kK8srjK8JCGPp
         4jjkTh7ladGxJdiGrXtbCrxJi5SPntce8i5VUoDlSGE4pts5WplrWkJT6X2/n+JIsg
         sennGoB3u2lTPDEqXICGQYOJu8/Y8JtCr7w66ieI=
Date:   Tue, 21 Jan 2020 15:24:48 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, psodagud@codeaurora.org,
        tsoni@codeaurora.org, jshriram@codeaurora.org, tdas@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] clk: qcom: rpmh: Add support for RPMH clocks on
 SM8250
Message-ID: <20200121095448.GL2841@vkoul-mobl>
References: <1579217994-22219-1-git-send-email-vnkgutta@codeaurora.org>
 <1579217994-22219-3-git-send-email-vnkgutta@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1579217994-22219-3-git-send-email-vnkgutta@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16-01-20, 15:39, Venkata Narendra Kumar Gutta wrote:
> From: Taniya Das <tdas@codeaurora.org>
> 
> Add support for RPMH clocks on SM8250.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
