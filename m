Return-Path: <linux-arm-msm+bounces-62357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9785AE7C6F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 11:22:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBFA31C234B9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 09:22:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BF5A29ACED;
	Wed, 25 Jun 2025 09:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="NyQikJkG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8730929ACF3
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 09:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842908; cv=none; b=sfiRawPokHse0Ecbr/UEmoQgHCM/n0Si+SV/GXLZ4ncSZxgw8uIKI2m7T5i19fsfQhV6vcOwdKGc7okQR5RrgkF02wqnUw5wzfTejeESL8nFzAnvwyE+eQqcFLw5eMkP2nUxQ3WnL/Nss0npzZSWfrpsbzg6z7Osbxi9syOrRm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842908; c=relaxed/simple;
	bh=ZJaHdZ8mGsEkim1yUHwLTnvHu86W+l4CWYVjRpNDmhU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XmpCBfmDd5/eLo93jiECdLVK6F4An8q1NVPqDKNScwDxDQvC+MKN5JN/9+JHudjjPs0NmIC51zuyveb2CV9aDYN0tbDacnofl3TOTBMZL8Wm1Ey/Owc+WVqwbnoLQYNR4wMN5Z1y6j8NXEo76TNTOHAcakJjcGfbqAYUxnr4Vg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=NyQikJkG; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ae0bde4d5c9so136597966b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 02:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842905; x=1751447705; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0x17E1px+EqXNrObaDGYbqObszP+McDhL4Yp7KySDHU=;
        b=NyQikJkGFJtIMxHruyCDMjgWMTMuCzgyxOQI2b9I8lz6BiaU6nR7sjMFxRuefjRNdC
         qhp4JndzHcu4zfOtSlzS2YABx2dfA3GpbLDU4ffkHrcg9RFyquOUz2lYXbGl8l2pateD
         DaQiSWStrCrXgdUnX3Lg+g7VFT15Ux15ZI7pvLXuGCArWp600t/QVFz0qiJjgizeTHUx
         dDDcUi8ho1GpRh15qKyglYg6bMYl8AQ+hNiyQ91Q8QdzhuIMId2jV2wN4HEWkxYAPtvJ
         mBjme7V9Snsb6UX+to/6dwICKaRdW8yxP4c3KLNVUwPuqW5Uc1Mg4la6v+Maulgotz6i
         ZD9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842905; x=1751447705;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0x17E1px+EqXNrObaDGYbqObszP+McDhL4Yp7KySDHU=;
        b=hQ3riY8EmtaXIW6JTwszLnIJ9/BviiL5/ZGsPrC81qsJJtxbEGDgkho8WN1l7KL5El
         8NO8iFJEHgvw0NkGdpF+XRj3/TBcUG2rLvl5lccBCGgcL5vsa9FL7aTZJs5MldzwQ/Gh
         BMFMIJQUkcFpLnK5TlfkKsTtQDFFk3D9RmxsPRDb/o1KprN0joINU3xN7N+kzl6Cyusu
         5yOLLRoLFBqKxga7Lpp0zrxnmJiyqpr2PrDhadVj+7ATDy79/P6FLhpzpufFgNE2Pv7z
         u1Dn4js6zmpFU/tEti9eXaoWW/DBVbHSfi07ELQ7hFBxZ2uwyb1wooBSfuHf+iXU29iW
         lJdw==
X-Forwarded-Encrypted: i=1; AJvYcCUMuj3VfjsLsgwGti07ENyvMfkk6NcUZq84Ni69ihST7A1HUNncR9vHeHIfXtxe8FI+NMcg5dCWc0wmxsPE@vger.kernel.org
X-Gm-Message-State: AOJu0YzBMnTRD4GevpOiL4LqLxJ2I5C00CkKjBtkazLuxdczalUQUdh2
	3IJRey/dsGekKeYqPWgPQyOhSCqnl25knS7kkWaujOu+0diOjswitZQTDURRrzzxN0M=
