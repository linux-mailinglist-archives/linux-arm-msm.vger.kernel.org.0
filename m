Return-Path: <linux-arm-msm+bounces-6269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 243238220FB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jan 2024 19:30:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCC201F23307
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jan 2024 18:30:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CC9C156EA;
	Tue,  2 Jan 2024 18:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TXZ58djF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B21D282
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jan 2024 18:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a275b3a1167so496978766b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jan 2024 10:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704220206; x=1704825006; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wrmBZACBBkgQtz1wQzBg7mU9m8qYCsgsxMH5h6qIB00=;
        b=TXZ58djFyjfXlGHRpN5wmujv/V8nrMkt5eGF4LjGMZNZutff5n+CEThH6vWlDUmSSs
         2hf8fnZD+g8MzXbMUbSq6lnjyGFAtS003DLcNaBasptwQqXF4UZXA/u5YYXo8+K7eB3s
         x1vsCgjFi21QyeCWacSK0LhFaYlToD9i35Oy9nZ0Cd02n2GiN39uqYrHTBj1Qk/GUn4o
         wHyaJ5yXTP7+SAlWdR368AxlpawmAP/BIP9+PsY5DmXbYiMolAnp0Yn8y9xDzT+SHqpn
         diIc4kQ5GaPxgAEIclSPy89GudJxQwYqj339ZcS620uoRZ1XeBV2+UwzmsstjirKy2Ae
         HacA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704220206; x=1704825006;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wrmBZACBBkgQtz1wQzBg7mU9m8qYCsgsxMH5h6qIB00=;
        b=JVlCywZxZFECHxMWdj7iYHbkVot3XYECIqFiXGuLu4m/2GrdXds4gffY2lDIu8n8wS
         Gh0SAUBIRxyFIYWKLB1n0GgIlFrvdNn7dcVno1XQOP3YovBn2EY2gWF7+fYTgds1HQyt
         stl9et02o/P8DcSP8kHQYElHbVv8G31hmZ+CG5F7r0Y89w479+dzBaZUU52ygcAT68zf
         ieowJ1LeZl0Q3ZjXuBL16qXeaV7EecDHVbFaiDRXt5knQDJC5m+0C0AxIjeXy9Q/Bog9
         596tgiFOHKVXK/AgZ/CtJJSehMXURv20pKOcfJV5NQ3gFCFZ8lNNIcQkOSFzPtF8mx1S
         k7EA==
X-Gm-Message-State: AOJu0Yx3wiMn6qv8byWHV1zcjOiYkt3NX2c5h9rfqb3DCtQOOC2l9/PK
	JxN+OHScfnc8FbvuGKp6ljNf7ZLwvmQ/zw==
X-Google-Smtp-Source: AGHT+IG9IvUpGldKB4PaNtlMH7wBLVfuild8l90gv+1TvAK/xA0LqNk+HVAOCRIu2yA1EOjBv6+nSQ==
X-Received: by 2002:a17:906:10dc:b0:a27:45a7:1b39 with SMTP id v28-20020a17090610dc00b00a2745a71b39mr5629778ejv.35.1704220206057;
        Tue, 02 Jan 2024 10:30:06 -0800 (PST)
Received: from [10.167.154.1] (178235179036.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.36])
        by smtp.gmail.com with ESMTPSA id et10-20020a170907294a00b00a2699a54888sm11968835ejc.64.2024.01.02.10.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 10:30:04 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/4] X Elite fixups
Date: Tue, 02 Jan 2024 19:29:46 +0100
Message-Id: <20240102-topic-x1e_fixes-v1-0-70723e08d5f6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABpWlGUC/x2L0QqDMAwAf0XybKAt6sZ+ZchIa9SAVGmcCOK/L
 +zxjrsLlIuwwqu6oPAhKms28HUFaaY8McpgDMGFxnkXcF83SXh6/oxysiJ1YXiOLfn4aMGuSMo
 YC+U025e/y2JyK/yvzbz7+/4BKbcZxnYAAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Georgi Djakov <djakov@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Sibi Sankar <quic_sibis@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704220203; l=906;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=ujsRm5mcuT51iwbkbeM9ZXk2gxBgeFkoemJbUcYdSDg=;
 b=6OenUz16unWK/pE/hAVmesAzNt+Wh8TGFZFgu0ZUGY+6k4twaIlYIRD0jPxJikYp4kyOk4Yjk
 /j9YFBPv/mxB9/CngICqybERI0UKiyeyUVWkcrJZhEhnqRnbYK06CMP
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Just a couple of "usual" fixups that slipped through introduction
reviews..

p1-2 for icc
p3-4 for qcom

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (4):
      interconnect: qcom: x1e80100: Remove bogus per-RSC BCMs and nodes
      dt-bindings: interconnect: Remove bogus interconnect nodes
      arm64: dts: qcom: x1e80100: Add missing system-wide PSCI power domain
      arm64: dts: qcom: x1e80100: Flush RSC sleep & wake votes

 arch/arm64/boot/dts/qcom/x1e80100.dtsi             |   9 +
 drivers/interconnect/qcom/x1e80100.c               | 315 ---------------------
 .../dt-bindings/interconnect/qcom,x1e80100-rpmh.h  |  24 --
 3 files changed, 9 insertions(+), 339 deletions(-)
---
base-commit: ab0b3e6ef50d305278b1971891cf1d82ab050b35
change-id: 20240102-topic-x1e_fixes-a62d8f5a1b75

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>


