Return-Path: <linux-arm-msm+bounces-23287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF7890F786
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 22:33:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD40E1C21F8C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 20:33:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6A27159217;
	Wed, 19 Jun 2024 20:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tq7I3SNC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912C776413
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2024 20:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718829226; cv=none; b=hIA18I7s6Qu/Z9/Av5GtvxDQPS7UchTauvMdIGodG3fPQkWxab7zGgE+jljy8SUZgCKrIHwKTQUscU2TIjWvAoXvFJ/N4ZohKNNWvZVGKDY7dyFJ4yW9v8YB0t9kZASD2HCEErqUOPEIwg+iSQ3Fh3UR71/n2DZsQAtsSOJjJPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718829226; c=relaxed/simple;
	bh=qImAjsrmLtrVzJyG8Uq9rBw7JoPJ325Whir1taHMzVY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=F2zWwkg0XofBYHKBTs7Zdj4dtnT3W4WwxljqpuykXCHRIohVsYFmU+DMQ4hjfcifDLTQUgVXfLT+YL3ahEFqNAzF+d03ueylsCgsKvnzK6NGO8BsZ32e4dlOHKp3C/Nw04aOal5F0P18CBXSazKtuduaNJ9JBseiU1HK1DMmnAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tq7I3SNC; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a6fb341a7f2so20690566b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2024 13:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718829222; x=1719434022; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vy49KOgoUbZsfE+FLv8AvrEpvyiW/UKTvA43K2de4KY=;
        b=Tq7I3SNCmLJRYWYKhzV+UQ7bCXOdT06ovPzkC4U5WPVZOcvRW3M95D8vLkBQxWcRHp
         AHMB4bHbEznHLzf59aKNj680CUEILwaedMhQzZGHo3FTbKsYnDA5CuJQ2zOlegGd+/q/
         cpecx+SkYAUZlYptGAJY8++VX3X3/lJEarNjKZQ1nShoGS3ANp1k6MPueqJNQGZgBsWf
         NKIXFml0HnPMUYUMtb/LQBDoHcXKKOYh6M+o/JyYAW9H3G18p3CQd1Vx8kcFLrNHfFww
         ZdHo+w9Oop3Le8tE8JsluoY8PFrc5FLuXEEgXmNBfAlZkXfgA7dkAhfF5gL/fr0WE49Q
         Fq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718829222; x=1719434022;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vy49KOgoUbZsfE+FLv8AvrEpvyiW/UKTvA43K2de4KY=;
        b=V3rxK3bvzDzO3Wz9ShV2YNAQgRP8uFw3cC0RFEOa/RgGalcgOhxT97LYJf/AkrQPK8
         wPvyCzlcOb6V7iZrE3k/OdMomyXdUL+ANxHAWsFDz82kHrm+B8FxFVA7vlb7W7s5wwMw
         sHRl5E+Wzz4LmPxyOsC2h85E2LfKBtPlp7V2LYFLGinaBoAhyvo2PxgSeAw8dUVAm6Um
         LRSwqIKV7ncAtC2W22rKJs9NxMAzTnjLC7l41/Q6N19HfSnqutYVWwyfQ5xPDjvYsExq
         pty0hCli2kvAjavWrRKaXCxmMGe9UQAb17AKUuxyzXu+ZrU3UgaMyKYQOI2zio+5ioWX
         DKgw==
X-Forwarded-Encrypted: i=1; AJvYcCVtt/mYUrrZv5q7eW0FNtexMsWyZRFw9dIpK5VQZApqOR/nr29UNXFA0d8Npw5QKKq5xAqmRnKbtJKTr2dfQVpEO5rs8Pk0v1HeNtQb2g==
X-Gm-Message-State: AOJu0YySDsqW5z3PqCcVSDT91z4ETZoGhSgTR+ZtgEbaLdjGhYFd20z7
	7EN3CFNGrXSTEExuezCdq6MRLUYe4Kji1wcNnYbhdVT9umVS3hmdfcJ295T6RyM=
X-Google-Smtp-Source: AGHT+IGNAjm5L3Ry0EbeoxMzOrwd2ri2vDUMwcMBgmHJuurwI4hW2+qjMtFL9gXaSx7VPl1+9kD7eQ==
X-Received: by 2002:a17:907:a649:b0:a6f:bfb8:1ccb with SMTP id a640c23a62f3a-a6fbfb81d45mr23532966b.50.1718829221642;
        Wed, 19 Jun 2024 13:33:41 -0700 (PDT)
