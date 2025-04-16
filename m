Return-Path: <linux-arm-msm+bounces-54576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8EEA90F8A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 01:24:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E29D3B8A36
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 23:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0372B24C078;
	Wed, 16 Apr 2025 23:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EFOS+x5U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CBD24A06F;
	Wed, 16 Apr 2025 23:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744845834; cv=none; b=d4O4zmFl8gZSQgP3yxB5FX+avik9Gy35Jwb8DJv1kNzZG5oYX8TNfX+aykLAbQA53lQuuYQnOwrlT3BxXFnejp1FBLhisbDyPt7ov++veLPQDNcytjLN5Jv1W6Ye4SckyRutwJJF5Qv1AwPnm0pHjSZDuvc03Yw7j0juOrwLq18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744845834; c=relaxed/simple;
	bh=r6iiGw0WPshoyykVfAw4KQSvu1jD7CE+zlVJnLOPPv8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fLOHF9PaZZ4azCnL+/MhB4iToVBARy4HQh4eVmuuHOTO273YN/CHmJrKR1Qd6bQO/z6a3cwVxQQ4vXOyV6jlukYqKbW3+m+H2kUuCAIh4l1D9I0yM1qPrUJRXJDPJUEyR7HyEf1GFJipEJskJVYQ42Vhij7fvtjQS10sbGEhNvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EFOS+x5U; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so1873725e9.1;
        Wed, 16 Apr 2025 16:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744845831; x=1745450631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a8SNfV9cq9fPWvvPmR3dGHfZnD5tEVE8UIBf0qCYzhM=;
        b=EFOS+x5UDAboSQJ0023rRzIfqGs4pYCmZoqHIOaRSOs1azDjL4Z1DiDNRr48X8MmVb
         tpUQsarxCV75EBn/G1q6M9YTMMHgi3NjZCob9d/BrJIbCsGtET8nDn9VMYzy1RRQQn11
         xgiDAUVHHdxXumoNrcXQUXEbxg1qJUEArFXEMfFZy1tJLWl3ka9+3HUCrr8Oz/1ZXgRy
         nce7/J7+AbPvC1Q5rU98E6DrdDOOvdXxZIHTcsgssh0FElOnOZyemKz+hbGG/Ha7d83u
         WoOP6p7ern74ksubHmpzZ8Y30vA4bRrsJxRaTXPrtwZP/jc0ig+OlUAzMPWrFYzORlr6
         JfAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744845831; x=1745450631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a8SNfV9cq9fPWvvPmR3dGHfZnD5tEVE8UIBf0qCYzhM=;
        b=ZpwvtmohePJzXxYpaGkwM4JRyjiUZ2/FR42PpiLgSkc3mFBAStCxsRuUx/JY8186k1
         NFF3x04lD5RHfJEAT8xvjOjaZAd+7G99pSd7Oq/6lbpfn7ruJxHYVrBVkgNc8McyBmek
         U2W8OdakkhTktlp+QM1p2EnVqtgbGFIjoJAccuFna1VCQ4MEfLJq7T3/jIUlvl3sTFDD
         mmGd6MjDBA/s/4AgygCxso18fz/4dJwhCuZAixdnQKG0aIdyhhNlAGvm4UTCjVT7orkQ
         DQuSqB4+cdv+0Zr6TN70lPfzOhWYM2DEd893u+kM+kPXS6WQTAOrWkhpW9Wbn/e3/Si+
         eImQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAlbgz68FGUaXFgWOH1HMVAS423/XcqOEsifnWG0+pW+ZRo4UaWr5LZvPKuvquA4Ss+9pWq2fHU4PG@vger.kernel.org, AJvYcCUKPeMupfvJOZwi/o0CN1Q8W4xZcNathtgzfaCjwwN+lTscCf7c3pzPTDOzbr2K/wNzTo03MsNBRcD+@vger.kernel.org, AJvYcCVecZSaoEDpTlHvMkH34A0MoISJGmtxKbncpoTthjuPNl7GrlYlnfw/9LL8TjNHMkIudEKL+0qDxKuAFycm6g==@vger.kernel.org, AJvYcCWFOH3J3bmx8WiOY1B30LhF89lbI/uky5T/BZrg4OwF69dBBiMIaL8bK+sVs8DYd4Ddt6FTpO10T8YgFUe/@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+tZTY/o+e05YPQ4CXDe0+I/FvZTWw3CKwV7OOAP6dEuHC2ueu
	CxC7PEONfkXCW6sYy84WzmAD1SYNwST55hFf88ZbVAEkbYlvTSk=
X-Gm-Gg: ASbGncuC4ns1lHrswZ2QbtjBJ+ewbBKmkA44oCwZ4QhgyY4jyI23kbcyPGIljVsS50/
	08yA9AN91kfytq9MPuj2eRYLrC17HDOZ6PLlSy6C4VKbGu6cau/naiKQaVfCHtfJVrZOopWC9sX
	/EYF7ap2jfRohPwHduhi8MKLBm/BKZ4d6Nsisdp6v+LsZddxolf2fnXGwrVkNaBAhW4xvTY48NI
	X1QGU073OHiE6grjQ7bFWs+MJWluHRjbhO8f4EmZpsC04fYTHmwmmUHEK3MYrumjVudkI/pHUKT
	TKZQ9XfGT+jGw3U40dg0eyRhTWLhr/kJLL56N7pLlxZ3VMakL8U4VAEP
X-Google-Smtp-Source: AGHT+IFQKmaEJJUpUWUAmkiE2XBULeCmTdOnJnh1u52S9T034pt9R4TM3ohVVZP8H5IfrgyFDVZFxw==
X-Received: by 2002:a05:600c:190c:b0:43c:fdbe:43be with SMTP id 5b1f17b1804b1-4405d6cd44amr33919965e9.27.1744845831100;
        Wed, 16 Apr 2025 16:23:51 -0700 (PDT)
Received: from alex-x1.lan ([84.226.118.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4f3ac4sm34026465e9.23.2025.04.16.16.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 16:23:50 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	maud_spierings@hotmail.com,
	dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v3 3/4] firmware: qcom: scm: Allow QSEECOM on Asus Zenbook A14
Date: Thu, 17 Apr 2025 01:20:50 +0200
Message-ID: <20250416232345.5240-4-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250416232345.5240-1-alex.vinarskis@gmail.com>
References: <20250416232345.5240-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow particular machine accessing eg. efivars.

Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
---
 drivers/firmware/qcom/qcom_scm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index fc4d67e4c4a6..79128d11eb51 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1986,6 +1986,8 @@ EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_send);
  */
 static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "asus,vivobook-s15" },
+	{ .compatible = "asus,zenbook-a14-ux3407qa" },
+	{ .compatible = "asus,zenbook-a14-ux3407ra" },
 	{ .compatible = "dell,xps13-9345" },
 	{ .compatible = "hp,omnibook-x14" },
 	{ .compatible = "huawei,gaokun3" },
-- 
2.45.2


