Return-Path: <linux-arm-msm+bounces-71046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0C6B38B84
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 23:35:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7ED1E5E4DA9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 21:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 750F230DD0C;
	Wed, 27 Aug 2025 21:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A3Jb8/Uk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E561A073F;
	Wed, 27 Aug 2025 21:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756330496; cv=none; b=mukG8EpWJBbFRfBowynRDMXWx+hOHiF0L7vu2joDwm4kZvwVKuGJz9TOhwY1XI24kw/h2PNGkRk0hFUZL5DxL9g3nSzDNDhRSB1esLvnJb5ee7x7SDigb+5Lc9sRIQubsXuW4p0EccpopVurJlQnhXbX0vBgYhferShYTFYbouU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756330496; c=relaxed/simple;
	bh=ocs4EQ76GlEPr3yAQv3FQf9LAX2b/AlcV9MuFmVhPAk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EpfnHbyg6cIML1cyWyx4WAtaf7g28ZCKE8SU3hvqzY9zQ/MS27PmSSxOSTeGlbB2jgjRjeYfa5Vjsc34Pt8lGvCrHK9BilsqSR+Qqxliwq+xTljg4Yx2FNyi8tJIS77nhpraBrKqJGDgU+wco+JTcntqmzaPe7B6tsJ/dZsFwWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A3Jb8/Uk; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-327a27e0d6eso350241a91.1;
        Wed, 27 Aug 2025 14:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756330494; x=1756935294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dqo+6lIPjlAvcSz8C9O1Kyz/i4EBXtrAu/454vmVrN4=;
        b=A3Jb8/UkFO0NZBj8vUiJrXDIIKaiPb1U6paRHjd7ZrBiZNRtPXOUrLExtBd+ZHoI1F
         THuCMjE0o03HMkSeyoSQ6SERe0N5uSOeIe1GL0NSFFWHxHgZtZ/Ejiqxlmmz+nvlhO7m
         8j4hQd3TUy9K7ETmEgOckzOS49vZFM/N5lx1pMZjdkQLQdxq/c7f9Ik4PFD0DfDGg3G1
         VoUDM/J5L8/hM9WX0h7yOT6OOX66BiUO+dIHfHPuKmyVMKczqVGQtpOM06K8+oLyt6vm
         NlU4lhmKgEWhGkH9Yo3vlOvNcA6Q0m7L+AeThHdUzR2hU0DSKsBdkxCWdHn6L+aMGwhA
         lEQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756330494; x=1756935294;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dqo+6lIPjlAvcSz8C9O1Kyz/i4EBXtrAu/454vmVrN4=;
        b=pc42py2CCwwVi2vuo6hx4638ZDlN20pxmFWy9j/WV3imha/4k5eWec0FPDfJmV8nXB
         W9uZuRHsQAd2n9HY5xBgGaL6nEVp0zLxpsh0oc6bX3j6WfhjLgD70E8X+cUZDFg8ZOVx
         rfNo1o1/85FcZY6PWRXqb5q1RKlTiU3YOhPfkaopq0MtcwcTUwhj4kKuXB0VPdz3rbfd
         SO4DrgYtI19q4/j6MaGKR1eJUZkgiLz0KbjYtXLwLJj6oNcLaX3ULTLOS3Fe5uBYuujT
         Hp/OR4FD8S8+GtK43rXLF+2ukNLewv9NGl1OcbCKcSVt/XCAhswBd5ItBjkmIj0IRScG
         nYUg==
X-Forwarded-Encrypted: i=1; AJvYcCW2BcktMWGEFErEnw8JWvj79nTzA8hT05Hd62LNKwrdF3NS2RzYChIfqnCQRzRKXTWdzImA4i/L8OX8AAPn@vger.kernel.org, AJvYcCWLT+YGnvu5HTm/3VHzBopF9dyfe9m2fY9Pg2TTOROUzI5DQHW6MIRlTB/QN0kN90TrackWToP1u5Uj@vger.kernel.org
X-Gm-Message-State: AOJu0YygnvPMuxVE+rM7cG5eDnRRczgpmpK+G3F6/Xy0N+JVvuO5lGa4
	GDLKpiMZ1HMH9h5UIgTfHgCgBQ1/WuWW+QUkrYYqHyyRo06nRhT2AfnQU5vwIkz00PU=
X-Gm-Gg: ASbGnctLet3xSfVLvEdyCF5ek/6RkWFPVnuiMULCRsLnzFxD+6ebbfQ/Vq8LHOLix87
	USi7FoCXoqohASZ82D3OCrJbzICObHtpwVB8+asaAFloo6uJrZxwZ6TaU3Rf6cCzf6K2WT62Ou4
	Xdpz8R5FXq9r95nhDrF8PhUYUiz6k8NjXZF/ePsGrjeFnZ0tLklS8xSmG1In4p5kVIHd1Rm2awc
	M3h3phSvr/QcXmiiBT3ouddv0x3arrsCtBw3kSCK0DPQZ47sVnHkE1txS9SERFWilLOB6VIS9bt
	blKi+bEn1eNozxuzYiRz1rGcmjJUrem1lwIi6f+KDOeiWBnG0MgIsIXmaAbUkfq4HsIo8XT9Q8y
	JBm3sOJdJlwmZbLyOiIix83psMBut0vTR
X-Google-Smtp-Source: AGHT+IEGu6wMER+8lr7HpVJfOs5fMRIFtEug1FMunpqW/Wlr54fAGq0WChsPZFp88Zg0CReh0PDpJQ==
X-Received: by 2002:a17:90b:1a8e:b0:327:8bb0:4338 with SMTP id 98e67ed59e1d1-3278bb04446mr3109913a91.2.1756330494173;
        Wed, 27 Aug 2025 14:34:54 -0700 (PDT)
Received: from archlinux ([179.110.125.177])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327ab0dbe86sm193016a91.21.2025.08.27.14.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 14:34:53 -0700 (PDT)
From: =?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
Subject: [PATCH v8 0/1] arm64: dts: qcom: add initial support for Samsung Galaxy S22
Date: Wed, 27 Aug 2025 21:34:07 +0000
Message-ID: <20250827213414.43033-1-ghatto404@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changes in v8:
- Rebase on 'arm64: dts: qcom: sm8450: Flatten usb controller node'
- Use real name for sign-offs
- Remove device tree binding patch as it's already in the tree, merged by
 Bjorn

Changes in v7:
- Document the reserved GPIO pins, remove pin 50 as it does not
 need to be reserved
- Clarify the phone isn't limited to USB 2.0 but rather USB 3.0
 isn't implemented yet
- Add a newline before every 'status' node

Changes in v6:
- Remove debug features (bootargs, etc) that slipped in the v5 DTS
- Format and organize nodes correctly based on existing DTS, 
 move "status = "okay";" to the bottom always
- Solve "ddr_device_type" and "qcom,rmtfs-mem" warnings, the rest are
 from existing SoC .dtsi
- Disable buttons, ufs and other features for later revision

Changes in v5:
- Properly format the thread

Changes in v4:
- Try to properly format the thread

Changes in v3:
- Removed unnecessary initrd start and end addresses
- Make sure r0q is in right order on Makefile
- Properly format memory addresses
- Set r0q to the correct, alphabetical order in documents

Changes in v2:
- Attempt to format the patchset thread correctly

Eric Gonçalves (1):
  arm64: dts: qcom: add initial support for Samsung Galaxy S22

 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sm8450-samsung-r0q.dts      | 145 ++++++++++++++++++
 2 files changed, 146 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts

-- 
2.50.1


