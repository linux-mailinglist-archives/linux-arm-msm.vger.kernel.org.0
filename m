Return-Path: <linux-arm-msm+bounces-50986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D4125A5C8F5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 16:54:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6AB7F1885C13
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 15:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ECD825F78E;
	Tue, 11 Mar 2025 15:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jUYLrZvQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oMTtGcfr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DB0wUPYi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bpztiaD3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B482F25F78A
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 15:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741708493; cv=none; b=U6DxwfqrqevwPD8YgOuz3h5QzxI++6Lqea9WzpP2RaHXeLitX0JXrZb7SHjEFzfN8bDFLt5ZOsmrjzkCzMC2GDV+rJbtx2cv4uzADeMHli3mAdivqza7xi/c3Hd9gsjDeiEiCZxe7hyYs9ihJDGz5BSpuV8/kQmTMwV0fQgIn/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741708493; c=relaxed/simple;
	bh=st+PwtgEFF1M2eZ2s2iu7XGhyKdl4+8Uq7Dnbu5bd4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lISGi1Yz52jT4wS2VEh5VWXVNQ7RwihC2jAfjJrqw86AC3msAjVV/jLFa/n9N27ZxKf5MBJeNF0aQEZIOvKFinmAr/94yvdYLcbehOrun16TRSWgGW7WpuPDxiYatL4KqEw8O0x03Ky6FsMseH9DT7kcgANQEwGVKgWzIysUySk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jUYLrZvQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oMTtGcfr; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DB0wUPYi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bpztiaD3; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DDA471F388;
	Tue, 11 Mar 2025 15:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741708489; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SD6ygI01/fPDxVzEEZt1paTHZDmC270izQmMA1HwWl0=;
	b=jUYLrZvQgwl60yOeRqczWsx1hgPv0ppVfONv7BAuPONdApTKXEg92Ss3/RrX6fJM8GSfzK
	Mt/ViFpPt1oAFRfXjAx5mVYNOzv+VzfR44LNBcM9FQ0jNARMBTCIh54nAF/kJyZaPaGmKx
	7f1fhdvqhc2lMt4APc47U1QbBkw3KwU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741708489;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SD6ygI01/fPDxVzEEZt1paTHZDmC270izQmMA1HwWl0=;
	b=oMTtGcfrgGLXuAXaTsD4hMi0JirI0Zej4pg3kP4ziJmcPWMbRLqnQwmE/Jx8UZlbs9a2ek
	rc4PJKMY5OXH0nCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741708488; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SD6ygI01/fPDxVzEEZt1paTHZDmC270izQmMA1HwWl0=;
	b=DB0wUPYiCtUmACOuQnyj6A6Txdf0EKqe3pgIxP9fBfzoo5sQjDt3ilIsID7xVJ3XSrlnDy
	Np8wxBaJrNio6M4RyETXv0dsSqvkqggPzSjv1TWl2yr/jFLks7GhsvZgDQBfoEcqC+g4T+
	+TjOgXtEijvLJ4Vba6C9709FLWEncMw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741708488;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SD6ygI01/fPDxVzEEZt1paTHZDmC270izQmMA1HwWl0=;
	b=bpztiaD3TPNOCyHtPn1EdkZqYa6je72CIEkpWL0uoQjEubiZB+9SAQyImnaHoA0d82PLQw
	6els4/jtqhJ9F+AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4BA80134A0;
	Tue, 11 Mar 2025 15:54:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SAsoEchc0GdUdQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 11 Mar 2025 15:54:48 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch,
	airlied@gmail.com,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	geert@linux-m68k.org,
	tomi.valkeinen@ideasonboard.com
Cc: dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org,
	nouveau@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	spice-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	intel-xe@lists.freedesktop.org,
	xen-devel@lists.xenproject.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 02/25] drm/dumb-buffers: Provide helper to set pitch and size
