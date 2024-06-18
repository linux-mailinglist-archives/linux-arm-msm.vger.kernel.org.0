Return-Path: <linux-arm-msm+bounces-23039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAE990D2E9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 15:56:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C2CF1C21087
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 13:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0C7B153837;
	Tue, 18 Jun 2024 13:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="P7Bvzv8P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B4215DBA0
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 13:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718717470; cv=none; b=CimFbnCYxKfQammtAnz7kxZ+gD8dmt7VTyRI8otVB3EzDKOBpnFSJ3suOnZdyCE5dT8vZa7QUVdwaYGVxGwSzn6tpz8BSh0L3JE5k4HNSnQU/Y0VL1P2oG+4iR7/5rVppdaZ22GTyd3JvoT1x7QIXkX98i1aLEKKrWbdRZIeKzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718717470; c=relaxed/simple;
	bh=9dL3D/FY2UQlJeFNSfOZwIBirUv1VOhd/HW8NFB4Hik=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=K2PiLY/u20e/WG1tx/FYisrEEESgVJ/UuYnK2xPzT3QlvbslN+0vS6JCqj6T3W0r0g7BmEStC2nk8zACq+Fc9gwCINWFIpuAc9VaAgARciL5dCiefgfQ7E2bYR07PhjQLwdiQ+rGGqMwyYcRZZRu6bwvwHjaOvUu5mPiAk8aBIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=P7Bvzv8P; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-57a30dbdb7fso9663102a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 06:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1718717466; x=1719322266; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MgII99Py7AejfkT5wEBcEQing1ENE+rjGC2Yt+MvufI=;
        b=P7Bvzv8PNGe9+6bUt3g+qbw0O612DzUGQSRIoZ1a/PoHivkFmEHPYPfP4yQL5SEcPM
         bPH8IhFeDPBpbjxGV/x/Wi8Fi7N0sZWJkqb0p9HWjMHzCA6csfgQYTo7oaPMQbdpmURx
         ssWLSoFheogVXIo5qVmOQoct70v5bVH1ZeR7mewgZO3CYzGC0TNAfS0S9iVKLZ5fc90E
         +2Jp26QPds9q7cSD6u2hLQgrGVE8c37I8fWeNrE9QbDGlZuy00nnxdV54BqPi2N0OpNI
         GG6Syl0NIzOnn1zqWprCHHCgMG3VIzEwFDQYv10q3R3FZqOpqfojzDj3/1LjMkadoTF7
         KrEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718717466; x=1719322266;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MgII99Py7AejfkT5wEBcEQing1ENE+rjGC2Yt+MvufI=;
        b=etUp2+Yh6y59u1k3H5PtEH4optky9sT+0LyR1z7pOAUyc62XHRSI3mFDlZxrwzCvL7
         2iQzr472dHkFvGa8L/j4r3CCwff0LHHquphhQSZYhU65tXKpFyYmETdpwYydwijxHajK
         3+2dVQgdhIHCqqOEObrVOmm8/c+C1VNfq8hX9y4zUtDoSlRB7eltLa/ui3X8H9b56/zN
         fTbUsQveC873iEFzIO1F1DE+EskzaTzSgPJ0jQsJcBA2zUBtw+XzmoqmqQkby77YY+o6
         XVPUKivCi705ShfKRI9m4qE0/EzSPkZ6JcUl3YhW0GZF0MMCpQ5j93kpkgcm2TxZoKkY
         LCqA==
X-Forwarded-Encrypted: i=1; AJvYcCXuigsIpxuRUotCrzynvxyMuW7RdvBFdQBMS661una/A7sRLixQrf9I2vhy/L1yIb1wG/lZdWD/dIGOAIPU3vHJEdFNUJFqXOcZLLxBow==
X-Gm-Message-State: AOJu0YyvjSH8K7ud/c8M/b7ersC3ep1Ey+ECx3ehO7X3cLfTqMVCkmqU
	MsUb0d/6L+RpSWtY+N0IuMqYhMCchwKp71YSdSC65/5MVSgFtbzwsf37imraCzk=
X-Google-Smtp-Source: AGHT+IHfSXaYJLdelb204AVXLxNCDDXv09yJDE8i/s7J2Hl0+SN5774Er0lO3roZCzYdJRKnKiCRpA==
X-Received: by 2002:a50:9b18:0:b0:57a:2e93:fe80 with SMTP id 4fb4d7f45d1cf-57cbd66349bmr7978378a12.18.1718717466497;
        Tue, 18 Jun 2024 06:31:06 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cb72ce12fsm7774862a12.7.2024.06.18.06.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 06:31:06 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/2] Name the regulators for QCM6490 Fairphone 5 &
 SHIFTphone 8
Date: Tue, 18 Jun 2024 15:30:53 +0200
Message-Id: <20240618-qcm6490-regulator-name-v1-0-69fa05e9f58e@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA2McWYC/x3MTQ5AMBBA4avIrE3SNv6vIhbFYBKKKSIRd9dYf
 ov3HvAkTB6q6AGhiz2vLkDHEXSTdSMh98FglElUpgvcuyVLSoVC4znbYxV0diFse6NsMeg8TzW
 EeBMa+P7HdfO+H4ZrX0hoAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Caleb Connolly <caleb@postmarketos.org>, 
 Alexander Martinz <amartinz@shiftphones.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.0

As per individual commit messages:

Without explicitly specifying names for the regulators they are named
based on the DeviceTree node name. This results in multiple regulators
with the same name, making debug prints and regulator_summary impossible
to reason about.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (2):
      arm64: dts: qcom: qcm6490-fairphone-fp5: Name the regulators
      arm64: dts: qcom: qcm6490-shift-otter: Name the regulators

 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 35 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts   | 35 ++++++++++++++++++++++
 2 files changed, 70 insertions(+)
---
base-commit: 76db4c64526c5e8ba0f56ad3d890dce8f9b00bbc
change-id: 20240618-qcm6490-regulator-name-bd20a8f17751

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


