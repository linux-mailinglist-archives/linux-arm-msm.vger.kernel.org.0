Return-Path: <linux-arm-msm+bounces-16712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CA589B4D6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 02:04:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7B6E4B20EDD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 00:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DA3AB642;
	Mon,  8 Apr 2024 00:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EWA/VPmc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51926AD24
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Apr 2024 00:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712534677; cv=none; b=KryH/4IlfCsmI+j/Usw/A2SuRj0qaX8bBJkUjkwKAh6tY97AmGumGICx3a/AY9RY88ZnIqFxkkXrZLGxH500jyLwT53T5YQ3ADaMMoz97xQqn9Oq2v7i9wx8COrCV8tXhloicZc7wD3yIoUdJQY39X2PTBEctpM8J7nMyZPHZl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712534677; c=relaxed/simple;
	bh=sFiljEsHkSvtkuoFAjLbp1FQ28/Zn5jzAMNeY8/Ul0A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SHJeJM8iMuXj7Ys7UikTI1fDSLJWwc3gGAHRaDtqbhoAi67G5SwGB2ySlqssFjGbh3tqAPWj4tpjn6V0MLCy9Yecld22P1qcMTsqyYmqllaRlNKLG0rivbhP7VS3I1Wqv3FuHGgKA2fErSAXPb2KhgF9UGglqW7GD8YVpkjh0vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EWA/VPmc; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2d71765d3e1so46880731fa.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Apr 2024 17:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712534673; x=1713139473; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9U94iDjuSq4LprAA9WpMh9B6xMIqW+RLWUKcsVW0wr4=;
        b=EWA/VPmcgENKXaaiYsBtXg3dBnSrOXK/3vvFp5ZbZdyEbv5q21ba0QdJ5mLiq6wKBe
         r+AsBaAttY+Tf5pQECoKuzJe0b3mzF+JXazOxxAfV9iCPNrdGkdjTT4Q4SPIrSwhceBZ
         M3kT26JTwJ5p9Z409nVJ4HQtmFTe986wXu8I45IFgHnLXTV9jKiIrkrFB9C189UQFV2S
         uensFNoGrDy9YI2wu4TfvauN8ByKFywdChHz0iARPsqFcUgt2eh7RA2rJc7nIrFwKF80
         FGzI27EHXiZAoeUJzvYQbMfe2UpCqimVXxEagO+cZDIRrJER3YJ8N51UN/P5Fv58sZlW
         9L2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712534673; x=1713139473;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9U94iDjuSq4LprAA9WpMh9B6xMIqW+RLWUKcsVW0wr4=;
        b=uQlJVuPC5d5n20QwYYXGwWuQMomxmlpBD2eWK4VMs7VlmkITrGigRRg5duacykSbL0
         QDcUgsymQ0YthnW/KrdPphIM7dep6VElOUt0PRKWcbon5eVgtJaIEyMj35NBvl7PxAjv
         kzh+yVQAcQCzDaJ2jGTZ+2rg5nTc9SHr4XRxyAjLrTyf4qEGAIOj4rsTCdKOKTD8SbjQ
         Ds9cvjvxhI5bRpX3D4BlxsPDKBfZxW64aTfX1Mud64cAQ9pbXcEDbhZVdHZtsGu6gU76
         dwQcSipoH2iBcuqObEgH8jC9vHBVxOQ4Tz5ZmuLHijerBIOQBUXP+d9GnVJAqVvMFkua
         C29A==
X-Gm-Message-State: AOJu0Yw54f/2McSCG2zUlZ6jabATY6KO+W/e+ubliyIwMIp5qPFhIMJw
	HyDH40csp/ecMsQRirrRk/eu1V3JJouHrYdvtf0nwwKdCWAg2WtauFheLyG9O4M=
X-Google-Smtp-Source: AGHT+IE5PW2Ii2rqsBTeaZbABIUNr+Cdz5B7+LN4UOSQSd6xBi0QvhyRo9GkvI0Jact0uDkdEnA2aQ==
X-Received: by 2002:a2e:9f4b:0:b0:2d8:6787:eaed with SMTP id v11-20020a2e9f4b000000b002d86787eaedmr5522659ljk.2.1712534673423;
        Sun, 07 Apr 2024 17:04:33 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n9-20020a2e86c9000000b002d2191e20e1sm947077ljj.92.2024.04.07.17.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 17:04:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 0/4] scsi: ufs: qcom: fix UFSDHCD support on MSM8996
 platform
