Return-Path: <linux-arm-msm+bounces-65046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CE117B05C8D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 15:33:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EAF331C24EB9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 13:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 854652E7BA5;
	Tue, 15 Jul 2025 13:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=usama.anjum@collabora.com header.b="K2BGU8cB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBD42E2F12;
	Tue, 15 Jul 2025 13:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752586038; cv=pass; b=Dx8ubmTLNHSSLNPfzctarrQBI53ZSnStkHoOBDBx8VcPm463pkvaAhykwlHeThmZDciieiCnMClYCD+/u1DK333OrP5iefW0a+Co2vMZoaeXDJl6OCBcsY02RRjb4itWGp38TuVbNqi66MWFR2TKYZIwL2NaGhfLurF9Px6jsEY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752586038; c=relaxed/simple;
	bh=nZ8L4CNPFWLdv3DnqHL3TaBlkT7ADo8ZfSs7NvwAMPY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OceNyGOl05LNVbQQvbVj5eFVnC2CiiJ+Za03jeXRKeGVzHfcablzcb4vjZYfWDhTVKF8wkQpQttQob+dkwl2D/lRwtd7JtCZVfW0U70GGVa0sbNTpikNuiZKq1MadyaWD3mpxR3mNrhvXyoWQ60GkIP3y9Ip3RvVRnMSD4BbFwk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=usama.anjum@collabora.com header.b=K2BGU8cB; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1752585934; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iS8ydypJ5Ytea+qvuAIEasiV3zxEFaxKCuidthawyGncohprwE+IyNB7RvXvm2+00iqj2xIeQQT/mBiqdbi/UtwNxpNmKUxa/NcWp19/Qj7gM0d9BxTkO7y8NZixVv+Vre8lQ/bTPlF4i3W5wpNdvgLMqzKKELWtVYVnw52rIdw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1752585934; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=khWqCIhyOZuc5K6Or8KOBVZRXHfT5Uql8gBWeLi0Yps=; 
	b=j3SrtF1361SUCcdQZ9ZraZxDLOnB2hbduI/8yP+1ryWIIUvUhTvbt6JEHIo4y6HGghGBUlXK4arXBDMR+ZW5n/y6zyDk9xUobsGaOlJ19moCu0CuCA3qfekMqeypx106ksmn/Ru+HR4+45pZYuG0FEtEUSFO3w10OWSX3cVO2KU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=usama.anjum@collabora.com;
	dmarc=pass header.from=<usama.anjum@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752585934;
	s=zohomail; d=collabora.com; i=usama.anjum@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=khWqCIhyOZuc5K6Or8KOBVZRXHfT5Uql8gBWeLi0Yps=;
	b=K2BGU8cBPn31wLpVvwj1Z4IFsUiSDA83EWM15n+b1C8kesw+QALaSdmpEDcWOQUU
	aPuF0fkD4fspDBCB/zXzND588GJsf6hNeLsV0WOIB9LwRa33S+e1jpQo8+pPTGjdKNz
	/ctWi6ynB9OQGpv9PYTSWDSPRZg+EYTB41F/vdic=
Received: by mx.zohomail.com with SMTPS id 1752585931663919.1784462606722;
	Tue, 15 Jul 2025 06:25:31 -0700 (PDT)
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Muhammad Usama Anjum <usama.anjum@collabora.com>,
	Youssef Samir <quic_yabdulra@quicinc.com>,
	Matthew Leung <quic_mattleun@quicinc.com>,
	Alexander Wilhelm <alexander.wilhelm@westermo.com>,
	Kunwu Chan <chentao@kylinos.cn>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
	Yan Zhen <yanzhen@vivo.com>,
	Sujeev Dias <sdias@codeaurora.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Siddartha Mohanadoss <smohanad@codeaurora.org>,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: kernel@collabora.com,
	stable@vger.kernel.org
Subject: [PATCH v2 3/3] bus: mhi: keep device context through suspend cycles
Date: Tue, 15 Jul 2025 18:25:09 +0500
Message-Id: <20250715132509.2643305-4-usama.anjum@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250715132509.2643305-1-usama.anjum@collabora.com>
References: <20250715132509.2643305-1-usama.anjum@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Don't deinitialize the device context while going into suspend or
hibernation cycles. Otherwise the resume may fail if at resume time, the
memory pressure is high and no dma memory is available. At resume, only
reset the read/write ring pointers as rings may have stale data.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6

Fixes: 3000f85b8f47 ("bus: mhi: core: Add support for basic PM operations")
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
---
Changes since v1:
- Cc stable and fix tested on tag
- Add logic to reset rings at resume
---
 drivers/bus/mhi/host/init.c | 31 ++++++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index 46ed0ae2ac285..6513012311ce3 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -474,6 +474,24 @@ static int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
 	return ret;
 }
 
+static void mhi_reset_dev_rings(struct mhi_controller *mhi_cntrl)
+{
+	struct mhi_event *mhi_event = mhi_cntrl->mhi_event;
+	struct mhi_cmd *mhi_cmd = mhi_cntrl->mhi_cmd;
+	struct mhi_ring *ring;
+	int i;
+
+	for (i = 0; i < mhi_cntrl->total_ev_rings; i++, mhi_event++) {
+		ring = &mhi_event->ring;
+		ring->rp = ring->wp = ring->base;
+	}
+
+	for (i = 0; i < NR_OF_CMD_RINGS; i++, mhi_cmd++) {
+		ring = &mhi_cmd->ring;
+		ring->rp = ring->wp = ring->base;
+	}
+}
+
 int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
 {
 	u32 val;
@@ -1133,9 +1151,13 @@ int mhi_prepare_for_power_up(struct mhi_controller *mhi_cntrl)
 
 	mutex_lock(&mhi_cntrl->pm_mutex);
 
-	ret = mhi_init_dev_ctxt(mhi_cntrl);
-	if (ret)
-		goto error_dev_ctxt;
+	if (!mhi_cntrl->mhi_ctxt) {
+		ret = mhi_init_dev_ctxt(mhi_cntrl);
+		if (ret)
+			goto error_dev_ctxt;
+	} else {
+		mhi_reset_dev_rings(mhi_cntrl);
+	}
 
 	ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs, BHIOFF, &bhi_off);
 	if (ret) {
@@ -1212,8 +1234,6 @@ void mhi_deinit_dev_ctxt(struct mhi_controller *mhi_cntrl)
 {
 	mhi_cntrl->bhi = NULL;
 	mhi_cntrl->bhie = NULL;
-
-	__mhi_deinit_dev_ctxt(mhi_cntrl);
 }
 
 void mhi_unprepare_after_power_down(struct mhi_controller *mhi_cntrl)
@@ -1239,6 +1259,7 @@ void mhi_unprepare_after_power_down(struct mhi_controller *mhi_cntrl)
 	}
 
 	mhi_deinit_dev_ctxt(mhi_cntrl);
+	__mhi_deinit_dev_ctxt(mhi_cntrl);
 }
 EXPORT_SYMBOL_GPL(mhi_unprepare_after_power_down);
 
-- 
2.39.5


