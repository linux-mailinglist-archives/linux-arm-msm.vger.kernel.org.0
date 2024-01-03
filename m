Return-Path: <linux-arm-msm+bounces-6397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C11F823643
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jan 2024 21:16:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E475C1F25CF7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jan 2024 20:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBEFC1D54E;
	Wed,  3 Jan 2024 20:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XmGrxayA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB181D529
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jan 2024 20:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5569472f775so2329752a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jan 2024 12:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704312949; x=1704917749; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=frlFf1yHOjc2m+3mY9Ype8aRhYMmKV1ncn5sHLfJ7ZM=;
        b=XmGrxayAYdH+LAtDTAoX34mbYD6YqhesdUg5fgLUR1Kfz4yn8uSquR8Oa3PKuIKRnt
         QYoOKMsHp4vPJgQxSdLm5dNWFlimWF2O2sp38vO8p5kC3pSN2v/WVyig9/uMDX4cmIks
         ng09apJbn+9eokXw8Q8snuKO1bxqz0rNe9kGrbH/yOuLwg4mtFGQWCsmPKV8qRY9Lp1e
         +m9JprjepEEPH7u2uqIdyN7uKhRD4al/b0fG2NoYYWr2N/xS08rwJYn+AZzUIOKT1B9U
         UDzTI+6ekGB4UCx7T5cvvmVNTWteXMh2LmZrEtgZZUGYE3oQiVfXGZi7qo0x92+06bp9
         oamg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704312949; x=1704917749;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=frlFf1yHOjc2m+3mY9Ype8aRhYMmKV1ncn5sHLfJ7ZM=;
        b=wSKQH4YPWqgxgCuVLRExplbygZg9d23rV/jM2X1xlKAhUovNKJLMJz/p4oz6DQnoXd
         Zs428OGF1dP3XeEjEr4XmRGKjuUK6JwS0nQMy1lxSMFg0T+puHT2m6WrvIEORZaEiTvt
         3O0m/KiZ8Iri4kfXT2CCUDFoNK+ZBPtj1jOY+oo1og0IJZkByUj6nI1FHK5lrGQw3rN3
         6+SnvsqRveOkMnlufDAgWyx2p9pKHGzQDVHNtDZIyIhGRF/x2/vtJopFXN513Z2hOHJ5
         2JveC2vZgCX+w6p0o5nCiP2cI1HtZ9GctkE47cnHg1EAyQyuqh5Vi1E4p4iuFjS2fReF
         u9KQ==
X-Gm-Message-State: AOJu0YwAK22IIoDAC2W9hOuoBJBaJ774IRRicOkOZ8iO7NbztnGhMQlK
	nxb6tgIi4BR7HsG/Uya42vECF9wv4AD/WQ==
X-Google-Smtp-Source: AGHT+IHI1e7hObhlPJSqBvpniGp/xexsUfJDGAmkLRU+mdenWzNbbOf1Ytgo9zslEzVVEt/FA2JVYA==
X-Received: by 2002:a50:cd56:0:b0:54b:5a6:d083 with SMTP id d22-20020a50cd56000000b0054b05a6d083mr11064235edj.11.1704312949058;
        Wed, 03 Jan 2024 12:15:49 -0800 (PST)
Received: from [10.167.154.1] (178235179036.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.36])
        by smtp.gmail.com with ESMTPSA id fg9-20020a056402548900b00552691fc7f9sm17549670edb.66.2024.01.03.12.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 12:15:48 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v3 0/9] Clean up RPM bus clocks remnants
