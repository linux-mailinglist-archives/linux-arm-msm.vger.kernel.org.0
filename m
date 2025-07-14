Return-Path: <linux-arm-msm+bounces-64856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 143FBB046A7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 19:37:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E1221A63E43
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 17:37:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 163BF269B01;
	Mon, 14 Jul 2025 17:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZIZm+rgF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0CC267AED;
	Mon, 14 Jul 2025 17:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752514593; cv=none; b=ExjJSvdb4N5pyv5Z4VcojRYTT8WmWTQISEdViLZu9qLkM0nlCr6ymMns/zAU8Yr2fsuwRGTr1mXMQLT8WNuXNe3tVcLozmXVfx3dLaQIwscYfypAziuXFtWRbdtSCZ3U/wyHvHdT4jesQ+iD+5rV+k7BRHR8GFFxv7/kNvXtQzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752514593; c=relaxed/simple;
	bh=E3C8b0Zc4N5eu3Cs++FMCzsi17JZrq6nsRV8z5BcgcA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YL72sanBm1PoNAJ+jN7K4x4uqeWHxU93kRhz5hdgqSVVEpe5TS6kx0BH//3vWsfEzFDz0JAiWOnGp7hptg/SyOyYfDC9aSg9DAsrtVCG27TFVmRnngs22r8fDo3ZvkzVYfmxfyj1+eWkC+I+CP3k7AOtCJcBjTnn8UpVZdkrfFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZIZm+rgF; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-451d54214adso31302725e9.3;
        Mon, 14 Jul 2025 10:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752514590; x=1753119390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mVrg1vBYWFvGiJ05D7/0fai3Jew1968JhRVyvMTn93U=;
        b=ZIZm+rgFS6CzTZduD5GW70+fU76gVhKHcDwjOxmy3dyMBfpXEcjtEwf520pT0gQ8ax
         aRtl/u4XokqEqMeTwiPNgwLZRe/sAGvXWK5Sq/FEzIWdnBfBTnzvJBuWJD21cRkUbjJx
         f0JmK1U7dnYWTrnDbXOacgZad61Fdt6OmBlueFGE+tHO3Me/tYCCZ60Q1012o8ukHpmf
         XZGZJ5+HH/rruOCPFe0sr+Jydd1ZkH14gJ426z7N5HF8h+qCJvOITxSXSmlwiGNqTj/r
         UwCFgPOuzt9ab6NzVrZV7SQYQWQSWCCp4YMqUUZIk1i53VTkY4bqyJ+fnFbHK9J/oaS5
         NV1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752514590; x=1753119390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mVrg1vBYWFvGiJ05D7/0fai3Jew1968JhRVyvMTn93U=;
        b=EsKJb4JoOo4k3eWW99rqIwgw9rIdpABVzRZGKmkMHImGGJ6VLIU07rie+EmjWOAA+7
         bxk4YdNUNczdbR5lYgNgXUUjIxPUG1e+eFRklKbyIHaOBVtUdoK8uRq5s3QyFz9mbg4x
         mMtH/Xy/AJ6J5PNzkq/5VChBnfD/y3xqI+hEt6l+60xc0wVYwBrxbL4iQynAUSANWYCa
         iiIN3wxw4GQ36AW9RXIFEdUGGpUpHLEQZgFiDo8jCat+5vYqBAHCBrFRtttFi0Bb6pK7
         PptrjokMrNrTxSN7mH59vauASt0rD06wvt8QhSqS6CxXSf0W5kCTyLG2YJqm1h3UAgX7
         BMcA==
X-Forwarded-Encrypted: i=1; AJvYcCUP1pOd3+3Sq3hWEFqAqOrPXP3B/9evJULdAQCd68hfIUpBHQ7gEfX3lb6hRDFU0WBL4gRYUCH7Fh/4yDzh@vger.kernel.org, AJvYcCXIDDVHqPDqgrQVwB4gPy13EaCP8Rz0TA+wDbRC3gyTRPFi0C1yzQ0YYJoGASF3zKrSA/dkFV4Ex9Ubw8vv@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0iznpt5+Zk8ggrqeIGumG3AMXzyu2f3a2CMcxFQE7nYONT1bp
	L5Hqfgj1fNDTSil/8aOY3eTfXtSFKhVGJVUJaUGfAgfxXFMlxKzjQ/kGO6ZZE1MRiqI=
X-Gm-Gg: ASbGncuIOu/GJw2tH0+KadftbF1Hf2SzXcTrWDgAWbUz8GDFUho2bzkcpojy6Prvijr
	9ZC5pJoYX2vFiw7++2M9UefqLfMp0DbGeXG2ymmrstO2qLyzKbXNXyaa9ln8Ou+yA2GEVE1eIa1
	xSLbh6LjXX6uOy1f+MeEc3/lDNQ+1JjwC5a3JikOwy5FHSktADXYqzvsU7o9pQJfE+mvmCR4I1f
	JbvHP2jUUU9aa6lZwiRTv2Ey8GRqYc5lRchupdETopQBTnhbYnJPPr9g1oXLgqXkQY968ian5oN
	F3MjEayziSO80i73YQlBiHpQ7el2SQ/nuD1kcS3QpMRaqHMOJEzzvLtxSI0Z7fbz/x7ItAyqzQi
	higK3qWHbaMdxKtdEixAcMBn3ImxduWwNi3g=
X-Google-Smtp-Source: AGHT+IGyn6xDb8CNs3L8feS6EkmrXlEgjMNLym6zhKfAH/hoOxnUCWhRvqfHLAyzr2nC2UrZ4j7oMg==
X-Received: by 2002:adf:9d82:0:b0:3a4:dd02:f724 with SMTP id ffacd0b85a97d-3b5f18d2bd0mr9882720f8f.43.1752514588858;
        Mon, 14 Jul 2025 10:36:28 -0700 (PDT)
Received: from alarm (92.40.201.95.threembb.co.uk. [92.40.201.95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e0d872sm13152531f8f.60.2025.07.14.10.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 10:36:28 -0700 (PDT)
From: Dale Whinham <daleyo@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: =?UTF-8?q?J=C3=A9r=C3=B4me=20de=20Bretagne?= <jerome.debretagne@gmail.com>,
	Dale Whinham <daleyo@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/9] firmware: qcom: scm: allow QSEECOM on Surface Pro 11
Date: Mon, 14 Jul 2025 18:35:39 +0100
Message-ID: <20250714173554.14223-4-daleyo@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250714173554.14223-1-daleyo@gmail.com>
References: <20250714173554.14223-1-daleyo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Enables access to EFI variables on this machine.

Tested-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
Signed-off-by: Dale Whinham <daleyo@gmail.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index fc4d67e4c4a6..595c9c100af1 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1995,6 +1995,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "lenovo,yoga-slim7x" },
 	{ .compatible = "microsoft,arcata", },
 	{ .compatible = "microsoft,blackrock" },
+	{ .compatible = "microsoft,denali", },
 	{ .compatible = "microsoft,romulus13", },
 	{ .compatible = "microsoft,romulus15", },
 	{ .compatible = "qcom,sc8180x-primus" },
-- 
2.50.1


