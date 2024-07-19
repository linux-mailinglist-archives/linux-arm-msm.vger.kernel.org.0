Return-Path: <linux-arm-msm+bounces-26658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25603937D38
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 22:17:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFA9928249A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 20:17:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 699CC149016;
	Fri, 19 Jul 2024 20:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sqQkCZmD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47BE148851
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jul 2024 20:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721420214; cv=none; b=ljg6U0JgTiQZnuCyogneEucOZjMWWfUL8Jnh64o9AmiREoJvfVz8VroPGfdI9jLb54JWa3odPUQpR8wvhwXBfm6KFKHn9xER2DXZXy+mX171BkNBoVV2o1TYChE/kvmy3FCNpfSjZnemedbJJ889vyE8a8UZEFHvdy84ExGtBww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721420214; c=relaxed/simple;
	bh=fwA0gASJGgLyFkPUutJcnhMUxHqCpvG5Y0TSyVjQwHk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wi1PqnfX5jAdceRaTFsDZ0lQtkrPxCAdGypXTv1okRYH4MDutInt2ZXUDLSwnV4RVgl3qxtUsXQNhflVOWstHGANkQamxBRt0axkuqWeT3lXZseC5Dhg5wpbzcElwQ6Hel+VGyTY2+vxYvvucz/a5X7AqX3lbMxRh3SP+ZlTVXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sqQkCZmD; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52ed741fe46so2691564e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jul 2024 13:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721420211; x=1722025011; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7L+Ha6Lo4uMI7hFHu2cTJX/augN8wusoR9hTrOEBonI=;
        b=sqQkCZmDw5AQHIcx3XffTfW/QS7ou3H4ky9jjgDI5EYhGc85YXu9Xs95C35IF7Oe/X
         wm2hhzgYMwCTRlXb1NVtbBFpTjqIrEjeNDke60sgUyD14H+LMrs471w4Hs3mk26qzBN9
         QtHzjNTGcL9d3qqf6NIMoCZLsrYHa7Obn4NYNKlEMi+SLi1/HwYwVs8evT31eMp3Iege
         zLs4rK7ttT61JCuWht7S5oUIGHhOUhYucak3666A3UZiQ8pxNuWMbHuBLivTNb4LqKNB
         kZpxrNCfzwDLk2ZU1zr+WtWgEtORGcphAYp/6lj8AB5OXVIa8PA/2ofgZxbE34uyNZVB
         SLYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721420211; x=1722025011;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7L+Ha6Lo4uMI7hFHu2cTJX/augN8wusoR9hTrOEBonI=;
        b=Ao5yAAxEG2VDAgiOyGvkSzL4Jy/nFCUmuPbdW/x7rack2PZeqO+v+wkG9eHCUA1Q4K
         jrCy51KzCom60zAB05gl6rLok/2wqio4dnNbwSxDApyULVvQi9d1s+2lFUBO350k1coe
         U/+sebSWXsz86I8doXz6sqM9JR33t2ht9e7NH2Kyq7ruU26CP2EB7fsjiTZrMnwYYLby
         yxj7qY0kppU4PLv5ITUz/TDuVpBSj/J+xfc5V8Sok6FMmFQy8HYiGUO5TeGvpzS6t4If
         G8jm53cb7/WaqrdUMByZwqWh6Gg8j+OdCoAKH/srpi7sEHt/pLNXISX7v+p8YmyHiu+E
         mLxw==
X-Forwarded-Encrypted: i=1; AJvYcCW5v+/DXI4SgrKXca9qgVHx2tz/PBRe8lkUsSwh/Y1G3TYG24fZv2/z3aEMTWMRkm79u3adpfF44TW7KBRQXXWVNMBJnaALBeBDRz1naQ==
X-Gm-Message-State: AOJu0YzMd7AicHosLiXdHuVrfVzLbrEcOS2kKguE2dIan4pn5by54mlG
	M6dCAM1aNXn6/VOpYGP4N7aEbA3wV7Yj2hRjzRLaAlREVmh5CQ3adFNw8XFdK74=
X-Google-Smtp-Source: AGHT+IEwKC6Gu2a81Q32HmnTHTLkPoTMxkG1vq7gIU7XMKOBgomFXweERKrql55zp9nz/LWO13Y7uQ==
X-Received: by 2002:a05:6512:b21:b0:52e:9c0a:3514 with SMTP id 2adb3069b0e04-52ee542706bmr5914629e87.44.1721420210865;
        Fri, 19 Jul 2024 13:16:50 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7a3c922b6asm72332266b.172.2024.07.19.13.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 13:16:50 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 19 Jul 2024 22:16:37 +0200
Subject: [PATCH 2/3] firmware: qcom: scm: Allow QSEECOM on ThinkPad T14s
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240719-topic-t14s_upstream-v1-2-d7d97fdebb28@linaro.org>
References: <20240719-topic-t14s_upstream-v1-0-d7d97fdebb28@linaro.org>
In-Reply-To: <20240719-topic-t14s_upstream-v1-0-d7d97fdebb28@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721420206; l=800;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=fwA0gASJGgLyFkPUutJcnhMUxHqCpvG5Y0TSyVjQwHk=;
 b=6QtW+plarVT3QHXjdOJZAlUGLCTfNtD3Pe+7nuCQQfdI/ejdsVUjDj/oELb0eQWrQm766RVfY
 8W5qmRYYL71C4uZ6ACkpawApkan3qGT7aIlzEbIzmmqr6P0PUDYfMbZ
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Add the aforementioned machine to the list to get e.g. efivars up.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 00c379a3cceb..e60bef68401c 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1724,6 +1724,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_send);
  */
 static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "lenovo,flex-5g" },
+	{ .compatible = "lenovo,thinkpad-t14s" },
 	{ .compatible = "lenovo,thinkpad-x13s", },
 	{ .compatible = "qcom,sc8180x-primus" },
 	{ .compatible = "qcom,x1e80100-crd" },

-- 
2.45.2


