Return-Path: <linux-arm-msm+bounces-52897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 675DFA7706B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 23:57:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 234E416591D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 21:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E923215073;
	Mon, 31 Mar 2025 21:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DkMrw4NK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942233C47B;
	Mon, 31 Mar 2025 21:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743458248; cv=none; b=dADm3QPJz4Xc1HH/aQmPKvDhWEN1OKB+xtZVk0NsYHK3pI0dVZZr/ODyO4HdwVmqN/bRY+hi0JPJtyU3KdtOkoCLGuoaXrznHXzyBmMT51RSk4UcDAIuXP27jWRL3AzxW4YSwmFBQqJAK87q12EDvsRM+IZWqxaTMtVg6LDDIHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743458248; c=relaxed/simple;
	bh=+zJ1aUb1IAXp4aa8V9nlAtzBa2b3u4W1F30nlYMVRBU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nUgmLMMLx+SFl+Bl3Ss4IZIYEq9mgPw7hjKmuucyW614hDyU/6w9s900NggNcefvMh/6waFrjcvNUcpO26q+10kBp9rAL7mnshTyv2auaH2aTga9wxh91b6B5knhN0LR9kJTYBrvRKnerm+O5AiBc2ogkGCgr3rCYlnQiLLpzYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DkMrw4NK; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso47113075e9.1;
        Mon, 31 Mar 2025 14:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743458245; x=1744063045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ur6Q75ChBQdl9qW5L0kN/Glcu54CT2pQd+7VSyNIFtw=;
        b=DkMrw4NKBgiIssqMMp6w2c6qSu5rBNWShb9RduYjUVnNwHTndtW28f3xkYiAcs9+BG
         XEF+CrEaQVakzyD9aO6VJrWLXxa5wkh7hDnCAu6+OG4Qs22VVG3eZ9yj17l5VNXcQoLf
         2CxJk3xSrX8DGlVo79RobhXrk8avKAFIVz7PK+4KuBkUfZC1po3PARJNiHwc+qDj791Y
         327E6ZKCWmtFtkiC3c3NTw//TfPzggS72+uHE+Oa8Vu2H3w+zc5F8RVU9Wqfl2Rbn1Lm
         LI6Tnlknx5yxPqQXxP8j0LqbqhaT0pLIA24GbAw8cibRGQaGJz9T4rwEbHwi0mmD+tsa
         JGCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743458245; x=1744063045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ur6Q75ChBQdl9qW5L0kN/Glcu54CT2pQd+7VSyNIFtw=;
        b=B+jDtyhQuZl0gDZESgy0dKfj5FPK9CUKUGtE9frLj7D+gbfYnL9ITQvV7iLmV2AYnq
         fZd6Bn9F1muxHJO1q+wF2dEeIhMf9BEB8i6ivGqyvWP2PJDTNmH/HnBLDsseVTdfsuaH
         dtEvupbiqC0FTdNoci4evRfg7R8JDziRAioETMUtThDTctUOr3O9xTJjXrvCHz2i9Tcd
         N0JctzDKiDRkLS9dl32qyAnNnhWrcn0mXFfBR40tQyDkD84IQpTFHn/0Jbhm3BWxeiRp
         GOjJTmQU798a4GHTtntbN4/y7Q1Oxgj4cV/AWsmruxR8kz/yroPwhDpVFoJkMlTURMVr
         owTQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+PSKe3TGaoLsOV96aTJ3v5Crnz/zqIilQ+Eb74VroejwbfrLJr7akwSgh4GRuGgRBw9W6VfQpxZKq@vger.kernel.org, AJvYcCXeY5vu6JAr+efdwhmnnV/6LdQLC7vVUZeAimJsPmfVYPTY66C87PcfDedjxuu1UGMw3bj1dKTnbEDzosjX@vger.kernel.org, AJvYcCXmWrO3En0NMurA+M4tlXDQOOYzMwPFwdv2PV1krRf1u1vqHfxDUA5EF14JU6/OLeJWRCiEJSv8UYal@vger.kernel.org, AJvYcCXy21CyiRX+hN7q6V5NuLq1Ao8UhE3y+yjSc3/HPhArXT+VsO+vkRI+DswUoRr78TjDEjyK6EQEXnjpg69RuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyxQQVq4c7XP93KG1H0uLezU3e0/lTwdlwOP9UlksDe0nOAsiM
	tHY4FHahudy2EqcjNkDlWzrRb0QFfva1QwW14BN9ATCU/0dl5Ts=
