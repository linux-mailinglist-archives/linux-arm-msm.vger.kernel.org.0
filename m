Return-Path: <linux-arm-msm+bounces-33055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A27C98F954
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 23:58:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 86CDFB21FE9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 21:58:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B292D1C6F73;
	Thu,  3 Oct 2024 21:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eczM/7Lv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445226A33F;
	Thu,  3 Oct 2024 21:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727992672; cv=none; b=NwnvQBBAsXJ19ViDidZxVbyVax+AFm+qVsgmyEGBnoScIyhfWUMRW7N4NSaC/3VXVfYcQlbt/uNBF79uyy1tzlpklbwsWlvBgLU2Z5E71qXmpz9umMhI+p0tE3siErQHen5f7jikPx8rySJIAZSyO0zrOu/kAhZGwJI8EN0Zw64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727992672; c=relaxed/simple;
	bh=N48uovbd0DRBY5evGkOWiPu698lQUwJVaIZq17alunc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C6sVNJMYf7f9oN9DrF4aR/BC2buIGgGm196msMX0hLmE4jB2FlMJQCqkggmMy6cAl2wFNYKQNAY6qa2jm039U0f0N1MG4y6mHjzWEuVSbupLkDM9JqFle3URbn6g4ezSxRtOYklibdRRekjeKi6k6+QE3VST1WWkZKj7XjS18qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eczM/7Lv; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7db233cef22so1095285a12.0;
        Thu, 03 Oct 2024 14:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727992670; x=1728597470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rldSH3goLboiuzIyKQvXMFAVAAa6He8Aw308I+Evpbo=;
        b=eczM/7Lv+fx85otv5JbUXGc9zN8KE3s9RUPhUVbJt4YS0Sx0L3/6rc9DOBRadn9AUr
         gobffVVZ3KWBLkCjc0VPwb5SgHBYw/PRSDqXxi0O8rck2Y+A/FY0jYFwb/CLfEm5LWf4
         ChhLmea7q0pn4EJB/lVmHBlJH+XFt15FOW4c9W6kgp7RdQH8tLqroDxN7Yk534wk1rpK
         MAGmMf/BVSNXtDUfY8I+5Qeu1y3jSZx1l8+VW7W/InhxxyNmFEoiPNyK5+7EokNLatZF
         Qvn6YX2xCJuLdIKSvwpsZojGJrVOKp7Ftr781jJRhmIQt0LXMiIVs7jUn3XFrKt+OV1K
         lWkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727992670; x=1728597470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rldSH3goLboiuzIyKQvXMFAVAAa6He8Aw308I+Evpbo=;
        b=v7Eyxe097ra5ls6EkYxyoFTGwPkg2SDoBxn/lhfN+XnbazXdzL9evAXAII/Ajm+8Pk
         d6WNGMbaK8ZOqvBDtGg2WGOaiwdAOsx8+TRaLOVJex0gDU2FimTKzzFDqp3/MDzPNYiR
         8+k5ZRawrVKs6vxOnFXpErqP1zcYHeA0iOSzgP4qU0PqrSBhp1tIbVmfPrI1e1Esqk5R
         xartVWMocu+cnGHggqSX+PP3L8fhw1yBxgXgFHhNsUhjdjYngtXr5taGMGkDnhAl05QJ
         x50gByVUh8b30YFIT0RtPG0JDDleGGkowNmqvrsYM5z0zHasPWfDc/RrNyKi/mgdn3b9
         1ytA==
X-Forwarded-Encrypted: i=1; AJvYcCUz+oSjOHWxweyg3R/eouU9kATqHzDJLaFWkOUObmvtb14RjA/UGEF27Q0SRb4kqMhdGUBZmQS+@vger.kernel.org, AJvYcCVwrnylh9BtTJLPw8poISLhuGnBy57zyt5bTrZ+0J5ET1s8RCB55Faz29goQR6GC1Dvs+H3GBAmqYw9DdcZ@vger.kernel.org, AJvYcCVyiJwN86S2i0h8yua8h+HYFoWkpcEmi4Nf2FMENmdgcIRxYvoxGqmTvia8ce6iscuOG9KOclYhV0xpuKqI@vger.kernel.org
X-Gm-Message-State: AOJu0YxOXKERHdzTg8DpTFeYAcR51bhaOHLTET1UG4YnhWWaIcsP6wSC
	/CAXyR9vjv7Bct/Pauew5MPrbnMC3SoGFoxxdd1bCvpTxfIcQvrmnKgMXmBF
X-Google-Smtp-Source: AGHT+IEncAQI4RNQQ2Bpq4bHf2MbPfAukQ7rT7lAlsdy6iH6bURuh500IT5CNC1KoOgRJ0IXotqWeg==
X-Received: by 2002:a05:6a21:9204:b0:1d4:fcac:f0fe with SMTP id adf61e73a8af0-1d6dfa238d5mr1289692637.5.1727992670350;
        Thu, 03 Oct 2024 14:57:50 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71dd9d6e67esm1863026b3a.39.2024.10.03.14.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 14:57:49 -0700 (PDT)
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
	linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCMBCA ARM ARCHITECTURE),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH 0/5] devicetree: move nvmem-cells users to nvmem-layout
Date: Thu,  3 Oct 2024 14:57:41 -0700
Message-ID: <20241003215746.275349-1-rosenp@gmail.com>
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

Rosen Penev (5):
  ARM: dts: qcom: ipq4019: use nvmem-layout
  arm64: dts: bcm4908: nvmem-layout conversion
  arm64: dts: armada-3720-gl-mv1000: use nvmem-layout
  arm64: dts: mediatek: 7886cax: use nvmem-layout
  documentation: use nvmem-layout in examples

 .../mtd/partitions/qcom,smem-part.yaml        | 19 +++++++-----
 .../bindings/net/marvell,aquantia.yaml        | 13 ++++----
 .../boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi | 19 +++++++-----
 .../bcmbca/bcm4906-netgear-r8000p.dts         | 14 +++++----
 .../dts/marvell/armada-3720-gl-mv1000.dts     | 30 +++++++++----------
 .../mediatek/mt7986a-acelink-ew-7886cax.dts   |  1 -
 6 files changed, 53 insertions(+), 43 deletions(-)

-- 
2.46.2


