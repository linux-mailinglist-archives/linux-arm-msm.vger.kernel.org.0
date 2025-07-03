Return-Path: <linux-arm-msm+bounces-63570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD28AF803F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 20:37:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4315E1CA2D6C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 18:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75BF32F5C20;
	Thu,  3 Jul 2025 18:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dh14DThc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DB22F2C64;
	Thu,  3 Jul 2025 18:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751567697; cv=none; b=Mb/nEzVCT46LUkuf4cmdK8jHIKlIsDVnH+97Ey/sJiw4DPJcFL4HFleeI/y6uUWDZ+wLIJLiWGMoPn7FDmv+5VSmBeQ6vEnxS6EUqZ/JgRH4f770Qmto8T3cBSljFEbipjQIkVIYCdiStUYR/MLmyFXaYbFq929uuHfXbWjxv5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751567697; c=relaxed/simple;
	bh=ddJR3g0DV3NYq/GCtOKJsDzPchINn9NuvOh3PYb40VM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ka1X5zjayme5/O2VPLYuK9P/TKjB71DqVou+ZkAo5j71pzWD5u4WczJNLMnLDJX6k114qMs//cir9iKTMTP9LRxu4OhfDu0wA2XMsr9Q56RO5A2NMpKqLVY7iiwJVdntc+9tTXU/YwOSklfE8PKQLwtnn/Za9mSln8Bwrkx6DMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dh14DThc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FC2AC4CEF1;
	Thu,  3 Jul 2025 18:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751567697;
	bh=ddJR3g0DV3NYq/GCtOKJsDzPchINn9NuvOh3PYb40VM=;
	h=From:To:Cc:Subject:Date:From;
	b=dh14DThcxzPcGCkaUf/KmJZB8nPRrBPA7/kM3zkQJMKWNyixu+r1jcOs+pTvad3Cd
	 qAKBclM5ak3+ocK4oVw65IrfQY7+s98z1blgQs/fMaGtdTogNbs/dYmsrCqam0JJpZ
	 Nb736EZUdJWeWPS6VRdLx85iPM+ZuoxcIUxCs0511FByEaWAau8MPswTCFWPo/47rL
	 vRRGEVXlHAPdcsCFCucHfcDJk6sPvVtH4ddQaXwRi+E6MvGPqRtZzoiNRC3pZRKtSH
	 DjuYtBKVmigvW857+yeU1VTRbAroOFHC7Rhu9dcupXw7tYolbaZHSh/aHZqAl6sHlR
	 7a1h5ulglWS5w==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>,
	Amol Maheshwari <amahesh@qti.qualcomm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] misc: fastrpc: Use of_reserved_mem_region_to_resource() for "memory-region"
Date: Thu,  3 Jul 2025 13:34:54 -0500
Message-ID: <20250703183455.2074215-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the newly added of_reserved_mem_region_to_resource() function to
handle "memory-region" properties.

The error handling is a bit different. "memory-region" is optional, so
failed lookup is not an error. But then an error in
of_reserved_mem_lookup() is treated as an error. However, that
distinction is not really important. Either the region is available
and usable or it is not. So now, it is just
of_reserved_mem_region_to_resource() which is checked for an error.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/misc/fastrpc.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 378923594f02..53e88a1bc430 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2262,8 +2262,6 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	int i, err, domain_id = -1, vmcount;
 	const char *domain;
 	bool secure_dsp;
-	struct device_node *rmem_node;
-	struct reserved_mem *rmem;
 	unsigned int vmids[FASTRPC_MAX_VMIDS];
 
 	err = of_property_read_string(rdev->of_node, "label", &domain);
@@ -2306,20 +2304,17 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		}
 	}
 
-	rmem_node = of_parse_phandle(rdev->of_node, "memory-region", 0);
-	if (domain_id == SDSP_DOMAIN_ID && rmem_node) {
+	if (domain_id == SDSP_DOMAIN_ID) {
+		struct resource res;
 		u64 src_perms;
 
-		rmem = of_reserved_mem_lookup(rmem_node);
-		if (!rmem) {
-			err = -EINVAL;
-			goto err_free_data;
-		}
+		err = of_reserved_mem_region_to_resource(rdev->of_node, 0, &res);
+		if (!err) {
+			src_perms = BIT(QCOM_SCM_VMID_HLOS);
 
-		src_perms = BIT(QCOM_SCM_VMID_HLOS);
-
-		qcom_scm_assign_mem(rmem->base, rmem->size, &src_perms,
+			qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
 				    data->vmperms, data->vmcount);
+		}
 
 	}
 
-- 
2.47.2


