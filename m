Return-Path: <linux-arm-msm+bounces-538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD737E983E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Nov 2023 09:56:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66286280C66
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Nov 2023 08:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D7D1171DF;
	Mon, 13 Nov 2023 08:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="FSpMhuH/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACAF168A9
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Nov 2023 08:56:25 +0000 (UTC)
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB04E10CB
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Nov 2023 00:56:22 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9d10972e63eso612507466b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Nov 2023 00:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1699865781; x=1700470581; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BsrM2PDilSjaMLE5U2fdt5pzgmWoxeOH6PNobCuBiz0=;
        b=FSpMhuH/3Zfeac8j1BJ2eRmh5UChmU3h0O/1f0MZpcATECPV6lY0p1pHAceVNycu+7
         8wVZKydkdXK4wgmlTTPwL5RaIJSBj2+XmGWsBf4U21LKX1v2Y3k5IrDsWtu5FDY9mHi5
         H+1F7/vgoBhlszOfihRvjH7XVIwr624IJWMPUgz1VAuTDuCHk5cd41VKipdd1mey2WL9
         J8JuZRXQW6zI3d7s+3fzS0IGOZQLWMVajmE98Oqe2vLZjYVS3nb07ZpF8ub5SORII57Q
         /5wFGaqytQ6f5rhYwxy0BhQSOVql8/0/faWNlWzdP+VLBX536IouUkgXb5E7S+vYDTpF
         8SmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699865781; x=1700470581;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BsrM2PDilSjaMLE5U2fdt5pzgmWoxeOH6PNobCuBiz0=;
        b=kfxmu+gHmqsOqF0ihJvOrOE3tTlbjpIWlie+CS0cglpEUUnE05lv2eCESmJ0oK4LRn
         gljqUjQ6cTNUlNkc/uByw+JuSd7oWx3cgFMYx2mb2a25NCxFe5JhetpdNMQXPZy4MmSn
         mWfULkoL1fi22DuXsMgfagKJnFhW1VqHLN4O+K5KrCCcficyE4Ake5pFmzNu1E8KlVMu
         +ntke7qhD2IkgBxd7dMb+j2D11Vhfbawwph5DFaJPa3uZktMGgkOiCB5QTQhQQgmQcmO
         R2/hUGhR5p2DbuFYeQcXHjduHAXrzHb1HHu5h2RDURtUov4GGkyuss3mQ0xwcDH4ZJ8+
         7JmQ==
X-Gm-Message-State: AOJu0Yxb5nksAiDOsT+JtGggKpGMP7/Mt3AlsPQPxp0QSeKfvwrvs0QW
	AG+2eRrkPudwjiB9rGOi4/y7lA==
X-Google-Smtp-Source: AGHT+IHlTp66zVzK76fU9FdGoO9JFmDj4DyrwLiTq46FFbsxHQAjsaN6E5t9RqrwzKCvGBZ5oYhhAw==
X-Received: by 2002:a17:906:3458:b0:9dd:dc2a:eb8b with SMTP id d24-20020a170906345800b009dddc2aeb8bmr3641569ejb.41.1699865780941;
        Mon, 13 Nov 2023 00:56:20 -0800 (PST)
Received: from otso.luca.vpn.lucaweiss.eu (k10064.upc-k.chello.nl. [62.108.10.64])
        by smtp.gmail.com with ESMTPSA id kk22-20020a170907767600b009c758b6cdefsm3673538ejc.128.2023.11.13.00.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 00:56:20 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 00/11] Remoteprocs (ADSP, CDSP, WPSS) for SC7280
Date: Mon, 13 Nov 2023 09:56:11 +0100
Message-Id: <20231113-sc7280-remoteprocs-v2-0-e5c5fd5268a7@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKvkUWUC/32NQQ6CMBBFr0Jmbc202ACuvIdh0QyDzAJKpoRoS
 O9u5QAu30v++wckVuEE9+oA5V2SxKWAu1RAU1hebGQoDA5dbdE1JlHjWjTKc9x41UjJ4K112BJ
 ZtjWU4ao8yvuMPvvCk6Qt6uf82O3P/s3t1qBBT9z5oautD48xiK5TXPhKcYY+5/wFIsfscLgAA
 AA=
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Herring <robh@kernel.org>, 
 =?utf-8?q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.4

This series adds support for the ADSP, CDSP and WPSS remoteprocs found
on SC7280. And finally enable them and WiFi on the QCM6490-based
Fairphone 5 smartphone.

The first two patches are fixes for the MPSS to fix some dt validation
issues. They're included in this series to avoid conflicts with the
later patches and keep it simpler.

Then there's two patches reorganizing the reserved-memory setup for
sc7280 in preparations for the new remoteprocs.

Please note, that the ChromeOS-based devices using SC7280 need different
driver and dts support, similar to how there's already
qcom,sc7280-mpss-pas for "standard" firmware and there's
qcom,sc7280-mss-pil for ChromeOS firmware.

I'm aware of the series also adding SC7280 ADSP support with the last
revision sent in June this year.

https://lore.kernel.org/linux-arm-msm/20230616103534.4031331-1-quic_mohs@quicinc.com/

However there's some differences since that series added the "pil"
variant for ChromeOS, not "pas" for standard firmware. Also it seems on
ChromeOS devices gpr+q6apm+q6prm is used. On my device it appears to be
instead apr+q6afe+q6asm+q6adm but I don't add either in this series to
keep it a bit simpler, and I couldn't test much of that yet.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Add patch renaming memory@ reserved-memory nodes (preparation for
  next)
- Add patch moving mpss_mem and wpss_mem to sc7280.dtsi
- Follow *_mem node being in sc7280.dtsi also for ADSP & CDSP patches
- Use (squashed) .mbn instead of (split) .mdt for FP5
- Set qcom,ath11k-calibration-variant for FP5
- Pick up tags (except for Krzysztof's R-b for ADSP & CDSP since there
  were changes)
- Link to v1: https://lore.kernel.org/r/20231027-sc7280-remoteprocs-v1-0-05ce95d9315a@fairphone.com

---
Luca Weiss (11):
      dt-bindings: remoteproc: qcom: sc7180-pas: Fix SC7280 MPSS PD-names
      arm64: dts: qcom: sc7280: Remove unused second MPSS reg
      arm64: dts: qcom: sc7280: Rename reserved-memory nodes
      arm64: dts: qcom: sc7280*: move MPSS and WPSS memory to dtsi
      dt-bindings: remoteproc: qcom: sc7180-pas: Add SC7280 compatibles
      remoteproc: qcom_q6v5_pas: Add SC7280 ADSP, CDSP & WPSS
      arm64: dts: qcom: sc7280: Use WPSS PAS instead of PIL
      arm64: dts: qcom: sc7280: Add ADSP node
      arm64: dts: qcom: sc7280: Add CDSP node
      arm64: dts: qcom: qcm6490-fairphone-fp5: Enable various remoteprocs
      arm64: dts: qcom: qcm6490-fairphone-fp5: Enable WiFi

 .../bindings/remoteproc/qcom,sc7180-pas.yaml       |  21 ++
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts |  45 ++--
 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi |  35 ++-
 .../boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi    |   7 +-
 .../boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi   |   1 +
 arch/arm64/boot/dts/qcom/sc7280.dtsi               | 271 +++++++++++++++++++--
 drivers/remoteproc/qcom_q6v5_pas.c                 |  19 ++
 7 files changed, 336 insertions(+), 63 deletions(-)
---
base-commit: 9046efc22ed7a73cb888a8c5660a21f99c89af03
change-id: 20231027-sc7280-remoteprocs-048208cc1e13

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


