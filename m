Return-Path: <linux-arm-msm+bounces-84660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 72698CAD1D0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 13:26:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6E87030125FC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 12:26:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BB4030F954;
	Mon,  8 Dec 2025 12:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CTylyn7m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35792F3638;
	Mon,  8 Dec 2025 12:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765196775; cv=none; b=py/016R24MbMHq26k2eBrfxp9hRUace253KDTDErEvXofyTcLjW3w6TIfO+6HLwifH2a7wfKzOFdNDZPkXwW6g3khjeXqapry88NevlszwHmc1CirpLevcfr55cjPBGbAQQpSGy5B+NwUGmBe4dUjjstD6V0aI0rnCwMTFhOu/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765196775; c=relaxed/simple;
	bh=L6A8fsEjgTMW0Gvj6lPXPAA86iG+QzHG1Xr48HotD9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oKu+x4PwqVKCwEi6ZGFLWJ1gL3s2WO1SlzrpvlsI9fvHbECkovMHBnUCs4LVzwsjX195ve0DQEOM5g0SMDemp31TiASMlCklOpZfsE6WitZeGUaKT7U1qdgRqsOt/1xpLdgYz2bJ0h8abwq0gJ016RmtBO80XSyizzt0vDD3a7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CTylyn7m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 664E1C19421;
	Mon,  8 Dec 2025 12:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765196775;
	bh=L6A8fsEjgTMW0Gvj6lPXPAA86iG+QzHG1Xr48HotD9o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CTylyn7mpoNIIZVRe8K2xZnm/BN2ldwtUT5R3SE5NUYjJNO1nTWz6w+avrjsExIpZ
	 ADNwAcQyAlZo7+r5rUs7Y/A/iuqc3OGgdBJmJJfHwiUWZHO+ubcS05fmDL8F43tB8N
	 tPOF7wBDGwQgwj/RJ5hTnNDGINs9ze9B51yzdff+JjzVyy+eg3vagWvZe/reK/tUa5
	 326FTF8Hn4Eb7YgoVu6G3PCWwtKpfHl0g2frZeYfS2+IpBOs+AW6eT5f0Wsmyczil2
	 lmN0+z5AcE+CKwnUCipOj9pmegIAvPbUkAJM46P4xdAOUlrhk+RLU+MwIWI11OKn+a
	 sSztytRt4j50w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ED53D3B7E8;
	Mon,  8 Dec 2025 12:26:15 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Mon, 08 Dec 2025 16:25:33 +0400
Subject: [PATCH v6 1/8] firmware: qcom_scm: ipq5332: add support to pass
 metadata size
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251208-ipq5018-wifi-v6-1-d0ce2facaa5f@outlook.com>
References: <20251208-ipq5018-wifi-v6-0-d0ce2facaa5f@outlook.com>
In-Reply-To: <20251208-ipq5018-wifi-v6-0-d0ce2facaa5f@outlook.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765196772; l=2530;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=IFR7BoBGBYx2GnrSJAySlI7gBy/DN0NPxf8vZLTi+hw=;
 b=es5QYKin1PJq9cK4rnZktU2mRW6FGKG+tnFa38GmhEbJtqt1L/z8CDrHfE3vlB3WmrfLogDNv
 Jwe45o4IAveDAxTKDg/piLOAziKLR+NjCb/O6YJxU2LiSLzdOWmxy9H
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>

IPQ5332 security software running under trustzone requires metadata size.
With new command support added in TrustZone that includes a size parameter,
pass metadata size as well.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 17 +++++++++++++----
 drivers/firmware/qcom/qcom_scm.h |  1 +
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 1a6f85e463e06a12814614cea20719c90a371b69..c970157f75b51027fb73664a58c38550344ab963 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -583,9 +583,6 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
 	int ret;
 	struct qcom_scm_desc desc = {
 		.svc = QCOM_SCM_SVC_PIL,
-		.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE,
-		.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW),
-		.args[0] = peripheral,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
 	struct qcom_scm_res res;
@@ -617,7 +614,19 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
 	if (ret)
 		goto disable_clk;
 
-	desc.args[1] = mdata_phys;
+	if (__qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_PIL,
+					 QCOM_SCM_PIL_PAS_INIT_IMAGE_V2)) {
+		desc.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE_V2;
+		desc.arginfo = QCOM_SCM_ARGS(3, QCOM_SCM_VAL, QCOM_SCM_RW, QCOM_SCM_VAL);
+		desc.args[0] = peripheral;
+		desc.args[1] = mdata_phys;
+		desc.args[2] = size;
+	} else {
+		desc.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE;
+		desc.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW);
+		desc.args[0] = peripheral;
+		desc.args[1] = mdata_phys;
+	}
 
 	ret = qcom_scm_call(__scm->dev, &desc, &res);
 	qcom_scm_bw_disable();
diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
index a56c8212cc0c41021e5a067d52b7d5dcc49107ea..b8e5b4f2498e75c9eca1a0c0032254b7126b9ed3 100644
--- a/drivers/firmware/qcom/qcom_scm.h
+++ b/drivers/firmware/qcom/qcom_scm.h
@@ -100,6 +100,7 @@ int qcom_scm_shm_bridge_enable(struct device *scm_dev);
 
 #define QCOM_SCM_SVC_PIL		0x02
 #define QCOM_SCM_PIL_PAS_INIT_IMAGE	0x01
+#define QCOM_SCM_PIL_PAS_INIT_IMAGE_V2	0x1a
 #define QCOM_SCM_PIL_PAS_MEM_SETUP	0x02
 #define QCOM_SCM_PIL_PAS_AUTH_AND_RESET	0x05
 #define QCOM_SCM_PIL_PAS_SHUTDOWN	0x06

-- 
2.52.0



