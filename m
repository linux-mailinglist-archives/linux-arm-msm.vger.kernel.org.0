Return-Path: <linux-arm-msm+bounces-50419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3815A50EED
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 23:45:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E86303AD4EE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 22:44:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77C39267394;
	Wed,  5 Mar 2025 22:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eq9c20d4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C7B267380;
	Wed,  5 Mar 2025 22:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741214689; cv=none; b=FTYHVRWgwT97Xy+zIDkE3kue+W5fk2qdzA20MG5LyD2cMPQEcqt25YtxqRQmR2LAghELvx7rxZUskCYHEfQ9eBPBNIXGCqnImYOwrtXuMNFj/8A+TRd60lF1wBG3Wtd1REPbUyNgCK0fLSTspfQbcsI5PpCe4sMQq9bQ5JRhviI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741214689; c=relaxed/simple;
	bh=2JxaXI5uQ/VneCUNHP4A8xwsmj4sJP3Fjq8bh80NpMk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ChIqq6Ka8kAk9o0L2xbAUw2O9EyMXtMmf1jO/tXxRCS5znrM9a0RjUQ/RuEuxnNgUnScxVvn60ut9MQJmUYj1IkEqSzhDvMPaNxZ1nMIjcMtPGh3Zfe2jopaunlnIReBzM0rY5c/0JtPNWE4KgVsHblhl/4YneAJpPrI8eF0mh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eq9c20d4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BEF4C4CEE8;
	Wed,  5 Mar 2025 22:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741214688;
	bh=2JxaXI5uQ/VneCUNHP4A8xwsmj4sJP3Fjq8bh80NpMk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eq9c20d4norAxAO/oMommFxdW5nm5a2y3XaA7Qha34sd5nGnP/rbR0V456aYJ4EeC
	 cP7aJS37nVs2b667748aLYJ9J+kwrHvmFzaIlYfB7HDTgi9vdCnCWpFkQCIstZQgzN
	 ZK5cGurB3ATJ962JrXevwrV+Rxjb38ZM44YqTq6asgFg2Qcr0QQZuMFKwCFoSH5FR0
	 MkbKMdfS90PvCPDhCSXem6gZHUMDPqEZFa6M55GtnnS1csFE7/gxoKHhukfYWu1uAt
	 gZSon1tF0JDfLAp2y9itQJF+Ua7euPIIUnui/+AzSsMxPs2wDNmRatJQ1rJnqCfXWq
	 hcI7JpQEaS+Mw==
From: Dmitry Baryshkov <lumag@kernel.org>
Date: Thu, 06 Mar 2025 00:44:37 +0200
Subject: [PATCH 2/2] mailmap: remap all addresses to kernel.org alias
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-update-email-v1-2-9a231571e905@kernel.org>
References: <20250306-update-email-v1-0-9a231571e905@kernel.org>
In-Reply-To: <20250306-update-email-v1-0-9a231571e905@kernel.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1435; i=lumag@kernel.org;
 h=from:subject:message-id; bh=2JxaXI5uQ/VneCUNHP4A8xwsmj4sJP3Fjq8bh80NpMk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnyNPbtNRffpS72VGGUzgGFdbbeJ4zw8URN3JwT
 MnlkNNV+g+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8jT2wAKCRCLPIo+Aiko
 1VXoB/9r868Rnm6Qgm8v+i+z+GwgFkQsLFFZJ/rkbhFHCaL5qp/nuJBuLKC4ORbhfMqR0sSKqPF
 bV2pQrWJBQ8pOalre5Hte6DapC+ZiOLplDHok4KiqNHhLXNkYufmrcatuX0P+a/vy15BOlCW6bY
 5SW9CbZNAurM0klwzqGzcuBQjrQVAzj9+BRea2nbGnX7SiOd9dIrueKAjiLPiLE+n4Ml2Ru/hqy
 ZbbmYVkvvaJty5Sj15/SokhZZkIn0+Gi4+q2fNLXhQt4s8Yy3twdg8hE1c57cfY+9/33iYjGvan
 WWNQxEzqJ9FkyCRZRefv2BKWXZy0tyH0IbnSnwRSuu3h7HKH
X-Developer-Key: i=lumag@kernel.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Remap all historical and non-historical entries to my kernel.org email.

Signed-off-by: Dmitry Baryshkov <lumag@kernel.org>
---
 .mailmap | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/.mailmap b/.mailmap
index 01145c078838bf9348e8d0e5e48b7b0954248dc5..a5c80ef0b7800519f3124e0d85294f34d6b275ca 100644
--- a/.mailmap
+++ b/.mailmap
@@ -198,10 +198,11 @@ Dengcheng Zhu <dzhu@wavecomp.com> <dengcheng.zhu@imgtec.com>
 Dengcheng Zhu <dzhu@wavecomp.com> <dengcheng.zhu@mips.com>
 <dev.kurt@vandijck-laurijssen.be> <kurt.van.dijck@eia.be>
 Dikshita Agarwal <quic_dikshita@quicinc.com> <dikshita@codeaurora.org>
-Dmitry Baryshkov <dbaryshkov@gmail.com>
-Dmitry Baryshkov <dbaryshkov@gmail.com> <[dbaryshkov@gmail.com]>
-Dmitry Baryshkov <dbaryshkov@gmail.com> <dmitry_baryshkov@mentor.com>
-Dmitry Baryshkov <dbaryshkov@gmail.com> <dmitry_eremin@mentor.com>
+Dmitry Baryshkov <lumag@kernel.org> <dbaryshkov@gmail.com>
+Dmitry Baryshkov <lumag@kernel.org> <[dbaryshkov@gmail.com]>
+Dmitry Baryshkov <lumag@kernel.org> <dmitry_baryshkov@mentor.com>
+Dmitry Baryshkov <lumag@kernel.org> <dmitry_eremin@mentor.com>
+Dmitry Baryshkov <lumag@kernel.org> <dmitry.baryshkov@linaro.org>
 Dmitry Safonov <0x7f454c46@gmail.com> <dima@arista.com>
 Dmitry Safonov <0x7f454c46@gmail.com> <d.safonov@partner.samsung.com>
 Dmitry Safonov <0x7f454c46@gmail.com> <dsafonov@virtuozzo.com>

-- 
2.39.5


