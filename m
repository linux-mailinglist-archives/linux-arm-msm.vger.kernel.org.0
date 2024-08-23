Return-Path: <linux-arm-msm+bounces-29377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3735895D3F0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 19:03:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9112283BBF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 17:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80F5D190463;
	Fri, 23 Aug 2024 17:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VREJfoRV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5014C18BB97;
	Fri, 23 Aug 2024 17:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724432556; cv=none; b=F3BoEF152Lb8K+QsIvqNT9I7cpMLTwrzFrEXjOrW2BCHYzDA/wMM9pX4IwNjH2coGfP24tfPTaWKg7Ue7GiFMmptr99fG2UPNHes2w6PYgSTSi4gKERHj+oE0teOG+/HLrmFGI3wD8B3aqEr4m+0zh+v5PsWnH7a509a6IS8hbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724432556; c=relaxed/simple;
	bh=KTOqkWcx4VJ3PzktD2qDUCcUOUY9+HIU+QUcTAXO0s4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XY8JHPuCCeu+qBxSLiFbWfDOgx2maLCJMY782S7LNo7YA6B2/pa7NSiAGNOc8YtLNPdxdAgxsad05kwISzFCnCH0cZJfdeuf9de+JUr946r/LcsF91aefmGk/+fBSL0sW1grLQ9HbEs+EcIcJhpRX5k090n6IG5LNOKrraI0Mwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VREJfoRV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 146ADC32786;
	Fri, 23 Aug 2024 17:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724432555;
	bh=KTOqkWcx4VJ3PzktD2qDUCcUOUY9+HIU+QUcTAXO0s4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VREJfoRVY97Dv8b1g+75FarIAmgTQalQ8zeeaU5A5NTBdBFRP1QLr7LfxvbtFlwZK
	 ORqPD854lMYLJxFRiFuaAkYYceJSA6hdCVJ2rixtDC7OKSDL2AF4VG5+hkzp5qMscZ
	 QfV1KRgn3/zLCWwf5XKg9nG6e4TPkLxzqNXmMBmGbJYKbAHsHNG2KPS9RO5n1znY0i
	 Q7Znl+a3XtIPSICWAgno0ad+MI4Me5VmYSVCqZVXn8hDz51kF4DBuoJFMosFbzwQM9
	 Ykg1bkmJGxTwfTouNR7aX22JRlhEwXPloE4uayV6b+REwl0bh9h0gJlqFX+AYRv112
	 qJ4Wx3Q6Z0vng==
From: Will Deacon <will@kernel.org>
To: Rob Clark <robdclark@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marc Gonzalez <mgonzalez@freebox.fr>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Arnaud Vrac <avrac@freebox.fr>,
	Pierre-Hugues Husson <phhusson@freebox.fr>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Caleb Connolly <caleb.connolly@linaro.org>
Subject: Re: [PATCH v3] iommu/arm-smmu-qcom: hide last LPASS SMMU context bank from linux
Date: Fri, 23 Aug 2024 18:02:11 +0100
Message-Id: <172442858770.2796746.16801443724407766952.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20240820-smmu-v3-1-2f71483b00ec@freebox.fr>
References: <20240820-smmu-v3-1-2f71483b00ec@freebox.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 20 Aug 2024 15:27:19 +0200, Marc Gonzalez wrote:
> On qcom msm8998, writing to the last context bank of lpass_q6_smmu
> (base address 0x05100000) produces a system freeze & reboot.
> 
> The hardware/hypervisor reports 13 context banks for the LPASS SMMU
> on msm8998, but only the first 12 are accessible...
> Override the number of context banks
> 
> [...]

Applied to will (for-joerg/arm-smmu/updates), thanks!

[1/1] iommu/arm-smmu-qcom: hide last LPASS SMMU context bank from linux
      https://git.kernel.org/will/c/3a8990b8a778

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

