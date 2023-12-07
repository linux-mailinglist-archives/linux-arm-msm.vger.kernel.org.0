Return-Path: <linux-arm-msm+bounces-3628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 930C88083FC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 10:12:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E94128310B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 09:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F31D53308F;
	Thu,  7 Dec 2023 09:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="f5BIJaw/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC9531722
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 01:12:11 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-33350fcb2c7so478283f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 01:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701940330; x=1702545130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tU2gzybzj9ATGlUwp/IUXLdbTrKN9XcIjZzA/XAbQkY=;
        b=f5BIJaw/wZGweOMBKqq8getyfkuZUzSmnXEuRb40hXh4WdYpnSAm2zyWvFZ9cprMjH
         r+aIp1NkfJ8bf/4Xip1oDrSieRHS/3WJ0z4pYcIoJMorrcAi65hXDUFtPOGS4mG3Kwh/
         nCU1S35RLGK7pcG78vtlFjkTDzH7Fr6YP25QkTLuQzcZX0yIYSVHHHEK4WmjtvGfbD2T
         +Wuod3a4B96yEGClnkJHYkZ4jl2j34jTZDWB3p1DlQsiw+wd4rPn6szWUzDLumdCOcAV
         e2rFsJq/1NdtY/uI0ghPUy2teYaOhmG3vztO3CXMLG62fINFRaaWTbiFgiDiAK+fnlWN
         C20Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701940330; x=1702545130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tU2gzybzj9ATGlUwp/IUXLdbTrKN9XcIjZzA/XAbQkY=;
        b=TTBU4MxV/GS7pydCN+Az8lZ/Tn5j72kTd9mUm34+Ow8WT1Uo2GyKBiOON2LO5KCdMM
         InbTz1BMb7DhZA2KDs68w04HoorthX9CYeAfGveK/smL5ODtS/E9DWQ7Lij4AUesfWpk
         yXbp74w96lnYzqKgRY7N76AHm9+/hesApUeMLC3kw2f7jUefheHveqF7WhUGXSbKNain
         OQ/rQqE9cvy1NU9ZsSXYeLVMBLR6VF90vTR0gzoQWsMzdwL0TXDQIpE/m+2n6Fp1Yj9o
         Y+7Sj30ujppsRDTiQOExjc1NL5/o4qOpaDI9M0QSGjeKt9K6wiFb2UDeSM2qP3K7/Ejx
         HOUg==
X-Gm-Message-State: AOJu0YzTyeZ/KzdLSk2NTAfhvxCVHL7ml3kuSuqpNDOgDD2ZHe5DA9vT
	q494qgsRn0/iLI0LppL2Jqytmw==
X-Google-Smtp-Source: AGHT+IFSDlszC7Ad6GLFM65Ao5WkZAll3A7vU1pZZmvQkU6/37o4V9sQ/bp6xEx1RlGPpp9JAjwcKw==
X-Received: by 2002:a5d:6586:0:b0:333:2fd2:814e with SMTP id q6-20020a5d6586000000b003332fd2814emr1435920wru.107.1701940330064;
        Thu, 07 Dec 2023 01:12:10 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:de32:8b0f:dc9a:4dce])
        by smtp.gmail.com with ESMTPSA id y3-20020adff6c3000000b0033334c3acb6sm896009wrp.98.2023.12.07.01.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 01:12:09 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Alex Elder <elder@linaro.org>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 0/3] Bluetooth: power-on QCA6390 correctly
Date: Thu,  7 Dec 2023 10:11:59 +0100
Message-Id: <20231207091202.19231-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Patch 1 is just a typo fix as we're already touching this bindings. The
second patch adds more regulator defintions and enforces them for the
QCA6390 model. The final patch enables the power sequence for the BT
module of QCA6390 in the hci_qca driver.

v1 -> v2:
- squashed the two bluetooth patches into one
- changed the naming convention for the RFA regulators to follow the
  existing ones
- added dt-bindings patches

Bartosz Golaszewski (3):
  dt-bindings: net: bluetooth: qualcomm: fix a typo
  dt-bindings: net: bluetooth: qualcomm: add regulators for QCA6390
  Bluetooth: qca: run the power-on/off sequence for QCA6390 too

 .../net/bluetooth/qualcomm-bluetooth.yaml     | 26 ++++++++++++++++++-
 drivers/bluetooth/hci_qca.c                   | 14 +++++++++-
 2 files changed, 38 insertions(+), 2 deletions(-)

-- 
2.40.1


