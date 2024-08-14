Return-Path: <linux-arm-msm+bounces-28560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBE6952498
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 23:14:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A774C281675
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 21:14:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E56031C7B7B;
	Wed, 14 Aug 2024 21:14:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from gollum.nazgul.ch (gollum.nazgul.ch [81.221.21.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4070D210FB;
	Wed, 14 Aug 2024 21:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.221.21.253
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723670096; cv=none; b=ZiP1xvm6vG2FRDGrF1gC8CJL1L8HSqb1hjyN/LPPF+3caEjfU51sUv77JYY3P12iNjQz+I1VjLU8/LPthcJ082Z+x1MNrdQgyPuMpnaNhm6BWECjZ2+L+/ZPQOd5ouzNqpovI2WCTmEZ+3IBocKVj/1wiF0M8BthTcNdmyi0clQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723670096; c=relaxed/simple;
	bh=JMXSrGzyOrxJwig1REfyP0Pcwp5aaD5R5FYwFDeHZxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PlV4bEASgiW/9iz/dlciIr20Y+tKGJcey0zIB+rfPGRDdBHmvb6gz1tMZM5uMyduyWmg+7HVLfvf3bJF1MuZZHT1MB7QjBdc5Y4RG70NpMpKS3/TTJIC0S94zA3QHZ5OjBzkNhfF/uLNyZc0PPCn9BcEO4DbU5vBvD8oZqAJSGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nazgul.ch; spf=pass smtp.mailfrom=nazgul.ch; arc=none smtp.client-ip=81.221.21.253
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nazgul.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nazgul.ch
Received: from localhost (gollum.nazgul.ch [local])
	by gollum.nazgul.ch (OpenSMTPD) with ESMTPA id 0a1a0987;
	Wed, 14 Aug 2024 23:14:51 +0200 (CEST)
Date: Wed, 14 Aug 2024 23:14:51 +0200
From: Marcus Glocker <marcus@nazgul.ch>
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v2 7/7] arm64: dts: qcom: Add Samsung Galaxy Book4 Edge
 Makefile
Message-ID: <mtyjmbhqv5otvxhxyyvkxg6tubmtkeouwibmsmywmjdamnqnus@mow2w5trrmok>
References: <qv5pz4gnmy5xbxxjoqqyyvn4gep5xn3jafcof5merqxxllczwy@oaw3recv3tp5>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <qv5pz4gnmy5xbxxjoqqyyvn4gep5xn3jafcof5merqxxllczwy@oaw3recv3tp5>

Add the new Samsung Galaxy Book4 Edge to the Makefile to compile the
DTB file.

Signed-off-by: Marcus Glocker <marcus@nazgul.ch>
---
 arch/arm64/boot/dts/qcom/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 0e5c810304fb..77a48a5780ed 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -265,3 +265,4 @@ dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-asus-vivobook-s15.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-lenovo-yoga-slim7x.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-qcp.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-samsung-galaxy-book4-edge.dtb
-- 
2.39.2


