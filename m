Return-Path: <linux-arm-msm+bounces-27600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 08329943B92
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 02:28:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0647F1C21BA6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 00:28:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3933918A6A7;
	Thu,  1 Aug 2024 00:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bnOsXhTN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A89F189BBD;
	Thu,  1 Aug 2024 00:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722471298; cv=none; b=bTpfMPmOhm2lea90DrIFpzi8Smlr09DlSssuJJ8ef8fwl7zh2+QFru2ecjtjpHzHTjv7IBWvb6XNuLTzQ7lgLZxkw7WvODGzaEaY8zB7v9NDC4w2VumMvNzLtFfy1udPJtwwDp2+fdD1/CjLms9NpinjJYz78LbcPNmZtJD9zA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722471298; c=relaxed/simple;
	bh=dam+d36SAZLr3CX830BlK3Vb4G+3I/Cxso1OcgrzSHk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=boV2zyAC8GoIBGcDkYOOF362H1pLuBk+xOabtZf3n4hBRpO5GMfvYVy+oDj467i+Vn5eJjVH1rB8IBqsg+TWX64Gb9q6XnbyakRwuq4gBkqUuuVWoMPuG3NHnvjLNR1Tz3b/uRI+edw4uK11R/mVhkEhXioIwEJlEAUfVZXaTwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bnOsXhTN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDD72C116B1;
	Thu,  1 Aug 2024 00:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722471297;
	bh=dam+d36SAZLr3CX830BlK3Vb4G+3I/Cxso1OcgrzSHk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bnOsXhTN8W84DqjvDNcYP1Tk6FZcZeJKMtYFbeuF41rLNkOy1OtS9q+wQtfxm8iPv
	 XJhWjCGdq3iPu2YX0nG6eFHr9ILxu4p96CWTz13o0OElyiDLaxKPoH+nT9YjasH+rK
	 K2jDr65LdhnvqWldlRx7Mlxl075uUrsEpJlaTZMUOc9TStkoO1nZvun4pqEZ3na42s
	 bC6z2zhCeK2ZZyYnafJzPrC/tTJF6P6Y8591Zj5Z7Vf31cp0UWS75jXWpfSVJe8K2+
	 9Qys5U/on/L9B4D7tllkOnXcELvUbk4wi3islbt7HxiwmtyKX1DPizWkVgbap7k2RD
	 d0lEtzGqxWgjQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Richard Maina <quic_rmaina@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Chris Lew <quic_clew@quicinc.com>,
	Sasha Levin <sashal@kernel.org>,
	mathieu.poirier@linaro.org,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH AUTOSEL 6.10 061/121] remoteproc: qcom_q6v5_pas: Add hwspinlock bust on stop
Date: Wed, 31 Jul 2024 19:59:59 -0400
Message-ID: <20240801000834.3930818-61-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801000834.3930818-1-sashal@kernel.org>
References: <20240801000834.3930818-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.2
Content-Transfer-Encoding: 8bit

From: Richard Maina <quic_rmaina@quicinc.com>

[ Upstream commit 568b13b65078e2b557ccf47674a354cecd1db641 ]

When remoteproc goes down unexpectedly this results in a state where any
acquired hwspinlocks will remain locked possibly resulting in deadlock.
In order to ensure all locks are freed we include a call to
qcom_smem_bust_hwspin_lock_by_host() during remoteproc shutdown.

For qcom_q6v5_pas remoteprocs, each remoteproc has an assigned smem
host_id. Remoteproc can pass this id to smem to try and bust the lock on
remoteproc stop.

This edge case only occurs with q6v5_pas watchdog crashes. The error
fatal case has handling to clear the hwspinlock before the error fatal
interrupt is triggered.

Signed-off-by: Richard Maina <quic_rmaina@quicinc.com>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Chris Lew <quic_clew@quicinc.com>
Link: https://lore.kernel.org/r/20240529-hwspinlock-bust-v3-4-c8b924ffa5a2@quicinc.com
Signed-off-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 54d8005d40a34..8458bcfe9e19e 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -52,6 +52,7 @@ struct adsp_data {
 	const char *ssr_name;
 	const char *sysmon_name;
 	int ssctl_id;
+	unsigned int smem_host_id;
 
 	int region_assign_idx;
 	int region_assign_count;
@@ -81,6 +82,7 @@ struct qcom_adsp {
 	int lite_pas_id;
 	unsigned int minidump_id;
 	int crash_reason_smem;
+	unsigned int smem_host_id;
 	bool decrypt_shutdown;
 	const char *info_name;
 
@@ -399,6 +401,9 @@ static int adsp_stop(struct rproc *rproc)
 	if (handover)
 		qcom_pas_handover(&adsp->q6v5);
 
+	if (adsp->smem_host_id)
+		ret = qcom_smem_bust_hwspin_lock_by_host(adsp->smem_host_id);
+
 	return ret;
 }
 
@@ -727,6 +732,7 @@ static int adsp_probe(struct platform_device *pdev)
 	adsp->pas_id = desc->pas_id;
 	adsp->lite_pas_id = desc->lite_pas_id;
 	adsp->info_name = desc->sysmon_name;
+	adsp->smem_host_id = desc->smem_host_id;
 	adsp->decrypt_shutdown = desc->decrypt_shutdown;
 	adsp->region_assign_idx = desc->region_assign_idx;
 	adsp->region_assign_count = min_t(int, MAX_ASSIGN_COUNT, desc->region_assign_count);
@@ -1196,6 +1202,7 @@ static const struct adsp_data sm8550_adsp_resource = {
 	.ssr_name = "lpass",
 	.sysmon_name = "adsp",
 	.ssctl_id = 0x14,
+	.smem_host_id = 2,
 };
 
 static const struct adsp_data sm8550_cdsp_resource = {
@@ -1216,6 +1223,7 @@ static const struct adsp_data sm8550_cdsp_resource = {
 	.ssr_name = "cdsp",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
+	.smem_host_id = 5,
 };
 
 static const struct adsp_data sm8550_mpss_resource = {
@@ -1236,6 +1244,7 @@ static const struct adsp_data sm8550_mpss_resource = {
 	.ssr_name = "mpss",
 	.sysmon_name = "modem",
 	.ssctl_id = 0x12,
+	.smem_host_id = 1,
 	.region_assign_idx = 2,
 	.region_assign_count = 1,
 	.region_assign_vmid = QCOM_SCM_VMID_MSS_MSA,
@@ -1275,6 +1284,7 @@ static const struct adsp_data sm8650_cdsp_resource = {
 	.ssr_name = "cdsp",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
+	.smem_host_id = 5,
 	.region_assign_idx = 2,
 	.region_assign_count = 1,
 	.region_assign_shared = true,
@@ -1299,6 +1309,7 @@ static const struct adsp_data sm8650_mpss_resource = {
 	.ssr_name = "mpss",
 	.sysmon_name = "modem",
 	.ssctl_id = 0x12,
+	.smem_host_id = 1,
 	.region_assign_idx = 2,
 	.region_assign_count = 3,
 	.region_assign_vmid = QCOM_SCM_VMID_MSS_MSA,
-- 
2.43.0


