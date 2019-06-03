Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0F26333B9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2019 17:37:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727542AbfFCPhv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Jun 2019 11:37:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:55120 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727150AbfFCPhu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Jun 2019 11:37:50 -0400
Received: from localhost (unknown [223.226.32.210])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6D7DC21851;
        Mon,  3 Jun 2019 15:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559576270;
        bh=zcP9KtKgAhz3mU5lmAfLMYUlzYRfYyCo6F2EvR1j1zw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lw31aVh04wQTEv/7BJ6nkBiZ5zgifqLpQU/x0ATsCfH40b+ZcENsaEHWo2nm7JN07
         wzB4oR54h8ors5pwFLQMd5NDzFoRSph6VbJUKJKu45bS+6ZEYO2+OQX6Szk0kQ/epF
         6p5bOIm9qZqTLrTeR7EE5DtJb7/pF2CIJogTQPP8=
Date:   Mon, 3 Jun 2019 21:04:40 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Doug Anderson <dianders@chromium.org>,
        Arun Kumar Neelakantam <aneela@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 2/4] soc: qcom: Add AOSS QMP driver
Message-ID: <20190603153440.GT15118@vkoul-mobl>
References: <20190531030057.18328-1-bjorn.andersson@linaro.org>
 <20190531030057.18328-3-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190531030057.18328-3-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30-05-19, 20:00, Bjorn Andersson wrote:
> The Always On Subsystem (AOSS) Qualcomm Messaging Protocol (QMP) driver
> is used to communicate with the AOSS for certain side-channel requests,
> that are not available through the RPMh interface.
> 
> The communication is a very simple synchronous mechanism of messages
> being written in message RAM and a doorbell in the AOSS is rung. As the
> AOSS has processed the message length is cleared and an interrupt is
> fired by the AOSS as acknowledgment.
> 
> The driver exposes the QDSS clock as a clock and the low-power state
> associated with the remoteprocs in the system as a set of power-domains.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
