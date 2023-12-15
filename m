Return-Path: <linux-arm-msm+bounces-4947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 03422814F00
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Dec 2023 18:42:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E95E1F24417
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Dec 2023 17:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA35A82EE1;
	Fri, 15 Dec 2023 17:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bZ35UHN8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206EE30106
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Dec 2023 17:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-50c222a022dso1046739e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Dec 2023 09:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702662115; x=1703266915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9MFpXjQvg3NlP9wLRekls4ujIRGwU6ojDDoMRGZZgfg=;
        b=bZ35UHN8zWbwRk48wSN/1GeqVA+2l1llFS/7D2tIRVfTd67KS/tBBW5MHK1M0Wj+KP
         RvjovJucvFoTHUCSSbYHxalZcGDo9gLzmPtfqL76lMlZ2GZaYzlsUQp3cg6vqCOZkDvn
         faZNFU8srktnqMBQtGRXd8ZLDpV2iluC9SXkMx+csG12PLmmiZD68Llpo4hGqou9mx2Y
         LLOoPtTT/1Qc8Jhk+YOpcEd5Z4WxQ8VsrSZs04ilk5ccD6PevYpISAIY302nq+42yMxJ
         Fj+v4+5bvXnDP2vxQgSr7JcpibzB2YswYu2iv6won6JneqoNysfcijqlBsayz78sIvUA
         7bjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702662115; x=1703266915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9MFpXjQvg3NlP9wLRekls4ujIRGwU6ojDDoMRGZZgfg=;
        b=WC7ZIvmUj2AVwwqK0rhQH/5lOv0Y4gWi/z1kayVnJnpwxyg4Qrtwu/3vTqBuLOfA4X
         4RgR4jwIwS2ItrjyIm12V0XhFv4F3q2CNsCNkNUvYin8aN4YMNaZd1axXhxfMBmN/Rp4
         6tHBgaqbePJ0mNHw/m34weIL2nZiGfTCmAYn62DRfWJVqz0sYR7yphaYStkRuM8EU4NI
         torvLfPTeaOQ+sevfoWlsZhkavgxZsa1+ynwtcrk1UoiG8WHtAxHgRXcW3hOLZlhlmSg
         ynqE/Njb7QJ4xG6cN3IFt79nZIySvjSrkl/0ubkCKZL0HB7DQb3m04LnwAQHXBIR6F5v
         zn7w==
X-Gm-Message-State: AOJu0YySkRCjUhFv9AgQeepweGW5dl+AqUJaoIN4pNRiFeXNGYDa7HvR
	tS/P9MLm4YtGf9XUx4oFN21JgA==
X-Google-Smtp-Source: AGHT+IFBxk4egs4dHqlwd+v+BrIEFKFxf4nHJ6mGiQE0K8RfcbD92HVmrtjH6AoZmLBaRV9aiQbA5g==
X-Received: by 2002:ac2:4341:0:b0:50b:f334:136d with SMTP id o1-20020ac24341000000b0050bf334136dmr5265951lfl.50.1702662114997;
        Fri, 15 Dec 2023 09:41:54 -0800 (PST)
Received: from eriador.lumag.spb.ru (85-76-13-188-nat.elisa-mobile.fi. [85.76.13.188])
        by smtp.gmail.com with ESMTPSA id c16-20020a056512239000b0050dff5bb793sm1389263lfv.143.2023.12.15.09.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 09:41:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 0/7] arm64: dts: qcom: sm8150-hdk: enable display output
Date: Fri, 15 Dec 2023 19:40:32 +0200
Message-ID: <20231215174152.315403-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Enable display output on the SM8150 HDK device. This includes HDMI
output through the onboard DSI-HDMI bridge and DP output on the USB-C
port.

Changes since v2
- Rebased on top of linux-next
- Dropped applied patches

Changes since v1
- Dropped irrelevant stats patch
- Fixed endpoint stye (Konrad)
- Changed SVID from u32 to 16-bits value (Konrad)

Dmitry Baryshkov (7):
  arm64: dts: qcom: sm8150: make dispcc cast minimal vote on MMCX
  arm64: dts: qcom: sm8150-hdk: enable HDMI output
  arm64: dts: qcom: sm8150-hdk: fix SS USB regulators
  arm64: dts: qcom: sm8150: add DisplayPort controller
  arm64: dts: qcom: sm8150: add USB-C ports to the USB+DP QMP PHY
  arm64: dts: qcom: sm8150: add USB-C ports to the OTG USB host
  arm64: dts: qcom: sm8150-hdk: enable DisplayPort and USB-C altmode

 arch/arm64/boot/dts/qcom/sm8150-hdk.dts | 264 +++++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8150.dtsi    | 133 ++++++++++++
 2 files changed, 387 insertions(+), 10 deletions(-)

-- 
2.43.0


