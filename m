Return-Path: <linux-arm-msm+bounces-3214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3D5803021
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 11:24:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA365280C34
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 10:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 521B420B33;
	Mon,  4 Dec 2023 10:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="25+2DmbH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05647138
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 02:24:13 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a1a52aecc67so267309066b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Dec 2023 02:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1701685452; x=1702290252; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d+/UUK0tjiTbrYrWq+ZnEpTiWe5a1pluZVFLk6AmF9c=;
        b=25+2DmbHuqMHRgfnJnrtDiwtqhqI7co39OL04t86nWhS9eW5Tzp6RsffFux3oF6gM5
         Q0yigNgvCuMGYnZX8YiSRTbKvPgp1LJoJNZAByozfWR1eL1x6Lq2X6x/wa/tBMbw8PTG
         yxMJs/yN4tQ9ESI7/jivditAn3sUqCOk2m/mPQUam5e/+2up6O5GjfPWZ54KXFBxENgQ
         WnBBWdBC1z1z1hdPMQ+2bWgYukBWFMa553K6r5/6Ijj7BOmG/bp7vMFIewGDejkCSU53
         XAwdrYrNSGfJsxHktKoaylnS6V4kPbYb0ad0thgbCsJ5fzqSHqMCC2DER0m8ueevFsj1
         vRvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701685452; x=1702290252;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d+/UUK0tjiTbrYrWq+ZnEpTiWe5a1pluZVFLk6AmF9c=;
        b=Z6g0AbdQFKXAjHE8C4T32u9bMdaGDenRKtLog6pXB03/3j7V59GfB9hblMvxSBq81P
         P/294vJ0HeJ5chHwcA+Iw+GfCEQuapuadaBGbLPDwrxM1nt9rPu76jgGL69VGTOS2DKg
         NmIXrJlubBb95cWOmyXik1oNrvsJSP+ZyGQltu2jik3JU1jaRQMy55afT1ZxJZ4UNyyE
         hyxnzwBk5uRLufR/AzYIOADNMcy9nBDgEGqOCc7dzAghAWr7jGxCqLaRfFaAKkcJ97C5
         6kibiPbgkgBsEKoboFa4ebokCoEMtUnJqHY5er3H2RfVcJZPFWn1RjvbS6BWxyhzq7s8
         7gkQ==
X-Gm-Message-State: AOJu0YyuAKBG6s1p4tiaDLzBzdNVnAPrm4ol7WoDI9tHUvUTepG21Fb3
	OdtyoLWtkbFb5jMXAnv6snsBwA==
X-Google-Smtp-Source: AGHT+IHqro09Ko7X2V1DD4rgCax4G8WDgquQW3myh5xd0r5oyG9Hr2vgMNE9sZB0D3NOqxQZv3Bx/A==
X-Received: by 2002:a17:906:103:b0:a0f:42da:1715 with SMTP id 3-20020a170906010300b00a0f42da1715mr3012340eje.50.1701685452409;
        Mon, 04 Dec 2023 02:24:12 -0800 (PST)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id t15-20020a1709066bcf00b00a0bdfab0f02sm5121551ejs.77.2023.12.04.02.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 02:24:11 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v5 0/3] Add UFS host controller and Phy nodes for sc7280
Date: Mon, 04 Dec 2023 11:24:03 +0100
Message-Id: <20231204-sc7280-ufs-v5-0-926ceed550da@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMOobWUC/z3MQQ6CMBBA0auQWTukHSpYV97DGFPLILOgYAtqQ
 ri71YXLt/h/hcRROMGxWCHyU5KMIWO/K8D3LtwZpc0GUlRpUgaTb+igcOkS3jQ3pmZXK24hB1P
 kTt6/2fmS3cVxwLmP7P4LZcnqStuqLska0qjxsYi/Bpklupc7fSXBl34cYNs+K/ULnZ8AAAA=
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
 Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nitin Rawat <quic_nitirawa@quicinc.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 "Bao D. Nguyen" <quic_nguyenb@quicinc.com>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.12.4

This patch adds UFS host controller and Phy nodes for Qualcomm sc7280
SoC and enable it on some sc7280-based boards.

Pick up the patchset from Nitin since the last revision (v4) has been
sent end of September and is blocking qcm6490-fairphone-fp5 UFS.

---
Changes in v5:
- Try to get patch tags in order
- Drop patch reordering clocks/clock-names in dt-bindings example (Rob)
- Use QCOM_ICC_TAG_ALWAYS for interconnect (Konrad)
- Add missing interconnect-names (Luca)
- Fix sorting of ufs nodes, place at correct location (Luca)
- Provide ufs_mem_phy clock to gcc node (Luca)
- Add missing power-domain to ufs_mem_phy (Luca)
- Link to v4: https://lore.kernel.org/linux-arm-msm/20230929131936.29421-1-quic_nitirawa@quicinc.com/

---
Nitin Rawat (3):
      scsi: ufs: qcom: dt-bindings: Add SC7280 compatible string
      arm64: dts: qcom: sc7280: Add UFS nodes for sc7280 soc
      arm64: dts: qcom: sc7280: Add UFS nodes for sc7280 IDP board

 .../devicetree/bindings/ufs/qcom,ufs.yaml          |  2 +
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           | 19 ++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi               | 74 +++++++++++++++++++++-
 3 files changed, 94 insertions(+), 1 deletion(-)
---
base-commit: ce733604ab13d907655fd76ef5be55d16bbd0f8c
change-id: 20231204-sc7280-ufs-b1e746ea60ed

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


