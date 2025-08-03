Return-Path: <linux-arm-msm+bounces-67563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1EEB1928F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 06:08:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEACC18849A7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 04:08:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5AC428AAEA;
	Sun,  3 Aug 2025 03:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lrT2MR6A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB3328A719;
	Sun,  3 Aug 2025 03:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754193584; cv=none; b=IyOaFUyw4/kgEEQ38MdNzQ/IgR5vTSEz1H4BjxQBCoAUx2hGWj0u0WlVTZ3ZVDO06i97B4w5aPgKhbFdRZSFwa/MvfHYrVAKzWyKWinOoW4BImrI84cdDT/5igzI6A5VQMlw2HWM9/bvNGgd4uidMs/mcTFISPwg4GoyEekOJdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754193584; c=relaxed/simple;
	bh=yPOQvC11lGxyyVTCaGqScENme6lmMis1h2qncjA181E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wi/H9g6akJty3Wx1mHJfuFBxxXtTr3y3AaxXrww9XM316YzqNHkHG96M4lTK6Z9zandeb1ZGCFQyBOG0kmER1aZxA4eWJ1nk0xwSPrQjNMepb2UvXSSCK7Lq9XiVeqaQr4tXU2yuaVL+EmIpgcEZi7hrBzrbxDLBYXqgcFPHaYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lrT2MR6A; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3e406ca2d22so10977155ab.1;
        Sat, 02 Aug 2025 20:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193582; x=1754798382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GwuwWG68g+QZ7vXSMh09UV2N2ibuGEdSUwCCEWlJHLI=;
        b=lrT2MR6AelR7gtTFhtGkNvbwMdMe7Kuic2E8sZbm9hUn36Ws7s0FV1C000ylsfr146
         S35zqPVxQRSB6Y2XlGSPdzhneE/mZc+Y7OhTplUK9TsyohU9jjYKcvKw2QlLBCf2TU1N
         zHO9Z/weVFz6ioKehZErloadMYzN+Rbz8cUiyqd585oh4Cnn5GbNlu6JTcazz9RCs5lK
         J6rNK9Mz4222xJPz9vF6c4/wV3Dt618r5L9olYj03UvOM8z+qomNhcrWJmgygXQm5kKD
         r4Vyv15CyGEv7IsxuKAKcIuhyopCNzwwoE+Q9I/8Lq/f186PsHQilVT4nvIeghfBrcdP
         1XYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193582; x=1754798382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GwuwWG68g+QZ7vXSMh09UV2N2ibuGEdSUwCCEWlJHLI=;
        b=IauOfIwyyCnp3oKQfGE/mupoU/AAtQCOD0OviKanlWHvt2e8ZcxCqJk0s88FG3bgA8
         JL7KtitphiyF4S6Qt+gfVvjUM6hkqtJvqjzRXzR4aV61xYPnnFYWs7T6f6iTEZGwbVa8
         /TYDFxBabPzcOXqHicAjXoGSSU3WmZaG9gb6Zj/QZIlq44LtE6JqwVKgI96yaW4/LF/C
         Nxa3whSltnUny62O0fr3U1weOTSNpPmirkeNGkxSJ4FE7p8+sKNbId9mmK8p9r8MgLmG
         aSK2uclX9qBqwLNR633VTGdD85m7xHSAq3n9mEfn2zxtnakrJoSbsT1N0LrcxY7nUkhu
         Zvug==
X-Forwarded-Encrypted: i=1; AJvYcCXl+dGzVptX8MjgDdkqrXQI6rYPY/Ed+ljyzowR5oD7RZgRWDxxE/CmGZL+/bL6mdf4ZFrNfJMT49TIxQf6@vger.kernel.org
X-Gm-Message-State: AOJu0YzpWW0GaT72s7myHz7TGI8l/V0ilav9B4VPbfHM/NjWMj7o+lzg
	ObnnSpWCP3h5x7l2O671aIFbKOCB4DVZ0LBKj/Eg9sSCgoYJrLH9YOSJqcCwonQ9tzk=
X-Gm-Gg: ASbGncv3UcdNG8OWBE4rVutA97hRVx/Y38mJmi1xSFhoFhDOm073aOdUXfVoZaO0CPH
	APcv9HQmQEA+LlzYAVSHU2fGtyYecHqhHviuRiU1KQr2o9UtPC25SbMyXs6wkdlaIgGxVmFt9ZD
	h2l4IIftlY/to98mIP+TxYLACLBKCzkYXly8dXOxWn6GXo055wWn//TnYoEWyxe4KnJ17SHH/Dm
	mediQN8VfCg63YVeatyQ70YLPqxD/IdDayk7xawAAKdzACkd5mYYGEd2r7Zb7gaA9F6928r1zDZ
	Ev5SMaf/Un5TaCnNWS+pERUo8BaVPtRit0sv6U3B+mvoVRz/RZYatFH7mm8ZilOgBtBCF+ANLet
	JNrljwciE+91d8crzQRZtVMDBPfLowJnP3w87KRQzNBCORJctIAimFebChrv8Tt2UAe+Nb+epEa
	loFg==
X-Google-Smtp-Source: AGHT+IFaErFuUf9RL3fjjyrvGPnDiEq4WAlpEJt6vAzu9IAFkK0y610sccboRpj+vz07MAgou68UmQ==
X-Received: by 2002:a05:6e02:318a:b0:3e3:ee1d:58e with SMTP id e9e14a558f8ab-3e41611c04amr94519705ab.6.1754193582396;
        Sat, 02 Aug 2025 20:59:42 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:41 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org,
	jbaron@akamai.com,
	gregkh@linuxfoundation.org,
	ukaszb@chromium.org,
	louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	daniel.vetter@ffwll.ch,
	tvrtko.ursulin@linux.intel.com,
	jani.nikula@intel.com,
	ville.syrjala@linux.intel.com,
	seanpaul@chromium.org,
	robdclark@gmail.com,
	groeck@google.com,
	yanivt@google.com,
	bleung@google.com,
	quic_saipraka@quicinc.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	quic_psodagud@quicinc.com,
	maz@kernel.org,
	arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	mingo@redhat.com,
	jim.cromie@gmail.com
Subject: [PATCH v4 47/58] drm-dyndbg: add DRM_CLASSMAP_USE to gma500 driver
Date: Sat,  2 Aug 2025 21:58:05 -0600
Message-ID: <20250803035816.603405-48-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The gma500 has 126 DRM_UT_* debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg that the module has
class'd debugs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/gma500/psb_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index 85d3557c2eb9b..dc72388ed08d4 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -40,6 +40,8 @@
 static const struct drm_driver driver;
 static int psb_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent);
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 /*
  * The table below contains a mapping of the PCI vendor ID and the PCI Device ID
  * to the different groups of PowerVR 5-series chip designs
-- 
2.50.1


