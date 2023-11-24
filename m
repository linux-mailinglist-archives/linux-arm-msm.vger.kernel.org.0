Return-Path: <linux-arm-msm+bounces-1883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5E77F7CC9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 19:18:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46773282058
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 18:18:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D48F039FF3;
	Fri, 24 Nov 2023 18:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fpvJBbKC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F1D31BD9
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Nov 2023 10:17:22 -0800 (PST)
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-7afff3ea94dso71322239f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Nov 2023 10:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700849842; x=1701454642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZLADupMmiOI/CuFkP9Hg2IYkHX7ypUPKgw9zZKAkI2A=;
        b=fpvJBbKCHlHCjgDxug3KzmpK54wUIavyxF/EenC9iU7ATUZI1Zd5FMaUNne1s+2GP5
         8SUuebjzGSeK66Mt6vbrGhWg1miFT84FjcCPzW16oO3bPhhZo7EQjycAePsUawRagCx4
         TMekY+kPnraeE0gxcA4m0rRVhLShUpfCLZDyN8kxXFqlq0P6A8FBW59eYIZvV9pgp+gL
         MtjwAItv+7iiC+5QfgsdQZSDq76llxohmD1LYH9E7hJGDq5kAWPAcku1MiSyutcwlsto
         RBS9xxcTIm5OsK/YoEZK8nHJkW8ZWhRWtlx1nHkp0i+lfymTdG/Or2TnTdTXmqkZq4uH
         kXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700849842; x=1701454642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZLADupMmiOI/CuFkP9Hg2IYkHX7ypUPKgw9zZKAkI2A=;
        b=qSCxQOuRwJ3Qi209xeP+YCeS8gpZQEtkcsSztIGAYbLY2r2rz63ctPfKbpwvRinxjT
         tN5TYvypxBxo+X8241wMqTLnu2EEpUQDzezQiu4ZEdqFhQa5KrMqWigQuFBxLG8shDX0
         H/b9/nf4KolRjHdfPcsy9JifmsMRROZpE+DqXDeOlteNYBHqNyBFSTtravRyhGOkULdn
         Xp+fT47GEWW+QFlptu705xc7ESF040zV840lBhF2e63t8nW+x3JLqEimr0aZkABDCNVm
         7FMqSUwb+ID2ibANyterAlZqX3JlSCyjA3e/J/MqOnOZ4Jk1gl6wiqoqzVHe2v5VnIB/
         nwUw==
X-Gm-Message-State: AOJu0YzeVlPcfRafXAvlvxhWXNcCsRirqSpeAWw6CL/NE3qscMXexqnv
	roIijWA5BHUvhNileaR8dSOhBfLLjK+QiBLEVUY=
X-Google-Smtp-Source: AGHT+IE8paLRQ1z+VbJS//0j9s8uSZfLnbn4pb5jVt8VW26qZ7k45wdDaW9nQ3lb5QTLl6q1IH2Alw==
X-Received: by 2002:a05:6602:3351:b0:7b0:2027:efda with SMTP id c17-20020a056602335100b007b02027efdamr4350310ioz.5.1700849841819;
        Fri, 24 Nov 2023 10:17:21 -0800 (PST)
Received: from localhost.localdomain (c-98-61-227-136.hsd1.mn.comcast.net. [98.61.227.136])
        by smtp.gmail.com with ESMTPSA id et21-20020a0566382a1500b004665cf3e94dsm937031jab.2.2023.11.24.10.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 10:17:21 -0800 (PST)
From: Alex Elder <elder@linaro.org>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konrad.dybcio@linaro.org,
	agross@kernel.org
Cc: mka@chromium.org,
	quic_cpratapa@quicinc.com,
	quic_avuyyuru@quicinc.com,
	quic_jponduru@quicinc.com,
	quic_subashab@quicinc.com,
	elder@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] arm64: dts: qcom: enable IPA on sm8550
Date: Fri, 24 Nov 2023 12:17:16 -0600
Message-Id: <20231124181718.915208-1-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the basic DTS information for supporting IPA on the Qualcomm
SM8550 SoC.  Enable IPA on the SM8550 QRD platform; GSI firmware is
loaded by the AP in this case.

					-Alex

Alex Elder (2):
  arm64: dts: qcom: sm8550: add IPA information
  arm64: dts: qcom: sm8550-qrd: enable IPA

 arch/arm64/boot/dts/qcom/sm8550-qrd.dts |  7 +++++
 arch/arm64/boot/dts/qcom/sm8550.dtsi    | 39 +++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

-- 
2.34.1

