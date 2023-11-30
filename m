Return-Path: <linux-arm-msm+bounces-2722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C0E7FF302
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 15:58:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E590EB20B6A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 14:58:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FD7048CFB;
	Thu, 30 Nov 2023 14:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y4NApfZW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 107361B4
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Nov 2023 06:58:26 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a00cbb83c80so150738166b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Nov 2023 06:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701356304; x=1701961104; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2gKqlKiSO7Qz+6qp1ezAI25UfE5cdt5rvX+Xa1fyEdA=;
        b=Y4NApfZWj8Kr9Gj3KL9lcrwCRSjpxrsYugTCKk+HJCxwiF4S2qy6c0DgOZVVkvjewj
         7NVffLOaiG4we5q8cuzeA9vIabuoZ7KfMeF2Fmpu3GqU9xGFpPSQNV7tQXwP2K/MPUgP
         GiG3JF9ETiFyUQ0X4nwc4t778Qvg2/vh/zC/h0Kvsk46HFnXmqPZtAE8Lfx6Nw6Z1Y3o
         ZGaG+HYkynAuu9smBvUV3dn0CYZxU1saxnfDh4PTKnUTWDtZN+Gewg7hRGaD3eZemoVv
         FFZHvAHKsiUnXwYqb9hNpvEJr7Ts46Ert4E0Fk1VV/UTYokRdn9MpalcG3Ni4rtsDUn9
         xFAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701356304; x=1701961104;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2gKqlKiSO7Qz+6qp1ezAI25UfE5cdt5rvX+Xa1fyEdA=;
        b=p519oZbUM19isn5p3PuqqIAityU/kD/yR04i5pzm2zERicXFD7ujr0nvOMphJeHi2X
         a5wYwBAOn6VQuL0znX2G5nmvUQsGaxqLcIigWbLUmPEDVjSC+WgO7sdeKVrhVK4WYrl4
         OxSokUCLK26V+fTm5MxFgz14cJdg+kgaSh+NIiomoGTuUt5NSucw2QJ1hCGQ4e6OqUQa
         DjUUwnoscnl5UZ37jN0WPlL4r6YDLqiUJeOJYX5cFyqF3VDegoLtrGZstkAvmyOCzbPz
         t2N5bI9smkmv3ahdhoPr4kVD2C7BqIqy8LdBfqP9qENdOjP5zNc7YKs2tpVGlt08hsNd
         C49Q==
X-Gm-Message-State: AOJu0YznrDFTGMqUyVMm19JEf7knTJ+THyYyfLY4Jm1ZXdEC3mD7iIaa
	xUBJnPZIFTL22iuDfhIrISsGxA==
X-Google-Smtp-Source: AGHT+IEQfDOXbwsdjoQNkI5eAvUtz1+czMU89lxuGPOn89Gw7WXdlS9O1DvthxMvbPCRRlhC3gEf7g==
X-Received: by 2002:a17:906:5299:b0:a00:8706:c82e with SMTP id c25-20020a170906529900b00a008706c82emr17109255ejm.18.1701356304549;
        Thu, 30 Nov 2023 06:58:24 -0800 (PST)
Received: from [10.167.154.1] (178235187166.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.166])
        by smtp.gmail.com with ESMTPSA id a5-20020a17090640c500b009e50ea0a05asm756753ejk.99.2023.11.30.06.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 06:58:24 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/3] Add DDR sleep stats
Date: Thu, 30 Nov 2023 15:58:20 +0100
Message-Id: <20231130-topic-ddr_sleep_stats-v1-0-5981c2e764b6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAyjaGUC/x2NWwrCMBAAr1L220AeINGriJQ0We1CSMNuKkLp3
 V38nIFhDhBkQoH7dADjh4S2puAuE+Q1tTcaKsrgrQ/OBWvG1imbUniWithnGWmIKbdrRI8+2hh
 A2yUJmoVTy6vWba9VZWd80fc/ezzP8wc8j49HfAAAAA==
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maulik Shah <quic_mkshah@quicinc.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701356302; l=866;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=CddnBWy6kyIHBoyHL4aoTyt3leaSKLaRXMq2BFoXf1k=;
 b=6rfxbRnAT2Y6gq53GyYzJQEVXxFTA+vKb7IWHYcqQavUajPt17o0lboWaJOTSVtwfCK30AAaW
 bRviUlE1wXzCmv3V0qx9VZnR6FlIV5DOMZJSoNyYcrbqNIc2vQpceyx
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

RPMh LPM stats are quite extensive, but we can extract even more data by
poking the AOSS QMP. This series adds DDR stats using this approach,
setting it up on 8280 as an example.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (3):
      dt-bindings: soc: qcom: stats: Add QMP handle
      soc: qcom: stats: Add DDR sleep stats
      arm64: dts: qcom: sc8280xp: Add QMP handle to RPMh stats

 .../devicetree/bindings/soc/qcom/qcom-stats.yaml   |  14 ++
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             |   1 +
 drivers/soc/qcom/qcom_stats.c                      | 186 ++++++++++++++++++++-
 3 files changed, 200 insertions(+), 1 deletion(-)
---
base-commit: 1f5c003694fab4b1ba6cbdcc417488b975c088d0
change-id: 20231130-topic-ddr_sleep_stats-d968e2e28083

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>


