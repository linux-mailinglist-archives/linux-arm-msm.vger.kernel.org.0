Return-Path: <linux-arm-msm+bounces-35657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EAE9ADDDC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 09:39:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E65BB1C23C17
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 07:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A2D919F13C;
	Thu, 24 Oct 2024 07:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nYeY9GAS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59ADC19D065;
	Thu, 24 Oct 2024 07:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729755566; cv=none; b=h7NuIM0aGnyCYCFenGygLOpbCJ0i/coS7RdvboDJBm+nL4mY3Vc4S2SIL7OrR4WZzY928QVGWs5QiO7hmxVacOTD31XKb1ppzdBr6oyNaJTQQOG1TbZ4QdCwzjevWIqjkk/6CJYoT1C1LWBx9hVCUypDJQdluBngwU8GgrdPr34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729755566; c=relaxed/simple;
	bh=HShkICHCxFo9dGaTerIg5iBptbNL6uPeNv2aXZkKVOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JWyRGbs1yqo2Og/52oWiwn7xyEiDseX/kpoGG2/0ln/DHfX6/UFvidqQ9mbIQAKsmYFBl+lsnUs3IGA1UN6UIjTfcRuD/TmLsnVEUhWsy5fXrK42foEOZdGrssutED+kExTQB7xVHDY4uws3seLOs16DvtfPNM1W8ZE6QHkXTic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nYeY9GAS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7F14C4CEC7;
	Thu, 24 Oct 2024 07:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729755565;
	bh=HShkICHCxFo9dGaTerIg5iBptbNL6uPeNv2aXZkKVOo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nYeY9GASMhlbIfPxb0iDQMdN2IcY0WJoIHFFhl++YiqAhQBu+0bNhHlsd6A0rGOyU
	 gN+prMUwXvh5DoPHM2jKyTX3CWiMfFhMHdO5PQNQ32ymACEZgollehCQ6/lGFgbMJe
	 C/Lvvhfh6o5xDngV+3bkq7xXjQ4EGwDDzuNV08ljXbH0AmFWOj2akpU36DnwWOt2jM
	 1pTBEqp3rQaix8YzuBkbCiR8GKG78XttWsVeefvRh4lyne6RpOcXdirRPc0UUCfjgk
	 zY5dNw+fxyFrakSmUtdTpkrsuL758v7zXXJkNa/3WCIp1f85v0IGBFV7K9QnQwBZVh
	 Ad7C4iYJgipSQ==
Date: Thu, 24 Oct 2024 09:39:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yuanjie Yang <quic_yuanjiey@quicinc.com>
Cc: ulf.hansson@linaro.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, bhupesh.sharma@linaro.org, andersson@kernel.org, 
	konradybcio@kernel.org, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, quic_tingweiz@quicinc.com
Subject: Re: [PATCH v1 1/3] dt-bindings: mmc: Add sdhci compatible for QCS615
Message-ID: <snubehr65vbneu56wiqhbsayx75vau2plkajyv4xnatkzjv43g@zubld6n6pnrh>
References: <20241023092708.604195-1-quic_yuanjiey@quicinc.com>
 <20241023092708.604195-2-quic_yuanjiey@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241023092708.604195-2-quic_yuanjiey@quicinc.com>

On Wed, Oct 23, 2024 at 05:27:06PM +0800, Yuanjie Yang wrote:
> Document the sdhci compatible for Qualcomm QCS615 to support
> function for emmc and sd card on the Soc.
> 
> Signed-off-by: Yuanjie Yang <quic_yuanjiey@quicinc.com>
> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


