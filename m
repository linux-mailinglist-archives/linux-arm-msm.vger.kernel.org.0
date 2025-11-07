Return-Path: <linux-arm-msm+bounces-80791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4174CC40C39
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 17:09:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7D4404E44C6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 16:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB14F32D7D5;
	Fri,  7 Nov 2025 16:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="kiH0DTPg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BC22C0F89
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Nov 2025 16:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762531734; cv=none; b=uNZwdR5XLsJd4RLoopAQjQfDHdI11kGBwfD+4xy1t20tOoWnBhcPvAK01YNtrKiDFPI7+OGNE2Qlo6XOZqgpcE/GU4W1+YsdurSQtWJL22wTUkbvVxfI/I3gGCww5rxuO8C27oJU96ncrCo4T9jQNfSnrdVM9bgmaijSgQka4WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762531734; c=relaxed/simple;
	bh=1UB7MjUKjWV6747T2U48We331jDJpIjDCkO4sdbS0zo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Z9W2N+SqRGZIrirN+9hj/0U6iys3xtkSogYRFFhNeBC5WI7CxlXSuPZWOxP/vQEQ6RtdcEnIRcTcOhcEFnK8HIpCU5tLD8Wz6FBIPbo75Ppea2bKxS7dWJNy6i8qR7OQH/2XfPSxCaQY14O45j54y+8l7FZd46DInp5s87+DCTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=kiH0DTPg; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-640f8a7aba2so1540834a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 08:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1762531730; x=1763136530; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vi4OlyDfrFyMuA//87+yq4v93Npa9bmKSRfzlMv2g0g=;
        b=kiH0DTPgOyugBgO2kpcmOOvWRpvp6FJwy3XPbkaPqjdEyjZGJNaqviyfUNYcHJ5m5n
         vayYwe+yuCYPjb+0yyqQkRi98h0bPAiLrn/AdVJ07s5nUNM7rfb+8470OCya/dBtpREm
         /scTBslkqV2sqIiAEX7iMgVz+wxIZBTzS5kb1AJS0XDrUis0O/628kSHdhXmtZ9lmHT/
         BoO5NDeheK0sey2W6XL/OKRQcCp17BC8YIN2+eDvK4rRBDQnxLENi+AynKag+oxjRl3p
         fWJSSdJseCTofkryqXOjnkuQwgumbwuHTvxtNlP9t0HthBZPY0SVa3r6GPNIe3MZVG5D
         bx7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762531730; x=1763136530;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vi4OlyDfrFyMuA//87+yq4v93Npa9bmKSRfzlMv2g0g=;
        b=u2gOCBwhqzaY7VHhiURiW990/z+T1cFDQAx+M5DZnp7Ou2iySHWaITU2lm4wBP8SIM
         0zRfDFkxJpyIk+9a5ZT1Ft6KKUzyKtozfBDadw3COwa7T+d52XSWchc5UA0wHWFz9yEA
         +sn1ry7agcMGQswF760/egsAtzhDJFGJdwpWl7gwma/biMkxB9SoaJYQJTXyXlnAY0Hs
         JxIfVmAKeU2i7Q8yAv7scyzw4Faed10utXEdNVvuKSYGFqFoqZZIdk1Ed5HfIgHbbzTF
         7Ohx/sJhYNP1DyYtJpPSfl7hYcZDnjt/EZytpA7HmKwGaDIbYINrLNF3nJzLDu81dN7q
         k5DA==
X-Forwarded-Encrypted: i=1; AJvYcCUsLrqbeX53cvrJIwz7qeA8e0dxJgQS/ucQGRheF/Rp6PXNFg9XjQk23UunJvbVMR4vfmpVyTVVKVbyVnW7@vger.kernel.org
X-Gm-Message-State: AOJu0YzzjR1m2ahSyA4cmGU9RDFGmoZU6aSFJxpAzJLg37QMtu6DzMsB
	VBpMPRn1YDsvQJJeFwEi8IQKvJYr7ODo9a7LoNMpdb4/3OkS56GWr0d5C2jtx7w2E7EWk7Brq6a
	I/UuK4O0=
X-Gm-Gg: ASbGncsB5RH0J4wtCt6BnOD7p5hdbjNuzBxKUWq2h/0qMseCy1ssROXiI39iXQxM7Oh
	kcEchjHkEJ9KkCgh3Yo2TqTL4NxK61TDp4uL77HkmGhhpB5XpMgWWfjq1Qc4JyVB/Q/1tKrDfde
	6LMA9aslk7bVPIu3L5d/1N13Km9Q8E/zAfD1PctwNpOXZf8oQIGo6gOMf3ozh4e7+rkH4Cw4TUE
	kmmahGORVfpTHd+LKRqcKDTr2xS5fr6T2nMhWS5O6o0GTCp16PpQcC25/kPvt/rqOo0WPe5unHv
	5CQMuJ8gc8yA9Z1WL/k5Bgw7HmEpZKOji2wF/dyjL8HIrwBIN3GJaVgHz4IBngvcoLSXnOniGOR
	B27lw3GnrGWUuQPsRFNF2F6GEfFU/zLALn480WUQNmjhSMWK7qVCkvSqIZV16K7jNOdHVlpZOE3
	kmotRlEzc1swbo9fB7OoBVVp3Rwr2UFxm7iq7IE08qy/gVOLFnrzSKM38=
