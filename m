Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 130B142E8E1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Oct 2021 08:21:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231152AbhJOGXY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Oct 2021 02:23:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:36850 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233933AbhJOGXX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Oct 2021 02:23:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 214B66115C;
        Fri, 15 Oct 2021 06:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634278876;
        bh=qRv9HnO/WCy+tSs0T6xdlIGgrvA9/hMUgHOZT0yHbvs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BKEcA7eCPrDA3hWs3kBxE9ri/0VkVTWhbj9slM7phL4UIAB+yhghPsEvWTOEHlGhl
         X+qxL2lxmeOJB4PZfg2O75wmvki/06jO9GQYzNbwjzJwFOd198U7L+DkPyEtGOWL47
         JGS2QPfQLe9ycMSTe8aKg/AezeK/4kN32kyByHcQNbu35Gj0q8iC8hI1yqsPwc9cn2
         dZYaIa7Y074fhe9LfiV8ujpva5whxk2rrFfTWUy1SP+38DZEDS0PXejs62ubJfMCQB
         zkivBiZ5ixa62MYlkIX5pWktxxHUX50D45/8Wi9sgWrFAFjuUtWm3/PjcDOnu3d6zZ
         x3mkTJGhv6ajA==
Date:   Fri, 15 Oct 2021 11:51:00 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm prima/pronto drivers
Message-ID: <YWkdzAMTuim5kCx3@matsya>
References: <20211008192840.3593362-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211008192840.3593362-1-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08-10-21, 12:28, Bjorn Andersson wrote:
> The Qualcomm prima/pronto drivers consists of a remoteproc driver boot
> the combined WiFi and Bluetooth firmware on the related co-processor, a
> control driver to load calibration and settings firmware, the wcn36xx
> WiFi driver and the SMD based Bluetooth driver.
> 
> Enable these in the defconfig to provide Bluetooth and WiFi on devices
> such as the Qualcomm Dragonboard 410c.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
