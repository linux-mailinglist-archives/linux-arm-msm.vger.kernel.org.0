Return-Path: <linux-arm-msm+bounces-69727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EA2B2BF37
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 12:45:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 093B662412C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 10:45:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6EB2322C9A;
	Tue, 19 Aug 2025 10:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yNdWiFUz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0792B31E0F7
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 10:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755600336; cv=none; b=fNMU3HvaH4+ueCom72vuLDNVoRETLWO4cAStMUwV8uy9a7eePbTfqjFZq16NJweyKcrxgZB/pUY53DxrQoO2ZYYataf6tbhJNEsbAksw/2nkYHbKQn39zrEOKkKs6cUN2HVXkoAPILvwlHLEMYRJN9zMDfvLFCJZvVQYlWKrvyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755600336; c=relaxed/simple;
	bh=srvPrC1JK0qW61ub18KnsWGYmn7bzRookUdUKos6k1Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Wss4hjtKjhpTtGHxCbpDo8RwMpM4A8iWksA6DRucnWKl7LQQWutMGWOtaV+HEZ4O296ImLonHMNuDsDz5CMu2GCRfX/028Jx3yw9zh+PFrNnt+xT/ZLujEWsEFDX5yrONUqDq04so9nstTtJCmUATkYYOHpDBj5Agy/G7VMdENI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yNdWiFUz; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6188b73bef3so9272045a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 03:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755600332; x=1756205132; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ADpONCKs2zaxxcvWpaBvOs2jtqKsQk18cnjVSxwOzus=;
        b=yNdWiFUzt+tERwwcPfawmKANz2MnKPgWT/aTsOU/jUvMli6SHB3jLpz8G7iw90f4w7
         djAPBfGm8dybu9mvjRPJv6oTigWuM9yM5aXIHvX1fI3DmvEsns+MvBjltIQXbNnYA3HE
         yon1sn8+4jkuzhaqfSgxMmI1j7cDGJOQN/fqHNUeyLsNQpTCs2zlaA9lanX94PS3B6/Y
         K6ItCPY6c6g3Lzh5Tm5j2qEbPYhN7WTeWvB5ke3Z68pyG8S1ti6ob+y8AD6HuKVQM+ZU
         CALsEzi4vQAUtzHASXKDlQBnp+uGAkoQhJxdd+Yo0jzmwUPImIVHraNf9xs6/IsLHjfm
         nI3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755600332; x=1756205132;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ADpONCKs2zaxxcvWpaBvOs2jtqKsQk18cnjVSxwOzus=;
        b=k3iPXLwYBx1tOcvdUdLsKp3Rg7d3NFtoDu7Iyiq5eF1Ei7hvgUaq75Xgg8+ERw0mpK
         id0mQMukjD6JgnhsjnHG47ZGsc6hXXNXKs1mf8Hr0W73dH1VE04cfHUfZefKs3HffTPB
         3gjyChRvWCZ8dYz4P4oLbjMlR5PihVPlw+M/h/HQAdmPdFTHAMf/wcKBR0IfjoiNiuM4
         I/JOqlaoboA3ks2q/b9YiNDS/PBk5xpQqhLSEh99lBjF5VacRz00ObCE+65rGxg+aEYg
         0RTGXfQ0YStqWbX4JNHzA92f3t901S6OtKy2ufWIy2qeyxxz9a7UQ9ln5kBMhVxV2Psw
         OXfw==
X-Forwarded-Encrypted: i=1; AJvYcCUhIcpXZg7cfApnmDGLWVyLgoWe6ncFBOAMY+PtEKPsepwKBnCMIR6UyCJHr69uY7PbP/iSQ9VhDpMJb7N/@vger.kernel.org
X-Gm-Message-State: AOJu0YzaVWHIKkGxRTDKHQcZXYjfg4npk93AexBuTjcw1yNFtgyCUzx/
	zOPIH0Llowf/eKvUyRKzsRm6dFHyEaG0gHQ51w51Pv3L/l/b2f5VZuX+0UclJ2Faf+c=
