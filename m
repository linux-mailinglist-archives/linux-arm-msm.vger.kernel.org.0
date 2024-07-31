Return-Path: <linux-arm-msm+bounces-27500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B858942851
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 09:45:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DD771C22B50
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 07:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1939D1A76C2;
	Wed, 31 Jul 2024 07:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="weMhtW1/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CAF1A721F
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jul 2024 07:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722411917; cv=none; b=h45ALGdTPDHR3S6AJz/UfKP1poK5inAJvflMZmpCVm4UuUeww6MBIE/IhGe9JRJONTt3tObDCrCuz7wykGTJY2DR7yBhW6RLUH8/9Czx4qtOD2vhphSWCHAk1P39NPUZuas0HvmOn/7ZPM3pGYqAafv/m7BRjKBDAZw4Kw21Z5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722411917; c=relaxed/simple;
	bh=/yuGnClbBC1nyLwZVAYr+cginh8pqpSnbTlYXoo7Mig=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aZknLs1QEs1jPGDCQYs8y1av3bGYc0cVVI4KZ8TTEKe/2cCPGkrdKgw4L2Pgbl1fGLz+I3NmYIFlZy3/WTRxBB5lTecRX9QAVZxnI1RMyRiEtCc9jZN8c0DmLnw5WaGNRTg/HRnE7fSpJc3jKB97O4zBz4v67Qc8a/9yqOFnbqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=weMhtW1/; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4280c493719so32252155e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jul 2024 00:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1722411913; x=1723016713; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rqz+Epw25ZtWfd9xQ4ZQ2o9n8Tqu4oJntDWi/cHmjog=;
        b=weMhtW1/yDNlvEtlXGSf1UHvXOf0KUEf2q6fxl8xdoS5B8twISMQP6fYHu2Co9o54H
         8UrTG4Hf67tlthDceATB88B9eoYKJdni9GBgLU5r4EeoIX/w4wfjedW2oV3MRIZNt18v
         WDI+ZQi00H2jmT+r0NdkF/58FDJ3xis83JuzrDRaO+OZyhTItqWo4KWDfq3C6nqYQg+q
         9o+1z9bitVtiz/DMHWb4U9034SG0ZkU4xnn9v6fNAOU0WxMEj6f+4BkrAtchQIjAWO/D
         KoegsIFJLBopO02rHTVtPCF5rqmia+vlwqOortQMghnoeqJaM4Q2vfjqJ18L/f0hOM1i
         /oIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722411913; x=1723016713;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rqz+Epw25ZtWfd9xQ4ZQ2o9n8Tqu4oJntDWi/cHmjog=;
        b=OiJRBF06VnMKaNiKvCCw/63y+P3Cl2RCFZhD7jDs+I+6lYGGUU5z9z4QiK4IsvoFlB
         ppD50rPxmax3rcOYhql8eNEx0IQyTOCxJJCfwb0QlZooKsVF2Sq8bvE79pK03oz9TaHX
         oyDGRZRzisj5HukEjcJVdv4D3SxYCwjSFJM+vm8+qTYD2J6oYG6eHdAwQ7T6TF/TmLVl
         7FFcrc/vrj9aK3GaFSUFsfvu0ikXIf0lWVKCzwXZHN5lsCjw+Fc3KmalzzarTtMWh2DA
         s2hh+go2UTeuWXOf5K9PbQkBybfHT3QAbuDYq0fTSd5AbTKix6GoAbyjmWiL+qca+2k0
         C5uw==
X-Gm-Message-State: AOJu0YyFVhSnLmdALgXndNyXt3hRUfZkhRElriPQ+aQRIC9+e+OTVk+n
	s8kKtUCDqIgeWR8+dXz9AaGfKqYU73Qgy7yvTB+cLMC0s2/tudv5AlLZ9up8K1o=
