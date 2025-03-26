Return-Path: <linux-arm-msm+bounces-52512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8F4A712C0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 09:36:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 085173B86CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 08:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 789521A3163;
	Wed, 26 Mar 2025 08:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pCrSJ57l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0F713AA2A
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 08:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742978198; cv=none; b=e+l4tOhMYi9E8muF7/lkL+ECjhIA6Z6geSevR/gMtf7mPNFsNV5vLH7hynshsDkAPwMCe9YFrW6hLMEYcwHNssIP7kYLOxX/mwpmo/Fnxtq3OQGJMU75I3bfy2JdTBtsPi3tTleNQdhLax01gko2alhmMXFurU+vZ263wDYL5XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742978198; c=relaxed/simple;
	bh=qW0MfqD72uuYHhfTPBfmoh9IPsaychLi7eXpoJZr+B8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TMB4UaHAzQSWWipZQQiu+Ze3cQHsICLMJvFgiUU+pi+Ca7RO9/W+FWeHfki+KrVJu/V+MKSMziHS99I7mdKCdRzpwqeNCPmA491ucaMRfr94Leb95UinYDtGVu4iEqlRjelhUQUQukW3o1pt1gsaEMMbNUz2MJo1vaG/ilASTgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pCrSJ57l; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso41769655e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 01:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742978195; x=1743582995; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iy2+7jXA7YG4CzY9gHuiVJnNuIcRimh4miDrVOlcZkc=;
        b=pCrSJ57l389XgX5DbMJjTqU8YwxTptSsnyC67pJGxt0haub74t6UXNyhxkNLi2SQuU
         +eyBFd1pVgoWmffXXW+1bf/1RnpDBQhFsa3PEwb4eWnjm1HyX2jaiZN75PaFYPtM6R4s
         uZ00npU57I/PbLDJux1gxbcKSns6j+aNtDI2k+a6i6oqoloMeiQjCcQMHbdbXT/bro9L
         bATqRiSdtH06f3E+0tGe6oU/AZsPkTKdVE8U9EumcxcwOXLyqpUGD5UIcqhM9mVzCX03
         ueI3J54krlk2ge3ApQDiT5j+tzvZBU4CpW3//FY3zK9m41dOC6wYtS9/ig8RusD39Usw
         KWvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742978195; x=1743582995;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iy2+7jXA7YG4CzY9gHuiVJnNuIcRimh4miDrVOlcZkc=;
        b=eky9cDj1IZVUeIh7afGppxIcFFP0mSwnyy9/Vms6RKNo5PNYsiJ2EnhTqN0jd4rNTu
         MlVnb18/kbNPljtOWhsgQHfX4J6NyCA1JwdHdL5L+jFVVAPWkcn3aWWUJUW6UgeyDNGP
         4B24egYY7JQdpzmnDRmtXP4j8gC62ME7YEkBk+sdD5ntd8IHpGNItgMnO8neiWiFNezK
         WSY+rCeQUF8heuGxCNzGIEHfwFWq588sneeGI2a5PnuADdYZ4qNvSnAhlaGSnIZqiTBt
         ZbSShtmGYDoIgtu/GfbbsC7qgsNIvp1ULkO5jfTpCykC1ipBQGEfXLsb67P/eY2V4Ihl
         OzEA==
X-Forwarded-Encrypted: i=1; AJvYcCUgT+92iKo/B9akyD8/FQLJCxddj2gphyMoQRAjQ3fj6y/GS0yYdp+nqNieco33NBGNf4xdUJa8onaTz3gh@vger.kernel.org
X-Gm-Message-State: AOJu0YyejmpQ1xqwE/SMhtv9KcMEMLhnkruSYHm8/GkWu2X/SXXVaNlE
	2vZIWEowLtFouWsyDYgdlPnu0/LVlxQVuVApn7NxrjOYz/C9LVHTg4NecuyVL2g=
X-Gm-Gg: ASbGncvxFEeOb7FoXmBDLRdykTucGP0CtSvl6joKuSmU9A4Hcz7160MBc3E8VDcNnyv
	7TkKM7al4LWATyFM9hiWXDnxo8nWiwdJj6EA5tntTpFuakhEP4Ub8s8tfWjXZb/mDOA7VOtxMNh
	NpWcHqQAQxDjPi1dk+hoaUpIbGjowAp4IWXZrciFAmfpmKkgqDZuoAKNWKP1vHnVET968IVgdFQ
	8Z+URrOT+IBxum6i2uT0hlVZGaFjIkKu8nO0ldzKtLXZh+sszo23+1JxQPs5uKF1Q9xoKdxDloa
	jLtxWxFt0yQ6SLIiWHt0/i/oaEXGmo6h/z68Oht9TN5z+US9pTRWQBckWrwLCHJk0w==
