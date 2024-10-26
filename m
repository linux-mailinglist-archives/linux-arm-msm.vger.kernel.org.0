Return-Path: <linux-arm-msm+bounces-36047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFE79B1B30
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Oct 2024 00:09:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2930A1F21789
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 22:09:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15D781D7E42;
	Sat, 26 Oct 2024 22:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ci8lfH6P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF591D433F
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 22:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729980592; cv=none; b=TCrvhlAHBn2TilCkLApt1Rl2O3ISKm22CgVLUSSI7Uu2aTqaxN5qr3yq8jOjFWXWNpz2WKgMfjwGbVMyTb1e6h5Ee0kqK6kRFiRsX0wnj/skVjxXJHBUoH9wtiE8nabXSqFmj+P+BWzmAdV6x1+l807kMpWGbiZzTPep1z6MPdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729980592; c=relaxed/simple;
	bh=QR9Sf4duGn5kUTRjQj0DoCOM1Cu5LUmqXIRVsuYLTD8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RYHnkD8T4YyVS4ESq4mvYY1IEt5XnXgDHKkzdOkcT9SWE1g2fc20hVTY5DoZ1Lkq/tXoKpp9tIfSqziZWyk9TP1UtJaytqBz0yLPiNfdgy684Cde3DGZOBuy90mv/vQc2gNIsDwuktS+hb1yTdBVDJ0n6AZFPr77cjVTiZk1JmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ci8lfH6P; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539f53973fdso2632453e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 15:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729980588; x=1730585388; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TZKRlP21Si7JMkCDul1UDnNBfncEM42FXq7PL35Q2JY=;
        b=ci8lfH6PjQrYBhf0r7RXaw20MFKtRrk6Ki1POUd8iYQasU8LEq+l4+tfIHj4CD2p0a
         4GqF/C+Xx5GEpnhYEaKyq7hoUILsQVNm0GTPEFOJ9o5LCmcJdgr8waisGaIiaQTm9nQm
         jtrrdwQfaCCzNFNTXJyXAyMvPW7R3J+nen8MpzANQ04jUaBSzXtCYSWRh8tLcF+7/lml
         BRDKNn8J7haEKGhCF8INT6iEo1t256KG6tDd2bqm/Xwqd9mqZm1c0l4lFTm4r4hqS0/c
         nqosQxofu694+/GjiXvEu2nHe/jUUa3q3/vw1aNROBxYAEyBAd1j6pDKUj9yQyORFiFW
         gbnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729980588; x=1730585388;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TZKRlP21Si7JMkCDul1UDnNBfncEM42FXq7PL35Q2JY=;
        b=LA3EzyG3fsB/ZaXP6a+1vMA22rY0bVhjOTyiI8wWZONgBeu7geL63UwJQhA2+H8xV+
         ShUottIJ5oax/11gq65JBkOzlddGR/ZpW/Pn6m2z+Zuvu6rI4qyUDNbvOGN2l/mDUlE1
         l96kue73N53tva8xqCQBK4rRRIOokeUZWsbpA3mC1/VMRdNzGM5qbfvKPPtoVOTmR5Az
         mJLbgRwj1p9GA3W/RQcR0HfcTrTFYq8zPhBIJucMSiTmFt56qN3A9w53xixBg2e9MCmc
         VCyyEY6t4AbgWHsdPa5oi+giQnRbC6h9KxK9ZBZ3y8QUbC6l/N4FsRTlGXtEJH2BTiId
         euGQ==
X-Gm-Message-State: AOJu0YyrT6B07r8mcGvUf5T11F7LqCKM+tAQdi1LT35GD8VuSiWB3iFJ
	9IqbHObVotFw/Z7pvp74pbUnr9FJIMolX3BnNUmktHaxAU+g7YT0qm+zUVn/IGA=
X-Google-Smtp-Source: AGHT+IF9/83r38yJgqSRjcoU8fimpF0Ui1SbSqgsTOHb91Vny+3ozXYue35+V0u1j/atBWkIljyeZQ==
X-Received: by 2002:a05:6512:687:b0:539:f6e1:f28 with SMTP id 2adb3069b0e04-53b2375d2c9mr3326659e87.30.1729980588048;
        Sat, 26 Oct 2024 15:09:48 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1adf35sm615934e87.130.2024.10.26.15.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 15:09:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/3] remoteproc: qcom: pas: enable ADSP support on Qualcomm
 SAR2130P
Date: Sun, 27 Oct 2024 01:09:42 +0300
Message-Id: <20241027-sar2130p-adsp-v1-0-bd204e39d24e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKZoHWcC/x3MTQqAIBBA4avIrBP8i6CrRAtxxpqNiQMRSHdPW
 n6L9zoINSaBVXVodLPwVQbspCCdsRykGYfBGRescYuW2Jz1puqIUnVOPkecAxJ6GE1tlPn5f9v
 +vh87ZcZZXwAAAA==
X-Change-ID: 20241027-sar2130p-adsp-fc3fad54ded3
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=840;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=QR9Sf4duGn5kUTRjQj0DoCOM1Cu5LUmqXIRVsuYLTD8=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnHWiofZOtK1MUO7lejnnUfFjYK0Ypro05p6XuL
 BzJqVWrXVGJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZx1oqAAKCRAU23LtvoBl
 uIRfD/9W8e4NZiDLL9F3mpniv7n6bMzeTk9qa4EgrThqaRHMPJP3fiZklPdh4JNTV0ZScWuIvWz
 KiMGt0F87t1SN2XW0jNtjlc421K48maJJPfAU9otAtYSvlt0+o5B1zcijwedJZJntCZOD/5XCJK
 V8wlJKZSnIMd8/LR5rRFqgHWHbLnu3rbcVc5ylLLkhG/LahDoqENBJxwteO5p6ZN8kfNbKqt1OD
 kzQXOCePVhXaM7vXRYsuu7Djugrvhxogu2nC5Y/YXy1eeI6mwr460sh99ji/USiHg1xtEhHppAM
 rlEhPlCPAt0NrnbY6MqlSRs2HDk5UR224LxvjltTM+RysJ4mJ9SgnAowbzgorfme6K2vBWkGDJx
 nXP0kdqlzfJaoXHVSpw1x9RDbQk5WTHQMnlwmp8wHVgDtbfS65oJvuObawYUg0xcEo93oyFi4PC
 13rDBe7BvifVus/j+hE/n7qAKBm4VTphieUnvainHybpIGWSbe6d8cW7NQcvvNm3qIVVnWsC9Kq
 gExzUPzrspjyLRVN2dFcwRN7wWSVtT/Df4542E0MRLZEKplBlt1pQt4KNl1lsDyqlmGpjjBczRx
 H/9Wa3WaJc4tfY10e/fLwmr6r1jYVhywCPthe7q6jm66TcWan+kaZWPT3267vRhZoUEZuFcm2dI
 KwoOP+w9wZMOOtg==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Enable Audio DSP support on the Qualcomm SAR2130P platform. The CDSP,
also present on this SoC, crashes the device during the start and is
thus omitted from the series.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (3):
      dt-bindings: remoteproc: qcom,sm8350-pas: add SAR2130P aDSP compatible
      remoteproc: qcom: pas: add minidump_id to SM8350 resources
      remoteproc: qcom: pas: enable SAR2130P audio DSP support

 Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml | 3 +++
 drivers/remoteproc/qcom_q6v5_pas.c                                | 3 +++
 2 files changed, 6 insertions(+)
---
base-commit: a39230ecf6b3057f5897bc4744a790070cfbe7a8
change-id: 20241027-sar2130p-adsp-fc3fad54ded3

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