X-Google-Smtp-Source: AGHT+IGT7CaeEz6g3FtTP8c/NtDzRQa7iR2B6l8J10WYQFcAMOVl4hOnUuV2ukorx8UFB+TFYGU87g==
X-Received: by 2002:a05:6402:35c3:b0:640:bb20:41c7 with SMTP id 4fb4d7f45d1cf-6413f059b62mr3497605a12.7.1762531730417;
        Fri, 07 Nov 2025 08:08:50 -0800 (PST)
Received: from [172.16.220.100] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f713959sm4444376a12.5.2025.11.07.08.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 08:08:50 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/5] Enable QoS configuration for SM6350
Date: Fri, 07 Nov 2025 17:08:46 +0100
Message-Id: <20251107-sm6350-icc-qos-v1-0-8275e5fc3f61@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI8ZDmkC/02Nyw6CMBBFf4XM2kn6CC30VwwLWqbaGKi2iCSEf
 7fCxuU5yT13g0wpUAZTbZBoCTnEqQC/VODu/XQjDENhEEzUnDONeVSyZhicw1fMOEjeem8lKeu
 hjJ6JfFiP4LU7OdHrXbrzKcH2mdDFcQyzqSZaZzzaTDTwf2qqn2aKS0z0ielxXLJBWi206nXbm
 EVCt+9fyLdVBcMAAAA=
X-Change-ID: 20251107-sm6350-icc-qos-d319ffb3e6bf
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762531729; l=2705;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=1UB7MjUKjWV6747T2U48We331jDJpIjDCkO4sdbS0zo=;
 b=7mpYa6QY9OFMGZX59eWyR/bGGqlpm0cTZ2rZeg4gqwW2L/pDo3zmdposoVlJ/5J4/B0Y6VqqF
 8M6lLN3Ar3xA+DqZB5IsIbN52MtSNhpgNhytT26zJHBmDsSzdOqs7Kb
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Update dt-bindings, driver and dts in order to configure the QoS
registers for the various SM6350 interconnects.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (5):
      dt-bindings: interconnect: qcom,sm6350-rpmh: Add clocks for QoS
      interconnect: qcom: icc-rpmh: Get parent's regmap for nested NoCs
      interconnect: qcom: sm6350: Remove empty BCM arrays
      interconnect: qcom: sm6350: enable QoS configuration
      arm64: dts: qcom: sm6350: Add clocks for aggre1 & aggre2 NoC

 .../bindings/interconnect/qcom,sm6350-rpmh.yaml    |  65 ++++-
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |   3 +
 drivers/interconnect/qcom/icc-rpmh.c               |  12 +-
 drivers/interconnect/qcom/sm6350.c                 | 298 ++++++++++++++++++++-
 4 files changed, 356 insertions(+), 22 deletions(-)
---
base-commit: 33b5a67d76ce575ea38bc3de55719a6cdf42287d
change-id: 20251107-sm6350-icc-qos-d319ffb3e6bf
prerequisite-change-id: 20250613-rework-icc-0d3b7276a798:v3
prerequisite-patch-id: dc49cf2810a33db590997c9e9969f09fcbba207e
prerequisite-patch-id: bd229a10bfd7485726f341f1bbc179fa032e4beb
prerequisite-patch-id: ea3e9a509dc2d590f647560df3fa773165d5df48
prerequisite-patch-id: 95b82df224ac0515c56d41cad8547099248697c1
prerequisite-patch-id: c793efccb33da5b78d634fc0f7259c01854c7da2
prerequisite-patch-id: b25a3cc84427ed3d321575d32dee239aa6dcfa65
prerequisite-patch-id: 8262f845f906a575f9ee06c002d8626c7b25a87e
prerequisite-patch-id: f3b9493e64d90665d7093c7f7af335452010cf13
prerequisite-patch-id: 4e05eb6178064d4b4541fccbff31e18d4e5ae258
prerequisite-patch-id: 4c169d0f54fb39999cf62eaba98208fd94e0d250
prerequisite-patch-id: 91f18aff5b2cc765964c8991647dd53e75e97648
prerequisite-patch-id: 7749a4cc2e2e8e2ac191844f8c42f338d0a80392
prerequisite-patch-id: 75a9009c7cdbeb94b2c7528f6ecc54d7a4b7a6be
prerequisite-patch-id: 9566648a76666548a85084664ba6fd4a240fe602
prerequisite-patch-id: c2ba63308bedf78640d64d9662ebfe2ceb7e6d26
prerequisite-patch-id: a08ad34a60042b2693b91f24712ccc10e0d5666b
prerequisite-patch-id: 8227a4926c64a28215b6c03d43df5518d72094e8
prerequisite-patch-id: 15ece9c03dbae75dbfb1b16a2e2c1d2ed1766c82
prerequisite-patch-id: e69ae611580f951450269b4a7df8789f6b2e2c89
prerequisite-patch-id: 5e54f850197bc33dc581ff8907fcad1dccef20a8
prerequisite-patch-id: 73caecb9e342117c2a83832f0d2346119466a899
prerequisite-patch-id: 79abd6d335f0bdd8725c27797d4fbc7ffc017007
prerequisite-patch-id: faa043f224857fad9bd8368d83d5154e3f7013c1
prerequisite-patch-id: 5d7fdb3ea01a6066079dd89a4e494165b75159db
prerequisite-patch-id: 0234857c8f0119652dcf3fd6e7e1fe051f40a6ea

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


