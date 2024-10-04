Return-Path: <linux-arm-msm+bounces-33067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2601998FB3D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 02:00:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B46821F2335D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 00:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8814A1D5AC1;
	Fri,  4 Oct 2024 00:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DU5C8HPI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B2079F3;
	Fri,  4 Oct 2024 00:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728000021; cv=none; b=DBmKPL4XX57D5WThmcjX4Ib9Pm10VGUyNkQL7/uYZroSlDLsANMFgEdU5MfzT86VAs6iykVmQ5Feri2SeZ+URCKhQYe+4adkZzUvpw3Hxgoj3omIXronD7o4Nxxvlvdz/dmpnV2o+ZAKvE9IW87FXGEPRC9kNCmQaAAStVEdqbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728000021; c=relaxed/simple;
	bh=wPJjIM86jcPTsg+JridoWkrPuiIpEjqc0U8f9vFTbPA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RNgU3QJbFMOprUBT9TGgbT4x2tkZIjSxUaAfpDJxX688qxlmvo1r5bOqbcvQfMoEM81eXMvecT+Jb5aMmQ3iRpazahqju2HVsuB9qL6BN8upYKAiuRABUTIx7BxwhwAJ6PFEmHMFNIDbemyfVVb0OfLtyMuABWbvf4Eu61cj3P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DU5C8HPI; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7193010d386so1348953b3a.1;
        Thu, 03 Oct 2024 17:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728000019; x=1728604819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uAFmVgHYoe23c3WiYdk8jnywuzLrHCt36wQKW4RQ8rg=;
        b=DU5C8HPIvPcNNhm2NAjCvTc7WzflIPUqj/UL5+SZuN0wWlJqAehxA8l1fqPDBed0M6
         2Jp/BDKeTt87j4lt4oWV9FeH5fIZAX/VY2lAgff+H1jC+KxBDFBOfD5+hHfLu8lFVV7a
         JnkiBgE70y5tL2g6vE4oZA6Fay/WhAkvVVpvqxUKnvjA4UcXBy0l7g90+lykjmXLw8c7
         WsXWcG3d+nkfx2v4+kaekEMpUvkB96I3UICNYw5dR72UDYu1c1ChKeVgPvfc639CSa0I
         aYRA6LHc3JJ9oOg8CeIDuhrNIceESXTyzB86Hl1OB7zMMW66DBPyenNLm/kwRRUNfqU6
         E4ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728000019; x=1728604819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uAFmVgHYoe23c3WiYdk8jnywuzLrHCt36wQKW4RQ8rg=;
        b=RylXTKE2HLCkGapc+T6DfNgYYG+lA6CnelCthPKSiRRlRcmC8mA9BHe1xqv2RGPg/N
         gsBiJT2lE8Q7nsz/B+muTNqnr51M7n6hw9Mkal7Ect0Jj/fpU2rkHCg3gsT6jIPhx2E3
         KLuGiQr25P13OrIxIbVJui5p329IVeSHO3zkcluSFHAWyUlaNmQ5lZcY/K75L9RMhub0
         rkF1pVq3GdkAI2arkooFmxM3YvukfLZ3LczIm3Rv2RyYBRMkKVtdJSLHSGYUQIFfq5/Z
         UNy1N7VyzYH/tOFe+9LzN8DctymMjq4E3vvtOuMh4th3nk8oPzTZGHMrRbE4K0wrx1c4
         3kKA==
X-Forwarded-Encrypted: i=1; AJvYcCU2/uPVsoLdJUmgqrDoQfvRHckQgS7v27MABE5iBpE14B4ywUXbEKLQd/+wfRLYNLvXFs7D6YSg@vger.kernel.org, AJvYcCXpWBXoUN4F9qnAjZTwZcpqrUnajpAsukY0CaYVECG8w/z6Rwn/DppyPUdEn1Tj+TUaUmcMsS15duwk3eK6@vger.kernel.org, AJvYcCXs+CFbGYt8sJ0qZFIbRPvejp8HxBNUxyJXVQ/yjCtqs+Jr85eSEqG0LlcAXycFTn5eMvPLnY+nY83jRwkz@vger.kernel.org
X-Gm-Message-State: AOJu0YyW/e/LIW63qYHDHaOvyqxguqfAdJRE90bg2Vmw/aY08i/pUkzd
	zeYj202FeZFD1BoWbQc+272nzdyb/VAOyVPixhKofc8xPJ++5eMRPdvOckW5
X-Google-Smtp-Source: AGHT+IHXFjoxUX0o59w38/yIlWlyO0Vt5ngI8BTtORwAbSNVnJQZVp2Nrs40lFDzCmSccWsHrVfYDw==
X-Received: by 2002:a05:6a00:190a:b0:706:74be:686e with SMTP id d2e1a72fcca58-71de2474d77mr1276637b3a.26.1728000019279;
        Thu, 03 Oct 2024 17:00:19 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71dd9cb0b28sm1983047b3a.0.2024.10.03.17.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 17:00:18 -0700 (PDT)
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
Subject: [PATCHv2 0/5] devicetree: move nvmem-cells users to nvmem-layout
Date: Thu,  3 Oct 2024 17:00:10 -0700
Message-ID: <20241004000015.544297-1-rosenp@gmail.com>
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

v2: add missing semicolon to fix dt_binding_check

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


