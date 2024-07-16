Return-Path: <linux-arm-msm+bounces-26274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD98C93213C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 09:31:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE9721C211C8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 07:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3DD621350;
	Tue, 16 Jul 2024 07:30:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF574687;
	Tue, 16 Jul 2024 07:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721115059; cv=none; b=F/tPjmlb+6BfkErHw/c5MlH5e7HQqPC+o8w9xc/CDW5HHqaUrZIWN8SBHhm06H2iDfnCxTLnM61xD5Xpe6rFo+TDThVMyXtuQJX96nKT09dFjp2ZRUJYQI+in3/YDNBd2uUUW4JnvXJ6szehf3twN4lUvFOM1T3JPLz0KkOiyYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721115059; c=relaxed/simple;
	bh=cVPIPkX7v007ff3LU6KGGLWVrARomilM8CycTdtwLNM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nIftgWwJ4zith0auYlcX2FxIVH9AqaG3d3r4Hu8OrFqolUVPqieEs7HqH8E1IYp0wdB5ATS6WsgNg0bAKb2g02GJB+rFMNVqrdtrHpdcKUl70dEXnzI/dACNhIZAk1tjieYA/G5HSZ8GAeYQpg0ohWHogqMBUQE66iBcOR7Fxgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WNW0Q2p7Dzdhvy;
	Tue, 16 Jul 2024 15:29:10 +0800 (CST)
Received: from kwepemm600007.china.huawei.com (unknown [7.193.23.208])
	by mail.maildlp.com (Postfix) with ESMTPS id 93EF5140158;
	Tue, 16 Jul 2024 15:30:53 +0800 (CST)
Received: from DESKTOP-8RFUVS3.china.huawei.com (10.174.178.219) by
 kwepemm600007.china.huawei.com (7.193.23.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 16 Jul 2024 15:30:52 +0800
From: Zenghui Yu <yuzenghui@huawei.com>
To: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_jhugo@quicinc.com>, <quic_carlv@quicinc.com>,
	<quic_pkanojiy@quicinc.com>, <ogabbay@kernel.org>, <corbet@lwn.net>,
	<wanghaibin.wang@huawei.com>, Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH] accel/qaic: Remove the description of DRM_IOCTL_QAIC_PART_DEV
Date: Tue, 16 Jul 2024 15:30:36 +0800
Message-ID: <20240716073036.453-1-yuzenghui@huawei.com>
X-Mailer: git-send-email 2.23.0.windows.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600007.china.huawei.com (7.193.23.208)

The partition device ioctl was removed during the development of the
initial version of qaic driver. Remove its description from the
documentation to avoid confusing readers.

Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
---
 Documentation/accel/qaic/qaic.rst | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/accel/qaic/qaic.rst b/Documentation/accel/qaic/qaic.rst
index efb7771273bb..62a8d2b4711d 100644
--- a/Documentation/accel/qaic/qaic.rst
+++ b/Documentation/accel/qaic/qaic.rst
@@ -147,12 +147,6 @@ DRM_IOCTL_QAIC_PERF_STATS_BO
   recent execution of a BO. This allows userspace to construct an end to end
   timeline of the BO processing for a performance analysis.
 
-DRM_IOCTL_QAIC_PART_DEV
-  This IOCTL allows userspace to request a duplicate "shadow device". This extra
-  accelN device is associated with a specific partition of resources on the
-  AIC100 device and can be used for limiting a process to some subset of
-  resources.
-
 DRM_IOCTL_QAIC_DETACH_SLICE_BO
   This IOCTL allows userspace to remove the slicing information from a BO that
   was originally provided by a call to DRM_IOCTL_QAIC_ATTACH_SLICE_BO. This
-- 
2.33.0


