Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 284E7459B5D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Nov 2021 06:08:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229925AbhKWFLv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Nov 2021 00:11:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:54144 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229468AbhKWFLv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Nov 2021 00:11:51 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A8E1B61074;
        Tue, 23 Nov 2021 05:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637644123;
        bh=0Ykfozn0BupreGXoNoCtnkiN7JS1YI3v4hODaS4wFaI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XknhcNwf8kjExMqMmWVkF19158iOTvZxiMLK9TvvrSN5E+ZaQYuW7wwoJVcbD3AGq
         BoKMdF8N06OUDHCaCAwnXW5mgKPYzlTB2Y4Ggf/RRwuek523BbYQv455QyGn+vCOwe
         sdTm8XobaQJ+FFvq+G9vgl77k9IQvR2LAVX5bB+2JeG5UuBiLQRN7CXyz/RzGd9i+s
         zgo0vm20i7TzZtk5fjdO987A1BBhamG3kpoHETcgri1I6iOXwL9njfza+LOwoKc2EF
         Tse5n9tWlKHZQ1opXwZrank7JfbeYNNLqoLhusIe19OGjkdHKlG8adsQNA5jl+zb/q
         0OhU+vHDBofnQ==
Date:   Tue, 23 Nov 2021 10:38:39 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     linux-phy@lists.infradead.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2 1/2] phy: qualcomm: ipq806x-usb: Fix kernel-doc style
Message-ID: <YZx3V3V1sU9zv7iG@matsya>
References: <20211120061531.410771-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211120061531.410771-1-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20-11-21, 11:45, Vinod Koul wrote:
> The functions are documented but there were style issues, so fix
> the style and add missing description for phy_dwc3
> 
> drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c:130:
> drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c:174:
> drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c:212: warning:
> This comment starts with '/**', but isn't a kernel-doc comment.
> Refer Documentation/doc-guide/kernel-doc.rst

Applied both, thanks

-- 
~Vinod
