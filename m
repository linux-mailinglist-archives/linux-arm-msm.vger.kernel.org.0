Return-Path: <linux-arm-msm+bounces-103507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJoQKXYC4mna0QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 11:50:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A292419941
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 11:50:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7F06D30C0462
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 09:38:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5986C3B47CD;
	Fri, 17 Apr 2026 09:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ysZL/ic8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09812375F82
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 09:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776418674; cv=none; b=QuYfbI76UZGsu7BaSsiM0vzPsMvSOnnKpexUSHYVNTRrF6KSGPfQNOvkqu3DX2rxHIuaFcTgFQoFnNe6uN+3X3FpeJFIKMne/tV+ipKIdfqRPI15vAiq5NlZtLqR7DdZb3M1nkA618SvhAhKWWmyliWMZUcMv5fJYbcEFt7fQQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776418674; c=relaxed/simple;
	bh=d9uRXaLdyFWWRpJT+htD5WetYhp0U6x8tsZUnkHSdQs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=De1SG8MkSo9+9Gh5MMMDVzlrge5Hw4uFP3gs/n06/Ppj4VKuBgzfgHRKytH3cE9M8793reRqDIM/1y0xluSkw//er8selYoEfo1G2RDjHaB9QMl7nyG92B+2cuazpjJuefBX4zsZ+cFrI5g3UMzvyHM6QvPgRnnBeh5mlG5kguA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ysZL/ic8; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so3140965e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 02:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776418670; x=1777023470; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qmLWdZEsMa5osbUvm5RbW/e0ymGFNTcUQWqcDHN80mM=;
        b=ysZL/ic8TxeYq7mgNKyF4SafnjViDxhVtxuxYfY1cl9EBPtFdOpJK49N7yG6/Ix4fk
         /BwRaM1kcbaaDYMys6rbl2WdC6TLerPrGkMcRaRyWjJ65rioIQNa1Sv7KdAAAUJFvC6n
         HUDYvBVQnlqKYxHcLQXNOqWRYDcoOKiqYy/JzsoEwjq44RXIpDwjrQhHRXq1hL0Z749j
         BHx8LP6wy4JqIY+n93K5OxJ1D5JtsseNWCO9M/mphXde7+T/Ma1OpXbxUWk+LKnY7fpc
         AgqhWqe1+1VPiUutnFdaTrs+8wfRw+EfMJ9ss+0PRu++/+UAkITWCs+sDzpNepBh5i5/
         8jDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776418670; x=1777023470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qmLWdZEsMa5osbUvm5RbW/e0ymGFNTcUQWqcDHN80mM=;
        b=WgGhg5z6911fPmYox4keeJqrdYelaRY8vjh+RJ4E3j15V7hESVx2wVhek8n48HWLnX
         24gHZ29KXraNh2jc4iqomVsf1fzLhZb29uCvrzULHfGkuDMrDRh0HL15NaE05Ikg4j3B
         wlLwITyebePnOmOAxN0V573/lRQFTd2m06duzQlYX7FiLzKjWZ4nX2+705w2LsFG6LiI
         m3nPN9JQNr5/tVaaxOTD5ZafUa7y6zFXyf6A31G0YBCFmVJNFEFkguAQeIqKEz9khwxg
         XUtGUUSctAiC/V+tJ6Y+pSD9Yv6MYsjpeH7dxNH/k0sVifTzptP9typ4sVaeQtS7S0xY
         QPig==
X-Forwarded-Encrypted: i=1; AFNElJ9zM7zTsYP0wF8OAZkHTMJXDAXFCmf4QWa8tKm3GZuSpcCS8b2eO72UjPJQKPeSjQKh+qERPDhzO2ttvtkN@vger.kernel.org
X-Gm-Message-State: AOJu0YxKcRkASeWOUIjsVgUrB2Q8cOuF5k24IxCkOtGem4RsFQ5DGvxk
	ilHu0IWX9BYPa27VONCWU3yTyMuveOY2MgG2TkC+dIqJDOTE+nWGyO1RR1OSXsFtwdQ=
