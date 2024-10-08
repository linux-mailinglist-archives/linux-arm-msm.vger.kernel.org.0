Return-Path: <linux-arm-msm+bounces-33525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10129994662
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 13:17:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E7CC1C2242B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 11:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA3651D2200;
	Tue,  8 Oct 2024 11:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lQvoyioL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B525F192B8F
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Oct 2024 11:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728386224; cv=none; b=elCb1EvublAqeU9ZiA7bASPcuzZA/bs/RdqdpTOsQSBOZ0mn2qo/57KqvS9ldOHwx3iQU0Pj8Qd/5GLTFUkAKy1yfLfBTKR6Rbgf54hOb4+C7bLwfte7KRMZTSNWtC36Nti+blgqGV8XbzkV2HRJ47+LxWE8DI6JXSMpSnc+m1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728386224; c=relaxed/simple;
	bh=LpovLX2LVjsoiwp5sT3n5yohLyUQD6TprBumtupfz90=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L0/9NPh8BhDudULlwwSXKgeHpveA+309eFbXNLZYQy8TuF6aIWffNpTRv97Ai4jF2ueAB3xpmXi3wskZc5yJ2Y1gPtFdCnW6GR/mxkpiSBVYz1NwFM8HyCS22RCrMDubBhZlxS2UXNeIR6i2XgEUH0gVHBS2PqZq9N9JyIipTqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lQvoyioL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 527D3C4CECD;
	Tue,  8 Oct 2024 11:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728386224;
	bh=LpovLX2LVjsoiwp5sT3n5yohLyUQD6TprBumtupfz90=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lQvoyioLbylaSshb3zEEzMXuWbOSYZhYf2iIqj9jgitbO/AL57L4hhkQAwH08rNjT
	 N6q6sODsn4f0LOVlA5EHq3agBBBt+FTerHsqgnW+X6DrQsNdv0UepsT/39D06gYl4M
	 Nq425/ICCuyKupeI/zScevCozhc91b/m0W2drD+z2l5Hrt7NluLNCZJ6GBEdDE8ODR
	 oCXIXxsRotzzzs4VDm6oU5rM+ueKyBE2q2p8YsjjDq7z9/G2h/YQsi/OtOdU4Ooby3
	 Xs1iYXgUg0R0xcNUiQaLt8M6SPkYrBJF3hwAy4TRtPq0VoTXMrQND6doRZ262/ieFt
	 Mmx7Pxp++q4lQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48355CEF153;
	Tue,  8 Oct 2024 11:17:04 +0000 (UTC)
From: Renjiang Han via B4 Relay <devnull+quic_renjiang.quicinc.com@kernel.org>
Date: Tue, 08 Oct 2024 16:46:35 +0530
Subject: [PATCH 2/2] media: venus: core: add qcs615 DT compatible and
 resource data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241008-add_qcs615_video-v1-2-436ce07bfc63@quicinc.com>
References: <20241008-add_qcs615_video-v1-0-436ce07bfc63@quicinc.com>
In-Reply-To: <20241008-add_qcs615_video-v1-0-436ce07bfc63@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: kernel@quicinc.com, Renjiang Han <quic_renjiang@quicinc.com>, 
 linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728386222; l=2818;
 i=quic_renjiang@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=Q1QnwhQAJxUdLqNUWY5OfIjtDJPFF3bmncn+F/o0I3w=;
 b=UGUYGtdz5GtJdTQknjM76kY2aiYDm2kzYiE4VWQ2FIpDaYLv2vooBZa8aWysbgyhawB8HEa/8
 n/1VWGGsy8EB+1ZgwxHlB3DSwUAVydTDvY7NcxrRLsr/vCvwwLJCru0
X-Developer-Key: i=quic_renjiang@quicinc.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-Endpoint-Received: by B4 Relay for quic_renjiang@quicinc.com/20241001
 with auth_id=235
X-Original-From: Renjiang Han <quic_renjiang@quicinc.com>
Reply-To: quic_renjiang@quicinc.com

From: Renjiang Han <quic_renjiang@quicinc.com>

add qcs615 DT compatible and resource data

Change-Id: I1a06f105f030cbf16f48a32f8c50c814f0dbde7a
Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
---
 drivers/media/platform/qcom/venus/core.c | 50 ++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 84e95a46dfc9832981ac1c0c58e226a506896ade..15cd78279cb7487f5f1da4e5d617da7b4a481451 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -816,6 +816,55 @@ static const struct venus_resources sc7180_res = {
 	.fwname = "qcom/venus-5.4/venus.mbn",
 };
 
+static const struct freq_tbl qcs615_freq_table[] = {
+	{ 0, 460000000 },
+	{ 0, 410000000 },
+	{ 0, 380000000 },
+	{ 0, 300000000 },
+	{ 0, 240000000 },
+	{ 0, 133333333 },
+};
+
+static const struct bw_tbl qcs615_bw_table_enc[] = {
+	{  972000,  951000, 0, 1434000, 0 },	/* 3840x2160@30 */
+	{  489600,  723000, 0,  973000, 0 },	/* 1920x1080@60 */
+	{  244800,  370000, 0,	495000, 0 },	/* 1920x1080@30 */
+};
+
+static const struct bw_tbl qcs615_bw_table_dec[] = {
+	{ 1036800, 1987000, 0, 2797000, 0 },	/* 4096x2160@30 */
+	{  489600, 1040000, 0, 1298000, 0 },	/* 1920x1080@60 */
+	{  244800,  530000, 0,  659000, 0 },	/* 1920x1080@30 */
+};
+
+static const struct venus_resources qcs615_res = {
+	.freq_tbl = qcs615_freq_table,
+	.freq_tbl_size = ARRAY_SIZE(qcs615_freq_table),
+	.bw_tbl_enc = qcs615_bw_table_enc,
+	.bw_tbl_enc_size = ARRAY_SIZE(qcs615_bw_table_enc),
+	.bw_tbl_dec = qcs615_bw_table_dec,
+	.bw_tbl_dec_size = ARRAY_SIZE(qcs615_bw_table_dec),
+	.clks = {"core", "iface", "bus"},
+	.clks_num = 3,
+	.vcodec0_clks = {"vcodec0_core", "vcodec0_bus"},
+	.vcodec_clks_num = 2,
+	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0" },
+	.vcodec_pmdomains_num = 2,
+	.opp_pmdomain = (const char *[]) { "cx", NULL },
+	.vcodec_num = 1,
+	.hfi_version = HFI_VERSION_4XX,
+	.vpu_version = VPU_VERSION_AR50,
+	.vmem_id = VIDC_RESOURCE_NONE,
+	.vmem_size = 0,
+	.vmem_addr = 0,
+	.dma_mask = 0xe0000000 - 1,
+	.cp_start = 0,
+	.cp_size = 0x70800000,
+	.cp_nonpixel_start = 0x1000000,
+	.cp_nonpixel_size = 0x24800000,
+	.fwname = "qcom/venus-5.4/venus.mbn",
+};
+
 static const struct freq_tbl sm8250_freq_table[] = {
 	{ 0, 444000000 },
 	{ 0, 366000000 },
@@ -943,6 +992,7 @@ static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
 	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res, },
 	{ .compatible = "qcom,sm8250-venus", .data = &sm8250_res, },
+	{ .compatible = "qcom,qcs615-venus", .data = &qcs615_res, },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, venus_dt_match);

-- 
2.34.1



