Return-Path: <linux-arm-msm+bounces-42993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 584C79F9600
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 17:07:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D054A1885260
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 16:07:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAA68219A8E;
	Fri, 20 Dec 2024 16:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QlSzWFHO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CDF39FF3;
	Fri, 20 Dec 2024 16:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734710818; cv=none; b=bEutcWiRqTzFi0uObhwE8geXAlrxgm1LtqDuLxTdvNvrWTR7L1G3hSqZvUs2IvdQssd52SC/Kf+AM2js4qKu8Uejoma6M5XRSuNNZHGW6mRQvjoSVz00cBJRKCJnrm/OI65G5zC2LOfQUn93JLXDK3he6OI7LnXbKp1kjOatDNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734710818; c=relaxed/simple;
	bh=2JgiAoX+L/+9bc3g7DrGQBd1bwIxdJ7rvydj8aRzbi4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CTyH9+x5umDp0KmJaJOUKfK05r4GU5BPUxhtX7CGGyqWy+VGxUrg8FdHpCpMS/4lsEblP/RSx6Etbs5IiyqeVhXxyVYexZr6DiGRTw8epOvP/kocei3X2rUNjQo5wbvLMHymrxUJ+BrN4s7pwBpR2fkdhc54TXbMscikx0XIg/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QlSzWFHO; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2f441904a42so1976400a91.1;
        Fri, 20 Dec 2024 08:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734710816; x=1735315616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VfXD+JoQjgnUUqcxHjy/WcPALBP2ukAr4QL3uOyRUB8=;
        b=QlSzWFHOI2gtXFy7pVlQvtB5eiOeQvidwKJcuFpcRL4wEJIW5pieGMyCdcQuG4AwEb
         LQjKN4jRkc/x88qeaM3l3YyLL85yqZEUQLXExSW4ewTcJbFvjU1dT4yYXpvIHV+ob7hJ
         VH5qHfVgJMXGePH8rBKtz+sEuR5sCpTjJymE00+pqNvRgsReDnsUF0XjtEUs4yRbTiVx
         doJ/3nRrvnppJI9/J/Bt5DJc+PCF9h2Ej+YZDqoOom/7za3Uh6yLEWaE7TrELko9IbqU
         JrayNtyY3Z3E++Tp8JRDO4cxDDaIPhBLhY6eudiCoBrunbbyxdNDHzZNDy5lOUyyISM2
         ERew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734710816; x=1735315616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VfXD+JoQjgnUUqcxHjy/WcPALBP2ukAr4QL3uOyRUB8=;
        b=n5x6LXtRhz2d468w3ak3DlBHrlsFpt3cMSTv5UvyPUIpkMtGKJ2qIAIlMiNuPSpQ3Y
         HigV9dHrHx3TlM/PrY8w1rahyevbpnnEw9wYybY+Cr0gqCAmIg7W6F5oO8zzoV/jGrq6
         3sfETzbYLieZPthr+RJ84aVpTz8p/W814iT/eHyfOsabddkMo0Ib04uMFQttiKscaGrf
         N8+Hf10Qc7K65hg8TrGcUKz5hYeh2ltVxuQboKJovKi0QGbQGIUEBZlqdFINnhpvtMUc
         eGtybTIKpNN3lpvNkMMVApJldDwnqh3OCX7RmLxbNz6EAx8iSvedG4bgFJ9Zb8o8+Moz
         xf2w==
X-Forwarded-Encrypted: i=1; AJvYcCUAOLH3R8bewxKwhMWe4S/mOv1E3iYcPW6Bo8VOIFIqN81Bfedxcm9NB5H0zr2Zbo4f4fNLyZlU2KI9@vger.kernel.org, AJvYcCXF2iIY64GMuR/MIpqhv/3/dsCyKSctOCU5krL8wCXH2S9gqvcLoOSND/3z3RWiPkFEojMyeUyeBBrm06KF9A==@vger.kernel.org, AJvYcCXpEfbCQajP2FDr9IF0+cu2ozL4ksnNR6DW4AHul3rA70ftVYinbgFy7np0vlmkJqcFAupY1lnwBIcHipc4@vger.kernel.org
X-Gm-Message-State: AOJu0YxmByugaehNrS6PRtHP+ebxZhcweASnIsjEmGOXtJ2pseLGa7sB
	NL6ebclnYylR0g/EVDLAz3pn+4C2EELGhB7cezU8eiq/E4R5/pKnPEwdaa33L33bVw==
X-Gm-Gg: ASbGncsGQq1h2T6Ouo3aRXZ3iLPKYkuLmp22Ubj36F5FdUC+wMiKtSnhdYoh38G6kvT
	r+SnBVrsuTx1Azj5H7nFV6tnbqbuKrgjPBgx8EKIIAUwyfYftLxQgTuzEuaQcmTyTPlJDZ7rjEr
	j48nkuMJTkfIBqVBbAjXTGeOaVN2Mpleb6Zq/hTg5NmdDURtThFh9Y1gxuJP2PHq8BUeqZXdoMH
	FeaQA6ZRma7ym8vakVM+C1xqcXijMSP+IlUn9acjSisfIR5HJVWUeA=
X-Google-Smtp-Source: AGHT+IH2V6ZisUpIvPJbvTXf68qd8EOTHPk9M15MkiducFTNdphTRR3dM5l0SATU96Hk6r+EPknf4g==
X-Received: by 2002:a17:90b:2c84:b0:2ea:a25d:3baa with SMTP id 98e67ed59e1d1-2f452dfa40bmr5492288a91.5.1734710816428;
        Fri, 20 Dec 2024 08:06:56 -0800 (PST)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f4478a92absm3518771a91.44.2024.12.20.08.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 08:06:56 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: andersson@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org
Cc: chenxuecong2009@outlook.com,
	devicetree@vger.kernel.org,
	gty0622@gmail.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/3] dt-bindings: arm: qcom: Document Huawei Matebook E Go (sc8280xp)
Date: Sat, 21 Dec 2024 00:05:28 +0800
Message-ID: <20241220160530.444864-2-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241220160530.444864-1-mitltlatltl@gmail.com>
References: <20241220160530.444864-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatible for the SC8280XP-based Huawei Matebook E Go,
using its codename, gaokun3, which means it is the 3rd gen gaokun.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 9679fed72..355b17259 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -822,6 +822,7 @@ properties:
 
       - items:
           - enum:
+              - huawei,gaokun3
               - lenovo,thinkpad-x13s
               - microsoft,arcata
               - qcom,sc8280xp-crd
-- 
2.47.1


