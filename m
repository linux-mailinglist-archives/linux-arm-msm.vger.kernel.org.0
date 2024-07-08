Return-Path: <linux-arm-msm+bounces-25466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA321929F52
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 11:40:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3782E1F2296F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 09:40:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D76616BFA5;
	Mon,  8 Jul 2024 09:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="095hDrtr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B47F73466
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jul 2024 09:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720431586; cv=none; b=BCpqFIXsJ8saEr5g5HCwakv7U/2QVJk+ZpF1Ffcgr5DpRpNxTmJOHZRhIFPzfrIviElS7DNsdWq+xoVvK+wOeSFMMzBZTs6+CcAh/l5QPI1oBLSOQQ42Y6adjE94EwYgR03IrsoZ13uVj5WvM+lLyfoIYYU7MDtu5+48eT1Opns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720431586; c=relaxed/simple;
	bh=2TidE6nfTMps1G4Dq88WlZnsAHwB1gZ+MIIFB5e+tDc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WLxiwqVeDZ2UjoyRmPJEQC3m6r/qLw9zyutiMJ0hNRR2ZIH847FxAK3OErzZFG24MiaCnkaNllGSKtLggzwr4tvVEfIXCBZX+ddJWC2GDmn8mQaYlkh97+vc8tiEe9hiC4Cr+9O30jHlwnD+gcPNeFrx7z3LRxOHbpiR3q1NZgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=095hDrtr; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3678fbf4a91so1902682f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jul 2024 02:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720431582; x=1721036382; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pJiGPNVUfOymkghi+UnfRWIeLnwAQWonrs19sal1xMU=;
        b=095hDrtr2NnUW46xvbf6X/UcXB724XPYLy1e/kBw7ykeR2CsHo695NqPk3ZNQftrBt
         oMTl5iH+kuMGQ6FB0gjq/y/Gddvxj08BhQ53oexQtQ/8bCDi/eDUCkEV20CqoYyccSpF
         0GDf+tgAqH69ZNr15k/TBqgnOp/mv4IyNPTEZA9bQHwdzBzLbj0FBQBsyWv5k4js4ept
         s1ENhnl2gfZBR4NLo3Md1ND238z9XszZV4dUHjN8bonAsokAvp4/BwtQjENU//JkN9ok
         KRPbjeFQG/de6Q1orIgS0oR80BEWg0O4zm3lP6PkTqVke/CdOhq0HhNrwwPLV3kT56eC
         tkZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720431582; x=1721036382;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pJiGPNVUfOymkghi+UnfRWIeLnwAQWonrs19sal1xMU=;
        b=pbLPnwXbBQSwKFW0x8s/nN3tcefXlEt0T9Mkc6QdKAPXPR/SvfcPUC2z16oCEbUSoX
         41xc3DJBEZ3Js7tNH2ejgPiEXDzXAZyiG0ZxZGA6cpHiLgwYFI+c/DlYRvxoNt1odhrC
         eETtlaxGbjUiWNoGT3cfGk9k1vwp09rTyfpAaQyjpCpHuBav7rfbP8NQBUEoOE50HHJ2
         h0boHPOUFI7gpCLESu8Vuwgxk+0AWGS7XlDC9/iEOcCy+eel7+w2uvHhNG93CxZ0vz3O
         uQf8qgfjptFoSd5QU9UmqJXcjkLu4zFGEdya2ebBVFbftZTBMkxBrAmOCwAHALeVOsow
         CDAg==
X-Forwarded-Encrypted: i=1; AJvYcCX9GMJLmiINoMLhT/UsXe8G/JVzwK/h6MVtOEyIJ+ZyQrp/n4WFn0JsmpKc3yMIJM7DsjC1nga5p3nazWSm7r8ZPfv1sG1rmZYkvTghAA==
X-Gm-Message-State: AOJu0YwdU6cF0bGfGnw8iJ1ahw+noNBTODGTNJKv/LsA0TTt60dhzl+Q
	nxBx2YKCS4d0vI9zEuOBLY22Qbzh6vc9k30Num7pJFWq3v9STJLFxwJX2wvXysQ=
X-Google-Smtp-Source: AGHT+IFgrWWSoD1+87OSxs66tYydZHTpasqcgDslDFClrupbk7yVqgHDuTN/EzVRxeH5TsGO4CG0ng==
X-Received: by 2002:a5d:47a4:0:b0:367:992f:6037 with SMTP id ffacd0b85a97d-3679dd292f3mr10424712f8f.16.1720431582633;
        Mon, 08 Jul 2024 02:39:42 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a2a3:9ebc:2cb5:a86a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36789fd7a0esm15457779f8f.104.2024.07.08.02.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 02:39:41 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 08 Jul 2024 11:39:25 +0200
