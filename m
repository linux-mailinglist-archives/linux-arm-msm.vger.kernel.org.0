Return-Path: <linux-arm-msm+bounces-30956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A58E96DC83
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 16:52:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D57D1C21984
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 14:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AB0919AA5D;
	Thu,  5 Sep 2024 14:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qyw+yq8F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854DD194AEB;
	Thu,  5 Sep 2024 14:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725547895; cv=none; b=jE4aBvkWr85uJCYvRTeVx4rNMV79kp/Zn+xEC+LiShV9gINl0jcGXl5bKuLmzp95+MWMl1mSicfz24CyQgn1ypU11N5NRkYa9Cuj8TXhrdO8rCUahhd6xpBfll8P5kPdDkavIyFTtEEYddLoOFh3l4JeQo/gbiCSA2mbdMY8i0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725547895; c=relaxed/simple;
	bh=oUM/CI16gozvDWhTcSfQS9qAoH2wC/uZWKXcoKsNOYo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JUJGhFO11A/SJXOm83b41D0grVMQlcDNUfK95E49t5Pg7XPTXvJZFwuRL0M2H4UDIp/ZDna3qQhgMzGMB71O7s+g18P0/ifZnvlh3ILHvLG5R9nanr9mCr6xbzlyyy7bCYAENzn1tW4wAHnuLYlShdLv+cSjpt+Y0/7+Hgi/bbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qyw+yq8F; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5c3d20eed0bso662591a12.0;
        Thu, 05 Sep 2024 07:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725547892; x=1726152692; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qPOo8Pfi1VNASnBtqV5YKHTic1uBqsRSoxIsZX1zO3I=;
        b=Qyw+yq8FQO7T9tO5lkNa+2NUiDrCI8Y0Wc9jG5hptxFMBXc6jvNHLAA1Ejus8zOiiz
         c6SLYuUPK9lj3PgHm3OEM4b0uytcLMVl8n0rv5gqbykIU/ew1HS8ZlNwyqIKTUHxgopn
         MwtDtWcXLfaqvfGIIZxdJxmvO0UH3T0i3f1jezMzYQng9S1CVClK+q9yd4/I8Y8o2nT9
         Dr8qx6MIqBUd82mqlMDemJ4AuYjFQI8X0PLszUtu1JXJ5XTVr4NIbeFG2pTkALfiS48L
         tauZr3NY9s1Ixqt0UX6DoYUOOHLhFvHj8TwQP/TJM8XWErQ25P02kVMMgWMn6UeuMgko
         tQPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725547892; x=1726152692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qPOo8Pfi1VNASnBtqV5YKHTic1uBqsRSoxIsZX1zO3I=;
        b=dl46Tl5pycj0a4WnwTdjFqspd1r+pf7Wo3U+tPoa6piwwoUNMm3NatL8mIlY9buHuJ
         0yld29X30lP6cEB+H3EXohX7OuFBVe87k9cst9KmgGjXMm1e9EuLxssi6b6L6U11n8wY
         2/F+qxBD02LmFbGWpvyuYf6HEsETctyW4g6oOqf3fLwjo4WIxzV3f/Or9SNyRK6vobf4
         wkx5p6rxUj/2W4R0Jz6qikJECQl9Kl2aZ0zHEHLDXploFQg0afeBnUgcOiYFSNzsp5bN
         eH8w5OnWVlHGpXYOewy1o5IczD5nBLXIkZl2LlY8ZpVo/ceE+jpDTLx4EVAGdzp6yeo7
         3jhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkAvxcDWYjgwLnemQI/mtjG2WwPgrkt/RT9hfqRbX20558HoC60K9iiApaBMGIxuqgsXPTNUrv0NiUruHT@vger.kernel.org, AJvYcCXMFDzfwr5FQFBAYOlI2MQsvrOcXF3sTaowt/8LJQxidfddAIiEdNpcotIoDrWYgEgbeIQxeRumcpI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyF7ye8dUL7NWCWJ8IrQBOWke6aNmxcJdt0Ys68brcqAIpwA+oW
	iUPY2kRA8mXD8euAHTYBrDFvXStxJLJB2ejzgJWbwW+RFwekgua4
X-Google-Smtp-Source: AGHT+IEnyqHx0DHoDglc2jLC/PA9Nj+uA16QJYJDKXjsKOGJaGOHnPxH2U/yAKpfbREDBM1ujNjG+g==
X-Received: by 2002:a05:6402:430a:b0:5c2:632e:9910 with SMTP id 4fb4d7f45d1cf-5c2632e9913mr8692658a12.1.1725547890783;
        Thu, 05 Sep 2024 07:51:30 -0700 (PDT)
Received: from [192.168.1.17] (host-87-16-167-153.retail.telecomitalia.it. [87.16.167.153])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3cc52b376sm1320732a12.7.2024.09.05.07.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 07:51:30 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 05 Sep 2024 16:51:21 +0200
Subject: [PATCH v3 03/10] drm/msm: Add CONTEXT_SWITCH_CNTL bitfields
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240905-preemption-a750-t-v3-3-fd947699f7bc@gmail.com>
References: <20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com>
In-Reply-To: <20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Antonino Maniscalco <antomani103@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725547882; l=1210;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=oUM/CI16gozvDWhTcSfQS9qAoH2wC/uZWKXcoKsNOYo=;
 b=X8eiYRE2gVkakgwp1dJ5qHgU5fJl/hFC67Ik7NqxxS3XRnT2QeZXDEAFmbq5M2xx/eSfNldAx
 SlYmdJZIP5BBt512gBZ9594E0thEcU9E3r7kQli8Oe+z28otUr7I3Av
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Add missing bitfields to CONTEXT_SWITCH_CNTL in a6xx.xml.

Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
index 2dfe6913ab4f..fd31d1d7a11e 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
@@ -1337,7 +1337,12 @@ to upconvert to 32b float internally?
 		<reg32 offset="0x0" name="REG" type="a6x_cp_protect"/>
 	</array>
 
-	<reg32 offset="0x08A0" name="CP_CONTEXT_SWITCH_CNTL"/>
+	<reg32 offset="0x08A0" name="CP_CONTEXT_SWITCH_CNTL">
+		<bitfield name="STOP" pos="0" type="boolean"/>
+		<bitfield name="LEVEL" low="6" high="7"/>
+		<bitfield name="USES_GMEM" pos="8" type="boolean"/>
+		<bitfield name="SKIP_SAVE_RESTORE" pos="9" type="boolean"/>
+	</reg32>
 	<reg64 offset="0x08A1" name="CP_CONTEXT_SWITCH_SMMU_INFO"/>
 	<reg64 offset="0x08A3" name="CP_CONTEXT_SWITCH_PRIV_NON_SECURE_RESTORE_ADDR"/>
 	<reg64 offset="0x08A5" name="CP_CONTEXT_SWITCH_PRIV_SECURE_RESTORE_ADDR"/>

-- 
2.46.0


