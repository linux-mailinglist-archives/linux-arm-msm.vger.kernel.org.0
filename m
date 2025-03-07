Return-Path: <linux-arm-msm+bounces-50615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C47A560D4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 07:26:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 274413B5091
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 06:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C34A11A5B91;
	Fri,  7 Mar 2025 06:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZK0POu8z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0441A5B8C;
	Fri,  7 Mar 2025 06:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741328710; cv=none; b=RfEeRTbzXiVVwlAzAsP9HrU72n99nke25U4EY0weKHlLv5m6LSkvG8KVydJ4aGHbTqUEzme2a7ORgoSBiVrkOdI6NzXde81ZxTS7r3JB8MAnuCQBAYNbHhywvXJcCOa6FAFENNyQXqIkgboKxRaabDz2A4598zP7ZpP5wL66sU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741328710; c=relaxed/simple;
	bh=Usvh7SJRnxUdW+2t40bV5tdcy+l+8OFmkR1Ib2MugvI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dfdu1P1sfQ4X7mMxpqxgvey5pgYp9IzdLWgDWGXqYnnhVYUW60itB9fk1IF59DEHhPUcy2lEnRrk3t1zs2bVRe6xD0Kmeixdsxf/58eMOeDgXFz3HhiebX9hbLWOdox0ViShpk7wNY20A+mHRuCZXLAwOudnQ0zmW8UkCc5VNT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZK0POu8z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC1C3C4CED1;
	Fri,  7 Mar 2025 06:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741328710;
	bh=Usvh7SJRnxUdW+2t40bV5tdcy+l+8OFmkR1Ib2MugvI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZK0POu8zVZ4mj+Pp7hhmd6oZpvCFjnWxMPGWlq1BCBy6/5RkLPw7gI5HrCFp0oq3m
	 MaS951Gc0l+sn9S/DB722v07x0AdznhK8ivVNEvgrSnp2Xp5KgRfwykgzVnBpT/385
	 NM5l9D0OPoRjfH/93I7LIt00+itBLd54fYdOhZXJDK25auts8ykW0TchG43/saOmQt
	 lGpVhizzsk/3/ImRcabZOBaMrHmLSW2CntDvd/XXuM45Vs1PIzf2M/DM13USmJJm+Q
	 7mI2OHfAzvQHUGtxi8bunJclzF+tsnN9eFjKV/GsSIi6x1FJbBhMvT1nP7kKz+/q/U
	 R0TwVJB/zwdJg==
From: Dmitry Baryshkov <lumag@kernel.org>
Date: Fri, 07 Mar 2025 08:24:53 +0200
Subject: [PATCH v3 5/8] drm/msm/dpu: don't select single flush for active
 CTL blocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250307-dpu-active-ctl-v3-5-5d20655f10ca@linaro.org>
References: <20250307-dpu-active-ctl-v3-0-5d20655f10ca@linaro.org>
In-Reply-To: <20250307-dpu-active-ctl-v3-0-5d20655f10ca@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1143;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=pNBf2aRcMSth9knECWkJ61FgZNwsJWNHoE8JVnYufRk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnypE0M3eSbXw1ue3WHHumd5JdB7FbcNE/3t/Wm
 yGLdfZPnWGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8qRNAAKCRCLPIo+Aiko
 1XVSB/9EYGsktLgpmAkSdWgo74vRixdtILMoZFOOGOqBalKLk8szxGI02C7NG0ErMo3Vom+zD1u
 X/bCwboFCt96wO/8TVJRoM0v/6hsNrexpf//yFTG9ObmdxuYKEdvQHmAhBTayaJPBT4keDvwZ9b
 JQ8z9pp4biFzbjX9sNCjCrQoTdy4TLiPmeHfhq81nibHV3FKz0OfXq0USzJW13m/xIbCiXTG0zb
 pUyj4kV4JQY0nqQnu2xAE71pmJXra+OSZlMNLuWkEs+C5ckIhpYJ5nzdPwAJ+Cf9iyLMsyGJpFQ
 IEGMkmhuC8wA6Wk24Lm6tDg1BpSrZO4Tp0W158kvYynlxgaE
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

In case of ACTIVE CTLs, a single CTL is being used for flushing all INTF
blocks. Don't skip programming the CTL on those targets.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 232055473ba55998b79dd2e8c752c129bbffbff4..8a618841e3ea89acfe4a42d48319a6c54a1b3495 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -374,7 +374,8 @@ static void dpu_encoder_phys_vid_underrun_irq(void *arg)
 static bool dpu_encoder_phys_vid_needs_single_flush(
 		struct dpu_encoder_phys *phys_enc)
 {
-	return phys_enc->split_role != ENC_ROLE_SOLO;
+	return !(phys_enc->hw_ctl->caps->features & BIT(DPU_CTL_ACTIVE_CFG)) &&
+		phys_enc->split_role != ENC_ROLE_SOLO;
 }
 
 static void dpu_encoder_phys_vid_atomic_mode_set(

-- 
2.39.5


