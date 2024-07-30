Return-Path: <linux-arm-msm+bounces-27421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCBE94158B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 17:39:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 720501F24C97
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 15:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DC8E1A2C18;
	Tue, 30 Jul 2024 15:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Xlw2g34L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733D31A38E1
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jul 2024 15:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722353959; cv=none; b=n+2v+1updSCsECwJ4NOuO2tKvtTeb8S7XYqlMMr6Le3yD3+aYElFzMghRc3QUvE1kPubZbxY2u2RSZx6fjPKdrk3a5zIcnTDa0KfNzoN9qqXJh5/A9NHCBexONem4jDDQOzgul0o74F4Xp1TYj7uGJG7JjrVx+6c97JK+F/uIXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722353959; c=relaxed/simple;
	bh=g7se6oeZ5KLpRAANz/R9S2ovP5N22d6tZ6dgM6QNyEc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fVm0U3Xi4Lc2BLV4vqMfNWwSMBiB15H2ac64XzD582npWswytKGsSRY43PsCY5+dYuE+31trat22ja2Ich+M6qEkZLuNqmgaJFqwBspdW3LrA0wVhZ+3zJSaIaUAVFyaU79efzyDMy7/bTGG4gIRp+mwQVpjegxz91DadBlSqS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Xlw2g34L; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-428119da952so27801125e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jul 2024 08:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1722353956; x=1722958756; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zIlY+IE9qZ+wnr6EW9tCYg2sPtX/V+1hIuGutkdwgzE=;
        b=Xlw2g34LtwYFdgBn2JIozraDvtRItq4LohV2RNXMgsd7SeeZ/mapHevKQlJUuA9miA
         i617ThWJ3liJi+S9Jk8kT1A+B8aIBk+R9cFpGVb7v+zVWqQiOYZTvAYqaDKekpFEomVz
         an05cdPJ2/U3V7uFVK34zqwnRfs5R2EZQxj9UhFzQXMGU92+U82NIx8dLNsroemfjETg
         vwc6ZQ28il9njyI9n7AxXPF8TsTHWF4nrXPOGcVfRh8YdrJfCJHTE2OlJxPgbwOMYLZr
         jxHuMeqPlF/zCy3NNoUA6GuHzFg2G2LHaWbHsNazD6VwBdoFa2LOjluXroaUClP9qHmw
         RrQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722353956; x=1722958756;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zIlY+IE9qZ+wnr6EW9tCYg2sPtX/V+1hIuGutkdwgzE=;
        b=IASxnpj+xLm6WajZlDAgponNVqQmAxFJVvseEUjq+2peRkQS+5T18Ra9eDHum1bITz
         wwya0MqFdvmY88slZa4DusRiHs5FMYz0RvEq41nKO4zWyFQs793eeHPzX09RiAR/iR5c
         uuv/nljsUGwb2e9C2lwzZQYi6oDfBLeVMBIUixeqnm9guaZ7OQJp2nXD7RC94gXTGw8q
         +TkDLHAB8s2u+3NGqNgNCQewDa+oSfDVjKFpnTr46FUE1hJGN8tX+2DTmEnxKe0Ra9w5
         Msd3AifM9njDKBb+bWwJKQN/1WuetOAJieMW4FDnbxO8k+rSgoRC+uSc08M83KMv/8GO
         WaTQ==
X-Gm-Message-State: AOJu0YzdjpZSGbGerT8KLIN0wViDQlyqeNm60ZTRfCA2m/2hxwxNScZc
	MmVqA9gdXM3cr7oZ8SGVNiG3cDco/ffq7qrCZrIBiifOjTRo/LizmM36VWSJmQc=
