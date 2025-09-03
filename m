Return-Path: <linux-arm-msm+bounces-71714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48566B4155C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 08:44:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3BBD3A97D8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 06:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D4072D8385;
	Wed,  3 Sep 2025 06:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gv7wPx7+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21CD1FBEB9;
	Wed,  3 Sep 2025 06:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756881877; cv=none; b=ipptZtIudmU3PrV4JFtSCBpK94DtteBS4Gm551gFzo0rZsgR7JuOIs75BfBuBUvoxhnpVHopfGW4olx/J1LCbrhjPTaT7wkp2wHEkJhGV0ZGgMu9EhkXsoyXLKOIbohN74M7hwXSseHs2hoBD0aN3KdYteRxDWmZIw2UTABgU4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756881877; c=relaxed/simple;
	bh=Zwr9IIXnV40wO6P6KjOHxt6dvUvQanzuoguq6G06ZAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uqqw1x0MoucujmLDtHDiWG8UUwM3SrTVspfOgRframwvq0w/hmgKaRbfOTFS8d9BH34Wdo0Qs2xdkvCfejZgpD7FLj/Y0Go6oYMPsasXwNMfn3fE/8RNQajISOwdn0GHQEKaAJ9s5lXvgUrOyx/Ztq5LSjzvA2NI841n4yoy/V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gv7wPx7+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFCBAC4CEF0;
	Wed,  3 Sep 2025 06:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756881876;
	bh=Zwr9IIXnV40wO6P6KjOHxt6dvUvQanzuoguq6G06ZAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gv7wPx7+ULsQFf93hMfnS/BUrXoBUQDheaEOEV5fIu3jyQ2QKVxdE79rIJM/ptYLS
	 vla7yPEp/Ml2yHJklTe8a17uBFHyvkujY93p9acJ+KyVpmkRYI9WBfvOqtIbO+c36X
	 tf7winVfJd6z+ncg8bJwr2X0Nb275TK9PU32ZSqZQAs6owkutiit9r1NiCMhyE+xV2
	 ZF9dMugQ9vWRTLgpDi6WzekZlmIQOO+1OUT5q2oAy8lmgr9RFDHZWBC1jTJb06FXwW
	 tTW/bbVWL8lcboTVfoV8DX2kHHDJfCEb1CFIBIJkwbF1W0xyOrsxKEoiboID2MQSAC
	 ILftzF2TbRoQg==
Date: Wed, 3 Sep 2025 08:44:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
Cc: alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org, 
	James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, linux-scsi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH V5 1/4] ufs: dt-bindings: Document gear and rate limit
 properties
Message-ID: <20250903-sincere-brass-rhino-19f61a@kuoka>
References: <20250902164900.21685-1-quic_rdwivedi@quicinc.com>
 <20250902164900.21685-2-quic_rdwivedi@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250902164900.21685-2-quic_rdwivedi@quicinc.com>

On Tue, Sep 02, 2025 at 10:18:57PM +0530, Ram Kumar Dwivedi wrote:
> Add optional "limit-hs-gear" and "limit-rate" properties to the
> UFS controller common binding. These properties allow limiting
> the maximum HS gear and rate.
> 
> This is useful in cases where the customer board may have signal
> integrity, clock configuration or layout issues that prevent reliable
> operation at higher gears. Such limitations are especially critical in
> those platforms, where stability is prioritized over peak performance.
> 
> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> ---
>  .../devicetree/bindings/ufs/ufs-common.yaml      | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


