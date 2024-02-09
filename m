Return-Path: <linux-arm-msm+bounces-10294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F57C84EE46
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 01:17:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8AAE81F27E4E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 00:17:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41F4C37E;
	Fri,  9 Feb 2024 00:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mm3DKbqH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A25236E;
	Fri,  9 Feb 2024 00:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707437857; cv=none; b=JcbJxcx3fBWzc0KuLZIhmeHa6vFMllzipp+IlJ1sqnDdBnw0snnvw7hTgvbIbo4VAJfT5jZvHGZWTvXsKMsLwazrZn2yuh2FZTuRA1StfsWmoxypyFlvvRivBDUTYDjEPJCsC+xUB4HigivYMlymM+bZm4GMWSAVUYlhurcuYLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707437857; c=relaxed/simple;
	bh=KqvXbB2UBkSBMY/awjD1Dmlsler8oCkodjMPNydVCHw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aEr/EGWL3ewokY0W7eQtZsR3Z+70zWWI49r3fnkIKTmYKrg++qDdCyS1rYEntZLpT2BPQNqy8lRBE91CivVPCElExnMepSNLgHoaZcs9xAdCKT2U/g3vn5V4ymJth13UruUj9e8voZMjaZV9s8UGW+c2276vS3qeTxcjchijF3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mm3DKbqH; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-7d5bbbe592dso183385241.0;
        Thu, 08 Feb 2024 16:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707437854; x=1708042654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zGPCYfl6jkizLcJNy3cF1Tzjj2+VVbxR8rofDxR90Kw=;
        b=Mm3DKbqHl9ERs4g1yzxUkXfSd2AozEPob/MMRr/3Sb92h2nTLLAbHCoUwDhgZf6vRq
         qHLwY6PhsEbw8PwkP97tLkgOi8jBerwh4ZlhIP7+cxA2HtUC6PkDbIrT6x/nYLuNYh+e
         NMMuWAqza9TT6s7ch8vFzpSE7I7/s43SPIvwTJKFPoAG/JY8Ixfns7M/qDfquwO3kY8+
         ybo3DeLkSrsAe5a4NPhA/Z4x/mfZZtjt/ua8VN5qBuIEpupeYUYTydgi9XnlC/oehAER
         7V2Sf6WYJ37cfnqMNT9ghmKisbqxskuRG5axjoWiBTvOk0Gwkr/F8LVkjtsFhzhf/KXd
         XrqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707437854; x=1708042654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zGPCYfl6jkizLcJNy3cF1Tzjj2+VVbxR8rofDxR90Kw=;
        b=ikE/NdudY3jtlO/qVHpuxMqkt5SxgR6HURtqWR7UFZDI+X5Z1gs0FmvRoPkXaGL4Hm
         rWkARKCwZfLEFmI/ZlDNmlUki/ZTyCx1E5/qhoLpSBQmQB50vkjSK9hmUX+j+yIMgtP1
         X9bWLxV2hTNUUHlgyfVkouhW6SFrOJiClIuMs4ndMS3Z2gVE1ntuSyb18B+f5b6ZppPB
         s2bbP3P4pH133cl8ZmBEH8aRY6CxO5hmtHfBjTmLdVvuwYhZuR4UgJpKK3y3BuR9wlAs
         lPTbeiHNg7/f5Ndxf2oeW6BTkvbqWgf2LDo5O976D1cOJ29eWWMrQbErO6h7J7aoVxxU
         6EZA==
X-Gm-Message-State: AOJu0YwViVqVsh0AfxoOxDw0fvLHmHtfpLTZSPTH9QIyUoeHE13I5vp/
	Ym80XBFTb3cZfBVyOAtGCgf7XSdt8+TEmmcjxsNN5UcgeR7fTq6chGHhKpsE8NI=
X-Google-Smtp-Source: AGHT+IFQLJIJJYHAosyjO/LKhn9BM1hYHw9cGKBoo4dKEQeGaxZAwSv0pHA/+6SsjUQ5jkLcnh+UCA==
X-Received: by 2002:a05:6102:32d1:b0:46d:606e:6323 with SMTP id o17-20020a05610232d100b0046d606e6323mr1147551vss.2.1707437854421;
        Thu, 08 Feb 2024 16:17:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXaG+0KPNKYwMBnfTafKLbOXco7l5jk14UkfdoUmWkFNv1s2BK0jO1hpo2hPxs7cdfZn+kuIVs7tzRkkSvGk2X/8+R6QtNFjIMK7wecD7SPPPDozRkcusqQ9LQrDIyF39qH77hGHhcrUOgHD0coAjfjMU2TU8STy4s27BVf0LamXUiIcJTfMaLL3MD7GAOKcFVh/fkIiKclRyTcXrkSLP6afSQUI3ZSWUTsizAMWG2mEtsvNo0E0gJF1o1uMSJSprUH8mFggE3lwhaaj1t64k0TW93zE84nrr/FSGslcvXXhHs48V0t5y1/5gW7TItpXgonWucgQyBgrJPBtI08BSalSPDM+FVPJ56joZjt4EK7T2Hri0erRpe6/kJ2WPIL2aQpNyYIvvNH5vYsWmDJDzlXKi3N4XqorpfnDGwldpy6KpolhhkkYdy9lzzcaz9QFG3cZRolQoBIuSA1R84tVGFLbQVO1ealOoLGbSAliGI2HCLYmwbUAhHwiFCDKjpqMdykelO9V0M+eV5i04LZb3yHYHXwexuoagxjbKARCjdWUDggDRSycwOFz5U+/6zflGrSR0SfpcHpEVpV
Received: from localhost ([2607:fea8:52a3:d200::42b6])
        by smtp.gmail.com with ESMTPSA id ks23-20020a056214311700b0068c87402da6sm291099qvb.14.2024.02.08.16.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 16:17:33 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 1/3] dt-bindings: display: panel-simple-dsi: add s6e3fa7 ams559nk06 compat
Date: Thu,  8 Feb 2024 19:16:42 -0500
Message-ID: <20240209001639.387374-7-mailingradian@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240209001639.387374-6-mailingradian@gmail.com>
References: <20240209001639.387374-6-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Samsung S6E3FA7 display controller and AMS559NK06 panel are used for
the display in Pixel 3a devices. Add the compatible for it.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../devicetree/bindings/display/panel/panel-simple-dsi.yaml     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
index f9160d7bac3c..d3abd7f4ebcd 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
@@ -50,6 +50,8 @@ properties:
       - panasonic,vvx10f004b00
         # Panasonic 10" WUXGA TFT LCD panel
       - panasonic,vvx10f034n00
+        # Samsung s6e3fa7 1080x2220 based AMS559NK06 AMOLED panel
+      - samsung,s6e3fa7-ams559nk06
         # Samsung s6e3fc2x01 1080x2340 AMOLED panel
       - samsung,s6e3fc2x01
         # Samsung sofef00 1080x2280 AMOLED panel
-- 
2.43.0


