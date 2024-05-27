Return-Path: <linux-arm-msm+bounces-20619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF858D00C2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 15:00:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B5E61F250A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 13:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6863F1649D1;
	Mon, 27 May 2024 12:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="k05NMUWE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582FA161336
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 12:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716814621; cv=none; b=H6HH9KoYZ2VdP7bfV9qeoq25HRKd9V5VjCv1DcNu7jkxLgtIqjpQbndQarq4PZKfxCkdg1Pm883c2ODVq091oJD0wV3OjAvgyrdNiAyYIriIFLkI0UN/jFmP0scl9tR7uSGjxxTbfYYMXSpQDhXpERYvNO43E0FQ/3Nl6PW3mn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716814621; c=relaxed/simple;
	bh=SIkMSB3sTwPPn0mnOg/kQxIYsQNRjn/iYM96mTvFTjo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NOvZmsI8eJYaANuO29mh5T0spG9LKoJ97/bJgHgePM8coN8vvzIKzZ5osFCn7X5YtZ5hnrCFV7xeNcmoqYf8O7I7ntCUMaNyAQdJrlpH+7FMaFG0usGnRkcQ69dlgg1Dr2nFSfc7gf1sbZK7OA96CCTmD9xKVj1WS5H4gEUbtTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=k05NMUWE; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2e9819a6327so4977251fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 05:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716814617; x=1717419417; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GmwN8T//95zxjXecxSSl+qUrKqxrPgq9A+fgiSUHBZ8=;
        b=k05NMUWEK2Mm3UwMDJGiJBKZru4xuxkcDhy6QUAztL/MVPCckzxVsowf2ftJlSHV3V
         BfPoJDCM9RkEqffjjZPAuvhQXgjRhvO+Mnvw9fZDurWL+WUgjWpHS401qIzhCJQJQT91
         22lPv+KQT5xnPgGhiWZAAsjpCCBWNwWjj84RzP5VuUotJ21W8PBs9HsyZfUqdkkcOY24
         /WzYxyp9Tfx9Gz9kyJarMjGIKKGihOHCtKVFwCEeHMdccs5W9QCjw8gepO6Hlgb50OR5
         47yuXFv0skEk87u7STmGY6qHQ/s98yyPltGXheOzX8JB3aiT7UpUNvmxwa9Da0OegsMe
         l8PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716814617; x=1717419417;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GmwN8T//95zxjXecxSSl+qUrKqxrPgq9A+fgiSUHBZ8=;
        b=JuDDYQhbjaud0rWbgEHtIZ9jO28FETgUmYXLnDhhlrYbOD/akPQEGdO2aiKLPooZoI
         9/l84G/U3AQxicxFrzOaK5aEgDUUmV/+99FL0350qW1hvwyI7OYw9Pwd/z11jW89Opx/
         tm1IcC3JxoIzrrILuTtNV3i4ODE2ZsqHxxgyAaFja1uGlM1l4j/HbPZfcdJi1XCG5mYG
         IKafEi7XkBMqaosXJ4xSSjjkDpivLK0mzabjULL57ocXAvgJjFqltGiYPo71NhiILQj/
         Qs1TkG2Qm0SXc4l9Kxa9JD/c2G9LOZK0/eXINwIQ1SUKwdUpqinhCI+LBrRDmKdbLxf7
         xadw==
X-Gm-Message-State: AOJu0YwXARVh7aWgdVazLqtLI50bZicm98EmEUPcPD2V9wiH9XLJViW4
	6LzIXStnBWFtL4coZiDNO9eXdMQmkgU2P+6TDT8t8RjzCAh5tVFCVoMKPfVez34=
X-Google-Smtp-Source: AGHT+IHKVmTORLwXgauibbUsgi4IYgXJPRYSh+jV0Ob0wIxHrRD9Y6Js2gCtG4ungVqc2e8ClOuQfw==
X-Received: by 2002:a2e:beab:0:b0:2e2:7f2:9f9d with SMTP id 38308e7fff4ca-2e95b0bdc6amr68330541fa.24.1716814617360;
        Mon, 27 May 2024 05:56:57 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:75a:e000:c322:131e:ff9d:ef41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100f64f98sm138753635e9.24.2024.05.27.05.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 05:56:57 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 27 May 2024 14:55:03 +0200
