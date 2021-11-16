Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1159452CEC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Nov 2021 09:35:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232307AbhKPIh7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Nov 2021 03:37:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:42206 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232320AbhKPIhK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Nov 2021 03:37:10 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id CA24F6152B;
        Tue, 16 Nov 2021 08:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637051652;
        bh=KMkkLuMuec7sA5aF1mAAMjA0jmLb8MFB2H34i1Zd0hY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=P40XUHQPcOy8a14pzqj80sVxgzaMFMrDQtM/c0AQruGucUPH+VtEouchiEZ7dzKqv
         tvG1B6ph0TmLCRivcgy6KLQDk29Ud7lLooS2Gm9mstPD9Mehj0gHKjQzA81rdsuyQB
         1CVo1MW0r12uu3HnxBn/nUUjkhXGNwQVkgQfeVw8W63kwcvNLTHC8GgqMoIWC00oqL
         5vGtVBb1XJF02dLJXkgSM+D6FKE8Rc5HA0f0CDY42oyM1ees+D4KNLSXMOeSjGt43S
         a3PG8q931/PKThZRonKwzahK8xVQ9r+qNi4uGS0V0ubeYKVCUUogJx5iCABDnmupHE
         wA038mLbQryVQ==
Date:   Tue, 16 Nov 2021 14:04:08 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     quic_vamslank@quicinc.com
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        tglx@linutronix.de, maz@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, manivannan.sadhasivam@linaro.org,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 4/6] dt-bindings: clock: Introduce RPMHCC bindings for
 SDX65
Message-ID: <YZNtAGdLssPuoq+Z@matsya>
References: <cover.1637047731.git.quic_vamslank@quicinc.com>
 <d7234c503e5e96d33e280bda9c09199c7f2124e6.1637047731.git.quic_vamslank@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7234c503e5e96d33e280bda9c09199c7f2124e6.1637047731.git.quic_vamslank@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15-11-21, 23:38, quic_vamslank@quicinc.com wrote:
> From: Vamsi krishna Lanka <quic_vamslank@quicinc.com>
> 
> Add compatible for SDX65 RPMHCC.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
