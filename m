Return-Path: <linux-arm-msm+bounces-50910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A006EA5BA8B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 09:12:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0C84172951
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 08:12:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10A3122423A;
	Tue, 11 Mar 2025 08:12:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66492222B4;
	Tue, 11 Mar 2025 08:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741680771; cv=none; b=gTSCM+MjDRTytN6WKyIs321YPOIi70Pa1pwBZNn5NH9jdTymORKo5hGzvCyxDFkMlrAMYn38iN/ROJvQFa31FMP1P8xFS3B2O/pdDHyK7fy6qg7kdG8Jt9QBnXRcvCPQ1YZERaUlulu8EpoZd5n/Q42e+Ry1LHTFuZCoERbjstg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741680771; c=relaxed/simple;
	bh=6YqzCJhowiIQIsNjcJHmJ5hy9BaM9YD0GAQwzZ4YJp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HittDjys3Y1noThQ+CNJynSD5Vq823SHEsHrFQcas2r+SD+z0bWAu1UvKx85eMGPKvWusuzjaNEtmvgDMupsaPatFP/aTR/W5co3myX2UcLynXHcgiY7+IfpPIC6ir6Zr6DYjFsqeP01dMb3vtm0V00PtUUhCmUyCvaV9SHKugU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39F87C4CEE9;
	Tue, 11 Mar 2025 08:12:49 +0000 (UTC)
Date: Tue, 11 Mar 2025 09:12:46 +0100
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Gabriel Gonzales <semfault@disroot.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: qcom: Add Xiaomi Redmi Note 8
Message-ID: <20250311-hopping-pearl-perch-ee05be@krzk-bin>
References: <20250308013019.10321-1-semfault@disroot.org>
 <20250311003353.8250-1-semfault@disroot.org>
 <20250311003353.8250-2-semfault@disroot.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250311003353.8250-2-semfault@disroot.org>

On Tue, Mar 11, 2025 at 08:33:47AM +0800, Gabriel Gonzales wrote:
> Document the Xiaomi Redmi Note 8 (codenamed ginkgo),
> which is based off the SM6125 SoC.
> 
> Signed-off-by: Gabriel Gonzales <semfault@disroot.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

How did you resolve my first comment to your v2?

Best regards,
Krzysztof


