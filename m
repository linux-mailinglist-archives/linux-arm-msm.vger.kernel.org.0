Return-Path: <linux-arm-msm+bounces-69558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F81B2A1FA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 14:46:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D1F71887EA3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 12:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16EED3218B7;
	Mon, 18 Aug 2025 12:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S6+lJEBn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53ED01DFF7
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 12:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755520531; cv=none; b=slTjZDoWlx7UCusn1pis3eS3DqwHGLSMBQXeQFnVM0hfFybg1f+oQTydb6B0CEbX0kGDQeM+xRdnALF4ZQxN49oXP4Qu5Dubr861Is3ZuJI9RjtTV06/HwDQyTc9MJQ3ebVkhuQ6IAfL6550Wcx5ObuOAPJI6+5+cuOzGAB5yk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755520531; c=relaxed/simple;
	bh=nNMRrSb7BNhiWjIRgtzWKZpoYyFez1TWo44dHd4ONMI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L4nJ6JB5I/hXj1Q+ThS7Fv1wqWYtuLo+P8181Z+iqdjgx4eIzNKdnBTzOQgXAQLDlkb9dzU31WdQbHlBwNEPNEuByXi35SahDrWhNLuk+4vQV7NvtvvawWW9aC+rbAinhHEdUunq/ZghGioL/MYWRie0SbkztqwX/RLXO4fveTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S6+lJEBn; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-afcb7a01426so69836466b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 05:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755520528; x=1756125328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=69nhkms9o+2/2POO7wcmoHAcJqMNQE8b4rK47U77c6s=;
        b=S6+lJEBndwu+UJneGgVrIsqR15JVNu1wlKJ6X5S0QYL7mLzaGucp0H5XEv8Oh7VXhw
         0UBuyokDhPxxjx2/eX8BH3njfbl1cY5NlO/Dc8ftLoYQhHlL8bNEvG+P8hCUEr+jTSlj
         +F+q8fkng+AULszJdAnvxdzYuEdiPyO9FCiNiNaE/M2rsfklYwULX/ymP6MAU4eHD9tK
         x/WDoOb4qb5q12fccipo0jOmP/6Piy1YkTPq498CKXC0hsMcH8RJDFByZa5QHtTa97i9
         hMlxLI/KtGbXdwQNsFohwRZzSfxmP3c4YVJA1ONoGPSZbUsQ5440JM/Pm9q3qglFGycf
         GTvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755520528; x=1756125328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=69nhkms9o+2/2POO7wcmoHAcJqMNQE8b4rK47U77c6s=;
        b=Q0BxG4VUPezOt1BX68G9/UUAK6nF10rm27tAjLBjPkmSZNoYSbqNgRKX93thgLkKUC
         76Q4WoHQIJsLDdUqLaevdIh9WgNQ1dBFXj0VGEtwNvYuOLNbxOXYPxVOT7pgiQD1re3A
         UjJMaIv34zULytVqYuFkaAWsAZ3W8zSmaKI8QcSAY5D8N0m8FMu4C4//Vsvmk0BeKh6B
         Mj6bG0EvX/FbYKsR5uS8yUM8GUSq3hok6X+W8FWUDwdK+/9g1a0W+N/2gog1J35o0ZvZ
         tmIhgdDEIWWbbhyh9e4BsDJCw5EjK6CdF2yoKKGdWCdQf7rAr7brB3oZdCud4zwE9FA8
         tX8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXcjTxldJ7sEubqW5PdSjMK8fJgIj0FMEtbAHW8vvXrqeF7jRCAjaEJVHh7SzUbrDRJ3djwN2E6S8Q2T1Sx@vger.kernel.org
X-Gm-Message-State: AOJu0YwvCHCsnnj1m1LYwQRMQ+4EgOhR6g+t1Jg4gYtH0gg8u82d77Xc
	LrQ+cbLrLkadvZOEZtODGe3jXCOUOPNySUKhSc4g4maBFPdP/6ShQEp3DtmgqP0lTH21oROie0x
	RM6Jz
X-Gm-Gg: ASbGncvYhlnOvBvr9EtejCFej4JN+El3WSyh1zhd4CyChxgxmgRHzI1gdN817/VA3aY
	2wgvRvaxrSWVxz7j7F83CPVVRTWDzc3eDo+3sQo/1yuI/gRsTpWnHqbmoVbVbPGOUKfw1o2bmSZ
	/W/rNQkV65J+MSXLw2xAWGjIEbxYJXeGzlqRXI3Wn0Wb4HITjzY4U2gItDW0LBLTUiOQCpWdmNL
	RkocZypUvJs2EejYgzvlsBu/VMmlikhGi5IWGmdQGpz2UqQPoL9NxCfBVTlW1haL3kxeyzSnI1+
	qVyDcAvDStyjNpQJPzfvkCNB/hHVkC5cl/LxcOPAZj7SYZX39NZefssVTd4jwoM346S7Q2dSqnf
	TZg3GAj7bz8JBaI4lb3+5mSuMjhE/cETVwyjk7ZHYUqNy
