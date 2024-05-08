Return-Path: <linux-arm-msm+bounces-19509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C32928C0218
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 18:36:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 68A7EB255CE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 16:36:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAB2C1C27;
	Wed,  8 May 2024 16:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JDipxYw7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F2FDF59;
	Wed,  8 May 2024 16:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715186115; cv=none; b=RlhZMydz7+3DBAFPJIttjNBlQBpbMhH12MqfwRPudmLszDJxdEkjpttUcayNOMZITiOZyJNqCdopvNBSmaOFhzo4sMw2Jw1dZ/PZrlM90NqoogaMuLI5aQx1p+YoXc2NFBFMCfRipsTc5q7sAyBLX89vwwU+YmBxNdNhny4v8cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715186115; c=relaxed/simple;
	bh=Q6TIkwRzzM31WdY1ZLK+qbjKG0jsm7ZjHFLqIxzE/Xo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oiG06DbdLlytO43WWVcyr/IjaBqP5sAnFWRlNUMqq4bH8501NnbNS3BvEuO+spIu1+lvK01yjWZgH/JeVmDnsPT+kiLGeL0pxF55H8psUGxXFJZY1He9BiZ0PrifxpKoFFZvNqSX1TgGY7V1sw8kbZ4jab4S0fkrVXFyit/3G6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JDipxYw7; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a59cdf7cd78so955741366b.0;
        Wed, 08 May 2024 09:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715186112; x=1715790912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zpNHSM3S3R1dbWtnGwbL7hqnWPLixps0QSnCzdWUuto=;
        b=JDipxYw79ABSaEjXnqrvEMHQTLQ61oLAxOEUYnRsOEcmI+eQaggVLGize/5UL7a++m
         d+1Fc+oDXeQM99BKiTu0FDit+03zBFzNI0H5GIJezJa4yMJnu98icr8d4vsGgTCH91Kd
         a69HEQmQmhTs3HvIFGfRGvA906lcbanD9B+SE/w0UEXyaQBi7DC/Bh+fkkF+GTrsLrVD
         4P5WZ0VNug0f7Ovcx6u7Wb2l7THJtvL1ytttmk9Gu/0s7E2rNWiHc+ltYLOzoiSY5Alb
         eelXaAloMrTWIwykSKb5rtuIzaLDBBVi1646L669dSb2vZ0LLtIuFVvyOx4BdN7bP5n1
         LG4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715186112; x=1715790912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zpNHSM3S3R1dbWtnGwbL7hqnWPLixps0QSnCzdWUuto=;
        b=xNYsYxE0Y/m3GGjaj27rfjVtYqKpyVkJ2Lg/45TCE7lHOxkXXTbwLvjErJ/pVRtZdS
         0AXUY4HWE8V212o7fNrA1oSutRlTeSJ5RRQEekDH000KTq6vD/uGH/5tRZAIbtw7phvE
         8rtntckfWELQ9nRLbyjGdyMNwnxPqPHZpMN/3313VNyJnLXC2uOS942JsyZwROuymJ2x
         0dTq22VRnqGf+poLiJc6ktMe0Du3I8lztH91BVhRqgqwSFui2WC8guRlNw3yW18dQWBs
         4QeJRCk1XTCxjBud6Ay7nCvBgcqAD4AGB8mC7Z3iuP+laZuqFJsb+3DMR+EX9yawulUB
         A9aw==
X-Forwarded-Encrypted: i=1; AJvYcCV/VdeubvUF3mo8au/UKJrV9hujuaVZ24KhKDj1y0+4qCx+ukj00+FBomOW1ihYfiYVpH3l2eNnq8eHM8MMDI6TCJygGu/8yEC0fuOXkVwIEOqM5qVwQpnW0BwyczYVvBFdYPkEoeEDghXgBcpAJIPQi/A/Be3vpmTHBwww+lUwsGu0EPkuIZc=
X-Gm-Message-State: AOJu0YyCmYbXZsljsnOdterm1ju9QaYsLB+irB/7CCxe0JDXKBWxI5Tk
	AaS4JQcIZTr+R9A/SXyJYatD8JKlOK4XqEehtCtVj/MA1fTh+Kf43iBLww==
X-Google-Smtp-Source: AGHT+IG8sJksLsgIw9a9mlc03pJcShkznrWX70Xz1bZ4vKiPwgKEZPM3f9WHAYSnmzM+cSnWmjM31g==
X-Received: by 2002:a17:906:a3cc:b0:a58:e2b1:92c2 with SMTP id a640c23a62f3a-a59fb9dbc2cmr193575866b.57.1715186111984;
        Wed, 08 May 2024 09:35:11 -0700 (PDT)
Received: from localhost.localdomain (bzb212.neoplus.adsl.tpnet.pl. [83.30.47.212])
        by smtp.gmail.com with ESMTPSA id kt1-20020a170906aac100b00a52295e014bsm7820894ejb.92.2024.05.08.09.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 09:35:11 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
To: 
Cc: phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Adam Skladowski <a39.skl@gmail.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/4] MSM8976 MDSS/GPU/WCNSS support
Date: Wed,  8 May 2024 18:34:33 +0200
Message-Id: <20240508163455.8757-1-a39.skl@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series provide support for display subsystem, gpu
and also adds wireless connectivity subsystem support.

Changes since v3
================
1. Minor styling fixes
2. Converted qcom,ipc into mailbox on wcnss patch

Changes since v2
================
1. Disabled mdss_dsi nodes by default
2. Changed reg size of mdss_dsi0 to be equal on both
3. Added operating points to second mdss_dsi
4. Brought back required opp-supported-hw on adreno
5. Moved status under operating points on adreno

Changes since v1
================
1. Addressed feedback
2. Dropped already applied dt-bindings patches
3. Dropped sdc patch as it was submitted as part of other series
4. Dropped dt-bindings patch for Adreno, also separate now

Adam Skladowski (4):
  arm64: dts: qcom: msm8976: Add IOMMU nodes
  arm64: dts: qcom: msm8976: Add MDSS nodes
  arm64: dts: qcom: msm8976: Add Adreno GPU
  arm64: dts: qcom: msm8976: Add WCNSS node

 arch/arm64/boot/dts/qcom/msm8976.dtsi | 537 +++++++++++++++++++++++++-
 1 file changed, 533 insertions(+), 4 deletions(-)

-- 
2.44.0


