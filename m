Return-Path: <linux-arm-msm+bounces-103509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNYEEoUD4mna0QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 11:55:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E90AC419AA0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 11:55:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EBD1A3032062
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 09:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2E363B6BEB;
	Fri, 17 Apr 2026 09:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GXRBSbYY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2CF3B3BF0
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 09:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776418676; cv=none; b=YCQKZ5hfVZzYZ9X9h7nqAvmyY+u22CNKpyFI5bi8YsqDU1HHikkak/ZakehtZHawTCNjuuk7QLg2qDgjlPlfiCHxYGPxrAurxZ9klE4FYZfvuPCxvgqSq6pk8AR9Bx8Eei134kDritQ/XRPACvyYY1EDSyzoH6P5NNlqi2qzS3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776418676; c=relaxed/simple;
	bh=vYjJMDeVg4k6fo70v4ABD1udotMHtah4iQLNpwwmOk4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=grPFsPEmZY7f3XtUWnNddS4p5sbKcLQNKIYU9urPc+Y9GCVwCotiKfwJGCedzPn7QE6Iqc2lbETpdSuMbpo6tEiEfxQjbWtZmVQVhPORoaWrMT47j65YUDEvfnEtV3f/qH12b9D633KflmXDc2fE4lKzO/VyTmm8QGK+TUWSQS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GXRBSbYY; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488c21c636dso2922615e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 02:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776418672; x=1777023472; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+/dGPO0kAxWU1/3ix/1Osc2H8ffG2NBMmISaalGLB2w=;
        b=GXRBSbYYEYSrTiuJwqjTpruZz11QAi5nLafjLSYpwMlBkjVMGFQWEBz3bL1I8fyYI0
         FmsbUaxHB/C9Bx93bO/n1eRzuPdL4z2MtUfseGOTMSn0IFbwxRwTGdUKt0sLarmR5DRF
         aVu1/gBiXQYlrjeoN7fMvGgibG6hdEuPGLcN9KPwOk7tcv7paAHyEiLRL3L/JrL9ZtnI
         vBWyt7t3PvhtH4MgElIz88qbbYHq1cH6mXerQkpHSA8+Yi4iLD/wuPlODxQ12iFo+MBP
         ezhvGJhJQj0paYAlI+7EkJl8des/Hhhfg9+7eQEuF8cHbvSC4oVhNa53LrGdlJlLuNln
         O5vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776418672; x=1777023472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+/dGPO0kAxWU1/3ix/1Osc2H8ffG2NBMmISaalGLB2w=;
        b=P37WqWA9luTxVHVMWrSWSzSSouLOpEmsA4Yqn+JLOJ8zkeiYKLvRPgelSyEiX7q7AB
         T+I5wZRSdbximXOXUBC4dmYctG4TJDJ4b6VxQy8Av0K3CWr9+FLGErmlmkeb81ZUUEft
         /Bb6MxZwBL67c+sATFjVTZeTrEqgmivlu2np6uAqbfd5DdEGg86Uqi1SJXCdWbwq8CsL
         QHxqvgxd0vU0eC5aQt2re+z3+iZLIEiymOtoGFyEq4bLm+GYLQ2A23AxDE7Kcg4btRJ/
         8AyNYSgL8L2rIu6pnXe+K9lousgpoqKqcUPyMpjcfUFdpTenUNsVRIq3zCD96dq/VwIe
         hYpA==
X-Forwarded-Encrypted: i=1; AFNElJ+7K+jieMRY/3lWrY3ALalluCNzzW9AzsPvjrwpI4uKBj8ntHzpheZOZOkrRntuzy0UYgc8FwG5I8vgJx8M@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1IuoIbzzYCJx2YlSaKM6+nKSyt1PeHro82YghpdgEYIuOW07n
	OtmVQLR+/+sm4Xfn7pv8NRwqH7ODnMO+vV+7sf+xkGq5CQQlFRcE/vRdMpnpUXGbpBU=