X-Google-Smtp-Source: AGHT+IEkBse8k5+iznvBOzE/fliiY0CgZWEA0SCOidqUwsYgoXLyby4x3PPNA12r5TjnBrbnSRw6GA==
X-Received: by 2002:a05:600c:1d95:b0:43c:fd72:f028 with SMTP id 5b1f17b1804b1-43d50a4b226mr208496955e9.29.1742978194763;
        Wed, 26 Mar 2025 01:36:34 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fcea400sm176823365e9.2.2025.03.26.01.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 01:36:34 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH RFC v2 0/2] ufs: core: cleanup and threaded irq handler
Date: Wed, 26 Mar 2025 09:36:31 +0100
Message-Id: <20250326-topic-ufs-use-threaded-irq-v2-0-7b3e8a5037e6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI+842cC/42NTQrCMBBGr1Jm7UiTGv9WguAB3EoXsZm0A5LUS
 VuU0rsbegKX733wvhkSCVOCczGD0MSJY8igNwU0nQ0tIbvMoEttykorHGLPDY4+4ZgIh07IOnL
 I8kZTWV+VXht98pADvZDnzxp/wP12hTrLjtMQ5bseTmqd/mlPChUerDFHtbe7p3KXFwcrcRulh
 XpZlh8NXryzygAAAA==
X-Change-ID: 20250321-topic-ufs-use-threaded-irq-53af30f2529f
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1611;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=qW0MfqD72uuYHhfTPBfmoh9IPsaychLi7eXpoJZr+B8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBn47yQ5tVslE7udxPuo53IuZ9MtxZuvWreizAWupAA
 kPf5xM+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ+O8kAAKCRB33NvayMhJ0ZkuD/
 42Y2CuSduot1byRoMmGnoX1TTktw6Ci1kYJGdd/PtNduNDHxrRJ3+5h2zrb0fxSDqBwUB1/Mxugrkv
 5m+cmF++9mDyBxwz6shfeX3swxJs/L+S1pqtvFte+PUr0uO7CsOuGTfr/oZAi98XETH3hzSG9doc3L
 FxSTI1A4bM0wlt9AhYV4V7CiNhFY35VdFfVjjYu5XD8g2O+PbUdjfQF9iSpsu+TS0dBu29MmUhriof
 1E9hNI3o/YCj6KI4QOhFOQ4rS3nw38TCm8cEARnxwkVqa+828hoCbcBO0rj+knBy2b02Kcgux1ILxi
 TkJKoxCDJm0yQsX5BS1g+UgOExq9VpZtt0bR+C6Lvvw2HK7SVHgXLOZKZzxaiMhrl4lbSfFAHPoema
 8Dn8l1c3DIS8h7Aqp+LUsV+KRJQfWnSuzi7S6+xQeC0IHdJwDIcjRhpJhuSU/I+C5ux203NvRzGzAw
 kRhGLsVawzx23hRC84xl+iEYd0psLbiYhAl+hKWEWJJjYApjG2B1kfd5/5Rmd0W2JyjlQWR9B3TjXT
 akr/mjFz9CUsOAJb21vLH8UuIBvLxUziSsoyYw8fk5oewF+al5B7NWuNeBIL1ICKcAmdP23fAbUXna
 bd0CtVeFBmg1IZwggM71Wqsw0hU+0NLXSP3Po9mRweslQefC+prZOLZSeEgQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

On systems with a large number request slots and unavailable MCQ,
the current design of the interrupt handler can delay handling of
other subsystems interrupts causing display artifacts, GPU stalls
or system firmware requests timeouts.

Example of errors reported on a loaded system:
 [drm:dpu_encoder_frame_done_timeout:2706] [dpu error]enc32 frame done timeout
 msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] *ERROR* 67.5.20.1: hangcheck detected gpu lockup rb 2!
 msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] *ERROR* 67.5.20.1:     completed fence: 74285
 msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] *ERROR* 67.5.20.1:     submitted fence: 74286
 Error sending AMC RPMH requests (-110)

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Removed last_intr_status/last_intr_ts stats
- Handle irq in prinmary handler for MCQ case
- Stop touching REG_INTERRUPT_ENABLE register
- Link to v1: https://lore.kernel.org/r/20250321-topic-ufs-use-threaded-irq-v1-1-7a55816a4b1d@linaro.org

---
Neil Armstrong (2):
      ufs: core: drop last_intr_status/ts stats
      ufs: core: delegate the interrupt service routine to a threaded irq handler

 drivers/ufs/core/ufshcd.c | 45 ++++++++++++++++++++++++++++++++++-----------
 include/ufs/ufshcd.h      |  5 -----
 2 files changed, 34 insertions(+), 16 deletions(-)
---
base-commit: ff7f9b199e3f4cc7d61df5a9a26a7cbb5c1492e6
change-id: 20250321-topic-ufs-use-threaded-irq-53af30f2529f

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


