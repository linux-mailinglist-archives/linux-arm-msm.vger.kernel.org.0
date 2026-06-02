Return-Path: <linux-arm-msm+bounces-110766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +EsUG0qYHmoAlQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 10:46:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 735FF62ACE8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 10:46:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1F0F030136E0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 08:39:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9F073C8C5E;
	Tue,  2 Jun 2026 08:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="No1riZtV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843FB3C7E15
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 08:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780389567; cv=none; b=lOvLmdUo8Ond2nV5+W5tnYWcGDBLsQcmaJ1tQv9YCTu3WNdVnNtIm3uwDORZK9ZFtMBWbb4MO4xUm+XLONRjilLin89P1Brbz7Cn5Pw8fp6rC3k1uP2/w5Nikc9s04SHmb0lzeU0iPRipdz5oQZNvoLhJUwplhRzrxQXKfO8CIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780389567; c=relaxed/simple;
	bh=8QQGtfLgtdUXMNRLEDAdD0G9n8EM0L6VfE19GU/xjBk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W9euu0yFsYwWIdf2FwUVRbBLpdscwh4gXr8KY2QtQxfmUbx5SeM3vY9HFEqFMW3MjLO67mEAcq+yBfgMWSjZ6K8hZ2bTpepDI20zZb2cN+Hb+2f/7lSUmXdoQNfFxtplKHYbcj4ACeTYDMqMDhu59nS8T0c7HKoTMQhMTqhf8zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=No1riZtV; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4903997fcb5so112747005e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 01:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780389562; x=1780994362; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OWyzGB/0xUFPPIwYqt4ljUuRWgwAyuAeLbCuIJBQLG8=;
        b=No1riZtVXJ7D596fdUI0A0EgLIupFBbe0OykNgis+/0Qrz+j5i84VW7lhFZQ3m9pK1
         +5/2CCKxOMtbT7xa5GKb1CgGD0Xxu4jQuolR9nTHFpneE1pNuTzSjnSALJa5r3j+hcjX
         7m+M+ChodY7t30D9jBhO6Figwx7/uepfmOxcBhP28rXDFFQt/pHal/NBM77pNAmvjpCQ
         0iC8mjS7CgH4t/SSxSwZJS13e0NFvq7aEOQYynbQoANSaeULKU1a9ltXlA9/EQpQRwFw
         7IGkNae/tX1LbZgpy/yG4iinAWOm6F4hy5FRt7RGM/vd21sIJnzRHbq6arTUiuzJ6fX0
         +Ipg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780389562; x=1780994362;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OWyzGB/0xUFPPIwYqt4ljUuRWgwAyuAeLbCuIJBQLG8=;
        b=s3/Wa0Owm3nz+etR0Ppis0hW+ZallxYnTGr/8kNsaQ9SzvdC2u8EP2yt6CpyhOGuvI
         y/NUubP+V78CZicXpvr1wwDlfKQqsdoyHhNVv8zD6PqJibwRzuKTT54a9V373Vi2bXJE
         Lx4jqQ0Vm5DfberIY718OUUV047bdntOqph98dg3toVchDXdsfaQTiUz2X+LwznMrjIH
         +xPOS30eJw8PxYT5eq40nyQ2Mvi46+QvnNuyxe8UD0vcqYVTuG4pBNlkEGHczrkAiOlN
         OW0eKhM6wzSpHDWVSCgmvd+IFP6j+t8xUqBW0z+jEZBIneNg5M4TGgtRUzBJnA9673Hs
         P7RA==
X-Forwarded-Encrypted: i=1; AFNElJ/i8Cwp+6FHHCwFX8D79Ia+4Cg+U1ag/xrNAQkKyF3ODZrKPPVCADYQ5UF+H//RGuPRGu1pe/a72dt9CYcL@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+lsQVzYA9d16+oZKHfNuL7i7I0ZBF68BrK1vSvBM7WE2yc4Nj
	+MEW+z57yxJ8jJ/jVzzSfCfd7uXHWQnqr7yy5Dq69j/aM0tk3k3QQP5ZglkvAq6QqNQ=
X-Gm-Gg: Acq92OFhxjYlou9qximGWhGGwZO0ZpAXgkN+/V2UtZ+7Hv3pr+SdKJfZgIeyaHSc9sG
	242KJZ5AFoTH1CScPYrE1/tDq8k+P9e6SXp8RNUAl1Fas1aD8B3b2tR7Haw3ggARJ1XRzgyjYrg
	NUGzvKXPLRAClLRd91HVBeDxXoQN4JiopB8yRHkYQzrf/u4Iboo9Cs/tw9JQIjbBTtK07reNARw
	AYtrPo/7dF8bQJ/LSUuY8C9fRPHqt6XwkzdDUz3AAJbm9PA6HBwfM3z4FBMogOau5fLar1jNMKq
	1Yk3DA/gYNZCPE7dwaSkfXGp/Cx8hEoRPGj1WXbqQ6DB8W7BhnnhRLf8bM1jfAV8ylLRu9u+A/l
	50PkEAENrz6q9Q5E0cpZBUpa7HCj8hLsGRw0yDe44V/Swcd/8SUAwGcn9xjN5TwMDJGn+HCOApS
	4/pMoU2HSAbNmgvIOS8qq1PHrr/MTZk/dn3ZGtErSfzaxkLdNaDiRqy0A=
