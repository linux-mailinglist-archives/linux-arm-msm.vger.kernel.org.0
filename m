Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EDDD1D8B5F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2020 01:05:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728135AbgERXE2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 May 2020 19:04:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:50238 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726490AbgERXE2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 May 2020 19:04:28 -0400
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D56B7207F9;
        Mon, 18 May 2020 23:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589843068;
        bh=KGUQGz4db3YjWPudFeOfKSYM0sWPkRsvPRm4npW190o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QiYgQErP+LqAuYyClBRqQfZb8lTctaFLjv1rRjDatVQa4+ACebdT3cczztU9y/m4X
         E6a5RwRyF7McE6jg2mwRHz+DInqvnyTv0xcLfVldVojV0mFkp/NvQmKk06TlQy2MHS
         K6mn7Pw3TmAhV73dowk5GXTeTO8eObZgPHiY4Zv0=
From:   Will Deacon <will@kernel.org>
To:     robin.murphy@arm.com, swboyd@chromium.org, joro@8bytes.org,
        Sibi Sankar <sibis@codeaurora.org>
Cc:     catalin.marinas@arm.com, Will Deacon <will@kernel.org>,
        dianders@chromium.org, iommu@lists.linux-foundation.org,
        bjorn.andersson@linaro.org, mka@chromium.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, evgreen@chromium.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] iommu/arm-smmu-qcom: Request direct mapping for modem device
Date:   Tue, 19 May 2020 00:04:08 +0100
Message-Id: <158981250642.239015.17275693427372248725.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200511175532.25874-1-sibis@codeaurora.org>
References: <20200511175532.25874-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 11 May 2020 23:25:32 +0530, Sibi Sankar wrote:
> The modem remote processor has two access paths to DDR. One path is
> directly connected to DDR and another path goes through an SMMU. The
> SMMU path is configured to be a direct mapping because it's used by
> various peripherals in the modem subsystem. Typically this direct
> mapping is configured statically at EL2 by QHEE (Qualcomm's Hypervisor
> Execution Environment) before the kernel is entered.
> 
> [...]

Applied to will (for-joerg/arm-smmu/updates), thanks!

[1/1] iommu/arm-smmu-qcom: Request direct mapping for modem device
      https://git.kernel.org/will/c/d100ff3843b7

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
