Return-Path: <linux-arm-msm+bounces-31842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB65297A4E2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 17:10:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A429D28EF44
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 15:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B6AF158550;
	Mon, 16 Sep 2024 15:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YTW86MWW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D021158540;
	Mon, 16 Sep 2024 15:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726499446; cv=none; b=H3/Bb6D+p4cYzCHX/4O84ujP/IHnkR05C7q5WcVODKc6rRupZf7i+4jElZpml1QyoSjI7pAXVElbC7/oGhTdh/9cxilnkoH1wnUDKv/KoHb3Dv5mf163VcCy5yzoKzdpdBD8r0v22WPlPrXdPIDVd131Lam34k7tPswxhRut8fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726499446; c=relaxed/simple;
	bh=jVK5yp3Us10Egcwex3Q1RHVwe0p2sNDfRHprqgv4zbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LHbdZ6ZcjPkccGVL3cWZSgGwU+4B4CoSHNWB1BAq3xVl4tGDKlIBsZhQ0rOz8XAhTHIDRK9SOazYYsS1Fot/KCxZRlWZmnDq/JT0xp20HPMqKSfj0OgXBe1yBuxt2uPK8XSY8og4XjOUnyN0oZsFuXrUWPFjD4Cwqh/PlDzaqFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YTW86MWW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E408FC4CEC4;
	Mon, 16 Sep 2024 15:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726499445;
	bh=jVK5yp3Us10Egcwex3Q1RHVwe0p2sNDfRHprqgv4zbI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YTW86MWWseIGwkqVBlIvASh9I+9dY+0Ar2d0OLLSyn5s/8xktx2fPHJUNFPLvnyeV
	 P2yUQeqPhEixdlw/dR4StrWu9zAFOQZwwdXYKbWDvBG3uLSnJE/8UxJCbmI6E5D80I
	 5esKKzPfAQnb37j7UYzimwdKizFJExIMsm1FLUMXazjEqATNPMIIfEP7WbRdLsQ5Y5
	 E8DWvue/fp2BnzAMO0WWkLI84o8dowImUmgsNKcYmd5Yrx4ix5nVtrcRRrCYn0yz01
	 knC/vzCqyi87BSUEFUnG7vIs34qtDAKJt34dx+wOkGca6YemXSyOICSpBVNiddsXb9
	 NApBAO6ByTrwA==
Date: Mon, 16 Sep 2024 17:10:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jingyi Wang <quic_jingyw@quicinc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Robert Marko <robimarko@gmail.com>, quic_tengfan@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, quic_tingweiz@quicinc.com, 
	quic_aiquny@quicinc.com
Subject: Re: [PATCH v2 3/4] dt-bindings: soc: qcom: add qcom,qcs8300-imem
 compatible
Message-ID: <jhmurbmjwjhykhftdcocxjwbkbopfbgow2e3o72slnasllocdj@32uxfxvjsxez>
References: <20240911-qcs8300_binding-v2-0-de8641b3eaa1@quicinc.com>
 <20240911-qcs8300_binding-v2-3-de8641b3eaa1@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240911-qcs8300_binding-v2-3-de8641b3eaa1@quicinc.com>

On Wed, Sep 11, 2024 at 04:03:17PM +0800, Jingyi Wang wrote:
> Document qcom,qcs8300-imem compatible. It has child node for debug
> purpose.
> 
> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
> ---
>  Documentation/devicetree/bindings/sram/qcom,imem.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


