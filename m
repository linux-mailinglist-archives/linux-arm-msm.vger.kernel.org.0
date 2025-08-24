Return-Path: <linux-arm-msm+bounces-70519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B4037B32ED2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Aug 2025 11:29:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4167F17877F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Aug 2025 09:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54B3F2641FB;
	Sun, 24 Aug 2025 09:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I0K/RGGk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22783262FC1;
	Sun, 24 Aug 2025 09:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756027762; cv=none; b=VpJi0IuOWmGmgllscwWGhU0yviIWhpR9XrXe/6HWvM3I7lf79YWSqUYAV2CSUCFSG+ir5dNGleolpovO8cM+2YMmwEIXwUYLRUTc0TW9ECGkoUGXGTXk0+hDKNU/DmJl86b1bFzK9dPVKcXm+lJVWZWpE3AA2vLBi/lGSu14oHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756027762; c=relaxed/simple;
	bh=cSkJEEyBPIJyXDtyo5nFOPAKxDPEKL1H9DoVn2/BkYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pEhB9yKxhg5JJV6oGbsJ0QA72KU2VA0CQ25ruMMVt3pozrXf76AYP4CHU7RhE/Bj7pw8kxdy8ianVvopjUy8WYz9FgKoPpEyqAkj9O3FtuvduZqtsrWCpfbU0PFm4D9MnDNv0K1FIdDNMIHTdpJAo5ftLR2Xt/X9N8hPdfZ/iMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I0K/RGGk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B8CEC4CEEB;
	Sun, 24 Aug 2025 09:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756027760;
	bh=cSkJEEyBPIJyXDtyo5nFOPAKxDPEKL1H9DoVn2/BkYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I0K/RGGkV+/PTur/t2+0HGKOunPAX7DgRFsVTRHVbKvqtegKwGTKkRtJibQHt8n5e
	 wSo3KW86pk2sxa5/+CkP2HF+QAN4eXctfbxo+/FgBeTpo2YtNBfP6rT4naaByO0LAW
	 1UpfkhcS6nnUprSbcjgCbv+kgcRdC9WE/XzFkt/Ywbo25UPYrEDMHJtWCIectLp3rr
	 9Cci2MBHRspPJ4pdCCpjEDfpv6xj8ZDtmih4EUiJmLW65yHyL15Cz4PyHZtUcEbrks
	 5P+/iDt7MaFQCVPf3sn1HnPQZwVv0s0WSD5ifw3nmQmF3bKlc3f+88LdtIfQBwHzWS
	 3I1yDp4gBDL1A==
Date: Sun, 24 Aug 2025 11:29:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
Cc: mani@kernel.org, alim.akhtar@samsung.com, avri.altman@wdc.com, 
	bvanassche@acm.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andersson@kernel.org, konradybcio@kernel.org, agross@kernel.org, 
	James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, linux-arm-msm@vger.kernel.org, 
	linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 1/4] ufs: dt-bindings: Document gear and rate limit
 properties
Message-ID: <20250824-elated-granite-leopard-5633c7@kuoka>
References: <20250821101609.20235-1-quic_rdwivedi@quicinc.com>
 <20250821101609.20235-2-quic_rdwivedi@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250821101609.20235-2-quic_rdwivedi@quicinc.com>

On Thu, Aug 21, 2025 at 03:46:06PM +0530, Ram Kumar Dwivedi wrote:
> +  limit-hs-gear:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 1
> +    maximum: 5

default:

> +    description:
> +      Restricts the maximum HS gear used in both TX and RX directions,
> +      typically for hardware or power constraints in automotive use cases.
> +
> +  limit-rate:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [1, 2]

default:

> +    description:
> +      Restricts the UFS controller to Rate A (1) or Rate B (2) for both

Is 1 and 2 known in UFS spec? Feels like you wanted here string for 'a'
and 'b'.

Best regards,
Krzysztof