Date: Wed, 03 Jan 2024 21:15:30 +0100
Message-Id: <20230721-topic-rpm_clk_cleanup-v3-0-a66e698932e3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGLAlWUC/42Nyw6CMBREf4V0bU1vsRhd+R/GmL6ARmybW2g0h
 H+3sHOli1mcSebMTJJFZxM5VzNBm11ywReodxXRvfSdpc4UJpzxmh050DFEpynG510PjxIr/RQ
 pKN4eJEhtGJCyVTJZqlB63Ze1n4ahlBFt617b2fVWuHdpDPjevjOs7a+bDJRR3TbaCN1wMOIyO
 C8x7AN2ZFVm/peGFw1YwRpxqhUo86VZluUD7LJLWhcBAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704312946; l=2657;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=vcpSnXL4yowR+xiN+vXBWoVr/0DyVhhGOHn3Jv5gA4A=;
 b=QDSEbOyON0M80R7etdM2PmkFfnsciPE+y+b2cOkUUrYFzgcH4/vcB+t1LiigLdpDNhq3nYTAu
 2OsohE6UBxFDFPbFKQi56Mvu+AVGNdnbDaegOdZqXPF5HrT9hE/xjKu
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

After the recent cleanups ([1], [2]) some in-tree abusers that directly
accessed the RPM bus clocks, effectively circumventing and working
against the efforts of the interconnect framework, were found.

Patches 1-5 drop deprecated references and the rest attempt to stop
direct bus clock abuses.

Depends on [2].

8996 and 8998 remoteproc changes were not tested, they never worked on
my Sony phones.

[1] https://lore.kernel.org/linux-arm-msm/20230526-topic-smd_icc-v7-0-09c78c175546@linaro.org/
[2] https://lore.kernel.org/linux-arm-msm/20230721-topic-icc_bindings-v1-0-93e2bc728fb7@linaro.org/

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Changes in v3:
- Rebase on next-20240103, drop applied patches
- Drop "sdm630: Fix USB2 clock-names order", Krzysztof fixed it in meantime
- Improve the commit messages
- Pick up tags
- Link to v2: https://lore.kernel.org/r/20230721-topic-rpm_clk_cleanup-v2-0-1e506593b1bd@linaro.org

Changes in v2:
- Incorporate [3] into the sdm630 patch, add required bindings fixes
- dt-bindings: remoteproc: qcom,adsp: Remove AGGRE2 clock: Merge entries (krzk)
- Pick up a-b (krzk)
- Add "sdm630: Fix USB2 clock-names order"
- Link to v1: https://lore.kernel.org/r/20230721-topic-rpm_clk_cleanup-v1-0-cf6cd5c621d5@linaro.org

[3] https://lore.kernel.org/linux-arm-msm/20230719073520.2644966-1-alexeymin@postmarketos.org/#t

---
Konrad Dybcio (9):
      dt-bindings: usb: qcom,dwc3: Fix SDM660 clock description
      arm64: dts: qcom: msm8916: Drop RPM bus clocks
      arm64: dts: qcom: msm8996: Drop RPM bus clocks
      arm64: dts: qcom: qcs404: Drop RPM bus clocks
      arm64: dts: qcom: sdm630: Drop RPM bus clocks
      arm64: dts: qcom: msm8939: Drop RPM bus clocks
      arm64: dts: qcom: msm8998: Remove AGGRE2 clock from SLPI
      arm64: dts: qcom: msm8996: Remove AGGRE2 clock from SLPI
      arm64: dts: qcom: msm8996: Remove PNoC clock from MSS

 .../devicetree/bindings/usb/qcom,dwc3.yaml         |  6 +--
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |  9 ----
 arch/arm64/boot/dts/qcom/msm8939.dtsi              | 12 -----
 arch/arm64/boot/dts/qcom/msm8996.dtsi              | 43 ++++++------------
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |  5 +-
 arch/arm64/boot/dts/qcom/qcs404.dtsi               |  9 ----
 arch/arm64/boot/dts/qcom/sdm630.dtsi               | 53 +++++-----------------
 7 files changed, 30 insertions(+), 107 deletions(-)
---
base-commit: 0fef202ac2f8e6d9ad21aead648278f1226b9053
change-id: 20230721-topic-rpm_clk_cleanup-1b2f4a1acd01

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>


