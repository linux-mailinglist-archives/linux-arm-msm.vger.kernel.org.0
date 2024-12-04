Return-Path: <linux-arm-msm+bounces-40210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B319E3808
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 11:57:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65A72285CFA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 10:57:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B448F1B219D;
	Wed,  4 Dec 2024 10:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vu6mQD82"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8CE1B21A7
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Dec 2024 10:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733309821; cv=none; b=ei5fgBn0bToMVHObO0IdcPSyiEap74wkdKp7q4pp7RnPe2e38DuegZBAxf9JwweptXwrBV+8Vy0+w9Mk0mO1LMwVvrSj/aSn9mAxmSJcipHWcsU2iYNHjHOOyffnTsCXmNpeBT/83JEO8kEZdvQjRGLPKTYH9fTcZgLTtOF4YMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733309821; c=relaxed/simple;
	bh=9zCQPGWbbtOrQGItKo94zlUyzqF3jXY/VuyEQsqsAGY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=maaZsEeHwl9gWwvMCgWIvpU5q4DGJAFtkswiKYa5BKwVRbazESE++AZNJZfLn72TFCSXoViMsnBUYm0OX8ss/g5eWE9yW36euM8NboPRbdNIIYKjo67Zj0LzzEhljLKYNmynhr6hT47aHMFtzJdlThqS5bf3Z70oXh/HO+RJ8iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vu6mQD82; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-385e3621518so3513733f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Dec 2024 02:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733309818; x=1733914618; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZUW2XCyWmw1iPCgZkGbC0FKwKSs27Riura8jo764vG0=;
        b=Vu6mQD82P2aP8hZuVqXl4kjNqxzMW3xqoNGAtCHZr0N4KPsJDkwS5Z88GA/L46ReC1
         lyIq7F2Ups7s0uk2nF3uTMyfMkhJucpPIloyMr+LykDYDTtwo70xxEFszvT5aW5pFQjG
         w0Ab2YROXPQRmG9No63Am+dbrOLFyFOKnN3KqyEecEptGZkRwjOovxWj6dM9YBNpUSVM
         Bdf1fuF3bD8chBBrfMzrJmruMlpYMVYwUPDpNj1vex8aBidO29DB4s7D+ZJJEZRNmkdI
         fF9IIRNwBcswnHLU4bJBEpADzHdKyebM5IyHozGVPHLS/WkHAy0fJNAjtKjLBjmj5U/j
         Uhig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733309818; x=1733914618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZUW2XCyWmw1iPCgZkGbC0FKwKSs27Riura8jo764vG0=;
        b=Tugzdh+qkXRNqNwhXGcSl2o8uVAdbmTkmmSuGdBlf86DBz16ISXYBNEmB8rKUUXb6j
         KW69/hJRzY4/ldczHAIpnGRW6cXkZjBb+FCpSdOIhpwi+S81nGrP1hYGCWsgewpWtKi6
         nc7RrAUZGm1qcmrjB8FdHhUKJK++2hyFv+QmNl8l6AU4nAAPI93Sh21X43GUZLGTLQ4S
         rHZ2GvJqwIO10B84Vx7JGXQeLkNfMsvPU+wzgfoEYFrrfqhyKPoxZ3ssBQjYBneNXOXn
         LjBG5vPTnhoB2uHEvt2Zi4cwlX7ZRbzM738aQefLCMasu/Ecgmg8pTUGZg4j0oAJ3lp3
         jfZA==
X-Gm-Message-State: AOJu0YwnDOulvQg683myFKjjUW1XMzCHEP56ZEnkeOYcxblM1i34eEgJ
	As2zejH4H/kUA05ySS+S0S12Okg57050xA5hCCHXAB/uA0lEJL1kEmOjVl1nOlkGwknnQZSXwqo
	oeo8=
