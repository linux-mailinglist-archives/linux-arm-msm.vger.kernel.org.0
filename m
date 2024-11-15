Return-Path: <linux-arm-msm+bounces-37983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0FE9CDBBF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 10:41:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF9331F23583
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 09:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96BE619006B;
	Fri, 15 Nov 2024 09:40:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from cmccmta2.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E8C018FDC8;
	Fri, 15 Nov 2024 09:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731663659; cv=none; b=EhsKxnFn2I7IkVzYlcA3sWQXO87EEAsYc/E1cczZ/nuoD4zgeWGe8AWr1CJ1GxcnspJK/2i21rgz36I0BW5edS5LqSg1J0ZfpNdsvS5Nqr80m9Ex1yGmEzXQuABSYsMKFSdh2Uv+QmPDQIqjkt5uI9yBubA1QCiZR0fDzUvOmB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731663659; c=relaxed/simple;
	bh=iw0HOpuBlJ01knrsisKr3EA9TMSUMaQCbOFhKYoqaJo=;
	h=From:To:Cc:Subject:Date:Message-Id; b=g9iq00EWUxHa2oxsd+WZPXd7YcLPlr3KphysHrSQhUyb8kaUFub4flcR8w4Jk2zC6H3WNqzu8b1At6tKXAjdzMyhf1NrndcwJSXK8DIOdRFVF/fI0s6vRLCW/3CQQB2k1T1wOqtjUD9IkVXQ9h16UG/DHR9UK3iFUIbhKoyijXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; arc=none smtp.client-ip=111.22.67.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66737171fb15-fb3e6;
	Fri, 15 Nov 2024 17:40:48 +0800 (CST)
X-RM-TRANSID:2ee66737171fb15-fb3e6
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from ubuntu.localdomain (unknown[10.55.1.70])
	by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id 2ee46737171f3dd-ddfd6;
	Fri, 15 Nov 2024 17:40:48 +0800 (CST)
X-RM-TRANSID:2ee46737171f3dd-ddfd6
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: robdclark@gmail.com
Cc: quic_abhinavk@quicinc.com,
	sean@poorly.run,
	konradybcio@kernel.org,
	dmitry.baryshkov@linaro.org,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	zhujun2@cmss.chinamobile.com
Subject: [PATCH] drm/msm: Fix spelling mistake "swtich" to "switch"
Date: Fri, 15 Nov 2024 01:40:45 -0800
Message-Id: <20241115094045.7491-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

There is a spelling mistake, Please fix it.

Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml b/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
index cab01af55d22..d28fac3fb6a8 100644
--- a/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
@@ -563,7 +563,7 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 	<value name="IN_IB_END" value="0x0a" variants="A6XX-"/>
 	<!-- handles IFPC save/restore -->
 	<value name="IN_GMU_INTERRUPT" value="0x0b" variants="A6XX-"/>
-	<!-- preemption/context-swtich routine -->
+	<!-- preemption/context-switch routine -->
 	<value name="IN_PREEMPT" value="0x0f" variants="A6XX-"/>
 
 	<!-- TODO do these exist on A5xx? -->
-- 
2.17.1




