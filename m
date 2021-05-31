Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AED739553D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 May 2021 08:08:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230172AbhEaGKJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 May 2021 02:10:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:51318 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230163AbhEaGKG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 May 2021 02:10:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 01727610A6;
        Mon, 31 May 2021 06:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622441304;
        bh=bJXekiCxbd47kWEfxPBA00RuulD8cPNLlN7HutDEhMo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aW4OsesDb9MyzcqB5y5T35wXfnhl7BCmrPVfKIguBswNnOK2BYzl1/L1q5QFiBSU7
         MjQKMQ2yo7hP/cdMuaEAsZgPJ1WStYa9Kr911oFOsZTgjzqGgfE6xw5/SLe1uHL2ej
         eEli8/sQe4WZZSo8fl+Onr4K17JMx+fjRT51cexnxhZjIwJLbsJtE4YCyBfV96UQzi
         Q8RxkOtNQsVVmGNJ1gS5C9cA6PMaA6yml1huxKGccxbgBdDkRhiZu0Zf+uLsdOpv+M
         kIciViy7lDD9AtGIMkbpiMHBB7qzwIy5v+P9AhezuPJyZysowWcOwKx/JskZJbnaWz
         jKNR8G1LTj6Yg==
Date:   Mon, 31 May 2021 11:38:21 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     kishon@ti.com, robh+dt@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 0/3] Add support for PCIe PHY in SDX55
Message-ID: <YLR9Vd80yA8+/K9O@vkoul-mobl.Dlink>
References: <20210427065400.18958-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210427065400.18958-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27-04-21, 12:23, Manivannan Sadhasivam wrote:
> Hi,
> 
> This series adds support for PCIe PHY found in Qualcomm SDX55 platform.
> The PHY version is v4.20 which has different register offsets compared with
> previous v4.0x versions. So separate defines are introducted to handle the
> differences.
> 
> This series has been tested on Telit FN980 EVB with an out of tree PCIe Endpoint
> driver.

Applied, thanks

I got a conflict on last patch as Dimitry has already added some defines
in the header.. Pls check everything was applied cleanly

Thanks
-- 
~Vinod
