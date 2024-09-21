Return-Path: <linux-arm-msm+bounces-32142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5998597DDE4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Sep 2024 18:36:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CED281F21AD1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Sep 2024 16:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 812E817C9E7;
	Sat, 21 Sep 2024 16:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dbHyxFgf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2E817C7BD;
	Sat, 21 Sep 2024 16:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726936546; cv=none; b=GHk9TAu05HHN0HsTuUXU8LNHJhPV8C1wEvlo3hQYHja1wUYtxcmg9De2ca+q2sozvI1Eexf4E3A+hC2PYKd8cOueIZWwTUpPc1OjzfJ0lyPTqBC5Vq+eKO+7gO9tU1cE3DCOryMBlxosj+gq/ECDnQ5EeAU5D/pVDOPOlksTpjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726936546; c=relaxed/simple;
	bh=5Gm0OA1kzKN3+4QKvHKpttUaZB8jt+wplqsvszG6o3M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o8nE98c7o5YZCpz1scRTrRr7SQtBu1r6JC/amla7nAEkdzWRFRzFEiZ1Gv92guCyFZGwr1pb4kLDwbdhUg/xqhVr+D4ADTwmlQROq8f/ySAkyV+ADC4m0pcpiYh820elSuXj4uPVELZO1GCZvkDjnKrxz4cbThHZWn2LmkG+xWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dbHyxFgf; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-718d91eef2eso1923815b3a.1;
        Sat, 21 Sep 2024 09:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726936544; x=1727541344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vbFMYcIHdwvQN/rbKFy0BKUyRQg3BZT9g5FBfkuwS0s=;
        b=dbHyxFgfMHy/9fykG4l6zy7BidLFQFF2gSO3vK0qGuTRSQK3SMezumlDGHoNXZIWfx
         2ffoBiTZiq6sdrGfnpkci29ge2nVA9fKuQ6NEhGzyQcgQXX/KYunmtbslG8W8VAmYb+M
         /NZN/cWElJfSG6GVlfrNLQHULQfgY7NSaFD5nh3zVE2BJ+tK/V2KFGQCNGAsgNHNPTOf
         OF5p+7VE+QlUhsIlfD3ILZF+A/M6TqMv4Ve4hR4F/KLgMZsGoL+l5lPn3DeDMN7WqJV9
         mYjOSsZEH0oyiSDSKaAFR/u3/wLIRApAtnrNpGviNxxaWyB6h++1F/s1gAvmuSEb9NAv
         O6iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726936544; x=1727541344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vbFMYcIHdwvQN/rbKFy0BKUyRQg3BZT9g5FBfkuwS0s=;
        b=StuanfWSqo/tB4RMPJPVpFIPK8l1Qcoa0oKZzKAlalbShsxHfZ0g8WPc1+MaDHKCla
         f2DZTZbyalYXNjdbDQUlGzXheA8ITB4SGxsS8LkygpUGOZFlutElP1yXn7QMRSQ9asXf
         nzIDNBES7UJczVYI6lRfeDlTTNgfSEwsQ4CZjBUIni7KDiOHOjt9xV4JGiy6Rr6RBT/S
         cfG7BQW5VKtv2AMWqVkXPNI8udkrD1xGVxYAjYiGH0cdjxCf7wS4ZiV44m260QHM1Z2Z
         LHC+gydmqiZXltmbS43ZUfl+I6OUX2Kz+3p6Akq0RULFqELEDy+T1rDvLqNdVDkSAM3n
         bonw==
X-Forwarded-Encrypted: i=1; AJvYcCU0rqqbg8hHAlUhnKL5b2PqBVKlNPpDNj7p0GAol5aT3tCt0NaTvlPvYObrC3VcEo1gIVm9ZaiEqCD39fQnlg==@vger.kernel.org, AJvYcCVf3OGdONTYa1oYtpyvHhNfxUnLbziO9UfO3w3NQPsDTNZICkLvw6GZKQ7VHeE16pK55a3dv1Fs2gKq@vger.kernel.org, AJvYcCWiy2J81RLoyXmvuLtQ+9nZ+giYj8LNzf9WFPK85mq3rSrZZi1m42CRk8VBw6x46e8wkOH+tSwMZWz1wh3O@vger.kernel.org
X-Gm-Message-State: AOJu0YyeUKS9BKaDxhyEVB/Yrqu/SIOMwfxBVk4ZXS88UYeX/ALJzFDo
	/DWJsxo9yhv+/vSxPyREMIq5GTzh/vAGT9X68crq6rdt3RSFTwY=
X-Google-Smtp-Source: AGHT+IG+euDvXZbto+omMfHsLCLuh+zgUQRlEGKkd3IZvINe+5gVbeKo2FnfiT5iwnNVPB7+fIDDRg==
X-Received: by 2002:a05:6a00:1388:b0:70e:aa7f:2cb3 with SMTP id d2e1a72fcca58-7199b06bb19mr11349203b3a.2.1726936544271;
        Sat, 21 Sep 2024 09:35:44 -0700 (PDT)
Received: from localhost.localdomain ([183.80.189.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944ab4e5fsm11406430b3a.49.2024.09.21.09.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Sep 2024 09:35:43 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Clark <robdclark@gmail.com>,
	Peter de Kraker <peterdekraker@umito.nl>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: [PATCH v2 2/3] firmware: qcom: scm: Allow QSEECOM on Dell XPS 13 9345
Date: Sat, 21 Sep 2024 18:33:32 +0200
Message-ID: <20240921163455.12577-3-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240921163455.12577-1-alex.vinarskis@gmail.com>
References: <20240921163455.12577-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow particular machine accessing eg. efivars.

Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 10986cb11ec0..5d8afdb3b6c9 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1731,6 +1731,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_send);
  + any potential issues with this, only allow validated machines for now.
  */
 static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
+	{ .compatible = "dell,tributo-13" },
 	{ .compatible = "lenovo,flex-5g" },
 	{ .compatible = "lenovo,thinkpad-t14s" },
 	{ .compatible = "lenovo,thinkpad-x13s", },
-- 
2.43.0


