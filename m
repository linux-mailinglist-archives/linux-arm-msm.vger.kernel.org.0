Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 277A427D435
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Sep 2020 19:13:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728346AbgI2RNW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Sep 2020 13:13:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:50846 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725554AbgI2RNW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Sep 2020 13:13:22 -0400
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D133D2071E;
        Tue, 29 Sep 2020 17:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601399601;
        bh=60VTZlLteB5DJP1R0FZbTxHInz53+hwtLpTUiLt8T6c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=axvy8lErPyqNZ3jGLIFC8qXDKXY9b+eqnRrobIvGS9PceOtri38KW3J1frp+nF5QT
         U84jiQQU5cc4yt29DkUl0uMANHgA3GmvKLorMKEcBoquvb/7BkkkhGHVwGOTBk9/bl
         Nz7Mi+eawC1M1+zsnpbEjgrjY589QwwtYjB9BbGI=
From:   Will Deacon <will@kernel.org>
To:     joro@8bytes.org, robdclark@gmail.com, Yu Kuai <yukuai3@huawei.com>
Cc:     catalin.marinas@arm.com, kernel-team@android.com,
        Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
        yi.zhang@huawei.com, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org
Subject: Re: [PATCH V2] iommu/qcom: add missing put_device() call in qcom_iommu_of_xlate()
Date:   Tue, 29 Sep 2020 18:13:12 +0100
Message-Id: <160139315360.1642555.11996914864998591532.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200929014037.2436663-1-yukuai3@huawei.com>
References: <20200929014037.2436663-1-yukuai3@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 29 Sep 2020 09:40:37 +0800, Yu Kuai wrote:
> if of_find_device_by_node() succeed, qcom_iommu_of_xlate() doesn't have
> a corresponding put_device(). Thus add put_device() to fix the exception
> handling for this function implementation.

Applied to will (for-joerg/arm-smmu/updates), thanks!

[1/1] iommu/qcom: add missing put_device() call in qcom_iommu_of_xlate()
      https://git.kernel.org/will/c/e2eae09939a8

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
