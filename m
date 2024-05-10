Return-Path: <linux-arm-msm+bounces-19684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F6C8C24CD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 14:27:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 813C21F25904
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 12:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E88F1304BF;
	Fri, 10 May 2024 12:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="azdVPd3C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EEE2D05D
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 12:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715344041; cv=none; b=oO2RBCdvNK/DS95DObVuj3E7z2F5RLUeZca/uvz5ND+TwoV2rO8EdrnCK/ECnuqEjBsdrHP1UCNTgPg/ACTa52ktl78Z0pepDGhV0XaAzDd1loGixrsrANmx3bOYuVQhDbihxlV5FjhBWkkCp9Hp9t/jakRnzZ5+JwQPFWVjkug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715344041; c=relaxed/simple;
	bh=zwoUvGtt8bR7O/tm8qgvxWbu42LmxBHM6kDQadbJ/Mk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Fzi9qDFI9PiZM1+VLzspAT/kVsiP7n0LoRGCAbIzhCQHt2rGMpVB/gZRgIJsq2fa1lrESFrIyyD5mTZAq/VqhzM+N10CQ5REzNqvtAQY41O38THKj7LSwNUix85ACAzRlhuvyQKAfyw0gFirykf6VKT5aLM6TNYQWmadV6bjGPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=azdVPd3C; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a59ad344f7dso413248466b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 05:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1715344038; x=1715948838; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7VruMYD1zjQvWIDk80k0vAzVCegGSSlfN6zB8dLNTHQ=;
        b=azdVPd3Cxr806UoTCs2EvDGqDCjlLDEIiqAsugQvmJASePkDxVSLB3V1w8ECL66QAE
         BQ/JPnugOpEOUga0ncqcoWUQwtVaCYJj8WGQ/FtEXtUrKylfYxTTZNVGSoRew9+VqLGZ
         kPJSkDKgMwsfExweyIPtbVYhu8QkWw6qw772VSopTYWuGoD3BNv22jdK4NK/gGKwO/vo
         TnSWkdrUJ6GTG7Z7u04Y5QG2TfU33de3qG3Qvf50lV/97tV9xV97Dy5KKIOutJygTb7X
         58jA6pqOVcmIf57trOj/a4pqPXAykHgqtOgw6DcgVhsOKb4LjONThXaTSC+tNprF4yDH
         xWNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715344038; x=1715948838;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7VruMYD1zjQvWIDk80k0vAzVCegGSSlfN6zB8dLNTHQ=;
        b=tgdGdxJK7p8Z4XXqSQ9EInv/b+rLHN16tfMPCZxYj4pJ+2O8s7xQFwkXYZyh498wjK
         /Vha187VYW2Q7qhkRpSj8Xxz67JvHxFSZvdtg/26KiOL9UORQpAzGMcyGD9KPCuX61x3
         xIh1WRHZ8bsjTApCaDPir9bVt7dISbERONMLxZQPshBtenn0ZCNNOh0YgzVQDEv1f7wd
         ScFAxpV77hsS9zZlUTprHdF5OFQ9hElUoscAmjLE9HPxuxu4xwGffu790zR/1kWf2NPd
         lndl0o8HYbmiDO0ewZ+kC2CMa+9XjVs+VDoT8+1jY8WpuumEyl+y0F4sc9zeSHKNtq8E
         nAxw==
X-Forwarded-Encrypted: i=1; AJvYcCX6kc+Mn3s8O4PI5Znua2aSc7ZswFstWF4W1zXohnx5xFQNkxGFbOAsbFefjoa5UE4ahMK5W593rEVcJmnraBjHOz2+5mLPrBMIwzCa6g==
X-Gm-Message-State: AOJu0Yxv9XrR2Y6y6RvvG9uLVkxvdef/hj4RiZpmLsScrYKp+ueT+51Q
	1s7hl03feqG+LgHzMzEbbDA0c9ELwq50flyR8+OjaP0hgEIf+U/uB8zptl20pbk=
X-Google-Smtp-Source: AGHT+IEezwbfrvEBwi+SlgCUUtW/EelmADzFcHF3aaByCkdIQ+Qm0Y97BedFhhzkapiyHpHYC1aoYQ==
X-Received: by 2002:a17:906:f809:b0:a59:d063:f5f5 with SMTP id a640c23a62f3a-a5a2d681271mr144749166b.70.1715344037986;
        Fri, 10 May 2024 05:27:17 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (2a02-a210-20ba-5a00-9ceb-707b-2d57-26f7.cable.dynamic.v6.ziggo.nl. [2a02:a210:20ba:5a00:9ceb:707b:2d57:26f7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b017b1sm178043366b.181.2024.05.10.05.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 05:27:17 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/2] Add basic APR sound support for SC7280 SoC
Date: Fri, 10 May 2024 14:27:07 +0200
Message-Id: <20240510-sc7280-apr-v1-0-e9eabda05f85@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJsSPmYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDU0MD3eJkcyMLA93EgiLdZLMUQ4PEZKNkY2NDJaCGgqLUtMwKsGHRsbW
 1AF5grYRcAAAA
To: cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, 
 Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.13.0

Validated on Fairphone 5 (QCM6490) smartphone by using DisplayPort over
USB-C audio, connected to a TV, with a basic UCM to enable
'DISPLAY_PORT_RX Audio Mixer MultiMedia1':
https://gitlab.com/postmarketOS/pmaports/-/tree/master/device/testing/device-fairphone-fp5/ucm

Unfortunately all the device-specific things can't be enabled yet
upstream as detailed in the second patch, but the SoC parts should be
good to go.

As an extra note, I'm not sure how this will behave on SC7280 devices
that seem to use GPR (q6apm + q6prm) / "audioreach" as added in this
series from mid 2023 which was never applied:
https://lore.kernel.org/linux-arm-msm/20230616103534.4031331-1-quic_mohs@quicinc.com/

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (2):
      arm64: dts: qcom: sc7280: Add APR nodes for sound
      [DNM] arm64: dts: qcom: qcm6490-fairphone-fp5: Add DisplayPort sound support

 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 36 +++++++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi               | 73 ++++++++++++++++++++++
 2 files changed, 109 insertions(+)
---
base-commit: 940d65ef852b4a58c9115eb82b07844c999b8356
change-id: 20240510-sc7280-apr-c6d10ac2c331

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


