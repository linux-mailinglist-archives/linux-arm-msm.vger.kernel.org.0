Return-Path: <linux-arm-msm+bounces-50618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB26DA560F8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 07:36:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C52A176E9F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 06:36:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56F6C1AE877;
	Fri,  7 Mar 2025 06:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NVNWmUcj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2CB1AD41F;
	Fri,  7 Mar 2025 06:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741328720; cv=none; b=EC7BSVIuL9K8yUYD0XiIOVkFChbD5+Ru99hd2DJyA1LpzCkMCzGUJR3X/qj0z157M91C/m75Bd3slgPhgNHiBigr9wzRkDsIo3o7/17LtZA0egmARw6K9hrDdxfPkWW6awQUqLk7zyTuGQOCnwWTCVb+6WjF9CqpmPgCt2g/AWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741328720; c=relaxed/simple;
	bh=AF3zl1+3FmKibEn7/QOSbKUdjP/4OElMD03QmbV+0OA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LhIXTadDDm1sfHng/FgoRioD+GmpqwdmtMrTmU/RGWRg2qJM9JbbcsbijI2Eqp6wnzxGCBTaS4a7h0NIeUWKip+CeKSX1QfNzfsK56RS9bX73q2gSJNkIY7E2j0Z8J8jHUbOroMDfaw3QXfFL39shicnin4PfymPiheCoTsBsk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NVNWmUcj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54A88C4CEEA;
	Fri,  7 Mar 2025 06:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741328718;
	bh=AF3zl1+3FmKibEn7/QOSbKUdjP/4OElMD03QmbV+0OA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NVNWmUcjMZmGp4yR1hKCdWcuzmbDRihO4EAht1fDtP9oknIizerW8vCOa2OyySi3r
	 QKq1UyUIG2ujIkRo065FRVnRi7lIT/fc+SJDbxmHzVtJEClmsA0UnsUGygI5m05RKI
	 HJ1M2xUgtP2TSZXse4PFiFfTbJVS//wuqd8vIizVhv7LnCzNs6nAkIGf7NEQOl69Al
	 qKeuLOR4UZ5/iJfDmkg50X5lJ/0qBCQ7GIqKEeAaHtswQit3tqVxCkQIOkBx/XjVxh
	 673YR0rAcF13t5QzFelv1UWVg6429xbZe8t0gaz6tv7HuaTalKbGYwhVQuhGxXq9nZ
	 PqhsBrc1NnX0A==
From: Dmitry Baryshkov <lumag@kernel.org>
Date: Fri, 07 Mar 2025 08:24:56 +0200
Subject: [PATCH v3 8/8] drm/msm/dpu: drop now-unused condition for
 has_legacy_ctls
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250307-dpu-active-ctl-v3-8-5d20655f10ca@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1293;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ZJQfVL2u4VLDEzUOjMo39hljcpjLahCFYCRsgXyDRmA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnypE1yrtWX3xCYRYx1ZvpKfNuxSjI3TqtdorJY
 Xwo5LuIbXaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8qRNQAKCRCLPIo+Aiko
 1Y5oCACxrnDt4RHInE5qYZQOS7Yfg2KFXB99dPyXHoPvVCAeCuxMNrnXLdRIuMXk3V9ffq3qRQh
 9C2GhKbH6x6iUpA8CqKyOhGrgyK5pjiUAQB2lVQF85Y2Tf/XV1KsVceGZw3xqqP/6VMDXXs11R+
 q/zJ5WMdZvZIpdrvtbetOQITH1Z6I0IE00DgR6jyiCRqE7iBLENLsAHU0jfJeoK3caKmjK0LFZM
 PhXZCdHzLwZzvXOwURoOz4zIEu22NpKUCv3z7WQPrTg4QfLhq0cZ9dX4YroRR0XeMaFtVV27cCn
 EZ8iyNI2V8jzddau3hXEe+dgmeOhjbS2DNhmATa1bIZV70yq
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Now as we have dropped the DPU_CTL_SPLIT_DISPLAY from DPU >= 5.0
configuration, drop the rm->has_legacy_ctl condition which short-cutted
the check for those platforms.

Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Note, it is imposible to reoder commits in any other sensible way. The
DPU_CTL_SPLIT_DISPLAY can not be dropped before the patch that enables
single-CTL support.
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index c72b968d58a65960605456e752278def2a21df7b..2e296f79cba1437470eeb30900a650f6f4e334b6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -466,8 +466,7 @@ static int _dpu_rm_reserve_ctls(
 
 		DPU_DEBUG("ctl %d caps 0x%lX\n", j + CTL_0, features);
 
-		if (rm->has_legacy_ctls &&
-		    needs_split_display != has_split_display)
+		if (needs_split_display != has_split_display)
 			continue;
 
 		ctl_idx[i] = j;

-- 
2.39.5


