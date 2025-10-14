Return-Path: <linux-arm-msm+bounces-77078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EC131BD7481
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 06:42:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 981724E5772
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 04:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0C4430BB87;
	Tue, 14 Oct 2025 04:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H7tyuqn8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F96730B534
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 04:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760416944; cv=none; b=UgMWCZYEW2mHPDnc+zScj4aw718iEb0vRgg0ysdHYQdQoEgMjpMZHuT+dU7O8quJgcRWXZpmmWEdJpBW8pxg7YWCJNcmWkaVHvEi7TZPjEMRC05X7QuGBY6D/XZfLy2G+ckbhsm5AU5qOdSEtaJ/DxK1Mht4tiRDdhLH/tuBsdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760416944; c=relaxed/simple;
	bh=c7qQh2kUkHkXde9RLibpCWvlirMSQzaQtOoZRDsl33k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=h3dClQ0VZFglLftd15k04m6AcRg49dX0I+fG4gBpeg/ygIPJiBzfcsNUBGIj4kPDO5YFGa2tRzNyvmVmW2ih+k0NqWj/FtkMZ/Sd3Ci1XnirDvI1mGhaev5Tdt2HUYE0j3aeku8FG+rTeQ4RlRwXofD0pROJfUTGBJdCHBD4SUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H7tyuqn8; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7841da939deso4249607b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 21:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760416943; x=1761021743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ml+6wIQdksUetc3TuDYTabUXSFcNi4s6JHEPJWiU1o8=;
        b=H7tyuqn8lmfigmDQetbUcls8UWGJIqNXhz4IY4WiugFolO2KQQkyBPciwY23nHvO1k
         wohKKVQFkYTO3lil6fx/iYgwyr4OVUJj/V5I0z7BDPKMOWeswvzgq20Nhd8fybijWV/Y
         0w/cOx8SCepbzzJ1iSqrz+KAILq1pC5zNAgBSMdY3BaCYhDgTfSdqLl2lEyrefU6+L5F
         pWjN8Begq63iyCepV1QMHW7MjQEbxGVjW/TfSgrBHRLnyrAW2JwFGDkXAwongbKJ3wRs
         USXjXpt+b104vjn3DLIE1Ev9Xw0Yaem+9Mcx4YTyCfPT+ItAlhu97pgvYqPfeBIPKFXc
         d5nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760416943; x=1761021743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ml+6wIQdksUetc3TuDYTabUXSFcNi4s6JHEPJWiU1o8=;
        b=ROn1HTFBu1HcdCXyXmYshMmbmobZ+/sVhdim73cmLbTmndx7hZX4mB9O2H7f/MpaME
         /K768/RKeNdgMDz+JjKQaiUsFp9rKHpjFMadjuNoR5EFI2rz3tAQYUjfkkx86tvYrxSp
         N3VhvH8tF3l/8VgfvgEOf9Z+lJzWPabXvAVAwDrLrLzvVPYTIerwkc+A1X4CCI9Kb9Ke
         dq6OcNFhgWpQ0iXWX8eI5dPSm4a7l1TZVj5YSA3/fMrJePVyVBvPsRxrPn3yIZ1apB28
         ye/XmYlcbkMIcr9dcTETSaD5HGBq1iSHdoGEHTyAoUq7NgBwziBgV8m+Vcxrw2jQBFVJ
         hEYQ==
X-Gm-Message-State: AOJu0YwmR/WNJnKZASaiACs6cjkiXnn0wKQkLgLKKGh1209dtrvKfb5p
	6Agsm2o2QoURGK8PFiqR+44F5WGuBVytCHk7B2hHpmmSWnVQBV8l36qNfsKNvW40
X-Gm-Gg: ASbGncsBEZeNKWI8YBAirRxUtkwEowDaUcM4EBnUlSUxoEwNBd+rFg6k38BmmR20x5M
	3z2Os480cAFHW7j23yhNk8Ng6fmVCWg2FdD7c6YNci0zF+Mp6WcILGw860QuGHLM9tLOoM4Cvj2
	K45wd/QMMyyc+FNWhfwgCJW00kVnaW7xnt2rpMbd2OfivQPTzflKqPhYarYSio5+UVFCZ966QXb
	dwv/mxD+E7yUFqvOA/E9b2IwpSAQ/5sH1w18b/mrr7nMcpZSylSbmdevDUx4kz/z0gB/ADNtCVt
	jPP1HX+FpiD1xboHIN9+eaUA5Il4X+Yhy8Geo0wHti4CP07u7uOUDLxi5H31RiOPBDiZAwTegf1
	aJVRUY1Epn4D/EZlVW3drRM9xzS7Rj0xSv25LvNxWrtHgr1k=
X-Google-Smtp-Source: AGHT+IEewoEl16TbW/c0YEE3/3VAqPolvV7asqs9adJ3dRmcP4Di1uWVWrX5HIFD5WO8itFdDK3MqQ==
X-Received: by 2002:a05:6a00:a14:b0:77f:23dd:1e20 with SMTP id d2e1a72fcca58-793876373f8mr28886161b3a.24.1760416942652;
        Mon, 13 Oct 2025 21:42:22 -0700 (PDT)
Received: from archlinux ([177.9.216.59])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-79b65528a51sm8440684b3a.85.2025.10.13.21.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 21:42:22 -0700 (PDT)
From: =?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] arm64: dts: qcom: r0q: enable more peripherals
Date: Tue, 14 Oct 2025 00:41:29 -0400
Message-ID: <20251014044135.177210-1-ghatto404@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patchset adds support for multiple devices found on the Galaxy S22,
side buttons, touchscreen, max77705 charger/fuelgauge, RTC and UFS. It
depends on "Input: add support for the STM FTS2BA61Y touchscreen" for
TS to be enabled - and for the fuelgauge/charger to work,
"mfd: max77705: support revision 0x2" is needed too.

Thanks!

Changes in v2:
- split the gpio keys patch into 2 for small refactor
- rename spi-gpio: spi-gpio@0 to spi8
- use tabs instead of spaces on max77705 nodes
- added new patch that fixes adsp_mem and video_mem memory regions
I couldn't find the clock-frequency for i2c5 bus :(

Eric Gonçalves (6):
  arm64: dts: qcom: r0q: small refactor
  arm64: dts: qcom: r0q: add gpio keys
  arm64: dts: qcom: r0q: add touchscreen support
  arm64: dts: qcom: r0q: enable max77705 fuelgauge
  arm64: dts: qcom: r0q: enable ufs storage
  arm64: dts: qcom: r0q: fix reserved memory regions

 .../boot/dts/qcom/sm8450-samsung-r0q.dts      | 278 +++++++++++++++++-
 1 file changed, 270 insertions(+), 8 deletions(-)

-- 
2.51.0


