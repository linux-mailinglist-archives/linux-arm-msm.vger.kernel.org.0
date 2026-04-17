Return-Path: <linux-arm-msm+bounces-103506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJSZKjQD4mna0QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 11:53:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 24943419A18
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 11:53:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F448323CC7D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 09:37:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C42AC3B19CA;
	Fri, 17 Apr 2026 09:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rPFm15lj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40729392C2A
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 09:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776418672; cv=none; b=Czisx8YDvuYsdEDyOe2mHGoE4R6jt+TBWIIf/i5dt/vYgABi2aOWDE17hce2LJH2irDhfWYos2pgDUwnRkERZft2Y/STevWo6DkvFzOrOsMWLG/Sam7O+sWMsaaOKlIW4V4JK40As5mzaBY4NsJ1Vw8+ZCeujYuk6u5SDU++Y9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776418672; c=relaxed/simple;
	bh=5sMpVnJbX4Wo0wpTQlrFG0+qE1K2lYr004iW/zPD4sM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UIZ9wSQdjrswvlKI+CX8uKR0WgTi3xdrxlUXqnaElafaF/Nov2arW6ZAD6jbRJ0Zw9WSK3PDizYM+uh7v5VGG/a0wuCC8GfYilmal5AzweKJvbz04C3XsjqpnUblFqO6IPZK9+Gu6RU00GjsLjqGhXA4SC2pq5zWHmmCmOPrrDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rPFm15lj; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488ad135063so4679805e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 02:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776418670; x=1777023470; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SdDC0tucHeP1WgDsxGwA3dfuw3FF32FYs5RhFEaWcZg=;
        b=rPFm15lj/5QjqFkqxchTW+73EAFfDw9u/qZJ6DZkiFnaD5B6Pp00i+GtmYGtWQXNAV
         uWzMaEHM/fjTvF6eB6uLPM5ZPvlCnT55ivvM5o9R1+poEbmOzUOFWtUJahodGXNpLd68
         Fu+xtDcPW3wTlru7l6vp/8GL+KjG0f/9opsWOwMkv2wC+TiODam0xwomE9h6v6AA8AK7
         dL/9iAsk0pa6dc6YSHN87PmOQuPn2n+bXC8ZJiD9CXvUsAx50jXrSwe63oT09khQ2hMX
         l8llom4u0e40vtABPlYXzW6tGdZqvwItGBymbzkOMEmHii7S2XedoII1yjQebIfOfYqY
         +IeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776418670; x=1777023470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SdDC0tucHeP1WgDsxGwA3dfuw3FF32FYs5RhFEaWcZg=;
        b=Vf7S8jlMwVuI1t2kzdVWhRa8kRKLKCmqUrYOgWCJf0tBH+pj1xicWWIPbkCInZuI0c
         FZlhdsnKBGpvbBwe6hyqHqNx5eHAim3YhEso+E9fd8YI9ld+ufHqHp7NPtqvL11yDyIl
         FQCB6qMl0H2rIgiHSfehFgnhM272UaSkLjqoABRgtg4HbnVJTyl0s/rNehRIPzQrcoYZ
         FCOCd9n1vDrfJQKKBlo/5I8vXYs3RPYzCrBLyIDYUk+fHGeF270fY6iAdTgtYJsOt4am
         53XiOxSra7ob0hvAr2u/ss7VgPLWyJLsKT9Os8lSf0TATTBByKQPnevfv7rFcc3OEMBO
         QcAQ==
X-Forwarded-Encrypted: i=1; AFNElJ/COPVI5WKrH9kcySlZ98CJePaw7HLXJrjXwIo68pbBtyler9cBzfpL1QDQils/p4jrgRSadok5r9jujo12@vger.kernel.org
X-Gm-Message-State: AOJu0YzhZHy2zpK/2/nxGwCQce0mYd7o8AdD6wZtpTUHIAiKiRdojuvG
	kdremQF7+V/h5vywZdtlMLaKTBr6gZ4mfdEde+jxX7oWcDbtetFct0LAJ/YDBk2f05c=
X-Gm-Gg: AeBDieuyKIyef/HVLnjVUaKFuwfPu+w3Exmpz0Xw+ZLO1kZysEHVxTr103wGJj8V4PP
	1Vk8TB5kqRmdYrVrC1pvLP9CsFPJ/8Ca+7q88VM9RMe/gOijKjKblqnOcFDoP0gwPvtqChSLOZh
	Q/CcEVxbXoNsk7V8b6p7tAlnKu3FPiSrjfj1z4vZx2YDI+Go6+1cz4EdiSroSrLpGZSgiIgqGTF
	kWOXm6KboB3aBBAivoiU18gxt1hjumHhRP/yfi+4hYRj7QfWt8bMB17ey8Al5RRA+d/qz+Uap6/
	Wn/URwZqF+DbVSuQ6lQz4f/yQ0cd4VdQjxKBjB3WDs4cQgG4jhaOvt/zdPbdmUq881P5GTh6Hbg
	8PsjD6jxtNP8yXScY/7wPSn7QDs82ww3M1/ePsmVK6qRvVsgJ0tnNOB3J4jFR5njVXhiE4eDeuB
	PVOYyh3Re0OJqdtq+7QmodJ5YiHtyTbFSoW2dwM2fIDxiLTlhtHuBUdLo0Wk8JDOv+8Q==
