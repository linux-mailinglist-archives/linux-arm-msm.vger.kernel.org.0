Return-Path: <linux-arm-msm+bounces-61408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 077EAADAC42
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 11:46:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 146F63ADED3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 09:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB763274FCD;
	Mon, 16 Jun 2025 09:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="p8UG9Rd8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AFF274669
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 09:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750067160; cv=none; b=Mpit6ZgqeKDkDLHgWkAaOKRV1WwCp+BRotNZfNTMTCeYm+DKhiA0VarlE250Q0FznOWmgHu5EUIPpG4YiQHfrJmG+K5mbCjRUdxOYsXcs+Y0eqpmcBwou6t4YEn8UKeWexRkha+zSjsDAhb5DbjWKwb2bccjO9VrsGb//8f4yec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750067160; c=relaxed/simple;
	bh=yg/Z605KkyVU+56JZHlueaasnOvYoTqeMlYl3QzL15E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=V0bJIzZ9pUG9k5dST8m7DY9TJ3rZgiLElPKRW5yGJpT4OahW/2jTkWviKaRDi45VfWFswYZeSNbf5V2Gxm0kH/cu6ovw6uz9aoaAm0v2Oxpm1af/ftXAJTsbMRDZMHp19hnWNFO2GrSWJCdr0GYDg1zKHYRoP367k6aay65d2w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=p8UG9Rd8; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-607c2b96b29so8583182a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 02:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750067156; x=1750671956; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wv5TZzXE1pnoqd59sPXctLTMd18ru0CNrepNvpJnV7Y=;
        b=p8UG9Rd8e6xg2tEJ/OQLvkHv/K0MvrZ1fxcvINZAjD95zW3RD2we37oduXBgYK831c
         tadIWKh4qxfNkVv4y1nJO9BAvmdT3PbAcgZiZTi+ot2iAq7N6dXyrTmkyGmSxkSqtBTC
         nQjf3V5f+U9pljT2MmYGztzAfVkNB9d1PYAtFOXzo/iFjMF6bNOEUHWcw2DJoXi+Zlhr
         mVD2jWR9SKRNUfJd7Q/CT9xFwn1aMKQZ3h34vD6Jje9tCElIb11evUUVs7YRG++BligC
         TbCdb6zlYHui+p5L0A3OuXafLeJboUN/DDLpxnm298ttuSMRx2IAQ4W8f8YqBNhLbzn5
         LCxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750067156; x=1750671956;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wv5TZzXE1pnoqd59sPXctLTMd18ru0CNrepNvpJnV7Y=;
        b=wglUrCqA0VimeduhvpjziLRUHhBhhmBOkPO5P1bnU33vINEEgM1ts2GBzlvgf7DHm+
         00/x6Phw42tMWiNdKL2DHsCi3piqjT1ejiAwbfF/pCfgMpXXflWEBV2Fv2xVBn2NLMZ/
         7VfmMmqevYlhHr6qy56Qv5eLS2v8yJSYpD23sZgOdAEq7wjHPF2LgWU/6j6Ndz8/PVBz
         ggkhJ05zQlwiTVbg7NozfUgMIbOXMKAK/eyFP3+d/l3+f0de6edKpktoMhdqL483uG1O
         bmbIe4zBHGv/6OOPBmUDdqI3rgeF2SJWpGlN20NlMDa+eHKZ/Xp/BB99qt6daN6Y2wK2
         MZIA==
X-Gm-Message-State: AOJu0YxqjpBuM2gfc92Klamq8XHkeHz/KLr8jYasjCu9Up7hJoiZOL00
	lzu4TjNTIQ2p4w13yKQuw7cxJKbmlyIFLLiedzBIh530ufshT4lNluMMpbT5WUBAokU=
X-Gm-Gg: ASbGncucIY7UqrPdAT0BFPPj4XMBXPhMQUJKYpSoqFDM1+ZUZEWzfNINIGCmiHpA9zv
	tA/+kTUPaLyVAfq34nVsaQ0UHr1qfpPouzo+S5qqvkxjCjvTSg5ZSKmpARKFo+CnNw+3BstSqNh
	WUjF8YYOIkp6xsVSpWHaVp1GAP6E9QP7fp8oocpYKtD8qaWyY+A9+l2WM10i3VnArwy2SE3TOSj
	LYr1OFfhuNetsICKawJMGuFZArtOtiBdwgmXfS0raPwZwStEvpBYgANYtlsf+obJxTAIXY23/Ib
	kq7tvqGp4t2vNygmwJLNgaag3yB7Yy6HAneJe9gSWvuldoTFvkBW1GSYSJ9T/Q3JKX1UubUigs3
	xa5A1fTFpjN9tW55wj0J5FaITP+dhpZd5EhicCNk4dho=
X-Google-Smtp-Source: AGHT+IF1UCCT/9hU3wi3KuAvxeqhvZuI9qbh0Qqdl66L5+wsfuS8m2r+/KHpbcCfod5gb4crjQOdiA==
X-Received: by 2002:a17:907:72d4:b0:ad5:55db:e411 with SMTP id a640c23a62f3a-adfad3eaca4mr807509666b.27.1750067156564;
        Mon, 16 Jun 2025 02:45:56 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec81c0421sm613375666b.46.2025.06.16.02.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 02:45:56 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/2] Fix tuning on eUSB2 repeater
Date: Mon, 16 Jun 2025 11:45:10 +0200
Message-Id: <20250616-eusb2-repeater-tuning-v1-0-9457ff0fbf75@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKbnT2gC/x3MQQ5AMBBG4avIrE2iFV24ilhU/WU2JVNEIu6us
 fwW7z2UoYJMffWQ4pIsWyowdUVh9WkBy1xMtrFd44xjnHmyrNjhDygfZ5K0cOxc25rgJhM9lXZ
 XRLn/7zC+7wdbt4NzZwAAAA==
X-Change-ID: 20250616-eusb2-repeater-tuning-f56331c6b1fa
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750067155; l=953;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=yg/Z605KkyVU+56JZHlueaasnOvYoTqeMlYl3QzL15E=;
 b=3GYemwlBi62KkKVXr1IAcK4akalZscChQtxjpoaSKQQ1Wl5RrGQtsumLggN6/gEGWykiP3ruh
 uo1DCOtKVQJBbW5GvuxtStUCl9EdnWqu2TWea+fa92D6VCCaiMmSQJ6
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Update the dt-bindings to remove the 'default' tuning values, since they
depend on the PMIC and are not guaranteed to be the same.

And add a fix into the driver to not zero-out all tuning registers if
they are not specified in the "init sequence", since zero is not the
reset value for most parameter and will lead to very unexpected tuning.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (2):
      dt-bindings: phy: qcom,snps-eusb2-repeater: Remove default tuning values
      phy: qualcomm: phy-qcom-eusb2-repeater: Don't zero-out registers

 .../bindings/phy/qcom,snps-eusb2-repeater.yaml     |  3 --
 drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c     | 63 +++++++++++-----------
 2 files changed, 32 insertions(+), 34 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250616-eusb2-repeater-tuning-f56331c6b1fa

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


