Return-Path: <linux-arm-msm+bounces-27343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 791DC9403E0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 03:38:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A98F21C21B47
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 01:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9078711187;
	Tue, 30 Jul 2024 01:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m8qgsh+a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17535BA50
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jul 2024 01:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722303524; cv=none; b=l4onuLR23l9xRDyesvIkraFOOjvAW4bxijOswgOddCV5/J/E0teKMS02+JositAC90bOPf/zDOljeEACMo5CHcoSvyVjqhjTpfJygHscjV2IdCAP/hOBJcU6Utqp0ka5GNumVKewkLS8e2Q/tggM/LgbpO2ruOxaOrwfmEqRK00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722303524; c=relaxed/simple;
	bh=xNW3kN7ZSX0e0dAq/+fmIZsv1U5V2APK4QPpSC5MnNk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yr45FDlywPHNmyLVhGYsh1RYdxdra7MSSBWNEu2Coli+eaFAV6Xa8NjWj8aFyLFGVa/Rpl2it7E0G/rlJZc6vxla3P30FhN3u4YcrahEOxvkK5Z+vUuw8VBTI4JNUq+9R7/Gmwe/pQfaJfa1Hu1OUpLygaBW2zg0t5gO7l3BDzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m8qgsh+a; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7a1d7a544e7so291636885a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jul 2024 18:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722303522; x=1722908322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R7Ce16ep8oGXOywNJjzf4pkNH4LytOu6+bjW+V94IM4=;
        b=m8qgsh+aGikHq3h5jn1GsqzeYpOzlRVKlR6fMTPydLR4TxaX8IeedqYqCy7CGnPU0O
         WLyNbzjxRINRcKw+7LmTY7k/ecdldk6B1BwAoDMv104701uqINP5eTH/jzv/DI3wDthY
         w45YSBwpOMDhVMsQGDc2kK8U02rinlQoceCtYOVe+7p/HpFrKlFdCPnZcPzSFjqDWHP7
         2ds9GPYUv92SSuX569cu2AIuasbiqBCkVTwf2SAqZOIu0FR0yLLxI+qBGRkKWjzB5fV1
         vI3ip7ZQ7A3EuTP/cEC1eXYLhW4FSsLOOERqctFpyirAGTdAavgX9n9QWNO71xfTKIMR
         RUSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722303522; x=1722908322;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R7Ce16ep8oGXOywNJjzf4pkNH4LytOu6+bjW+V94IM4=;
        b=GtonrNyFLJQsXR6GiwElmn/ZO3N5mJjoA6WYdbiBYNpgd3a5+WQ69aBDbT3sGLEnur
         AI9cl7ndxQmARx+NbTDPqDSDKrrcIO8e1Ed/i+wo+0Q4t/+KzCUkDnPFhaCLg6wkMscJ
         WPUHHf45eMLrexiDNEKtQ6s7Suld7PWhOYqWWsalnAgPVnZOIMK5+nFrbquIDx3cfW2c
         9oIv0pI2aQT3kliU4+jGhTgjR3MbrquIsBosKkScb0yAaHeZNsEZDJOtUR9ATQTyMoCi
         Oe8Br9xgUxBrvKd6GLEtyZZ7S8/9jngdA+s7vRJeqKHlDecyTUWDlQlF2zrJ8XCdVsUT
         ywGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtC/d99TfAeQRGW6F0whgQJLLOcLolxzuj4Y8XeN+wZN0lo3M8BZ/gq29PT2gcbO1ysJ3UvPT1smr8OsZE+I3qCN9gLOkabkyBnYcOGw==
X-Gm-Message-State: AOJu0YyLdDYYuJeKXuvBOdnG+Y1w2VZk8eQwfguxGY48It7nEwtk9g6n
	oQSfvnU/ukhNEPeQ+IBjomtO4T6owP78x16AQgCYUxghorKBlBHv1antKdJC
X-Google-Smtp-Source: AGHT+IEm8Ltj1jd8rqMWNmhQJpMbx5+Qt+xsqYApCE1e4u1XCDV8ikgEUNgDCNHO0gbCq7NqzqBUzA==
X-Received: by 2002:a05:620a:258e:b0:79d:6349:32de with SMTP id af79cd13be357-7a1e522fb28mr1146254385a.7.1722303521839;
        Mon, 29 Jul 2024 18:38:41 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200:324c:b818:b179:79b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a1d73b1786sm595208485a.33.2024.07.29.18.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 18:38:41 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH] firmware: qcom: tzmem: disable sdm670 platform
Date: Mon, 29 Jul 2024 21:38:35 -0400
Message-ID: <20240730013834.41840-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Pixel 3a returns 4291821499 (-3145797 or 0xFFCFFFBB) when attempting
to load the GPU firmware if tzmem is allowed. Disable it on SDM670 so
the GPU can successfully probe.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/firmware/qcom/qcom_tzmem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
index 17948cfc82e7..5767ef210036 100644
--- a/drivers/firmware/qcom/qcom_tzmem.c
+++ b/drivers/firmware/qcom/qcom_tzmem.c
@@ -78,6 +78,7 @@ static bool qcom_tzmem_using_shm_bridge;
 /* List of machines that are known to not support SHM bridge correctly. */
 static const char *const qcom_tzmem_blacklist[] = {
 	"qcom,sc8180x",
+	"qcom,sdm670", /* failure in GPU firmware loading */
 	"qcom,sdm845", /* reset in rmtfs memory assignment */
 	"qcom,sm8150", /* reset in rmtfs memory assignment */
 	NULL
-- 
2.45.2


