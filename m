Return-Path: <linux-arm-msm+bounces-108990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJ2QBxjUDmr2CQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 11:44:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 500315A2929
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 11:44:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D43F830793C8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 09:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0554137881C;
	Thu, 21 May 2026 09:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KabRghp6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C347637472F
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 09:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779355508; cv=none; b=Ex0duyZy5MNxa9IHw6uBroKF0bA6EE8ZRKiSkft1man5pX608P/XeIf6HmX8wJmeIHTjWkVvhjtwl7kTBgOndxZegyjGt8XYGbaf0lG4OXjKIBy2PW1oOTUvi9Z3N+E6hMaTVNxR6NcM6mIlyMtgj7vKF/dSf+8JHlshdolqz+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779355508; c=relaxed/simple;
	bh=0x5xYEwoUZvKXTEvMQnBzewQiRcORbDr7ycw7TxINKE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oOqFbERKM8xwXNZu5GG0XKUNJJyujC66VL6GSffwv2PWnGr/x9iJpPJ4Vf3C6xkv4TACtyVUwSa3tJxbOHw4V4sXwvCVFG97PCfiaFe45veilfP04tynFV3UWNnqoDMg2JYRCYI92StadibnlPrtt2uj44eGtLlaQQX9g+cF7Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KabRghp6; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488b150559bso44823205e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 02:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779355504; x=1779960304; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5V3jdq7D8hT9URSjELxQylxndpkD3NUZV1IJWVze3+E=;
        b=KabRghp6exoKj3TDIf/QFEAnImRdbVQTSBzq6qaW614aCjWnOdPvXUbzfc8nDZhMIO
         LdWlRK/P6aoVBV8aOx9F0wng4I1CITbWxJ+kWdjT7VvSZvrtrefGYvjmZcrE6nfOnqXQ
         QhZSdfpY0g2nVBCW4zKWWQr4nyJhm7R3kvxbeGTzjZ+YdAdiQZ7pu3MLiVmAUF1tAk/2
         t7rl7qzAl4aa6Ra2aCdX94qg2PqcjJpfg096QIx9yJlj7bYGagnPrNxj1EQ4xQlLqYnt
         Mnv3kOSaBzmoSPoh52niy1XiyBMv/mE/r8liNck4Tqbp/yPi7xd8Bjv0y4f/LZKduFqT
         Ktog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779355504; x=1779960304;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5V3jdq7D8hT9URSjELxQylxndpkD3NUZV1IJWVze3+E=;
        b=FWnrF4WSeIa3pALgM6hZ95AmkeIN1cClkfodcHQ5NmI6STobMrSXnptUo6zde68bJo
         xDzhvfrCVj+wA+i2Vb7ZsK2+CZNZ8jPV3cXwVGRrXkpeqcxcB7vwd0woNGXYD+wheEZC
         ZD0lTfgekzYgwZp/EzJYTzy3hntiVzrYceZZ7T8WfHunx+1WA5ZlF5a8Xu9t3P3dg3qA
         9slCj7vPgzrv67QJdKPyEMhclACzSnIexQeGK5wQgN/2/KQuYnlOHyqSyM65Ae2z3/bB
         3iI7cdw8VRN8StBjF+zaC51l39PM8/skZLTUxlLdCFMSr6FN0CFKUfiVOM/e3R1orqWx
         sFog==
X-Forwarded-Encrypted: i=1; AFNElJ8rqV3NqSs1Eb+StIxNJ84O0lRsXwrz2PG8nHvnsFmOrrZq6bNj4HHg50REJFwNU7YVkEoTrQ/xUH18JwHT@vger.kernel.org
X-Gm-Message-State: AOJu0YxqK/BR6hO6fY20OgAAg82m1x0py+ukSPfqa4HXOi8//HbqNYxS
	aZe/vjcspjaWxhrw37+ScsR7XNIHt2uK4+HskX43kXV4yIgcm4iaV/KiJMrKIv3cvyN3bqqx/+H
	joNuz
