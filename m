Return-Path: <linux-arm-msm+bounces-49599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4116FA473BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 04:50:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06D071888455
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 03:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE0A4190497;
	Thu, 27 Feb 2025 03:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QX+U/c8p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2BB270031;
	Thu, 27 Feb 2025 03:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740628245; cv=none; b=gD/hX+bQ2qstsgnLEmANCmvcfCK2QJw8/5UkHS7o5hgcrVJjVSKEjNK+MoZ/GDSd+kFArL1JCbNGUz1Bj7MoXUIgsgXb4tkAQLLap6TyvjNWl0flE2Le8ShRQBBTTdJb3DpUOfoTTBLQjy65CS8ORYcSx+crTzf7AFELRzoWfPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740628245; c=relaxed/simple;
	bh=diBmsIdt1g2IxWsgz6gwbyI+69jveoJEE4GwmF5LsUM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jgaP/nkg03RP+GUUiv82nFUpb+793lpuOokjsGgpFnPrSpNpf92q8/vCzOqkakAcCzuKh+5DexVIOa5ssIxGZ2BHJnL1hPvC+lxBgRCh/yS+gIZmKAbJFzsEAkYcK+MMhdGOhURaPrlcQG6CaWKTi8yv2dzH0YTRznlcsgMEikc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QX+U/c8p; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2fc6272259cso887993a91.0;
        Wed, 26 Feb 2025 19:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740628243; x=1741233043; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ky8J/An6KQD2D8lFTvkhQXWoZeCGqkxJyMNiPG8it5g=;
        b=QX+U/c8p8OCl0WIyyD62thcU2GdPZlHVb1v37xiEsF5N2Qj04FoCpwL2NzKD3IDdbq
         pBlNSBGCSrNBXj10bfkW7cgsj+6mfugfXX/+Uq0kZ5n1lCeJXM03hFpJsIv28pBIKGHC
         D5uIBIIgkjBKt6L3YkE0I7YZVZK76PjnNNsz/Bsm2GLfHtehSVdmnqaGKarTYEQ4k/+c
         jNqSm8yci6TsOdH4EMfKdOs4w0FuQ70pUF8V7FyIhO7f/Vb3uxpKP5fA+mb6h6+f8J3m
         f3gNLqHz5f1M5lwzh8W8vyzkKH/qwrH7fPoxPlIJWzdWiQjPlSfOj38G+LGrJdXI9ufa
         /Leg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740628243; x=1741233043;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ky8J/An6KQD2D8lFTvkhQXWoZeCGqkxJyMNiPG8it5g=;
        b=i7OnwuhXhxm0UWE7cIOyy1c8LLBv4a+PGNC9wWYahdgdGBF5mziI1ncvLLEKm2zQoL
         zYjFhiz8DiY8P2BY9T7QYRo1U0y9ltHCRVNImKHP79dyAqWgx7oF2yjqrbtgdvI7ngJI
         s8FYlQnsmX4/sKNW7psw7CEfqR3/aqIOqdRihsKIaquL/+UWm0mqRsFqy7uL/u/8W4xH
         Hc1GV6q588pnrwszR/kW9JFNVOAJzZ5yNlEqOdhz0DebvrE1T46O/kRiO+o3JbqlrTUp
         Ir5l4VyHNOs0Vq/oYVkZREam6vVfVby8sWBDQXVQrE+IZGiWv/j3DlEUKQSC6basLF0n
         oSSg==
X-Forwarded-Encrypted: i=1; AJvYcCVKdsp2Im9/sNowJSoqkA2JNdOBhw4gI8xCqKtckSJzeHtrDIBJuyEHonB/4uV1yz/vZuQ+ehaxp/0I0Tx5@vger.kernel.org, AJvYcCXYMNP9MSaqNdMS2ESp3Pw4rcDBucTfFdYWXICQWr52K9FAmflM3B4cYfBkMowGAoXc9yu54mwIUNkA@vger.kernel.org
X-Gm-Message-State: AOJu0YxUOooSUbJ7PPNZ1Vt6k4SKdHZbTaPxKg4yMNuFFUUiopbtaj3o
	vUgECHnxtVyADRF4VlwN4ssO7Vy7INTBkiUdMePdy/lDDbrhCirP
