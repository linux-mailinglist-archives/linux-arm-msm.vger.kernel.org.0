Return-Path: <linux-arm-msm+bounces-8419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F4583D7E6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 11:23:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3777E1C271AE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 10:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBBBE5A0FD;
	Fri, 26 Jan 2024 10:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hf0+exwv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E8013FEB
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 10:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706263238; cv=none; b=nlGY+TzoYliXkbvxM7hn4nRugB6TTv+m6zyEdri5zUTFVQWYEIcq7Gsl2H1Td8czdFp3XHk0zb6Y44xVKufmPhB1/R3wGypCrKrtBaQW6VRss/8ijvbSmOZH889+WiprOXXfRN5hEluKyVmd81t4TstewIMQVBmj32e6jziD9po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706263238; c=relaxed/simple;
	bh=jDG1S3cli+/SN3fqh2FR8VpGIzYKVsUmuM/W0dRG70I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pafu96ijtWBaaypVy4xACpooVNEm/vykPhK3c7c6BkBc11cQcSn5HlFGVomK6hMKeOECpciloh+uGntojvM8gPWdxxlFZVZpNmU0cS1WOj/RD4694g3exQhzQE5g1Of9kYbPXjTShBedMB2NlcqwH4cld+noRJ1rC3hZ4zsL34w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hf0+exwv; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-337d99f9cdfso269244f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 02:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706263235; x=1706868035; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y5O+kjgBDmNmptknsqNCUzo00Hmm0udZIBS0cofcDho=;
        b=Hf0+exwv9RN7xnqbzcvCyIAslLR1AKSxw3fn9BHu+dnYt2xT2/KISBasSmqRmKycXe
         z2jcXheomeEvjXsSEsa56AVuH3WXjqkVwSbM+IGewqmw4sfrXmICe3jqbkHx6k2YKKJC
         ESwdHYD8lzgcyzv+3bdDlYtM4gIM0eEo4/OatW+mAeFsuCA2zoBeMkVU6yxaeJpjxoMI
         9g7vmyI/2/J9KwVcGMoM0mPA0gked8lAtE9Npx8JQMz0QrDnfjMNTEIMen4q6QpzgePY
         akzZjeNSgM5QIDDFN4/ZkWo69sUEfm0ALIIzGeq+fUN9IU15T3FOi/rEl94vqs6MkpDq
         s+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706263235; x=1706868035;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y5O+kjgBDmNmptknsqNCUzo00Hmm0udZIBS0cofcDho=;
        b=cAmRa1kTLoe10FQW062a9QaAdq7nevMlMjwFWDeQkTK0v316wEDiw2/ghN8t1WX4Wx
         2dtzAF+A5sc8hlM6oBixSwErAeNov11IeB1ankeA/0QpHQtkeKx2XTHwcXp1fsgJ8UHs
         snMLvhT8HILPAcUakcCkOSYtV9xeY0eZCYdzu52iFA04p6E7FDLDW5393uHi7cer9Kbp
         c5R/FU/rtJCfCQY6aa6Txmil5eCsyH19Xi6RFSek1SGlSJGSb+Q4VXAi1JyCNz/Np3mk
         MI90KhlPH0VzJyboMTJNkMbO5UCZXibTxk+V3Uzl0Wcm5lDu3fgs7bKOeREU49wjO6QC
         EcYg==
X-Gm-Message-State: AOJu0YyVJzbR6bHGxxgRpDKnZARbGgTeChQplwJ7enwre8Dw1G6Jaww9
	9Ip6u785Wamcyp/r/xh7jTGLqkH01MQJrM82fsnZuRKNvxVvehBGvDURozbOD4w=
X-Google-Smtp-Source: AGHT+IGNb+xn7S7YYv2hXKyb15iQ6NRqgjtAQLYIAUioMkJXYcne2kKdwtQuLMxzKYwKnSNTodAB5w==
X-Received: by 2002:a5d:4dc4:0:b0:33a:d00e:8840 with SMTP id f4-20020a5d4dc4000000b0033ad00e8840mr662247wru.96.1706263235097;
        Fri, 26 Jan 2024 02:00:35 -0800 (PST)
Received: from [127.0.1.1] ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id ox27-20020a170907101b00b00a3221b95ce8sm448494ejb.77.2024.01.26.02.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 02:00:34 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH v5 00/11] arm64: dts: qcom: Add more support to X1E80100
 base dtsi, CRD and QCP boards
