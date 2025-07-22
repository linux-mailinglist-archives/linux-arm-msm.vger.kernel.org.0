Return-Path: <linux-arm-msm+bounces-66159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DA7B0E553
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 23:17:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9CF03BBC60
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 21:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C4A227F160;
	Tue, 22 Jul 2025 21:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DVr7NpDV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3D46F06B;
	Tue, 22 Jul 2025 21:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753219067; cv=none; b=qK9xYzool4j30D8PiUrAjSc7eQaZz3bLToXhtCQNP6xsFVubcbD6Tw/NyqKDTyUMBU9ENGLWJshYOYiNZXaDqX2vrCFNTyhXpmMrsFUfYsLuYqp4Lj7yhTR45TsbQub392No3e+j+i8hfYhkc/ybrS+SthICer6KC6PPsxFkImw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753219067; c=relaxed/simple;
	bh=d02sCH6/NeYBgPvzjtmyE6jXOV7hg7UofouLM+04r1o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UfPnI8NOp5n8foapgDirdOg2tKGRECUUfMROrmJ0S4Bw3oJu9nL2ClVsWeYwEopQ6JOKeKPDXIjkYfQXgLa+nyj4oIPsF1eYSu2p9HJX/vATMnoUz5VNLdzpoIHde6mmLtQ36YT8Sti0aJHIboV2vKlnxGJsxfvmQhlH55LI7FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DVr7NpDV; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7e2705bc6d0so19987985a.2;
        Tue, 22 Jul 2025 14:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753219064; x=1753823864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Cexht8Ep7iJV5NQmaqpXtQhmXD0krdDQCxLXZ5pJ04=;
        b=DVr7NpDVTia6I+Ei5FIx7E/2IETg24x//dffxtv1hcnPpKBHHD2qdByZGNSvZQM2fm
         diClsTRL9QDl0E04HYsh5liiHhs4gkaHhlnE0ZB1pwOqym0+kw/8cVDS8Fl5RG3rHNMA
         zU6arZ8njrdG4qX0TbfdM1L7RBKg9bnA7+l7UukpYbXMwek43HbkM2xH7Q4m9WqtkknT
         284U3g1f8whNVHhxUnhUaykkJbl4/w9d1irMv9SYyi67CmjCNIcCZfgvKwdCAOLgCW+Y
         0CnEyH9+W3zApZRwpmkMGfvjH8BhnfjyvI/0b6y9iPCC99Q1TYW2az31U8nmXCxKsHVA
         +mpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753219064; x=1753823864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Cexht8Ep7iJV5NQmaqpXtQhmXD0krdDQCxLXZ5pJ04=;
        b=n8AgfgQJ9XiyqFZy73LEeWi4xCG6XeniqYF8dkL75ZNW+157wIDojed+fWOsY/yYo6
         GHfjMwQIxaBGxKugwot+xLPqeT1AHGKZKbpyJ+0xz20o0Mq7ts2EgHtkx9ZKcjw1LmF0
         9rN3haF2rYcm8oCG4dzPlrEdn/rbasiX4XYLdpMiEYritcGPO6g4XWtwkh/ZR1MJgIyD
         ERG8F1SlfY+GNU9xDC1VsJpTF3aWUq/8Ogg05F1BaV9UBMMT9Xy2NosKc7xvjMpHzVLN
         NWsm8E4xgAM64A3LjcUYlsb1hjj17R3SF3i7yQWwLDGgBTevl885qVHYh9gJwYVOHbpu
         juzA==
X-Forwarded-Encrypted: i=1; AJvYcCWEjsubsw9YvuyMrX/W1GuI/iiK0vWi/045EyvpPCS/3lu+jD/aDYiS85MvWwG7Pq/wKzGSihJCizK2XK8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPbrxgsF0ov375T+CXBoz/mJZ4eVwqlbd3Y97n7P7URm0JFnx1
	QGdXUx5N6LJ+/uCEcovbC+TNeH1E/4r05f7V6IacA4hUG0lrKC7jxhL1Wgvt
X-Gm-Gg: ASbGncuRCjKhBVlm/ELUKEMNWRmtjoLQj1jzI2kQfHmMBSgLbdP1yzH5onsUaDCKgSm
	I0FDKF8ZGp5/NkQjm3kSmukbeRXcHVGy1hAZybjnBtIB9JY5nGMQuoK8GBMhDaiJ4KbusX7DZ6m
	v9QAMBJVYK8SO1xpMWjDBooGLY7pcG1mmkVFkkJo5v19uxNHDzY5nCXf7I6cGBnqwuCWr5hzGFO
	aqeuiw8D05JJknUZiGYk7kHvgP3/46Gz2GZQuZojnBb9gWTjorTtzgsWPUPxU8kKy9HrAQC1Ek+
	v5pPDseu/4TxuTdcAUlDRC4o7CGcqEwlY/z0Z0/tVKY56+CsWzRMhtdj2nH9BeQx9ih6sNpD38E
	A7mHrbtc2HDWKmNagj2BX80QizzbAiA==
X-Google-Smtp-Source: AGHT+IE/MpJ1aJEcf6uIJ+8Or+5rNscHlCsMb7jqpnefW/nDyf5wJzo0n/quIZ7eod05PIUmZvDb/A==
X-Received: by 2002:ad4:5ba7:0:b0:6e8:fee2:aae2 with SMTP id 6a1803df08f44-70700672aebmr3725206d6.9.1753219064144;
        Tue, 22 Jul 2025 14:17:44 -0700 (PDT)
Received: from ise-alpha.. ([2620:0:e00:550a:642:1aff:fee8:511b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7051ba6b0fasm54823786d6.65.2025.07.22.14.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 14:17:43 -0700 (PDT)
From: Chenyuan Yang <chenyuan0y@gmail.com>
To: robin.clark@oss.qualcomm.com,
	lumag@kernel.org,
	abhinav.kumar@linux.dev,
	jessica.zhang@oss.qualcomm.com,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	tglx@linutronix.de,
	krzysztof.kozlowski@linaro.org
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Chenyuan Yang <chenyuan0y@gmail.com>
Subject: [PATCH] drm/msm/dpu: Add a null ptr check for dpu_encoder_needs_modeset
Date: Tue, 22 Jul 2025 16:17:40 -0500
Message-Id: <20250722211740.3697191-1-chenyuan0y@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The drm_atomic_get_new_connector_state() can return NULL if the
connector is not part of the atomic state. Add a check to prevent
a NULL pointer dereference.

This follows the same pattern used in dpu_encoder_update_topology()
within the same file, which checks for NULL before using conn_state.

Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
Fixes: 1ce69c265a53 ("drm/msm/dpu: move resource allocation to CRTC")
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index c0ed110a7d30..4bddb9504796 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -729,6 +729,8 @@ bool dpu_encoder_needs_modeset(struct drm_encoder *drm_enc, struct drm_atomic_st
 		return false;
 
 	conn_state = drm_atomic_get_new_connector_state(state, connector);
+	if (!conn_state)
+		return false;
 
 	/**
 	 * These checks are duplicated from dpu_encoder_update_topology() since
-- 
2.34.1


