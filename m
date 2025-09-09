Return-Path: <linux-arm-msm+bounces-72867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BD0B50655
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 21:22:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EBAA541DCD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 19:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 149A334F497;
	Tue,  9 Sep 2025 19:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VdJ79Am2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8E62DE715;
	Tue,  9 Sep 2025 19:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757445730; cv=none; b=IPxhFMbDBzJNi1SR5aBiuco5Id/uXidBRV8Oit6ny2HRysngE5AL/sQjSjr+3ErOUcSHBn+HU+v/zunpKwE5JJxCCkUhsndvOgRXkLMtv1UBcR1mbex4VXWk8xnHes/CR3JEvMuOyuF35FuYmPMXJ27VUoQSwcHJYdfIIATCyjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757445730; c=relaxed/simple;
	bh=Q5QpLMKuG98x6OxTFrFdeeark0xreCQr1lQs5ENXKeU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UKG2BtU5JyuBze0pYv0MIyHC2lGtZhOWX2lOWLhq1AmpY/HUhzTLye/eiQyY+66lKU7S1OA4dhKnGYhLExjGPMq5TWDNKmHxOHFdIPK5/bPElUSEXkFoOzFZq1bGqa+NupD7D8RVtcPHs+I0uLVfQFsm31ZT8rlHa7k03YhL0a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VdJ79Am2; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-625e1ef08eeso6690407a12.1;
        Tue, 09 Sep 2025 12:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757445726; x=1758050526; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yflQyxEc1T9Y3WrQFfO9sDGa6EOwcXTzNdDwj6cExFk=;
        b=VdJ79Am2mTjwUQ62wOqQDion5rIgyb7Ee172A+BUYKpygAUc9hEXNEN/NYvrK24Zj5
         qB8z5sJ0pO8lP1QkxS4CShZH/eBTwkB/QV6Utn5KIbg/+nxM/XSvqTfC8HmwDdT50ePa
         LJPJWvwqFlYadWs69i88QWSdNhJ+H9ebBEd8CMneY/MNr2Qywknv7QN9HcPksz4JLiij
         10oszfSz64icF+7Zna43Xeyy5tAvJivxLHUAARK8AolKGEfSK7BVPRpi4YQDba3lOZxu
         hTmm1Uug/2aejJQt/yVNY0fsnGzZzTl2Tn508dN4Ilq7XIbY2ec8eCsnINof1aHgPa7G
         0lUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757445726; x=1758050526;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yflQyxEc1T9Y3WrQFfO9sDGa6EOwcXTzNdDwj6cExFk=;
        b=JKBNKzEffujaCyE3Pf37LCGAram8XJgN18xsGoy57F/C3VUoDkU4cJyK4EGNuUAfCu
         LpC/FgQ8grBf/uZwVLchK6FGOgE2JKv/EKJL1slgmGZdXCOd4/co9xtupru9lU6aTlE7
         Rsbnw04uMWvx/ez9rrlEnSwlhPN9WPrAeR7j9Xox2ieu+E6d6WuSQRMru6t7FoPCLM5M
         h2bgPQxju4sXPnf30D8QNxEdLqXAJroVH5A9dyfcK1EDEthuNvO2oH6T+uvJJN86NV23
         dlkU1a+zmJEZBdflzzgyguRpEX6hdtZCu6is8PSJ36+5TWfjK1gHV2Bbu8mejECTc79i
         Pnfg==
X-Forwarded-Encrypted: i=1; AJvYcCVe4N4nVQxH6jIG2HRw7ZzhqZ5ZF7jHnNowksIPe7m8/O4Lv86dNn0ZTLp2xeV7o+RZddCifdLpE8C9@vger.kernel.org, AJvYcCXa73wOxlbHupP7Xf+gSSIBlWjCbQrodduYXfjWukX7pCRnrKbWyQMiyznIhJaIYMpX/3zcf2kApxOY6Tl4xw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfbPO1K/eO0OLqK+xbgik8NHEDQ37zPvuqPfXY/VMew5g5aW+E
	VArTuLRohuDPMx4pWDEzprqZlSBa+tiiu3J4z48HnX5VBo0iSGPlForUuHhG5Q==
X-Gm-Gg: ASbGncuXK2BBcrSrkGfy5xiUdF+POyVxcwVWxBSYqQogpcm3sWaaduWAT3PRIARZsgA
	cOKck8kUIr+3eC+PWwB1JwqYLcizHHRrOdtNXL7T/Fjhh2EyCOeggxLp5V5ncHl4PUQcka21V/a
	ydNhPmlI/YKBTBuABaumMyvlyKkvI//k0dDeJHko4e7d/5IJugON7l5YKDhs0DOlwOSDCLkF1eq
	jHN2TBCA6IVg1Duy+XtNrfggw36t9M+dZQx+08q9EMUCXOhdqyHiEkJ5IjgVfw70QCKaz2vbJ15
	DeY1u9TPTj5b32PLLFBN0Cnl/w6RKjWkWGlLxjBhhYu9sCku5YZahgL6VhlANjJrhRmL+WA/Z/+
	PcbQ68cI8rvrYyVqQUCT3BKErn4ToUwI=
