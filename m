Return-Path: <linux-arm-msm+bounces-68833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71030B22E2B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 18:49:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3038E171483
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 16:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF523279789;
	Tue, 12 Aug 2025 16:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ewk+AaHK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06BD2FF14F;
	Tue, 12 Aug 2025 16:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755016913; cv=none; b=BYl2IudtYCwvdLuIhCOXlWuvKvFOG3/CFib2kMMe7jxB15pyeGvfBcRkDHPltgtgegCBwdtTfcMc6BwGFH4cM+P08ouFvBgd27qieBg6FA0zVC7Bdvm5PdX+uZIpxouGwwYEOEbzoPW4T1yi45CW8bv2vLU71+ig3p7z8r4Nlf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755016913; c=relaxed/simple;
	bh=yQgCyFgmlpiQfbU/3+VFXyd2IaPslpZXj/9VuPOztFU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LQTdomjD6pz8r53GY9xqHyBXBIzrhksJtRlXwUds7FJVhaAaVOWIMzrcrmVD/byI13+TSeHSTe+ub85yfR3aFGYZyw459Kn5xrSPuIqP6v2dcDDDRsJsEHzGDA9InD2w+su2VEZIZkA4FYIxdjLI09NaTg2gyOBw20FiBK4ExAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ewk+AaHK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EF14C4CEF7;
	Tue, 12 Aug 2025 16:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755016913;
	bh=yQgCyFgmlpiQfbU/3+VFXyd2IaPslpZXj/9VuPOztFU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ewk+AaHKTP1J9VFrYB8nT2+5Cg6D99RsW5lyPD5+L4I9I3n5OXVHxm0slnz96N0YG
	 0YJO2IlR9zkGQeJWz/xSSPneYp+3Rt97D3i001ieiFK7jJafOkDEswF/T40lhMcwMc
	 JZfNFW6SOmdS7akXx03Mc+tMlplQSugtAa11JrY/KF9FerNQHVZvDAGNWTGjvQWa+6
	 9+WOvGdZRFW7cpimtjagJFHJ3OA4VknEt4L9bH/2hMT2vwekHZ+sReTRYhxRlWGyxv
	 cQo3N0Bq30hyDY4vSkbwfnZ8vZgSRRhE/CRSRfgDJ/DnqxLNtfZYyyBYd7h6bS7I/x
	 fi0gydERTUPDQ==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250709-sm7635-eusb-repeater-v2-0-b6eff075c097@fairphone.com>
References: <20250709-sm7635-eusb-repeater-v2-0-b6eff075c097@fairphone.com>
Subject: Re: [PATCH v2 0/4] Add support for eUSB2 repeater on PMIV0104
Message-Id: <175501690862.633310.534963018208999296.b4-ty@kernel.org>
Date: Tue, 12 Aug 2025 22:11:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Wed, 09 Jul 2025 16:55:13 +0200, Luca Weiss wrote:
> Add a new property qcom,tune-res-fsdif for the eUSB2 repeater and add
> the compatible for the repeater on the PMIV0104 PMIC.
> 
> 

Applied, thanks!

[1/4] dt-bindings: phy: qcom,snps-eusb2-repeater: Document qcom,tune-res-fsdif
      commit: 47e9b6f601932899280f725b0fdbc4d4f85e2719
[2/4] phy: qualcomm: phy-qcom-eusb2-repeater: Support tune-res-fsdif prop
      commit: 8e086fe190b63ef1d0d31b300bfefb5d00217427
[3/4] dt-bindings: phy: qcom,snps-eusb2-repeater: Add compatible for PMIV0104
      commit: eb86c2ce4a89157da71d3a7953eac4dcde7d5527
[4/4] phy: qualcomm: phy-qcom-eusb2-repeater: Add support for PMIV0104
      commit: 8427a4ca85b36247cb2c055ec7507a78a19246ad

Best regards,
-- 
~Vinod



