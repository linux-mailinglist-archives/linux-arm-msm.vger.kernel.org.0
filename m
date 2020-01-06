Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2CAA130DC8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2020 08:08:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726707AbgAFHIk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jan 2020 02:08:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:41974 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726477AbgAFHIj (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jan 2020 02:08:39 -0500
Received: from localhost.localdomain (unknown [117.99.94.5])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7950821734;
        Mon,  6 Jan 2020 07:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578294519;
        bh=jcMGfDJ/l8aPZ8hnPH44OsHJ1VO3mgrqDScv0+LD6G0=;
        h=From:To:Cc:Subject:Date:From;
        b=GQa+zQniwgC7abcVLHJb2017wPEzrDTRw6Z8ehietXXjJySCKZ7tgM4ROv227Rbzo
         clyJhRC3Zm6w/kc1OOpfZG/XKyX8BnLDFX/Nq5ulxdgJlOy6UiPtn2AgNQY0JpEKdJ
         bh+OjdWedcGh4ozc+DukUyxG6wKT7GslDfnFsV94=
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Can Guo <cang@codeaurora.org>
Subject: [PATCH 0/3] arm64: dts: qcom: UFS updates
Date:   Mon,  6 Jan 2020 12:38:23 +0530
Message-Id: <20200106070826.147064-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We recently saw regression on UFS on SM8150 and few other boards and that
was resolved by adding timeout and fixing the UFS phy reset sequence. That
patches are in linux-next now.

During this we found sm8150 lacks gpio reset for ufs, so add that and fix
the ufs phy register size.
Also add the sdm845 ufs reset.

Vinod Koul (3):
  arm64: dts: qcom: sm8150-mtp: Add UFS gpio reset
  arm64: dts: qcom: sm8150: Fix UFS phy register size
  arm64: dts: qcom: sdm845: add the ufs reset

 arch/arm64/boot/dts/qcom/sdm845.dtsi    | 2 ++
 arch/arm64/boot/dts/qcom/sm8150-mtp.dts | 3 +++
 arch/arm64/boot/dts/qcom/sm8150.dtsi    | 2 +-
 3 files changed, 6 insertions(+), 1 deletion(-)

-- 
2.24.1

