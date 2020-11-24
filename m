Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 744CF2C2B2B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 16:23:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389367AbgKXPXE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 10:23:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:37386 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388854AbgKXPXD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 10:23:03 -0500
Received: from localhost (unknown [122.167.149.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2810F206D5;
        Tue, 24 Nov 2020 15:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606231383;
        bh=7FjtXYe8NkSSTsbtQFX0Zty/7VvaAkQvOSbxMAHMB2w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eTC63Ycp1jZTJuFczc1Vg8yBj75LI1jYHSblKKneuWoQqfNJ8jID5PxpfA15yCNAb
         rIsTjj6krazc1xcB197Nl11eS6n8EzC6Etgmjx0uJBaF2niZXkUAlonXqtT6uJimYX
         fAtNH6LB+bAlyZwUb2c/xTy53p0uC268itNSV1SE=
Date:   Tue, 24 Nov 2020 20:52:58 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8150-mtp: Enable WiFi node
Message-ID: <20201124152258.GN8403@vkoul-mobl>
References: <20201121055808.582401-1-bjorn.andersson@linaro.org>
 <20201121055808.582401-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201121055808.582401-2-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20-11-20, 21:58, Bjorn Andersson wrote:
> From: Jonathan Marek <jonathan@marek.ca>
> 
> Enable the WiFi node and specify its supply regulators.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
