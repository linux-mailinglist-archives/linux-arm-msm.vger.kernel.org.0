Return-Path: <linux-arm-msm+bounces-24037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA1291589A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 23:14:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D8E9FB233E2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 21:14:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 052851A0AF5;
	Mon, 24 Jun 2024 21:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iYCSCD4F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C92919F48D
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 21:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719263636; cv=none; b=GDS9MOwPlqdj+/Q5v+2l+YXxdcoKYTHT1XWv2iliRfLHhlWucMVLTjK1j7zjOX9874BlljKtaeqzUDlV4k5wU8Ib4AHEPGYQQZUaqWepuEo08c9o0cESg945JnnY8FqlNPuHoH6gqak3bqPq6ITHiWbHCB/X4L1qhpYqTFAVxJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719263636; c=relaxed/simple;
	bh=PvarS7GjKhySpbWrpwCTIA/zEFMlNGs5eUuK3EGV4IQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dqqhruTab3S3SnOnT+/Aaze7eJ4uZi1E/I8YKonDkdL8LxWHKiFvfo6mOPZ+A4OPIw/DdKr6er/up2Hw7v//KDrGooTOu5AhwnnHCUDYNkeQGlJ8W8MFkSuLCp0NDu0/7pqctBeorrs0zkXSfMTl+XZG3revtPlM3txBHQc9XG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iYCSCD4F; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52cdd03d6aaso2646504e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 14:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719263633; x=1719868433; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SPozXOfnQpkwCjUxXDexUWZWPSk8EJlZgnDGsjKSuG0=;
        b=iYCSCD4FqqmHYCLhSmB0vWn0fOsh71MopsPMrtDuzmn0IJyD2Ekbj4nlJZ4OQeM2oV
         TqWNU9i3bdNbAaYvId2w1vCkD+Un2RV5ILbxXsYwaSqzAi1oWOCnPVhU6IQ7wT2Y8Aew
         eXR4YoSCP23hPIQ5LGADeiC57yMUTO+FvAI3Ty8mCK98+bVPFwge9wtDrmu/3na4BSgA
         Z9j+ddYztR6rEvKogq2wB2WSTbfAmHmmrVFIhfz4b2VQhCH07KQWlKOgNr/oR+Je1+4C
         DOFeWk5GIju1B4WkdLk1rYTwSR6ygG5mqcGgn+ToPJyrzxXGr9yNMhAfhyjpN7jfny15
         dKdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719263633; x=1719868433;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SPozXOfnQpkwCjUxXDexUWZWPSk8EJlZgnDGsjKSuG0=;
        b=ea5HowwduVCWRuq+A8Mo4+/tp810CPYk6IW//0Gdv4PHYH4Z1hUHqH8HRa7jG+NGKm
         DIqeN9W2zHlEH/P8A1+pQMLY9PQ8mks3pJHJ69+Esg7X10HKJN05oVraSaYgoSgNw6Yj
         xtOlHCkur+2ORwJVXpcFOtBd7pThzX67MfMNpRXNN+drO2qGJaS4ueNsiIYTOnEJfur9
         nplwRfgMmqEUxaF27d14t+N2IpbhMZqdMjrN2Ca8O4RDYpQypfSp7eRwJWu/w1DOaly8
         CX/tFV1ibDwM4ux8LXM9pTy60L6krVlcdl+6wp7ASZXG1KbYD0iNiawx/M/VqIbenlsl
         G7SQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeKQwHiCMeiih0FJqtBkhq5IYXPRRJ0TMc/2bnCjDJXysSf/WpiQTUfzytbH3JCFrmJ2SKbWjfiZ9/gO8vt5MPJZJ7h4Nitj/E5MKbXA==
X-Gm-Message-State: AOJu0YxvEcVhBbdwpNJFZYLfuGfzMMfchDJdYot9HJ7lHdUMrC6GF/1M
	Ib1AgEFoy9dJqcQKBEE8K+Spdvff32DsXOS8I8aEQkfOynCJ9WT1HFo9CYLBroo=
