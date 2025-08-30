Return-Path: <linux-arm-msm+bounces-71294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 407FFB3CFCD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Aug 2025 00:21:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6631176997
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Aug 2025 22:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DCF725A2DD;
	Sat, 30 Aug 2025 22:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y4jyKnTF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34A02517AA;
	Sat, 30 Aug 2025 22:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756592490; cv=none; b=j5QXn/AS8YBwz9SMeRbL08fnvOo8CK9W2Nw3tm1dihe4+mQ/qKmikGXZoZAz1bfcPJ6nD9bWhekkOAQJHDH4LWGSa+dhQ4HBBKpvvOCULlcj9jtOpqdJle/S1N8pl+y0ze0mPok3mA/zhUC6elN9JYlmGCpKgg8w/19V+pj47ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756592490; c=relaxed/simple;
	bh=iZSJL4LRlDJd4TukOsLfu6xV/880vIwEn0xFRgkQ/Wk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DG5zusVhR23qcbPw90UUj4zx4TRl/0Vb82K5GwHTIQTLIvU5FN+FHHWaHMTCgX/yOvLuzO7HMOdK+QeNpFr8KSzsXtVdzG6PhLdmqcjldCJ4tRVWrQnk+gVAkQPit+UpF67ORGFESG9ONP/g7sXYkkt2l7xuySvyrtht+dI3dhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y4jyKnTF; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-afcb731caaaso491195366b.0;
        Sat, 30 Aug 2025 15:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756592486; x=1757197286; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yw+Sc5USPK6vhayYLUtRMldnpGZ8yfBkPSRIfNdM7DM=;
        b=Y4jyKnTFx+Do5vCRbXT16B7ZHrugtiJGG38QuNB0zVfbgrb/8NguL05AwXVxl70Xfe
         FhwAsz/bQm1n1Jf3kLd4Fvyy+h1xu1LSYfKGgSLOr6WT/munGMveLD2S9rSP4nwm8ZZp
         3YwQlWATHaAB4DtdK3Kijmpd6D+Bpz++WBgYoRCu4KqSjFQFNC/tTIfzyb2+9Cy/ouZp
         wBWlwYt2ccwFA360Xyirq0fXJegQ8DVZ6X0sFSb6Evj25qA7jYz6EuODouXlIAOVFDzZ
         e4WlE/53xq+30GFzcJYst7WM0dVwsQL3BysGOZhhUXW0LID0s+cLCxPPrusoqObY7gU5
         a05w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756592486; x=1757197286;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yw+Sc5USPK6vhayYLUtRMldnpGZ8yfBkPSRIfNdM7DM=;
        b=brHNPm0FuYheNgncU2zJhpqJokkmKvHcw5pL205Q0AST4F2edCHaxXRWJ4cV4g1de4
         w71HN6TBR1z1wkIHHE4bO3sFMilN2Xsde4OCrSQvIfZqAmUFwGUn+IZEW3+4lCDsAnnG
         y+Ux+fSBDdqellq6PQiPLoNvyn4SqqYQa86PybszLtdeykQAJLJv1Y3DzMkhvIWCPKzr
         KdqekbGGToC07RWPq1HxYAGafHx0b8AryPiBPAx3/q2HECfyLbAlUGsk5hi05GrgGIom
         RY8wP6FPeVIanL8IBj62VyXmm1yfvmQLeUxBrvg4OyQ0Zd9F6kzso6rFfzc6DqD88asl
         mexg==
X-Forwarded-Encrypted: i=1; AJvYcCWYPyTI7GutTaAPEwqbfLYWb/HvH5vBifjnk4MPkP85TvMTS89lkjg+s03e1FfVJGUVCMdPe6IraAipHQu5yg==@vger.kernel.org, AJvYcCXIkEKbkMV257wBMPEdIy9fArPlhFCdKrXB/vdlSbbLu/UXfd+Fgy/GoIHfec0+R5SRa3sHocS+P12p@vger.kernel.org
X-Gm-Message-State: AOJu0YzqkX6FpgXC1iV+cxovhchJpd9PWJRlYMI1DI6uzBrO2sD4D0Jx
	uic0Q1Vey1iThw5ZodmbwGZ8D4i2fkXFd+tCMmmboGjIIG5EZ6qrFLbi
