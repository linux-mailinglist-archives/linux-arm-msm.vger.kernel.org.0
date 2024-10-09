Return-Path: <linux-arm-msm+bounces-33743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8149977C9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 23:48:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDE191C2243C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 21:48:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36D9A1E22E2;
	Wed,  9 Oct 2024 21:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bzuifREv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B448018B47E;
	Wed,  9 Oct 2024 21:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728510534; cv=none; b=gwKqD7CgSo2XM2YrXBwCksMbP1aha8kOKGBbCVRyzSiUrc6DsIrrA1Cux6NjX+Dgu8DFuq6WVjyApypc4GqGfCQ05B/Hj3GWaUKp+bdS0Jr0Sj2oOYEYTQ1HKXaqCs6tx0tdaKn1kwbnWYSvHu4FaonvpeVj7SGmDJ2FyV/i0O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728510534; c=relaxed/simple;
	bh=J27WeKc+8U5z16WNOl3AVMyQ4KzyPzjiLd8vaQX3CvU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p2Z5wvrhALIQIL6NU7y5ly+GNwjHnLGWDsiojp1jTg09wvXoK0NUjT6M1sHT9PMnkbUDJL26EcDzUMhx0EK+6jfoEggBxyJTiLvn8PT15ld8C43Pad8uvj10weX6heRaUTrvF7URM4TnegdJ3iFS3/Jr2Qxg/WF1+STwkdn4umw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bzuifREv; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2e221a7e7baso242644a91.0;
        Wed, 09 Oct 2024 14:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728510532; x=1729115332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qsc77yU6h/SVtewHZMt0EkR4DYJQPGGP/A/3IbaxlQk=;
        b=bzuifREvWV/FHxagZL4ZO1MRvLntMk5CGpbBb5lZVPn5eR5BLsLIwA+0CsfZlOTFYZ
         GGwcZ37PSAszaf5yew7F/5+GgDCRjjMF/QmT2BxYxbOhLHIbn49eHHruvFnwt45uHsNI
         XCfQL0OX+NWCYsfeeCEruR3Pm+pXGl6Yl2gNtaUQmqO/i51e3+ydDUcYpf8RSvMhnlO1
         2KKAqOvBorzVQ6HMmyWtvOeYR4+R00X/FTdhGNE4Umzk/P7y5diB3efyUHwIyeK0QIoY
         ihrT8JihvEDMtHGEIroMMDevMxxbSW8MZXC5+pgsaehipU9PnOzP7q2G3gPaKoXHLZom
         P0VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728510532; x=1729115332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qsc77yU6h/SVtewHZMt0EkR4DYJQPGGP/A/3IbaxlQk=;
        b=aSAfrUz2+yb+t43zmNX6YvCH59jrnfozBCQzzYZjB7jPUoX6n+fe+wPgfVKBEvwOMO
         XGUR+CRR12vqsgXeGPSlF7JJj73BfeuieBCvZoyGX8J5jLzENCJttfOkrKOIb36t8i5C
         Uha7NK5a105q4ldDema9DkuqM/ZszKLBXGwvDr498zQdvFfY72ZQELsZJEVYHec+g70+
         aX90iPqFN3BD1eQhPrSlWBdAMVUMsOoR7eTurhGvkDONIQZr75bsvEy9i6u/8FWviNnN
         0wTKKtYf2O5yAjwIR1YBscbkB5fR1YwAuTHFZ4A9A/G5voQva36J71T78XzwguqCUFUp
         f46w==
X-Forwarded-Encrypted: i=1; AJvYcCU303xCTabPW3NDwyn5fNKDT0IzI04Q3+9q+yGKVpHUCt04T4Y5KqpfmttSdFVmZRACmKQPMM00Bv181Vby@vger.kernel.org, AJvYcCVYT26nPPot67lG66Nm0h9ID+86VrLE/0deAuxmis/RU/rudPIWYL6iyu8FR8oi9Psm7E0jEaDyL/8RtKU0@vger.kernel.org, AJvYcCXhUva7xkcRoW6tCBeiM7jhEsKKMwHiRZsNY8cX82dSuyjcYqJ++hJRFxjQnNS5TS6GgTkIgQkm@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf+N1ljW78avQQuACE2/n65n7UIs24ofXA337MJXTMkNITOaKs
	jQAf9NxJmq7bYApUnOhd5fOCQObDHBBDorfVSLGaRoSmFXyy8WakXR6lXZTm
X-Google-Smtp-Source: AGHT+IGK1cHwSJTccAt7TwIsiYLVGOpAlwpobbrYlDvDsMvnOLZ/6QlmNj4axQiJgt0RD+BBRZnBSA==
X-Received: by 2002:a17:90a:558b:b0:2e2:991c:d796 with SMTP id 98e67ed59e1d1-2e2a2328a96mr4632221a91.9.1728510531781;
        Wed, 09 Oct 2024 14:48:51 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2a5707cacsm2250091a91.21.2024.10.09.14.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 14:48:51 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	William Zhang <william.zhang@broadcom.com>,
	Anand Gore <anand.gore@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rosen Penev <rosenp@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-mtd@lists.infradead.org (open list:MEMORY TECHNOLOGY DEVICES (MTD)),
	linux-kernel@vger.kernel.org (open list),
	netdev@vger.kernel.org (open list:NETWORKING DRIVERS),
	linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCMBCA ARM ARCHITECTURE),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCHv3 0/5] devicetree: move nvmem-cells users to nvmem-layout
Date: Wed,  9 Oct 2024 14:48:42 -0700
Message-ID: <20241009214847.67188-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.46.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The former has been soft deprecated by the latter. Move all users to the
latter to avoid having nvmem-cells as an example.

v3: add back address/size cells to fix warnings on r8000p.
v2: add missing semicolon to fix dt_binding_check

Rosen Penev (5):
  ARM: dts: qcom: ipq4019: use nvmem-layout
  arm64: dts: bcm4908: nvmem-layout conversion
  arm64: dts: armada-3720-gl-mv1000: use nvmem-layout
  arm64: dts: mediatek: 7886cax: use nvmem-layout
  documentation: use nvmem-layout in examples

 .../mtd/partitions/qcom,smem-part.yaml        | 21 +++++++------
 .../bindings/net/marvell,aquantia.yaml        | 13 ++++----
 .../boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi | 19 +++++++-----
 .../bcmbca/bcm4906-netgear-r8000p.dts         | 12 +++++---
 .../dts/marvell/armada-3720-gl-mv1000.dts     | 30 +++++++++----------
 .../mediatek/mt7986a-acelink-ew-7886cax.dts   |  1 -
 6 files changed, 54 insertions(+), 42 deletions(-)

-- 
2.46.2


