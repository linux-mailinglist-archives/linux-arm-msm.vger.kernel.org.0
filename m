Return-Path: <linux-arm-msm+bounces-16939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B72C189DF2F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 17:32:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8AC61C22B2B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 15:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01DA513BC03;
	Tue,  9 Apr 2024 15:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xbSi74m0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1567613B5B1
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Apr 2024 15:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712676562; cv=none; b=kXyodRTma7GsXoY6NfB7iBaHgYSVliJHI25qQhCzUItjuoP8DdUOeREZOwZFNzru0vBuwUwMfIggoDtRy+PUQmrVQa7msCoQA9n3bkEUlZhtaFNV/gWPHrupcStlOdFxtOZ9GHMIthprxonOeAVUMc7AAmnJLt/nOrSTILnjv6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712676562; c=relaxed/simple;
	bh=zNWPO8GvigLw02uq4l0GDj+DflMpu5hoxYQwUgqdrlQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=px3v0CryV9R+vDJPgc6d7+frCY2ZVvqjZqPtVAMe6AEqQCOfK1Zn7m+tqtFL1hWDAWN/eBid9c2O8ooB5Q3rBpjYu3LnwkVPFJ6Sbm25GbcuVtcbCqn4u5zVOirDZlKDvusMzRlpRe3SU4xmKkR0/1Iq5+S0YbdaJCVQ3WhWtVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xbSi74m0; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-516d47ce662so7401811e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Apr 2024 08:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712676559; x=1713281359; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=60uVClqNTAk896GH0y5YA6pUpoBA6r+ZgbYXrSMz1cs=;
        b=xbSi74m0lR/MMq7L2AI3XvNF3fhj6ogBxY03aV8hiaksogSOFnmimHiPmSLFdzcp7S
         1kdkuYcCiUBxE+RVrxooQDbGNVHmSWWgvCtToQWx3uNkwwb4wRgU/cuKtgPOKnwd83X6
         POPw0S3D5H0AeqD2yjhbBMbdQCzQFmZheB4goFzXMmpMtNZ4s/0uI7BNyP4a/9Z+WEGZ
         PN82ktlJlCwvBJliyOKUse4l/F2IEamMamLzkXSDLo/aVkqnX9xYJ/7Ri6Z0gsuWmfNg
         TXBrE2Wf9WTmbCJ59DoGca048lEH4CgQYmgVJueajPCM/dTsZHl0nNWxneAQvRLrS/3R
         cGoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712676559; x=1713281359;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=60uVClqNTAk896GH0y5YA6pUpoBA6r+ZgbYXrSMz1cs=;
        b=OSoqkjRZiSSVpp23hWF9lSBUumSHahGM4KcB1h/wy+jwiEhPsDPCGYaArzeW8iPFXc
         GZ/q6+AgF6zgv9JSIyGvuWPCr4zjKLMTQ6rOIgTutr9nbVtsqioG8Z5ZJnIGSJC2JUK+
         Bb9EFJK+4zk5Oar02Xc2sCG+E5RfD0NG3QlaL7y+e6BqQa7Oz9qOgKc+XmeNsaKUkvXD
         fnt98JIkqSGJblHNLC18Sq03060wlzzgjEXHfv6NEGxFYZeC7+rTPuWn/vrrZmGNyanp
         yUG6AgGvAWRdQ+CoD4bWmkYzbZbnP88+ZAtzysl+EPqAEi/j5viTt/20zX8Ghw97rhxZ
         ZFoA==
X-Forwarded-Encrypted: i=1; AJvYcCWOOLsSDFuzKwFjFVhd30sqgclsM0fePVEnxNC2wyAELQPK3zoRshFotUPiZj4hZNc9ZVrYmyBBClCBN6dZccMjGMEP55R4cSU75IjErg==
X-Gm-Message-State: AOJu0YzydMJapcWyb9g+GbGefg/cwsSU3cpp7xze7Kbyb0UE0MSXDOit
	gmV4CjyspJC5CEYeRKOgQqxo7MjEfJv+W4nFq6mRFmiOlDqnuIccBOQmJbenGtSlF/4ShjH8CIt
	e
X-Google-Smtp-Source: AGHT+IGMkV7+EGoLimgpij7Wlclq7xyd0IUuwK1PdiCpgCSasjgRFXJJ7ZLiHj/QECUPY/psxt2daw==
X-Received: by 2002:a05:6512:128b:b0:515:b0be:3a42 with SMTP id u11-20020a056512128b00b00515b0be3a42mr13146762lfs.33.1712676558720;
        Tue, 09 Apr 2024 08:29:18 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a16-20020ac25e70000000b005159412ab81sm1579990lfr.216.2024.04.09.08.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 08:29:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/3] usb: typec: ucsi: additional fixes for Qualcomm
 platforms
Date: Tue, 09 Apr 2024 18:29:15 +0300
Message-Id: <20240409-qcom-ucsi-fixes-bis-v2-0-6d3a09faec90@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMteFWYC/32NQQ7CMAwEv1L5jFEc0hZx4h+ohySY1hI0EEMFq
 vp3Qh/AcXY1uzMoZ2GFQzVD5klU0ljAbiqIgx97RjkXBmusM87s8RHTDV9RBS/yZsUgik3YkWs
 bF+vAUMx75rUs4qkrPIg+U/6sJxP90v97E6HBlppIro7eBTpeZfQ5bVPuoVuW5QvwrCKgtwAAA
 A==
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=859;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=zNWPO8GvigLw02uq4l0GDj+DflMpu5hoxYQwUgqdrlQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmFV7NeBbXfzqvHG/TRx1XytbLdzwLdLjcWRFQe
 8gKClu8XxmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZhVezQAKCRCLPIo+Aiko
 1XLzB/wJnXU4WiXhghLKxSF1wdQvpIngwfw3SZ59KaQC/W2eVlD1FqUAJKpERY3eE8o2F9POa5A
 CVZjUfr5UsXp2/T+muQK3/0n/iung731r0go4otF+86g3RHjZS+aSNuUbogNH+E5aKbMjDW5WaH
 2+3ieFApFXS/EQ8dyORMtRR+zxJJhUuBUG1cDzbsL/98Hp4Rb9JZzoRF8aR0AqJiE1NBNpSX8NM
 ogS8t/5xmJbt7XdVci4aGwIVbU5YO3btbiEA3lxp9Z3eaKVcOP1BMYcEkUg0K1j4+sBKkotOsRb
 GyCMYy4TbX/kN4eM/wUk6i5+fJuIV/jk64f86jB1HVBB1J32
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Fix small issues in the Qualcomm PMIC-GLINK UCSI implementation.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Fixed indentation in pmic_glink_ucsi_notify() (Heikki)
- Link to v1: https://lore.kernel.org/r/20240408-qcom-ucsi-fixes-bis-v1-0-716c145ca4b1@linaro.org

---
Dmitry Baryshkov (3):
      usb: typec: ucsi_glink: enable the UCSI_DELAY_DEVICE_PDOS quirk on qcm6490
      usb: typec: ucsi_glink: drop NO_PARTNER_PDOS quirk for sm8550 / sm8650
      usb: typec: ucsi_glink: drop special handling for CCI_BUSY

 drivers/usb/typec/ucsi/ucsi_glink.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)
---
base-commit: 25e918cf1bb906bd9aca19ae0270feb7f6d68783
change-id: 20240408-qcom-ucsi-fixes-bis-6b314764c5be

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


