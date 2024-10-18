Return-Path: <linux-arm-msm+bounces-34858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C85D29A354A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 08:24:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2231C2832DC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 06:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 452D417E918;
	Fri, 18 Oct 2024 06:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ics84xtl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16687174EE4;
	Fri, 18 Oct 2024 06:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729232685; cv=none; b=YYIA7jAp+pcDYdvpFgU9z6Ehh+G83wcrYEVvlMNJihNmN6pYYuaDI2Yf0OUEHcgjytfIv5OloJ+wJMA3pYS0eMYYVEBE+e+daQPAEPkwuJW+Xq3xFwMMlaR0mbq+tGVa4W1TQVGHzDFacyz+/jgSWhfT8HuNUZ6hTQnzcYIoCAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729232685; c=relaxed/simple;
	bh=U3/P0WsXiMD0WXbJcFOXJHzMSn1Mx3FrUlizI+Tq/yQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qIGSItlYn79kQ8Mbu1s32ijjkAhZ8y2X54jOAM5RWyIz1cHH8ZG27KoOQjDMrEiNqw1l0ELSty8qoKsabEc/+w1kF2jdYHqlr2iOfBtyqwvongaQn5HAFBnz7WUCKPePRK3RLYC6smvEJcHO6ELoQOAL/D0aPWfYhnAVNBuuafc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ics84xtl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80BDEC4CED0;
	Fri, 18 Oct 2024 06:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729232683;
	bh=U3/P0WsXiMD0WXbJcFOXJHzMSn1Mx3FrUlizI+Tq/yQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ics84xtlUxSh0h/c7qA/jWHquMs39i6Mnvi9TAo/9BrEAbGoJ6zrQWUNJ6vJVIzlz
	 bbUFhR5jvwJizR6LkxBbZy9mcpVp+KsfmlIb5iOr2n89WMFDDJKRLE4p5LuKOXjRy7
	 TY5Uic9qRpZOGB42vX8Y5DanHj+PQU+aYxFLko4uTcWkPh8/c5hsdcwxoeG0Pm6euj
	 99PdIJBdwhl4SfD8GnOn6zq8Q1lYjHhZHmO9dgM8mw/5Pf1CSzkdF0uxslq2X7ZXYX
	 a18vGCy+8FPQYV2VgT41Nu5diVzAHYd9YNJORSN1srlZBQRyzsv0PClWRE4ZLKIDHQ
	 2jRV2yC1ADrxQ==
Date: Fri, 18 Oct 2024 08:24:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: YijieYang <quic_yijiyang@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, quic_tingweiz@quicinc.com, 
	quic_aiquny@quicinc.com
Subject: Re: [PATCH v2 1/5] dt-bindings: arm: qcom: add qcs8300-ride Rev 2
Message-ID: <kx7zx3f54qm5aciwofj4jn3vkua7utheka6mkarmm3surd34dy@ep2xwxdqjumv>
References: <20241017102728.2844274-1-quic_yijiyang@quicinc.com>
 <20241017102728.2844274-2-quic_yijiyang@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241017102728.2844274-2-quic_yijiyang@quicinc.com>

On Thu, Oct 17, 2024 at 06:27:24PM +0800, YijieYang wrote:
> From: Yijie Yang <quic_yijiyang@quicinc.com>
> 
> Document the compatible for revision 2 of the qcs8300-ride board.
> The first revision and the secondary revision has different EMAC. The
> previous is 88EA1512 and the later is AQR115C.
> 
> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


