Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD227426B54
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Oct 2021 14:53:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230243AbhJHMzv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Oct 2021 08:55:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:51568 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230240AbhJHMzs (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Oct 2021 08:55:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DA5F560E95;
        Fri,  8 Oct 2021 12:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633697633;
        bh=2fD1r6XdYEnrTqOo5a/SEV1Oog2ktC6UtngYjawftqQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=U59HuAGvLF4XuD+R226Nhjb+lIpC77jS2eRFeoyO7sNm72qnfit9okT6fYVC78n6M
         2zj0BFjyKPcAns5FrXzWFaiY/+0yiDUCji2P09UGDav5q6BkXpf8kcmDqpL+Ntl+KI
         s89d8aduvIrZ9PCy2x0LXDeunELNTif7Vb27eajD+iqFJqgvUR07V8zo25Eb0QBfpX
         T/9syAcayAZwbIEnXFzT/8Z/LWB5OeRGM7C1ZQUO7iqx1FYmPb9XoJVmaxeEksZrt1
         GLJ0nsPBDufCtg5aGNPmtwsHDxZT5/fRDYEjl9Da78lEDfR2yY/Q42tvubcsvEdYga
         JIg74Q9PSa5JQ==
From:   Will Deacon <will@kernel.org>
To:     bjorn.andersson@linaro.org, Sibi Sankar <sibis@codeaurora.org>,
        swboyd@chromium.org, mka@chromium.org,
        saiprakash.ranjan@codeaurora.org, robh+dt@kernel.org
Cc:     catalin.marinas@arm.com, kernel-team@android.com,
        Will Deacon <will@kernel.org>, dianders@chromium.org,
        robin.murphy@arm.com, joro@8bytes.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        ohad@wizery.com, evgreen@chromium.org, p.zabel@pengutronix.de,
        agross@kernel.org, linux-remoteproc@vger.kernel.org,
        mathieu.poirier@linaro.org
Subject: Re: [PATCH v5 00/10] Add Modem support on SC7280 SoCs
Date:   Fri,  8 Oct 2021 13:53:43 +0100
Message-Id: <163368046524.3290434.2853737091641040561.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1631886935-14691-1-git-send-email-sibis@codeaurora.org>
References: <1631886935-14691-1-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 17 Sep 2021 19:25:25 +0530, Sibi Sankar wrote:
> This patch series adds support for booting the Modem Q6 DSP found on
> Qualcomm's SC7280 SoCs.
> 
> Depends on:
> qmp_send: https://patchwork.kernel.org/project/linux-arm-msm/cover/1630420228-31075-1-git-send-email-deesin@codeaurora.org/
> rproc qmp: https://patchwork.kernel.org/project/linux-arm-msm/cover/1631800770-371-1-git-send-email-sibis@codeaurora.org/
> 
> [...]

Applied SMMU patch to will (for-joerg/arm-smmu/updates), thanks!

[04/10] iommu/arm-smmu-qcom: Request direct mapping for modem device
        https://git.kernel.org/will/c/e37f1fe43324

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
