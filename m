Return-Path: <linux-arm-msm+bounces-9061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B76508429DE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 17:48:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71E71282F4C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 16:48:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D44521272AE;
	Tue, 30 Jan 2024 16:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BkrwOND5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BA4823AA
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 16:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706633303; cv=none; b=YkOQihnEuVYmAg1P/OIqA9LftfbGDMtEi64tiQDHjIx38RS84nZKguM2kTxnzjDlc8QMbLByDAOwi/SwJfZ3UUPIU7QDAVW81LpkAhkruAJLIEWaDaVLeSb0xGfEkjwPq+HYRlghzgkIRyLgXoA/gDCPopmAcTNqp0tWvJX3vVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706633303; c=relaxed/simple;
	bh=48Z3FDhWFsTEJ/wmhPTf0aZOApkiI5wL8H3cFuiRD2E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MLHg+cxATYO2EcmMBIfGqZYGSBEZnsyk2oB29D1Wz1X3mIUwruOH7fen96jlGkJ2K/otBiJkvAW9DOw/0c01O6umd0LaeLXfxx2VNLndYNMk/QrQ09shg4oM2Y+GcX6Tlyrx8QoIIy2IyB9WO3mVv0OoamkxCDmJu3KeljZ73Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BkrwOND5; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5111c9e48e8so1016240e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 08:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706633300; x=1707238100; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BkeKQOsWHdEZXYMWgkHXhBXL2yDR8Bm4Igl0adlNoRg=;
        b=BkrwOND5f8z/FQhcLVOQkfax8cKe5waDjVvyOsaZJF1oYeR/eINlWl+S0qwTttQtif
         TeVjloa90AIzVRBnVYXZy8k0TpnqYwOvRQsF6vDfk+OQ14G6+Li8LTwEogfe/5a9NJIB
         /a9JHRjUHIq6Nvx1k2Rscf/7dESrXVsw/AW596ZpJTr3Nd8meX3Wdf4QiwM2i1AxoKBz
         KiRVd8VyugPv+aCAHbY5ucFVgzJ294y8H6+OH1A10smqqVfd+oa1xILVmoSwbH5sCiZP
         dedX1yyg/Pn3glHdQs5+3ABi5LaUuJR027X8bSapLAb6rU5caV52VbCzCenRZ9XXZTtr
         Ug6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706633300; x=1707238100;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BkeKQOsWHdEZXYMWgkHXhBXL2yDR8Bm4Igl0adlNoRg=;
        b=EkCPaMVVRpGt3TPGwxNcWgKMD8FX2PJNimK4KmHQ4sJSGe6NKuctRYZYaaKVCeFPlV
         ej7PDL+Z3++agFp/vw3xsLMpw2OGnG2iigQ3xNIoS7camx4hkIaX8g8btxEDDImLzyOa
         swBK4feL/pGaVMbDNhPPmVyPgChnIq0Q6NRR3gkHUJscddYQXzuzwLPBIiAdP8FeEyRf
         wsNK2eisVyrJAI5MIoBWqwfFj5nsf9jMZu6Cdi44pCVqSmNtHI8jlibvi5+2FVIgdK+R
         jyaQmEt54ED7KpffEy2AmL2UlgJ+Zt5rB4VroRLGZPNZc51d7PTVZEVxT6WSYTMB9h0e
         IgBQ==
X-Gm-Message-State: AOJu0YzlLCBcvovNJoJG7Ggbco0pPNOOwuC4UZ9i3Bcg//6YQWb3DeNG
	8B7ECtoAtje1bmG6AKgcitKowqe7nh730D9zr4JjfbRZO1X9D1rCalUxKJAo8Kk=
