Return-Path: <linux-arm-msm+bounces-41525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 936B69ECFF8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 16:39:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 927CF1678CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 15:39:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D89D31D63CA;
	Wed, 11 Dec 2024 15:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mtebiTla"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647181D2B1C;
	Wed, 11 Dec 2024 15:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733931567; cv=none; b=CcVDrGI6LZTrJ4kZ5CfX80Pu951xSsdA2JEhygWl2dLQmdKl5r1lQ4EqXB5Y6xtjUv/a7Q4kf+Fl0dQtkR+b6KQaNK8lBi3t5Dql5LQnkjqLf3CWkD2Znnp76if+kUu9RWpPk08AcFuYW0CeD5HRa5hlVyO7F4RJpPIUQN8mVb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733931567; c=relaxed/simple;
	bh=pwpNS+sOxEqyNN36ZDX+P0JT6fzS4PPrdX6vlxUm4ek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WLq9rsVEozG3qZcAo9M6Sf6rQaKHqjCIQy9ugUvJwZXq+ZEPf9ZzZ+rW+n3/yl22C8/CYW7WXjPdAoXvyzO9REv3zW62dKolTJlIZxqSWhbmiQAwtvkgIdyhRjDoMzPRVggRbova9XSLxSjSn42t5tMhMiCkEf+HipHuo0iihOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mtebiTla; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-216728b1836so19128955ad.0;
        Wed, 11 Dec 2024 07:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733931566; x=1734536366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fbiGyA2VBzq1y2Nz8P+PPT5DLdBmJ7XSRERnK1WU1Tw=;
        b=mtebiTlaL7N+f/4bEQVGbq8dkE3oz0tlXwtr/VV8H1UVcTRzWUcnSO9Ils23GA/BpV
         zqwWP0J+Af/T8ioo0IFBF3/Ypv7tuhRw5wkxOcx+bwKCTAZkt8DPISVZDXsvnGCfTOYo
         dRN6rez2MBCRQ7Av5woFs6C0WdHkx5gnXD+24kLZFEQYts6jFDPekNJ0xaMimLN++O76
         cbJ80/GYgz9/a27dZiyOxiv3tMRm5nXMFQPPHLin8usdWqSGgUnix09W+t1Erk8YeznE
         /dUPIx6wvszvY338OBEEbWlth+/gxmedCEbRID+LW5HX3CechljxMcxecmYAFj8us+yX
         fjMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733931566; x=1734536366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fbiGyA2VBzq1y2Nz8P+PPT5DLdBmJ7XSRERnK1WU1Tw=;
        b=EVVQP37YSpVn+nKcIspvWotD3N9WSll0/webaXqcPdSft+IfVlW+Fxkcv2CJfLzdCy
         m4AsYuhTGWiSmvOGWrYICr218GUb4Y/xbcRA9r4XvvDA2A/Gn1fOKxP9sDGOa+NXr95V
         qUIQaKxPSjFf/a+YwtOW6I7bqe1J0AFX5RnRzoKPbTinHEguGdiMku+au1f5dNzHVjA0
         PCTnKmi8qAN9qTrfJ8QUsLWl3/1UvUXX5/BqrZhPa2jQ7iGefZChjJyoKSkAkgUKxKGZ
         5ZlkJkHvnfjz+SCGmui4wgEAAVpOGsPfFsCfrbhNUuYQlMI3zHfun1etIoMwYUEXmY0y
         I/rg==
X-Forwarded-Encrypted: i=1; AJvYcCV62Q/M3EKyHVPt8AgwfPX63fTBQ+oazyTS/otrpA5sInVuIjKDnvAI9efjJdRzyzJVXKl6l+rX5Kgc8hLhow==@vger.kernel.org, AJvYcCVZWqSwS1oBP1IEBdj7OWLv7Wl0uJbcSlF86iWFkNLolEl2fntA91ztb1d0oA2+w4/LcE/dD6cQVZpR3YjN@vger.kernel.org, AJvYcCVql98JHjIE4DBryiK7Kozx2lJqbDmBSL3KlkWJOS/o1d0vtGgh/t6KKmF9L0gTK2c+WdwrKS7QZtSC@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5hVr7HsieAI9hRuWRgdMD8p/S7XomoHcDDPPiDowc9z7aa4x0
	X/bSbp0zvblKZ+RezSXAlX+FnmLXxrBSELMSYMN5Ybv1YvnulOG2Xys9dMHyF4A=
X-Gm-Gg: ASbGncvNAkYNV0UUSj3r1BF/gST2m/uSijEOrwwjfvmwm6eMAAGNQyLEWg2j6Et3tKa
	Sm3SaLY5KjHXunhB83EB7ZiEBZ2TcfKjjoouaKoX9wRbDidkVqeknhbVPeJbmtuK6WykuxsnhV7
	Ii8dVauUbg4G/ScRkbe6Hseaex9IqT6mx2uTr4n7tFYrKRdu4oNe2fi+W+OMU4ZiH5yDVb7l+jm
	MV1culBpkZxklEF/CXR6NijBEXDPSTpbyL2o0lu58u+6sNXqJ4L
X-Google-Smtp-Source: AGHT+IGtBu8JkWRl0VZ3rvfE5U2eNRZ7N0BrJSi2471FlTZ04TG7ZhYTiMBXlii/7aGiCnOVUB/OmA==
X-Received: by 2002:a17:902:f608:b0:216:554a:2127 with SMTP id d9443c01a7336-2178aec111fmr4336265ad.41.1733931565694;
        Wed, 11 Dec 2024 07:39:25 -0800 (PST)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2163d978286sm62357965ad.277.2024.12.11.07.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 07:39:25 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: johan+linaro@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gty0622@gmail.com,
	chenxuecong2009@outlook.com,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH 2/3] firmware: qcom: scm: Allow QSEECOM on Huawei Matebook E Go (sc8280xp)
Date: Wed, 11 Dec 2024 23:37:53 +0800
Message-ID: <20241211153754.356476-3-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241211153754.356476-1-mitltlatltl@gmail.com>
References: <20241211153754.356476-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the SC8280XP-based Huawei Matebook E Go (sc8280xp) to the allowlist.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 72bf87ddc..deff48d01 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1769,6 +1769,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_send);
  */
 static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "dell,xps13-9345" },
+	{ .compatible = "huawei,gaokun3" },
 	{ .compatible = "lenovo,flex-5g" },
 	{ .compatible = "lenovo,thinkpad-t14s" },
 	{ .compatible = "lenovo,thinkpad-x13s", },
-- 
2.47.1


