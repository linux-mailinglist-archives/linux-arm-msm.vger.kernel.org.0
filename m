Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEA2F1B4565
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2020 14:51:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726530AbgDVMvC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Apr 2020 08:51:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:59810 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726002AbgDVMvB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Apr 2020 08:51:01 -0400
Received: from localhost (unknown [49.207.59.230])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0A01420787;
        Wed, 22 Apr 2020 12:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587559861;
        bh=R8mR6GpMuum7Mx4R5xu3L8qN6++1a41Ocyl6ssZGeR8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=O2YmO+Z57EikXuZrboqa2mTiCQVBTzI+TJCaZZemDw7141Sf/+MqTSUayZFgVIQ32
         8lXD64tcleJTi3s24zlJir79vcLq2ror9bjn0VUiy+w1QD/vaMyRnJJ94eVjIYbWuB
         c2eDi3MQ9HjyQAz4yNiQNJAjA4ekNGaspvFxm/AM=
Date:   Wed, 22 Apr 2020 18:20:54 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: db820c: fix audio configuration
Message-ID: <20200422125054.GQ72691@vkoul-mobl>
References: <20200422101922.8894-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200422101922.8894-1-srinivas.kandagatla@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22-04-20, 11:19, Srinivas Kandagatla wrote:
> After patch f864edff110d ("ASoC: qdsp6: q6routing: remove default routing")
> and 9b60441692d9 ("ASoC: qdsp6: q6asm-dai: only enable dais from device tree")
> asm dais and routing needs to be properly specified at device tree level.
> 
> This patch fixes this.

Reviewed-by: Vinod Koul <vkoul@kernel.org>
Tested-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
