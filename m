Return-Path: <linux-arm-msm+bounces-25344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC499284E8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 11:15:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CAECCB263E1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 09:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8451F145FE1;
	Fri,  5 Jul 2024 09:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=t-argos.ru header.i=@t-argos.ru header.b="mmFiA1f2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx1.t-argos.ru (mx1.t-argos.ru [109.73.34.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151303A8CB;
	Fri,  5 Jul 2024 09:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.73.34.58
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720170935; cv=none; b=BXQSHrr6pwlW4PVM4sdrwpHFO3UoPm7fLuyGn5oiPsdo2MH+ZI2bGi9onAMbTwiK8hryZWrUWAbSRh6iRhXNur9sEKDB8rSSV6+cWwM9WerN2KMN4km2neAeKCpmrO9wso4ztdlT7twpuXRN4bxwLnxPmKzZ6SMyTc39oLesm3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720170935; c=relaxed/simple;
	bh=Q0fuktA7uPpf6pRlZEx/cV0mBDRCwxPrHJqgqdZLN4w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aFlQL2DZZ4+pCEUKnzLafr7AUrc1Iy7y59IdGryIkpIscQtzHyPMkG9CxOYYcsJlBD2RTEIhb1g1wZCWm1kct9/2Evq6BS8yQ+EC1Sm5gQR23YTKAAQpEsOmaSdekgEmd6024mk/aEy/ywTNnyijQ5PEasfGgBfjBxNMbcHBWys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=t-argos.ru; spf=pass smtp.mailfrom=t-argos.ru; dkim=pass (2048-bit key) header.d=t-argos.ru header.i=@t-argos.ru header.b=mmFiA1f2; arc=none smtp.client-ip=109.73.34.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=t-argos.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=t-argos.ru
Received: from mx1.t-argos.ru (localhost [127.0.0.1])
	by mx1.t-argos.ru (Postfix) with ESMTP id 407E5100004;
	Fri,  5 Jul 2024 12:15:11 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-argos.ru; s=mail;
	t=1720170911; bh=YZZrGAtSVIBEGeCYxNknWhYt/yWknwoVJZ3yWZhV1C4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=mmFiA1f25ZpGEnBoUnQu/u05k7rdG2P5YO0z1PzncBwniVfZqkjAEbXuM4lFae4y8
	 D7EnQaGLexxhiW5shHEyAGDARt794SJsRa2Glu6BtRuz/uNAXPZWShTkbBw5dsaEmW
	 oO0r4nUE7P15s1xf0o3HkJ9yiz63I+lVzkhgdWkyCHhc3sIc12134mBzEd8YlvfedI
	 c98ZVghW+jL9sHYzQCvMeOk9W5vDJsbUQWCKtyVP3Zz/4/DtU+rl89DIdHZGk0kjlI
	 /07QdvHAWEkcZhqcnsngZsilkoOvHrCE3S5/DwtTR0/kteSSrzweZxvqXuHoJhY1h0
	 U3R+YUcwbb24A==
Received: from mx1.t-argos.ru.ru (ta-mail-02.ta.t-argos.ru [172.17.13.212])
	by mx1.t-argos.ru (Postfix) with ESMTP;
	Fri,  5 Jul 2024 12:13:49 +0300 (MSK)
Received: from localhost.localdomain (172.17.215.5) by ta-mail-02
 (172.17.13.212) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 5 Jul 2024
 12:13:28 +0300
From: Aleksandr Mishin <amishin@t-argos.ru>
To: Rob Clark <robdclark@gmail.com>
CC: Aleksandr Mishin <amishin@t-argos.ru>, Jordan Crouse
	<jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>, Konrad Dybcio
	<konrad.dybcio@linaro.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>, Marijn Suijten
	<marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, <linux-arm-msm@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
	<linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>
Subject: [PATCH v2] drm/msm: Fix incorrect file name output in adreno_request_fw()
Date: Fri, 5 Jul 2024 12:13:12 +0300
Message-ID: <20240705091312.9705-1-amishin@t-argos.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240704093002.15155-1-amishin@t-argos.ru>
References: 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ta-mail-02.ta.t-argos.ru (172.17.13.212) To ta-mail-02
 (172.17.13.212)
X-KSMG-Rule-ID: 1
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 186342 [Jul 05 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: amishin@t-argos.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 21 0.3.21 ebee5449fc125b2da45f1a6a6bc2c5c0c3ad0e05, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;mx1.t-argos.ru.ru:7.1.1;t-argos.ru:7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/07/05 07:52:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2024/07/05 03:12:00 #25860202
X-KSMG-AntiVirus-Status: Clean, skipped

In adreno_request_fw() when debugging information is printed to the log
after firmware load, an incorrect filename is printed. 'newname' is used
instead of 'fwname', so prefix "qcom/" is being added to filename.
Looks like "copy-paste" mistake.

Fix this mistake by replacing 'newname' with 'fwname'.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 2c41ef1b6f7d ("drm/msm/adreno: deal with linux-firmware fw paths")
Signed-off-by: Aleksandr Mishin <amishin@t-argos.ru>
---
v1->v2: Fix incorrect 'Fixes' tag

 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 074fb498706f..0bb7d66047f8 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -475,7 +475,7 @@ adreno_request_fw(struct adreno_gpu *adreno_gpu, const char *fwname)
 		ret = request_firmware_direct(&fw, fwname, drm->dev);
 		if (!ret) {
 			DRM_DEV_INFO(drm->dev, "loaded %s from legacy location\n",
-				newname);
+				fwname);
 			adreno_gpu->fwloc = FW_LOCATION_LEGACY;
 			goto out;
 		} else if (adreno_gpu->fwloc != FW_LOCATION_UNKNOWN) {
-- 
2.30.2


