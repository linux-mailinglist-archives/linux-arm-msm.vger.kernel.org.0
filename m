Return-Path: <linux-arm-msm+bounces-69992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D6991B2E1EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 18:09:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD55A1C862D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 16:03:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D49B6322DD4;
	Wed, 20 Aug 2025 16:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nk2aej5+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB48132276B
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 16:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755705765; cv=none; b=uZfnZ9uVEi7nX1jnbK6hYDEz9lvGPiOP3mMzA/ShUvhNRw403M8dnVgB+5xJMpdD13ZQ2xfuwlRPqBREDDzsc3kdMzp/gwWiHxH2YC66V4mtM5wxaCTt0W5zWAsmvJVVlRZDKAht3SiYU/cIwcRRnL03+tqPJbdfWaIrC1KfVHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755705765; c=relaxed/simple;
	bh=J9tk26b5d9valUn3AJ23BPP4CY9PZS2upYUI2TK7QI0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RjTLOA59rauztVCuatzNcILiBQJxQAB093AbfVn3v000DQgMtyMTeYkYXcUleu04bQreI+KSqbpfL5wbhRmcJ9yIzPo5zqYLKEW1J01glO1wzDaVvOAClR4MIPaHujsMLZn2Vv/fz4AZy1dl53VyIJbhgI6gdEqfg+I0LfKqHhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nk2aej5+; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b9dc5c8ee7so80654f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 09:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755705762; x=1756310562; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SDa/L/vLfvl5Q/JDuMqiafLyaLhOcwaxXf7Kgn9DrQA=;
        b=Nk2aej5+FL3m6VlEtkGxF9S8CjsFj2ivRw3PpaLk6Xot2jdIcq4WShB55LesLwb9F8
         tiPiBHVoaW3hlTs6YHHr57zJLoDTJpppgxywGXTCtRUXNugHu2hD5ZFn1M5xgY+eN4oB
         HQs4+LHbToBJv5cQDX4y4eqszCBG1SxdQBSanGg5iMHwI7QKZwkMFHnlExayYHLLQr7l
         Ccfse6M+iFy9KCU/03dF2+qUNi8ZVhzgSMxqtQb1dx+UH3RltjCKJRiaHhrSPj5CrJZT
         GTsenxk2BFOkTJebB12DqfUgMBCzqmMjHLt3Pw8Zmi4xGeHuU0WBY4mfNlfYI5993mS5
         FBXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755705762; x=1756310562;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SDa/L/vLfvl5Q/JDuMqiafLyaLhOcwaxXf7Kgn9DrQA=;
        b=PZt7rgZ4bmp7OmC2uXG2x4mMfZrDjTkExXz2XI/CZyYsLb9h21eYLIMbSBP6wvj5/q
         XysjQOB2FU4lKCoxQEuDbcxFf99nZ1OE06qVD20q08kKaRD4/WtzZ+SrxHV7Da66yKsH
         H2gSJDKc2Y6nZjHAa875QoD2Ri2s0Zvq3Qu+suQU4nXlTi/9iQ45WBfJxtNbrkhp0Hf8
         SrLIS9KAa0WpWzo0gzlMubyWF+fuhzl5ii4ezzE5EkjFMPxkLKYS0ug2Uk7bJLnDwG0B
         FpBB2zwkqpMu2fvmxR7f0yhjCAMLZ73K6oQTCwofvmNM5EMlseGFkL1AZ0o1877ewRNk
         ngyg==
X-Forwarded-Encrypted: i=1; AJvYcCWdlDIr1EU3fIoPIuCbSIe+QoWzQVJr6hR7bC/3dGxnrjBBd/jxsZlFrHaUcKp/VcSHRBYS60wWh8b6/ihY@vger.kernel.org
X-Gm-Message-State: AOJu0YzC17igKDW0uNbS6HCi1P3TCO69H8jt9SGhaEeqzoX98nWG59h1
	091+UmNsxZR7Sp+0issJG5d0MBrKXMndjOlye8x8CPxIJjQ6LabUlI900+0qe2lrso4=
X-Gm-Gg: ASbGncuWfvlBcfKp58+nnfY/07QLD4oS90ruq8+yNm0rapGdIhiHlHjSI5NlVT7D54O
	LIG8Se6UkOSEKzKjhaYuY2xCmrlRxdHyhhSLRFPkDgJlCkvQya864D2QtE5kzLbxmIYDWB3TgDE
	ksFhO14lN4UudRIRS87yLmDtjMP9dCsuOIBUPlrZh/FgdjB2v5S+pcklFqu4NAvbi1mrGYox0nN
	7aSXTQSxno1oN77+Jn/e8U8pDDtxZ33CjudOJz7MDDkzZ7iEd6SkoJ//c2wd25AoEp+qwneKLV3
	5Rk3Q1+f5xcbkZtFOkZjHbmY1T7W6KENlGTzoTtbtag75ee0GByEeu0aGHrYRQo6t+c1guXhOcu
	1SVoktFp2TbbvB3kDsIzakIaLENmfj0CfDruI
X-Google-Smtp-Source: AGHT+IEGtQPDjtGEux8eJN642OMcw5qEtkm8AZN7DXfDDbrt3JlPYakLqgOYzRpBWVMGssyGGPAxFg==
X-Received: by 2002:a5d:62c8:0:b0:3b9:7bea:149e with SMTP id ffacd0b85a97d-3c32c52bb7dmr1711279f8f.8.1755705761522;
        Wed, 20 Aug 2025 09:02:41 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:f5f2:96b:fcb7:af4b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c074d43956sm8364628f8f.19.2025.08.20.09.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 09:02:41 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Wed, 20 Aug 2025 18:02:34 +0200
Subject: [PATCH v2 2/4] remoteproc: qcom_q6v5: Avoid handling handover
 twice
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-rproc-qcom-q6v5-fixes-v2-2-910b1a3aff71@linaro.org>
References: <20250820-rproc-qcom-q6v5-fixes-v2-0-910b1a3aff71@linaro.org>
In-Reply-To: <20250820-rproc-qcom-q6v5-fixes-v2-0-910b1a3aff71@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Sibi Sankar <quic_sibis@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2

A remoteproc could theoretically signal handover twice. This is unexpected
and would break the reference counting for the handover resources (power
domains, clocks, regulators, etc), so add a check to prevent that from
happening.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/remoteproc/qcom_q6v5.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
index 769c6d6d6a731672eca9f960b05c68f6d4d77af2..58d5b85e58cdadabdd3e23d39c06a39196c3a194 100644
--- a/drivers/remoteproc/qcom_q6v5.c
+++ b/drivers/remoteproc/qcom_q6v5.c
@@ -164,6 +164,11 @@ static irqreturn_t q6v5_handover_interrupt(int irq, void *data)
 {
 	struct qcom_q6v5 *q6v5 = data;
 
+	if (q6v5->handover_issued) {
+		dev_err(q6v5->dev, "Handover signaled, but it already happened\n");
+		return IRQ_HANDLED;
+	}
+
 	if (q6v5->handover)
 		q6v5->handover(q6v5);
 

-- 
2.50.1