X-Gm-Gg: ASbGnctvbA4rByRr5H3nIIPglrvKNhPalC/W1WFr3I4UvmfOSLu+7E1oWumbM06sgBR
	StbNm9J2Hlw8frzPlRqi27WeyNvXGKJlmw/NhRxpe3oZ1++wQDBYCNDMpb5iDFr8QXWFXFsc0Ky
	xdOAKsykJVk/lgmxhgEzUrjycqm0tFeqmiLk6ZDBIAMXxgaZ478DSUqkuATXUpnCM+RzABQqZ2t
	OD7P3SFZqGcaIuPqyvqt13S7eb83E2ZHavAErMCv9fcdpjm5g3CmR0Aq5Nm1DoCL6pc3AbgI0uT
	59NB8w3XOBsx6uemtOSvayvnHupRp5kb9DtHtUtIdRGklhXBe3SR9D4Am3znCZq5QkM/CHYMZh8
	6+CuDeBMd0nnoxFmrDUcp
X-Google-Smtp-Source: AGHT+IFsg1VA5gMqGzYcL74Rwq2wgvyIxuK39WZlZIasDP3tEOsGFyys5Bn1SBcH8MfOJ6vvhk75Sg==
X-Received: by 2002:a17:906:6a29:b0:afe:dd76:7cd4 with SMTP id a640c23a62f3a-b01d97b6ab7mr350582266b.57.1756592485861;
        Sat, 30 Aug 2025 15:21:25 -0700 (PDT)
Received: from [127.0.1.1] ([46.53.240.27])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b016e56a4e2sm241201366b.26.2025.08.30.15.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 15:21:25 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Subject: [PATCH 0/2] starqltechn: fix max77705 device irqs
Date: Sun, 31 Aug 2025 01:21:20 +0300
Message-Id: <20250831-starqltechn-correct_max77705_nodes-v1-0-5f2af9d13dad@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGB5s2gC/02P0Y6DIBBFf8XwvKSgK6i/0jSEwmhJCtoBjUnTf
 9/JdmP38U7unDPzZBkwQGZD9WQIW8hhThTkV8XczaYJePCUWS3qVnSN4LlYfNwLuFvibkYEV0y
 0u9ZatCbNHjKXUtXe1b4fQTMCLQhj2H8l58s7IzxWcpX38KMaqkN0QLXutTJUwQnQhLjgvEGEV
 Dg047fU19HaVg2bZP+PPkjyIHG6woRUAHFdiqGmv4c0cdF1vQNQfaP8H+ZqM9B7MYYyVFRad55
 gL6doM62zy+v1AwrK+1k6AQAA
To: Chanwoo Choi <cw00.choi@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756592484; l=1571;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=iZSJL4LRlDJd4TukOsLfu6xV/880vIwEn0xFRgkQ/Wk=;
 b=Wits2BNJBi3iPEk6+hnYtrbPGMt7iijqoayjuCwE6Lyja/MHwqlK+FBkBECEjfdxEDaRMohdi
 2hS8tmjIiRVD/yEzExRGWopwEy7+HngySmJ2BUZ3+OESBW2t0G8Y9sH
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

For max77705 charger and fuelgauge subdevice, use max77705 interrupt
controller.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Dzmitry Sankouski (2):
      dt-bindings: add mfd/max77705 definitions
      arch: arm64: sdm845: starqltechn: fix max77705 interrupts

 MAINTAINERS                                             |  1 +
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 13 ++++++++-----
 include/dt-bindings/mfd/max77705.h                      | 16 ++++++++++++++++
 3 files changed, 25 insertions(+), 5 deletions(-)
---
base-commit: 3cace99d63192a7250461b058279a42d91075d0c
change-id: 20250830-starqltechn-correct_max77705_nodes-1162dc2d9fe7
prerequisite-change-id: 20250830-max77705_77976_charger_improvement-e3f417bfaa56:v1
prerequisite-patch-id: 534eff3c30a7b998f90f7be9537ff54c7f68543b
prerequisite-patch-id: 60362587901a812e50ab0e9a2cf25eeea769ef9c
prerequisite-patch-id: 09e302f4c28ec741f2985f858d72627d15e197f0
prerequisite-patch-id: 195796a157978c67980cdd3e1bacbd0ae677e3a3
prerequisite-patch-id: efdf7936ffca1f97fc550118ae9a2a0795828f88
prerequisite-patch-id: bc2ce3683ecab7a91fe2ca00d35798d0f4ea5f80
prerequisite-patch-id: 2547b245dce99798d36835b1d729b21b6d1906e5
prerequisite-patch-id: 30d3ca50e1b09abd360ddf33982223cce24c6859
prerequisite-patch-id: deac1d76b95764903b7b6c937d7d4b43ed9f74ed
prerequisite-change-id: 20250831-max77705-fix_interrupt_handling-0889cee6936d:v1
prerequisite-patch-id: f2f0ada814ee906cdc40b88427650d08b89a5d1a

Best regards,
-- 
Dzmitry Sankouski <dsankouski@gmail.com>


