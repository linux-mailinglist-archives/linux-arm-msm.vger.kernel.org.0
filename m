Return-Path: <linux-arm-msm+bounces-38212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 520CF9D0EA4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 11:35:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F9201F21CB3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 10:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B2BE1946DF;
	Mon, 18 Nov 2024 10:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y3YuTPuS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145461DFFB
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Nov 2024 10:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731926078; cv=none; b=XOfAFUvwCp2ZQj6q+Nycd6mQUYAOhPDTjJ2JSY+P+t+BQ2Lg+CUADLwXJvtfNdDdTscVlAAXkzdEGurrkuQtRvHdlDNyCimLJpfT/oeOITY5UQcbodICUzR1p3EoG1Sl7JpaUDfZSPM5UcVM284cIH1hhmopB/WiEPxNq9VF4pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731926078; c=relaxed/simple;
	bh=1hzvf0YnG1GK5VmFfu7fUVYkXt5PuJgTUsR7YbCEhwg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hc++rW91abZHn2P57BRcXe+W3WRYSdVbNPJeXM7NzxLcqwZ0ZXt0oLkW5gYRGW/QVQLs9ah9NscLi3IE5wNpwZ+aRmip0TMRL9/ZKJHf1UBAHirUYL+Ogg441mPdEOHdfEzSpH0ICl4TPtb8mlC8STJow2iHi3M5L6ptonymkOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y3YuTPuS; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43161e7bb25so33014655e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Nov 2024 02:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731926075; x=1732530875; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3VAHDTdSdnUcjMrmzQom8uUSDOBZ2weSAUyUK6y+NhY=;
        b=y3YuTPuSJb6ZzY+5rXpkoCTuaVjNLnsXpoId3k2LB6klKUil6/iduT6FQD7MbJ6iVG
         cfSrd3Lfu30Ed+VGKQyTKElb6KSgllgKfTkIv1gCsDbY7bUtJxiJIOYX1UAD4rQ73m3W
         ps0QIPEhI+Z86BvsILbz2YbNbAkUGDXjE8qtO8yxzKFtSssmiYDZPIwp2F8dwGR1K0Ik
         2oSsmAklXcJmiGxqGAnTrL8obmg2RR3TDGHCVXWTXqboAbXXWs9m1DN9OQHY/pmT0xx3
         YTpTFavfZi+A4tstO+RwFTmL6G9S13mbickDzMNdeZYgLxb4iOzrK+tj4IjjG4xVBpH0
         r8eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731926075; x=1732530875;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3VAHDTdSdnUcjMrmzQom8uUSDOBZ2weSAUyUK6y+NhY=;
        b=BSbJuTepjazRkauiT7EcnWoiy+6lwV1iVzl3X1jVzEQfxYQyeO0ZNB6cnYpBwKthug
         /2HrtLa4wo0qGQp8XkATE2FpQvj0snpHJgr7+XWcBqq6RLh/KCNwmNf3ouoqBwBLGPCU
         xdt3L+LVK80OcDD9EumGvsNQFOsIbNByfLwhhZDM+qPGnbfBWAbWArDAZnpzLDm/bcXe
         +oyJl1grZGgs3/Sv+VyuWNqkjTWbZwn5bgoU/ymIc7FuittPXvD9RJ3e5Y8KGanbHOYO
         S8ZhKBMFFOD5BNFvV1qPbd65J+6eAZblwMQrUIe+3uPVTLWNxd3wXBS8Tk2/ofHBlGSg
         ZjXA==
X-Forwarded-Encrypted: i=1; AJvYcCVgBrqj3fa6xFZkU6PIScR7KSx0iPK8VAvynQ0W2yovJbMvf6AOhFaGyaVmmh/qXhTgyI+QZwWAYaLIPE6a@vger.kernel.org
X-Gm-Message-State: AOJu0YwfxwSTQkgAtl6gEIar5sCrQJYfJ809C+yQdcvsCIvRVM7mv8LS
	VdFzWNQjfsu5oPRk1h8DpLSWzmMaAYWoUaDhvwJisqCN/cw/kSy/erJAXNZHSw0=
X-Google-Smtp-Source: AGHT+IFxjSgWOZeMwBydjHIA/ty6oUxOJKnYUIUmBh0PHN55/0Q67i27jFciZxiAhLtnxqrGR+4o4w==
X-Received: by 2002:a05:600c:35d1:b0:431:6153:a258 with SMTP id 5b1f17b1804b1-432df72c1cfmr100625065e9.13.1731926075377;
        Mon, 18 Nov 2024 02:34:35 -0800 (PST)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef40:5b7a:75b3:1e72:6e3d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38245e95925sm3162979f8f.111.2024.11.18.02.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 02:34:35 -0800 (PST)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: [PATCH 0/2] arm64: dts: qcom: x1e80100-crd: Add USB multiport
 fingerprint reader
Date: Mon, 18 Nov 2024 11:34:28 +0100
Message-Id: <20241118-x1e80100-crd-fp-v1-0-ec6b553a2e53@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADQYO2cC/x3MTQqAIBBA4avIrBtwpB/rKtFCdKrZWChEIN49a
 fkt3iuQOQlnWFSBxI9kuWIDdQr86eLBKKEZjDY9EQ34EltNWqNPAfcbrTXWezdPYRyhVXfiXd7
 /uG61fg4ipKFhAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>
X-Mailer: b4 0.13.0

The X1E80100 CRD has a Goodix fingerprint reader connected to the USB
multiport controller. Set it up in the device tree and enable the needed
driver for the NXP PTN3222 eUSB2 to USB2 redriver in the arm64 defconfig.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
Stephan Gerhold (2):
      arm64: dts: qcom: x1e80100-crd: Add USB multiport fingerprint reader
      arm64: defconfig: enable NXP PTN3222 eUSB2 to USB2 redriver driver

 arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 48 +++++++++++++++++++++++++++++++
 arch/arm64/configs/defconfig              |  1 +
 2 files changed, 49 insertions(+)
---
base-commit: 30eb6f0b08b13fd25ea12a3a6fa0a85915190c1c
change-id: 20241115-x1e80100-crd-fp-8828cca97d66

Best regards,
-- 
Stephan Gerhold <stephan.gerhold@linaro.org>


