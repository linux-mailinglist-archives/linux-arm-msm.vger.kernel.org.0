Return-Path: <linux-arm-msm+bounces-2058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4687F9E2C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 12:11:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9BA22811FA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 11:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C588C18E0A;
	Mon, 27 Nov 2023 11:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P0qPLrQC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DC1E113
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 03:11:06 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-54afdbdb7d2so3599254a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 03:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701083464; x=1701688264; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aWIIj+kvMy4kZX5d0cpQ2c41mKIu3M1tMd1Zqq8If4M=;
        b=P0qPLrQChRjPwk0jDlfWWHntaedfqnRP44hGX0tzwQ2YYpX0ElcdpMjQHP9/Q+9CqE
         8dd5DTnepnlMb12tR5NN14pa6WUIF6xtDD9StblwWq0TZc/vui/bB96gZ/poKXmT1nTu
         tYQsQCUAyu5FayqROS4/lV1OroonVLR57GHaDPeFjuEbQpuNreXMBmNuvreJgXipYaCl
         Rjtj+cwG2Phl0EoxipfL8nhVzNmHV/+XBYzfbyHFyFXyhdyZArjnEJWRhLcWasoJkVta
         gHHUyUrjXfLhxTh1MMtCBZNf/jel80mFUnDkZ66oHvXlFx9kesZ9+2sUD7xDl3wF73eV
         k9vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701083464; x=1701688264;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aWIIj+kvMy4kZX5d0cpQ2c41mKIu3M1tMd1Zqq8If4M=;
        b=M44Tp9oQFFeLO3n0YFtCx/619ODJLrJV4II30vF8kPtnuterq11l0CiUBZ312bUxIt
         xS79bsThTMw9NFz4W4bFBK/neYOpt3LuYwPFTDLVGCT0liTDa8cjhKlNGqUKTPmPES2/
         yNRvIj+1vDsDdmKA855gow6vJAgexLhSWUrqJJxC6RzDIIBJpQ6Gu2BewG3CMtO6jsGO
         B9sbBZ6DvIljVDyINVdJl2ucXu0sONuwG+Xju0tlB6S4tnohZoZwq0kqr6IvxL5U1JJv
         wI+XGvxjPHQa84gZbEtfnV8FQPkY0+6KZLPeYN0UFYlWrGrI55VVdcgFz4bzBLNadi/r
         BXfA==
X-Gm-Message-State: AOJu0YwbbhAWuep2TUYc7o/vPceXs5TpSlgUEYgiM+rK9AO+E7wJEAxO
	jNZ8ggtqzROz7SE2enBpuuOUbw==
X-Google-Smtp-Source: AGHT+IG3CEZbOjnyg3S3/SHsocbkM+WWXlxkYAiY7U4XFuHw4QdaJTyPvJ1fajsn0I7iYexaJtwE2A==
X-Received: by 2002:a17:906:209e:b0:a0a:f9af:c159 with SMTP id 30-20020a170906209e00b00a0af9afc159mr6033015ejq.25.1701083464551;
        Mon, 27 Nov 2023 03:11:04 -0800 (PST)
Received: from [10.167.154.1] (178235187180.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.180])
        by smtp.gmail.com with ESMTPSA id n27-20020a170906089b00b009fe0902961bsm5537329eje.23.2023.11.27.03.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 03:11:04 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v2 0/2] SM6115 interconnect
Date: Mon, 27 Nov 2023 12:10:58 +0100
Message-Id: <20231125-topic-6115icc-v2-0-69d05d90871b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEJ5ZGUC/3WNywqDMBBFf0Vm3SlOSnx05X8UF3Ga6IAkklhpE
 f+9qfsuz4F7zw7JRrEJ7sUO0W6SJPgM6lIAT8aPFuWZGVSpbkRK4xoWYayItDCjoaZ2um1a42r
 Im8Eki0M0nqe88q95znKJ1sn7jDz6zJOkNcTP2dzoZ//db4QlOqOJy0HrittuFm9iuIY4Qn8cx
 xfdFCiMwAAAAA==
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Georgi Djakov <djakov@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701083462; l=1377;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=KDSOgOJZ9OKDivLFVaAgoa4LgcSMlJhCVgjjK2+bl7s=;
 b=8kGfGfFvWPhFWeVdYOYNJHM+n5qjYW3NtvraF/dOYqRWNPyV/6xu+2xjJmt4MAytbgsKuA43W
 zQbCVYwqlC1DDp9vBTCbw7l30rV7oMdjVcQcvOT0iNW1d9TcX5KXKnh
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

As it says on the can.

Georgi, Bjorn, can we please set up an immutable branch with the bindings?

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Changes in v2:
bindings:
- Remove unnecessary '|' after description:
- sort property definitions in a manner that resembles their proper ordering
- define clock{s/-names} before using them in conditional blocks
- drop unnecessary allOf:
- move unevaluatedProperties after the conditional blocks
- disallow clock{s,-names} when unnecessary
- fix up the example
C:
- Apply my own fixup (ebi channel configuration)
- Link to v1: https://lore.kernel.org/r/20231125-topic-6115icc-v1-0-fa51c0b556c9@linaro.org

---
Konrad Dybcio (2):
      dt-bindings: interconnect: Add Qualcomm SM6115 NoC
      interconnect: qcom: Add SM6115 interconnect provider driver

 .../bindings/interconnect/qcom,sm6115.yaml         |  148 ++
 drivers/interconnect/qcom/Kconfig                  |    9 +
 drivers/interconnect/qcom/Makefile                 |    2 +
 drivers/interconnect/qcom/sm6115.c                 | 1427 ++++++++++++++++++++
 include/dt-bindings/interconnect/qcom,sm6115.h     |  111 ++
 5 files changed, 1697 insertions(+)
---
base-commit: 48bbaf8b793e0770798519f8ee1ea2908ff0943a
change-id: 20231125-topic-6115icc-a187f5989af7

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>


