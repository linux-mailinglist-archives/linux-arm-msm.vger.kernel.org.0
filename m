Return-Path: <linux-arm-msm+bounces-23986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8003A9150E1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 16:52:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0BC841F25157
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 14:52:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 636A41A01D7;
	Mon, 24 Jun 2024 14:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZNLpayoC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E2319D89C
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 14:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719240444; cv=none; b=EubmphXjw7zfns7DgN1OCSeMmulB2Jh2MqmMXAhbwIrV2TucwpsNTE5xUc+gdPlitgJ53o9I8mp6iZi0+8XsGLxQbC+s6fBQZKbX3bnHLCoHVRCRamqg4CoyRALqb/rAt9WAXd/5D0/NNTTUvxyTYqLJaHg4StQqvvV9hWofS9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719240444; c=relaxed/simple;
	bh=PvarS7GjKhySpbWrpwCTIA/zEFMlNGs5eUuK3EGV4IQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mdCrAsR6q7P/4j8Kv6V9+N40fgeGZ8AEpAM/LGBOf3NAW/Oxe/yLi7swVRiayJ0dTX2xicwsd4UB3liQaT4cqrZV8ylZgCoyLH0YKj2hulgeR4eLeOW6sV85fVDDE+pYPYdj85tTIw+d+yfeCSRCWkjnFcctouyrB6bXcmxWfFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZNLpayoC; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52cd8897c73so3125554e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 07:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719240441; x=1719845241; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SPozXOfnQpkwCjUxXDexUWZWPSk8EJlZgnDGsjKSuG0=;
        b=ZNLpayoCPA6zs5fLc87qW0/oGms8mKtCoSFM9LS/IHNoQzScftbGvliNQ4RGhYq9iz
         VbemNZZQNHbJI4wTpnV6WZCgDLCt4q2yf23wYvI0xvinMrwazM0rEkYs4IaMzKSYd51y
         /ADU4cJnrFCEKtI8kBfN9q9tGySl7Z+OEXnVChS2LlagJ7s6NWiqiHXhvvh5spnXXHe7
         sY3b/ziXfH3jaZqmarZ2122TZCvvx8F2Cjl5gqTMMcSYT3XzgZyhWYLL9vC+2YKLoxm7
         7PrRq6rU9gKoANP34C6uhjsp0xpzmkuthFpNJVlh1sr8H6HoKtCqnb6uEmS+QktJZ1IT
         PK+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719240441; x=1719845241;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SPozXOfnQpkwCjUxXDexUWZWPSk8EJlZgnDGsjKSuG0=;
        b=s8rI6fQaRYQLKGiYqG+CwUQeOOPWqqPwLpkQpcgR5M4pvb1V6Tdoixh92h3RH9Cz6X
         gK17jXFna5/hdPAC8AZ7nwREG8biHhDckQjltJkSlTTYUn0nA2jSK6ye+Aq1jDuMkk9+
         B1dufWiZRg0lhVLSKss9AMmRehzZM3Eik69ZsaJlTeWYi5MkBGSHEDyw/jnZJJ4rGccb
         KWaBHnVvpBqS+bnN4jxhsEwRyTSfyHd9pPdvKg+UGvZCmChR3+R+EMQZYoF5eIiIWyme
         1fBvGtKD7Le0IjQxdP24RC2RO6eysigBAFI34TDRifx2hdIymQk1K06OTU/wkL/EZdoF
         Un4w==
X-Forwarded-Encrypted: i=1; AJvYcCX67F7I9XK7kLk/0w36sPzFaqvhq5PylLqfBn855RKdP4g08zoNxoMvRibjLyyG3Kra0OnWONYoBQTqzfhFoSrQehYTsfms8EZSMVcAYg==
X-Gm-Message-State: AOJu0YzPXMqdPQGlg6eEi+e5q2SBnJ4x45C1sbxUzsylGF7A9fp6W5Vg
	tccM6Y6peA4+0HWJtbebwcDDW0ptryJfWF8gwj1Cfz6Z4bZmtf6B7s4tC42e6Go=
X-Google-Smtp-Source: AGHT+IEWEVedxizz7wL35346SfuzkwcOxrGhZmWmTesVJLBvRgGjQKJ0LKJ3PlJSSoWZaVRtugvtNQ==
X-Received: by 2002:a05:6512:10d1:b0:52c:e982:8457 with SMTP id 2adb3069b0e04-52ce9828502mr1763058e87.32.1719240440814;
        Mon, 24 Jun 2024 07:47:20 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ce88b0119sm212699e87.222.2024.06.24.07.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 07:47:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 24 Jun 2024 17:47:16 +0300
Subject: [PATCH v4 10/16] drm/msm/dpu: move pitch check to
 _dpu_format_get_plane_sizes_linear()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-dpu-mode-config-width-v4-10-1038c13da3a5@linaro.org>
References: <20240624-dpu-mode-config-width-v4-0-1038c13da3a5@linaro.org>
In-Reply-To: <20240624-dpu-mode-config-width-v4-0-1038c13da3a5@linaro.org>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeYbwE4Ng1KUwuMPQqNNhl2jUNCi/sq3YbTvFP
 cvNquVeUEaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnmG8AAKCRCLPIo+Aiko
 1YbqB/47/wo7upDky0O43P8ivMBAIsvt8g0v+bXSkiq4FPPYOc3hJZsLeINCaUhMIc7Wa2KmZNs
 h9R0S1zzHNHGc+3rh3q6fTqGyw63KQfBuZXy4eooA+zKwfZf2rlh0XxGxLkfNsF2r1AsoThb4ws
 Ba2NbIVLFKFlmmYnFnxhafHXCSCJQs2s+TQhb7Sk7NtcWq2M1QWOdwCd7/5IDkQ6V9fvNqqUUzt
 P7I5QypLz62J3Q1/rDUEsKAJaCT6ZCAvcZKjh+MBtTUENBECJWddDR7Gqw7HmA+vSW2ea+OFSDO
 gSEyXd6VtGc5OaWG7JxXvwyMgWv9TUlfPnIim/oLQL/g74QF
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


