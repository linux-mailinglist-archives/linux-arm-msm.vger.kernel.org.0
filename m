Return-Path: <linux-arm-msm+bounces-6380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 403CD822EAD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jan 2024 14:40:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D030B285855
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jan 2024 13:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 752AE1CAA9;
	Wed,  3 Jan 2024 13:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QGcMzbmU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BD51C6B9
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jan 2024 13:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a235eb41251so1177969166b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jan 2024 05:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704289033; x=1704893833; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ls2aUMbVxdc/7lozE+p30ZeM7lcweE8oneLXZx5wYg=;
        b=QGcMzbmUacsSd58oRUd4e21k/4GGq4MGKovvAHEw+pT6UmmgXuzd9Qpr2A74YoCfxE
         MB4pEQY22AYJzi0xHPqlgmJrZvBMG0d97fhlgjnOD0dLK5fVYNlZ3gjvQClKbslmJBB/
         QlIuogEl0vzAgMXW9sY7mGmXK0rzi0xpcM+0De4M0JbIMQ3jHCHzIRcVZXhP1sIarbo4
         RArVFBEQOPfbAZ8QbjD9exYj62Off0dIWbvIXXYexa+IIrIIi2MPHVGyXgrCI96H0iG8
         neQKKzsBbhPM1SpLGTKxrd92Xon0HUdfqZ+J2gKVeF67XObkTJHNDRgvl29cXNtY+Tuq
         pbNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704289033; x=1704893833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ls2aUMbVxdc/7lozE+p30ZeM7lcweE8oneLXZx5wYg=;
        b=fijjrEHryeApiOuLj138uKKJsd+bu0U3bLvyQoacETgvaz67P0kGpzbNnrOXYbukTF
         SpilW7Ox+A0A6y17qsE6YgEU+Gd0VWc8DTEBL1Njdw5aGQQDKe2vY7YuGpp5+xtLgL/K
         3/YAFL/QbNFXaoOB7bivUGFf7kpV9p1o1n/po2pIJfRsZuPKvLV88YJdQ5IOQFBpiWO4
         FnB/zcNmkK0cOlz+y2VyjY9/nzfczdHPmfWoUvh1ujVKCZgMmSmNB+ILHYOnMYZP4+eE
         PYkMBfTjw0+27Rjukk0QYB6DdbfI5ttpyZJcZ7Qhy4bPf9tHOIqEVekq0O4kg4mYbmRu
         iAEw==
X-Gm-Message-State: AOJu0Yy2zCAfW7pFmFcr3x4U1/VBiYoB55i8q42fb8WeRAQJQa0onM9t
	0gKFo6QT9dtbTE0MA2gCD37lIkuPf+fk7w==
X-Google-Smtp-Source: AGHT+IGpnAm1YkMHGNwPzJ3DRXklifvsksvW4hhRlQoW6RG52YHgNlPC2VFhLZd8F74ypE9UZEQs7Q==
X-Received: by 2002:a17:906:73d9:b0:a28:6e42:6798 with SMTP id n25-20020a17090673d900b00a286e426798mr597344ejl.61.1704289033363;
        Wed, 03 Jan 2024 05:37:13 -0800 (PST)
Received: from [10.167.154.1] (178235179036.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.36])
        by smtp.gmail.com with ESMTPSA id cl2-20020a170906c4c200b00a275637e699sm6474351ejb.166.2024.01.03.05.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 05:37:13 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 03 Jan 2024 14:36:07 +0100
Subject: [PATCH v5 09/12] arm64: dts: qcom: sm6375: Add VDD_CX to GCC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230717-topic-branch_aon_cleanup-v5-9-99942e6bf1ba@linaro.org>
References: <20230717-topic-branch_aon_cleanup-v5-0-99942e6bf1ba@linaro.org>
In-Reply-To: <20230717-topic-branch_aon_cleanup-v5-0-99942e6bf1ba@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704289018; l=718;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Gc/yH23ZENvzGFFViZ7/qVCV3FeiRMp+LehbPO3k6Xw=;
 b=Qe9/JEGcMm7CuZ8EE8ZjuJT/aV+Qlb+RHQliiaxESf2QmZB6YF37XfLxBq9aEGe+/FuC7R6I8
 iJrXxfeKBTCA5pb2Gm8v0iEeVa9zxxRgRuxcAGZKOoPdvEBQQsHgnuy
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

The GCC block is mainly powered by VDD_CX. Describe that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6375.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6375.dtsi b/arch/arm64/boot/dts/qcom/sm6375.dtsi
index 7ac8bf26dda3..f578d110f36b 100644
--- a/arch/arm64/boot/dts/qcom/sm6375.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6375.dtsi
@@ -954,6 +954,7 @@ gcc: clock-controller@1400000 {
 			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
 				 <&rpmcc RPM_SMD_XO_A_CLK_SRC>,
 				 <&sleep_clk>;
+			power-domains = <&rpmpd SM6375_VDDCX>;
 			#power-domain-cells = <1>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;

-- 
2.43.0