Subject: [PATCH v10 13/15] firmware: qcom: scm: clarify the comment in
 qcom_scm_pas_init_image()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-shm-bridge-v10-13-ce7afaa58d3a@linaro.org>
References: <20240527-shm-bridge-v10-0-ce7afaa58d3a@linaro.org>
In-Reply-To: <20240527-shm-bridge-v10-0-ce7afaa58d3a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Das Srinagesh <quic_gurus@quicinc.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Maximilian Luz <luzmaximilian@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Arnd Bergmann <arnd@arndb.de>, Elliot Berman <quic_eberman@quicinc.com>, 
 Alex Elder <elder@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel@quicinc.com, Andrew Halaney <ahalaney@redhat.com>, 
 Deepti Jaggi <quic_djaggi@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1428;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=H6Dcs2qENOv98shWWncB/3KIXUDdoYx6h7wJF3Xk+vk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmVIMKEwgpVJ1xtFxonWJa7NAoY3e/iI4djtIu+
 yVmo6rynJ+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZlSDCgAKCRARpy6gFHHX
 ciZZEACPxKDvskowoZgnc1cO2L7lXWmNUEf7Vb4zUvdaLz3U4yQ4x/xF+LXu+pa0/81K9+u8FG0
 fTfFA5pEamXWboVOwXK9lYDw1ay3OUEqzBRcP3qa32nQzwYZAktYQmmw/2Lq9El0x/nwUkg5gKd
 CQ/0l/PFbDBVF2UsuvALOHeMq5EtvVTrDxVe6zbzb70ACVuzX+N4zK7P1DAEtZAKW6aMydLB/aw
 AmBL56uyR77XErIBN0bW1thuXcInFfG2KL2EVJuJYyKTOY5mhJKF0GfG/bkhWeEgdmIC9LFTgVm
 kiQL67QOwvvncalUbB5NBA8/sOJhlVu+hj3O4NdGuyBz9zvCUjpRIzktjnGmZxA/iHcqJvoD4UO
 sbyq/bXWDfZtSoOrP6i+mMXk9W+jjgdqzFtYns3HeewB5HHsmwPPlbrVMShyletl7ddgg/aDlno
 sxO3Wl7Zi1/Ov/cbgXSLzcy4Qtnk6vwm+J9IrQv/CFuQk02QLsX/nShjyuM9Mw1VAzjF98zd7Ji
 WjOI4k56oaoc1zrQITItsq4FGiPrAnY+t9WSxGycb/vlhHPC37vwaeWlJGgIe+yzDbu1Dk28tr6
 fjN7Wy1nWNi+40A5OKftR7FMViFX8ObNiyUSk6JYWPb1DZ8MQHkNBZN9W57dYKVevF+uEDt70YC
 IQOnTuF2Q13qlHw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The "memory protection" mechanism mentioned in the comment is the SHM
Bridge. This is also the reason why we do not convert this call to using
the TZ memory allocator.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Tested-by: Andrew Halaney <ahalaney@redhat.com> # sc8280xp-lenovo-thinkpad-x13s
Tested-by: Deepti Jaggi <quic_djaggi@quicinc.com> #sa8775p-ride
Reviewed-by: Elliot Berman <quic_eberman@quicinc.com>
---
 drivers/firmware/qcom/qcom_scm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index c82957727650..86e26f17ca19 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -583,6 +583,13 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
 	 * During the scm call memory protection will be enabled for the meta
 	 * data blob, so make sure it's physically contiguous, 4K aligned and
 	 * non-cachable to avoid XPU violations.
+	 *
+	 * For PIL calls the hypervisor creates SHM Bridges for the blob
+	 * buffers on behalf of Linus so we must not do it ourselves hence
+	 * not using the TZMem allocator here.
+	 *
+	 * If we pass a buffer that is already part of an SHM Bridge to this
+	 * call, it will fail.
 	 */
 	mdata_buf = dma_alloc_coherent(__scm->dev, size, &mdata_phys,
 				       GFP_KERNEL);

-- 
2.43.0