Received: from [192.168.0.113] ([2a02:8109:aa0d:be00::ebdd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56db5c3dsm696864866b.55.2024.06.19.13.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 13:33:41 -0700 (PDT)
From: Caleb Connolly <caleb.connolly@linaro.org>
Subject: [PATCH 0/2] qcom: dts: qrb4210-rb2 usb/emmc fixes
Date: Wed, 19 Jun 2024 22:33:37 +0200
Message-Id: <20240619-rb2-fixes-v1-0-1d2b1d711969@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKFAc2YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDM0NL3aIkI920zIrUYl1LkzQjk0QDSwOLFEMloPqColSwBFB5dGxtLQD
 uIz6tWwAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, Caleb Connolly <caleb.connolly@linaro.org>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1247;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=qImAjsrmLtrVzJyG8Uq9rBw7JoPJ325Whir1taHMzVY=;
 b=owEBbQKS/ZANAwAIAQWDMSsZX2S2AcsmYgBmc0CkU1IfSe4fJOaudUg+7qGLq5TY4gFaRb9Nj
 U0Qoz9sOhyJAjMEAAEIAB0WIQS2UaFGPGq+0GkMVc0FgzErGV9ktgUCZnNApAAKCRAFgzErGV9k
 tpu8EACcEvAsRH8HcdI2QF5YsFGYUM7CMKZr4fTtilwCWCx/stDoHf8+KYdWNnmLRK5nPtU7RWe
 Y75f1aPTtkFWjCDDQLPh9n15DGBD9G0C6YSewd3cdrf3+KntQ3FxlgjsJ7AJFUYj+bnP/rqTy7h
 vP5YV+PAG9Ssqig77kd/q+acmnvtdIu6kQJEt2WgH4cWYcrBhIWPauElPetdrUjJdNEOPLVIHYp
 +MkIePJN8jCuK5PcZouRXG3Sl68aDRdIuZOIHYyXtshpe9jK0yYM9p5+2PBFBoVteTZ1xU3pJQP
 uXbFSAiTNSQwv4+rpV7Tgou7d1pg0PNOds8rVUsTuqdd+HAAb5ZRIlQHAaBefAyWubs9raOxKx4
 cAIkKH5QqHxaOb1/kKJdYYFTyvS7Yfc7CCxWm6xM/TERr5FBHzdC4BtVdxswO4niWV9ZzkmaNAC
 BT12sfwfahxaWkFJlCyyRAWvAp7zqRXQGVAOlErjc0LnRKwfff0MbYFA35wli4QMTp+y4W7cBG9
 cSTpS5fMzhS2GU5jwp14Gb/Yf5DawmLEGA2/mQ8vpyi6hF2Vx6ZLant5IbL0N7IFlSrlngsaixZ
 uvhd6QT8CEvVRNHmqqXc6V4kD14+RJUJ9qEztRYWy/dRGCzKlCbk85i+9k8BsTASegBxXjhATm8
 kELBedKY0kfc1vw==
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47

Add the missing iommus property on the first sdhc, and set a default
mode for USB role switch. The iommus property in particular is necessary
when running U-Boot as a first-stage bootloader, since it can't rely on
EDK2 to configure the SMMU and crashes with:

[020b9ed0d]TLB Dump Message:Not a valid memory address to dump TLBs for device APPS_TCU or no memory available.
[020b9f533]SMMU GLOBAL TCU NON-SEC FAULT: bit mask=0x00002000
[020b9fb23]SMMU:>> APPS_TCU NonSec Global Fault:
[020b9ff9f] NSGFSR=0x80000002
[020ba0404] NSGFAR=0x00000000bf6c6800
[020ba0909] NSGFSYNR0=0x00000000
[020ba0d1b] NSGFSYNR1=0x00c000c0
[020ba117d] NSGFSYNR2=0x00000000
[020ba15a9] NSCR0=0x00200406

The GFSYNR1 register in particular clues us in to the stream ID of the
peripherals, in this case 0x00c0 corresponds to the first SDHC.

---
Caleb Connolly (2):
      arm64: dts: qcom: sm6115: add iommu for sdhc_1
      arm64: dts: qcom: qrb4210-rb2: set role-switch-default-mode

 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 4 ++++
 arch/arm64/boot/dts/qcom/sm6115.dtsi     | 1 +
 2 files changed, 5 insertions(+)
---
change-id: 20240619-rb2-fixes-94f24a0908d1
base-commit: 63072efe1495d9d42546b10b46f2c063ec8db3ce

// Caleb (they/them)


