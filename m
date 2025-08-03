Return-Path: <linux-arm-msm+bounces-67570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B959B1929C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 06:09:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FE0D1898F6B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 04:09:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 545CE28C035;
	Sun,  3 Aug 2025 03:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OY/FUXSF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04FC28C01B;
	Sun,  3 Aug 2025 03:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754193595; cv=none; b=I11r7lRYTsbxauGDUoUm74oTwl0jYcej+MDhUsqyDlwFK71d3Yr656xSZXpmbPdXjbTiLX4NQ+RiyfCTJVhoLfFO/1TbilIQYi6auPeeeMQflU1Y05F2YBxX5E1EtfPf/F5a13aTXIfY3Pe650FGAJs4K3aV8Wb1gG5xWUkYS8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754193595; c=relaxed/simple;
	bh=hqMVdGr72w667hB+DFSofV3pMlb3USxVvkpVSb8uY20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PEqmQBJt/+j148Yp6dXu7S63RXvko0wr+g+yp+ACqhu1QrKYD5GbMRxsXJ0bvd1y9IrVVUF9t0fRy6uEwPdjPW5T0ZLmVXKSn6idu6uLeQexTZAKZoxCfU7gLOU3ZxgcYvUltqrIUUfMJ/nGjlYRMmxTgHGxQKvIgWPJpd9XqY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OY/FUXSF; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3e3d0cba6a7so12047585ab.0;
        Sat, 02 Aug 2025 20:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193592; x=1754798392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UUd0OZUdA8b96Ytm4NIRmXIDrelAvQRst6I1taJ2Nl0=;
        b=OY/FUXSFMwsyqA1fj/sRVoAxdyo8UFE90bbxNN0vM1CcWTQs8qxUBKPgq1VsINVnj/
         zm3N0u48nNMf4C2hB6ggkOGNZWFCDwMO6ZMEvH+cyF4Gy1xOE1lXfUepNufYteusFWyR
         kNFXezNeYmOvWL27iAEnzd8+gHQltdUkwZLGy5i0WxKMsNHWR+RXE7ucexvOLKZOZYBz
         xiHa38eGV8mkiHClP2CB9xUlSI4NQ7XX6MOue99hD+yKmMoY5qgIUShwTUlDFqf90vuC
         8gh7WeYS/AH6Am3G71GUG8KjWXoT9A1sgzR6r8FDG08HghDoOU6vB/zAPqIu9jPSDTYj
         y8eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193592; x=1754798392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UUd0OZUdA8b96Ytm4NIRmXIDrelAvQRst6I1taJ2Nl0=;
        b=reDRcqRiVjFeiw+GjSnuoit8YhhWKjlHD/ZBKFMlcms3ZUMchRSwyNhyIRJwwl+4x6
         jZtGIn0USNbv1Z8yiwd02gO4L+J6YmjXYRozsZYzyZ2ly3bpOeSIRSGOwuSePOoz4R4f
         3V/pjbX2JgP0916sBj9MiX3G8pw+YVjA1VLHkw5y5ngMM7iHo9dfcHv9BbF1vU/fD3Dq
         hj9eqePiCW5X1jlVVnQi++YrZKop1I5cgtZCXLnrhZ10s6UZK0CoUOgFbbZ2KS/PPiu7
         Ps7EVHsIln8vG5Z4dVcqFCKoHIcEq3KGL1Wq3pNqLMW/5v1/dvEKaAnyatY3qgP0IIIr
         V9qQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8U0qK831qXVZj0gVX5sedb4uZXqvzYrd6GM3J3wTqX0cgXWeyabZKOa3E7BvYyVbL5YO9TdvfTXUtHTac@vger.kernel.org
X-Gm-Message-State: AOJu0YyHpjLZ+qjhG6mfsvYYFRHN7j1Jq36MDs34dUY7vAG4nnAUz7Um
	Fzdu8AysooF4SWI2M1PZYdEXLQgvUlHbS0S/xOorLKs45+QOG6NfymTX8VtwIlXhzAE=
X-Gm-Gg: ASbGnctEc3C+Hk6xAdMNe+N7AeUUZrPpcuybBjOiZ/oAt/b8fULNYdgWwbs6/RBADCc
	ZALYL/2EJuly/Q7mkHwhwBPYbseXcIIxHon4K2Oc8ys4Mrib92ZbVao4z668fT6M17lpvIM3nUE
	SmB8fR3t+vrUSN0rW+ZikRIVklpNU84ykda6r8zsxKpdpX5YP3dvWRaoYgk4WsJDosbxFQlbjTU
	a316mENp2gmwLtTi1pKNSf5B8TkcdPj7toWHNTi1IPsRLcWCunIMRcylJvstFLBa7y49wYMVUVT
	9UELRJi5rQx1ZT/xErIRiqiFk9bA4p9/T5AixNaLxZiki0SPpuDj3KwWWYDLwnvy98gXxfkBlhA
	5xPQm+W9XLEZL8L+D9fu/3iLyvumRhe1V/7vKi1+sPEOEIXWcK2WF+dFGuHGy7sK449Em4upqps
	uJ+Q==
X-Google-Smtp-Source: AGHT+IEyhw5mUB/eNoeEely1BTFanJ4yHz9P0sfCu6Pe+TFRcVR4LSDg6aFmHhG3P/FtSBF/ZASr8Q==
X-Received: by 2002:a05:6e02:1fe8:b0:3e4:b9a:8ae7 with SMTP id e9e14a558f8ab-3e4161081afmr88579355ab.7.1754193591790;
        Sat, 02 Aug 2025 20:59:51 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:51 -0700 (PDT)
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
Subject: [PATCH v4 54/58] drm-dyndbg: add DRM_CLASSMAP_USE to the qxl driver
Date: Sat,  2 Aug 2025 21:58:12 -0600
Message-ID: <20250803035816.603405-55-jim.cromie@gmail.com>
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

The qxl driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/qxl/qxl_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
index 417061ae59eb4..c18577a3153d6 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.c
+++ b/drivers/gpu/drm/qxl/qxl_drv.c
@@ -66,6 +66,8 @@ module_param_named(modeset, qxl_modeset, int, 0400);
 MODULE_PARM_DESC(num_heads, "Number of virtual crtcs to expose (default 4)");
 module_param_named(num_heads, qxl_num_crtc, int, 0400);
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 static struct drm_driver qxl_driver;
 static struct pci_driver qxl_pci_driver;
 
-- 
2.50.1


