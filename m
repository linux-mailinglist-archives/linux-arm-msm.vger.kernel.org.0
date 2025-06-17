Return-Path: <linux-arm-msm+bounces-61567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BF2ADC676
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 11:31:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD31B1899E33
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 09:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C195A2980A1;
	Tue, 17 Jun 2025 09:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VAdYnun5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3687F2980A3;
	Tue, 17 Jun 2025 09:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750152632; cv=none; b=P8zWPPR/iccARin6Z3QurJw3Y5kL6ElvnHT1Q3QBpXpZ0PyKvunR/1bO6UHlaN4zpqZeJu8R5KRKpyJL/Mrxgl3Yd/qZ0wDLTuvJli4ntVStY1dIU/7J3VLxH+VYQe4rKo3YG7oSYWUoj6wUPypkjWWNOul4fs1QXKX3sPr6ocM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750152632; c=relaxed/simple;
	bh=Ety06Z0+WfQWzNaMYtc5oYqWFy9Y5nVVQNRs21CBi/U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oVMVIp13k++QKlxbrI9aZmpDQQTqormvZnZGkv+zTBElprsuc0KdtgkLwuEMKXLVARbhj8wt0R5Lgbkl7oxm3Y0IHh/ahOvNK7u5r6Jk1uZJz5NiUuYayMGZccNI71zMwnRETALzJJ/QJyuqnyQ9QmDRJPbJPzTYvyC/8oSQDoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VAdYnun5; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b2c4476d381so4542001a12.0;
        Tue, 17 Jun 2025 02:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750152630; x=1750757430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w81I1/1h2IzdxlIbWJrQrspBTCemSMrI2wtCdNY6zdE=;
        b=VAdYnun5Jw81+rnJlE8HGBg0j7Lj7bfy8iOg2DXM7LzM+r8gK9agR/CMOadBI0t1/p
         3Jkjwd5IfI9rG1eTB4SftisPd5LnukgISvpfW3TotHB7fnQOdf753Ykee/D+P1nuHA/k
         NlrxMCfi3uFw8/0TSWio93zeVn4r3SaBRzmZ/7NKdHlsMaJjW3N+LvFc/FTln9cfDYWm
         EUPux1I9R3ciwxD4jMg713Nt1ewg3JCts1Y+HBawjEzsNE738J7eAwzIc3CkjTsaUsY6
         bef4MCFp9AhV2oa/5vHupt9SChas29vRRGmlFSGu8BPcXULk/n/Lm4ayBc3IMrZS7/sh
         HYiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750152630; x=1750757430;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w81I1/1h2IzdxlIbWJrQrspBTCemSMrI2wtCdNY6zdE=;
        b=LLQ+molyW+tYZZPsRngB/kyqHDo9l72XBDIUUgG7+RyHRCpwm/kyd/VlcL3YaGiDfF
         KZvczcSkIICUJc1VJxKUhn4kAIphaqDv+DJ/t+Lfw8LmEhqqiQIxrWN9ZA7h2iqon4hy
         V3yYCbXfhYHWWcFxYjCMmh6UVQVGeUyIG79GdjRt2V39W5GtdgwLXjlKtlLKCv3YChA9
         POlf8iDvCICLf8zbmwzyJ3d4XcP6S7XoNaGvSYjuW1NpJ1f6vYE099M/YJ6EqJPRc0oh
         5ksah4MAaYRE/o5wP0pHFUwJqXqXk8H5r26vQqLa2YLF3lL0Zif89+gq5UrqxasKp7iv
         ZIeg==
X-Forwarded-Encrypted: i=1; AJvYcCWq0sxqS6myUXCIQz7MpHol8Sg/7prTBDN3X6gzOewo7wuc4Olv61COzf7tAobiHG4q4LIGqL8kmpUS@vger.kernel.org, AJvYcCXrFB3AZr78z13jjdx4sbXJlwhrSKsEiW54TJQ20LuJXFaJ0DCEljZWgSUAvfvHV6t8tjbOlzvl9MznsuVb@vger.kernel.org
X-Gm-Message-State: AOJu0YxfXqsVL58LLnzQqK4sSDAaheasZoTH22cqgEYn9MGRSesHwQme
	LEe0WqNYEnjMiY9wK1nX+Q0P2e3as1QgXzB9/+mokVloTDW2j5Q1vCes
X-Gm-Gg: ASbGnctmHE99U2s65kAdp9qJ10EpTZC6nRyaBVKEJC/GWA1Gd+CKxpQ1xvQwBQ+nRXc
	s8ghibSdIgTcJnN6IVZS1ZLrCb/vwu1+wIH5UGgaMKtpHEqPlkCZhb7PwOWVX9KVA+h8GK72F67
	QEYkIj3QSlrgC9AVAHmm4955Yw7DZkLjmv1JJRpdS+bDK/6P1VjhuxahG6nOBX+RAA+dzsK9tHt
	XwsZy10fvgZkQRsNQG+6toDVe50fxyBb/YuUreljZP/iwep/KQoxErwBj2BFfeASzX22NCNjYJ8
	iD6I2FHPyjQlJKzcQM0rMDGbZTKxSy4PK4NTyw1g6jAGmUOFGZ9JXBTa/j/6FXFFlcKMITQ=
X-Google-Smtp-Source: AGHT+IG/hUDeNie7RUT6UguyIbcxx/moXnxGIoaKzR3wgm1IQp51f5oL6mCKl+p6/X+PxNJLC/i0Fg==
X-Received: by 2002:a05:6a21:3294:b0:1f3:26ae:7792 with SMTP id adf61e73a8af0-21fbc7e6c47mr17827072637.18.1750152630281;
        Tue, 17 Jun 2025 02:30:30 -0700 (PDT)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748d8093c63sm714417b3a.57.2025.06.17.02.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 02:30:29 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eric Biggers <ebiggers@google.com>,
	Len Brown <len.brown@intel.com>,
	Benno Lossin <lossin@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Ingo Molnar <mingo@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Joel Granados <joel.granados@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Alice Ryhl <aliceryhl@google.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH 0/4] arm64: dts: qcom: Introduce Ntmer TW220
Date: Tue, 17 Jun 2025 17:29:25 +0800
Message-ID: <20250617092929.1492750-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Ntmer TW220 is a WOS tablet based on the Qualcomm SC8280XP platform,
also known as the Robo&Kala 2-in-1 Laptop. This patch adds an initial
device tree to enable basic functionality.

Pengyu Luo (4):
  dt-bindings: vendor-prefixes: Add Ntmer
  dt-bindings: arm: qcom: Add Ntmer TW220
  arm64: dts: qcom: sc8280xp: Add initial support for Ntmer TW220
  firmware: qcom: scm: Allow QSEECOM on Ntmer TW220

 .../devicetree/bindings/arm/qcom.yaml         |    1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 arch/arm64/boot/dts/qcom/Makefile             |    2 +
 .../boot/dts/qcom/sc8280xp-ntmer-tw220.dts    | 1622 +++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c              |    1 +
 5 files changed, 1628 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sc8280xp-ntmer-tw220.dts

-- 
2.49.0


