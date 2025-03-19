Return-Path: <linux-arm-msm+bounces-51912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D507A687BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 10:18:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA898188AD59
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 09:18:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E60E253335;
	Wed, 19 Mar 2025 09:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AaW7Ojnh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DEA252918
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 09:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742375874; cv=none; b=BRFr54keinZr6G7S6SczmoLg1wsVGBN440r/TSVcTi5OIQYur0ybuJ460zhOAw1NUr05d68Qf/2r40EhY9KyDkC437aPoiLf4KPx4ev3ocUxkpEGcaau+NSJTcmQTE/RAJvM6MU3vOoXqKHyQPIX/H8mToasKTqmbXo6yasVwC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742375874; c=relaxed/simple;
	bh=M6dCa9QbYlf7D6XIUvrH5DEVFVT265xiBP6CZshU2Xg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CMT+UHWMMCwkHrgTXjo796ZIbqyuNgXIpOIjzVnSzDIXz74lqwir8joaSxpMkTwJpD0uNMEd3zmFFcTRCtK38J20XLzwe7bf8SSnowGyH02M4NPN20JJBBCL53TjOGsW3K6BzgrTQdFKo8JrrczuRX2I83Sl1LeFbxK9R7L9jIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AaW7Ojnh; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3912d2c89ecso5981030f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 02:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742375871; x=1742980671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rfIpSAHZSkPf6dqXb1ymwuVLti0MmykrLRZH/yq3jag=;
        b=AaW7Ojnh8acQujWQcfpmN1uNS62gQSq8vhCZsgh6mPdlfTv1ueWr0h3aOhA5i/Ex4E
         jRJ0sfMScHjxbMDVjWt9vPU0c8QzGdOOR7fe+FtC5/ll2qSqT/YOCutViF1s34CvC58a
         p4RRDVG4610bA5xYj0tznu0ElAdtHWDDN2y63wS5TXhiQMItcdbkzAH2IvOpqpwOPoiO
         kumWd+9po5D+6Fb0ILcCB1dC3bj5wfIggAM1UjiycwGqz7a/H4+NG76UeBVnz/J34M12
         U4I/MyZ+Jf3XwS8Iz0gdPQsdNs1jK7SzIXhvkUtkcG6M48wml+lvzijyYseQGYnIELxM
         Ac2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742375871; x=1742980671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rfIpSAHZSkPf6dqXb1ymwuVLti0MmykrLRZH/yq3jag=;
        b=nx+JINWGi+dRdNyZlU3flVrbI4o6LQKeMiyT0uv9dZcGD6r/iirfej2PZ9L+kKKbzr
         lMHmCDaTZ4v1xSeDpDGSjFKznzjyh4EoyJrjBywCWH1kUJF53RphSlLHM+hOPzQ7V1fY
         b+8nW7FLHvlPRi8z5v3pf6+68P72ytE0Kuob5s/drrxNuyvvCKsJDl85SmGBi995y+7s
         EQZTEpisfDD+beQm7Orms2oV4/fHCCbimEzDQ9NXwn1MxCegeqilG24zuc4tW9cyWnV9
         t2RU4SKgJLihrnG+mE+aEx2oiEyMAoiec10MPbm29V8Z8OoTvWBEiyAeaKQhrBauLQ1u
         +nMA==
X-Forwarded-Encrypted: i=1; AJvYcCVHRcwj5A+B5oo1ChTnTWXlXnnWwQjZgCrVQGWnKYOwSIeIWSEkMg7DNEwvDPV27styJ4DKtSf6vtxFGzg8@vger.kernel.org
X-Gm-Message-State: AOJu0YxDd/qul+VTayEOtZmT5+0ioqWDosZxK1tH8sceUMbvhZeJf7Lk
	89lsnWXs9T3dUbdd2evur1GcFllCe/EQiODEprNHE2DGl3LdKHqHuoP7CnqIbko=
X-Gm-Gg: ASbGncsEkZ1xzFPRDQ4mBdgDN/XsVMBgbPnD0+ke37YtptxJa2FjA7Cw9UpnPeKXpfF
	C0xtCfEACma4uELsX5wOOUOnAetv9uw7r21UMRIhEZ5PTdbmiNva0OnFGRaqh4n/a+1k4qKHUTw
	SNA6CKAU1e66tkxlg3rKmsKj2ON0ZWxIzTuChNicDVOqN050y8tDLr+GRBD0DYv+jE/9IRBu1FH
	AGuWy6FOTutJJ0AuPn2TgXCXjcSei9qed+mxgz984wJZV/N4QbQLKwIlvBqGStWD3OhmHO9B6gi
	3MtvN/1XPFlpukREQm6JtLa5g1RV9WnmEVpS2VVCQ6AYVnrAV3eJf4/LDHDpbdMxzd8ACw==
X-Google-Smtp-Source: AGHT+IFJ2iLmk8pAPqBAWEp0LzO+Z/VRz7gyRhBPaVCohInnwXkQ6lhGBk/Zng0hIIeJtYAjoAn+AQ==
X-Received: by 2002:adf:a40d:0:b0:391:2dea:c9a5 with SMTP id ffacd0b85a97d-399739c6b29mr1425261f8f.20.1742375870820;
        Wed, 19 Mar 2025 02:17:50 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c82c255bsm20023810f8f.23.2025.03.19.02.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 02:17:50 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org,
	andersson@kernel.org
Cc: lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	dmitry.baryshkov@linaro.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	johan+linaro@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 1/3] ASoC: dt-bindings: wcd93xx: add bindings for audio switch controlling hp
Date: Wed, 19 Mar 2025 09:16:35 +0000
Message-Id: <20250319091637.4505-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250319091637.4505-1-srinivas.kandagatla@linaro.org>
References: <20250319091637.4505-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

On some platforms to minimise pop and click during switching between
CTIA and OMTP headset an additional HiFi Switch is used. Most common
case is that this switch is switched on by default, but on some
platforms this needs a regulator enable.

This patch adds required bindings to add such regulator.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../devicetree/bindings/sound/qcom,wcd93xx-common.yaml        | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd93xx-common.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd93xx-common.yaml
index f78ba148ad25..fa00570caf24 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd93xx-common.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd93xx-common.yaml
@@ -26,6 +26,10 @@ properties:
   vdd-mic-bias-supply:
     description: A reference to the 3.8V mic bias supply
 
+  vdd-hp-switch-supply:
+    description: A reference to the audio switch supply
+      for switching CTIA/OMTP Headset
+
   qcom,tx-device:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     description: A reference to Soundwire tx device phandle
-- 
2.39.5


