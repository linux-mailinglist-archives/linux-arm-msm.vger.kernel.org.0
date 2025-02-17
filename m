Return-Path: <linux-arm-msm+bounces-48185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EECA37FF1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 11:23:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9301F188BBDD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 10:19:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CF81218AD6;
	Mon, 17 Feb 2025 10:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o8twVDZo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EDC217641
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 10:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739787479; cv=none; b=KaYOBS3nuOhSYTm5UAhzPz9C7Gp0kpPD3NWyE0bI5LS/sJRyCukHNunXGxzLj1QGs2ENKN7YPTT7IqNf6IERSVsX18LflUcdLvZEvXIUghwb4H+PRLFGWWFoYYy2NWWwl6yKE2bwm19ASds1REmrsMfQq2CybLRWN4RjmIf1ioo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739787479; c=relaxed/simple;
	bh=aIDoW7X3UEqmkRU5fd1ed1f7Yb48yUxmvjsG6JEXMy4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jaQnn4XnTUJALsWxb8C2SvRgo+GuotS0TB4edC3TroUKNBCNLgyy9Dqs4IF45d8TgqqZuxPAWzxuMZUAHgj1sVNnGfBDg/TQgq5WbhBQO/5lEK4tyB8Y4lXfzPJHoutbZuTPHsdZk6i1xb9gv6HHVduCLgOPtbZsQC1ckpS2IPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o8twVDZo; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-abb79af88afso297711966b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 02:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739787475; x=1740392275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pjqSIaqjo22M/fJ6WrzBYInBLUW49xWtc11H9nbdufw=;
        b=o8twVDZojukUFWL3S8iI2AP6UXMtrVpRVaVZH5UvvmTEpXcZO1UpLxeF/YDscsxnCB
         S+jjnSTM2IasEld2rvi7OfFnTKUwwPSYqTk+coYyqOpzyHziSAl9zl9ev9M3FstDb+5+
         6cErzq/sJAhoxcjpkzUqzAsC7sjlrUrsgoclQu4UtPVOQaI9hsjGQJM+gNY4bjgXnNXq
         520EfVxXrR3v4tW+oAMjlHcgqhXKdqfbFznB/CwuROHoYjyRM1beA6qm27iN4iy2tif0
         Bs/ZBIll+F39RX/vEk+4u5isoI7LTWYnz8UsU8QLOJSPKMibWBQMwpbEJxaN1dZnHue9
         wutA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739787475; x=1740392275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pjqSIaqjo22M/fJ6WrzBYInBLUW49xWtc11H9nbdufw=;
        b=U/5l4e5LZbDSZ9UBbrRe8uHwrKPax1IPhWRdvtPh5v8+/PKd3zzWGrLp/Q5cTX9D9C
         AnAarPEvH6yUDzSzb3//IMziLJLbVC0uAQ70nMPt+ViHRirt3C4idDDgpufI6+z/tabp
         RnJKPINgXdPf2pok9KeVlpsvQ2gZGCvZjNHOH30NB1RRG5OQoNPerm13TLdVairs2dvU
         1r+aNqTYPHq67JEgL9tmxp3lmI0doINMCd+n4p8uriIcOhjiS4rdDaH7dtYqC4Gik5yI
         pSAl+fE2+AUZ/fnkhpLcVW59/XtTymR0ooLeIx0avEGV04cFpV47ejA8/1Jl/sjq3Wgv
         SGvg==
X-Gm-Message-State: AOJu0YxVLmLIRlYsabfWyj2RoXvLxIJZQrb9VzFRXhoRIe8JysWdElHv
	v1uOqD65LOoP+bLSDvRsEEyMXf5GweTMDYqs1n+vBJNmMIA6QVCT1z6I5u7XLrBaD/JcLzkL+CW
	ZdwQ=
X-Gm-Gg: ASbGncsEQGfq1hHqh3dZNO2fqenZRPTmDk5N9LgiYbSEt3S1vZ2p9lk4ArrSVc+aNPH
	zJGEvYYl7I6Z1+HW7kVaCRj10pHur1fKgnR85uz4353tjfXG9WpOZFQv8wpWr7kEtfRg36m/0/t
	8CkXPOn9Cezqqepq7XRPRzn6eLKJykcFhnhaH5lyHxUuk0HA88X6g7FGcjnmizqxOnqfTJ3fYBL
	/pNmmT26jqqafkBIIu2VfXsxJHDH41b0zYfP8F+meAgTtdPIOzOZe9hnto2c8IkONs7hMAQxp8I
	7NT0zE7kaYqzvZ2rNj8cj/MB
X-Google-Smtp-Source: AGHT+IFlDyIupv/Dc3O4C3y1gwzt/272w46jucKO95aSvrTTvzjMkzKCPNIWu+2421TQveFqhl50lg==
X-Received: by 2002:a17:907:26ce:b0:ab7:b878:e8bc with SMTP id a640c23a62f3a-abb70de288cmr1064938866b.38.1739787474939;
        Mon, 17 Feb 2025 02:17:54 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb8b1767e8sm308583266b.174.2025.02.17.02.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 02:17:54 -0800 (PST)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	kees@kernel.org
Cc: linux-kernel@vger.kernel.org,
	johannes@sipsolutions.net,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	tony.luck@intel.com,
	gpiccoli@igalia.com,
	pmladek@suse.com,
	rostedt@goodmis.org,
	john.ogness@linutronix.de,
	senozhatsky@chromium.org,
	quic_mojha@quicinc.com,
	linux-arm-kernel@lists.infradead.org,
	kernel@quicinc.com,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [RFC][PATCH 06/10] qcom: smem: enable smem pstore backend
Date: Mon, 17 Feb 2025 12:17:02 +0200
Message-ID: <20250217101706.2104498-7-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250217101706.2104498-1-eugen.hristev@linaro.org>
References: <20250217101706.2104498-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable smem pstore backend that registers regions into the minidump
table.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 drivers/soc/qcom/smem.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index 592819701809..f4d2646fcc0b 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -1236,11 +1236,21 @@ static int qcom_smem_probe(struct platform_device *pdev)
 	if (IS_ERR(smem->socinfo))
 		dev_dbg(&pdev->dev, "failed to register socinfo device\n");
 
+	ret = qcom_smem_md_init(&pdev->dev);
+	if (ret)
+		dev_info(&pdev->dev, "smem minidump backend init failed\n");
+
+	ret = qcom_register_pstore_smem(&pdev->dev);
+	if (ret)
+		dev_info(&pdev->dev, "smem pstore backend registration failed\n");
+
 	return 0;
 }
 
 static void qcom_smem_remove(struct platform_device *pdev)
 {
+	qcom_unregister_pstore_smem();
+
 	platform_device_unregister(__smem->socinfo);
 
 	hwspin_lock_free(__smem->hwlock);
-- 
2.43.0


