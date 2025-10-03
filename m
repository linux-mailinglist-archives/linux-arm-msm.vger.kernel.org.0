Return-Path: <linux-arm-msm+bounces-75875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 46376BB679E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 12:42:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC6643A6770
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 10:42:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70D5E1F872D;
	Fri,  3 Oct 2025 10:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UHCmYzwA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4D1EAF9
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Oct 2025 10:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759488161; cv=none; b=YNGdd89O/LRkv9F1MkOPA6yHYZXB54kxIVln/xcx+m/3bHgtYszVx0j7Qmcqagi28LFz1uNgsJ+mz3WqJ9YrHgu/2x6+vgOL2uSot/FNlIAl7FkqMvop4bnm3D8Pxym6kd1E3d2gwta3Lyone8SLxwzcpKCdHLI5D4QJzt9E9GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759488161; c=relaxed/simple;
	bh=1ujUcI8JT5fEE9W05tJdMgxsNlmTsx+SqWLtO1IBcdM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HUaLoPqXvzta+r4f+mBF6oMFc+HLSDlsdqpF/BGHfCRLj3eJciJ1f6X9QHFxgAmPlWgJYhPEMX7AwYil4d11+517B+CYRO/rWhz+GxJGs2SaNdzEMfqA3xL0EK7oNrc5kYIS63dViZ435jbR8ABZe5OPHa4lVjpXuKEVLSyER3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UHCmYzwA; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3ee12332f3dso1775363f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 03:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759488158; x=1760092958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cnw7imX7M/CNGtCIwlRgS7wbYgVU7qXQP5LaS4EJjWw=;
        b=UHCmYzwA0VB0p8p/KMh1AhE7moAKbJpl59IKW7kshoCiZAaHBus83AQEEcHE2Dezk4
         GeEyyUFuJD2Ep16KD9Y+ISH19wL9t6cEaVmlliwcFUoW0r8MyTk2Anjuw/MNJr/JpI8P
         E0i2b4aQs86l3KLA5Xl6WPP0+WT24oBnuO2RliRbCQLhjwu1NPQIjJBj2FCPZIsB/AbY
         dGLbkMllX1KpAxDRtRgAU6NHDsc1Po/iEyMUixiP28C4Yz8r9EirsoKBBRT7gmVtwYWW
         ulCQT2P6dNtfI6zZ7iI9ELvsF+b/2vTdn9ta1RazEgmKIQ+/vAQ1GLMuD2jjRBxY1H2/
         dkEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759488158; x=1760092958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cnw7imX7M/CNGtCIwlRgS7wbYgVU7qXQP5LaS4EJjWw=;
        b=E5zaU2uB+q3EvdXKuPD4srTK2hFFlbLE1BZ2iFNJvFpQaV8n+TXeSQpYiK3wZmE/+D
         vjtGG1j790wNxH+Z27iHFRP7XejwQi5AThzx0rMgCSXJuoyvV8iRa9mVMRTx4helZTfZ
         kC5EMPwe88E4Ja2TQpe6iuWvggtNmsuYaCRcIIqQY+pcQNFZ5/xwOGf6orqquHP1U+Nh
         UVUH7DFDUa2F2Y38cwEM5a6Bny8CPt1du9JEmOyHJ7sZBqqPeu203uOcLrMPNUvzuje7
         XO3CHqLShVyrrZ/ebPD9DpfSV8R1LZHYo+3K0d3jeyiHKeXKSGMX2QAPnSAM7xLrvitm
         3V8A==
X-Forwarded-Encrypted: i=1; AJvYcCVUAcy/D8gEvyWD4odteYelAeVMp4r0TfyGsiRa+w94LNJemwYN6XtuVT5bKhkON1qXvnxBEqv0h3VmdzOJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxzvrIE05m6RpuzXbIrozXcCgdTnSJfgxqjv3ofoW3lx/f287oX
	pG/hX2ZsOO7VUcMZWMc1VuaROgrPBHEZP/F/imIa0PKWtgR8FoRfO2iD
X-Gm-Gg: ASbGncsdscrWgAKOBHM17oDiiF4K4RL40N5EsNADPjY9jFVRGNJLHZXmTAMK4ccPReP
	Y+T36mSY2ipSLY91uEB7B8cNLqGajQ5FPFmS5Ltkb0bzjMRFcbPco1tp6L/JQX95dJEYQ95n3WW
	aWIGs5fmFZOV1TvZ/PpM2OINDFxcbcqF2s3xYcTig9YSRshwPDYQ5RsuCCufDDIinykU+OIJxFs
	0ytdaeZ0kycCxBSwk7Ig6zuIDPbHLhtbx3eG71k0TEBNHO1ONNl805tBCjEVgkbHfZ5gUP7xak8
	nB3rDNdBdV5/ulSBxNBdopSrUMRtu7UtQrpgR4u58WHITIicI12MRsp9D99Yj4vsqHj2A/8Gkof
	DlfQNj8jw0I6Iv240lFmAa7i03XaiewZxBFULRmBsSvSBPXrAJBKefzVYsSG2NW4/xcylbI1ZN3
	sSKYAAF8789RdzNbkb5s16R0hejdPNRBCoXySuBpZ2N16uZG00PUPPUup/kgaRarfcVF0yndAlt
	KvlVTlajygdlmn3DSBDgJEUZgfwUWlBGuF7ps5a/yIGNJDKBqeJsL3G4MUxVkRmUmL5d4w=
X-Google-Smtp-Source: AGHT+IF3xeXbZRFfku8QnhF5YXHdX9BHpydCf/IP5uk05F4Qxom3Ww42auvnGEy/5SBToB7bjHwQOw==
X-Received: by 2002:a05:6000:184e:b0:3ec:d926:329c with SMTP id ffacd0b85a97d-425671c17cemr1665274f8f.56.1759488157951;
        Fri, 03 Oct 2025 03:42:37 -0700 (PDT)
Received: from cypher.home.roving-it.com (7.9.7.f.b.1.3.0.b.8.f.0.9.e.0.0.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:e9:f8b:31b:f797])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4255d8f01a0sm7461882f8f.48.2025.10.03.03.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 03:42:37 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Sumit Garg <sumit.garg@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	op-tee@lists.trustedfirmware.org
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] tee: qcom: depend on ARCH_QCOM
Date: Fri,  3 Oct 2025 11:42:32 +0100
Message-ID: <20251003104236.1813979-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a dependency on ARCH_QCOM, and compile test, as the driver
depnds on QCom specific Trusted Applications (TAs) and it's
only, currently at least, supported on QCom hardware.

Fixes: d6e290837e50f ("tee: add Qualcomm TEE driver")
Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 drivers/tee/qcomtee/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tee/qcomtee/Kconfig b/drivers/tee/qcomtee/Kconfig
index 927686abceb15..9f19dee08db49 100644
--- a/drivers/tee/qcomtee/Kconfig
+++ b/drivers/tee/qcomtee/Kconfig
@@ -2,6 +2,7 @@
 # Qualcomm Trusted Execution Environment Configuration
 config QCOMTEE
 	tristate "Qualcomm TEE Support"
+	depends on ARCH_QCOM || COMPILE_TEST
 	depends on !CPU_BIG_ENDIAN
 	select QCOM_SCM
 	select QCOM_TZMEM_MODE_SHMBRIDGE
-- 
2.51.0


