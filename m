Return-Path: <linux-arm-msm+bounces-51504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA82AA61BE4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 21:09:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A8D761896F84
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 20:09:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4DAE229B17;
	Fri, 14 Mar 2025 20:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B9qpQy4h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C01F227EAA;
	Fri, 14 Mar 2025 20:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741982526; cv=none; b=VaZQK48xxAbId2SI8a2z7HL4ow4LZV44APzixQKVGIdEtMW4BzZmmZrixpbcjzyL+Q1sou+chyiaegjUpZRpjrh1X7lYaJcadesypzrxax3hmbmk3EBvjyB4vfsibfVz9hPCEhp74au9XZkhmDpmu6W1Gx5r2bVHApbmIJgahGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741982526; c=relaxed/simple;
	bh=QiRgZpcEnolWvkGQmaPXHmEeJbopoy4cgKM+wY2qx8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LeOXZEChXgG3liNPaN8QKYKkzcKwrtL+G6EXHMdd9RHWSOLNM1Yi3nSLgqVMO+EKDkVnDeRvNf94ljewjBIaGfYgRQVnEi7h9AJ2IVt/relW0zeD1/W4bwUru6U3Wenj4T4kkzeE3hQm4jeudCq/ZCs3dUnZ97A6S8o/MyOf6Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B9qpQy4h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D97AC4CEE3;
	Fri, 14 Mar 2025 20:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741982526;
	bh=QiRgZpcEnolWvkGQmaPXHmEeJbopoy4cgKM+wY2qx8E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B9qpQy4hX6dEtdiBku9CCzaFFZaNX/CNzF2gHNQtws1qADqFpxSWescP3+vPwhM4R
	 iF9QkjTvjI69+hCOmVvIvTRCk2kceSwi6Gp+8DxvRPRpew/RnCZi4SsCbdQz5R9OzK
	 7hw0HFQmc7j9LBwpvJgWSN5+VWADBytZDetyaCBncNf3vM3qFl8sgqh10pwB8S5IhJ
	 zGLPlaBvJVg1zpVmTjpRLWEc+fjvuqL9+jNEldZ7OH/ikg6Fol3J98jnQgq6EPzOsi
	 w91/3/gFqHyLHib6nVJOASRgQc7TNS6n2NJwSPkPictbbX6Z092CeXEu8fa3oo0hDb
	 U8yJwnADfSn1w==
From: Bjorn Andersson <andersson@kernel.org>
To: Gabriel Gonzales <semfault@disroot.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Add Xiaomi Redmi Note 8 support
Date: Fri, 14 Mar 2025 15:01:18 -0500
Message-ID: <174198247888.1604753.6937674373907241065.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250311003353.8250-1-semfault@disroot.org>
References: <20250308013019.10321-1-semfault@disroot.org> <20250311003353.8250-1-semfault@disroot.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 11 Mar 2025 08:33:46 +0800, Gabriel Gonzales wrote:
> This patchset introduces support for the Redmi Note 8 (codenamed ginkgo).
> 
> Changes in v2:
> - Add missing cover letter
> - Fix up commit message for schema
> Changes in v3:
> - Use qcom ids instead of hardcoded msm-id (and other changes suggested by Konrad)
> - Switch up model properties and qcom properties position
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: qcom: Add Xiaomi Redmi Note 8
      commit: 4ca8d6f898a85070934490071e429e97bc4e219b
[2/2] arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo
      commit: 9b1a6c925c88ed9331a2cae64fb3580e05345ded

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

