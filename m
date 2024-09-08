Return-Path: <linux-arm-msm+bounces-31228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D890970A80
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 00:41:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20B011C21463
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Sep 2024 22:41:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D17B17BB0C;
	Sun,  8 Sep 2024 22:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cLmlYkxE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E889172773;
	Sun,  8 Sep 2024 22:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725835258; cv=none; b=Y0sIQ8u5eXtlfzVubDWb/ml8JQegsbffojdLN6nZDfUTz0HYmCOLeIwX63Ch3S+hg0dgQ2eI6I8PDtwO7vmoiufOfQ7cKRVNl899ycpsnM69iSvsEoJpi34Fmqajy1uBhSCdhGViMpO+AJ1UfmFw6ySxKdURm2pkYyplptPySqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725835258; c=relaxed/simple;
	bh=3lLgxjxJK3uifHsprkkFu/oOKERENFoeSzGv4F2cfwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uufU+yWVBuNHr1nZBN/XZcw8n+y0DY/616f9WDRIsILwzF8VjZzrqxCUmfsjHmKCEg48AaD0qIljcu/BsWSuPZYAB8kFt0ktqkf/xVGVZ40HOnxvytEuee0uLcHklv1iTs029tO+4EwbFocm9YM9f6I+ZzFPi5q0cUyD9Ra7hps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cLmlYkxE; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42c94e59b93so26211435e9.1;
        Sun, 08 Sep 2024 15:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725835255; x=1726440055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5e45CHpcKZiyJ3dH/Cw2nc6Fvm7wL+FD0pX6Y4oHMc8=;
        b=cLmlYkxEIZcmBjUhk/O+T9g28XKlTk3WxQ8Q2tyaQfSVVVouTA79q9YqH94W+Sutha
         a4Xj27VhE1u0s4pn9m8Fu1fjTeDj9G8a/oPcfOaUHID3ysvNtvnavXLIoIORmnI4/7mB
         FijtMX0ZmGYyBD3dgjinkIVmkz1NXEmA0pTzGnUpHwiC0rhzU1xeUcUjKnzkGWBQtvx2
         OW9Jye5QcXxSWbPwzocIg1hguCUy052LH7O1xgeT02idzjBonkMA2Bom06s3CvOkzpPb
         AkD8rKFTNEhsQB62Wv/Mk6DB+T4fKATvdB1MPiy14EVwm9mvu2qv1bTaanlPDpvsSWMK
         JCTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725835255; x=1726440055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5e45CHpcKZiyJ3dH/Cw2nc6Fvm7wL+FD0pX6Y4oHMc8=;
        b=EPPFNBubgSVwuQIwjFM/BwjbKFi5jO80tRST0BO785yCNUTtqBxibowQ1QEkxBxFU1
         8J/QBxSjGTKG4gnJz4CO/xNLlAGVOU4I/A+BZNsQ04cpHbKUeFlXLq8HPyiSe8asr2Q4
         pMN1r8mKRnIsICWrrzke5tf30B+zlQy5KdNxqPb7bo7kkZIq33zqVn8IkFqXPI/cej/8
         J7bIsAkNql1ESDs21pIGnykb+QBGT3kQyjOiLLuuMj+gVhoDLTuVGysq3YznvAF62l8n
         IRx/0oBpkhJBBZoupOLf3vnJSDLQRSHc4nPQ6cwZrRNU7UBJBa/ApAeWQnPU8J0mVGB+
         4e1g==
X-Forwarded-Encrypted: i=1; AJvYcCVbM5CQM2NPMJVfG5lEaBEc36zwoSs5WdXcVgt5YHOjPUvxxzzgA50Ob3vVyEkIiRPz4OtSmNXX4MQIll2r@vger.kernel.org, AJvYcCW/6r3U6+vmrzcjUi550D7K/IzjCJcF3CG8aP1NZZTm0efRxJmVMbv1fNslVgaPWNnRSDNy2+9ZatPlk1Iuug==@vger.kernel.org, AJvYcCW7Xe4LnCt/MGfRV0oq9oH6XvzVSs/HX0cCYnF/JXwM1z0BsGUeLYEi9yiSOovteZdUPXl8fMkXE9tX@vger.kernel.org
X-Gm-Message-State: AOJu0Ywpx8UOOSq370hQzeCO2EVO51XsT29xumHt2/7vjWTI5wpLQCmg
	BTwqq0q0KlxSihoSKzpypxUhsjXRpdK2ROeri3utd78BR/8iZrHIMlBOPp8=
X-Google-Smtp-Source: AGHT+IGY+A9s9SjWk4b5NPP3XAPEx3OTtbYIMMdNEB/KbT7Th0cMQfmOsXEuaxzXlZ4o74MJdJw0Gw==
X-Received: by 2002:a05:600c:4ed4:b0:42a:a92b:8e06 with SMTP id 5b1f17b1804b1-42c95ac1815mr93620855e9.4.1725835254592;
        Sun, 08 Sep 2024 15:40:54 -0700 (PDT)
Received: from surface.home (2a01cb080508df00ca9665fffed23409.ipv6.abo.wanadoo.fr. [2a01:cb08:508:df00:ca96:65ff:fed2:3409])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ca0600651sm90883925e9.32.2024.09.08.15.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 15:40:54 -0700 (PDT)
From: =?UTF-8?q?J=C3=A9r=C3=B4me=20de=20Bretagne?= <jerome.debretagne@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maximilian Luz <luzmaximilian@gmail.com>
Subject: [PATCH v2 2/5] firmware: qcom: scm: Allow QSEECOM on Microsoft Surface Pro 9 5G
Date: Mon,  9 Sep 2024 00:35:02 +0200
Message-ID: <20240908223505.21011-3-jerome.debretagne@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240908223505.21011-1-jerome.debretagne@gmail.com>
References: <20240908223505.21011-1-jerome.debretagne@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add the SC8280XP-based Microsoft Surface Pro 9 5G to the allowlist.

Reviewed-by: Konrad Dybcio <konradybcio@kernel.org>
Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 00c379a3cceb..5c8d8d75fb0a 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1725,6 +1725,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_send);
 static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "lenovo,flex-5g" },
 	{ .compatible = "lenovo,thinkpad-x13s", },
+	{ .compatible = "microsoft,arcata", },
 	{ .compatible = "qcom,sc8180x-primus" },
 	{ .compatible = "qcom,x1e80100-crd" },
 	{ .compatible = "qcom,x1e80100-qcp" },
-- 
2.45.2