X-Received: by 2002:a05:600c:5697:b0:48f:e6de:1cba with SMTP id 5b1f17b1804b1-490a2958f75mr197204615e9.17.1780389561744;
        Tue, 02 Jun 2026 01:39:21 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e26050sm43879425e9.9.2026.06.02.01.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 01:39:21 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 02 Jun 2026 10:39:16 +0200
Subject: [PATCH v5 1/6] media: qcom: iris: add helpers for 8bit and 10bit
 formats
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-topic-sm8x50-iris-10bit-decoding-v5-1-c2b32474ed67@linaro.org>
References: <20260602-topic-sm8x50-iris-10bit-decoding-v5-0-c2b32474ed67@linaro.org>
In-Reply-To: <20260602-topic-sm8x50-iris-10bit-decoding-v5-0-c2b32474ed67@linaro.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2065;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=8QQGtfLgtdUXMNRLEDAdD0G9n8EM0L6VfE19GU/xjBk=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqHpa1RsRBPFP1x0RR1QphpYuDsiSPKUnplCmWpDtt
 ArA3S5eJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCah6WtQAKCRB33NvayMhJ0cDEEA
 CHZOBd59MEu8ENeyENBKx6SVc3sSHwu1WOXPVnDIPPn9ozR7jfkswfyGjyZevczGLhS6QqMuxh7j5W
 GoJbcC4a3np8lRkFoDkzABpcNDR0NLxoO2VyFU+1lp/vMkWtY+TfpwHG9nwUx99myJRsT0ZKfpxmZn
 Jq9hCDnlce/5u3Op8lW+V2+7Q6EY5MJNG4gljfJkRfE0Elw641lI/BL5cZfYszR9X81Ru4PbhKPCry
 EUsHXKpsD7w/pL4dctIqXNl7HkeP9dsJRPBkl//b07I+ufI/YwY3fqzKLXsAYQGVB1hAOXeNeJrN5j
 8S7Ky7Vw2NCEoAOn1gyFAjtO7+LBlK4tm6m9tsf/HpR6sLXaqkwAHzZ1WhmW87bNWuNcQSelt5aiuI
 Z21h4j5Su1M6pWzhXAsLmK+Uc8f+g2dKrGTShiSzu54rYWSDzTytIkKR8GTp4tm2488joWe09SmqLb
 TmlseN4QQeIbE281fWtsAyJb2OpktOCXhdyHA25FfZxKORIAmRVnJKCVqGEQ9DHVTnlsdBFi2DgYfZ
 i7fUGm/41LlyfB8IJBaKhjys5Qzdp7RgTZ9DbT/WfGBXKOrSBukkU6T68C9KPxiBwbgX2TIu2E8aMq
 uUW6ecJ01JbER+19JiodWR8MgIM/8embCt5hZxHqpF7iWodjfev+XFbzzJXg==
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
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110766-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:mid,linaro.org:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: 735FF62ACE8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

To simplify code checking for pixel formats, add helpers to
check for 8bit and 10bit formats.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/qcom/iris/iris_utils.c | 12 ++++++++++++
 drivers/media/platform/qcom/iris/iris_utils.h |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
index 29b07d88507e..085665cd74ff 100644
--- a/drivers/media/platform/qcom/iris/iris_utils.c
+++ b/drivers/media/platform/qcom/iris/iris_utils.c
@@ -38,6 +38,18 @@ bool iris_split_mode_enabled(struct iris_inst *inst)
 		inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC08C;
 }
 
+bool iris_fmt_is_8bit(u32 pixelformat)
+{
+	return pixelformat == V4L2_PIX_FMT_NV12 ||
+		pixelformat == V4L2_PIX_FMT_QC08C;
+}
+
+bool iris_fmt_is_10bit(u32 pixelformat)
+{
+	return pixelformat == V4L2_PIX_FMT_P010 ||
+		pixelformat == V4L2_PIX_FMT_QC10C;
+}
+
 void iris_helper_buffers_done(struct iris_inst *inst, unsigned int type,
 			      enum vb2_buffer_state state)
 {
diff --git a/drivers/media/platform/qcom/iris/iris_utils.h b/drivers/media/platform/qcom/iris/iris_utils.h
index b5705d156431..228a5f963812 100644
--- a/drivers/media/platform/qcom/iris/iris_utils.h
+++ b/drivers/media/platform/qcom/iris/iris_utils.h
@@ -45,6 +45,8 @@ bool iris_res_is_less_than(u32 width, u32 height,
 			   u32 ref_width, u32 ref_height);
 int iris_get_mbpf(struct iris_inst *inst);
 bool iris_split_mode_enabled(struct iris_inst *inst);
+bool iris_fmt_is_8bit(u32 pixelformat);
+bool iris_fmt_is_10bit(u32 pixelformat);
 struct iris_inst *iris_get_instance(struct iris_core *core, u32 session_id);
 void iris_helper_buffers_done(struct iris_inst *inst, unsigned int type,
 			      enum vb2_buffer_state state);

-- 
2.34.1


