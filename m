Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B92492C945F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Dec 2020 01:58:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388316AbgLAA6a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Nov 2020 19:58:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:60908 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388182AbgLAA6a (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Nov 2020 19:58:30 -0500
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4842820809;
        Tue,  1 Dec 2020 00:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606784270;
        bh=o5a8hGvEFm5T68/WLreY4CVfFGV4EmbvMK4jqzF+6/8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=z6jvgOhf8RUQgVWcqvIkMtzp3D7NKUzK5oHtyVdpsCtPRT8Xxmb34UEXLFZIeWWTK
         V6jg8lna59pAxWK3qlOxO4DXCIOt3fZwU92L0QqVBUc+vee223rjlYlA7Jv3bOcZeH
         ihADu2uLWegAXqcdsAsB3q7ul7SvLjxRdnVRcDH4=
Date:   Tue, 1 Dec 2020 08:57:44 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Steev Klimaszewski <steev@kali.org>,
        Olof Johansson <olof@lixom.net>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: Enable TMPFS Posix ACL
Message-ID: <20201201005743.GM4072@dragon>
References: <20201130163007.310384-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201130163007.310384-1-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 30, 2020 at 10:30:07AM -0600, Bjorn Andersson wrote:
> The lack of TMPFS Posix ACL prevents the upstream defconfig from booting
> e.g. Ubuntu, so enable this.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Acked-by: Shawn Guo <shawnguo@kernel.org>