X-Gm-Gg: ASbGnct1XnLl0nsECVluvlDZLRPxB6PPpJNZw5ZMAsmEI3n34MMigm84Q+JljREQI4z
	kjwXku3WmlVKvzvbUyVYJr25XFOAGKSe5NRPn6gh9I4f23AGTBtePPut54Ll6udW3SfpAPrdHU8
	ZLFg1RSN05S6Zv514HgppcAEPMOGnQxHDRj3pb0Iu7gFzdJ7Rq6oopPG84ohIqVhtCJxRa9hWZK
	I6oujSsmLPv/HgIvgmKhzpz/N8CKvbi6WX6EXEc3OK7Z5Py/IyOTyTmAYLmdiH2SfHgOv8bB8NP
	aIEEI4p4XkSy0R8nye1jw0s9gT8=
X-Google-Smtp-Source: AGHT+IEOgV9/0PJlD7CtwAJW43GfiUzoJivyP/ig6t7C+HJ01vCl2ljA7ElukNjSWeKBYpj0sTElpw==
X-Received: by 2002:a17:90b:2710:b0:2ee:e961:303d with SMTP id 98e67ed59e1d1-2fe68d0662amr15315002a91.35.1740628243434;
        Wed, 26 Feb 2025 19:50:43 -0800 (PST)
Received: from [127.0.1.1] ([2601:644:8501:1640:6614:eaf8:94e4:479f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fea67a7ddesm411530a91.27.2025.02.26.19.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 19:50:43 -0800 (PST)
From: Rudraksha Gupta <guptarud@gmail.com>
Subject: [PATCH v3 0/2] Copy tsens node from apq8064 and adjust values for
 msm8960
Date: Wed, 26 Feb 2025 19:50:40 -0800
Message-Id: <20250226-expressatt-tsens-v3-0-bbf898dbec52@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABDhv2cC/33NwQ6CMAyA4VchO1uzlQ3Qk+9hPEwosETArMuCI
 by7g5MmxuPfpl8XweQdsThni/AUHbtpTJEfMlH3duwIXJNaoEQjEQ3Q/PTEbEOAwDQyyKLRhal
 Kayot0llat27eyestde84TP61f4hqm/7BogIFEvWdyLQodXnpBusex3oaxIZF/ASKHwCChNLqm
 nJ7Ui1+Aeu6vgE6hcx/8QAAAA==
X-Change-ID: 20250225-expressatt-tsens-06d46587a584
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, wctrl@proton.me, 
 Rudraksha Gupta <guptarud@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740628242; l=1091;
 i=guptarud@gmail.com; s=20250208; h=from:subject:message-id;
 bh=diBmsIdt1g2IxWsgz6gwbyI+69jveoJEE4GwmF5LsUM=;
 b=vvU1OyvgZ/Ywr7jJO/RJ0cWwRjDcDJVhhGEMIeY7FuF9SnT8RN97GMa8wWZPcctcFg5BNXg9y
 SlUv/hkLj8OAffDM2tz5gnbg8jkJlDuOsRIOrMBvLN1kUXJ2e/4wLAV
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=5lJNaiR/Bu7edToWFLriO5zXOrVqSQWrBKbAKwuEw04=

Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
Changes in v3:
- Add signoff to dt-bindings commit
- Describe which values have been changed when copying over tsens from apq8064
- Drop wctrl as they want to remain anonymous. They have been CC'd as acknowledgement
- Link to v2: https://lore.kernel.org/r/20250226-expressatt-tsens-v2-0-7a4ce3a91f27@gmail.com

Changes in v2:
- Remove coefficients as it's read from EEPROM
- Fix dtsi formatting
- Fix dtschema warnings introduced with v1
- Link to v1: https://lore.kernel.org/r/20250225-expressatt-tsens-v1-1-024bee5f2047@gmail.com

---
Rudraksha Gupta (2):
      dt-bindings: nvmem: Add compatible for MSM8960
      ARM: dts: qcom: msm8960: Add tsens

 .../devicetree/bindings/nvmem/qcom,qfprom.yaml     |  1 +
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi           | 59 +++++++++++++++++++++-
 2 files changed, 59 insertions(+), 1 deletion(-)
---
base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
change-id: 20250225-expressatt-tsens-06d46587a584

Best regards,
-- 
Rudraksha Gupta <guptarud@gmail.com>


