Return-Path: <linux-arm-msm+bounces-69091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8A0B258A8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 02:59:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B37195A6CA3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 00:59:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EDB972623;
	Thu, 14 Aug 2025 00:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YWM6d4Em"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87C01BC2A;
	Thu, 14 Aug 2025 00:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755133189; cv=none; b=e+fLrnWebqzWkVaI+NpnZHKe1mVxFwRjdyD13O2h8RqW+xgVwNGPLNRNm/ZhziXCJ578GvWVgbd8+R+y+2Y/SfffJUwDcJJ1NVz/Eq511jUwa5SEKtDvRmkz3bZKkNCtUwGClo6N5n5BMVUAAwEu8lD1XoyBX9CyYayGA6JfDco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755133189; c=relaxed/simple;
	bh=sUJ1hwgm3BilO93f+COLaWq26QSMqiNh20olbxtH8wk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fls0L9KDrdcfUrG7iQhUfh3o1FKzgBL9+YqIQSJb6H/8R2sXj8OA/qU8BMgKxKlV78kSeTQzY/7OAalCt9/Rf4yyHeMvVo0IpwkCQcFCnb9ouj76Q4EFr4HC0BqcSsY1BRrddSjaAPDYQ/TyBOXVGM4VBMrOaJvBLZY2yrQeMAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YWM6d4Em; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-76e34c4ce54so38443b3a.0;
        Wed, 13 Aug 2025 17:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755133187; x=1755737987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rf/DLFSblEwpBIKMV7nOMC43XFgeeGPKDZbsy7aPkt4=;
        b=YWM6d4EmCOugQ6VbPkR9UgF2FGcI4pseiE6nvtLNzDiUmWBBwigmzneIAc7YvLOZuV
         amdZE5w7oqyBCGPW9Gz324vlNp9v3i0I5MAsHHhAjg33DIMXyHps6AhcEqJb/NUIYb6q
         LEFN6fAGceYxzLOTxfI5PZGGrGwN6rcEtn/rt4zJ9LvMGRNJ9E71SmHzRF4EcUGY41nf
         YU8GAoQY8Oyyfc+WX5rYNqKoDLSBLAXIVwoqmT1hJ0+bf5suhqhYxw2GIfLFhvC0vDK8
         xkX5lUskyTa5ObcxLpW6WxWgFNue/bDFSk93pMme6INFb3U/xf+wXEpD/kTF/d1lgOB6
         DReQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755133187; x=1755737987;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rf/DLFSblEwpBIKMV7nOMC43XFgeeGPKDZbsy7aPkt4=;
        b=Me07EKvzcxXYGyuDwS2ynJ2pHpWygbAc1VMgdtIO5pPXVtMk4wy8mcxOm+fYq3hZbJ
         /TTGDq8C4Ck7NFuMILcIJiPTRtShDvP2OdqNLG2i2e5P6V2BkEwJICSyPsPNluZqoQB6
         HBg61bywUBhbb9f5x+5uVcRYYW+KC2WPD0qwbmVqtYFMTExOu8l6SPETXxOUFpo1NnOl
         vpY9BuFejg7l7aD52xge3nGZQEX4fG4qJvmHaDn+7aquEKgX7vRwpNiQagCKUY97jCtd
         XgXCe+thrcPqENTeji69h7lo3xF4mYyzZ7OcG0PyN1y4m+LQy9JXbuYTyowD51woU19H
         xr4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVeOYreYRTpCQjW8nuRBFg/ArYl7s0SB+v0lOIQzwZBe8qXtUVQj1FyYORcbuhZghSJ+Cen7flwmSqqWA==@vger.kernel.org, AJvYcCWQQjeD+62a/3SdxGNVr0Gp7PDzFefzFBW0JefZSXkcIg8hIr0n5RiKFGwKpf9eQr+p6KtfHlH+8HIzl4vvWw==@vger.kernel.org, AJvYcCX/4cIwgtBADIWr/aWW7+vyTAjzQjxTe73bjsvX2H81MMnFPxFE5ygXWnuWCDAEfmvRpcH9/Tolr7pF@vger.kernel.org, AJvYcCXPcQ4/OoSeQVYO9+Yfk9relIX+6+xI32KwK+56yFWnLKIB0GhVN9G7te7ijwVno4U2ZeRvur9RoqZmIX2A@vger.kernel.org
