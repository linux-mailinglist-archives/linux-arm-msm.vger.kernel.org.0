Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED42C3040AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jan 2021 15:44:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390782AbhAZOmn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jan 2021 09:42:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:35222 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391183AbhAZJol (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Jan 2021 04:44:41 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 606B52255F;
        Tue, 26 Jan 2021 09:43:55 +0000 (UTC)
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=hot-poop.lan)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <maz@kernel.org>)
        id 1l4Kt7-00A4su-4M; Tue, 26 Jan 2021 09:43:53 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] [REPOST] dt-bindings: qcom,pdc: Add compatible for SM8250
Date:   Tue, 26 Jan 2021 09:43:49 +0000
Message-Id: <161165420457.2432543.12711584905186329501.b4-ty@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210115090941.2289416-1-vkoul@kernel.org>
References: <20210115090941.2289416-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: vkoul@kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org, robh@kernel.org, agross@kernel.org, tglx@linutronix.de, devicetree@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 15 Jan 2021 14:39:40 +0530, Vinod Koul wrote:
> Add the compatible string for SM8250 SoC from Qualcomm. This compatible
> is used already in DTS files but not documented yet

Applied to irq/irqchip-5.12, thanks!

[1/2] dt-bindings: qcom,pdc: Add compatible for SM8250
      commit: e6f93c0115cb24ae4b473f28a27294e99faf129a
[2/2] dt-bindings: qcom,pdc: Add compatible for SM8350
      commit: 9eaad15e5a409f59660f9fdf867f7d3e6e3db15a

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.


