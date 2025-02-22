Return-Path: <linux-arm-msm+bounces-49005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 095C5A40454
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Feb 2025 01:43:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48E0D189FFF9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Feb 2025 00:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 803014D8CB;
	Sat, 22 Feb 2025 00:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KzP33SR+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38CA4120B
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Feb 2025 00:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740184993; cv=none; b=P1BULnbeuYq1G3PpG0B9PdLw2UNMmu96DvU6idAHIotXBbK/Onj7prjV4K5miUJKvEcR7thFqg+HtAZcyKVGz5IrBpSzcajyLQrA3Ytfjul0gzzhG3472cAsDPewP2PiRWVC4LajQ1HL+Fy7jgOJ4gQiR+rM1Xy81fkmNctX0Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740184993; c=relaxed/simple;
	bh=6r9NvDVZOxd1+FXBugV/iaH5ExhH58VY6S09wppsyK4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PEkC6fIIriMl5Xu56yMygdLVqiz6U/JykffIWiS8KmeKefJziHd6go+8JH4ZsELJ3xogH4iNAcGFMze3EMCtoBDONzB9/9SkzEtzzgGlPtCOZp2lYwlNtS23UWRYA15+DBlg5NdVNht6mmXXosNrh5rSkX4OORs0REXkNxadjuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KzP33SR+; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-548409cd2a8so370559e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 16:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740184990; x=1740789790; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Va34volQUwpd0lqEoh8I/BGYl1sF6wHNMFNfDzJaKck=;
        b=KzP33SR+9vPkTDvL/Ot2mMAXiVS3INFesdVJEYQgGwDw07ZPauLJ7pukw+pGL3bOCJ
         tFVQZa1oPIcpKYDu6FEuID/WhbBPaoBY0S1GshmltwjO91jrgcL//V/bzCoB1GH4Ni0f
         RNeXg9v4/IsZerScOyNkStLi8TP4p2STmdBu5YGUKe2efLMAm1NEcCTxkunxsmTddBp3
         QNQyVdBBqCeA+yIEpP/EqXgDFnqP7Al8vo8ofeQwx5d2+GClH53wyqrb2b2KqPB6yqbA
         j2TapxAONSKwZeErIJSRRD44nBlkGev7LlP5XAzvmo96iO//qK+7IR1LPG+Rvk/2sWek
         aiNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740184990; x=1740789790;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Va34volQUwpd0lqEoh8I/BGYl1sF6wHNMFNfDzJaKck=;
        b=h+rYrD833Vzpzvi5wnA3Hu2YK0JDe/9nHimQ9DK1MsmnfpS3G78pRRP3fqh9a35Mbq
         sMwUeq8pFxnN+36sacFXBtCnnIt3uFxt7c5aHDzeLq/FF8yEK2eMrh6y4L6SmKy0QPHE
         qsjphgPxVKgwLFF27x7HcoAE88psELTEkte+KCG4sqDxezQIHHUAfjOHjLHeqZ5BGymp
         76w1xjln1iqxvecNvD7rRvIzei0nO+0K9i9DOxSWwxLUmdy2wQ0xfuiTjvFFULtLOI68
         etrpX4mAaWdc1tWaWVzDnrRdPuUvfBbd4gqPJArUGWRmuuPkgTLgIU6CRogXE9+XtXu2
         qWuw==
X-Gm-Message-State: AOJu0YyaN/nfYVxYrMdgX69LqAOVokwwaafz8wHr+2F1gmFSHI/nTs3n
	4yOk+sTA9QwWk87eNv1c/kKlEq4CoX5+zipdZhmJeZ+YZBACDo/r+JAmwg4e+KDulP0J4HOl5Lf
	D
X-Gm-Gg: ASbGnct+d2f0StDdnjWQacK6Tlv7DoPh10ZbOAVGnikJSml/t7QRcr/TIuBdzES73O+
	DUiDjw3Vo4jea5fnaBXIlOCI1mB3exc1nvW+FeYElXkzm4iu+OqiIT8dUxHWRXvI2FOksUJkcGr
	EZT/CKdIEzs7AvzfnohwVap5sWFZz2MmHvzptMvsnJvYaKaeeVtTwCNxFmJGZAhWL8honsryhN1
	szi9Wi0oRLXFsbhmT7IZ3mnbkLEC/BI1FBA0XZ5lBas6oBmky94CFv7LUvSE0srOMhIlN5AL1jd
	zvS4JXWs09DqW3oDJj/ZPGRyQiHpqHxclg==
X-Google-Smtp-Source: AGHT+IHW6AzEqg41ONAvf2JAYQ914QZwrhsnEGMBF8vrkjYSrGQkOEJPeA4nAoCS9xF4eeyaR1elDg==
X-Received: by 2002:a05:6512:3b87:b0:545:5a5:b69d with SMTP id 2adb3069b0e04-54838efb008mr2523396e87.31.1740184989632;
        Fri, 21 Feb 2025 16:43:09 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5452c301175sm2412090e87.139.2025.02.21.16.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 16:43:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/2] arm64: dts: qcom: enable SLPI on RB3 and RB5 platforms
Date: Sat, 22 Feb 2025 02:43:03 +0200
Message-Id: <20250222-rb3-rb5-slpi-v1-0-6739be1684b6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJcduWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIyMj3aIkYyA21S3OKcjUtUxJSjYzMTVOTUuxUAJqKShKTcusABsXHVt
 bCwAt/j4oXgAAAA==
X-Change-ID: 20250222-rb3-rb5-slpi-9dbc6453efd8
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=610;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=6r9NvDVZOxd1+FXBugV/iaH5ExhH58VY6S09wppsyK4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnuR2aI9lNBVN6mX7+J5+IcaAxZo2jmrP1ziHR0
 KEHWDHhztaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ7kdmgAKCRCLPIo+Aiko
 1XEOB/4+IuC2xlZycdEfwculJpkZukbx7ZknQoJVhM6gX3aZnH2INvIfL2XYwjn28vi1fd3G4/k
 mCarpchiRcGdX1Cf//pr8osqKAIcK3LLXQdbmzcZWNrhHuOTH51CXcluNbFBP5oUShokxSXiAf4
 j367MNOPXwilnH8mK1QnpFapdNw3EoruibsIX04Kif43UM4pTX47R49x0EESKY28TzJkuvc9Jjw
 cYielC+5wpkZhFOJuX+/oeS0PWm6fmkHVAuLJJnu14OVlGPvxqSDuyM6oDx4IQ4qP+cBFj3svMo
 3vrR8gpWdPt2MUeNRp0BP2fRIeao1hAwCbyYovOzH1fi4KCM
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Enable Sensors DSP aka SLPI On Qualcomm RB3 (aka db845c) and RB5 boards.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (2):
      arm64: dts: qcom: sdm845-db845c: enable sensors DSP
      arm64: dts: qcom: qrb5165-rb5: enable sensors DSP

 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts   | 6 ++++++
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 6 ++++++
 2 files changed, 12 insertions(+)
---
base-commit: 0b77125c44649e993485ce9751de9b57a21ef4a6
change-id: 20250222-rb3-rb5-slpi-9dbc6453efd8

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