Date: Tue, 11 Mar 2025 16:47:06 +0100
Message-ID: <20250311155120.442633-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250311155120.442633-1-tzimmermann@suse.de>
References: <20250311155120.442633-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.30
X-Spamd-Result: default: False [-1.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com,linux-m68k.org,ideasonboard.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Level: 

Add drm_modes_size_dumb(), a helper to calculate the dumb-buffer
scanline pitch and allocation size. Implementations of struct
drm_driver.dumb_create can call the new helper for their size
computations.

There is currently quite a bit of code duplication among DRM's
memory managers. Each calculates scanline pitch and buffer size
from the given arguments, but the implementations are inconsistent
in how they treat alignment and format support. Later patches will
unify this code on top of drm_mode_size_dumb() as much as possible.

drm_mode_size_dumb() uses existing 4CC format helpers to interpret
the given color mode. This makes the dumb-buffer interface behave
similar the kernel's video= parameter. Current per-driver implementations
again likely have subtle differences or bugs in how they support color
modes.

The dumb-buffer UAPI is only specified for known color modes. These
values describe linear, single-plane RGB color formats or legacy index
formats. Other values should not be specified. But some user space
still does. So for unknown color modes, there are a number of known
exceptions for which drm_mode_size_dumb() calculates the pitch from
the bpp value, as before. All other values work the same but print
an error.

v4:
- use %u conversion specifier (Geert)
- list DRM_FORMAT_Dn in UAPI docs (Geert)
- avoid dmesg spamming with drm_warn_once() (Sima)
- add more information about bpp special case (Sima)
- clarify parameters for hardware alignment
- add a TODO item for DUMB_CREATE2
v3:
- document the UAPI semantics
- compute scanline pitch from for unknown color modes (Andy, Tomi)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 Documentation/gpu/todo.rst         |  28 ++++++
 drivers/gpu/drm/drm_dumb_buffers.c | 132 +++++++++++++++++++++++++++++
 include/drm/drm_dumb_buffers.h     |  14 +++
 include/uapi/drm/drm_mode.h        |  50 ++++++++++-
 4 files changed, 223 insertions(+), 1 deletion(-)
 create mode 100644 include/drm/drm_dumb_buffers.h

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index c57777a24e03..f1bd741b06dc 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -515,6 +515,34 @@ Contact: Douglas Anderson <dianders@chromium.org>
 
 Level: Starter
 
+Implement a new DUMB_CREATE2 ioctl
+----------------------------------
+
+The current DUMB_CREATE ioctl is not well defined. Instead of a pixel and
+framebuffer format, it only accepts a color mode of vague semantics. Assuming
+a linear framebuffer, the color mode gives and idea of the supported pixel
+format. But userspace effectively has to guess the correct values. It really
+only works reliable with framebuffers in XRGB8888. Userspace has begun to
+workaround these limitations by computing arbitrary format's buffer sizes and
+calculating their sizes in terms of XRGB8888 pixels.
+
+One possible solution is a new ioctl DUMB_CREATE2. It should accept a DRM
+format and a format modifier to resolve the color mode's ambiguity. As
+framebuffers can be multi-planar, the new ioctl has to return the buffer size,
+pitch and GEM handle for each individual color plane.
+
+In the first step, the new ioctl can be limited to the current features of
+the existing DUMB_CREATE. Individual drivers can then be extended to support
+multi-planar formats. Rockchip might require this and would be a good candidate.
+
+In addition to the kernel implementation, there must be user-space support
+for the new ioctl. There's code in Mesa that might be able to use the new
+call.
+
+Contact: Thomas Zimmermann <tzimmermann@suse.de>
+
+Level: Advanced
+
 
 Core refactorings
 =================
diff --git a/drivers/gpu/drm/drm_dumb_buffers.c b/drivers/gpu/drm/drm_dumb_buffers.c
index 9916aaf5b3f2..97cd3dcb79f1 100644
--- a/drivers/gpu/drm/drm_dumb_buffers.c
+++ b/drivers/gpu/drm/drm_dumb_buffers.c
@@ -25,6 +25,8 @@
 
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_dumb_buffers.h>
+#include <drm/drm_fourcc.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_mode.h>
 
@@ -57,6 +59,136 @@
  * a hardware-specific ioctl to allocate suitable buffer objects.
  */
 
+static int drm_mode_align_dumb(struct drm_mode_create_dumb *args,
+			       unsigned long hw_pitch_align,
+			       unsigned long hw_size_align)
+{
+	u32 pitch = args->pitch;
+	u32 size;
+
+	if (!pitch)
+		return -EINVAL;
+
+	if (hw_pitch_align)
+		pitch = roundup(pitch, hw_pitch_align);
+
+	/* overflow checks for 32bit size calculations */
+	if (args->height > U32_MAX / pitch)
+		return -EINVAL;
+
+	if (!hw_size_align)
+		hw_size_align = PAGE_SIZE;
+	else if (!IS_ALIGNED(hw_size_align, PAGE_SIZE))
+		return -EINVAL; /* TODO: handle this if necessary */
+
+	size = ALIGN(args->height * pitch, hw_size_align);
+	if (!size)
+		return -EINVAL;
+
+	args->pitch = pitch;
+	args->size = size;
+
+	return 0;
+}
+
+/**
+ * drm_mode_size_dumb - Calculates the scanline and buffer sizes for dumb buffers
+ * @dev: DRM device
+ * @args: Parameters for the dumb buffer
+ * @hw_pitch_align: Hardware scanline alignment in bytes
+ * @hw_size_align: Hardware buffer-size alignment in bytes
+ *
+ * The helper drm_mode_size_dumb() calculates the size of the buffer
+ * allocation and the scanline size for a dumb buffer. Callers have to
+ * set the buffers width, height and color mode in the argument @arg.
+ * The helper validates the correctness of the input and tests for
+ * possible overflows. If successful, it returns the dumb buffer's
+ * required scanline pitch and size in &args.
+ *
+ * The parameter @hw_pitch_align allows the driver to specifies an
+ * alignment for the scanline pitch, if the hardware requires any. The
+ * calculated pitch will be a multiple of the alignment. The parameter
+ * @hw_size_align allows to specify an alignment for buffer sizes. The
+ * provided alignment should represent requirements of the graphics
+ * hardware. drm_mode_size_dumb() handles GEM-related constraints
+ * automatically across all drivers and hardware. For example, the
+ * returned buffer size is always a multiple of PAGE_SIZE, which is
+ * required by mmap().
+ *
+ * Returns:
+ * Zero on success, or a negative error code otherwise.
+ */
+int drm_mode_size_dumb(struct drm_device *dev,
+		       struct drm_mode_create_dumb *args,
+		       unsigned long hw_pitch_align,
+		       unsigned long hw_size_align)
+{
+	u64 pitch = 0;
+	u32 fourcc;
+
+	/*
+	 * The scanline pitch depends on the buffer width and the color
+	 * format. The latter is specified as a color-mode constant for
+	 * which we first have to find the corresponding color format.
+	 *
+	 * Different color formats can have the same color-mode constant.
+	 * For example XRGB8888 and BGRX8888 both have a color mode of 32.
+	 * It is possible to use different formats for dumb-buffer allocation
+	 * and rendering as long as all involved formats share the same
+	 * color-mode constant.
+	 */
+	fourcc = drm_driver_color_mode_format(dev, args->bpp);
+	if (fourcc != DRM_FORMAT_INVALID) {
+		const struct drm_format_info *info = drm_format_info(fourcc);
+
+		if (!info)
+			return -EINVAL;
+		pitch = drm_format_info_min_pitch(info, 0, args->width);
+	} else if (args->bpp) {
+		/*
+		 * Some userspace throws in arbitrary values for bpp and
+		 * relies on the kernel to figure it out. In this case we
+		 * fall back to the old method of using bpp directly. The
+		 * over-commitment of memory from the rounding is acceptable
+		 * for compatibility with legacy userspace. We have a number
+		 * of deprecated legacy values that are explicitly supported.
+		 */
+		switch (args->bpp) {
+		default:
+			drm_warn_once(dev,
+				      "Unknown color mode %u; guessing buffer size.\n",
+				      args->bpp);
+			fallthrough;
+		/*
+		 * These constants represent various YUV formats supported by
+		 * drm_gem_afbc_get_bpp().
+		 */
+		case 12: // DRM_FORMAT_YUV420_8BIT
+		case 15: // DRM_FORMAT_YUV420_10BIT
+		case 30: // DRM_FORMAT_VUY101010
+			fallthrough;
+		/*
+		 * Used by Mesa and Gstreamer to allocate NV formats and others
+		 * as RGB buffers. Technically, XRGB16161616F formats are RGB,
+		 * but the dumb buffers are not supposed to be used for anything
+		 * beyond 32 bits per pixels.
+		 */
+		case 10: // DRM_FORMAT_NV{15,20,30}, DRM_FORMAT_P010
+		case 64: // DRM_FORMAT_{XRGB,XBGR,ARGB,ABGR}16161616F
+			pitch = args->width * DIV_ROUND_UP(args->bpp, SZ_8);
+			break;
+		}
+	}
+
+	if (!pitch || pitch > U32_MAX)
+		return -EINVAL;
+
+	args->pitch = pitch;
+
+	return drm_mode_align_dumb(args, hw_pitch_align, hw_size_align);
+}
+EXPORT_SYMBOL(drm_mode_size_dumb);
+
 int drm_mode_create_dumb(struct drm_device *dev,
 			 struct drm_mode_create_dumb *args,
 			 struct drm_file *file_priv)
diff --git a/include/drm/drm_dumb_buffers.h b/include/drm/drm_dumb_buffers.h
new file mode 100644
index 000000000000..1f3a8236fb3d
--- /dev/null
+++ b/include/drm/drm_dumb_buffers.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: MIT */
+
+#ifndef __DRM_DUMB_BUFFERS_H__
+#define __DRM_DUMB_BUFFERS_H__
+
+struct drm_device;
+struct drm_mode_create_dumb;
+
+int drm_mode_size_dumb(struct drm_device *dev,
+		       struct drm_mode_create_dumb *args,
+		       unsigned long hw_pitch_align,
+		       unsigned long hw_size_align);
+
+#endif
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index c082810c08a8..efe8f5ad35ee 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -1058,7 +1058,7 @@ struct drm_mode_crtc_page_flip_target {
  * struct drm_mode_create_dumb - Create a KMS dumb buffer for scanout.
  * @height: buffer height in pixels
  * @width: buffer width in pixels
- * @bpp: bits per pixel
+ * @bpp: color mode
  * @flags: must be zero
  * @handle: buffer object handle
  * @pitch: number of bytes between two consecutive lines
@@ -1066,6 +1066,54 @@ struct drm_mode_crtc_page_flip_target {
  *
  * User-space fills @height, @width, @bpp and @flags. If the IOCTL succeeds,
  * the kernel fills @handle, @pitch and @size.
+ *
+ * The value of @bpp is a color-mode number describing a specific format
+ * or a variant thereof. The value often corresponds to the number of bits
+ * per pixel for most modes, although there are exceptions. Each color mode
+ * maps to a DRM format plus a number of modes with similar pixel layout.
+ * Framebuffer layout is always linear.
+ *
+ * Support for all modes and formats is optional. Even if dumb-buffer
+ * creation with a certain color mode succeeds, it is not guaranteed that
+ * the DRM driver supports any of the related formats. Most drivers support
+ * a color mode of 32 with a format of DRM_FORMAT_XRGB8888 on their primary
+ * plane.
+ *
+ * +------------+------------------------+------------------------+
+ * | Color mode | Framebuffer format     | Compatible formats     |
+ * +============+========================+========================+
+ * |     32     |  * DRM_FORMAT_XRGB8888 |  * DRM_FORMAT_BGRX8888 |
+ * |            |                        |  * DRM_FORMAT_RGBX8888 |
+ * |            |                        |  * DRM_FORMAT_XBGR8888 |
+ * +------------+------------------------+------------------------+
+ * |     24     |  * DRM_FORMAT_RGB888   |  * DRM_FORMAT_BGR888   |
+ * +------------+------------------------+------------------------+
+ * |     16     |  * DRM_FORMAT_RGB565   |  * DRM_FORMAT_BGR565   |
+ * +------------+------------------------+------------------------+
+ * |     15     |  * DRM_FORMAT_XRGB1555 |  * DRM_FORMAT_BGRX1555 |
+ * |            |                        |  * DRM_FORMAT_RGBX1555 |
+ * |            |                        |  * DRM_FORMAT_XBGR1555 |
+ * +------------+------------------------+------------------------+
+ * |      8     |  * DRM_FORMAT_C8       |  * DRM_FORMAT_D8       |
+ * |            |                        |  * DRM_FORMAT_R8       |
+ * +------------+------------------------+------------------------+
+ * |      4     |  * DRM_FORMAT_C4       |  * DRM_FORMAT_D4       |
+ * |            |                        |  * DRM_FORMAT_R4       |
+ * +------------+------------------------+------------------------+
+ * |      2     |  * DRM_FORMAT_C2       |  * DRM_FORMAT_D2       |
+ * |            |                        |  * DRM_FORMAT_R2       |
+ * +------------+------------------------+------------------------+
+ * |      1     |  * DRM_FORMAT_C1       |  * DRM_FORMAT_D1       |
+ * |            |                        |  * DRM_FORMAT_R1       |
+ * +------------+------------------------+------------------------+
+ *
+ * Color modes of 10, 12, 15, 30 and 64 are only supported for use by
+ * legacy user space. Please don't use them in new code. Other modes
+ * are not support.
+ *
+ * Do not attempt to allocate anything but linear framebuffer memory
+ * with single-plane RGB data. Allocation of other framebuffer
+ * layouts requires dedicated ioctls in the respective DRM driver.
  */
 struct drm_mode_create_dumb {
 	__u32 height;
-- 
2.48.1


