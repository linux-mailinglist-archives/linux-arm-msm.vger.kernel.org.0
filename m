Return-Path: <linux-arm-msm+bounces-82720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0677BC759B7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 18:20:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EB74C343E6E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 17:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6A083A5E79;
	Thu, 20 Nov 2025 17:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l3Eo2nEh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969883A5E75;
	Thu, 20 Nov 2025 17:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763658710; cv=none; b=FDzUiweI4Z+oSA6mFWdFa5RYZQ7XiDii9Mvu1VnLsknN37oTEQw0jSpBEmGUMAC8f8znDKjwnuNXLqYAk5sGah5/MGAYJPl1Suvr+5pGE/9Rdy0/y8wP5eWkZ34MTzp7ktNZw3hp/2gWVFnkqjAOj6T8LMe9Yck3NXWbtIxEEzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763658710; c=relaxed/simple;
	bh=OlphYL/pQTTobxITFlwAxaI7JYWGH0XB6/e5NxExJYQ=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Dni3dtEiXMdG3id5v2C0KbSENAXF8ziQDdBRpfTzw5Q/M4u9PH6jDKcAxFKfvXUIJ2nFUDMPyX9WxcYkVd7TrTLZnWDLEI5EPahX2OBcy879V1RIoNVMwTc/pL77xn6+M66RMubS627hrNd/yZ8Kv1hX/0r4wKgvzQ8Pa+i1Jrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l3Eo2nEh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20DA4C116D0;
	Thu, 20 Nov 2025 17:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763658710;
	bh=OlphYL/pQTTobxITFlwAxaI7JYWGH0XB6/e5NxExJYQ=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=l3Eo2nEhr0xwRZUz/k7SyphHENNmugNBzj2XNZ/yo00gyNXv9sKJd7yT/DN5J8/XU
	 U6Vm8HHpO3Ma6vJlhjSCds256Ew1EEsw0ezA3Lm1a1ovz+epEtXSwW2fZNKDuXPZo7
	 cVDX4WXB3ol+MsROTlNp7265yElZeGKPHq9jmkmewEnd0PtpUeTyY4mu/e3fKjQw8p
	 U0OrfANiX7IDSlGvh3GflOATxegwk32Y1CnvWoKc5u4zMpD7M8EhsVM6BszYGes2Si
	 zTqeqTFt3Umo0Ow5uP3m+my9l4EPVDmVk8QhPGWvDchWXyvp7pl9EBYx59j1lWDsf1
	 qISU11IEndCTA==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20251017045919.34599-2-krzysztof.kozlowski@linaro.org>
References: <20251017045919.34599-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Restrict
 resets per each device
Message-Id: <176365870775.207696.13094000436105798381.b4-ty@kernel.org>
Date: Thu, 20 Nov 2025 22:41:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Fri, 17 Oct 2025 06:59:20 +0200, Krzysztof Kozlowski wrote:
> Bindings should be complete, thus complete the constraints for the
> resets by adding missing compatibles for devices with two resets and
> "else:" clause narrowing them for all other devices.
> 
> 

Applied, thanks!

[1/1] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Restrict resets per each device
      commit: a7f0d69ecdd2fec89ce1f9b600a5c721c017fa9c

Best regards,
-- 
~Vinod