X-Gm-Gg: ASbGnctUaV9Sw3WCSCoIoZyfR/5Mjuc8u8/vARjPV/Lfg3rFbvOtt2YYWCmUataxJhA
	Y6QtqDmEKN7LWhubKsDssVm11RA17N/7g0wKy1czEbvo7uECmwfwto63fUkASUElJu0kvM2ZKE7
	ednfUv6x9fPoSGn1cc2tqIUl1AZMi2Er5k+DISFJvqe8Idqs2Utqk9aeK1JugU8r2ffHUgi1eHA
	ffTZMBiD7s0VTOnJObecc+qwi8nQ6/zOgxbeRwvSD7LGTS6Hh2c+1iU1CKRBTX1ACdD37R7ZNPp
	yviO9G/0I6MkPOsEzTjublQt3dDn2/tgMmnGzvlWo9onqAxrf6e0JbjEfDCw1F4bndMNmzwbRQy
	yzHCVfBboG12xgDH4zxQ0yapr4hvu/zF8RyaPbQ==
X-Google-Smtp-Source: AGHT+IG3ae4w4p7ZyujS6Du+A0Tt5ypqsp2f6nyJNDJAN8l0V2OexmG8NDk4i+wEkmKXaEkfAfuOmw==
X-Received: by 2002:a17:907:c27:b0:af9:495b:99e4 with SMTP id a640c23a62f3a-afddd23e778mr185716166b.60.1755600332120;
        Tue, 19 Aug 2025 03:45:32 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:db5f:8096:4609:9b24])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61a757a48e2sm1469787a12.40.2025.08.19.03.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 03:45:31 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: [PATCH 0/4] arm64: dts: qcom: x1: Fix swapped USB MP repeaters for
 boards with 2 ports
Date: Tue, 19 Aug 2025 12:45:19 +0200
Message-Id: <20250819-x1e80100-fix-usb-mp-repeaters-v1-0-0f8c186458d3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL9VpGgC/x3MQQrCQAxG4auUrA1kOs60eBVx0dpfzcI6JLUUS
 u/u4PKDx9vJYQqnS7OTYVXXz1wRTg3dX8P8BOtUTa20SfoQeQvoJYjwQzf++sjvwoaCYYE5xy7
 llPI5x6mj+iiG2v3/19tx/AC3rac4bwAAAA==
X-Change-ID: 20250813-x1e80100-fix-usb-mp-repeaters-3756556463d7
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Maud Spierings <maud_spierings@hotmail.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Johan Hovold <johan@kernel.org>
X-Mailer: b4 0.14.2

The &eusb3_repeater belongs to the first port of the USB MP controller and
the &eusb6_repeater belongs to the second. This is obvious if one looks at
e.g. the CRD or the Dell XPS where only the second port of the USB MP is
used: They only have the &eusb6_repeater and already specify it for the
&usb_mp_hsphy1.

Swap them for the affected boards with 2 ports to set the correct repeater
for each of the USB ports. Boards with just a single port used (CRD, Dell
XPS) are already correct.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
Stephan Gerhold (4):
      arm64: dts: qcom: x1e001de-devkit: Fix swapped USB MP repeaters
      arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s: Fix swapped USB MP repeaters
      arm64: dts: qcom: x1e80100-asus-vivobook-s15: Fix swapped USB MP repeaters
      arm64: dts: qcom: x1e80100-qcp: Fix swapped USB MP repeaters

 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts                | 4 ++--
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi | 4 ++--
 arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts     | 4 ++--
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts                   | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)
---
base-commit: 1aa50d938e88fcad1312467bd09be4037bfe68ff
change-id: 20250813-x1e80100-fix-usb-mp-repeaters-3756556463d7

Best regards,
-- 
Stephan Gerhold <stephan.gerhold@linaro.org>