X-Google-Smtp-Source: AGHT+IERHg31L0LLzRskNikI5TpikbIFOdMzsFXQ3EMo+io8H+Z7u5PSmL/XZMA1omH/ifPmwPFVgg==
X-Received: by 2002:a05:600c:1c93:b0:426:5fbc:f319 with SMTP id 5b1f17b1804b1-42811e0b6b7mr92539285e9.33.1722411912610;
        Wed, 31 Jul 2024 00:45:12 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:9c3f:3dd8:b524:cb31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b36857dcesm16283104f8f.85.2024.07.31.00.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 00:45:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 0/2] firmware: qcom: fix an efivars regression in
 qseecom
Date: Wed, 31 Jul 2024 09:44:55 +0200
Message-Id: <20240731-tzmem-efivars-fix-v2-0-f0e84071ec07@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHfrqWYC/32NQQ6CMBBFr0Jm7ZhSQIor72FYtNDCJELJlDQo4
 e5WDuDy/Z///g7BMtkA92wHtpEC+TmBvGTQjXoeLFKfGKSQpagLgetnshNaR1FzQEcb9s2tqPq
 i6YyTkHYLp3Y7nc828Uhh9fw+L2L+S//ZYo4CjamVUqXKhakeL5o1+6vnAdrjOL7f39v2swAAA
 A==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1018;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=/yuGnClbBC1nyLwZVAYr+cginh8pqpSnbTlYXoo7Mig=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmqeuEN8r1CHvvf0UpTfmTk9Q29pqH/8y5BETy6
 1WpaKQhS0yJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZqnrhAAKCRARpy6gFHHX
 crKAEADSUPyL2tAF2AYiOzyPKZKJ2aLGJGgEC0qFWTDW1xdUZah/lG3ovfizdk9ymqfBxoWlcKs
 Sx8OMmGpYsw5gCl2l9z94/DXVB6R0AfgrOxjDgUXHyuJzl+J6GX1nW53ATxhtoO/vdzd9HhNOic
 oJbzNUtro2hatchUFwmiyIQidQxPjUOJlM/9Ktc04tOyR7u7zAzZ6WZJ7UhxIX5sUg6PObt3YDP
 Yi44tHqtjbLL1/UvPtyHJSP7qQKZyHwN4SqmbQYrBnd2Trv9fvJh7gtrJVhEM+aKJfbdL3G9B6z
 C0iVeM7AMLY10NMJil2vseahE9WupgZiLVUVp2/Q2Ot4Tw+Cg0LT4IKRQzMnui3e14EzEGTEFOS
 GBbIuaprxW+9CGDvxVC0E94yefHoEZLKrNEiLlzgv+tCoN7ebyeH0lDPnS6TFw0PpFC0J+BmzP4
 NNc/pB63/LPmqty7yps7BEp8NyOOa1DmmqzaqeYPU62Irvop6Yzv1Oj4qlR8SIj7ZSlF9Sc2aV/
 WvhuDJaqm5TQGvIapVD53gFhxPBbSgewqUYWXMTQ6t7/ZQLx3X7njK8RMM07TSKNkabWNTb76DT
 AtuGWhO5eH5BKS+ZbpYgyvj35OPjTzx2j+NTra1oLnL9lYgAEY/ykgQf9bwyeyQi5xxFxwOiQOM
 CKmc56lnINkVsZg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

The first patch address the regression with efivars using the qseecom
driver reported by Johan Hovold. The second patch removed dead code that
was left over during the conversion of the qseecom driver to using
tzmeme.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v2:
- Update the kerneldoc for qcom_tzmem_to_phys()
- Link to v1: https://lore.kernel.org/r/20240730-tzmem-efivars-fix-v1-0-bb78884810b5@linaro.org

---
Bartosz Golaszewski (2):
      firmware: qcom: tzmem: fix virtual-to-physical address conversion
      firmware: qcom: qseecom: remove unused functions

 drivers/firmware/qcom/qcom_tzmem.c         | 32 +++++++++++++--------
 include/linux/firmware/qcom/qcom_qseecom.h | 45 ------------------------------
 2 files changed, 21 insertions(+), 56 deletions(-)
---
base-commit: 931a3b3bccc96e7708c82b30b2b5fa82dfd04890
change-id: 20240730-tzmem-efivars-fix-d9635d39cbf2

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


