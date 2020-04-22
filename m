Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B786D1B455F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2020 14:50:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726563AbgDVMuM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Apr 2020 08:50:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:59570 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726002AbgDVMuM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Apr 2020 08:50:12 -0400
Received: from localhost (unknown [171.61.101.151])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5092A20787;
        Wed, 22 Apr 2020 12:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587559812;
        bh=WFKts5c9iIvh0wo38wHhgwtaKoPOd35R5D3/Tmxa4L8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GHeOpYRfywSeOtn/P0/NGKnxKKVk1ygeiMXxECtprqdavHu5MWKITnUXm0IWOKh2m
         lN/bTF3UqsvtZpN1HloMT3xYcVNvwVAvqkMuKr2rYmGiKGDr31/YlfwAejsSwEfGVE
         FwnX8Bf4UOZOw0QW72NbKCrMQUpX8lkP1vdsFix0=
Date:   Wed, 22 Apr 2020 18:20:08 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: db845c: fix asm dai setup
Message-ID: <20200422125008.GP72691@vkoul-mobl>
References: <20200422102044.8995-1-srinivas.kandagatla@linaro.org>
 <20200422102044.8995-2-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200422102044.8995-2-srinivas.kandagatla@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22-04-20, 11:20, Srinivas Kandagatla wrote:
> "direction" property is only valid for asm compressed dais,
> so remove it for non compressed dais

Reviewed-by: Vinod Koul <vkoul@kernel.org>
Tested-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
