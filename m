Return-Path: <linux-arm-msm+bounces-62885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B710AEC1DB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 23:20:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B83C7AFE73
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 21:18:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2040260565;
	Fri, 27 Jun 2025 21:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UXbdXjA5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CEBC25FA2B;
	Fri, 27 Jun 2025 21:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751059179; cv=none; b=c24KC4Qs1zLyKUfMvIXmDmuttALOzi8CsPJFFWinQg+7EpG1bDKQps8vXg/Ot+4K3BI5Cxn/g1/pm8IKO4NtLh6OI97VhNhPCO25pICOOitjOAL53fgdq6LSfOevrw7+EXUPyfhkapgYNZ3YbnooghNiw0+9YWgilJFLNNm5g+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751059179; c=relaxed/simple;
	bh=wklDsfEJpJaBe7Nk3HKwRgrQnB1yYiGMPBj7+FKQuT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uGb40y9ilhAI4lnUEMVYZean+Vdul4L31pLs6KDLKZ5yMz3WNCuhIWiDjx0ZARFtdLis3kTkdpgiFX5AACT+CnWDmWz2zHqHZA+Ft9Qh8VHJWukQ/N/Z94jpSkbgk5U/6iHH93D3irHe8sSyXAyGu4Gx7MkvfdXiLqFh4zgM7zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UXbdXjA5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF18AC4CEE3;
	Fri, 27 Jun 2025 21:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751059179;
	bh=wklDsfEJpJaBe7Nk3HKwRgrQnB1yYiGMPBj7+FKQuT4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UXbdXjA5GhsGA9gv5fwqxdeuZfELpBD2380eG22en+tF4FO8oa5wIpCboTW25zO+M
	 AwKqKnNNjzRKNB56RgQHyB2vS1tXQGP3y03HbYkmQ8dnB6i5Q5t9UidnzfXedN9/b2
	 LX1YgiRXQ6BXs4HG/fnwvxxxfusbadeIWXhPRixxjQpOgH10cqJ9KnT+GcYsRB6EjT
	 t9VNRKg4SXNPYckUFbKnHlUYT6gl7E5r+//4t7AFeMoYloAadeMdBGFKfu2dIEgpl5
	 igg3l0l6lpni61/GIZs9iuXV/PjHj5gdmFr4NNXF3q4S4KqYHnbogBcjXoPPX1P4Xq
	 R8CdMf8BQ7+hQ==
Date: Fri, 27 Jun 2025 16:19:38 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Cristian Cozzolino <cristian_ci@protonmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>, phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: arm: qcom: Add Billion Capture+
Message-ID: <175105917780.161531.5185691012356347200.robh@kernel.org>
References: <20250626-rimob-initial-devicetree-v3-0-4017ac9fd93d@protonmail.com>
 <20250626-rimob-initial-devicetree-v3-2-4017ac9fd93d@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626-rimob-initial-devicetree-v3-2-4017ac9fd93d@protonmail.com>


On Thu, 26 Jun 2025 00:04:27 +0200, Cristian Cozzolino wrote:
> Billion Capture+ (flipkart,rimob) is a smartphone based on Qualcomm
> Snapdragon 625 (MSM8953).
> 
> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


