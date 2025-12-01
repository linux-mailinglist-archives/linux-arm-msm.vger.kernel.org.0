Return-Path: <linux-arm-msm+bounces-83913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D755C957B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 02:16:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EB0F14E0671
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 01:16:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A8B0155322;
	Mon,  1 Dec 2025 01:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XIwNDYyk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6F084039
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Dec 2025 01:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764551755; cv=none; b=QNb7ft6CG17f7f7Ow1yQz7fsQCvtqGO6bSmYXnmN3A1WGoc2tVH3PJdRrpxVrGPqjqhqUUd2MKqeH3+/RXdsQp51zWh51Tvy4etGxL7LMO1s7ShsCv0vlvVipSImvMlaCgwtIzNV/Fxf00jYZ+7CP+HvPDRW2g/FhJwRdIzTiNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764551755; c=relaxed/simple;
	bh=ymdj8iWQgXeJ9doGMASDK65eKURG2Ow4j7RDRnLK5bo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WIp0roVSw2vpParUO1rRUjbin1QbGAgcAiyBP1upN/cvpQJdWmbHSsvYVfYkA5OLF/5iaP8WBAu5yYF0tGLyj4FRa+n1WIvGGVWIt7QWcz9VwYPJ2QB+p57hCbM4yUzpLFJeM4Z6675tedLy4G3iV2uyF+BPKS8UFUsDrrPcby4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XIwNDYyk; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso36590205e9.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 17:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764551752; x=1765156552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VSFp1WyHU0nZAFVKsmUn78bPo/8zi/N2062JdvrUp5k=;
        b=XIwNDYykcwwSvWTrPLPB5DrBELUAac+4MvMXLdJnOsBmvlq9PJ/wkY3pWTLp6m4We2
         GGJV6XXvPY9mfpPHsjCY6SMibbYEQ2R8lEYv0LaVtOVGI28a/Euc4pXyUWL3zmZVvBMX
         gv4pbXcz02oO0x013kwLyEQw67N8GB+ZwMvTQyUMRlQ4kXvrjj+PiihoSftCjUz8riTj
         3deGJVciAdoKk4EdfnGjUuG+xb51XnqIMod62iQQq8CsljhsYbbzoWKDrubVpXhcoIRS
         pvgc4nkFC7vIy6zxPdVBj/Maaz33e5E3mwI/HzZaI7Hp6KY5+UW4h0WuaO/NfGQtB/Cr
         w+NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764551752; x=1765156552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VSFp1WyHU0nZAFVKsmUn78bPo/8zi/N2062JdvrUp5k=;
        b=NecE2rntGP8FnTXb0fG2gfHvE5YM63U+uhPGX5qKZ3EGCun2CFclKkaGEsccniPjtJ
         +AYIfWlc+tKvqRSgtPPY2iqhdQM5f1OxxCLWMjU4kyqS+gvE2W7UfHiCNuu+Sn3Y7DNC
         T0xOJSAkKOLL3vjFC71NF/6AA8SWddndApggNlqRETmWaNRBYtvWE4AT0+pt5OGzGYOz
         3GAgGONEngJc7sC170ZPaDTKSZOAiz9ajQpXmZViKyE6UVlUh1sxjvAC7jUM43C2T1HN
         kCHqcK0DJAbEecvnEmdmGQfYvn51HXNlwwR2k6a9ZCctS7OGtK6jv/D6HYiJjzrHgFaS
         obtA==
X-Forwarded-Encrypted: i=1; AJvYcCVyPZPYboeegBTxaKJr8YCNLic5dQ+NvkdNM0GyL6w1dRe6qAvKC58whIO6UHs9LUo3Qz4gEabr6wDwT+mY@vger.kernel.org
X-Gm-Message-State: AOJu0Yx28R5bD5+z25Uh7/VaKdR5LXR2dAEAewX50lxgddh37I2wbaUL
	nP6ppG4zFf4uxoEfGmxYKvvqaNztrjQSAJfPc5oFE4rcf+srZt2M9Pk2
X-Gm-Gg: ASbGncvEJuxcHRgIcgHO4CHqiTMMeZs/wul+TcYCHk8j0wfQykJqteWG7hbh82yoVp3
	JWOt4f45bvESv/OySx+Mc9JS9a1qUQQDP5LJOCO7SKdFkUGp0FFZgLWcv0Ws/xUMfmHr2AidlWx
	mlPL4yLyfXz0kphsqEfa3mE9Nx3nnpacwPCSZQN5IPEjtcTRqDeczkGbKreqqS2G5CVWbRkJsUc
	b9BMUp4x4NWA5lCeuC14oaGu3fBitAkm4V+MTD0/Wn9A74r+oV9pgR5nwiPWgETXIA+u+A0NgUd
	oLFN0jO3iOA+o0SCKtV9g53nRGkEzYuUtxkM3gYBltyBCl8A7Ph+zJ5cZiusDCZSbgs6dFrL5g7
	pthRP7cF+ufpmr9x6UraYwXonG8QRzvy7n4kMonrmNLI0V/cToqjtFBukNtxqD4P8I2aw8rbbL3
	Snl01Hpd+c8FbBNCOFBtA2wxIbUuSyVVTBSeK1UZuoJDLVev0fQ4BlvQ==
X-Google-Smtp-Source: AGHT+IHt1vGUsA7Svez/JxKX7EhEA/6WSnSYAf54Ktb8Xzx5CAPEEKocZCZzK5dSnv6h/Fl+2Vf6Iw==
X-Received: by 2002:a05:600c:358f:b0:479:1ac2:f9b8 with SMTP id 5b1f17b1804b1-4791ac2fa2emr78862555e9.21.1764551751787;
        Sun, 30 Nov 2025 17:15:51 -0800 (PST)
Received: from alarm (92.40.200.0.threembb.co.uk. [92.40.200.0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479110b6da9sm216152305e9.0.2025.11.30.17.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 17:15:51 -0800 (PST)
From: Dale Whinham <daleyo@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: =?UTF-8?q?J=C3=A9r=C3=B4me=20de=20Bretagne?= <jerome.debretagne@gmail.com>,
	Dale Whinham <daleyo@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/8] firmware: qcom: scm: allow QSEECOM on Surface Pro 11
Date: Mon,  1 Dec 2025 01:14:43 +0000
Message-ID: <20251201011457.17422-3-daleyo@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251201011457.17422-1-daleyo@gmail.com>
References: <20251201011457.17422-1-daleyo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Enables access to EFI variables on this machine.

Tested-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
Signed-off-by: Dale Whinham <daleyo@gmail.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index e777b7cb9b12..5d123c11d8ed 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2007,6 +2007,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "lenovo,yoga-slim7x" },
 	{ .compatible = "microsoft,arcata", },
 	{ .compatible = "microsoft,blackrock" },
+	{ .compatible = "microsoft,denali", },
 	{ .compatible = "microsoft,romulus13", },
 	{ .compatible = "microsoft,romulus15", },
 	{ .compatible = "qcom,hamoa-iot-evk" },
-- 
2.52.0


