Return-Path: <linux-arm-msm+bounces-62183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3624AAE6110
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 11:43:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D2B7405FD6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 09:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42F4027CCEE;
	Tue, 24 Jun 2025 09:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ls0A3AVw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C9227A445
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 09:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750758189; cv=none; b=T9kN1T/14yNkn9Kspyr73YdhwQw4pDSAojzu7WuOd1VS4BmkKVDLcSHGeQvALtp7PbvQCywH7wTFp38OB3smLrn0GveMticmhxR+peG9L3yGDGOAIbA2ceJHHSxnwA8zs4riKW7jx0KbpLe5C9ds/D/Rs9hbspy060AA3EuZpP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750758189; c=relaxed/simple;
	bh=cEp7hjd1e8KgRphjljUL2aNAJeprKGSm7bQ14ArLUcs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gge+4wTrXN64XoKRTGO0PmNaMYbpyx0Ml5qLhNr+rQAdp6Zj/kdap49M39+8/WWqwdqP1i47TqbyrfYi8X8E2VPY8pFIuJN2ltWQU4l4k4IC3Qlh38gcDmyMgtGNQxSJYCB8gO/29VVIT/31sc71DeKcg48uxqUOqm/pT8Y4P1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ls0A3AVw; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-553bd56011dso483577e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 02:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750758185; x=1751362985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+OVGMEcWakyku48EvkGswOj50aOc6hGiF/Qrl6mN7bs=;
        b=ls0A3AVw/fmUkp0Jcr8/LLS/W+QDemiWpnLF8C6GCVVMPBlG4NylTlldBOvMfk3xpV
         vnWoSFPMBz3AmgW82SOMZV7d8VW7QlGvqCZ/Pje8SWOI09KL/RW5cfIbWK5abwFx2Zny
         FVZzylN5G/k0p2AfqUb1CPEtSiu7ubd5kW0Pj3Qu4pQHhQiVmdT1O17WJFwYQjpzayfb
         OKTMgAEreqJ/sW9oWqD6QYp+f/nhQ2oiJ6US8a9KkHo6UfcpnLAbBSPe6Tki7CM8DH9l
         cA4jPD+bfpCFUIEYHPX7UYTmwVEzra1kYxA700AVRvxseKYzxjAk23ZDRbtjT7IwSv4e
         wi/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750758185; x=1751362985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+OVGMEcWakyku48EvkGswOj50aOc6hGiF/Qrl6mN7bs=;
        b=nzMlKVaHIOiCAAPKYtMouOIqx0begRpUte2V3MprtBd4/xRb+/b5O9ZodfTo5T0avV
         v/TXMjE9/dbA0QOXaJh7X0NHGO2RAvSwfXOh52E951zitl/P4b2e4T+1obM3t/Svp28p
         SGHcPRBsQAtWiyARdKjdP+CJS3KxblvB/3tP9hC4TjRfawpF2sVPOcsJu0DS7SP6rhVY
         /+bTE9aDaBRvWyd5d9SZ9mfxPhATfDO/6f73U5rwqZ20d4jmoSJE+W793fGYx8OtjB4A
         Fp/iVczxlGxuTX8l3JU1TysTtUMOzY8tyUBX1dvJiqKkbdcrGpkhidcAHRw87YoK2v4M
         BiRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhvJidE7znB6+k9394z3sqTdcMl66q/5eUwsja2FTx554DmriQUlyDlQA/CdAB1csNbXQCZZ2oQpRfdJi9@vger.kernel.org
X-Gm-Message-State: AOJu0YwsDg0MJinSomHy2eieX0OWm0yuhwCHIdV6fVoScM4nHKWaT7L/
	RXdrYd7yYa7TfqCysjuAXiIpcDTGptBiFOix/4dh+ruzD2DjSRuARcOaqzSHxEgaGO0=
X-Gm-Gg: ASbGncuKm+ZsyIU/EoZ42OpCELcNVr0yJMQNzOAF6ebcI+kch2x8BdRHc/1tgTwuOdx
	hImaUMR2iOTdqs6Bm+n0p0h8bn/k0LeuuEZ+SrMNrGorAcdVXej1QkXW7sVppFs4RPXUpLufd6j
	QlR5p0ugUnwlKOwCVkCnMwUuxBUUiKf2N1IGlTlysZRuMVfRSg0MJkiSDOuqTKBL+AekHwmSeD+
	8gOawo8X8I8PV1VUi6eO3k2/qmhc4i2zvoKV6gJnXNLiPn9ChVwApCrQJL9uD0A3D2yofM5Aet6
	1iDoULN9vHBYWBuC+n89jdW8KFxfM4drVeo+fwehXZ105/8cIKs+aSJIBiS0DEgMDMfD2f48KcN
	0Q9Q5sM7tT1uKqKH36mDgxfgHhRUKyZZvPtxzwTpwZQYvgOX8SPDWpXfIzG1m4g==
X-Google-Smtp-Source: AGHT+IHqHk/ZZiXZXbbBTWH8Qo4NZMBX4Q7wBzawrxlzRhgx3lwoLvBJe49A4I60+IIrUDNd5L1hQA==
X-Received: by 2002:a05:6512:1450:10b0:554:f76a:bab8 with SMTP id 2adb3069b0e04-554f76af686mr101315e87.15.1750758184729;
        Tue, 24 Jun 2025 02:43:04 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e414445asm1745793e87.12.2025.06.24.02.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 02:43:04 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: media: qcom,x1e80100-camss: Sort interconnects alphabetically
Date: Tue, 24 Jun 2025 12:42:52 +0300
Message-ID: <20250624094253.57441-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250624094253.57441-1-vladimir.zapolskiy@linaro.org>
References: <20250624094253.57441-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sort the entries of interconnect and interconnect-names lists in the
alphabetical order of values in the latter property.

This is a DT ABI change, however it is supposed to be acceptable,
because there are no users of this device tree binding in the upstream.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../devicetree/bindings/media/qcom,x1e80100-camss.yaml | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index 113565cf2a99..b18c7d1794ed 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -100,8 +100,8 @@ properties:
     items:
       - const: ahb
       - const: hf_mnoc
-      - const: sf_mnoc
       - const: sf_icp_mnoc
+      - const: sf_mnoc
 
   iommus:
     maxItems: 8
@@ -320,15 +320,15 @@ examples:
                              &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
                             <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
                              &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
-                            <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
-                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
                             <&mmss_noc MASTER_CAMNOC_ICP QCOM_ICC_TAG_ALWAYS
+                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+                            <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
                              &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 
             interconnect-names = "ahb",
                                  "hf_mnoc",
-                                 "sf_mnoc",
-                                 "sf_icp_mnoc";
+                                 "sf_icp_mnoc",
+                                 "sf_mnoc";
 
             iommus = <&apps_smmu 0x800 0x60>,
                      <&apps_smmu 0x860 0x60>,
-- 
2.49.0