X-Received: by 2002:a05:600c:3411:b0:487:1c2:6a56 with SMTP id 5b1f17b1804b1-488fb74529fmr18448995e9.3.1776418669542;
        Fri, 17 Apr 2026 02:37:49 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb7b2634sm12915435e9.28.2026.04.17.02.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 02:37:49 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 17 Apr 2026 11:37:41 +0200
Subject: [PATCH v2 1/6] media: qcom: iris: add helpers for 8bit and 10bit
 formats
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-topic-sm8x50-iris-10bit-decoding-v2-1-c987b65a31d5@linaro.org>
References: <20260417-topic-sm8x50-iris-10bit-decoding-v2-0-c987b65a31d5@linaro.org>
In-Reply-To: <20260417-topic-sm8x50-iris-10bit-decoding-v2-0-c987b65a31d5@linaro.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1884;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=5sMpVnJbX4Wo0wpTQlrFG0+qE1K2lYr004iW/zPD4sM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp4f9pq7EsOKRwmM19h8c7brWZsEhPwCymO40/gR5Z
 kmUPyM2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaeH/aQAKCRB33NvayMhJ0R7nEA
 C9ywtf6EX6voCeoW4IT7BiqXR5GZcWeQoLS7nf1gK1bQYL7XLtOBCc56G9gzfg6OQ+yB9Z0aywsBNx
 ftPNbF1LLskJQDk5nAiUtb7VIfDKv2luXqPlUCO0RptzSlDwJGjopZKVZkAK2ZtcoFO43MH+FaujTT
 H1pCeJjLJtELgjI11++3qmqOFuczS8Ws+Zy7iU0hRIhMYpWalEvl5K9wFKvOZTkoMHga1RemzB4emT
 b7WJN6vNZ4JjdQa2XfS5/C0Z2hl3KXWKYx0v2QolV9Wfk5X9jBJde4n3yJiY5VJUXuVQ/BDB/ngp+w
 x0WbyJgfIAv3QMAHcbmHkSs8yrPEgZqZl4CB5qnsfdDMGNLPSsguzn71D/PZq8ojbTV0FdYazGv8Xa
 hEkC78Gv5eFX4M+fSLlkpXvXvUkbe+NvDPdGHQt9u9QmapVt8QqBNi/QtZx+dmhff9Gpd7AalpcDrQ
 t0Ae7qsx4ouhCOLH/psZhAxirtivv28ewYuaxtJyh5BGxhrwHineDDJdytH8oWVCxF5KmUFtWXAjOC
 SqeI22qPvsrlCYJvuqJnQ8JkxBpRd+4SAyncNBRTrTyLODthi4dmC2NXc1VFUjj7Ee3adZPNdXLQZv
 YQwAVZfoCXYFpywp5I0PVbtnC50+g9ns2nSY9qJmQDGsb6Ff8VG0OlZMpz3g==
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
	TAGGED_FROM(0.00)[bounces-103506-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 24943419A18
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

To simplify code checking for pixel formats, add helpers to
check for 8bit and 10bit formats.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/qcom/iris/iris_utils.c | 12 ++++++++++++
 drivers/media/platform/qcom/iris/iris_utils.h |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
index cfc5b576ec56..bdedd6bfa87a 100644
--- a/drivers/media/platform/qcom/iris/iris_utils.c
+++ b/drivers/media/platform/qcom/iris/iris_utils.c
@@ -38,6 +38,18 @@ bool iris_split_mode_enabled(struct iris_inst *inst)
 		inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC08C;
 }
 
+bool iris_fmt_is_8bit(__u32 pixelformat)
+{
+	return pixelformat == V4L2_PIX_FMT_NV12 ||
+		pixelformat == V4L2_PIX_FMT_QC08C;
+}
+
+bool iris_fmt_is_10bit(__u32 pixelformat)
+{
+	return pixelformat == V4L2_PIX_FMT_P010 ||
+		pixelformat == V4L2_PIX_FMT_QC10C;
+}
+
 void iris_helper_buffers_done(struct iris_inst *inst, unsigned int type,
 			      enum vb2_buffer_state state)
 {
diff --git a/drivers/media/platform/qcom/iris/iris_utils.h b/drivers/media/platform/qcom/iris/iris_utils.h
index b5705d156431..35337c5da005 100644
--- a/drivers/media/platform/qcom/iris/iris_utils.h
+++ b/drivers/media/platform/qcom/iris/iris_utils.h
@@ -45,6 +45,8 @@ bool iris_res_is_less_than(u32 width, u32 height,
 			   u32 ref_width, u32 ref_height);
 int iris_get_mbpf(struct iris_inst *inst);
 bool iris_split_mode_enabled(struct iris_inst *inst);
+bool iris_fmt_is_8bit(__u32 pixelformat);
+bool iris_fmt_is_10bit(__u32 pixelformat);
 struct iris_inst *iris_get_instance(struct iris_core *core, u32 session_id);
 void iris_helper_buffers_done(struct iris_inst *inst, unsigned int type,
 			      enum vb2_buffer_state state);

-- 
2.34.1