X-Google-Smtp-Source: AGHT+IHi112VNPlSJNeWOdaWvxjaB67PF+syF0OM+Tf96Lh3VlfxaaPYbxEbh9mXj/Ly++37ME9DqA==
X-Received: by 2002:a05:6512:3050:b0:50e:50ee:f378 with SMTP id b16-20020a056512305000b0050e50eef378mr6701850lfb.65.1706633300108;
        Tue, 30 Jan 2024 08:48:20 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUvxn7K+iu46oWNolt8bP/XrHMwZt/ERz60vci7UAOq2XrtfLYUUvqF3q2Is41leDJuNjAdEsxxrzUekzPacQCG7pTEEg+tb5XjUz1BHCi/Pf8Rn1dctkljwPkPg1TfEmOKetZNAgiew2SL5gvuPFsf2HOCSFVmCC2Vr8/A337r0cxu68A8NzWRfPhh+OOUmnzBSi10zaS2Ig35ovN6KpdetmXpQSBOvneGHhcevjEHrQ==
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id er2-20020a05651248c200b0050e76738549sm1503182lfb.50.2024.01.30.08.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 08:48:19 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 30 Jan 2024 18:48:08 +0200
Subject: [PATCH v2] arm64: dts: qcom: qrb2210-rb1: disable cluster power
 domains
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240130-rb1-suspend-cluster-v2-1-5bc1109b0869@linaro.org>
X-B4-Tracking: v=1; b=H4sIAEcouWUC/03Myw6CMBCF4VchXTumU4EaV76HcdHLAE2wxSkQE
 8K722hiXJzFvzjfJjJxoCwu1SaY1pBDiiXUoRJuMLEnCL60UFLVEk8S2CLkJU8UPbhxyTMx6NZ
 rq5uzsq0R5TkxdeH1UW/30h2nB8wDk/mzEOHJVin8mjH9uOBHghUBwZHDuqyxUl3HEA2nY+Je7
 Psb/V2+DrkAAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1583;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=48Z3FDhWFsTEJ/wmhPTf0aZOApkiI5wL8H3cFuiRD2E=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBluShTziDo79Xuxpzbt3n0la5ce7hBGHazOjcli
 MD1uEtYhKWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZbkoUwAKCRCLPIo+Aiko
 1fdQB/9rDunGqBiSMJRUAyC0mANskLj3QehtPGO26+MCl1tFh/nX/0DChvRj9USTWwi+axkRw5+
 40NNfn6rzIUlOKP2GCcwFWVLPAjQHKogrH4ZfhpvjEdVPoEG92KBDxeE70Iyv2zYWXNyJ9QSDq1
 Way3d8TaLgNnHX4kUU5v91wEJSOOHm1QiVPad0eC1i5koTiitifP/ztWUMcbaL6XMVlTbBOPm9g
 SbeC1BE9zulcZ6WVopD7btVmfYs5d0sCz91LsG5oEDwT1m39/FQNP2TyFbK4Y0tmmNXr60vnRcF
 tt5FdyiGv2CGBZp7a2CO44Xhyk8RmoJH4npE7STGv+aM8OE1
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

If cluster domain idle state is enabled on the RB1, the board becomes
significantly less responsive. Under certain circumstances (if some of
the devices are disabled in kernel config) the board can even lock up.

It seems this is caused by the MPM not updating wakeup timer during CPU
idle (in the same way the RPMh updates it when cluster idle state is
entered).

Disable cluster domain idle for the RB1 board until MPM driver is fixed
to cooperate with the CPU idle states.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes since v1:
- Updated commit message, expaning the 'ping' phrase to point to the
  timer being updated by MPM driver (Mani)
---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index 64b2ab286279..6e9dd0312adc 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -177,6 +177,24 @@ vph_pwr: regulator-vph-pwr {
 	};
 };
 
+&CPU_PD0 {
+	/delete-property/ power-domains;
+};
+
+&CPU_PD1 {
+	/delete-property/ power-domains;
+};
+
+&CPU_PD2 {
+	/delete-property/ power-domains;
+};
+
+&CPU_PD3 {
+	/delete-property/ power-domains;
+};
+
+/delete-node/ &CLUSTER_PD;
+
 &gpi_dma0 {
 	status = "okay";
 };

---
base-commit: 596764183be8ebb13352b281a442a1f1151c9b06
change-id: 20240130-rb1-suspend-cluster-76d7b7582b6a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