Date: Fri, 26 Jan 2024 12:00:11 +0200
Message-Id: <20240126-x1e80100-dts-missing-nodes-v5-0-3bb716fb2af9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKuCs2UC/43O3WrDMAwF4Fcpvp42SXHadFd7j7ELx5YTQ2cPO
 4SOknef0/2wUQjT3ZHQx7moIjlIUY+7i8oyhxJSrKG92yk7mjgIBFezYuSGGAnOJB0SIripwGs
 oJcQBYnJSwODRk7jjOqoCvSkCfTbRjivR64ef589TShNMCcoop9P68JbFh/O1zfNLzWMoU8rv1
 3IzrduvHsRbPWYCBNIHFi+We+yeTiGanO5THtTqzvzbajctrlZr9uItaodob6zm/1ZTLaulc9T
 tjfN8Y+lvSyNxs2npauGBnWXfWmqbP9ayLB8NJi1y2gEAAA==
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3312; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=jDG1S3cli+/SN3fqh2FR8VpGIzYKVsUmuM/W0dRG70I=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBls4KwLxPoiuBEUiz+aey2uwx5sPEPRXypR8Js/
 9yXLc91Le2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZbOCsAAKCRAbX0TJAJUV
 VpmkD/41BZX+r+412BUQXKDZvLiD786KUlCJvJXcn0f+m643U8nWfvO3N9etPAlm8hY0jXUQcPk
 XEvjUxRVTM1gdDhIYvWU/NzK1fLgU7grNqJpVv1sHVD9WH87YoF8aWaFHVlaW3UCM9ChThyfH3R
 Xd9RvDEhVvx47HEmdmlcUM86aDCheCIktC0EeUrrIAg2GNzDDi5kpDs8I9lPWieOuU8FDylxUYp
 MW5jc1GUR+uf3glYzFhYFXUcW6llKCsgyq1hZssEEkXV5Cd3VFREFJpk2QTfiS2FM8ol1/hhNuA
 ldBTdUYo4s0sXIYkcHx4Jfi7+dMubdggFQFX0TbG8bPvPR1PHH5s1hN9nK8y5NW0bro8GQ6GcsV
 Jpp/E2jT7gOQvFBblo0mosYBDvxSfdyHaO7STiBwayYUHWCXFb6upCv9KKOb7c4HfqthJCx5KcR
 DWmvBZO2INuQ/FFco0O3tYZJM+73JtCQUhJtDFA0iv9O8qWkPXOehJS3GKmITZap3tID8aP0jEo
 SMQCvV71a0Ks07g7xAU5MWLF3H6VE5jI2ZflPln5yb5UokFLCuySgr5sGzp1i1gW1FvgnDMaRMF
 Oxe9APlvI/3sbvUy6p4EPA1Dd2ioIgXM+DltpnWXeBZ2n7tUy5oI4NHAXDZRvxvADJbTFYY7EIz
 vwLDBnJLyLgsFHA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

This patchset adds every node necessary for both the CRD and QCP to boot
with PCIe, USB and embedded DisplayPort.

This patchset depends on the Disp CC and TCSR CC bindings.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v5:
- Added Konrad's R-b tags to patches 1 through 4 and A-b tag to patch 11
- Changed the clock of the usb2 HS PHY to TCSR_USB2_2_CLKREF_EN, the USB1
  SSx HS PHY seem to be sharing the TCSR_USB2_1_CLKREF_EN
- Prefixed DISP_CC_MDSS_CORE_* gdscs with MDSS_* to be more in line with
  SM8[56]50 platforms.
- Added "cpu-cfg" icc path to the mdss node.
- Marked all USB1 SS[1-3] controllers as dma coherent.
- Re-worded the adding TCSR node commit message by just dropping the
  "halt" word as the halt registers are not part of this region. The
  TCSR offers more than just a clock controller and therefore called it
  generically "TCSR register space".
- Link to v4: https://lore.kernel.org/r/20240123-x1e80100-dts-missing-nodes-v4-0-072dc2f5c153@linaro.org

Changes in v4:
- After a discussion off-list, it was suggested by Bjorn to split in separate patches.
- Addressed all of Konrad's comments, except of the clock-names one for the mdss,
  which there is nothing to be done about as all non-v5 do clk_bulk_get_all.
- Added more support to QCP, to be more aligned with CRD (except touchscreen
  and keyboard)
- Added a patch to fix some LDOs supplies on QCP
- Link to v3: https://lore.kernel.org/r/20231215-x1e80100-dts-missing-nodes-v3-0-c4e8d186adf2@linaro.org

Changes in v3:
- Reword the commit messages
- Link to v2: https://lore.kernel.org/r/20231215-x1e80100-dts-missing-nodes-v2-0-5a6efc04d00c@linaro.org

Changes in v2:
- Reword both commits to make it more clear nodes that are being added
- Dropped comments from interrupt maps from pcie nodes
- Replace all 0x0 with 0 in all reg properties
- Moved on separate lines reg, reset and clock names
- Dropped the sram and cpucp nodes
- Dropped pmic glink node
- Reordered all new clock controller nodes based on address
- Dropped unnecessary indent from touchpad and keyboard TLMM nodes
- Link to v1: https://lore.kernel.org/r/20231212-x1e80100-dts-missing-nodes-v1-0-1472efec2b08@linaro.org

---
Abel Vesa (7):
      arm64: dts: qcom: x1e80100: Add TCSR node
      arm64: dts: qcom: x1e80100: Add USB nodes
      arm64: dts: qcom: x1e80100: Add PCIe nodes
      arm64: dts: qcom: x1e80100: Add display nodes
      arm64: dts: qcom: x1e80100-crd: Enable more support
      arm64: dts: qcom: x1e80100-qcp: Enable more support
      arm64: dts: qcom: x1e80100-qcp: Fix supplies for LDOs 3E and 2J

Sibi Sankar (4):
      arm64: dts: qcom: x1e80100: Add IPCC node
      arm64: dts: qcom: x1e80100: Add SMP2P nodes
      arm64: dts: qcom: x1e80100: Add QMP AOSS node
      arm64: dts: qcom: x1e80100: Add ADSP/CDSP remoteproc nodes

 arch/arm64/boot/dts/qcom/x1e80100-crd.dts |  222 +++++
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts |  175 +++-
 arch/arm64/boot/dts/qcom/x1e80100.dtsi    | 1368 ++++++++++++++++++++++++++++-
 3 files changed, 1758 insertions(+), 7 deletions(-)
---
base-commit: 853dab01a34378871b37a5e6a800e97a997fe16c
change-id: 20231201-x1e80100-dts-missing-nodes-a09f1ed99999

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


