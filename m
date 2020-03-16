Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 784F4186400
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2020 04:59:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729434AbgCPD7h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 15 Mar 2020 23:59:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:34752 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729412AbgCPD7h (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 15 Mar 2020 23:59:37 -0400
Received: from localhost (unknown [122.178.203.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0DE2920679;
        Mon, 16 Mar 2020 03:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584331176;
        bh=OwJofg1umza0zcGppaQzonY2py79O/Agzc6jYX0VXNM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rpgDkk+670A5qB2Q00do/ZWIQgTumAcfirYJqxkvV68VMr8ku79MxQwSVK7rdwa5L
         jyxNIvUMxG5GhgyWKfWCSg3kbxZqXvlx6foqWLX+o7My3S7tcJXTqsQTlm2cd2Ih7x
         2O2xuN8slIpyoBr6PdqN1UguFyJMSalSoQqcSohI=
Date:   Mon, 16 Mar 2020 09:29:29 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm SDM845 audio configs
Message-ID: <20200316035929.GS4885@vkoul-mobl>
References: <20200315050827.1575421-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200315050827.1575421-1-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14-03-20, 22:08, Bjorn Andersson wrote:
> Enable soundwire, slimbus frameworks, the machine driver and the codec
> drivers for WCD934x and WSA881x used on varios SDM845 based designs.

Thanks Bjorn, I was about to send this and you beat me. I have tested
this on RB3

Reviewed-by: Vinod Koul <vkoul@kernel.org>
Tested-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
