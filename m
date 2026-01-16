Return-Path: <linux-arm-msm+bounces-89395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9FED3184E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 14:06:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3838D3079AD1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 13:06:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 558E7227E82;
	Fri, 16 Jan 2026 13:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KdOXIaJd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088B21F63CD;
	Fri, 16 Jan 2026 13:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768568794; cv=none; b=L89mgsbL2V2zQ6SiQ4ri2a8sooyJ5sZvbiaImGaSFrxSi9Oyz3X2TeYhEBQ6RHV/4p4snYSglwqyXZmLtlL/QlV5TMuel2woKzvPPJrdYtR0tRnA4NHz8TrpiWGbVqm97Vy2eo1v2sdClDodYUEfpTaXbY0WQskVxR5xEmretPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768568794; c=relaxed/simple;
	bh=rHUf+JZbo2wTn2ptFsRNPlwU64tL20imtFJEHPCL7EI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ROkcKzu1LOA+rhXlZshiR4lbxkxC+XLax4o20G4eT8WBcEDDmXF7jUeS+HwE9ArjcfXHiszk4nFCGUoEcaWRdenqfqt/XQSFVaYEep+0VvZ5AKhE2aBfP3ruAd3FBwQLJPO7LJs6Yu30nId1DXNMbfvOQlEIMPtvce1daU6nnv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KdOXIaJd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F784C116C6;
	Fri, 16 Jan 2026 13:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768568793;
	bh=rHUf+JZbo2wTn2ptFsRNPlwU64tL20imtFJEHPCL7EI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KdOXIaJdlkxUMW3L2va4UeC9Urxxa5qjGXQD7LvfydF8LJgtcvpyXSYc5+7fYTlzQ
	 mVfC0KfYgg9Vu2Xw9vE+4qhr/fj/jEBPPUQrKNLigGd9uY6XbpixJS7iWZikChzYz+
	 i363HcMI45ykE1IbzB38CRYcsLF4XW/oHse2amXjuZ3zlWUcXDjblYtJ4RdpQeZIDg
	 ADJ6OHly9zMMtztylKdE5ndR0cpFbK1hvegPodLy2Boorzp9G8cMsI5KJ+RqBXY7ww
	 bSaMP20oHo8u9Dx0ePXcGSxI5kUMdCm6WZZTcTiwnLsEN9XiuqPkTtjSTZ8p3Vi8GI
	 lLsZUmIcB7D2w==
From: Srinivas Kandagatla <srini@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251121-pakala_qfprom-v1-1-9d16485e540b@oss.qualcomm.com>
References: <20251121-pakala_qfprom-v1-1-9d16485e540b@oss.qualcomm.com>
Subject: Re: [PATCH] dt-bindings: nvmem: qfprom: Add sm8750 compatible
Message-Id: <176856879210.548691.7192450471322849839.b4-ty@kernel.org>
Date: Fri, 16 Jan 2026 13:06:32 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Fri, 21 Nov 2025 18:36:40 +0530, Komal Bajaj wrote:
> Document compatible string for the QFPROM on SM8750 platform.
> 
> 

Applied, thanks!

[1/1] dt-bindings: nvmem: qfprom: Add sm8750 compatible
      commit: 5b37fd2746aa528e2acd9c9ec5b26f52002cf0e1

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>


