Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FC4B1C4D9E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2020 07:14:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725766AbgEEFOs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 May 2020 01:14:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:37546 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725320AbgEEFOs (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 May 2020 01:14:48 -0400
Received: from localhost (unknown [171.61.99.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 37978206FA;
        Tue,  5 May 2020 05:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588655688;
        bh=AtVnOK0VW/cSwhZs5cX0/f6o3T409Sz5J3vQy16+ADQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ARppKa/U5IIe4nJGmi/oZ9BZ9Uoti7e7cwbiO8JHfZbJV5zvYzbHjOh+CaeZyisLK
         s686jQ9ecJuzxBxXJewY+gkJ7VOw8Dzv6Rz28mTxyv/4PRXrVB8JuA2oiNOsYkmQZs
         O6T312HTtGuOvLUzOBqvdw4f+4QtMe+9SKmcBfYk=
Date:   Tue, 5 May 2020 10:44:44 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Wesley Cheng <wcheng@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        robh+dt@kernel.org, mark.rutland@arm.com, p.zabel@pengutronix.de,
        mgautam@codeaurora.org, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, jackp@codeaurora.org
Subject: Re: [PATCH v8 0/5] Add SS/HS-USB changes for Qualcomm SM8150 chipset
Message-ID: <20200505051444.GV1375924@vkoul-mobl>
References: <1588636467-23409-1-git-send-email-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588636467-23409-1-git-send-email-wcheng@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04-05-20, 16:54, Wesley Cheng wrote:
> This series adds support for the Synopsis 7nm HSPHY USB driver being
> used in QCOM chipsets.  The HSPHY register map differs compared to 
> other PHY revisions.  In addition, modifications and updates are done
> to the QMP driver to add new registers/offsets, and to update the
> initialization sequence for enabling the SSUSB path on SM8150.

Applied all, thanks.

Pls note the dt-binding patch had a trailing line at the end of file, I
have stripped that while applying.

-- 
~Vinod