X-Gm-Gg: AeBDievMnugiu1AivihZqRCB7B6LEO7yN4FmOai5OBAEvZNoTK4Iwkb54en1nOt2UUv
	8VDqKTq0O7AXk7t2HxT4O6bkEfA4rflbS9FMecWAOg7Tr8EqJAvKndPgwwAq8yazOMXW2edVukV
	RTAhfwsWJ3UlM0qZgOrj3wFGu2/zyuAC8WV78wvdB8oCo20wBLOn+vpHDEZ9u55TCbONOeRKMiU
	JtvuBGiARdn4gzTe6gkqgUojEDPv7hPDBOoFu8D4+SEwK2dT4AhrXf5500taH88jN4yIyS2u665
	JVwIt2yVyAe5+FtR901iLOmdMSXRobO5QYwKKiq9Pb9BFc7fiCLVVx96za7Ohdkw94kWT55Ixq5
	BctjcBnNstZr3iW/DDDVKHff3eaPJIeEpkxo5dsAj4YHuPfbdWdY92VFiWGfU4KHNyo25Mbrlb7
	YdWF61b6z9NbZiF9Q65uBWO8XeINwBNScmHP2RO0ryzJQJ4VaP/Fa+PwM=
X-Received: by 2002:a05:600c:4e16:b0:488:d6eb:e63a with SMTP id 5b1f17b1804b1-488fb76fe73mr29078455e9.14.1776418670342;
        Fri, 17 Apr 2026 02:37:50 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb7b2634sm12915435e9.28.2026.04.17.02.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 02:37:50 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 17 Apr 2026 11:37:42 +0200
Subject: [PATCH v2 2/6] media: qcom: iris: add QC10C & P010 buffer size
 calculations
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-topic-sm8x50-iris-10bit-decoding-v2-2-c987b65a31d5@linaro.org>
References: <20260417-topic-sm8x50-iris-10bit-decoding-v2-0-c987b65a31d5@linaro.org>
In-Reply-To: <20260417-topic-sm8x50-iris-10bit-decoding-v2-0-c987b65a31d5@linaro.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=10187;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=d9uRXaLdyFWWRpJT+htD5WetYhp0U6x8tsZUnkHSdQs=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp4f9pHBx8Vw9i0s7t+/VLzm4eYh+19POBDWexlvOt
 Kx1zfCOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaeH/aQAKCRB33NvayMhJ0cVYEA
 CbJvjDCxf7JY4BYG8MFnbuHwDIzAecFeHZK3iqNgYDis1JNLzVEhDTSrqwxREAK9lk4IVhJ2NGvHZY
 caLZSbINxiap/PBD25gz1BE28oNWDjd5cQJzFXZ039AqCLqNWiyMWwBNFSobfyFyTLEullAvmhRrQe
 zqQYPGWioUWlPWtkNWLiTfcgSmUMTYhVshVO2+aJp/S3/ZfpSG5pnOZMZoxY9xOjvw/B6Bmtan7Zau
 AvipzaaH7BUrkL+8Htqr7xOS7DwYHoXOQADyBZqUR28WeQsu0dwD1DJVwNAt8RTN1esTuRDyWILC0A
 N2QcqTJZp5bMxi4l2Vbb14tX7dUWpx+5prEOBmirCtJeLV0WLr4ta0UaA+ERhz/kZNyQrD48BbTa3e
 zKdTK/uBJVtHlh+MKRaOsKXDOT32sxS6dpGSrQ/2Ax0Nnf9jgdum25X4ZJCbFhQ72LEqxZ5ZrvREU7
 F22SePp3OjD7SYDN1/gSqyf43HYHHbLPhznus9bp5T5QTuLNX0n9E2E+Q9rKHf31h+BhzIwxhboJl4
 4VxG4UjX09SI/mk5isEHBoJaOBtLckDHnf89jAFbcoXscIPAaALeun6x5V6wIBrJsVX6GYLrU/+of6
 gag5/jMQ57ZnTv2l2mUTdrspNx7tHst0QspBOIbhMRDv4FuLlpKcVH9qVVQA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103507-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:email,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: 9A292419941
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The P010 (YUV format with 16-bits per pixel with interleaved UV)
and QC10C (P010 compressed mode similar to QC08C) requires specific
buffer calculations to allocate the right buffer size for DPB frames
and frames consumed by userspace.