X-Gm-Gg: ASbGncue6iuAXf8oeS0/rTbPnywp7fri+YPOGSfxvtdcC6+f3cXRJtzPo8Gw1QcwHOX
	68V8jpBwVehXVAm85FXOlKJsZLlHYDZ3zDzXzjt5AAkCB+f6n/k9gAsIt2o+t8rjsiiH9M3r6LK
	8fkLu6YxfX/Vps795Ptp7JOqrsqaN8RVteErpam6iOlyEmxSeQBRDUKmJ18BMU5rBDV46Oem85C
	vLRCnnQ52R0R5zbMnG+sHJAZlSyHl3YsVxLIEyXtT7eHFhB0FmdBQiuM1dc6bkedbhyFcQDUiEk
	s5PxMrYVZWKKY1jm6gp1hJ8OU0Z/BbjgjkX7UPyCwKQmX9Sthh8eo/ptZQwg7xC7lo3YW7mdGow
	YsYz3g+J0Jtsce6AgR7gkvkfIVKLtAxPA
X-Google-Smtp-Source: AGHT+IHossRczIQDoFPo3XWwZlIhvHUPsFfJ84XHSqNsKPDmWvICk4145QI/+MNPKeaIC0aeiLBBgw==
X-Received: by 2002:a17:907:c1e:b0:ae0:c6e5:9738 with SMTP id a640c23a62f3a-ae0c6e597ecmr107772766b.55.1750842904882;
        Wed, 25 Jun 2025 02:15:04 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053ee4c2bsm1008972266b.71.2025.06.25.02.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:15:04 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/4] Add support for eUSB2 repeater on PMIV0104
Date: Wed, 25 Jun 2025 11:14:55 +0200
Message-Id: <20250625-sm7635-eusb-repeater-v1-0-19d85541eb4c@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA++W2gC/02NQQ7CIBREr0L+2m+ABqpcxXRB6aeyKFWgjUnTu
 4t2ocs3k5m3QaYUKINhGyRaQw5zrCBODNzdxpEwDJVBcqm4lhzz1OpGIS25x0QPsoUS8qG9eKV
 aeeUe6vSRyIfX9/bWHZzoudT3coTQ20zo5mkKxbBVn4XG5AT8aw07pLX62ORPV5YY4ohe6aYRT
 vfCW7NK6Pb9DZsmrPjQAAAA
X-Change-ID: 20250620-sm7635-eusb-repeater-0d78f557290f
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842904; l=1080;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=ZJaHdZ8mGsEkim1yUHwLTnvHu86W+l4CWYVjRpNDmhU=;
 b=wvQWFKLPrm1zGX2IzrnXnA2E17UIblNOckLeleDSLHmvgeMDGWHzUtWv8VsXxcuiFfqCEDyNh
 IxjlOTrg7kQC6ynnmpaa54qFXzMbTvmVd52L6Mww7I/gvqvzRvVb3+O
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a new property qcom,tune-res-fsdif for the eUSB2 repeater and add
the compatible for the repeater on the PMIV0104 PMIC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (4):
      dt-bindings: phy: qcom,snps-eusb2-repeater: Document qcom,tune-res-fsdif
      phy: qualcomm: phy-qcom-eusb2-repeater: Support tune-res-fsdif prop
      dt-bindings: phy: qcom,snps-eusb2-repeater: Add compatible for PMIV0104
      phy: qualcomm: phy-qcom-eusb2-repeater: Add support for PMIV0104

 .../devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml |  7 +++++++
 drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c            | 15 +++++++++++++++
 2 files changed, 22 insertions(+)
---
base-commit: d9946fe286439c2aeaa7953b8c316efe5b83d515
change-id: 20250620-sm7635-eusb-repeater-0d78f557290f
prerequisite-change-id: 20250616-eusb2-repeater-tuning-f56331c6b1fa:v2
prerequisite-patch-id: 5c504d171a4d1acd9ec376e01e0dd0fddbad92b8
prerequisite-patch-id: 0c97dcf5472fbed8ef4cffbd482f3169fe1e972d

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


