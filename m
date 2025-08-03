Return-Path: <linux-arm-msm+bounces-67565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 764E7B19294
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 06:09:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA0CD3A75C4
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 04:08:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2400928B4EC;
	Sun,  3 Aug 2025 03:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q1eUTSDz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E543242D9E;
	Sun,  3 Aug 2025 03:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754193588; cv=none; b=aIVwXLl8x053SPg4vlanbFwqpHSdMcgFzmVm5yTegO8w0/oXZLvBkgh1wad/xm+6PDyRLHQ+E1kzOiCEZpPi6Tdh0pqe6AEE10GZKIL3CAMs2CAlxtsYzlDJGiufE6HwiFw5jAD4IdG0cQXl5qQc4xK8Pvk38uIoVEceFzgEkRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754193588; c=relaxed/simple;
	bh=gmOXj8fzw3jBsxjlDVxd5CorDTDpPquxoIawKB2G0xo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dy1whD4cqMBh2GJ9+lQh8dksVFLTUF1o3nIrVCz8yb2inl3SuXMKshvvtY+3Glvq+1YK/5tW8QI5nc8SGqDYIP+MHX1aIendJ0OdbVpfUDGPNntNyW6JKgngz5v3rzQyIYtjwvDlCf8ETYQAGMHyTSzOUfmGIqmXPySU1Wb2hC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q1eUTSDz; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3e3d7b135c2so40564605ab.1;
        Sat, 02 Aug 2025 20:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193585; x=1754798385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=elSrGuxO7Gdrr9JiYJ8JX6gnRfA3s/NTbfdze1JVBo8=;
        b=Q1eUTSDzo8rKMqsSOYrYMadz7htbveUGtTw45DvA2xV4xl3TtjDIz5N7DXv5yV5I+L
         wFPhl49I8zfhSFJJu0uLxpasnPAx/tj1TlSn81MAxPWPvI33pMbpnpyVdEww1CyZawG6
         GeC1+ksPM9q5FzrFzEpnY9mgcNKSs2Q/CWPSHjWLbVmzj4T4J6YBLHoGLPlssoOEuzbS
         9wQKfTcg5S7ea12vY2VjQnBt5CZSce60ti31AwPTGzAoF+SXkJyYEusLxXP9/CapbLLH
         mUXKDaHW8YiJgWmTYHzQIXOuLClTV6lB4bjtLyG5H8CBosFpBxjSyzYLKwZBpW+iTRXU
         g+xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193585; x=1754798385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=elSrGuxO7Gdrr9JiYJ8JX6gnRfA3s/NTbfdze1JVBo8=;
        b=i79So835BQNAM0Kp9K5jY8mb57Ya9IJ5Dx04jUkWBnpbM5V6Ea108q/AfVgumZS8JC
         7aYeKKIeWYrD3aB5oRjkBsOhevTGIoGM4WyVoXq31R/drPQS2cO9HM7SYGn1cMlqc72h
         ibW9DmJ14u4KqEFxK/I9DEl9hH3wpzWOOCFoiMf5UvwB9zrRE4qVaFVofby4DqJzUDBV
         zfjZ/Gy4IryWhwkb4IakHE6/QomDQSUZE9/WBYH9IXiqZQligFFNHz/1P0AfVUl2sYnP
         oMXbMPAK9KhjWy2I6Q08oDwGMLJ2MVy9exNB/Ik9LgD7TEUiPvzG+eJPO7qXbnaAvWaQ
         CRPg==
X-Forwarded-Encrypted: i=1; AJvYcCVKgTfRDTxg0j2ZmSoV2W6yqFR3AFl0nOBtINydnZxpakmg1o+jZReBR7hUpLu0rVOeUS5WsJFGvhgnoZs6@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7k0HR3v4+Pm9W27C0AvmzEoAF50oYD+YBXZzhh7O3ApmA6A4a
	Aa29IhPEi4YoY5ldGK9UpCZO8eZOUhx1utQqqth9yXyKQQ3ccDdNtSJ/QQjeKALMm/s=
X-Gm-Gg: ASbGncv9InlVIoeTlc6oQtkDUT1gMuCwVZ58mLNSN5ItMiUVviGRMuYvCQZAgV4+qkk
	al4WRBsLXE9+Z/Hh2vM6vpbLbx/usqf06c4CgRhR6iZNC5L9INtihuntC/uMiX9cZBmZxmfmjRk
	+CwADK3mZM13nI35R7S+j4md++ZZGYOrimsXV2SB4v4MkinZmwh358GNiUdBnPAe7a2Hb1/U7xj
	x0sP6basWhN45Hy42YpA9UAm26DHPxu4oeV46bLa/GkJwMhP5FxaVzy7lvA5TRv06ymaDrGkle/
	3yueEIcg11z02WSS4nVdngH1IMAyK1D4oV4TKHhK2QludUk0OByre6FbaAml6/VgyBUUjZyB1Wm
	m43C/TlNT6Do3IJ6t7lK+7nqHRpiRdbi1/+qdQ+3QpYnr6XCWfCXKFlMo05bikDYmGUW9CDtW4x
	6gjw==
X-Google-Smtp-Source: AGHT+IH2v/yHbrftOiZCv+3aNfsvxCzIweIV2VBjxfjxpqhUxRJcHX4wYrnxPDdmodWbE9uh3slotg==
X-Received: by 2002:a05:6e02:1f0d:b0:3de:25cb:42cc with SMTP id e9e14a558f8ab-3e416192458mr92390555ab.10.1754193585333;
        Sat, 02 Aug 2025 20:59:45 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:45 -0700 (PDT)
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
Subject: [PATCH v4 49/58] drm-dyndbg: add DRM_CLASSMAP_USE to vmwgfx driver
Date: Sat,  2 Aug 2025 21:58:07 -0600
Message-ID: <20250803035816.603405-50-jim.cromie@gmail.com>
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

The vmwgfx driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 5205552b1970c..24e9f6fde1bbf 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -259,6 +259,8 @@ static int vmw_probe(struct pci_dev *, const struct pci_device_id *);
 static int vmwgfx_pm_notifier(struct notifier_block *nb, unsigned long val,
 			      void *ptr);
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 MODULE_PARM_DESC(restrict_iommu, "Try to limit IOMMU usage for TTM pages");
 module_param_named(restrict_iommu, vmw_restrict_iommu, int, 0600);
 MODULE_PARM_DESC(force_coherent, "Force coherent TTM pages");
-- 
2.50.1


