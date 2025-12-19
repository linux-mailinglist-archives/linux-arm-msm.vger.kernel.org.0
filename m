Return-Path: <linux-arm-msm+bounces-85954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF44CD17DC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 19:58:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 10B0B304D8BA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 18:57:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FFA634D39B;
	Fri, 19 Dec 2025 18:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="22a10ujt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1F734CFB2
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 18:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766170003; cv=none; b=moWnmArJewbYF5LD+A0tKxS/WC5KQW0kmzFX0OXchS6tAq/YY2FaUd0ddESsvZxavZId9t5TuplZnrBaw4i1YZYKG8e+3MhPtP+xx1BBRELXixnDAvaGO6M3WhJBvway3vvNXQWREyR3txyQHc2hKw/BRV1bJP+Ulnys3smR5yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766170003; c=relaxed/simple;
	bh=vbT+Njn6DFbyYALm5MYtbVz/lyha7DeM0qv5LF1ZGXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sC4Qf5ZEi+Zsw32BDy2qFd2QRQk18Ddd5hOuQq5K7VHlJbEaw42topSDweq8qLlHglZWsJp8jjj2qE9VugmS/fwgI9G/RbpGyNKRIGWYqpaxxItf2BH0Af3GCiV44vzKkNQHrTmxtZ+bSKLefwwvAzBdYwdP9V3Sk9de9Re9a2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=22a10ujt; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=KkOJLpKJ3ve4/wkR9FRnBquhnBEyzIY3X/rzFvKFdjE=; b=22a10ujtH0U1KSgP+RF+iEmw0p
	QnpexoodmOzPI+JMkp5nZcnjE8OSdss3A0+pxg4Ha0vyOdxX0zyLNTwKsasnROymhifkrMOTL9aIh
	BRP6T9ueT0HF2uOnWq3s2Q13ErGrYdD4vaQPpBZJisEg0+p1pH1t2PyrKnrgn3YnQ/zg/TC3et9kJ
	ZTljmf8AkrIvMoruKgE9SjPGa6ZX9PiB39nRxKG4r7MQEEIJFQHIFz3d8PDvir+zssnPYYdlquvm/
	LsfeeRD9UAwAWmmvJQd34DG1OdSFw3VzSNxiFcPRpLSHWXI+1DtUIowszEIiKNXibqN8wgyvT0RsX
	fv84vDGA==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWfUu-0000000AqkV-40ur;
	Fri, 19 Dec 2025 18:46:41 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 01/19] drm/msm/disp: mdp_format: fix all kernel-doc warnings
Date: Fri, 19 Dec 2025 10:46:20 -0800
Message-ID: <20251219184638.1813181-2-rdunlap@infradead.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251219184638.1813181-1-rdunlap@infradead.org>
References: <20251219184638.1813181-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct and add kernel-doc comments to eliminate all warnings:

Warning: ../drivers/gpu/drm/msm/disp/mdp_format.h:27 This comment starts
 with '/**', but isn't a kernel-doc comment.
Warning: ../drivers/gpu/drm/msm/disp/mdp_format.h:64 struct member
 'bpc_a' not described in 'msm_format'
Warning: ../drivers/gpu/drm/msm/disp/mdp_format.h:64 struct member
 'bpc_b_cb' not described in 'msm_format'
Warning: ../drivers/gpu/drm/msm/disp/mdp_format.h:64 struct member
 'bpc_g_y' not described in 'msm_format'
Warning: ../drivers/gpu/drm/msm/disp/mdp_format.h:64 struct member
 'bpc_r_cr' not described in 'msm_format'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/msm/disp/mdp_format.h |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

--- linux-next-20251119.orig/drivers/gpu/drm/msm/disp/mdp_format.h
+++ linux-next-20251119/drivers/gpu/drm/msm/disp/mdp_format.h
@@ -24,7 +24,7 @@ enum msm_format_flags {
 #define MSM_FORMAT_FLAG_UNPACK_TIGHT	BIT(MSM_FORMAT_FLAG_UNPACK_TIGHT_BIT)
 #define MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB BIT(MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB_BIT)
 
-/**
+/*
  * DPU HW,Component order color map
  */
 enum {
@@ -37,6 +37,10 @@ enum {
 /**
  * struct msm_format: defines the format configuration
  * @pixel_format: format fourcc
+ * @bpc_g_y: element bit widths: BPC for G or Y
+ * @bpc_b_cb: element bit widths: BPC for B or Cb
+ * @bpc_r_cr: element bit widths: BPC for R or Cr
+ * @bpc_a: element bit widths: BPC for the alpha channel
  * @element: element color ordering
  * @fetch_type: how the color components are packed in pixel format
  * @chroma_sample: chroma sub-samplng type

