Return-Path: <linux-arm-msm+bounces-10164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0B584DEA9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Feb 2024 11:51:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87BAF287E29
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Feb 2024 10:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9530A6F50F;
	Thu,  8 Feb 2024 10:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TqghBnpW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D056F077
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Feb 2024 10:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707389468; cv=none; b=E6kLo414CEGqDbQVyVChAU1iL+efVpfxeJ91/RptvXpEj417J8cTGJwxhEH4DmgFefXLEJ7xfIVKHQfUGlcKKhjmrJmygQpZyevvnm++Ggh9vbX2ZCvqONcUfYXdHffYgNsIphCZjwaHu5dYGUak7sDxkC0wQ49uJ+/Qmqr1eFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707389468; c=relaxed/simple;
	bh=i8EZnRbZHfuf7N5DpqNnYN9HzPImHJSMtCX8U31PqOs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fb+v2h0GcGxgv8NfflfGSsWbCIe1+s1oNPhQXQPhzmlNs0gIJ+D0dwH6M7D7h2Mwt9nsCTjlW+5DwPh4uTY1mBYVKDak+ALCRNTy86/zowaPx9mJV0iqqFHyYXw5f6QPYBiP4sXVFgQTt/Pz/CgHEddsSbXI3HsIMKj1m7zl64M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TqghBnpW; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4101eb5a115so11966355e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Feb 2024 02:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707389465; x=1707994265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Cmg0Zs3p+Vksv5va0smH047wi/mWujrplTLNUNeaX8=;
        b=TqghBnpWftSICcIekkMvThV4yOPoZnjIp/3t7UsoeInYznjYzjI1iIN+KthKBAfpKU
         ZYxgx2RKxWkRRG020i796uS4QOxWgrG0bkvqy0gIshjLNZJYxnUDJ1Gd4pGMzRKL77mu
         fLhV68i2Y0dhUTOi1Y7V3fxi+Ru+eb8pZuMQTdIuvfYJUA8QA7XWAJ7OBaz0TZjCZh+7
         fQ2FXxjwsuG7RIrruJDsTXbxiA2mAFn3Ab/NZf1Pr4a0RErUTNiSthQrGQ2gSiWfLKSd
         EZICUTBYOOsd+Qp0kwsaknajQ9tSTSjCOX7wtMc4qQx1kXPTDddTMqlD0iskCc/Nb9p0
         Wm0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707389465; x=1707994265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Cmg0Zs3p+Vksv5va0smH047wi/mWujrplTLNUNeaX8=;
        b=clBLEXE6z/Iv4XipR1o8vvK6JhK3oWY7HiLZaXi6QHdajwpIp5r9dAMUcK3vWPq1rb
         q3jigpfFBoZm4xRf+Z+Kvf7y7Y68VLSdiBDsgVB38ozUVEfRbL6wDBF2gW9sy16kJjVt
         1G0cw7pNKlzSgrYGyXm8RBM58ikRAB9sYlcnqBXEhTq6CeS2CrmSLp8C3hV4YZsYE2Vr
         KuyrJEWsBjlcFhaxyQKAb3aG7zo/+zjZhN/ah6E5voSOq0Xwno67TDDky/yCxfZNPbB9
         DyKwtnEo9qWW+n+6ji7Y5P/ZmP3w88Twn2YIsuiPyBXLmO4v0w9dRuXnCWXcdZVLP9qM
         WDnQ==
X-Gm-Message-State: AOJu0YzfkigayjrRlbQ6kNnJ73cKpKzsphidt5RbgH6rb93MPKipBedq
	oWsdsBF1C9K5uY9Uiup2DYO3wUXiMzez8rsQL/p0pcGdfJpVoYLgEmNRcs4ErEA=
X-Google-Smtp-Source: AGHT+IHvmLAlGiCRZQ7XaPbNVx2utDBdeImE0TypGyzQZPMt9GSGjXvXgXfyqBC1grIHeJ3nbnumrA==
X-Received: by 2002:a5d:6646:0:b0:33b:4ec0:8166 with SMTP id f6-20020a5d6646000000b0033b4ec08166mr3027693wrw.37.1707389465008;
        Thu, 08 Feb 2024 02:51:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVVvLAKHg6HPEn7s4JM3bYEz64K65nXyGFVg5+285zwNA8EEsU1L21I8OYmm2/VSnXg073V1n6s7qJIQUh100UHz+k3VODyNQOaQo6G8Ta9p9xkBPP7bpIREHpOYbc704vhwqXXu6ojKGKXS9tInOVAQHNy9tL6d90X3Wg7YjgPn7h51tVtwsCNa01kVPpTbvLVLx7f7eMxpaS5TRrulzZZ9HSdbAuJMdAv2RhL7OT18bK9
Received: from krzk-bin.. ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id s1-20020a5d69c1000000b0033b4719eb6esm3308283wrw.27.2024.02.08.02.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 02:51:04 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Georgi Djakov <djakov@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/6] interconnect: qcom: sm8250: constify pointer to qcom_icc_node
Date: Thu,  8 Feb 2024 11:50:53 +0100
Message-Id: <20240208105056.128448-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240208105056.128448-1-krzysztof.kozlowski@linaro.org>
References: <20240208105056.128448-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pointers to struct qcom_icc_node are const.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/interconnect/qcom/sm8250.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/interconnect/qcom/sm8250.c b/drivers/interconnect/qcom/sm8250.c
index 02d40eea0d69..1879fa15761f 100644
--- a/drivers/interconnect/qcom/sm8250.c
+++ b/drivers/interconnect/qcom/sm8250.c
@@ -1673,7 +1673,7 @@ static struct qcom_icc_bcm * const qup_virt_bcms[] = {
 	&bcm_qup0,
 };
 
-static struct qcom_icc_node *qup_virt_nodes[] = {
+static struct qcom_icc_node * const qup_virt_nodes[] = {
 	[MASTER_QUP_CORE_0] = &qup0_core_master,
 	[MASTER_QUP_CORE_1] = &qup1_core_master,
 	[MASTER_QUP_CORE_2] = &qup2_core_master,
-- 
2.34.1