Subject: [PATCH v2 2/6] Bluetooth: hci_qca: schedule a devm action for
 disabling the clock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240708-hci_qca_refactor-v2-2-b6e83b3d1ca5@linaro.org>
References: <20240708-hci_qca_refactor-v2-0-b6e83b3d1ca5@linaro.org>
In-Reply-To: <20240708-hci_qca_refactor-v2-0-b6e83b3d1ca5@linaro.org>
To: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2020;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=meA9lGcLLH4Zog4sSGjK0zP4eT7Ynd0BKP2Y0SHgP1I=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmi7PZpeBgr/4oZaVp4asoGG9xLd4a8v/pMN586
 sYE8V1LT2OJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZouz2QAKCRARpy6gFHHX
 ct4xD/9UnnjJjkXfnYUt1+RV2pOqiDY6cBzAGmc5bHh6YEJTqpp4H5lo03qvWKjVhOK3N/+B/M5
 6E++q3uI6g3g1cR6oBAts5wHfy+rXIlNnFzgG+pa0Zejc3e601gjn+z2CcfhhFVK1ylrEi/RI/R
 CTrMRHkNa2sxeBL//EAdW8bjrscygKtWzfiCUYxP2eWA15YHEU79qNN5LA+cuHkOnHQ+pPSiyjI
 eVr1SI2jCLqRSQ77jZHy9YNsR9soe6IIXrTRIH6W1dhe+Rwz1pq/Hme5KPl7d7QD3NDu1LMfCH3
 lijYj+w26SSjK78YoWkLIXtmAOCcDJY6dZOwtHWwBA0Xt6NI6aE7uJue04/yOO9hi6FVi76kPvZ
 zReb6asY5gyfLInuXZUyhI2yE+13hg0eCqjkV+dWOJSNEMB37i1aCVM81rhrqaMKgNMENqGLYtF
 qhrDZ/nsQ0VApPO9iZfaZN6pufEGbgVowxbDYENTiGpULnoBw9m38/PDL5s0kT1ot263wSIyeWf
 vwFG1QWMY50WdB7qRvQSmat5cE6g73s3i2tUAvWoXctYDWQc14uYYJgCUnUTuyVIwhcg/Bs2dqF
 y7eqluAW8peVEsaOXHLAej9B17Gvf6f1AHJaYTf4KuUu9Io8tYL8vSD81kmrh48/II+fzBwjrT3
 FKSmA6bzaqaOE/w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In preparation for unduplicating the hci_uart registration code,
schedule a devres action for disabling the SUSCLK rather than doing it
manually.

We cannot really use devm_clk_get_enabled() as we also set the rate
before enabling the clock. While this should in theory work, I don't
want to risk breaking existing users. One solution for the future is to
add devm_clk_get_enabled_with_rate() to the clock framework.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/bluetooth/hci_qca.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index bc6a49ba26f9..a34c663e337c 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2295,6 +2295,13 @@ static int qca_init_regulators(struct qca_power *qca,
 	return 0;
 }
 
+static void qca_clk_disable_unprepare(void *data)
+{
+	struct clk *clk = data;
+
+	clk_disable_unprepare(clk);
+}
+
 static int qca_serdev_probe(struct serdev_device *serdev)
 {
 	struct qca_serdev *qcadev;
@@ -2434,10 +2441,15 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 		if (err)
 			return err;
 
+		err = devm_add_action_or_reset(&serdev->dev,
+					       qca_clk_disable_unprepare,
+					       qcadev->susclk);
+		if (err)
+			return err;
+
 		err = hci_uart_register_device(&qcadev->serdev_hu, &qca_proto);
 		if (err) {
 			BT_ERR("Rome serdev registration failed");
-			clk_disable_unprepare(qcadev->susclk);
 			return err;
 		}
 	}
@@ -2477,15 +2489,9 @@ static void qca_serdev_remove(struct serdev_device *serdev)
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
-		if (power->vregs_on) {
+		if (power->vregs_on)
 			qca_power_shutdown(&qcadev->serdev_hu);
-			break;
-		}
-		fallthrough;
-
 	default:
-		if (qcadev->susclk)
-			clk_disable_unprepare(qcadev->susclk);
 	}
 
 	hci_uart_unregister_device(&qcadev->serdev_hu);

-- 
2.43.0


