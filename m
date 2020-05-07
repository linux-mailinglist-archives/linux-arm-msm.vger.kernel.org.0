Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 788F71C8D7E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2020 16:05:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726598AbgEGOFG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 May 2020 10:05:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:55294 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726580AbgEGOFG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 May 2020 10:05:06 -0400
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8BD282084D;
        Thu,  7 May 2020 14:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588860306;
        bh=SiwCH8RCKfzXT3qqrhJZK6OicpexUtZYquQREUsumG0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AvO/xVWP7PR6qhNwWQTmOuJP+VmmvTjbcv7/q8WBox/SvGGpjlLs0ZpZWiMQQqE8k
         07XEMskdNPbV4W/3A3Sd8DKXulryXo/P7jizjir6hH/A3wgkZ1oTWAuapQYbWI+5An
         RgrPeC32TR1T/YvGhq3ltgPztLpwbdSfcFH4UqHk=
From:   Will Deacon <will@kernel.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>
Cc:     catalin.marinas@arm.com, Will Deacon <will@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org
Subject: Re: [PATCHv2] iommu/arm-smmu: Make remove callback message more informative
Date:   Thu,  7 May 2020 15:04:54 +0100
Message-Id: <158885763013.86999.17864741879925126551.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200423095531.9868-1-saiprakash.ranjan@codeaurora.org>
References: <20200423095531.9868-1-saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 23 Apr 2020 15:25:31 +0530, Sai Prakash Ranjan wrote:
> Currently on reboot/shutdown, the following messages are
> displayed on the console as error messages before the
> system reboots/shutdown as part of remove callback.
> 
> On SC7180:
> 
>   arm-smmu 15000000.iommu: removing device with active domains!
>   arm-smmu 5040000.iommu: removing device with active domains!
> 
> [...]

Applied to will (for-joerg/arm-smmu/updates), thanks!

[1/1] iommu/arm-smmu: Make remove callback message more informative
      https://git.kernel.org/will/c/02782f3d60f1

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
