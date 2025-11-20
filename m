Return-Path: <linux-arm-msm+bounces-82602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCC1C7198B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 01:47:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5269134DB2B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 00:46:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBB351E230E;
	Thu, 20 Nov 2025 00:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ooVwzhl6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060C221ABB1
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 00:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763599583; cv=none; b=eI/lu7ZaWDbKpOan9V5pzrbxlMIglVtK8cWX4ChVwq0xXB1guV5kGbWY32vQ4wzyrJHKTCXBMC7e//P7Av95/ULRRTbehhbq7EtO/62OUKCqextkNZNb8JsDOZU10ImsW/9sQTVwtJ7b68xHoQnh4pn4QwSObJ7kF0jLSWT8l0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763599583; c=relaxed/simple;
	bh=XdgjqCFN8zcVLt+R4SFzR28/tF64NVaZATzV8y3WeUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PfyKN415uVmLtJQWbBQ/Rm1CJ8k5Zi2dIgFLo2lgASFpB2k5ZkoGbVljrXUvIoo+/AKXxyc8ToTCYSf1M5yXB533EnVyhcz2Z1YBtLTDn88dOQoNSfRvse+3wxIFaqYalEhCjL+dc32bZdiYzj2LUuU0nJs7O3pHmWMjXd6JgEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ooVwzhl6; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59304084e17so31600e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 16:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763599580; x=1764204380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tHpWN5s6ScBkjvSQGEh65WLbcdillAfnHYGU7Sa0wY4=;
        b=ooVwzhl63ji+GOa7ShpySbdRmaOiZl/4WWTLufGQN3fs7yoHnHf8r9wtKaqsPuo193
         uX9cr4hqyVRrf9SNFlWS5g8dsNiQNQ/9Yd5qlRe8MpSyfV++AZlGvr3ChV/6dDXRsibP
         Uoh15SKeqOBHtZ0Ho9TWwEZjlqYjzqu8wKsGHvmGnQoKQZb3ypFjlVZxw+MF6WE8ff73
         qV62uyHK2+fRYS2uvAktgHMjzHD/XxLwSrsEpA3E106Sd0G9PU8fHGXwV+WERVk/GiKh
         sY8Nwmu/mCzBv+/6NCPazZsDJHzbo1WjBvoJFMJCRTQjl8cMEH8BnXIBekoJFrjxMtc0
         2kog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763599580; x=1764204380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tHpWN5s6ScBkjvSQGEh65WLbcdillAfnHYGU7Sa0wY4=;
        b=r7/4ez/QpzqENa75LUEybcEDbBfFAjHRNq+X8vG5jp4vu5NX6GJsibqH1xK6k9N4Rb
         +76sd5zWfYv0GBZl/tiMKwUKDoZzGpO4X/UUWuUAzylBpkTr4AVwGOCMdJBqeI+1pDIU
         a/wV3Wauan1pjcMP6LTczLBLlAJIuXsZbx+T4QtLZplgTt9+tp0VPwYRt1wFYbBlTT0S
         xLn92bc+q5TIeOHfQR7SqO1dUnRsZUyoBYslmKUUxk2WlINZYU5KFVjecrA26l3a8+px
         yUkldHBr7iGWLl6Fb6Ce9tWsnBFwjs2io582NvHHSx2eIuPpJNRU6i53hcOZRWz0bmo4
         aMCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbxMHOlkylSRJpJshzSybE20AZB7BNPR49aeeeErTqOH+mfjyfpc5EODGwUjRpXPn1j/6/PU0v039WGsFb@vger.kernel.org
X-Gm-Message-State: AOJu0YzdwgudftlU223juwvEM406oll54S9zJyFbWGCyMXCuncXVDUKp
	yvfvytaDKsmWokoy4kEQO/wwookgro/ePu2nxS1jimr9UIb7TpwoxLdU7Jo3iwrrKfY=
X-Gm-Gg: ASbGncuVfu9H/MFYujHwIweg2hBZ5B5iYfXxcUYmupH2pazHrTkc0yD8L+VnRtNjmBg
	Auo+xUXmUJCxvCwg+bEQUu2fcWlLEyfM/S1yF9Ad1kC3V4VA5Cp52oCQkbj1Qsp6juHM96P5mxW
	0JgfEdqMuieH3MFvgS+hzcHvUYdLjFe+Aq+StkOUUR4DoRgmUqsMY+Y+UYy7hHYTyTee4juWtbl
	wFwIHk6xEX4xc2d9X8eiRf39IfrMaXThzLer/GvJmjInug/GimOjsw1Xe4XYZJHnRkydCA5fy7H
	UxFHkiw+VdZYNNHDJxWm1rG0Wjm4WXEeeh4sHTRA3uhFlPquYAp/5dSnYrzL/fSXDduCQoZ6JLj
	QQ8Dq2JgKKXZvhbQ3fv/EAJl6vhigYc2IMNHdlKqngfWcN9Cogv95+SFh53Or5rTYMFoeHG+doz
	13XnhftwdQ62QcGzqnbLjcLyf7BK2o1ZRrO+IXid0HCpyv+991w0ddueSZEKee5qEj
X-Google-Smtp-Source: AGHT+IHZRZL5fi5Soa1OfVIBarkuqZ3uoJuX2ljNeZ/UrapTH6fiRU5dDlTaot3ZuMW7WMcCwMLAQg==
X-Received: by 2002:a05:651c:304b:b0:37a:43ad:859c with SMTP id 38308e7fff4ca-37cce90d921mr51741fa.0.1763599580067;
        Wed, 19 Nov 2025 16:46:20 -0800 (PST)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbc59a9sm229479e87.71.2025.11.19.16.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 16:46:18 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Rui Miguel Silva <rui.silva@linaro.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 2/2] media: qcom: camss: use a handy v4l2_async_nf_add_fwnode_remote() function
Date: Thu, 20 Nov 2025 02:46:04 +0200
Message-ID: <20251120004604.2573803-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251120004604.2573803-1-vladimir.zapolskiy@linaro.org>
References: <20251120004604.2573803-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Another code simplification makes parsing of remote endpoints easy.

Tested-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 736f04e10bdb..43592b51e127 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4087,18 +4087,9 @@ static int camss_parse_ports(struct camss *camss)
 
 	fwnode_graph_for_each_endpoint(fwnode, ep) {
 		struct camss_async_subdev *csd;
-		struct fwnode_handle *remote;
 
-		remote = fwnode_graph_get_remote_port_parent(ep);
-		if (!remote) {
-			dev_err(dev, "Cannot get remote parent\n");
-			ret = -EINVAL;
-			goto err_cleanup;
-		}
-
-		csd = v4l2_async_nf_add_fwnode(&camss->notifier, remote,
-					       struct camss_async_subdev);
-		fwnode_handle_put(remote);
+		csd = v4l2_async_nf_add_fwnode_remote(&camss->notifier, ep,
+						      typeof(*csd));
 		if (IS_ERR(csd)) {
 			ret = PTR_ERR(csd);
 			goto err_cleanup;
-- 
2.49.0


