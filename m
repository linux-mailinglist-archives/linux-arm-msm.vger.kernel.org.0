Return-Path: <linux-arm-msm+bounces-31840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F344D97A4D8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 17:10:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B677528DD99
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 15:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15729158534;
	Mon, 16 Sep 2024 15:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SrlYHze8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2F31D555;
	Mon, 16 Sep 2024 15:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726499418; cv=none; b=Xnh7tl+IhLdVq4jQCy3ps08Wgd0cmBu3Zxe8bqI63gAsbryZveMkXFQZysPyMRLxbCKBWdXgCxKp8aMPsCCl3OO8KHYhP50J3CknN9ysXm6ETehI6+dSIfNY4LBuz+PWYtDtTTA/KGhSGcE6jn9lwSe+mqRyxSI5hl5whwakS30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726499418; c=relaxed/simple;
	bh=+nnwCdnXCHevKVF/Uo7WinwaSXw/Hg6T9E95+MyKqTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sXT8POe2uQ9dLXJ3IniB6n3G8RRTDgSzotf/MivYhCQxk/hmHTAGdjB4JWCFCZoKz3OSRSuhlM8v6bTsu7xkMcXn8tRPJeLeaP2s0pwMhOOdp5pPp/tKvaCJ0bm0CFeNiXVwYwhg50VCCX4olRzRzfJXZn12vrgmQIsKynML/Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SrlYHze8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 568ACC4CED2;
	Mon, 16 Sep 2024 15:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726499417;
	bh=+nnwCdnXCHevKVF/Uo7WinwaSXw/Hg6T9E95+MyKqTw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SrlYHze8kKuhVtIncnE8Y/kz1naYoTZSpYJu4FU4DZ749OPRAIQj6sFkXubt+6XhY
	 Ww2bPHzvPVw4s6A1ULEUB9+MR9ZR5lb2CdL/rGUe0mE6qbjF4Rimxcsd9qbeRfLFEP
	 vpq7bjJX9Ur37S4N+SLfH/rdjuX6OtalL2e14qyTuQT3VKTHTsVmur18mDnFdWioaC
	 HxAFE6kKG0fup/nNhUVyujnDZYiWABsjKERKgvzG4zo40yavmb8KlGIl4uWVQTyvFz
	 /RXxgl58GWacOqTK3Iw6SvoepsDSxIOaanq2ihtgxny055dN69VPDJyiepJ1XmjRa5
	 4MAZMTUOsysxA==
Date: Mon, 16 Sep 2024 17:10:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jingyi Wang <quic_jingyw@quicinc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Robert Marko <robimarko@gmail.com>, quic_tengfan@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, quic_tingweiz@quicinc.com, 
	quic_aiquny@quicinc.com
Subject: Re: [PATCH v2 1/4] dt-bindings: qcom,pdc: document QCS8300 Power
 Domain Controller
Message-ID: <agbcfvwjjgwikrbnkfwzva57zefpljneoxftn7fdjjqyrrwrsb@dr7hxdjppug6>
References: <20240911-qcs8300_binding-v2-0-de8641b3eaa1@quicinc.com>
 <20240911-qcs8300_binding-v2-1-de8641b3eaa1@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240911-qcs8300_binding-v2-1-de8641b3eaa1@quicinc.com>

On Wed, Sep 11, 2024 at 04:03:15PM +0800, Jingyi Wang wrote:
> Document Power Domain Controller for Qualcomm QCS8300. PDC is included
> in QCS8300 SoC. This controller acts as an interrupt controller, enabling
> the detection of interrupts when the GIC is non-operational.
> 
> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
> ---
>  Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


