Return-Path: <linux-arm-msm+bounces-51389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F4DA60CF1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 10:17:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0AD43B2853
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 09:17:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9053E1EDA33;
	Fri, 14 Mar 2025 09:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="sn7xSLH5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F9B1C8613
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 09:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741943838; cv=none; b=ZxThnEPsBk/D4bpji1leNKa6F9vYRAP8W8B30+nQseE5/lGqMREY1Xi1L0O3d958+kZgILhS7OMucP91/pQGeBkP7UhzIKcV6pvE6wfdh/vKBxiUr9BmciF1Mk/Umh2wR4nMndVB4L+VHYH4z8R5odX+XxrspIB+RqtD8Zn6N7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741943838; c=relaxed/simple;
	bh=KUctck5B55TBuotnv0g4TVm9b/ov5ZebjgiW7exjsQo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LCGF96awLSak3ZOw6VxN5TKDGXKcR5wvou4ZShBhhclIJ+GFBpPgFG7Qtc5LxomAevkn8P01qUTcruewxnid5a6m/X8neaQmQPR4GLhvH6BrnYT8nyc4BCq0cU8J42qjqRz68wcC+F/7yBZsxY/SiMC2cJ5qFGCTbUUD74SZn4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=sn7xSLH5; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac25d2b2354so328381666b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 02:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1741943834; x=1742548634; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DduIjgVbqMB+YIwUT9DVdolqDatgrNDkgwKYlFwXCYM=;
        b=sn7xSLH53u/FyO8GYZzU+bXDy6EiauK2H6aQb+V9p7JBxxG4EAA6wooCde0WxQDXaa
         xp1xbHGuAU1x5bTLqESpzj8taA8S7/9VxO+TbGR/tjiv9axNa4IqUmizoyR9smr2SFlC
         k2Q3ESEFgCMgdaeCgzbpVUeOZNqJBXQMyU564+bPoW60/rEyDzicwhcyfW7VKy2spYe/
         V6IJ9l3p/+JBPOLBXM+uhXK0CDjeUQDXQL8W4JkFiW9Wz4+xnlDlLk1DZYnqD2r4QfaS
         8xtV74OHr1xbF1YESBdmDECAzxjorEpjUMCRtmnskNjDMMxO3wMszLJ50okCSYCeTBci
         HiAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741943834; x=1742548634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DduIjgVbqMB+YIwUT9DVdolqDatgrNDkgwKYlFwXCYM=;
        b=D5tN5koM3pbglDf0jwvZNpT62QUNX9g7GqmBW87+R4U7KJtOQlp22BkEgGNQ9WfMyj
         eepvi7b/Ujo6E9Y5d5BlY+X+/10mkDp4L+L7hiLujuwMjRjw1i4pvGhSE0srSGTSsFgZ
         JW1yjAy47uui7yVoAnlkkgGdjB/OJpNyBLfydjNB8udChQU0WNzS6/oPEiSJuUEP9yBx
         EekaeLIHFawQ1V8b2r4mn4gC8b1V/VEw80C92zk6Oe7iYxZs/1mtERTIOkEHjEC+A7pf
         jZficx3wroFcUQBrh2IFGzUx1IOWbGCxkmUYol0p6QRjjYLqLHXesf63QNev7/IVmgsM
         siRA==
X-Forwarded-Encrypted: i=1; AJvYcCXo8/2luxB3II1CVNkBXFfJ7/1Ofeb8btnKL/qNBfEojEhuVn4a+7+LQFx5i1eSwENl27hY29B7B9gs7MzR@vger.kernel.org
X-Gm-Message-State: AOJu0YyGSTEzDOTzFkRm+8d7kw6KMLSmqjmBP2AZtcAhOMU9pgZYp8lG
	oxpmzdud0/emORkk+F5Odn2FIH3mqGooGyWkMXu0PD9l8TNrY6XUPJkuQ5sQky8=
X-Gm-Gg: ASbGnct2r3v0IK5/IntQXtjZbzf4Y2a5Q3pXvncl2uiFMb356fIsiOFKY8CH+AuAW5F
	gAcRLkaUlmglL1/MCEtpq2Mfi1egpMgvBwykfHwoEIqvJagfosww4VQ/rcCOhuN6M7oOxFQZeAl
	wxvD8RXqnDSR2yWSWS89HmWj6VOqOS9ThyAGjAHH1FmtI33nOn2wUOA6TQdM2FWPNWaXb8TLp2Y
	ZcKWHj0zWexDs99yORLLJRlnkr71RzWyM7TP96419UY2zobjwOdLFLyy0jkZd6Da2WFUVDzrWgG
	zW1KMoiwUtBZW0C6xddr1k/o+Sdgnu3dyfdmvQsSEvaewxvlyLpoMF3lZLkN7DoRBlb7n+mXglD
	7Otx98G1Kqwn2ijemtQ41BABZZdS1
X-Google-Smtp-Source: AGHT+IF2fMs8v6rvbwb4avWb30H2q3Lx24BGBU4BTH0RNBEh5rOJldaU2Obk6124KsZ+HU4ZWVHV7w==
X-Received: by 2002:a17:907:7241:b0:ac2:4d65:bd72 with SMTP id a640c23a62f3a-ac330441d57mr197243166b.36.1741943833904;
        Fri, 14 Mar 2025 02:17:13 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3146aeadbsm195582166b.29.2025.03.14.02.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 02:17:13 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 14 Mar 2025 10:17:02 +0100
Subject: [PATCH 1/3] arm64: dts: qcom: sm6350: Fix wrong order of
 freq-table-hz for UFS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-sm6350-ufs-things-v1-1-3600362cc52c@fairphone.com>
References: <20250314-sm6350-ufs-things-v1-0-3600362cc52c@fairphone.com>
In-Reply-To: <20250314-sm6350-ufs-things-v1-0-3600362cc52c@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2

During upstreaming the order of clocks was adjusted to match the
upstream sort order, but mistakently freq-table-hz wasn't re-ordered
with the new order.

Fix that by moving the entry for the ICE clk to the last place.

Fixes: 5a814af5fc22 ("arm64: dts: qcom: sm6350: Add UFS nodes")
Cc: <stable@vger.kernel.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 00ad1d09a19558d9e2bc61f1a81a36d466adc88e..e6df0b7dae8baf39bfa7ff3856759e8cd200f0c8 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1177,11 +1177,11 @@ ufs_mem_hc: ufshc@1d84000 {
 				<0 0>,
 				<0 0>,
 				<37500000 150000000>,
-				<75000000 300000000>,
 				<0 0>,
 				<0 0>,
 				<0 0>,
-				<0 0>;
+				<0 0>,
+				<75000000 300000000>;
 
 			status = "disabled";
 		};

-- 
2.48.1


