Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25396458C7E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Nov 2021 11:42:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239221AbhKVKpM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Nov 2021 05:45:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:33290 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229806AbhKVKpL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Nov 2021 05:45:11 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A735060E0B;
        Mon, 22 Nov 2021 10:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637577725;
        bh=/4UzQCwmhU8u63jfuGSa1E3xiQu/uGrLlTEgn+sJm24=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DM+OSsvThiwhqM/wCXCjcCFzNWRzd2GSI3wS2K88JUFR4OufaOWNP+3JF1gSzVtGu
         i8DFMzKT7W4zuh73FtsMAp6fbMVJjaWvd3Qsu8tlmQj0pBUPhixSFec8Qrpv/23tKs
         f1j0Q+fBwNaO6l17R7JlcgpUQqD15Prc4xEG4sCNJQrL/Kki56PmFTtvz+B8dEm1R2
         2TKBJl559NHpUjXLDLW6wKZfSqri3PRQMNfAXKyQaUCOwhixlMYqLl6DTeA07iue/M
         mdzDt153rOvJ5ofv9vQphIPIe/X0HgUxkC5ZvwP9hTx34x9vpvbnW87nnoAFvvl43b
         TBi9T8Tvl2Trg==
Date:   Mon, 22 Nov 2021 16:12:00 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     quic_vamslank@quicinc.com
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        tglx@linutronix.de, maz@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, manivannan.sadhasivam@linaro.org
Subject: Re: [PATCH v5 1/6] dt-bindings: clock: Add SDX65 GCC clock bindings
Message-ID: <YZtz+PAWMBLGw0Dx@matsya>
References: <cover.1637302009.git.quic_vamslank@quicinc.com>
 <e20b452994bbd410411a631ef96091031c2fc039.1637302009.git.quic_vamslank@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e20b452994bbd410411a631ef96091031c2fc039.1637302009.git.quic_vamslank@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18-11-21, 22:11, quic_vamslank@quicinc.com wrote:
> From: Vamsi krishna Lanka <quic_vamslank@quicinc.com>
> 
> Add device tree bindings for global clock controller on SDX65 SOCs.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
