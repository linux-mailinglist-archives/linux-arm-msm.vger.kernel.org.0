Return-Path: <linux-arm-msm+bounces-19831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 662858C5688
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2024 15:09:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C02F1F22645
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2024 13:09:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8BD91411D8;
	Tue, 14 May 2024 13:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j21QyHbX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E619413FD8D
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 May 2024 13:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715692130; cv=none; b=LNdt0FSwKFkfb3XPZKCJdkXr0tDdfvhbcwV6Gunrhjg3KFUPIIxvOdQmYNIE/cG/ywvOjiaEU62Tjw6aXxzF1NNR5QiLuXQlnlro2Z1fCxQLbVrefsiGUcY2Fs9AjMRAG6tz2lH3i63aeA7W/ux8Y9dtE6/rc7gCQMGvdaxTUV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715692130; c=relaxed/simple;
	bh=ZcblkuDSMv7tvtn/vseBea9lWN9fs5R+BIKAqQHnsjM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QlIBVCQf/6VLcMWcXxipCdLc4dGBsYljqnfcquL7/2hfUc2DX117bX3q5dFJjG9DpO8Ib4l8UOYExhhcrcuBcfgyo9NK0gltpmSGNKhbKYrgPcymC9LSJPzqQ9oSJMFssIXsXz75G1bSiPNXudgKeG57uwNpiDQkiDBh3PzE1Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j21QyHbX; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a59ab4f60a6so5873066b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 May 2024 06:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715692126; x=1716296926; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zeT6KnLVfhQXaqC3Lu4DkuZNlc4YLw9XtuNUDZ2X/BE=;
        b=j21QyHbXXZCSqc50bIZmrSoW8YkiXvRWX4oxNyXkFDVYImoS99hwMNKXNR1GQyFAOd
         P9O39C8Oc5kPYNgTrh0IhUfP33lzlNmtQeMPkaZ0kVxhQ8YLGf3k1vxOxO7THJ59wJJ+
         c2UyZNaVhpexrk+uP3a750SWDLTTFqvSFIod1Zr+Xl9+JNj5ZpYomptYLB1nvOM2qpm+
         rbW330r5k/YTzOyc1eY+pTDF8ixavbkb0Bp+P8gQd2oyVS/YOFRvK7lBsbGcNk3vJcC/
         Lp2xR8Qkqy0WPN/ZcdItUZpNHbJVlD6542iUjrorQTDTebVTAYSawCYm0jXfP/q90/px
         W+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715692126; x=1716296926;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zeT6KnLVfhQXaqC3Lu4DkuZNlc4YLw9XtuNUDZ2X/BE=;
        b=ndHSrb3nhKfEFBP97FZ/UewbzCIan7fyagjAt0+I3DZujYOFhSOmaNIpJ6xxCCVwxs
         nYa7r0l+L2uOsae9+6u9yCYJGqB0AglqeA1VNDvxoMrmYOrhmxG7JFhbp35Caa8UagHH
         h1P/zWPIip1ivN3jsGk6jFYVq+pgYGI8Ui81UlYI6HoctaQYZ8me7J9Fcfhy7Ei4i63C
         InWWV3J6ySFc3/rfxERox5BWnOTHfBlG9ImNbbqlS72/Z+sUOPIM0BY3mk1a9iDuyGPj
         dQFkCVCDyGeS8NtuMOmFp9KM/LCBhH8FbNBHDmiWo0M+yWIdqntjLbKZBMWE46Np+jOl
         dDiA==
X-Gm-Message-State: AOJu0YwxdkB9v7eIEoeYHmwI81rFHKAciZ1i8QT4ARYn/VhcDf3ml7FR
	LdNXH5Yj06V7lSycBiHoPUNKntxD/dCmW0OMyG0rzG75OuNhsiMCCfnnyENRQA==
X-Google-Smtp-Source: AGHT+IEyW5wWXcI0YcuMfRPEURlz7RUMcwyj0jHYGuOT5hpqOwAsP8E1/EwXva+mlyTkLrd58nrF6A==
X-Received: by 2002:a17:906:fe07:b0:a5a:81b0:a6a9 with SMTP id a640c23a62f3a-a5a81b0a73cmr290104466b.53.1715692126068;
        Tue, 14 May 2024 06:08:46 -0700 (PDT)
Received: from [127.0.1.1] ([149.14.240.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a1781cf91sm719572466b.1.2024.05.14.06.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 06:08:45 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/2] arm64: dts: qcom: Use 'ufshc' as the node name for UFS
 controller nodes
Date: Tue, 14 May 2024 15:08:39 +0200
Message-Id: <20240514-ufs-nodename-fix-v1-0-4c55483ac401@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFdiQ2YC/x2MQQqAIBAAvyJ7bsFMi/pKdDDbag9ZKEUg/j3pO
 AMzCSIFpgiDSBDo4cinL1BXAtxu/UbIS2FQUmlpao33GtGfC3l7EK78opZtp2Zn+sYaKNkVqOh
 /OU45fwYcUmZiAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
 Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
 cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1214;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=ZcblkuDSMv7tvtn/vseBea9lWN9fs5R+BIKAqQHnsjM=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmQ2JcaJ9euCKId9vPpWsFIdRS2FdM2R5vL6pDl
 fZWwIiROd2JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZkNiXAAKCRBVnxHm/pHO
 9edqCACDqoqsYSw6t2XP/npVZcwSA/XSunW2FkD4mEAfxYKrhfV3MRmsTne0zbB8MSwnmO2r/YJ
 bf4ZgALL1+P8RkSSRRNQ+0Ly7z08Jb435scJlJVskteLH+clh5Z4CCVxrUFXMhKLOCERZyMJhJB
 ww2GNgy15M0ewcoqe78aMj9zM0Rc0aA12NlXs643WJG16wH4Fyi62fiDW/D89seZut7pG64Vfhv
 97fdlqGmup6lNtv44Vfe1g1wK75VpWHTdVKh3bZlor9Ou9oMgEFTYz02/HXKsn637qoM2Jrn6vG
 IKG7v4vL/N60ZvTXWG5BGrGWz5aR5t8l1gN/1QFjMkkHA5AB
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

Devicetree binding has documented the node name for UFS controllers as
'ufshc'. So let's use it instead of 'ufs' which is for the UFS devices.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
Manivannan Sadhasivam (2):
      dt-bindings: ufs: qcom: Use 'ufshc' as the node name for UFS controller nodes
      arm64: dts: qcom: Use 'ufshc' as the node name for UFS controller nodes

 Documentation/devicetree/bindings/ufs/qcom,ufs.yaml | 2 +-
 arch/arm64/boot/dts/qcom/sa8775p.dtsi               | 2 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi                | 2 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi              | 4 ++--
 arch/arm64/boot/dts/qcom/sm6115.dtsi                | 2 +-
 arch/arm64/boot/dts/qcom/sm6125.dtsi                | 2 +-
 arch/arm64/boot/dts/qcom/sm6350.dtsi                | 2 +-
 arch/arm64/boot/dts/qcom/sm8550.dtsi                | 2 +-
 arch/arm64/boot/dts/qcom/sm8650.dtsi                | 2 +-
 9 files changed, 10 insertions(+), 10 deletions(-)
---
base-commit: 4cece764965020c22cff7665b18a012006359095
change-id: 20240514-ufs-nodename-fix-40672bc593a5

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>


