Return-Path: <linux-arm-msm+bounces-64859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D56CAB046B6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 19:38:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED3B41A66B9C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 17:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD53426CE08;
	Mon, 14 Jul 2025 17:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CFZKOxot"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E4F26B94F;
	Mon, 14 Jul 2025 17:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752514601; cv=none; b=Pe+Xe4gFecFpIQWZRiM13vVI7PmAM6Gekb75lW7pQpGl8vovOzOuh0Qsgxh0vBa7k4K4iKEw4dtse8q1qsJwXkq8C06p2BhKccMigD8kcwVD3oOXYXZRhOsCTp6g6UZTDPsPbFnERmRFrmW0r0U/CdTqESTUBi+gg4BvlhX7J/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752514601; c=relaxed/simple;
	bh=oehdEeKm9kI88q70n47MWHIjjBSrXGi/uuh/D7y5zjY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VGU28RGxOnCtH2ny3N4gd0E10cfGXESJcX6hvWgDuOu09JTCAmVETBawG1+1u9caJZ9ycBEhSI+uVtZ2laQ63faOgs3nyUXi94aIF+wn9kdn+wZJ1Z4d5ng32u5m1WCsmX09TwOaUaPn/YryRvT0dIOn5HkHI++Nf0vw7x3zP74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CFZKOxot; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a4fb9c2436so2772358f8f.1;
        Mon, 14 Jul 2025 10:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752514598; x=1753119398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ziVMrMmbR0dWr2zJ1Pu1JbqUP5thnMzMQ0tenEfUnNA=;
        b=CFZKOxotUANzql/bEwXQei7iWOxA8jgVuvlSfio4yHAQ8mb1tew7gPs4YPQNSHPxHY
         fRzk1gFrOo0+hjWL7yaVH9zy0/JD3Bt8JVKSdsPlzqBcdc2d/6LduWVJ8Sb6o+qC7bR/
         LoyBxnVGaqUGlMikSk315yDIN10+X70RV31TgkpygKJsCaG7jh3ZSN8QPDNKUAt3+h46
         e08lLaNWjVcWaKgaCfbM83QWWB8WBN42qCxjWfEvT9QY8lTb6fSlQPaOL8UE7vUHm48J
         2fHo6T5J2IkgyQFGyGbkBFqrNlHWQc8nX1XftirRKuqWWgJgMvEb5WbAD5ESuJXpHGin
         kwww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752514598; x=1753119398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ziVMrMmbR0dWr2zJ1Pu1JbqUP5thnMzMQ0tenEfUnNA=;
        b=E6Rlw6quOyQNwzY9AZy3pR+l2rAMK2m8w+yNnJRHW7yrnh9H5BzSqKIZwepaUZP5l+
         mArR9Svncdqp/V0B96CAlfX6FQGD+7zyrUcFn55v1BK026RjDr6YmRJ7XAzhzB5pCbQ6
         FKKkaaRyhIqFWv495WnUP1mHqy9fUwrV26S07WA3EKzxtCffpBP3o1of1xwRQNdjEt+s
         oRvug1RO48T0nsBsT6v1SOWNKAo66VpqBSXduJAZ9+rCxaZ13m4hDPqOXgB8gK35pV3N
         OjudSZUh2RHtrSVfh3765pEa9GVh+W98QXj30DBFGUbxuLdq0KzMbIqFi6J0kfTP96jh
         lJIw==
X-Forwarded-Encrypted: i=1; AJvYcCUjb84D1nW/1r9qBUbb8IBRPVejO9rkCYWZXvumatnYrgB8RFtWQg0NNK70ic0JzY2SGW0bnYK/OXeEmEpW@vger.kernel.org, AJvYcCX6f2ZpkhoXVeNRr5TR4dEEP+gJL97hNd6LQOyo+q0ELfAhtSaZ/SmMs9DGnUU/48umaXnQndZAm1TWYLPI9A==@vger.kernel.org, AJvYcCXWAL+SzBT7y1FArNcJb825+j9pxLTt1ztxMiVqFUnhVCel+JN1+qwhliTuWNxdb2WOhHjftHtkgPKa@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9L4NOXVkNqCJ4dX/ZYrpOqNTJTd9jEmOZSybCq2JnkD1S2oHB
	Z5MnNeOAq32syix3FK0JQ7eiDUlyWpyqZDkH4FPgWqf8OQfmrrx+Dyab
X-Gm-Gg: ASbGnct56Vr5ilAxG1/5gKkXBKJytKrQ9T82N4sc7gSdnU/JlvFRpI9N/63HGTpy2ir
	WioAP80YDmyamBhGGA9m7YE4PTWokdxXHuwBknCEn2A4TC3i30jeVXiTz8sUTLflhHrDwZDn2wy
	r9XNHi+xk9yyQEY+OVW49lRiuQs8Q3Cl8oqKtVAwTVbHpRJ7LOKurJQEMd7puC2WGvyqWTZAZ0m
	O3t1AgN7Z00cVIICMHGS8jO4xMSPwlWjQoddu8kukJi+GNepDh0flLYHBStsFujJL35Kpynrz4F
	cup3kplTVKPxCpNZOrSOf5XveKmIXC/aMmz4MIjVN7SD/BeFfbRswMpM7zHpC51CMCYH01eT3LB
	rlaaEzXcIICVaLrHSjFZlXlu4o5UQ0GeI1s0=
X-Google-Smtp-Source: AGHT+IFVramoK4fTJKXeF9Fp43GyJC3tUzir0w1qylRSKBhrMIkyZ6UI9FjlhUdyjFhwG8qOQLESeg==
X-Received: by 2002:adf:ffcb:0:b0:3a6:d7ec:c701 with SMTP id ffacd0b85a97d-3b5f18cec8cmr9405796f8f.30.1752514597928;
        Mon, 14 Jul 2025 10:36:37 -0700 (PDT)
Received: from alarm (92.40.201.95.threembb.co.uk. [92.40.201.95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e0d872sm13152531f8f.60.2025.07.14.10.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 10:36:37 -0700 (PDT)
From: Dale Whinham <daleyo@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?q?J=C3=A9r=C3=B4me=20de=20Bretagne?= <jerome.debretagne@gmail.com>,
	Dale Whinham <daleyo@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 9/9 RFC] arm64: dts: qcom: x1e80100-denali: Disable rfkill for wifi0
Date: Mon, 14 Jul 2025 18:35:45 +0100
Message-ID: <20250714173554.14223-10-daleyo@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250714173554.14223-1-daleyo@gmail.com>
References: <20250714173554.14223-1-daleyo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use the devicetree mechanism for disabling rfkill to do so for Microsoft
Surface Pro 11.

Tested-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
Signed-off-by: Dale Whinham <daleyo@gmail.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-microsoft-denali.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-denali.dts b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-denali.dts
index 8bc3959537ab..18ca83ab637f 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-denali.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-denali.dts
@@ -977,6 +977,8 @@ wifi@0 {
 		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
 		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
 		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+
+		disable-rfkill;
 	};
 };
 
-- 
2.50.1