Date: Mon, 08 Apr 2024 03:04:30 +0300
Message-Id: <20240408-msm8996-fix-ufs-v4-0-ee1a28bf8579@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI40E2YC/3XNTQ7CIBAF4KsY1mKG34Ir72Fc0BZaElsMKNE0v
 bu0q5rG5ZuX982Eko3eJnQ+TCja7JMPYwn8eEBNb8bOYt+WjChQDhQ0HtKgtJbY+Td+uYSdAmN
 ly1vVOFRWj2hLtYrXW8m9T88QP+uDTJbrfysTDJhAVQtqRcUpXO5+NDGcQuzQgmW6AQjbA7QAU
 kAlVEMlF2oHsC2g9gArAAdjaq5LYdgPMM/zF2Uq5YgxAQAA
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 "James E.J. Bottomley" <jejb@linux.ibm.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Nitin Rawat <quic_nitirawa@quicinc.com>, Can Guo <quic_cang@quicinc.com>, 
 Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1838;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=sFiljEsHkSvtkuoFAjLbp1FQ28/Zn5jzAMNeY8/Ul0A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmEzSQDWH1pxP502+sIGrHqUAt02MoigBm9qas9
 FX8+pSqdLGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZhM0kAAKCRCLPIo+Aiko
 1W0SCACGZXxWLn7t/cshUBvgPElHnM+dG1hKf5YeBt5frfuA77huOkdYnhGWhvxJ/qE8s7NLq7g
 JQSJrL5PUQb0AepKLgtGquw4FswbnNlTBrzAX3Z9R+2bP3m7LFVRM6NLQLy9oSR1zQNS/TXrwk5
 4/Igm09XfYr2mVf6pbSxBe46TWXJptvofe02piOScdY5El2iBg7ZxKawlq0cf72fYNkQWYefZSr
 6wTpBTtKMtDoPtOYqsEFr+pwz1HlHmc6hIlfpYbHPp9HMvIKoUgnLpdwuZOXIe7z8VQpvWVVdKz
 4c3fxDZb4rhdLiCNAXyxv/ZEJuIQuh32dL3AjK2u36djFW07
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

First several patches target fixing the UFS support on the Qualcomm
MSM8996 / APQ8096 platforms, broken by the commit b4e13e1ae95e ("scsi:
ufs: qcom: Add multiple frequency support for MAX_CORE_CLK_1US_CYCLES").
Last two patches clean up the UFS DT device on that platform to follow
the bindings on other MSM8969 platforms. If such breaking change is
unacceptable, they can be simply ignored, merging fixes only.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v4:
- Rebased on top of linux-next to resolve conflict with UFS schema
  changes
- Link to v3: https://lore.kernel.org/r/20240218-msm8996-fix-ufs-v3-0-40aab49899a3@linaro.org

Changes in v3:
- dropped the patch conflicting with Yassine's patch that got accepted
- Cc stable on the UFS change (Manivannan)
- Fixed typos in the commit message (Manivannan)
- Link to v2: https://lore.kernel.org/r/20240213-msm8996-fix-ufs-v2-0-650758c26458@linaro.org

Changes in v2:
- Dropped patches adding RX_SYMBOL_1_CLK, MSM8996 uses single lane
  (Krzysztof).
- Link to v1: https://lore.kernel.org/r/20240209-msm8996-fix-ufs-v1-0-107b52e57420@linaro.org

---
Dmitry Baryshkov (4):
      arm64: dts: qcom: msm8996: specify UFS core_clk frequencies
      arm64: dts: qcom: msm8996: set GCC_UFS_ICE_CORE_CLK freq directly
      dt-bindings: ufs: qcom,ufs: drop source clock entries
      arm64: dts: qcom: msm8996: drop source clock entries from the UFS node

 Documentation/devicetree/bindings/ufs/qcom,ufs.yaml | 12 +++++-------
 arch/arm64/boot/dts/qcom/msm8996.dtsi               |  8 +-------
 2 files changed, 6 insertions(+), 14 deletions(-)
---
base-commit: 8568bb2ccc278f344e6ac44af6ed010a90aa88dc
change-id: 20240209-msm8996-fix-ufs-f80ae6d4d8cf

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


