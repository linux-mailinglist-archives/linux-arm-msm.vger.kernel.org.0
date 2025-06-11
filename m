Return-Path: <linux-arm-msm+bounces-60945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C9CAD525F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 12:44:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86300177600
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 10:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A00FD277013;
	Wed, 11 Jun 2025 10:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ixQg2U+2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758E927145D;
	Wed, 11 Jun 2025 10:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749638638; cv=none; b=USRMaLp8aha+BD/Bd0rlEkjofUOBoEGOoVCyiWyJv0yEwkL89ph2In2ZMEry67adBCFyfW7vEDxv3rliZ69gHyfLNZSj26f880Ke69IOKFW02/yOllfgvFlkuqMk2d+4Mhu5FXVXjWljB8ue+tNRrFHhUnJF4hweJY7GEJomQEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749638638; c=relaxed/simple;
	bh=SxVgloiedDddTuoCzwRU31NMinDlF8gzHdqvxB0Y+0A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LBakMritTZPVSkIU0GHU+cieJlx9REQZ9axDR6jcgkyjBndi+pgUfuGFc/lc5QJdO6mpa8f4jw3DSjfcYy1aaHFyMIqInRUf4QxLD4uSIz2evN5nL1WEH4EM/DsBYeF+yTE0tBCnlbU3L5m2akE5/+zdo68XFYv52qBu6L19bMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ixQg2U+2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CFDCC4CEF2;
	Wed, 11 Jun 2025 10:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749638638;
	bh=SxVgloiedDddTuoCzwRU31NMinDlF8gzHdqvxB0Y+0A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ixQg2U+29+/lnRxdF08lMlWPo4ehb0oLFJRyRMG0Fcn9ALezaO55pnUfGSRXrbK6o
	 KYvWB+fLAJH64xlX/dLoX1WFTSnRw0HYZF2x4t3Z/W4A2uN/FukIf8uAFf9OsX9DJi
	 LOXpLPH7ILsPFvT9V0G1wfX7+ML0D22Nlt7swPZpZi1hblDMmtoVN00pZ0vvEyzU5Q
	 SSAnAzEe4/p0aJvFypqdFuUx6odQMI2dzrJ4WMdcn7qFRptN7ndahRvGvudArxSBzW
	 X4BWbE33XgyvbI2NTp2CgSs8YhJdlBM9bsXDI9Ue53YCeIxhx7boy3F03CaY2UI8wj
	 5+CzdgU64CGrw==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: tglx@linutronix.de,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm: use dev_fwnode()
Date: Wed, 11 Jun 2025 12:43:32 +0200
Message-ID: <20250611104348.192092-4-jirislaby@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611104348.192092-1-jirislaby@kernel.org>
References: <20250611104348.192092-1-jirislaby@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

irq_domain_create_simple() takes fwnode as the first argument. It can be
extracted from the struct device using dev_fwnode() helper instead of
using of_node with of_fwnode_handle().

So use the dev_fwnode() helper.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>
Cc: Sean Paul <sean@poorly.run>
Cc: Marijn Suijten <marijn.suijten@somainline.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>

---

Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
---
 drivers/gpu/drm/msm/msm_mdss.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 709979fcfab6..5ea2a2241246 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -150,8 +150,7 @@ static int _msm_mdss_irq_domain_add(struct msm_mdss *msm_mdss)
 
 	dev = msm_mdss->dev;
 
-	domain = irq_domain_create_linear(of_fwnode_handle(dev->of_node), 32,
-			&msm_mdss_irqdomain_ops, msm_mdss);
+	domain = irq_domain_create_linear(dev_fwnode(dev), 32, &msm_mdss_irqdomain_ops, msm_mdss);
 	if (!domain) {
 		dev_err(dev, "failed to add irq_domain\n");
 		return -EINVAL;
-- 
2.49.0


