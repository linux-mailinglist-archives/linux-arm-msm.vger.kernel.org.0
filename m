Return-Path: <linux-arm-msm+bounces-41189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7329EA632
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 04:09:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3299166AFA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 03:09:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A7961A23AC;
	Tue, 10 Dec 2024 03:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bsxzbqyt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1652AEFE;
	Tue, 10 Dec 2024 03:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733800179; cv=none; b=gJnaJrraf42TFjuI879f5JAs/S2J5n+sbYEM+olBKavtz4gIis0EFFZVESLrQHtIlFNwuDoW2aPpnFrq0bnMnzS0eWvM16QdG4Wd34XTEamPBkJnprSe6XnRm68s3umDjx0X7+GVLrHMMSaRcTJ7yuZ27+ATQG/ibbeH5fboxP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733800179; c=relaxed/simple;
	bh=NOA2/DBZGRoJDn0ABlS/fs8FhWVxOXQ7w2bXuvP5gRk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NNZGlbHoWtRFbdyzNeV3tHl9oix96BDBBH7+rJmt9p3F6Tjx3Ij7MBzSrWGAHMtAuHvxqRrdo3tBKrxGApAEtazRAcxb8llVIEycGZwzCFsPjvhYjQFTbLZ2mbqz2dFP74ewz2xK5yjeMNSNAbQKhlPaAgT2vFUR8iqs7ucaI7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bsxzbqyt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F7AEC4CED1;
	Tue, 10 Dec 2024 03:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733800179;
	bh=NOA2/DBZGRoJDn0ABlS/fs8FhWVxOXQ7w2bXuvP5gRk=;
	h=From:To:Cc:Subject:Date:From;
	b=Bsxzbqyt+q747cJsxlqPG9HqNqJcai8XUqziSHZPikS7cGOE7tt72YLm7iqc5O1T6
	 1Bl53GFA+6APMZiMTgKUE894MSFyALdSHl58rcIajzjCNAG4q3msOmtw5UVuCEh6yW
	 rX4VKfC5pA5O74jv4Tqnn7vN8Cx+ePetu0pxrWc03+js/RMHnVITe46sQkigALQ76W
	 TZxr0VrfVOuXDYAL0oV949siLeW0TNqVEudw6bV8iU4Rlq/cm/P14sf1e93707low2
	 faY7SVJNRZQjaiP36pZq1aYWa+rYR6DnvWVZ7/QFD35Kh0pKwMcpSo2VLnE5elSA0T
	 EMSh/PNPljdog==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-scsi@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Gaurav Kashyap <quic_gaurkash@quicinc.com>,
	stable@vger.kernel.org,
	Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH] ufs: qcom: fix crypto key eviction
Date: Mon,  9 Dec 2024 19:08:39 -0800
Message-ID: <20241210030839.1118805-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Eric Biggers <ebiggers@google.com>

Commit 56541c7c4468 ("scsi: ufs: ufs-qcom: Switch to the new ICE API")
introduced an incorrect check of the algorithm ID into the key eviction
path, and thus qcom_ice_evict_key() is no longer ever called.  Fix it.

Fixes: 56541c7c4468 ("scsi: ufs: ufs-qcom: Switch to the new ICE API")
Cc: stable@vger.kernel.org
Cc: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 drivers/ufs/host/ufs-qcom.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 68040b2ab5f82..e33ae71245dd0 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -153,27 +153,25 @@ static int ufs_qcom_ice_program_key(struct ufs_hba *hba,
 				    const union ufs_crypto_cfg_entry *cfg,
 				    int slot)
 {
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
 	union ufs_crypto_cap_entry cap;
-	bool config_enable =
-		cfg->config_enable & UFS_CRYPTO_CONFIGURATION_ENABLE;
+
+	if (!(cfg->config_enable & UFS_CRYPTO_CONFIGURATION_ENABLE))
+		return qcom_ice_evict_key(host->ice, slot);
 
 	/* Only AES-256-XTS has been tested so far. */
 	cap = hba->crypto_cap_array[cfg->crypto_cap_idx];
 	if (cap.algorithm_id != UFS_CRYPTO_ALG_AES_XTS ||
 	    cap.key_size != UFS_CRYPTO_KEY_SIZE_256)
 		return -EOPNOTSUPP;
 
-	if (config_enable)
-		return qcom_ice_program_key(host->ice,
-					    QCOM_ICE_CRYPTO_ALG_AES_XTS,
-					    QCOM_ICE_CRYPTO_KEY_SIZE_256,
-					    cfg->crypto_key,
-					    cfg->data_unit_size, slot);
-	else
-		return qcom_ice_evict_key(host->ice, slot);
+	return qcom_ice_program_key(host->ice,
+				    QCOM_ICE_CRYPTO_ALG_AES_XTS,
+				    QCOM_ICE_CRYPTO_KEY_SIZE_256,
+				    cfg->crypto_key,
+				    cfg->data_unit_size, slot);
 }
 
 #else
 
 #define ufs_qcom_ice_program_key NULL

base-commit: 7cb1b466315004af98f6ba6c2546bb713ca3c237
-- 
2.47.1


