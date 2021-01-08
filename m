Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2A482EED4D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jan 2021 06:55:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727073AbhAHFyD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jan 2021 00:54:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:37792 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725791AbhAHFyD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jan 2021 00:54:03 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 00E77224B1;
        Fri,  8 Jan 2021 05:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610085202;
        bh=iodLeK75i3vx8xlutiBYKM2YPewe6eYLKRmoG2BmUwI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=W7zJtHrFRL6fjo8T0SU+8JI12MzUT5fOKbGLreOVmwLWiHoPbfMLZ8ZX3Dk6lRjaw
         Fi4xPEhugprmSHkvgiWWXoyelG3J6GtdkOvOlb8iydKzujj9j41Xn2fo2exsirkQ9+
         AfGor+ru8xqus5t/re68Hgj2NBl/yFo989JId8NpRnOGBckEdgkurDWmOE+co9IL5+
         F6Tc6RjbOaxCMJWMYqzyCDFKBq2XT/Meh9F94W4yZ5VKyAftJ5rndWUnrdMKpgDTeB
         j6CrYfEYPfyoenKYM3/b2ULjzypw9MmjgJd8HWCx4P/Y+vHlHWeOsXkgt3DI8y32j7
         72x9YDDN2BQwQ==
Date:   Fri, 8 Jan 2021 11:23:18 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm845: Reserve LPASS clocks in gcc
Message-ID: <20210108055318.GU2771@vkoul-mobl>
References: <20201222001103.3112306-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201222001103.3112306-1-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21-12-20, 16:11, Bjorn Andersson wrote:
> The GCC_LPASS_Q6_AXI_CLK and GCC_LPASS_SWAY_CLK clocks may not be
> touched on a typical UEFI based SDM845 device, but when the kernel is
> built with CONFIG_SDM_LPASSCC_845 this happens, unless they are marked
> as protected-clocks in the DT.
> 
> This was done for the MTP and the Pocophone, but not for DB845c and the
> Lenovo Yoga C630 - causing these to fail to boot if the LPASS clock
> controller is enabled (which it typically isn't).

Reviewed-by: Vinod Koul <vkoul@kernel.org>
Tested-by: Vinod Koul <vkoul@kernel.org> #on db845c

-- 
~Vinod
