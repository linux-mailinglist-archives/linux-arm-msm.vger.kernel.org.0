Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B49033E29FB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Aug 2021 13:45:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245682AbhHFLp7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Aug 2021 07:45:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:52006 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245671AbhHFLp6 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Aug 2021 07:45:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2054A60EBC;
        Fri,  6 Aug 2021 11:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628250343;
        bh=JYR7VyAfNwcUevOW25ql6QD/2c2IPR/gbIQt+dsn6q8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FhtbX2EWY9JgdFX+LYXf1cGhNbIVnqQsZDlivFT1wl/nltSdgvcAk5jAwohsTcKw+
         CZL2gFZCN+xpJu61FnOMAM2qrVO2ZIbfcKrI/sKv8y539WArsWJhUcqiOptGnc21ws
         3sbe+UFFVxr4F1Ues+MStCdPD9WivBqiQqjZtRB5yvAQYsPU/inXrSB1qNWNAdU+Ft
         leFzd1qjTbVpPwdvhAnpw5Z2GzWtuHqP5k8wtPIbPN4u5kkA+B00JqZglUsb5dqVKk
         ptuTV1OkcGHSdGUIUxadSbBWmA/Bcxg0NBFNic8YJKyXTXUu88nHG6TZmiYeBJuDdG
         mXmzwX+L9di3Q==
Date:   Fri, 6 Aug 2021 17:15:38 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-phy@lists.infradead.org
Subject: Re: [PATCH] phy: qualcomm: phy-qcom-usb-hs: repair non-kernel-doc
 comment
Message-ID: <YQ0g4ogGvb4piZcM@matsya>
References: <20210723022548.25695-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210723022548.25695-1-rdunlap@infradead.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22-07-21, 19:25, Randy Dunlap wrote:
> Fix errant use of "/**" to begin a comment although the comment
> is not kernel-doc notation. Just use "/*" instead.
> 
> Fixes this kernel-doc warning:
> 
> drivers/phy/qualcomm/phy-qcom-usb-hs.c:3: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>     * Copyright (C) 2016 Linaro Ltd

Applied, thanks

-- 
~Vinod
