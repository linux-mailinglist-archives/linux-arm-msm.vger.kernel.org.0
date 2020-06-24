Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE9DB2074FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2020 15:55:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391174AbgFXNzo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jun 2020 09:55:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:42680 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391147AbgFXNzn (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jun 2020 09:55:43 -0400
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CF7C420781;
        Wed, 24 Jun 2020 13:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593006943;
        bh=msJljTZ30DHOALc4NDJXZALraFGHPtuYMSdFceXl97w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tFC0RUC/hyrX5PVAPN8kUZnTOKOA2PJYthyMqUpMEyjsmrmoufWL032+MBMGsQRUM
         bfBAxJoUaPSFDMUprsNGSYcwjgsqGUvTtHyhuZn5B8GMWe1m76+1fCp31pcGqSWNGn
         1Lr0TFqKUpesC4p8ncY/wW2BsWH966A3RD8Yb1w4=
From:   Will Deacon <will@kernel.org>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Douglas Anderson <dianders@chromium.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Marc Zyngier <maz@kernel.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>
Cc:     kernel-team@android.com, Will Deacon <will@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH] arm64: kpti: Add KRYO{3, 4}XX silver CPU cores to kpti safelist
Date:   Wed, 24 Jun 2020 14:54:52 +0100
Message-Id: <159300510700.57173.9996277859967187926.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200624123406.3472-1-saiprakash.ranjan@codeaurora.org>
References: <20200624123406.3472-1-saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 24 Jun 2020 18:04:06 +0530, Sai Prakash Ranjan wrote:
> QCOM KRYO{3,4}XX silver/LITTLE CPU cores are based on Cortex-A55
> and are meltdown safe, hence add them to kpti_safe_list[].

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: kpti: Add KRYO{3, 4}XX silver CPU cores to kpti safelist
      https://git.kernel.org/arm64/c/f4617be35b4b

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
