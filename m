Return-Path: <linux-arm-msm+bounces-32779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B7798A615
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 15:53:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 172552843D1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 13:53:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90ED41922F8;
	Mon, 30 Sep 2024 13:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M6A/BQt/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63D4191F75;
	Mon, 30 Sep 2024 13:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727704370; cv=none; b=KsbIB3x1GZDjnmlqZikaNHuaInMIBwFwsPiRnbtLRoc9PP6Ot8OT0d/gvdJPD4NO5AiltMPKbj6lU/w0Tmjn4iROv8Je8lju2jSEAJRUMSkd5Born5WJP5C0Ezik6RXX6ByDxasgIDXHuXMwd7Qkn8+evknSKN9iBFIf9Ygnr/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727704370; c=relaxed/simple;
	bh=95uWYhYXrJwsS/Si/bR6gRgvDdDmC6nz9iFGaH/gMIk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qyeyd23uW7yxGhm4aO/zbtf61eDpY1xt/7uhHBaLqVaPTOu//qZTv1Nyc1ZWvZXeqDikKa62WDlCQpKnZTwhCTORw0p4kj/65FsjryMiuRJEZ3NtzxFuZv35e4zHddLNSYDGT3p/a8N0LEHqSIQRx/7i0ZLAqJlzmbPsBFGghkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M6A/BQt/; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2fac187eef2so19999861fa.3;
        Mon, 30 Sep 2024 06:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727704367; x=1728309167; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AkSz1D5Hr/cIydOboRgyQ/kGqlozWFahzIe7ud0a0O8=;
        b=M6A/BQt/tCQNmIwHIXAM2c+tPxFS6sBCeD9DKZjl5yqYS/B2QUjDZLBZiyWxuFfUXc
         yeiBb4jJwRLyKKbyXrne3D+r5i1cg3SkNKhLbAR6mxP22FpMsZfzHIZH+M7Jks5FCHW3
         /l8A4LQZDJm07+M5Z3LM8SgVKKAlnm4fa3AGsYfVI8sN1W7fGJlT0rOG97HPKq2ZKkeF
         RseSLDOo79ZukcSUl5Z94J30Qi/jEQx4eGa6EBNijJqmRtzSKTHI1Yiv9kDlGDaOpVPp
         BIWE36I3MwGqJSWMkwlVIoYFKpPKq6ndZdBhFkhiI99W2SS/X/4XIw99XYww+YvgqYxw
         r4ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727704367; x=1728309167;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AkSz1D5Hr/cIydOboRgyQ/kGqlozWFahzIe7ud0a0O8=;
        b=gg39kSJeborT+bnrFQfddaVmCJM+2dFRnM6stDSHOZs2xXgFa94NdUtTfu9yXr5//n
         YLcx4ggsf/9KCFBESK6E4+Ws3CPJdPG7lBrH8eAWXHsTr3WXM2BcSGhxZ5LO4TJqHn4H
         mmTFR8SFOSyVANRPplE5Qp2MBsuQM1nA4ryyRlNTp3gg11yjkcjVjsNBNhkslj0zifJI
         Qj23JeM5r0uqdTdPaynNDuhFw6X7iSBc5YPazzXF31DVbMyScr11n801HHcOpgaj3xXE
         RGvjxSgl7EpZMQjCEphJtQC52TH7naK3N8xkO4Evf51vqf5gHSEnKjGmglVtb5JxJPiC
         ej1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUGCFHe2hSgjShdtlUwTMiQ74njUyxCu21axmOj0jrq4blaMjPs3KRzHOhHW/0l7sUYdwkdiWwyOOs=@vger.kernel.org, AJvYcCWXUM6yI3MT8w1LVxY95MCA435LpNxmUHVfZzIxiRuYPGLRNbROa1JkpXNz8D/RkU+sydYh77Osql4L8zh6@vger.kernel.org
X-Gm-Message-State: AOJu0YxI9WIxtOhVUNVm32lCuJv2NBqppcnpuptOOB+CEB2qx4v3L8j+
	zwErffHCGK3j6pgtJ64dAced40fG74ybtFWWsK7mTOlr1SRLmI8h
X-Google-Smtp-Source: AGHT+IHFWGcngO0Ta4UMRaZut6aiuFnh2a+knY7824+0F//PEHWOi3H8hOBcbL8yQAmt+yHj298wYA==
X-Received: by 2002:a2e:802:0:b0:2f7:53b8:ca57 with SMTP id 38308e7fff4ca-2f9d3e55c41mr46525921fa.19.1727704366634;
        Mon, 30 Sep 2024 06:52:46 -0700 (PDT)
Received: from [192.168.1.17] (host-95-250-55-22.retail.telecomitalia.it. [95.250.55.22])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c88245ea57sm4507540a12.55.2024.09.30.06.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 06:52:46 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Mon, 30 Sep 2024 15:52:39 +0200
Subject: [PATCH v7 04/12] drm/msm: Add CONTEXT_SWITCH_CNTL bitfields
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-preemption-a750-t-v7-4-47803c7a5a64@gmail.com>
References: <20240930-preemption-a750-t-v7-0-47803c7a5a64@gmail.com>
In-Reply-To: <20240930-preemption-a750-t-v7-0-47803c7a5a64@gmail.com>
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
 linux-doc@vger.kernel.org, Antonino Maniscalco <antomani103@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727704357; l=1523;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=95uWYhYXrJwsS/Si/bR6gRgvDdDmC6nz9iFGaH/gMIk=;
 b=x48nLkZ298lfcSnmRx8/BH6OnDPu2DerFLczl32o6cWttIfpIJb8/vtPTH9eRQXD2sgAhA6Ik
 qWu8XBcqR6ODjpn2Y2egn9FNzdTNkI9N14kPii6AULXWcqGESZ4Ggbw
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Add missing bitfields to CONTEXT_SWITCH_CNTL in a6xx.xml.

Tested-by: Rob Clark <robdclark@gmail.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
index 2dfe6913ab4f52449b76c2f75b2d101c08115d16..fd31d1d7a11eef7f38dcc2975dc1034f6b7a2e41 100644
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
2.46.1


