Return-Path: <linux-arm-msm+bounces-37145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A0A9BF206
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 16:46:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A40791C25094
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 15:46:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04090204F7F;
	Wed,  6 Nov 2024 15:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wb0XH1Im"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3421A1DFD87
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Nov 2024 15:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730907970; cv=none; b=oRp35E3x8npcwteCX8hE6lYbhrZTGNh+KPgTcTSSAhvHfKtxF1s/zCH75DUHSXPwe5VzB2iIb4b1KAXVSdDRGudcpaKIEzPg56wisPwy21iW1J6uB5V1+RQZENJ2QLW+IsdYR0CEeBE/5e7ep1WXiE4zqSqb/ajUw7VY+yayThI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730907970; c=relaxed/simple;
	bh=7N2RygYMW4TJF9hiZlrbcmdrvhQWopVDKDZZavZfja8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CWSxWJxSueDGxOboQoWt4x5gZoaWvAOfhX2DY6btKokpSKt+ImlgBxH1cp7VileaMfCrXaD56oEWgBpOZ6Ie/dad+FHAnqIs7vthF1R9snBMHKB0Q56wgcK9b8f9XL7h+bJmVSKKQzaEqizDaBRAvaoDhjhAmxABPWus9P7CmrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wb0XH1Im; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53c78ebe580so1059315e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Nov 2024 07:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730907967; x=1731512767; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5YXju+0Q6i1brMsiu/0qAiWLrwUOJs+9ByckwSi6A14=;
        b=Wb0XH1ImshigU7F5wNjwaO/L0tXb7cZ6lJ9LGNjyyEmiaoErqn9BTVPL5GjWH1al6n
         BZt5y59SEo++aNw3kgprXG2IcKCYMEE+9lnj/E4lLMDeuCdDZC+NxbpKSM8knHW7BgA4
         PM5QKaPuT+yAamB01FaUgHhZwZMV38AXbXiBJ1CZLsH8acLxSKpN1M95q7cklHf4UkFx
         EHyi+366LX4sDmAZjgXhoq1sQLUA8W9Itjw1AWx7tO4zI2O2fsDa/mDAcQhQBG9HdzdO
         vlMJVOpbWAyRbgZxpeOEuWOlhHYWwFHDSZwnZL6tgNGuizQsEUk8be/CZEBh3eWUYJxV
         U+yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730907967; x=1731512767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5YXju+0Q6i1brMsiu/0qAiWLrwUOJs+9ByckwSi6A14=;
        b=ZKtMN9Cq2cc9iErOCqlXFaKtYyu3GkQ2KeI6v6DwSv2CNDIIkGG0eFgXiRMfATrV1e
         QnE/jWk5uHELR+Dhaw96Gf0mgqu617KD7nydddk2Ce/T3OK/65U+xZfgYyZkbpj2CIF6
         nAaYWB8E8jJ5G9MwhFQSYrdYr6K5Iv3mrYBqMgT1AT6lQ7eEr2ohcXYJuQeBSm6H/vsG
         GNrdK9mlQJUkAwc+vyyRQp3lQniFwfymZ77majhkxuoJUIrgAvYPE7hLCb8cM631wBpM
         2jjsV/Hgm2RLGjsZXNLR9DFGbhgbRqTm3PYy7ux2dTrwiSgJmuU7/QfJljRmJThgd/5Q
         MdeA==
X-Forwarded-Encrypted: i=1; AJvYcCXIOc94j0N6NwdohYy84OqP0STqz3YiQhdxHxek7pQd6nw4ZnNE0SLo8eJYHpMxxWfI9OlF7ymlfto83sHw@vger.kernel.org
X-Gm-Message-State: AOJu0Ywto1T/QBjQ8WHnwczTKymow/sKU73z/VA3S3d7xjYMEGBCeIr2
	xBiavSfW0FXJoi4SigOgxJ00NPHj7ILMcH/kHGPQ18CiFApGYRx4lHbaql6MZNM=
X-Google-Smtp-Source: AGHT+IFG18kkxYOS6GvDQf5y4iYLbTKJAlu7llPe7M19xR33bK9+tOVzg92mBlKjzurOS+rl0SZ2AQ==
X-Received: by 2002:a05:6512:2248:b0:53b:1684:c1df with SMTP id 2adb3069b0e04-53d7cfd8097mr1259613e87.1.1730907967260;
        Wed, 06 Nov 2024 07:46:07 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bc9598dsm2536626e87.22.2024.11.06.07.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 07:46:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 06 Nov 2024 17:45:54 +0200
Subject: [PATCH 1/2] usb: typec: ucsi: glink: fix off-by-one in
 connector_status
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241106-ucsi-glue-fixes-v1-1-d0183d78c522@linaro.org>
References: <20241106-ucsi-glue-fixes-v1-0-d0183d78c522@linaro.org>
In-Reply-To: <20241106-ucsi-glue-fixes-v1-0-d0183d78c522@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogeurs@linux.intel.com>, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1137;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=7N2RygYMW4TJF9hiZlrbcmdrvhQWopVDKDZZavZfja8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnK487m+/b4peGCADrFBKYSdE7vl/qEmknV19z0
 SHJSXrVEWqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZyuPOwAKCRCLPIo+Aiko
 1ThxB/46S8vBcyyTbFk7tKRn/OZAUkoQF8N7VUn/ZqPBkDme2oQSDh/iTT6H1P8r/czH3PQhfgG
 B4gCGPByL8BIPWChWByskmQDDB4xINgPlJBhifwRwUmNCL2CQhmBHSRqJTDnlVCB62aI8he5pgq
 93CzTzwSQw9Lp6CcnsXgDSj/hRkDTn/Mdy4BdHXv/Xxngv/MIdo6Ak4YuFDI/o+bOFrPlapXvlu
 CySq5ydGxppM6BGkHaAEcphbib7zI30ynsQ0/5/kA0loSWkW9XRh7VKn3rORAiYfVa1/eE18hXZ
 5ULvZyQFdU/NxLrRnwNEbrKUW9vKQaLl1m28A9XmAHPGAXF/
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

UCSI connector's indices start from 1 up to 3, PMIC_GLINK_MAX_PORTS.
Correct the condition in the pmic_glink_ucsi_connector_status()
callback, fixing Type-C orientation reporting for the third USB-C
connector.

Fixes: 76716fd5bf09 ("usb: typec: ucsi: glink: move GPIO reading into connector_status callback")
Reported-by: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi_glink.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
index 3e4d88ab338e50d4265df15fc960907c36675282..2e12758000a7d2d62f6e0b273cb29eafa631122c 100644
--- a/drivers/usb/typec/ucsi/ucsi_glink.c
+++ b/drivers/usb/typec/ucsi/ucsi_glink.c
@@ -185,7 +185,7 @@ static void pmic_glink_ucsi_connector_status(struct ucsi_connector *con)
 	struct pmic_glink_ucsi *ucsi = ucsi_get_drvdata(con->ucsi);
 	int orientation;
 
-	if (con->num >= PMIC_GLINK_MAX_PORTS ||
+	if (con->num > PMIC_GLINK_MAX_PORTS ||
 	    !ucsi->port_orientation[con->num - 1])
 		return;
 

-- 
2.39.5


