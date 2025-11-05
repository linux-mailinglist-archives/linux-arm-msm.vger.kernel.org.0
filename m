Return-Path: <linux-arm-msm+bounces-80442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A06C35566
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 12:24:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8FAA34F273F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 11:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81F2230F7F8;
	Wed,  5 Nov 2025 11:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k278Zokh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9B53043A5
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Nov 2025 11:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762341715; cv=none; b=X3RViVammK3tUagkr9RFvlncgL4zBlRnD++WHCWiztLNP+0+QMhRnyU547Ood5fZgGlAgZMjSFIDopDu0ZCCLYIl4SOd8Z3nv+K5gEIegGLgyBwGHJwPYeG1CRUmvm4eoz3DF7h4oFI3PVWrY2uO6OUwUwP5k4rksCIsGt0GO78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762341715; c=relaxed/simple;
	bh=BFh9UCgyUwVsBujdH7J4wHkf6lQu8PKTJJsPUVxGQHs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PGSrPKXgAXe05iTxuZ7l14LTOdcQ2/t+daY1TRtEl7dq26qDywK68OOM000XPoVQL/QrTELCtIo6blwQWxt+SHt7UgU7WWlLX5PqKWzu3mZj+WDl/igrVrlRsMgCef1pdciQlr4PsxXqLWMzNnaRt87I4lPLcY8YCA1kvdNXl2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k278Zokh; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-429c19b5de4so1393416f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 03:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762341712; x=1762946512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M1euWTEJaHKdLb/LdGqQPWx0LpFCSrEIebRupku/uzo=;
        b=k278ZokhFRG8x2Yfc9a+f3qRXKSxKe2N2vCj3XDtw+piX/ykpK/BP+DGni/rX1/3Oq
         3Nz2F733yooupiRFKjbE7DIlk27TccKLImgYqXTFNvrioNEw4KQvTYY6WeBT5OEPuFRN
         XszjZMljn2L8LB1Oc4rdPX/SxnKRpppk1YmFwIEiLRPkvQis6xbGFbTB3yh3FGnavA/+
         fz6FFRX4/Js7Wz/tGk+TjZr3WQh0ppTKlcI/FmHJkVMzK+v6Wk6o3tjDGx0vLO+akzmy
         k30dZrTBdbD7Oo8oFfwtmeJIPQznqw+HVu1Lm9qojYwO1c8fWdI3kN+//adGTjNCAVMq
         tpng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762341712; x=1762946512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M1euWTEJaHKdLb/LdGqQPWx0LpFCSrEIebRupku/uzo=;
        b=M4CR1F5raZGcavDZmwnaLjOa5iHT5ug5hGOQXFvKfMeVXgjCe4j/2h3qOV8mQbob1R
         qsm09vtd2NTW/GfjOjRbM79eddvErjcaSttB7n42h0vCC/5ari9bZHYQ3dde/JDRml1Q
         C6EfmUzw70Uk9g8Pmw8IuAAcXaVoDqILWxwpcryRKBtZYN0w4d6kp7R9ASdaCLNOAUIz
         tbV9WyOi9ZW9d33zgxTzLVE1D7t7gPY3vGRuUt4cfDYQ7ehHfru8DgJuZoAQmJirL5CK
         02wSDQwUFkaNjVYaf2lvLdrm4Yu11FI8o3Fh8ezjmBV/JmyoYXeRJKRrsA84ZHjR+Zxo
         dr0g==
X-Forwarded-Encrypted: i=1; AJvYcCXTrUFNRWwmOwwaDhrafhb+kySDzQqDMXuy2H393dflEQcY2eGAEmscgZkPlYR3NlPkvDCqam822AucyTlW@vger.kernel.org
X-Gm-Message-State: AOJu0YwdYXoBdgdSP6ywZmD4z8QuYk2lMx7n1tNcR97ltT+5c536jesf
	2Xvu0ZsuND1lrCK8LTdlJubqOx5sTbmfaAd+VuGzysnsc6LG3GmPZdjV
X-Gm-Gg: ASbGncvqN9G8G5NPGDKyyMKld7miyaCQZG3QC5gxGySMicc+UZYIl2e1c/ff66/3LZN
	iII/Ol5cURCrRRwA/91CMFUTLiwRCZfU/Gzb3fyW72ciYKZeovAfGcIDL2zdJatTgZwHPlohOSN
	5Ut5b+5QGXyoTD+TQ2N28byYo7lW1ysN12+Ivd8bNIs46HMIIRTragBdIohBWgqUeblJBOcHqQ2
	Nt9tPp7rofu13XElyQ4lLyAAF+j5D19IvTPLlE6tnbGM4FTQUfv2b+o/FXybk+rNc7efj6zmLdQ
	rbD4MwVDMAcXPWyLU3/x0/LND6vTOcrAghirdDtJTzaX4Q04Luy74jf1Wbm+9YDQu9WN6dUBoRZ
	cMM9Zp3w5WDY4ZGDews4aRn5y/SXLoNun+5BZSx5SOckEp/1yuTOMXsrZyWoEW/VFtinzBImwQj
	Mq2k5iozM64SoTjJ04+cWmtvbPt/DLgw==
X-Google-Smtp-Source: AGHT+IFaBERjDOWilhiZ8nC8UXn/SnYdgLV2o1hiIVjnv+aP0HIBPMqxjWbtS5BYh1ZNdfc2gkZbxA==
X-Received: by 2002:a05:6000:1845:b0:429:ba95:3a89 with SMTP id ffacd0b85a97d-429e33078c3mr2614657f8f.36.1762341711769;
        Wed, 05 Nov 2025 03:21:51 -0800 (PST)
Received: from Ansuel-XPS24 (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-429dc200878sm9829851f8f.45.2025.11.05.03.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 03:21:51 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Ilia Lin <ilia.lin@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v4 0/1] cpufreq: qcom: handle ipq806x with no SMEM
Date: Wed,  5 Nov 2025 12:21:33 +0100
Message-ID: <20251105112136.371376-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series handle a small device family of ipq806x
devices (Google OnHub) that doesn't have SMEM init.

We improve the SMEM driver and apply a workaround in
the cpufreq driver.

(I didn't add the review tag as the patch changed
 with the new implementation)

Changes v4:
- Add extra info of socinfo not usable
- Add Review tag
- Fix compilation warning for -Wpointer-to-int-cast
Changes v3:
- Drop first 2 patch as they got merged
- Use of_match_node
Changes v2:
- Rename error macro to INIT_ERR_PTR
- Return -ENODEV from smem probe
- Restructure if condition in cpufreq driver

Christian Marangi (1):
  cpufreq: qcom-nvmem: add compatible fallback for ipq806x for no SMEM

 drivers/cpufreq/qcom-cpufreq-nvmem.c | 35 ++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

-- 
2.51.0


