Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CB2F356C2A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Apr 2021 14:32:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245287AbhDGMcv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 08:32:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:50134 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235570AbhDGMco (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 08:32:44 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6E5D5611C9;
        Wed,  7 Apr 2021 12:32:35 +0000 (UTC)
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=why.lan)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <maz@kernel.org>)
        id 1lU7MH-0064Qi-OB; Wed, 07 Apr 2021 13:32:33 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: qcom,pdc: Add compatible for sc7280
Date:   Wed,  7 Apr 2021 13:32:30 +0100
Message-Id: <161779861853.1095473.15557971945594016464.b4-ty@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <1615787946-26474-1-git-send-email-rnayak@codeaurora.org>
References: <1615787946-26474-1-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: rnayak@codeaurora.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 15 Mar 2021 11:29:06 +0530, Rajendra Nayak wrote:
> Add the compatible string for sc7280 SoC from Qualcomm

Applied to irq/irqchip-next, thanks!

[1/1] dt-bindings: qcom,pdc: Add compatible for sc7280
      commit: 5deaa1d7c49151988b0bf919eeea6ad5535a29a2

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.


