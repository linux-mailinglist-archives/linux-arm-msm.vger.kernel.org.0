Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09ED430EDBF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 08:52:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232190AbhBDHve (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 02:51:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:53824 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231767AbhBDHvc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 02:51:32 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B63CC64F41;
        Thu,  4 Feb 2021 07:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612425051;
        bh=FL5DeJMe8XRcNTCKeRaciXZZMzwnLgsTkq+Zd8QeZD0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=c6UXcwpd61izX5QnzERfEgnaWSFhynB4+qzKBLxcZbkDAfP5xvuBlbr1aVbIGtrtl
         /nFcV5gaIl1CwIpAPrB+61AG/SlzlGhHHTw94l/t8hrNwEbOY+BHpi2/ZWpp3En1XT
         LAm2DVm8p8sl9lya1a1uG8JjAUWJ5MtKPP7mBmMKbqgY94MkA/iXTpWNMTP7vW2GF4
         KiZr+YO68MBhIUi/Ms/uj2pnmc+6W7V+s0I0lXuGoPmx6BRJhA++M7DMb0OeM0WmjB
         ZAX6KoFHY40RAhHPyj3i7MFtMp4vlafMxbCW0wwhqARn15BZ8pM5ipcVMLzN6Mib/Y
         hkGKiackeWcmw==
Date:   Thu, 4 Feb 2021 13:20:47 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Baruch Siach <baruch@tkos.co.il>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/3] phy: qualcomm: support IPQ60xx USB PHY
Message-ID: <20210204075047.GG3079@vkoul-mobl.Dlink>
References: <cover.1611756920.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1611756920.git.baruch@tkos.co.il>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27-01-21, 16:20, Baruch Siach wrote:
> The short series adds support for USB PHY on IPQ60xx based platforms. Tested 
> on CP01 board.
> 
> The code is forward-ported from downstream codeaurora kernel at
> 
>   https://source.codeaurora.org/quic/qsdk/oss/kernel/linux-ipq-5.4/

Applied driver and binding patch, thanks

DT can be picked by Bjorn

-- 
~Vinod
