Return-Path: <linux-arm-msm+bounces-88989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB43D1DC8B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 11:03:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 658A53013971
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 10:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A21E38A294;
	Wed, 14 Jan 2026 10:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kDTOtVhq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBF738A2A9
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 10:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768384861; cv=none; b=pr7odn2JDbcdWWyEznlRVemilUlQ64qdDyET2u9duFzGZNEVrX8c00iloQIxpfvnuedK6l8GS4ID+WZjJY5J1dXrmsdLqr1XFReWPAP2kX3pKALulyUh7zvLb+6OqJm6EFFB9TX94cTrQevakhZaLwn6dPmqQ3u2Qx5GOT5W6Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768384861; c=relaxed/simple;
	bh=hUYScQaRX0QfzkUatVOP/WusQlNS1mD4mV/UULK5pUw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EEVseLID7OTQsz8jzEGS2PtljU0prpDRBH7fLcP5uyrCZG3gNUMqD21UEM7YUfGBC1iMRhQPq6cEYyGeZRVMzNw5nBd7nsEj2hKBob8eex4bNyMIORnOQ17PfbO3WW0al9e3XURN+5I6CwYqzuc8MdAqziNfyc6ay28UNIixBRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kDTOtVhq; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c56188aef06so2044652a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 02:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768384859; x=1768989659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+G6pf8+5EFoESwai3MJ4dA07jKvv0MdZ3B0YqUEleVY=;
        b=kDTOtVhqA1DfG0wD3Be9OmLKC02GChnOWPMdKUHf6Tps0NQgE+PZTmsd3ahCCk1hAf
         gyzluVx6r2lRHpeyZIy1ejZ2LnfyXFuQ7hojrY9i+y7kLiX3bGA3ZJsRnBrPjq3wtMF8
         uVABtnBHS5PziYAvgM3UPRm+YJGRV3H85QZAEBq72LZRQ8L/eMr1xrV3PqVYazBz3DEE
         RCbRqHlk7v8t2JcxiljuS34XGmyTrkbiePEnXmAJ0qZ0/bfcBxOyB9mXvoYNt4R/Pn61
         nJ90i9g6jwpLnWU1+WuOQB5iUwEaMD+VOu8i/lhz9fML4SiiRi1iZBEgvVdBrXdRmNEo
         RnyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768384859; x=1768989659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+G6pf8+5EFoESwai3MJ4dA07jKvv0MdZ3B0YqUEleVY=;
        b=kFa5s20PzmhEQXCLhZFZXMzKwCzK26ZJtprND32VZ/FMbxGaWH7E0ZlDMAr2vv9LIM
         1lNqlTeMInbMgcRByhjqRpAu91ey/DDBhKhUBo/v/6aVa+7TbnJyfX2FLBtwV8sb9gz8
         WVjkKJKcZGU5UhQZYTj5u/t+XlY+eKz5hBAnXTnyisvB/S5+P1I4x7dDz4cjIalMKX0M
         aj8NIYYnr9pn+vs8TecxpT8U+nlYthJCdda9lHtG6SignEcon4r4G44gUH65i23EV7y+
         4fIcPFEgo9z/ndRi6UAGR4uUZfTjChgy2HYigynLWRK3ZwL5ZQWb6Qh3q9bnws7cYceN
         4xDw==
X-Forwarded-Encrypted: i=1; AJvYcCUzcjR8xasR/30UEIU85pVKDQp7Q0YnaflrkEKtUelt/IbnL3RNjBWbo6IC/hbM4lsG6CVXCh5Vm8hVFzT8@vger.kernel.org
X-Gm-Message-State: AOJu0YxTkjRMpChNvcy9sxN9bPAT3kfgrwy/6BWbFFYXdMh3HfGYq3QE
	Nk/+x1vCm6frPgWLplkor7g8xkv7SSPmdkv6QzgWAUMBUCRrp8LmQy4V
X-Gm-Gg: AY/fxX5E3mtYjeMiAvWm1NyDlSxd+k4sH0ZYgPMby5Tzd7GBfgBj+BbHmn5GexyibR4
	nlFD+7rX44c+53rZF8S5EY4Y83WHDQ8Srp+9U8zGqfL3gENxxY3kED/3cOmlNQS37M15HNd4ppS
	fB24GkTU68QsCieCuzTghNFA9+1SoeFXBXQsmbLTmxlDfp3FauJsKgnjdkbTTGHF86VkQnrf5nv
	b0sA1ZF6VbZKoSBB2yb/pxkJMH5ttsuMsTc1ZbvPhP7lZdW7sgQYE/0s+9bRO7R4ZpjoN0wtOOo
	/UgHfp46ZsWUgbtiKJhm7PzK+kZrHvCFypiZnGbb0dQdAj7/IaI73AvcBy2a+g33Ot+oDgqKR9/
	8BnWepLRmfCkrMhvETB4OJ6mATxg5/0qFNnUa8jZ3VdEEtX4KsL3g7LAf8XZe9RPN0PVmYq1Dv9
	T+RRQQY1owPcjdwEsSLMeMYq1TNDBrAaWPKHz8
X-Received: by 2002:a17:90b:3512:b0:343:e461:9022 with SMTP id 98e67ed59e1d1-3510b126787mr1701683a91.24.1768384858688;
        Wed, 14 Jan 2026 02:00:58 -0800 (PST)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35109c78f20sm1522043a91.13.2026.01.14.02.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 02:00:58 -0800 (PST)
From: Sudarshan Shetty <tessolveupstream@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sudarshan Shetty <tessolveupstream@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v12 1/3] dt-bindings: arm: qcom: talos-evk: Add QCS615 Talos EVK SMARC platform
Date: Wed, 14 Jan 2026 15:30:41 +0530
Message-Id: <20260114100043.1310164-2-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260114100043.1310164-1-tessolveupstream@gmail.com>
References: <20260114100043.1310164-1-tessolveupstream@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add binding support for the Qualcomm Technologies, Inc. Talos EVK
SMARC platform based on the QCS615 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 4eb0a7a9ee4a..c081746636d1 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -876,6 +876,7 @@ properties:
       - items:
           - enum:
               - qcom,qcs615-ride
+              - qcom,talos-evk
           - const: qcom,qcs615
           - const: qcom,sm6150
 
-- 
2.34.1