X-Gm-Gg: Acq92OE5W5p98rcxi2zFET4wSS1QoN5PAi/yEaeu2ggIH0fT7rk/Gy6By3LgreFAG/B
	Y18gZPSGWvw37aDB6YwF3KtEUsfs/cw4eo36gwCh3HnQgTa2U32m8eSY2TMdbxapwPIxL+2+Q7a
	4oZsk1dv9RVqTtvniSx9fnXoQDUi/sSZFoi6YQxZ+LbUwoIhKSfFbHDL1xfxuXj76NG0uzSrAv+
	IQA+fROYH5WtB5xotjT4WsqgN1R0p8p0k8KXUgXmbVDpCoHUeLLcO3mCi4Xmkb6d7/zVeQzcslt
	KM6Q6DdLAepRrnslvjxNncAzZU3uUhoSsGLWhkNbl3jy7bmUtg3ma49qNqlpL8cHKVzw5IaGLrn
	7HvycQvzrp0u7VXFcraaVNVp3y9weDdkpPMlXB6Xx+OWrHCpNBqo3XlqN1MKgjbdi63ueOUobkl
	mek98EuSlOCdYv6GjsVmCR1UAg8KmIn+WskuLqz9zyi0MX
X-Received: by 2002:a05:600c:33a4:b0:48f:e230:2a1d with SMTP id 5b1f17b1804b1-490360f0f14mr15782675e9.32.1779355503640;
        Thu, 21 May 2026 02:25:03 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49033d8e25bsm54945595e9.11.2026.05.21.02.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 02:25:03 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 21 May 2026 11:24:57 +0200
Subject: [PATCH v4 4/6] media: qcom: iris: vdec: update size and stride
 calculations for 10bit formats
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-topic-sm8x50-iris-10bit-decoding-v4-4-8ff8fce3f904@linaro.org>
References: <20260521-topic-sm8x50-iris-10bit-decoding-v4-0-8ff8fce3f904@linaro.org>
In-Reply-To: <20260521-topic-sm8x50-iris-10bit-decoding-v4-0-8ff8fce3f904@linaro.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3674;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=0x5xYEwoUZvKXTEvMQnBzewQiRcORbDr7ycw7TxINKE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqDs9qplGOiq+93Kwowy55wKDxWqlvOjTUQJw98f4t
 JMHBnvyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCag7PagAKCRB33NvayMhJ0bBUD/
 0VgtbW6nrMDvBlizvd2DGdKtqwLV45UpEhkLof7xzSYTp+EaOOZR/OgU2c/IQ0rtfnaatdaLs5nfmY
 95xCy8fNrzttmdn6C/KPSgfLaZDSP1TCvfDBQQaxItXMXsf1tqoTBIusy2kd43BC5KBVEiKC2fiZZQ
 xRUm0XfT2Lha6hU/DgvstPV5rjhGsiQr3/sqqoxDsPBmI+wPdJtbUdWX1fqPoQUi3ZlAUj1MSErxEi
 44jL5DrRL7nOkrN2x5xud044Zer19K6/xn4SY6Spc8Vb8PH3RTej5FXjsTZz8dxlHh7Bo/7CaB2woo
 gj5BUJ+z/acjx82OUqZkYDYWxjN41wCXX7dIe4TdNMZ9Sa9uLIU2arQAWkXnNamEOF+0rxURmhWWEt
 GAt6AAkDfY4l0kFbzgBxdobYZ5E9U5kcGLiLSXQPLs6ajBU/ex3qOaghHYeCiIlC7af+hAtsEgbFVG
 6kW3MZVTJvr1gew/736IqBquWWXNIBRy80HqODrbUQljb+YbafyAvcoDZ22zhBjSr+HXzlF3IH4/vN
 4pxHRjKzwv0BfwkJL+HNJ0lb4fkD6+pYzgKLi3had6haQnCCr4p//yaa8WjAdQKE4fSwnSjKDkPz2m
 T3IzUiMm6YBzWhBgPazSyz5VA0q8mTLAQjVQsmTq8291iD2gD9KhBB/snZ2w==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108990-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 500315A2929
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Update the gen2 response and vdec s_fmt code to take in account
the P010 and QC010 when calculating the width, height and stride.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../platform/qcom/iris/iris_hfi_gen2_response.c    | 21 ++++++++++++++++---
 drivers/media/platform/qcom/iris/iris_vdec.c       | 24 +++++++++++++++++++---
 2 files changed, 39 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index c350d231265e..aca90aab8548 100644
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
index ccda3b9fb845..3846d73b4d23 100644
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


