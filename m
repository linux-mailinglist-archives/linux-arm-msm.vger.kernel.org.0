Return-Path: <linux-arm-msm+bounces-16746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0F489B6E4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 06:30:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2638F1C209A4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 04:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A061763AE;
	Mon,  8 Apr 2024 04:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rcddXvQg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF8A4A3D
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Apr 2024 04:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712550656; cv=none; b=ldI35C8SXOj8MEod395mZKIx4Zp7NsmWjR56cAS0g6Y4rD39M1SGNGCxv7D7K3QkUzbDf+/RU8T7N/9Q2TIELHTyRANhCCRKYr3/50Bq3reyMY11sX8m+74yexJpcsnol0/f/sr6CVktZjdFglpItGtoK/XXz0se/qqMQsgdm5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712550656; c=relaxed/simple;
	bh=TxV7kxeMfkDnxNQLSQVdz6XPhubojpXImgsuhhZ9918=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=O1EECSSRMCh4mVR2xbs0nSjgtuwgY60xeNnuOwsmuw39aQqKkXIoumg6JIxpBW85G8pHpVx0MeXPAuKUXLl5++qGwEdY+ma/JG5mkMmK8DRlzrcHAsPT6hpZzhCVXjXYt9qGZ5fTDi3T6iHMd68+v6PbvqBDi6kET9+B930Zyh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rcddXvQg; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-516dc51bb72so1716227e87.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Apr 2024 21:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712550653; x=1713155453; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R/AU7a0dE2jT+MxgeDV/IUhWmuS+tYRumxiy4yU3zg4=;
        b=rcddXvQg7slkBtr0606CGyWJvwUizPYxmUDL3DrgjhkoDc8a0sVPly/8Hp7POj3e16
         fwy9h7OUrk0g1z2b62w0LClb05C1W19hIo/OLO+mAC4oBc41cG/AmrsR6rJ76FxJ88ye
         jeG2I6lI58owDc3Y6PPiUQJBtwGSBRJmNssmgiQ+4ePIF70E9Y7oMIC6gxcQsrUPeK+e
         CaNTWNi+74tlck4uJATjFqn0HAC2OY43MfTOnomS5SufiyKn570muJB2jOQsP8yq/z2N
         V+ERiXpU3Ul1IgWEjnuNBscZ0ppdoDQeLClUK4Zs0ivmcp5GQ+AObCfgPn61AOkW9Aek
         70CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712550653; x=1713155453;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R/AU7a0dE2jT+MxgeDV/IUhWmuS+tYRumxiy4yU3zg4=;
        b=ngAPSrJFu4/z9pa1mYq5KfBhz+1AvohnXslYElg1V/N0kM9vTlOReUgKed35dgRq6t
         4efqebMPxYpHAJDLnmeYsQ4rm5CDasM5OsJBde/heK7TlFU7xhv5P5PHW8jdbbAk+iRl
         L8ZKbxGcD89swGVYBy3PysszwrO8/DcijQetctJtOjdAa1Zx9HQVoaZMxtXmsGNT4G4W
         L47mJEESJMabOdKTYD5c4qXrfAm6kyJfYtUz9oLQWm5ez2zJuocUxu8xE1P8GQEheNHK
         zu4iQbvmU9Eu4anEDitD8MBN/ERxXoyJEaFsE7lM8/qZ9BIDiXb7PS3MOvf9wGm9uPkn
         cZWg==
X-Forwarded-Encrypted: i=1; AJvYcCUZ9eeYbgw7VQblyBgSFz+ih8ODrzRR0aKehTIrWhhXSoeGcnr+1MakrJAvP0LekNyC1NDO34aTkO+gmaO0eekNrhWMJVm9etEKESQPkw==
X-Gm-Message-State: AOJu0YzxHOqnL0KRxejNOxho3s36AGCTLp8BXyp0jEb43NtnQOgPMqxn
	58MSyJyerTmPxTl6xu5Sq77F+grbPKaJXYEDV71ZxKKdjJyX7hryccnoKYKGBvs=
X-Google-Smtp-Source: AGHT+IGOuPES33b69mPKBp4LG22SUH+x046DRFeubXhcnej3y95Vj2V+oL78vSjGWxH/luINOt2QsA==
X-Received: by 2002:a05:6512:6a:b0:516:b92f:98ef with SMTP id i10-20020a056512006a00b00516b92f98efmr4983894lfo.47.1712550652792;
        Sun, 07 Apr 2024 21:30:52 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id g13-20020ac2538d000000b005132f12ee7asm1033207lfh.174.2024.04.07.21.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 21:30:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/5] usb: typec: ucsi: glink: rework orientation handling
Date: Mon, 08 Apr 2024 07:30:48 +0300
Message-Id: <20240408-ucsi-orient-aware-v1-0-95a74a163a10@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPhyE2YC/x3MOQqAMBBA0avI1A5kM6hXEYsQR50mkcQNxLsbL
 H/x/gOZElOGvnog0cmZYygh6wr86sJCyFNpUEIZYUSLh8+MsZiwo7tcIuys0bOyjdZCQnFbopn
 v/zmM7/sB8fdlx2MAAAA=
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1102;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=TxV7kxeMfkDnxNQLSQVdz6XPhubojpXImgsuhhZ9918=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmE3L7xRtVnpyvawuIFkBpylB2c7C2KZLKziSy4
 kk08ILS5mqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZhNy+wAKCRCLPIo+Aiko
 1dVfB/9IwOa57SEU0VeCYu2O2rae3gNu+fxFoWSazbkQXEftn4JWocoLEoKq1GpaiJ68Lj/nOe3
 rI7fkpA38eo1MOB4f0F52vBGSLtvKUeY8TVJiuxrigaHLX/KMfse/3Dt8+U6w6/6Z4bB/wmeVZH
 hYlsrY4QBEiylaO59w2gHVQTFg3tLyl4kN4pnsVKnFiyedhyQZKZSAyO02Y6qQzq/P3j92haxjz
 7s85Wmi58Dya5zmKR1Ls7g4Ksoc73o6C815Fp5t/DL9cnBGx2jJ9X1lPDfWgLLTXn7vW0+5eK06
 cS0sVc02HuqTNtE4QL7PrblhMG35Ic4wfBxeyISv44uZXAN3
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Simplify the way the UCSI GLINK driver handles cable orientation. Make
the UCSI core responsible for pinging the driver to get cable status.
Use typec-port API instead of calling typec_switch_set() directly.
Also make the orientation status available via the sysfs.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (5):
      usb: typec: ucsi: add callback for connector status updates
      usb: typec: ucsi: glink: move GPIO reading into connector_status callback
      usb: typec: ucsi: glink: use typec_set_orientation
      usb: typec: ucsi: make it orientation-aware
      usb: typec: ucsi: glink: set orientation aware if supported

 drivers/usb/typec/ucsi/ucsi.c       |  8 ++++++
 drivers/usb/typec/ucsi/ucsi.h       |  4 +++
 drivers/usb/typec/ucsi/ucsi_glink.c | 55 +++++++++++++++----------------------
 3 files changed, 34 insertions(+), 33 deletions(-)
---
base-commit: a7636ecc2a798cf6dfcfe5c993be9deedceb1888
change-id: 20240408-ucsi-orient-aware-9643f2653301

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