X-Google-Smtp-Source: AGHT+IHspqqnJENHVY5Mp3AXGRnutH8mgR3X58Qhy1uRyHnQBa09D+2nE+N56A7emHPuM682wEL0mQ==
X-Received: by 2002:a05:6000:c50:b0:367:8fee:443b with SMTP id ffacd0b85a97d-36b5d353925mr7510570f8f.41.1722353955544;
        Tue, 30 Jul 2024 08:39:15 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ccf2:71b3:8f46:e8cb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b36857d5asm14952522f8f.84.2024.07.30.08.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 08:39:15 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/2] firmware: qcom: fix an efivars regression in qseecom
Date: Tue, 30 Jul 2024 17:38:47 +0200
Message-Id: <20240730-tzmem-efivars-fix-v1-0-bb78884810b5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAcJqWYC/x2MywqAIBAAf0X23IJpD+pXokPpWnvogUZE4r8nH
 YdhJkIgzxSgFxE83Rz42DOUhQCzTvtCyDYzKKkq2WqJ17vRhuT4nnxAxw/artG11Z2ZnYLcnT7
 b538OY0ofb9ZRrWMAAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Elliot Berman <quic_eberman@quicinc.com>, 
 Andrew Halaney <ahalaney@redhat.com>, 
 Amirreza Zarrabi <quic_azarrabi@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, 
 Maximilian Luz <luzmaximilian@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=842;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=g7se6oeZ5KLpRAANz/R9S2ovP5N22d6tZ6dgM6QNyEc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmqQkfr8s6RE2WchOtnngvxkSv7CJVeA8N2ajCe
 mwzPpS6zvuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZqkJHwAKCRARpy6gFHHX
 cqjnEADCbQY28LE4rlkQeeLG3BrjUkdamAuliLSmvUVHzSefg+fiT/nAifYj1CnKINDBQnu8gtq
 eJZo14HwouCdhp7HgO0lRFEYk2Y6S+bLOxotFbCvFFaAtVs9VJnP61dIr151EVTxzesDzmm/XBZ
 cXtfZ7xWnKK3ZoSS4o4nMkc8xWSxZAsIw55vmZTry9H7/6wRl/KF9n3WQ0/LAveZuOl7tsnLPvQ
 DKy5+4lUcU8EZqJQfL3JO8ZWFnnVv/VGuG2xAZwxb786R2OqTn8HU32APg+DG98B7EMD2d7S6he
 3JnQtjxXmoaKxujyD1rj2T48zvb/KkPNreSP7goGnB0iLTOaFHb8HhihsbXoK9zwlVg5F+Mrdwx
 i5+ainSA5YQUnwGXjdXpxSMr7TCqPo4OUcADxTtQQSwnlxFkDTKWMhSY1ba0K15ph0D+s5mTGs5
 8lctHhxp4/c+Nhg433o2vNqEMKeghRE0cjbNAiFs60/Eqai/R4/4bcW7hIpyk69WVXk6F09aZ35
 N5bY9en3T8GFAGw+4SEJwadqFUjZsZXjdM2yOZCdthVFYiN6oXXjeIBVgdBRSnhKLA5kktAqdd8
 FP97VFFhXTKm4luKJ9ay1k6+YD/K7jmwmmLRo6kzk6PijiFXnGREjceyQdfRzXIDU+ZRntya+Au
 D1HH/0kHkOfXiAQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

The first patch address the regression with efivars using the qseecom
driver reported by Johan Hovold. The second patch removed dead code that
was left over during the conversion of the qseecom driver to using
tzmeme.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (2):
      firmware: qcom: tzmem: fix virtual-to-physical address conversion
      firmware: qcom: qseecom: remove unused functions

 drivers/firmware/qcom/qcom_tzmem.c         | 21 ++++++++++----
 include/linux/firmware/qcom/qcom_qseecom.h | 45 ------------------------------
 2 files changed, 15 insertions(+), 51 deletions(-)
---
base-commit: 931a3b3bccc96e7708c82b30b2b5fa82dfd04890
change-id: 20240730-tzmem-efivars-fix-d9635d39cbf2

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