X-Google-Smtp-Source: AGHT+IFRmNxqzJxnwWq1WdrSGLnwmetEW2V9V3wvpKQg+TAZ5eDZB0QAdA4CARbVGYJU8bJ+TolinA==
X-Received: by 2002:ac2:5617:0:b0:52c:b606:2b2 with SMTP id 2adb3069b0e04-52ce0673b84mr3559689e87.46.1719263633701;
        Mon, 24 Jun 2024 14:13:53 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd63b49f2sm1057512e87.56.2024.06.24.14.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 14:13:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 25 Jun 2024 00:13:50 +0300
Subject: [PATCH v5 10/16] drm/msm/dpu: move pitch check to
 _dpu_format_get_plane_sizes_linear()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240625-dpu-mode-config-width-v5-10-501d984d634f@linaro.org>
References: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
In-Reply-To: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1777;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=PvarS7GjKhySpbWrpwCTIA/zEFMlNGs5eUuK3EGV4IQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeeGIedeaS+Ov6hN6YtNe5NW489hPRC+aWEHSO
 C+oUPjo/jKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnnhiAAKCRCLPIo+Aiko
 1dSmCACS6PKtzUdgdFph3etGxKofF/FuEt7sz5GRaCXlw8vUtsJUZZDZDS+Z3jpkSyyoSbborrf
 8RH15mOuVFfJtI19Bmf0Nj5BqZrtG3TBZu1Bovmj3b8XCOHpZq5MYPiZ+6Z9gEOhEgKzHpbYiRp
 OR3Yqf/ugbnrIKYL19DGUdlE5jteCE/UCjMIxcrFTn+VfszmM/p4gJcQdFUyCMKv09n8ypvVpl4
 12UfiFu7K5PROiPHcW7GpxNK7pe9WTJK9RMVWjTQDfmG/ER5NVav8wg2lCt8yC370Lbt9bPAEtl
 wBE0Kg7n1hwP+5r8QIOTCsGoVhhHNj1oNisjsBu+AONxFGw1
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The _dpu_format_get_plane_sizes_linear() already compares pitches of
the framebuffer with the calculated pitches. Move the check to the same
place, demoting DPU_ERROR to DPU_DEBUG to prevent user from spamming the
kernel log.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index df046bc88715..4d17eb88af40 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -229,8 +229,13 @@ static int _dpu_format_get_plane_sizes_linear(
 	 * all the components based on ubwc specifications.
 	 */
 	for (i = 0; i < layout->num_planes && i < DPU_MAX_PLANES; ++i) {
-		if (layout->plane_pitch[i] < fb->pitches[i])
+		if (layout->plane_pitch[i] <= fb->pitches[i]) {
 			layout->plane_pitch[i] = fb->pitches[i];
+		} else {
+			DRM_DEBUG("plane %u expected pitch %u, fb %u\n",
+				  i, layout->plane_pitch[i], fb->pitches[i]);
+			return -EINVAL;
+		}
 	}
 
 	for (i = 0; i < DPU_MAX_PLANES; i++)
@@ -360,15 +365,6 @@ static int _dpu_format_populate_addrs_linear(
 {
 	unsigned int i;
 
-	/* Can now check the pitches given vs pitches expected */
-	for (i = 0; i < layout->num_planes; ++i) {
-		if (layout->plane_pitch[i] > fb->pitches[i]) {
-			DRM_ERROR("plane %u expected pitch %u, fb %u\n",
-				i, layout->plane_pitch[i], fb->pitches[i]);
-			return -EINVAL;
-		}
-	}
-
 	/* Populate addresses for simple formats here */
 	for (i = 0; i < layout->num_planes; ++i) {
 		layout->plane_addr[i] = msm_framebuffer_iova(fb, aspace, i);

-- 
2.39.2