X-Google-Smtp-Source: AGHT+IE0D+1FWbekgvUaPUelVhGkM2ucNhzSYThrJD6P3ypZuCZLuQe3XNOe32GsFuLNilBXYex3wg==
X-Received: by 2002:a17:907:9449:b0:af9:3d0a:f383 with SMTP id a640c23a62f3a-afcdc1a6b6emr525765866b.6.1755520527634;
        Mon, 18 Aug 2025 05:35:27 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdcfcacc3sm806232366b.72.2025.08.18.05.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 05:35:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v2] soc: qcom: icc-bwmon: Fix handling dev_pm_opp_find_bw_*() errors
Date: Mon, 18 Aug 2025 14:35:22 +0200
Message-ID: <20250818123521.108237-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1842; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=nNMRrSb7BNhiWjIRgtzWKZpoYyFez1TWo44dHd4ONMI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoox4J9L1lZazMYfPTW0hhol4hYfOfLKarUDJhw
 aXXD/G79EKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKMeCQAKCRDBN2bmhouD
 17HBD/9C64IEad7rPo/WGUajA6BGNa9sUfowW8WiQDQvjX21WVT8AVnUALLAp2z4AhXrxKQYwHD
 AkijIZqiy/z6r+Fgc2r+68B/yxL1Q5bJdtM13VrA8n7tOHOJGfPRwA/S0TO9sOoX/WQuk+xHozW
 g42nW10OGuY/wxiFXEbs8tki9l3jig3t4mJudj12k1SlJVOk5rddhHxP7zqkERhr8aDxmOoIh4Q
 /TtvFKhyo3rVFcy0cZamgqhl6UX1FIQShBOkJN/fJdvOXwHWTr+muREQ9iZxgs+XNMXs4GZ/gpx
 AqNTyEaFRpLXLhlzS6+VbtTZUe9mn96d0SyVnSwpNscE+vsyjFSyYi3oDwqIjvwGOakviH7ZfMI
 65CvnKZrxDTNb+vB6JPmGVXive0RyOrKV6dVJEwEC2uAxfU7DWBX+Qac68TcFZPgBnqtls5niU8
 YCBqDjUUZ8ZXm3Zncz4XJlNGH3lHmTjZJyowB0xafF+uW9Gu+NlGoDBX//cTr5ARvjiKngM6fWu
 XKQDx0wnC9VaxmgtpqzISryZU4u6XV5+LxawYOBVjVOBys5haH4NmIOqlKrwkpIEl1ppBHx/LvO
 6YksWvRHH0FDDWUW3RkyM2xGgPkk4JPnL/EOgYRSSbqUiEtJJZAqqr16cRB52Cgaej8W5fcFOfH oMYgrNXBtoUabYQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The ISR calls dev_pm_opp_find_bw_ceil(), which can return EINVAL, ERANGE
or ENODEV, and if that one fails with ERANGE, then it tries again with
floor dev_pm_opp_find_bw_floor().

In theory, following error paths are possible:
1. First dev_pm_opp_find_bw_ceil() failed with an error different than
   ERANGE,
2. Any error from second dev_pm_opp_find_bw_floor().

However in practice this would mean that there are no suitable OPPs at
all, which is already being checked in the drivers probe() function.
This is impossible condition.

Relying however in interrupt handler bwmon_intr_thread() on
preconditions checked in probe() are not easy to follow from code
readability and very difficult to handle in static analysis, thus let's
make the code just obvious to silence warning reported by Smatch:

Reported by Smatch:
  icc-bwmon.c:693 bwmon_intr_thread() error: 'target_opp' dereferencing possible ERR_PTR()

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/aJTNEQsRFjrFknG9@stanley.mountain/
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Rephrase commit msg (Konrad)
2. Drop Fixes and cc-stable as this is impossible to trigger
---
 drivers/soc/qcom/icc-bwmon.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soc/qcom/icc-bwmon.c b/drivers/soc/qcom/icc-bwmon.c
index 3dfa448bf8cf..597f9025e422 100644
--- a/drivers/soc/qcom/icc-bwmon.c
+++ b/drivers/soc/qcom/icc-bwmon.c
@@ -656,6 +656,9 @@ static irqreturn_t bwmon_intr_thread(int irq, void *dev_id)
 	if (IS_ERR(target_opp) && PTR_ERR(target_opp) == -ERANGE)
 		target_opp = dev_pm_opp_find_bw_floor(bwmon->dev, &bw_kbps, 0);
 
+	if (IS_ERR(target_opp))
+		return IRQ_HANDLED;
+
 	bwmon->target_kbps = bw_kbps;
 
 	bw_kbps--;
-- 
2.48.1


