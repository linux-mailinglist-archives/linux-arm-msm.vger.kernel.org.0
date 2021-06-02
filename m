Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6304B399114
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 19:06:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229692AbhFBRIO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 13:08:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:37312 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229697AbhFBRIO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 13:08:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CD90361C8F;
        Wed,  2 Jun 2021 17:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622653591;
        bh=8+5l6yCVTu8Qo94SUvK8DWGNV4FSPK3HzMTSDphxPzA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=a7nJaYM8yZZAxjglkKgsooyOn0Zj35zxkLzmmGqlfdbcjeBJ7055SPONrIf+5dDgh
         mny9HQ2lSMEVTpWqM625TgDQHlMN+ul3Vi5FOI/EaYhuLTSn5dypu94ICNS7+Ctuff
         oKO5isH0PDaMi6cwX5iNa3B3JyAe1k4AgTCBOvlIjpmAb7bDDYsqUlQkGD0g78SncO
         kTpue6ERjGDuQb5mI3gewA2/8uQc2Z9MK0upRWcvWpNIae9XvDQ8tv/LIE/94941yS
         PX2GJvj2kBMeyIgNp5XR0DCyxvezFwTs3+HGSS8ZIYvh/FBH6A8+VannUC/sy6PDgE
         u5QxlZHkqYVUg==
From:   Will Deacon <will@kernel.org>
To:     bjorn.andersson@linaro.org, mark.rutland@arm.com,
        agross@kernel.org, Tian Tao <tiantao6@hisilicon.com>
Cc:     catalin.marinas@arm.com, kernel-team@android.com,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] move to use request_irq by IRQF_NO_AUTOEN flag
Date:   Wed,  2 Jun 2021 18:06:24 +0100
Message-Id: <162263448864.1277252.10521905851426548574.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1622595642-61678-1-git-send-email-tiantao6@hisilicon.com>
References: <1622595642-61678-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 2 Jun 2021 09:00:40 +0800, Tian Tao wrote:
> patch #1 and #2 both use IRQF_NO_AUTOEN instead of
> irq_set_status_flags(irq, IRQ_NOAUTOEN). this change is just to simplify
> the code, no actual functional changes.
> 
> Tian Tao (2):
>   arm_pmu: move to use request_irq by IRQF_NO_AUTOEN flag
>   perf: qcom_l2_pmu: move to use request_irq by IRQF_NO_AUTOEN flag
> 
> [...]

Applied to will (for-next/perf), thanks!

[1/2] arm_pmu: move to use request_irq by IRQF_NO_AUTOEN flag
      https://git.kernel.org/will/c/3c1f2eb5475a
[2/2] perf: qcom_l2_pmu: move to use request_irq by IRQF_NO_AUTOEN flag
      https://git.kernel.org/will/c/0d0f144a8f5f

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
