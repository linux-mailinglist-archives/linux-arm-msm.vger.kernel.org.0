Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86CAD1C33BD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2020 09:37:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727855AbgEDHhs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 May 2020 03:37:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:57242 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727088AbgEDHhs (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 May 2020 03:37:48 -0400
Received: from localhost (unknown [171.76.84.84])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2802120735;
        Mon,  4 May 2020 07:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588577868;
        bh=faQSb/4qCDmUQbreEw2Wmjz3BaAjeSxXz98jqDVxdGQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=k+spgRX/ztQJZK1UdUxWUm73hg0mo5Uy7ZTRxSZ7+1rEg1LQQlBOOJsUt3KzuHfcx
         hRD1adZETmqC9WQpRVWyMBbhBtFWW0M1cQ5I4CP9wTX0nTs9rL12j/WTQiZGaZsV8P
         1HHLqVp+f2ebeSeY7ANnXf1W2utSOm2snvvMAUBM=
Date:   Mon, 4 May 2020 13:07:43 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, John Crispin <john@phrozen.org>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: Re: [PATCH v7 1/3] phy: add driver for Qualcomm IPQ40xx USB PHY
Message-ID: <20200504073743.GO1375924@vkoul-mobl>
References: <20200503201823.531757-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200503201823.531757-1-robert.marko@sartura.hr>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03-05-20, 22:18, Robert Marko wrote:
> Add a driver to setup the USB PHY-s on Qualcom m IPQ40xx series SoCs.
> The driver sets up HS and SS phys.

Applied, thanks

-- 
~Vinod
