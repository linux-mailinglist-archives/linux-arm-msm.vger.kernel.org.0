Return-Path: <linux-arm-msm+bounces-16720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DABE89B501
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 03:04:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C53FAB20EF9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 01:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A1B815C9;
	Mon,  8 Apr 2024 01:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vx7aln5a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B377EC
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Apr 2024 01:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712538262; cv=none; b=a3wuJnc+slnvtha8yX7hZp3h1ROb71ZDVrq3Ycl2OcTxfN2WwSprPY6epz3BjNP18XiZweXL0RqoKJJtCix25r6aFZlP8B1q2YPIG4FUwfQIZ41FMCXSSCwHw/EayPVcQj4RghrqwBD+gl6jVezsmshPdWwW54Y24Zcvc9y5s3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712538262; c=relaxed/simple;
	bh=Q9EaREj0DOMVe3+66xhbQSHhWfQTkjOgkWHUBDSng7o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YC446Y3fWmTm7PpWtl7BxkXn8RKf/ScfwSSylXBYwH8WP/1bH8V3Qw3pFxGw+1a+bTwOSc66zl8kdiAbRG30k1tSYwo9PcsxDCj738eER9pzgXXJ06VUWjW2zYjsRqOkrjETA4MiZyungGIPfprdzYbSIUTTZswicLQO1snVrRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vx7aln5a; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-516ef30b16eso1011573e87.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Apr 2024 18:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712538258; x=1713143058; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nd7IuXfTq3omy3bcTN0HTdof1DpJerBaI8M9m/vGL1c=;
        b=vx7aln5a6ozEzb7PnvgnzvHE0Ge97/j9IKsmAsykQ/hqkTjf2YXiWu9lsXbn7Fe6Kc
         RXfT1mdI2cIkKD1Z7IanrQth6lX1/WeJzHz5hRD5odTTSziBfbR1BOWyl+z8VOjL+GHM
         GNqfI5Mg/ISKJfZ81srGLnQZO7ARixyM7u9zs8mGP9yFi8ue7ydlA+iO9/lgctF+oLrq
         cpy4vxrmdmiUMn38tunstbBivFicMQ2v7C9tYsYlvrtZmZTNq0dOhX518gzVNzF6FXTG
         kEEBLkvyHh9s5MstKJPJuFOfomb/jVdWjl+tpLnpTWXKTCaCPITxwSqP9TmOWtDI/ffp
         oyYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712538258; x=1713143058;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nd7IuXfTq3omy3bcTN0HTdof1DpJerBaI8M9m/vGL1c=;
        b=t0W2O3bv7NMrDrv6pVplpbctfOYL7Jbdfyv6CHqwNd8NnMvkvZCkUha6gbPQtP3Nfh
         V8e0DIrCg14BCgtowh3Ntam9FUE59X4bMSNsK7VbDWKz+agd4A3kblBGvF/lgvEE01kS
         O0o4kK3TyxVUDtTkwWusuxOzZW6DeNfFq047lw9q2PYgYh3Rk1pblSej9vtBqb7brTKk
         +2YPHTnMh5m28aQdw+q6sqJi6ofujdPngQAtKSryW4y6ijcFOVn/ju4LET4v0bKtUV/U
         QcJAXEmq6gXmKokLlLFVx85ayWwfezwE+r2Se4mgd1YIwTbZsATQiD9QfN/CInXgpxaF
         kewA==
X-Forwarded-Encrypted: i=1; AJvYcCUFycLwjdXKfoAA9knE3Oyw0yEuALhiGRgpGsRkoU3cMA1AFDjY6yOMWm9Hi68JaoaUEu9Zh6S73E7y7R/DNY3/vjarlVVolUCRhhknqA==
X-Gm-Message-State: AOJu0YwhL/JGXP6tEDvzTmRxvCLYUnQF1L3+tYeCWwQ3QtEQyav41vvj
	oDAZtFUGSzpt5YxBNd+1vD/IQmabC8xDvl/IFQMmtfVpru4NXs72xEiJ6yuD0IU=
X-Google-Smtp-Source: AGHT+IEqypaPMJ0B/WBOm7nWcyZ71TLD/v8TIzEbi6ptXv+Y9tDUz+ZXCpoQWv9IbGp+AlmVhVTN6A==
X-Received: by 2002:a05:6512:3b90:b0:513:27a1:24cb with SMTP id g16-20020a0565123b9000b0051327a124cbmr5901069lfv.51.1712538258511;
        Sun, 07 Apr 2024 18:04:18 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id m29-20020a19435d000000b00516dc765e00sm674034lfj.7.2024.04.07.18.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 18:04:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/3] usb: typec: ucsi: additional fixes for Qualcomm
 platforms
Date: Mon, 08 Apr 2024 04:04:14 +0300
Message-Id: <20240408-qcom-ucsi-fixes-bis-v1-0-716c145ca4b1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI5CE2YC/x3LTQ5AMBBA4avIrE1SVT9xFbHQGsyC0gmRNO6us
 fzy8iIIBSaBLosQ6GZhvycUeQZuHfeFkKdk0EobZVSLp/MbXk4YZ35I0LJgbcvCNLVxlSVI5xH
 oj2nsh/f9ABBfePNlAAAA
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=677;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Q9EaREj0DOMVe3+66xhbQSHhWfQTkjOgkWHUBDSng7o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmE0KRm3m1f38D6APNZOrOmArcoZQGXr+7re1I6
 GUJ3yJ9MFmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZhNCkQAKCRCLPIo+Aiko
 1WUGCACeEPZHjpvdQURvSdQNKzKAw/GXJhVzNdDi4aG3Tt8Pc9rFj5DIsgd6lZXuczAKOoxpAKA
 B5biOIQQhIf5XMzf35FgmyMIdrrylRTICgYnMl4jQ9tR7TMK/lGCTm1ZBzBfH2DK+lqrmW+LrU8
 1SpHIT4FKug9AtEoE7qgc3zaiPkiyQ+YKiUuwCU2Sn2LADNugiX5GFOCGoSrGjdKwne7QuVkuMd
 +0ejWyJDinHcFbVyqcMiClPBUA+URFa/7N65aU5YEqJUKI52QrceTIPMmsTdNkicOmG6zgx13Eb
 FRJvNcIsB7yM5ZNf7irjutpK/iGx9fHV28DuarD5aGfL7134
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Fix small issues in the Qualcomm PMIC-GLINK UCSI implementation.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (3):
      usb: typec: ucsi_glink: enable the UCSI_DELAY_DEVICE_PDOS quirk on qcm6490
      usb: typec: ucsi_glink: drop NO_PARTNER_PDOS quirk for sm8550 / sm8650
      usb: typec: ucsi_glink: drop special handling for CCI_BUSY

 drivers/usb/typec/ucsi/ucsi_glink.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)
---
base-commit: 25e918cf1bb906bd9aca19ae0270feb7f6d68783
change-id: 20240408-qcom-ucsi-fixes-bis-6b314764c5be

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


