Return-Path: <linux-arm-msm+bounces-84742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4AECAF2AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Dec 2025 08:39:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 76CEB3038952
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 07:38:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 189EF2874F5;
	Tue,  9 Dec 2025 07:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aOOfXS8b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757BE23A9AD
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 07:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765265888; cv=none; b=AgUbokQOzeo5DEUiGNvFVm1wJ23ueMjv4Nm2JFP+0cgoA52txgMkXywieeooR33OR8BSWmFgiU43OGYgloXQyCSxc5Fu4OLr/t5VmkYo3pkFJi802EmvTweTgH76qc0zLYc1zAnI2MmvyJVI0smWd0WCAVESM2vF14T2cCmTUQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765265888; c=relaxed/simple;
	bh=i6iv+/k0H1iHwTWNk9MPDK0nyfs+zIxL+xqyM7LBUn8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SUhuBFVPtTYcpT0eVIuFyI8zKSS6oXpbdBMBOvkM8kTt5o9EnSjGRnenhPdfn87rM3n5jzUet0puHXgxXunOXCubt0LlM93FmJbvfVw2kjtl5EFqN+t1ojiGiLcNSw7k32V1lJRlAKSyOuWbdD5H9qlbMEa8rH7spz9RwRPthEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aOOfXS8b; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4777771ed1aso43509495e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 23:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765265884; x=1765870684; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ubM7DtKQolV20PWUE0DzMy/AZ4ddJZu9bZoMzxGZj9M=;
        b=aOOfXS8bTdMabOfY9LD/VIyKx0mfhXAFlYXZ8ExVGm0ahNYhyLn5Xs8SIfMG3olH5j
         eTu7rj+AiEOc5cYB7Sv4xe/OlnMouUw86oFbIyHzWy3FzYY1nu5Rin0tvFr0Y+2KkZRg
         hfSDyMqW3y44M0vgBXtBMRnwcZiNmWGhW2OH23/0u8WoHHeDtXNDT9kTvNRZqu8/GEn9
         3Ujsqx7PvtPoR1qmwfe/2CcDOt5G+DTRglmMoLHBRNY6dwCvcCmG2Co5AtMnKYN7d8q+
         41KkKlp9uIt1p/PoEh+R8PM7VjEKhEi6jfzpSh1RUppnFd+l+Es3FjPAPocnkmTV28Dh
         Gfdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765265884; x=1765870684;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ubM7DtKQolV20PWUE0DzMy/AZ4ddJZu9bZoMzxGZj9M=;
        b=G1Yrsjx/nyw0k6Jln44c1Cx1s100VSwuJlgQMa7j5h1Rkkp26xa+jpWn/jvADgQ5xB
         EKY9+YOcNYzojwfJ2q5kBCUcqaUoBRe3rfDYIVocLL3ST1Eoe7UQu+erZ+xeRVPxBxIR
         2Vu4IHwOs28Wz26OWe3aV0mka5uk025Ph9vtIG4fWjRg+x0Bd1+bWbBdMmqUn5oQoLKd
         CpA1spxoXFYFH3GZe5thVn10MtSLMBrc4kQR2+ZmgI2cNmn1LPojoN+mMFd9y7O07+4B
         pFywSMzGlQN8M2dZaWhlrGVq6uZDwQ4ggRuMQNRlsa/nxg7V9zBNDCWpsfz4dnvtVnEx
         6IyQ==
X-Gm-Message-State: AOJu0Ywusjs0JtvEufmlL4awyMRXiz+Yu+5AeR6VOv0/HR8zk5W9Q6eY
	tQjTDp0IGBKgG46uMFB+8ZaZsKFR33udHWCac8qLzPMDiaGRDRqk7pgT9LfRZB+140U=
X-Gm-Gg: ASbGnctH0I69W3CqxTfWY2UBCObsxoLmMBDuURYdzDqkKZqOeBAy9ORigUzt67zWHSR
	h5rI3rSLpJrz4ekWBf1zmtqGg+bX6oyKzo4T7Jj7mn1G/5OLyY6xQMY9vAaB6uiW6EQ8I7uPLTr
	YlrfXTax5ssluKzK8gM5NMkBcZ5OzPUoy+GRK0/M4fI6iYnu2bZWczFMKWrJmrtVK4ojPShmtnI
	tCF+pDE+sfNHhNsYEzEB74l5UbK6Ll+kdeY7f9+6kGRyww/HXElfdSlPAAF5VR6bp0n/UCluigI
	DQy3yzZ8L/DGVHLwas2VwZCvNdi3l5RFllEMDvaK6fhib5ZLunEKFBGrtSTI7Y3E7iUUoMjogGP
	2b39fipkEqOg97vQDni8Mc4I4kKnlw9DWP1ZKXAIyBP3j3BsSfVRdqpzeRj95yEu1kmekQmm8Iz
	A4qL9Pl5d3FkBOHuWoyzg2svmJ2/nr
X-Google-Smtp-Source: AGHT+IH/1II9kYkFThs5pXMsaZ3wk9yNURgnyMlce9bcqgHgMJE5smvCc5VwZHN4nSiZHjzpm9BASg==
X-Received: by 2002:a05:600c:674a:b0:477:a3f9:fda5 with SMTP id 5b1f17b1804b1-47939df79c8mr96341395e9.9.1765265883729;
        Mon, 08 Dec 2025 23:38:03 -0800 (PST)
Received: from orion.home ([2a02:c7c:5e34:8000:c69d:7dc4:d0c1:9de5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a7d707702sm27851935e9.9.2025.12.08.23.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 23:38:03 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [RFT PATCH v3 0/2] Adsp fastrpc support for sm8750
Date: Tue, 09 Dec 2025 07:37:58 +0000
Message-Id: <20251209-sm8750-fastrpc-adsp-v3-0-ccfff49a8af9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANbRN2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIwNL3eJcC3NTA920xOKSooJk3cSU4gJdUyNDy9Q0yzTjxJQ0JaDOgqL
 UtMwKsKnRSkFuIUqxtbUAoB/br2oAAAA=
X-Change-ID: 20251209-sm8750-fastrpc-adsp-5219ef9f3adf
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>, 
 Ekansh Gupta <quic_ekangupt@quicinc.com>, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.2

Please test these changes therefore RFT tag. The fastrpc testing
application under linux doesn't work for me but I was told there
is a setup available somewhere in Qualcomm where this can be tested
(perhaps android?).

Changes from prev version:
- split patches into two: one adds mem node, second one
  adds fasrpc nodes.
- updated commit description.

Previous version:
https://lore.kernel.org/linux-arm-msm/20250805162041.47412-1-alexey.klimov@linaro.org/

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Alexey Klimov (2):
      arm64: dts: qcom: sm8750: add memory node for adsp fastrpc
      arm64: dts: qcom: sm8750: add ADSP fastrpc-compute-cb nodes

 arch/arm64/boot/dts/qcom/sm8750.dtsi | 69 ++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)
---
base-commit: c75caf76ed86bbc15a72808f48f8df1608a0886c
change-id: 20251209-sm8750-fastrpc-adsp-5219ef9f3adf

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>


