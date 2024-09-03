Return-Path: <linux-arm-msm+bounces-30584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F67F96AC68
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 00:43:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 86AB2B20E3B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 22:43:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A0651D7991;
	Tue,  3 Sep 2024 22:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L6q5jND1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8111D5CE6;
	Tue,  3 Sep 2024 22:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725403395; cv=none; b=e/jqtHiRjIl2l1fFBljW53agPp1pNCCQKfnSxMzwFC8sarzy+hvfLEGApZQ2QAA4nbKhIgcZLzhz1u0IaUT71oIOnYNcrk5KryItpz3S9YRTsJ9n/wXVyl2eVCec8VlZjCWIYjIEJ5jbppUv+XESDaG2iwusOwMVwUE4t6dOOAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725403395; c=relaxed/simple;
	bh=GxfKgsp3WtmGBa30PFZIWzcUAICUrSdBdcLrR/1wDoY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mxlEr2c/lgEjEbUN+gjfk3hVuPuwQOWSlGQAu41/E2vzr9ndNdP1OBnrsMiFQd+0/fB9p86qOooTqr01CFES5N1VBPoIPkJ5YEirv4TYGFHymQIcS7HZnRzyla8rqi+eHZhMGTodJP4zaLGr8NTIh5vyPNzZ1gl0sy6cy+vvMD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L6q5jND1; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42c7b5b2d01so38661665e9.3;
        Tue, 03 Sep 2024 15:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725403392; x=1726008192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZmY0h7MPIitM3KYPrs5CrHyR7dJdBmp1EJkyHyhh60=;
        b=L6q5jND1S1lQv3OMXz/+qY/10EvkA/sSP/GLvL9yCfSLGOsrk7CVPDzj18OBxd/Oq5
         VstNNqJfo98lrKog/sopYd9NCs/2kEURoIslWviMHxi/FsG6FWYmuD9NwUvrKHkG6kNv
         4JSbPKJmZ1qLYqGRjKKdIL0UYyzalYConBSxfFnWkf/AzSqo7A3CiuIytMMs68baCt35
         LzABMxazDzZiFONWKA82bDgK/19UFV/GtFJ2wBe9pC1drnlD3Is8seY8qBdFBKIw9FNQ
         JKy65fg1ySh3pMHT3QLaBp+p/OKDsWL4krZgUEI+mGwKJiX8pyrF157JhauXPFzA9AGC
         eVGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725403392; x=1726008192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TZmY0h7MPIitM3KYPrs5CrHyR7dJdBmp1EJkyHyhh60=;
        b=wLS6dyETVrl9g33dXki4PhoTp7Qe0use7B5fh1WVDcMEpzvIpmD0t9tbdX26/ETNoe
         c/MMnQwXdXmC/Rwx6yV3J0p2+sSeyKpTJAN6jZVfQxWWAm9GjhQLp3h88mkKQPfx2p2n
         6dD6BPr1UrHimgb71r/ubQKVBv3dOIAN08Kt0gbtpVBFO0Mp+r1fvD7+jXQOlWkojRSv
         Xho9NUymCFF9FRUCXPua1R2bVFREJLuYUc4SqGghqZsD5J/Ttpt69gchYHkUnbvay9G8
         DnOS4V/u8scZ33+DZqMWo4rD0GbuDbH7CiGlj6xZnvvmwnmQr7yWKRM6cQn+KPD1U0dv
         8kyw==
X-Forwarded-Encrypted: i=1; AJvYcCVJFtwGhPVa9Ay89OvTxpFHzTGuVptGrJAqldsfnC91gfNQJvYCeUNXPbsQJ9VLqd6Tb9Hwpjh9ksHD@vger.kernel.org, AJvYcCVSkaTlAuZhOMDtYOx1/fZdqUTmjvml6P79mw1owAib6uOE0teTduPSATXfYOHmpnwTzFm8ju26hP+Vi4rE@vger.kernel.org, AJvYcCVbBh/gThojsLtRAZIjYZ30JRBHL+3B0B/o+dWXlVHADryzZ03V3E1piiQl4OROYibpCTroICCM7Jw8sK9LbA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyeyhO/JcRfzgJKLzPCe2kmO7Y6dozAUUnugk44nXMi+fako8PG
	dY6u8vsGv0bq1qmBSIjP6ON1AauspRTnZ5hUGKgdzDSngHJ+KmcEXlLyIf8=
X-Google-Smtp-Source: AGHT+IFaay50v/NPTfnaJdnwWnrcEA4ax0oleJ9MSRvgXV7IdB8ubySmq7t4FQXRVvRKck+isaBDEA==
X-Received: by 2002:a05:600c:1e8e:b0:428:fcb:962 with SMTP id 5b1f17b1804b1-42bb020d1a5mr145901335e9.36.1725403391629;
        Tue, 03 Sep 2024 15:43:11 -0700 (PDT)
Received: from surface.home (2a01cb080508df00ca9665fffed23409.ipv6.abo.wanadoo.fr. [2a01:cb08:508:df00:ca96:65ff:fed2:3409])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba6396516sm222955115e9.4.2024.09.03.15.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 15:43:10 -0700 (PDT)
From: =?UTF-8?q?J=C3=A9r=C3=B4me=20de=20Bretagne?= <jerome.debretagne@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] firmware: qcom: scm: Allow QSEECOM on Microsoft Surface Pro 9 5G
Date: Wed,  4 Sep 2024 00:42:50 +0200
Message-ID: <20240903224252.6207-3-jerome.debretagne@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240903224252.6207-1-jerome.debretagne@gmail.com>
References: <20240903224252.6207-1-jerome.debretagne@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add the SC8280XP-based Microsoft Surface Pro 9 5G to the allowlist.

Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 00c379a3cceb..5c8d8d75fb0a 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1725,6 +1725,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_send);
 static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "lenovo,flex-5g" },
 	{ .compatible = "lenovo,thinkpad-x13s", },
+	{ .compatible = "microsoft,arcata", },
 	{ .compatible = "qcom,sc8180x-primus" },
 	{ .compatible = "qcom,x1e80100-crd" },
 	{ .compatible = "qcom,x1e80100-qcp" },
-- 
2.45.2


