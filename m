Return-Path: <linux-arm-msm+bounces-35565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFD79AC150
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 10:18:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADEF0285484
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 08:18:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20563157476;
	Wed, 23 Oct 2024 08:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bJkX80fS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3671C2BD;
	Wed, 23 Oct 2024 08:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729671517; cv=none; b=TBuOW2W20JM2ZxSen/g0G89I9qhFGmWWLMZwA8Ac1XgDiw4eOb166BY7H7vn9/XpMZz3U0o2JJnRI7OYEOs+0006OjQ5xNqLxbM3TltwUyF9BbPbo1bq+JZ6sfBTfA0iePFtXZc8Yuygnfp6CuP/vT4AJpF/aL++m6fMLwcYRWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729671517; c=relaxed/simple;
	bh=eUe5ChvP1SDYk/G33vLQvnimvwMqDGlbl8/oaILoIVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ACnkRNJo4/tw17BXXEca0nJOZ6ld2BuOrjjDxep6Ul5kWibWFerMNlYR+Yt8O+3Tws+jD3tz0N/LOvPQR3pExs6zCvk3BokjTSVXD8ibd0uCezc+tkcymCHg4JKvsLgJjlXtw7ZEVnV3iV4s5uQioFyg01UK0rVW06lxo1HZ4qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bJkX80fS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9876C4CEC6;
	Wed, 23 Oct 2024 08:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729671516;
	bh=eUe5ChvP1SDYk/G33vLQvnimvwMqDGlbl8/oaILoIVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bJkX80fSX3w/i4it16s6tyUSeEq43PjgycgxGrJDqG4F92wFgfTa/ucGq5twwr3/W
	 PZ8+ebFaC2jNQVM+70nRCpNC4dSQxH7QnnIKjMTjMEUsHTMSegvYg/o9a2Cvkboqoz
	 wQUo0ieUVtzcgb+6wKsPRtc3dfSs1l2sKHjL3rzSDNUicHhqV17ieiaCAUYJ7kQJ/D
	 uLGcN9gZVcniETDZQcXfqB/jlRxN9uavBsY1L9E7MkLID+758uDc6xvmH/G7xH0arl
	 bbXTkSiEEwA77zZMnCnOTqaV1nBPtCU+/qyphxjudm6m7GagujlXl/RlYGk0UxYzJG
	 zniReU5Jitwnw==
Date: Wed, 23 Oct 2024 10:18:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <quic_gurus@quicinc.com>, 
	Trilok Soni <quic_tsoni@quicinc.com>, Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: firmware: qcom,scm: Document sm8750 SCM
Message-ID: <2tzifxiorkgngotf5nl46vcabwzdxettttydug7py7rfk7qqet@46s6tq7zkbvq>
References: <20241021230427.2632466-1-quic_molvera@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241021230427.2632466-1-quic_molvera@quicinc.com>

On Mon, Oct 21, 2024 at 04:04:27PM -0700, Melody Olvera wrote:
> Document the scm compatible for sm8750 SoC.
> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

This is a SoC patch, so keep it with other SoC patches (same patchset).

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