X-Gm-Gg: AeBDiesKk187/Mq0zHt0l72dvPHksdpx7YrKXsiiTVQvfQOCR6TUHwIgdiJSGd2a2wq
	Qg28N+AyHCWIxwe3qQX25imKWotdE7B2OyK8POyIfxlrIjfKH5LhqmLt97nn1voMEb+p0iEsE+H
	n0VGjcLnZ6oWu9eYcY3/Gy2+hWhQzbsZ29+oTa58gLGF9YSmg1blglH1XdJd/pVs7f0Rh3xB05b
	dJpdcbzd890NmQQk6Gx0TJEOhGYvYf99XpUzLuiT8fPebFQbAGnItddF5TOQwOBN2y6Pw/t8P/y
	hoCWyjDIG6Inga7kK5yY5FOeJqQsMmoMyFF0mCQiA/VuiLh7lxTJh7sA982OAxJixpk7DEhczV8
	TeT65GlK2S/Y1Hqxa5MsCVdPpb/TC5NJRloZR3Ah4YHb7zyRLg55pp+cgfQYyeg6p9Vh3s5l7Iu
	dxVAMn/tIEYnEVpz9AkD3cmT3xAjwogyrPkNHa6wESfiHCGFSsmk/RjAU=
X-Received: by 2002:a05:600c:8183:b0:486:fe39:28b7 with SMTP id 5b1f17b1804b1-488fb752e3cmr26432275e9.9.1776418672054;
        Fri, 17 Apr 2026 02:37:52 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb7b2634sm12915435e9.28.2026.04.17.02.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 02:37:51 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 17 Apr 2026 11:37:44 +0200
Subject: [PATCH v2 4/6] media: qcom: iris: vdec: update size and stride
 calculations for 10bit formats
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-topic-sm8x50-iris-10bit-decoding-v2-4-c987b65a31d5@linaro.org>
References: <20260417-topic-sm8x50-iris-10bit-decoding-v2-0-c987b65a31d5@linaro.org>
In-Reply-To: <20260417-topic-sm8x50-iris-10bit-decoding-v2-0-c987b65a31d5@linaro.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3607;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=vYjJMDeVg4k6fo70v4ABD1udotMHtah4iQLNpwwmOk4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp4f9qHQh9uuMQ+tI0lky+eapxI+LIuRRk+JQavqgB
 tmu7XMuJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaeH/agAKCRB33NvayMhJ0fMeEA
 C9bAkvPeznT9/pbzj5ETL3cuHdqOaSSVUVTBmg8NF0WEQqbrnT/O6J9jGp3HqIulQdzPY762hyjO+S
 7+wlgzB/kq8pVpbLWThGmjzF7/I+py3SmYfNPFN65wxnCpYU2Q0wofLdopwyRpaw20NQxJeVwPgbAb
 AB/YqKjIY0oznudse94P0HCxNWpBaKtGqAykGV8yqUY0t6C/OEUYevIbU2qMV0oOQuOYh9EXgAySZC
 jQQqavIyNimjeGzJxfg1ih2RuMn60vBlDuKjdUVDqxr2iYyIw2o964Gqd60z2ccqJA8Dp9cPTGJaeO
 LoDm2PseveNw9zn18fVVqYj87Xjn43q+6a4eQXNm4xyw7AYWT4eFiA272oYc96KrPcKoq+0CappLCR
 pgY+Bl0oM6P3bZ+1AggKX4BDcA5o/OY4jDu+xLHM/cIHu3ZqukJANhJNxsQ8sWBbPQL6v/GS9GD2Mq
 lXpZC+c2BM8n58iSNPM+bssXfELsOOjtd6rGtul70sjdT6ux6ZzjyQX/O+OZeUkxb2sWREcqCZBg0O
 GJJf4zohPnELVSer5ZAsNzbVaQiVFmWqtiEHKDZwxQAml/DAUT4C8FXGy2jJcnKQ1sS9zp9OhMRk5c
 9TrsAg0v9lxTSjPLSjugEPq2qS/0ah0R44uJ1njZXW5TRSl2O0L8dpLSQBTw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103509-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:dkim,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E90AC419AA0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Update the gen2 response and vdec s_fmt code to take in account