X-Gm-Gg: ASbGncvxEOTXlS7H0LkoTWk+VBbYQQgeQbkFnBQbdzm/hXSQcPwTyMhTuYgKPzVnoVz
	Tx/2lJ6wJvqXu+LaPqL91PzzJHNhhbnv+RHiZarxJ6jdAIlWIkC0itmxA9nUjwJKWuV9rnQ495N
	YJFgI/kP9tu9K/xHi0MvMYtvZeph5QPGhd5/vqK/bQBw8q5yiVhNrqI048wHEzF4I3W1+NSRXRO
	D0+wUyv6Fjjjr2V4QpkdXFInqrZ1kyFcudMX0mn9OyPGS3GZm7/aNNgltT+9KQNrMcal6o=
X-Google-Smtp-Source: AGHT+IH0QQ0GaNidP9wzDojxgyKHpijAqkmxmojjF+pLnJ7cu6XoaMA2+6NRIYX1LdnwHBNlcMGCLA==
X-Received: by 2002:a5d:6d87:0:b0:385:fdc2:1808 with SMTP id ffacd0b85a97d-385fdc218dbmr5175425f8f.40.1733309818412;
        Wed, 04 Dec 2024 02:56:58 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd687c3sm18459063f8f.77.2024.12.04.02.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 02:56:58 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 04 Dec 2024 11:56:53 +0100
Subject: [PATCH 1/5] arm64: dts: qcom: qcm6490-shift-otter: remove invalid
 orientation-switch
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-topic-misc-dt-fixes-v1-1-6d320b6454e6@linaro.org>
References: <20241204-topic-misc-dt-fixes-v1-0-6d320b6454e6@linaro.org>
In-Reply-To: <20241204-topic-misc-dt-fixes-v1-0-6d320b6454e6@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=927;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=9zCQPGWbbtOrQGItKo94zlUyzqF3jXY/VuyEQsqsAGY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnUDV2u3sl+g9N2CFbmNHmFha1Xqq5cMJM7pL+c5nS
 lW760jmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ1A1dgAKCRB33NvayMhJ0f5hEA
 CpSSnsPnTiUzBNxexdPFhIsMLSOT3cHKpwA3W7ZyMuBwRRzQfS1/cn4jRtKlfZQSvoFRuRqn93Ig2Z
 NRXl0T3DTTeoXiC5/aCQvUPIKVfgaULvbMD7m03kzKbd01o3XDsPw27aD5QgSaBMOrFzhokCNiKMt4
 sRG2Pt1eAE7RcuAJmJMI2J1qK7A3uzcEL9WTsl9ljrAzLodgDYmJlI/z6eheqGYL4f1Cum5r55teyt
 FQdwVl8+CXeO/2ubIABrD3OdILtXMOJfujeAERXavCZmDsIIVsmX4Wc7an2U+pJuRaFQGyPXr8d3ax
 5LrNRYB+Stchzbm6ntJ4Up9s9v58jNOVFUe7dLfkfJnpm3ZenZDIKGONiIxYbPZ2f0zW4yh3j0EZLB
 pHzrs244F28Ra6By2jmTLKZP3JNSW/IPEN6teeDJ+p5+JgoTofFGJzu4tLRLH4zCZjaMc7mOM6viZn
 HmvuAsXVRDvCqrVm1IZ4/XW23DcqhnT+JXg8YhXCDE1uiv3w5fvSs9q9AiiKTo5FGKwolP1QFATa40
 /amghn3XKrpE7s0GKuSLlT8GnxpZNa2+a6Lb8DFPwmdV26TjeEEnHKHRX7leoUzQan9ypr8OJ2QhBe
 rjAxx6z9C3ZrgBJLs9WJcvWuAo5mray3YTMms+wXLlWEFLuQ+hkV9mu7VvBw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The orientation-switch property is not documented in the PHY bindings,
remove it.

This fixes:
qcm6490-shift-otter.dts: phy@88e3000: 'orientation-switch' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/phy/qcom,usb-snps-femto-v2.yaml#

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
index 4667e47a74bc5b0f01a53beb49993d238b13c4ea..75930f95769663f6ac3e2dd0c5f7d224085dda40 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
@@ -942,8 +942,6 @@ &usb_1_hsphy {
 
 	qcom,squelch-detector-bp = <(-2090)>;
 
-	orientation-switch;
-
 	status = "okay";
 };
 

-- 
2.34.1