X-Gm-Gg: ASbGnctLFlwqP1pp2uU9ktmC91BBQvhMJZzA5d+zr0gWFyziaubnK9ruIX/s1a+rkqC
	N8QRLDW6KteE9Vhu92sXyQyoirUycm1THw9XQRWPw5jrycdPvmcZZKtpnCDLTrJrNsH+3xy1pCg
	sd5C1DzY/GTMxQelwGQThKBwA4u2cvapXj2L/Nf5fXOtFtwjOY8V02gK0fgp7hebT8zSSmFGrHd
	DAeCASpa9qNxU3136i92xw1SikWwHwEpg10KhuUCKkHL2GeWf4ze+qn46ZFTCCnykbCgblpRbbv
	fQerG0NFRMj4fMPlJDxWiV05tB/ZG+6akxssTgshEO49l2pgXpFcs5Rt4w==
X-Google-Smtp-Source: AGHT+IH+62LlFlaVfXVdT1aVXjScHGtL55r2KRr+lgW8s4X82m6oVjvhd0OUMUtBizHI6NNB8uOWfQ==
X-Received: by 2002:a05:600c:4705:b0:43c:fffc:7855 with SMTP id 5b1f17b1804b1-43db6249861mr98204925e9.15.1743458244499;
        Mon, 31 Mar 2025 14:57:24 -0700 (PDT)
Received: from alex-x1.. ([84.226.118.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82a041d4sm182244665e9.0.2025.03.31.14.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 14:57:24 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH v1 0/6] X1E Asus Zenbook A14 support
Date: Mon, 31 Mar 2025 23:53:34 +0200
Message-ID: <20250331215720.19692-1-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce support for the mentioned laptop.

Particular device exists in two model numbers:
* UX3407QA: X1P-42-100 or X1-26-100 (as tested)
* UX3407RA: X1E-78-100

Mostly similar to other X1-based laptops. Notable differences are:
* Wifi/Bluetooth combo being Qualcomm FastConnect 6900 on UX3407QA
  and Qualcomm FastConnect 7800 on UX3407RA
* USB Type-C retimers are Parade PS8833, appear to behave identical
  to Parade PS8830
* gpio90 is TZ protected

Document new Parade PS883x variant. Move pcie6a_phy's compatible change
from X1P-42-100's dtsi to be CRD specific, at it seems it does not
apply to all machines - on X1-26-100 phy times-out when using new x1p
compatible.

When comparing device firmware between UX3407QA, UX3407RA, it seems
that only ADSP firmware is different, CDSP and GPU firmware appears to
be the same. (At least assuming the GPU firmware name in both cases is
`qcdxkmsuc8380.mbn`). Since at least some blobs are different betweeen
X1E and X1/X1P, define new firmware directory for `qcom/x1p42100`. This
also makes it easier for distros to automatically extract firmware from
Windows and place all blobs for the model under the same path. If/When
firmware blobs make it to linux-firmware, same blobs can be easily
symlinked between `qcom/x1e80100` and `qcom/x1p42100`.

Qualcomm FastConnect 6900 on UX3407QA did not work out of the box, and
additionally required both newer firmware and patches to `board-2.bin`.
I added a short how-to [1], as it is not exactly trivial.

ACPI dumps can be found on aarch64-laptops' github [2]. HWids on
dtbloader's github [3].

[1] https://github.com/alexVinarskis/linux-x1e80100-zenbook-a14?tab=readme-ov-file#wcn688x-wifi
[2] https://github.com/aarch64-laptops/build/pull/134/files
[3] https://github.com/TravMurav/dtbloader/pull/4/files

Aleksandrs Vinarskis (6):
  arm64: dts: qcom: move pcie6a type change from X1P42100 to
    X1P42100-crd
  usb: typec: Add Parade PS8833 Type-C Retimer variant
  dt-bindings: usb: Add Parade PS8833 Type-C retimer variant
  dt-bindings: arm: qcom: Add Asus Zenbook A14
  firmware: qcom: scm: Allow QSEECOM on Asus Zenbook A14
  arm64: dts: qcom: Add support for X1-based Asus Zenbook A14

 .../devicetree/bindings/arm/qcom.yaml         |    2 +
 .../bindings/usb/parade,ps8830.yaml           |    1 +
 arch/arm64/boot/dts/qcom/Makefile             |    2 +
 arch/arm64/boot/dts/qcom/x1-zenbook-a14.dtsi  | 1251 +++++++++++++++++
 .../dts/qcom/x1e80100-asus-zenbook-a14.dts    |   45 +
 .../dts/qcom/x1p42100-asus-zenbook-a14.dts    |   48 +
 arch/arm64/boot/dts/qcom/x1p42100-crd.dts     |    4 +
 arch/arm64/boot/dts/qcom/x1p42100.dtsi        |    4 -
 drivers/firmware/qcom/qcom_scm.c              |    2 +
 drivers/usb/typec/mux/ps883x.c                |    1 +
 10 files changed, 1356 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/x1-zenbook-a14.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dts
 create mode 100644 arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dts

-- 
2.45.2