X-Gm-Message-State: AOJu0YwkWjNetyGhbJi3U7PlecVJVB/X5qPM4Qw3oq3JSpsCtbSvf8E7
	KnKvKJ5enxRKmq7IrSbk3sR2RJIbMNuLgkLqFa4AIVKYGu3Ze+baN/Bt
X-Gm-Gg: ASbGnctzFliGTTK/Qnfnl6krsLVmPZ7aFJy8H2PVAY71EKSep/gZcJGdZi+5dmPPlJj
	hnMpiXGIXcD1uLZazOmnDWFcSK32d0q8w3eikV05YabGBKQWxpwhExXdyzGJwS0R17emZZwxfPJ
	pUnb0vYdm/fdiByxb7B7KqnvLbhO11y2xZ80O6w2J0cX4ZUY/1Ww7LMUQIqGUZ1Eb72b3g0H/ZB
	sxXxwOBQaJG2B0ZPZc1nOpxYWZxLB5ZyC08ucRuMNXSxEdBaKjcTqwiKfixMU4wf/EONIriwCgT
	K3jZ2zCO9BfEmRB/Obu/OKdA91FDl5PHMSocyEivm6N+nVYlKxrE4ekYBfI4TGcYOO20bjHA7Tg
	s03jJJ/13f24Uhf3i+bcyDkQ5KxB3YJ1Lvgka0lU/kd/wGDjHk7UepaT9xWCYLr9Cuc8bWZ7AxY
	3bh9p+YlhLmgxVsU2lumc+qQ==
X-Google-Smtp-Source: AGHT+IFRkVLTCUcZUx+09+v3Wv/zc+P6dtPoSwg7WCBNLF8VkIc7dKXeFpMC8/XRheQQ4K8C/bprdA==
X-Received: by 2002:a05:6a00:3e08:b0:748:e289:6bc with SMTP id d2e1a72fcca58-76e326c2c54mr949982b3a.1.1755133187112;
        Wed, 13 Aug 2025 17:59:47 -0700 (PDT)
Received: from harrison-Surface-Pro-12in-1st-Ed-with-Snapdragon.lan ([101.178.35.31])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76be9143983sm28875783b3a.1.2025.08.13.17.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 17:59:46 -0700 (PDT)
From: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
To: marcus@nazgul.ch,
	kirill@korins.ky,
	vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mani@kernel.org,
	alim.akhtar@samsung.com,
	avri.altman@wdc.com,
	bvanassche@acm.org,
	andersson@kernel.org,
	agross@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org
Cc: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Subject: [PATCH 0/3] Describe x1e80100 ufs
Date: Thu, 14 Aug 2025 10:59:01 +1000
Message-ID: <20250814005904.39173-1-harrison.vanderbyl@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describes the UFS nodes for the x1e80100/x1p42100 chipset.

This is relevant to the following devices/patches:
Surface Pro 12 Inch 
HONOR MagicBook Art 14 
Link: https://lore.kernel.org/r/871px910m1.wl-kirill@korins.ky/
Samsung Galaxy Book4 Edge 
Link: https://lore.kernel.org/r/p3mhtj2rp6y2ezuwpd2gu7dwx5cbckfu4s4pazcudi4j2wogtr@4yecb2bkeyms/

Forthcoming work *not* included in this patch:
Surface 12in display description
Surface 12in Surface Aggregator Module description
Surface 12in device tree

harrisonvanderbyl (3):
  dt-bindings: describe x1e80100 ufs
  ufs: ufs-qcom: describe x1e80100 quirks
  dts: describe x1e80100 ufs

 .../phy/qcom,sc8280xp-qmp-ufs-phy.yaml        |  2 +
 .../devicetree/bindings/ufs/qcom,ufs.yaml     |  2 +
 arch/arm64/boot/dts/qcom/x1e80100.dtsi        | 91 +++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c       |  3 +
 drivers/ufs/host/ufs-qcom.c                   |  1 +
 5 files changed, 99 insertions(+)

-- 
2.48.1