X-Google-Smtp-Source: AGHT+IG5KSxnJMO5PMScPv+jlBGBlCaMFuTpg0hk96B5oJG6y0HgEUUQvyR+vdcGyqyROm/RzB535g==
X-Received: by 2002:a05:6402:518f:b0:628:a4fb:3b44 with SMTP id 4fb4d7f45d1cf-628a4fb3d21mr7307419a12.1.1757445726428;
        Tue, 09 Sep 2025 12:22:06 -0700 (PDT)
Received: from [127.0.1.1] ([46.53.240.27])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-62c01ae5f75sm1847142a12.46.2025.09.09.12.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 12:22:06 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Subject: [PATCH v2 0/3] starqltechn: fix max77705 device irqs
Date: Tue, 09 Sep 2025 22:22:02 +0300
Message-Id: <20250909-starqltechn-correct_max77705_nodes-v2-0-e4174d374074@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFp+wGgC/42Q0W6EIBBFf8XwXFrBKupT/6PZEBZGJRF0BzQ2G
 /+9rJvaPvbxTu7cM3fuJABaCKTN7gRhtcFOPgn+khE9KN8DtSZpwnNe5nWR0xAV3sYIevBUT4i
 go3RqE0LkpfSTgUAZq7jR3DQdCJKCZoTObgfk8/LUCLclseJz+ItK5B/QGSpEIyqZLNgDSutmn
 FZw4COFontn4topVVbtysnfo88kdibRdIW0PgLiMkeZnGa0vqd5XTcaoGqKyrRr8Yi5qgCpnnM
 2tlkyLRv1sMU3p0JaJ48Wgw1xwq/jcys7apzEfzxpZTSnZcdV1xhWGGU+eqfs+Jqg5LLv+zekr
 UeGmgEAAA==
To: Chanwoo Choi <cw00.choi@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757445725; l=1901;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=Q5QpLMKuG98x6OxTFrFdeeark0xreCQr1lQs5ENXKeU=;
 b=rVnp+GNhFskyI4xHF4FLDqIOjL+OuR20RhqMEEx/dMMBw//I0YGMw+YMf2Z+PghCDws0mnFLI
 69/y0QhSuSlALZqq32Fz0r+eFL2ycEKLoHqeM68e2igA/j48ykRU3u3
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

For max77705 charger and fuelgauge subdevice, use max77705 interrupt
controller.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes in v2:
- run dt_binding_check, dtbs_check
- make interrupt-cells 1
- add patch to delete unused address-cells and size-cells
- add binding patch for interrupt-cells
- Link to v1: https://lore.kernel.org/r/20250831-starqltechn-correct_max77705_nodes-v1-0-5f2af9d13dad@gmail.com

---
Dzmitry Sankouski (3):
      dt-bindings: max77705: add interrupt-controller node
      arm64: dts: qcom: sdm845-starqltechn: remove (address|size)-cells
      arch: arm64: dts: qcom: sdm845-starqltechn: fix max77705 interrupts

 Documentation/devicetree/bindings/mfd/maxim,max77705.yaml | 14 ++++++++++++++
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts   | 14 +++++++-------
 2 files changed, 21 insertions(+), 7 deletions(-)
---
base-commit: be5d4872e528796df9d7425f2bd9b3893eb3a42c
change-id: 20250830-starqltechn-correct_max77705_nodes-1162dc2d9fe7
prerequisite-change-id: 20250830-max77705_77976_charger_improvement-e3f417bfaa56:v2
prerequisite-patch-id: 534eff3c30a7b998f90f7be9537ff54c7f68543b
prerequisite-patch-id: 60362587901a812e50ab0e9a2cf25eeea769ef9c
prerequisite-patch-id: 9692af6383d95fca0c8030b9110d4b06aa0631e2
prerequisite-patch-id: e1b7fc49030ad771c3fae33dc59595cbfecfd17b
prerequisite-patch-id: efdf7936ffca1f97fc550118ae9a2a0795828f88
prerequisite-patch-id: bc2ce3683ecab7a91fe2ca00d35798d0f4ea5f80
prerequisite-patch-id: 2547b245dce99798d36835b1d729b21b6d1906e5
prerequisite-patch-id: 30d3ca50e1b09abd360ddf33982223cce24c6859
prerequisite-patch-id: deac1d76b95764903b7b6c937d7d4b43ed9f74ed
prerequisite-change-id: 20250831-max77705-fix_interrupt_handling-0889cee6936d:v3
prerequisite-patch-id: 4c30e8bca26067f7b96f7571086398cc86c6f71d

Best regards,
-- 
Dzmitry Sankouski <dsankouski@gmail.com>


