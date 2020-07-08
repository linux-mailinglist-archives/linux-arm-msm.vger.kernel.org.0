Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DF14218518
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2020 12:37:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728349AbgGHKhm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jul 2020 06:37:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:36100 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728346AbgGHKhm (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jul 2020 06:37:42 -0400
Received: from localhost (unknown [122.182.251.219])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E016920739;
        Wed,  8 Jul 2020 10:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594204661;
        bh=0K2QzsfNelW++5Lvh8gz2k4nB6G2WJ2ICZu9P6XPq+E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sGBQlhpOaIWdqaXi74S5X8MbBWxxmc1jjHWIW4GRTZHRG34UWGUCidR5OQPuJnyeG
         1eiXmFYu6zqYzkNVCOGEWSfAqYQXip4VHAJsGjP/LekU7vrgY3mqyT4wznzUremoU+
         BeS+EM5wQBtgYj3eZT7U8ivApmApOs7rtCbxgaJ4=
Date:   Wed, 8 Jul 2020 16:07:36 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Li Yang <leoyang.li@nxp.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Olof Johansson <olof@lixom.net>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: defcondfig: Enable USB ACM and FTDI drivers
Message-ID: <20200708103736.GC34333@vkoul-mobl>
References: <20200703185354.1814337-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200703185354.1814337-1-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03-07-20, 11:53, Bjorn Andersson wrote:
> Enable USB serial drivers to provide UART access to various development
> boards from an ARM64 host.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
