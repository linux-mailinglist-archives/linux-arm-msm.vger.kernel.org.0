Return-Path: <linux-arm-msm+bounces-62327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E46AE7BC2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 11:13:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 317EF1BC733D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 09:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A066A29B23D;
	Wed, 25 Jun 2025 09:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="jRV6u6PH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBAA28850D
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 09:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842735; cv=none; b=JEGIvEz1ZMGiEaaW8xo26M5H0nSL17Gf9XqXk8mSNNyAi6GVa/TJYG4czRFtEdn/pprvQI/jByblpV5KZBLk2P1LE9fnP49sjTM0sEjwTzzrsWdrWJhHvBjxtdj3fT26M0hlaH+quao4XWrsIya36hzfLLUKZ7AU785eBZyF+dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842735; c=relaxed/simple;
	bh=3rLRX3HD+/2dBnPJ5VcY6hbzIV3hWOdMQ6LQve48/v0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=vFeKbumgJhIP2VE/k8bo3zajYKWb/pXwC/KSgjS2I1jun1igrEb3Hsq6g5sgZAAytJc3KoNlBxuKsB3fAfMcWdxg4bJDFudULxc6+5Jc7glbqwcLGRrxRQl9g+Uq+m9RxPRE/cTlFgruKqB4e0hgXc+0FQYhawntNRFAQ50nNZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=jRV6u6PH; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-607cf70b00aso2590121a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 02:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842731; x=1751447531; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OU6dPNRfW5ncO3ZE9HOdNSZ+keWWv+mGS1rjrgmjGXI=;
        b=jRV6u6PHugZ3CpY/ErUm7pXEI5u44R3MxNoWSRiKsEdwVles5tnoSPaqUG7U9i3tvW
         1fBSxuBpVLknNHnOTK0PbQYD6udBbHpHGXdr5mTJ2bXhQ8RIXB85z+9dz6BhoO35OfFy
         RyndGUETJZkeqLIW5aFXvOwE98E7ADar2BVOkM4js/UrjgLVyApDKzLl8JwTCcvulzz3
         6pONGOgOypkFA2fIv+iLJTMcqxzkpBF7zhtLic0OdQbmXfWDI9Ee/sbKmDC28VIAuR4l
         UbtQvsIz8vylYXGwrxzDESs05nOw1G4P+Ap+KeZzcS3iO8R0zJY9OO6+rbCV3vziliKR
         4+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842731; x=1751447531;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OU6dPNRfW5ncO3ZE9HOdNSZ+keWWv+mGS1rjrgmjGXI=;
        b=NNBx8Z0x2A2yTcmd4ojjg3nCwdPxuuVr+42XSUi/h7zKz8XEXABymgP/9XoyCpvvuT
         MKb0U6/pqOCEvHR1yO6rtJRCZsAsMpMt2uqHHV+u5Vr/dz7v4NGWSVx0EgTT4gA0TVXn
         gHyNv3elx0HcBy1CaDlOn4h4vek4jBzqcCqgPpzlBuxaLT8AEbDlsvzTduIUQLxqG6oD
         9J8RH7TqOulgknrEhJWZ09ct51mbe2PJ3wgPOJHWhfbUF7/RNUIOqEQXdhUNXu65xp1K
         hM9d/VKeVccEiX3e7+c/TH6TK26RqS2YmuA+KNEwT1b/kRrUS0zQtEBot1CuVh4UHEce
         3dNg==
X-Forwarded-Encrypted: i=1; AJvYcCXFNBT1CxJSryOHCvEHDQ0IdZN2C6ye6/NOYq62GABYPxEWGAp5CU3+laZ3MhSS1qDHKOwseH4tFpwrIgrZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyDGxCMeCgFvUKGVRp0QQaNFL+/sl1MkZvVXrYbvjL6Gtuop8Ng
	6cLiYbnQa/JLL9/eDcOhX65utzUe6QgPAmmhnRhNqdSh9yNE9aMv/utuGpV7VnDIC40=
X-Gm-Gg: ASbGnctb+gmRb+F3pXA0iZ2G/JL6QD/VV8cz1tMBeMAv+ixShUrrVwRYPcUlB7tg3X3
	cR0Zl+6Jh87sj3GHHpwy03WpeooZrZC9rhmyMNno+hygpS1zsg34hwkma6akS4zOL48QF2PHZEz
	hBpv/4IoGyYFj3Pb2RBKMryyjkCLza9pY9nGbmoCCTBBuaWPXYt8FweyeYwSSctdXHMeqIDfzUn
	EfsaLTM9g0LO66KunQwBb8qOxPU8X0fjjHq75BsLitjSIEtPTynU4ewGV6pfnWcsdtrAyp9Kzj5
	CgcZdTKUwWjaB4jMBYKPbgz47QvrIeG9H2DhxGsdFKZBEAuqfsiP9n9OBZTetD7brF0zZLdJKOD
	2KCrwYAGdQV7Mdx6Zj39x41Wgknxr/94u
X-Google-Smtp-Source: AGHT+IFEzb5lbk3K1+lIUPljZOLxKwp2Mr0rANsWiHgyk6VUfW/suAoRrgQe45mR9hXiAYd1pDszpg==
X-Received: by 2002:a17:906:7950:b0:ad5:2d77:7ca7 with SMTP id a640c23a62f3a-ae0be9fbf22mr232942066b.43.1750842730958;
        Wed, 25 Jun 2025 02:12:10 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0cab0ed04sm11076666b.135.2025.06.25.02.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:12:10 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/2] Add pinctrl driver for SM7635
Date: Wed, 25 Jun 2025 11:12:00 +0200
Message-Id: <20250625-sm7635-pinctrl-v1-0-ebfa9e886594@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGC9W2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMyMD3eJcczNjU92CzLzkkqIcXcu0VOMUCzNLYxOzJCWgpoKi1LTMCrC
 B0bG1tQA6kYpdYAAAAA==
X-Change-ID: 20250620-sm7635-pinctrl-9fe3d869346b
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842730; l=737;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=3rLRX3HD+/2dBnPJ5VcY6hbzIV3hWOdMQ6LQve48/v0=;
 b=KzTL/Z/wD17NRYxyIrHXpQRPy8zNXoOYDCUaeDvp5VN57JpWxhNksgX6aQZmwOrPoKPeY2t3l
 LqJm7ikR6sRAWuBNm0KJLJUi0Bz0UxmeH6pF6k24fbzK17kWZufq8Pe
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document and add the pinctrl driver for the SM7635 SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (2):
      dt-bindings: pinctrl: document the SM7635 Top Level Mode Multiplexer
      pinctrl: qcom: Add SM7635 pinctrl driver

 .../bindings/pinctrl/qcom,sm7635-tlmm.yaml         |  133 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |    8 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-sm7635.c              | 1340 ++++++++++++++++++++
 4 files changed, 1482 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250620-sm7635-pinctrl-9fe3d869346b

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