the P010 and QC010 when calculating the width, height and stride.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../platform/qcom/iris/iris_hfi_gen2_response.c    | 21 ++++++++++++++++---
 drivers/media/platform/qcom/iris/iris_vdec.c       | 24 +++++++++++++++++++---
 2 files changed, 39 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index 8e19f61bbbf9..0541e02d7507 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -542,9 +542,24 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
 	pixmp_ip->width = width;
 	pixmp_ip->height = height;
 
-	pixmp_op->width = ALIGN(width, 128);
-	pixmp_op->height = ALIGN(height, 32);
-	pixmp_op->plane_fmt[0].bytesperline = ALIGN(width, 128);
+	switch (pixmp_op->pixelformat) {
+	case V4L2_PIX_FMT_P010:
+		pixmp_op->width = ALIGN(width, 128);
+		pixmp_op->height = ALIGN(height, 32);
+		pixmp_op->plane_fmt[0].bytesperline = ALIGN(width * 2, 256);
+		break;
+	case V4L2_PIX_FMT_QC10C:
+		pixmp_op->width = roundup(width, 192);
+		pixmp_op->height = ALIGN(height, 16);
+		pixmp_op->plane_fmt[0].bytesperline = ALIGN(pixmp_op->width * 4 / 3, 256);
+		break;
+	case V4L2_PIX_FMT_NV12:
+	case V4L2_PIX_FMT_QC08C:
+		pixmp_op->width = ALIGN(width, 128);
+		pixmp_op->height = ALIGN(height, 32);
+		pixmp_op->plane_fmt[0].bytesperline = pixmp_op->width;
+		break;
+	}
 	pixmp_op->plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_OUTPUT);
 
 	matrix_coeff = subsc_params.color_info & 0xFF;
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 719217399a30..32cb75757f2e 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -272,10 +272,28 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 		fmt = inst->fmt_dst;
 		fmt->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 		fmt->fmt.pix_mp.pixelformat = f->fmt.pix_mp.pixelformat;
-		fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, 128);
-		fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 32);
 		fmt->fmt.pix_mp.num_planes = 1;
-		fmt->fmt.pix_mp.plane_fmt[0].bytesperline = ALIGN(f->fmt.pix_mp.width, 128);
+		switch (f->fmt.pix_mp.pixelformat) {
+		case V4L2_PIX_FMT_P010:
+			fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, 128);
+			fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 32);
+			fmt->fmt.pix_mp.plane_fmt[0].bytesperline =
+				ALIGN(f->fmt.pix_mp.width * 2, 256);
+			break;
+		case V4L2_PIX_FMT_QC10C:
+			fmt->fmt.pix_mp.width = roundup(f->fmt.pix_mp.width, 192);
+			fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 16);
+			fmt->fmt.pix_mp.plane_fmt[0].bytesperline =
+				ALIGN(f->fmt.pix_mp.width * 4 / 3, 256);
+			break;
+		case V4L2_PIX_FMT_NV12:
+		case V4L2_PIX_FMT_QC08C:
+			fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, 128);
+			fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 32);
+			fmt->fmt.pix_mp.plane_fmt[0].bytesperline =
+				ALIGN(f->fmt.pix_mp.width, 128);
+			break;
+		}
 		fmt->fmt.pix_mp.plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_OUTPUT);
 		inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
 		inst->buffers[BUF_OUTPUT].size = fmt->fmt.pix_mp.plane_fmt[0].sizeimage;

-- 
2.34.1


