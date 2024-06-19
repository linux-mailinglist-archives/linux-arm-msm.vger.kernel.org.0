Return-Path: <linux-arm-msm+bounces-23254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6640490F617
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 20:33:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBDE12825CC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 18:33:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 689121581FC;
	Wed, 19 Jun 2024 18:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="pBO03XKQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDD31DA24
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2024 18:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718821997; cv=none; b=eSfzrs5NeqhpQ0gcCA7LpGbjGeaGOscQHjsh6TVoBkasoNo90pcAyYH/8jBitzriSh48rKbXGOS06AxtImTjas19Fc9j9JD5O4pG4wejpbxeihovmq6N5yvY19Zz+Ls5p/NmFWi/yPnCJ2NEd6MUIYZcrdhgM5Zy7Cz2tO9d0iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718821997; c=relaxed/simple;
	bh=92mU/xikCqLLaH2DVhreKySC6u9LEezQMALGQAdfOZg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HKA0sjRRF0nufdwc6Lt4i289VaKrSwOoZKitOhjHNRyBC4L4+AhVlr7JeQ6ImLZE8vD+LYSVjHg+bvgfz5eTY6ftVP58cG+vHopZbfjL8ftk5KyUXQieRX4k+U7y2p8aeKKT+6rNEsLBmoz7CZY3s/M8GcCmGmW/O/9xvtChuog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=pBO03XKQ; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3629c517da9so91603f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2024 11:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718821993; x=1719426793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KoU88YQ9ly0f7ZJ/ZbHDiM2tCrY3AmT4ahDXIv2paYY=;
        b=pBO03XKQL093hITRvjZoSgp+NIreIOgMhIL8TvLnVjopYiGMEIWFfyFsWjNuc+8LTt
         RGFnGpPBV739l44pes+fkp+QDDMxStBGUVJJ29r3zCKvNH+bgEymvVcWJHl5wlkL4RgL
         HARaR6x/jkvFBVCVLN/goyGdxQe8DEN12p3IxoCj94uLswM1aq/jxkL11ExdqqhEYi3y
         lSZaK77fvXxvuJfw7kO8eRWo0FfRYbGb8vr07SEdvnhertQ2ktknDc3n1TiJ8C37P7Or
         9miQy95CTCS+NEUSp9i06UccQh3AW32L4aqHUUsg9vi6GsZvX+SghZRswcOratuJDlW+
         Sltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718821993; x=1719426793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KoU88YQ9ly0f7ZJ/ZbHDiM2tCrY3AmT4ahDXIv2paYY=;
        b=tJCxpFda7eKRR5GkmG0bT4VHSdghxMtYASXgG7FiLtaIgKxgoorl20nVJ9POLxn4ZZ
         I9TzjmpxG/nhb/wezixKBCSyDPrpS3yZUSwbgknDLUqUa8Dn+tod9puiBu2uijFG2y5I
         00sMQuiAV7mzEzGZDWKzJ2fiNsM14zPqzKaEz8JSA+Hjq+tBg7DA2Qej49VaqrZC19+M
         c3XLohw65KnRo9/soWzSrukGt7ox9IooCh4ihxQo3Czlii60KWYNe0faHhMAe0kYGx6k
         Gc4OhsHhmOY3fwZMFT3TLndiciIf/ksc4Ey6ZNTwZ12tQ+4+JLMRiGtYMGd0xLr8mXjt
         kNmQ==
X-Gm-Message-State: AOJu0Yye+zUBeTZiGgdYYR6fpiz6497UyQXAwdtfllwHsywmpKf3A2pL
	VbSrnjoBOEW1F4w0Jf3Y1VA2g4WYlccliTreFR8mGLSy/hLzbQCSAmudX3VWTLU=
X-Google-Smtp-Source: AGHT+IETG5LcNQbiEWNnEhPt09r+tCBRtoPh1Vb+eCZeeGLMwJUAbUmHsRulZ4D1s8qUlB6O94y7CQ==
X-Received: by 2002:a5d:6945:0:b0:361:1ef3:71d7 with SMTP id ffacd0b85a97d-363170ed44bmr2922036f8f.3.1718821992776;
        Wed, 19 Jun 2024 11:33:12 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:991f:deb8:4c5d:d73d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36262f77ad9sm4603238f8f.109.2024.06.19.11.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 11:33:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 0/2] arm64: dts: qcom: sa8775p-ride: support both board variants
Date: Wed, 19 Jun 2024 20:32:52 +0200
Message-ID: <20240619183255.34107-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Split the current .dts into two: the existing one keeps the name and
supports revision 2 of the board while patch 2 adds a .dts for revision 3.

Bartosz Golaszewski (2):
  arm64: dts: qcom: move common parts for sa8775p-ride variants into a
    .dtsi
  arm64: dts: qcom: sa8775p-ride-r3: add new board file

 arch/arm64/boot/dts/qcom/Makefile            |   1 +
 arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts |  42 +
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts    | 841 +------------------
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi   | 817 ++++++++++++++++++
 4 files changed, 882 insertions(+), 819 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi

-- 
2.43.0


