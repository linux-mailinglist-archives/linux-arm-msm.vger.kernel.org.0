Return-Path: <linux-arm-msm+bounces-89447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C3ED33758
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 17:21:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E550B300F68D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 16:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2B4D33B6D4;
	Fri, 16 Jan 2026 16:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UNt1GYen"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8322248A0;
	Fri, 16 Jan 2026 16:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768580458; cv=none; b=TPN5wHdX+xP6fwVfevpUjtRMS8v0RwKNGY8bJYhkIraNmez+LSMiDVzJW7hqqb4zxxQva7yBYo6YfiSmHE5AbPdDf54FMXjGKoMK47tjmUOpbmtlgrOEUnpcArz/jOnU98v7AME0Py50/XzEpsnQExvQXNOyJFOxOaVpv23snbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768580458; c=relaxed/simple;
	bh=BxK3uq6oPZ5s2wEiSQxGvmFuewZbF3SEilyyWfqkPCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q96tCgeIOafwd2UhLQGMUeFFq5yYiZG/PWdXUEplS9XqBhYT16vQv/R/VKf3rtncCQwJzSZNDQlo7b24hoq2spNCqILkzkX+AmbZLsSki3l2uUKnDoex/Jja/RvbaLbv389zScTdgCE1uUavxO2abDrmg78PL7oYHBryRJX0IXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UNt1GYen; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C7DFC116C6;
	Fri, 16 Jan 2026 16:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768580458;
	bh=BxK3uq6oPZ5s2wEiSQxGvmFuewZbF3SEilyyWfqkPCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UNt1GYenkxeMCcUhQYfoEZeZEX7cdjYj74b/xamlGBt13HZltXaFSiLlxT/kSi64k
	 1FaMPQS1lu6tPVF2LRciTHU+x1IMyxZN16RZfIaCk/KONoxZPDD+SL2MRinyb0nWnI
	 c2CagJ08+2lVtaGfDgW95Bt4yuNxMqhUr2z2iLOxV01taJrWXvSmiXtNujePiXKGCo
	 YdGoIRLiqvb14tLGTH55FR+djhvG+hvCrV7j04dIwxRYXznehY7804lj1upQQiW/SO
	 nVJsUqEnqmu9E1H+qSjaiP9blTEMz/OQc9w42pVB7wKP03SzQ2keWwACRv3O5cO3nf
	 0qk3Noeah8GcQ==
Date: Fri, 16 Jan 2026 10:20:57 -0600
From: Rob Herring <robh@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
	tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
	yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: mailbox: qcom: Add IPCC support for
 Kaanapali and Glymur Platforms
Message-ID: <20260116162057.GA1681736-robh@kernel.org>
References: <20251031-knp-ipcc-v3-0-62ffb4168dff@oss.qualcomm.com>
 <20251031-knp-ipcc-v3-1-62ffb4168dff@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031-knp-ipcc-v3-1-62ffb4168dff@oss.qualcomm.com>

On Fri, Oct 31, 2025 at 12:41:44AM -0700, Jingyi Wang wrote:
> Document the Inter-Processor Communication Controller on the Qualcomm
> Kaanapali and Glymur Platforms, which will be used to route interrupts
> across various subsystems found on the SoC.
> 
> Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 2 ++
>  1 file changed, 2 insertions(+)

I guess no one is going to apply this, so I did.

If your patches don't get applied, please chase the maintainers (Jassi) 
to apply them.

Rob

