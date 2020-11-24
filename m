Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4534B2C2B1B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 16:22:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389394AbgKXPUf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 10:20:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:36864 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728389AbgKXPUf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 10:20:35 -0500
Received: from localhost (unknown [122.167.149.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A7DAC206D5;
        Tue, 24 Nov 2020 15:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606231234;
        bh=J4hJGRYnZYGBwvmA2/XAlx/gX+eG1Zusyi3xxfVxjcY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VVtWOv5VuuUU8kHi/MPsUVvAiq1hvdCkj14z6mv5SCDLsljYkbYIC9UmORRt0Gegv
         DCc+WF90pVhcI1/088AudLGu+HqlGu2tbWqOctp1ZVuYZxTUnMgpKVSGUNOfbUtqFR
         h956Foh3oYbsD40oqhy+l10IgKRvrXKK2ypq1wo0=
Date:   Tue, 24 Nov 2020 20:50:29 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8150-mtp: Specify remoteproc firmware
Message-ID: <20201124152029.GL8403@vkoul-mobl>
References: <20201121055603.582281-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201121055603.582281-1-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20-11-20, 21:56, Bjorn Andersson wrote:
> Point the various remoteprocs of SM8150 MTP to a place with the platform
> specific firmware.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