Similar to 8bit, the 10bit DPB frames uses QC10C format.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/qcom/iris/iris_buffer.c | 195 ++++++++++++++++++++++++-
 1 file changed, 194 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index 9151f43bc6b9..23a3e9a9c383 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -15,8 +15,11 @@
 #define MAX_WIDTH 4096
 #define MAX_HEIGHT 2304
 #define Y_STRIDE_ALIGN 128
+#define Y_STRIDE_ALIGN_P010 256
 #define UV_STRIDE_ALIGN 128
+#define UV_STRIDE_ALIGN_P010 256
 #define Y_SCANLINE_ALIGN 32
+#define Y_SCANLINE_ALIGN_QC10C 16
 #define UV_SCANLINE_ALIGN 16
 #define UV_SCANLINE_ALIGN_QC08C 32
 #define META_STRIDE_ALIGNED 64
@@ -80,6 +83,63 @@ static u32 iris_yuv_buffer_size_nv12(struct iris_inst *inst)
 	return ALIGN(y_plane + uv_plane, PIXELS_4K);
 }
 
+/*
+ * P010:
+ * YUV 4:2:0 image with a plane of 10 bit Y samples followed
+ * by an interleaved U/V plane containing 10 bit 2x2 subsampled
+ * colour difference samples.
+ *
+ * <-Y/UV_Stride (aligned to 256)->
+ * <----- Width*2 ------->
+ * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  ^           ^
+ * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |
+ * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  Height      |
+ * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |          y_scanlines (aligned to 32)
+ * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |
+ * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |
+ * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |
+ * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  V           |
+ * . . . . . . . . . . . . . . . .              |
+ * . . . . . . . . . . . . . . . .              |
+ * . . . . . . . . . . . . . . . .              |
+ * . . . . . . . . . . . . . . . .              V
+ * U V U V U V U V U V U V . . . .  ^
+ * U V U V U V U V U V U V . . . .  |
+ * U V U V U V U V U V U V . . . .  |
+ * U V U V U V U V U V U V . . . .  uv_scanlines (aligned to 16)
+ * . . . . . . . . . . . . . . . .  |
+ * . . . . . . . . . . . . . . . .  V
+ * . . . . . . . . . . . . . . . .  --> Buffer size aligned to 4K
+ *
+ * y_stride : Width*2 aligned to 256
+ * uv_stride : Width*2 aligned to 256
+ * y_scanlines: Height aligned to 32
+ * uv_scanlines: Height/2 aligned to 16
+ * Total size = align((y_stride * y_scanlines
+ *          + uv_stride * uv_scanlines , 4096)
+ *
+ * Note: All the alignments are hardware requirements.
+ */
+static u32 iris_yuv_buffer_size_p010(struct iris_inst *inst)
+{
+	u32 y_plane, uv_plane, y_stride, uv_stride, y_scanlines, uv_scanlines;
+	struct v4l2_format *f;
+
+	if (inst->domain == DECODER)
+		f = inst->fmt_dst;
+	else
+		f = inst->fmt_src;
+
+	y_stride = ALIGN(f->fmt.pix_mp.width * 2, Y_STRIDE_ALIGN_P010);
+	uv_stride = ALIGN(f->fmt.pix_mp.width * 2, UV_STRIDE_ALIGN_P010);
+	y_scanlines = ALIGN(f->fmt.pix_mp.height, Y_SCANLINE_ALIGN);
+	uv_scanlines = ALIGN((f->fmt.pix_mp.height + 1) >> 1, UV_SCANLINE_ALIGN);
+	y_plane = y_stride * y_scanlines;
+	uv_plane = uv_stride * uv_scanlines;
+
+	return ALIGN(y_plane + uv_plane, PIXELS_4K);
+}
+
 /*
  * QC08C:
  * Compressed Macro-tile format for NV12.
@@ -204,6 +264,132 @@ static u32 iris_yuv_buffer_size_qc08c(struct iris_inst *inst)
 	return ALIGN(y_meta_plane + y_plane + uv_meta_plane + uv_plane, PIXELS_4K);
 }
 
+/*
+ * QC10C:
+ * UBWC-compressed format for P010.
+ * Contains 4 planes in the following order -
+ * (A) Y_Meta_Plane
+ * (B) Y_UBWC_Plane
+ * (C) UV_Meta_Plane
+ * (D) UV_UBWC_Plane
+ *
+ * Y_Meta_Plane consists of meta information to decode compressed
+ * tile data in Y_UBWC_Plane.
+ * Y_UBWC_Plane consists of Y data in compressed macro-tile format.
+ * UBWC decoder block will use the Y_Meta_Plane data together with
+ * Y_UBWC_Plane data to produce loss-less uncompressed 10 bit Y samples.
+ *
+ * UV_Meta_Plane consists of meta information to decode compressed
+ * tile data in UV_UBWC_Plane.
+ * UV_UBWC_Plane consists of UV data in compressed macro-tile format.
+ * UBWC decoder block will use UV_Meta_Plane data together with
+ * UV_UBWC_Plane data to produce loss-less uncompressed 10 bit 2x2
+ * subsampled color difference samples.
+ *
+ * Each tile in Y_UBWC_Plane/UV_UBWC_Plane is independently decodable
+ * and randomly accessible. There is no dependency between tiles.
+ *
+ * <----- Y Meta stride -----> (aligned to 64)
+ * <-------- Width ----------> (aligned to 48)
+ * M M M M M M M M M M M M . .      ^           ^
+ * M M M M M M M M M M M M . .      |           |
+ * M M M M M M M M M M M M . .      Height      |
+ * M M M M M M M M M M M M . .      |         Meta_Y_Scanlines (aligned to 16)
+ * M M M M M M M M M M M M . .      |           |
+ * M M M M M M M M M M M M . .      |           |
+ * M M M M M M M M M M M M . .      |           |
+ * M M M M M M M M M M M M . .      V           |
+ * . . . . . . . . . . . . . .                  |
+ * . . . . . . . . . . . . . .                  |
+ * . . . . . . . . . . . . . .      -------> Buffer size aligned to 4k
+ * . . . . . . . . . . . . . .                  V
+ * <--Compressed tile Y stride --> (aligned to 256)
+ * <------- Width * 4/3 ---------> (aligned to 48)
+ * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  ^           ^
+ * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
+ * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  Height      |
+ * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |        Macro_tile_Y_Scanlines (aligned to 16)
+ * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
+ * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
+ * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
+ * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  V           |
+ * . . . . . . . . . . . . . . . .              |
+ * . . . . . . . . . . . . . . . .              |
+ * . . . . . . . . . . . . . . . .  -------> Buffer size aligned to 4k
+ * . . . . . . . . . . . . . . . .              V
+ * <---- UV Meta stride ----> (aligned to 64)
+ * <----- Width / 2 --------> (aligned to 24)
+ * M M M M M M M M M M M M . .    ^           ^
+ * M M M M M M M M M M M M . .    |           |
+ * M M M M M M M M M M M M . .    Height/2    |
+ * M M M M M M M M M M M M . .    V           M_UV_Scanlines (aligned to 16)
+ * . . . . . . . . . . . . . .                |
+ * . . . . . . . . . . . . . .                V
+ * . . . . . . . . . . . . . .      -------> Buffer size aligned to 4k
+ * <--Compressed tile UV stride--> (aligned to 256)
+ * <------- Width * 4/3 ---------> (aligned to 48)
+ * U* V* U* V* U* V* U* V* . . . .  ^
+ * U* V* U* V* U* V* U* V* . . . .  |
+ * U* V* U* V* U* V* U* V* . . . .  |
+ * U* V* U* V* U* V* U* V* . . . .  UV_Scanlines (aligned to 16)
+ * . . . . . . . . . . . . . . . .  |
+ * . . . . . . . . . . . . . . . .  V
+ * . . . . . . . . . . . . . . . .  -------> Buffer size aligned to 4k
+ *
+ * y_stride: width aligned to 256
+ * uv_stride: width aligned to 256
+ * y_scanlines: height aligned to 16
+ * uv_scanlines: height aligned to 16
+ * y_plane: buffer size aligned to 4096
+ * uv_plane: buffer size aligned to 4096
+ * y_meta_stride: width aligned to 64
+ * y_meta_scanlines: height aligned to 16
+ * y_meta_plane: buffer size aligned to 4096
+ * uv_meta_stride: width aligned to 64
+ * uv_meta_scanlines: height aligned to 16
+ * uv_meta_plane: buffer size aligned to 4096
+ *
+ * Total size = align( y_plane + uv_plane +
+ *           y_meta_plane + uv_meta_plane, 4096)
+ *
+ * Note: All the alignments are hardware requirements.
+ */
+static u32 iris_yuv_buffer_size_qc10c(struct iris_inst *inst)
+{
+	u32 y_plane, uv_plane, y_stride, uv_stride;
+	u32 uv_meta_stride, uv_meta_plane;
+	u32 y_meta_stride, y_meta_plane;
+	struct v4l2_format *f = NULL;
+
+	if (inst->domain == DECODER)
+		f = inst->fmt_dst;
+	else
+		f = inst->fmt_src;
+
+	y_meta_stride = ALIGN(DIV_ROUND_UP(f->fmt.pix_mp.width, 48),
+			      META_STRIDE_ALIGNED);
+	y_meta_plane = y_meta_stride * ALIGN(DIV_ROUND_UP(f->fmt.pix_mp.height, 4),
+					     META_SCANLINE_ALIGNED);
+	y_meta_plane = ALIGN(y_meta_plane, PIXELS_4K);
+
+	y_stride = ALIGN(f->fmt.pix_mp.width * 4 / 3, Y_STRIDE_ALIGN_P010);
+	y_plane = ALIGN(y_stride * ALIGN(f->fmt.pix_mp.height, Y_SCANLINE_ALIGN_QC10C),
+			PIXELS_4K);
+
+	uv_meta_stride = ALIGN(DIV_ROUND_UP((f->fmt.pix_mp.width + 1) / 2, 24),
+			       META_STRIDE_ALIGNED);
+	uv_meta_plane = uv_meta_stride *
+			ALIGN(DIV_ROUND_UP((f->fmt.pix_mp.height + 1) / 2, 4),
+			      META_SCANLINE_ALIGNED);
+	uv_meta_plane = ALIGN(uv_meta_plane, PIXELS_4K);
+
+	uv_stride = ALIGN(f->fmt.pix_mp.width * 4 / 3, UV_STRIDE_ALIGN_P010);
+	uv_plane = ALIGN(uv_stride * ALIGN((f->fmt.pix_mp.height + 1) / 2, UV_SCANLINE_ALIGN),
+			 PIXELS_4K);
+
+	return ALIGN(y_meta_plane + y_plane + uv_meta_plane + uv_plane, PIXELS_4K);
+}
+
 static u32 iris_dec_bitstream_buffer_size(struct iris_inst *inst)
 {
 	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
@@ -268,10 +454,17 @@ int iris_get_buffer_size(struct iris_inst *inst,
 		case BUF_OUTPUT:
 			if (inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC08C)
 				return iris_yuv_buffer_size_qc08c(inst);
+			else if (inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC10C)
+				return iris_yuv_buffer_size_qc10c(inst);
+			else if (inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_P010)
+				return iris_yuv_buffer_size_p010(inst);
 			else
 				return iris_yuv_buffer_size_nv12(inst);
 		case BUF_DPB:
-			return iris_yuv_buffer_size_qc08c(inst);
+			if (iris_fmt_is_10bit(inst->fmt_dst->fmt.pix_mp.pixelformat))
+				return iris_yuv_buffer_size_qc10c(inst);
+			else
+				return iris_yuv_buffer_size_qc08c(inst);
 		default:
 			return 0;
 		}

-- 
2.34.1


