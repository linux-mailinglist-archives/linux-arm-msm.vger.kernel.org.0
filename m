Return-Path: <linux-arm-msm+bounces-91205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHz2Ihmge2nOGAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 18:59:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 250F5B3537
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 18:59:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 63A5830677A3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 17:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E11B3563EF;
	Thu, 29 Jan 2026 17:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f1oSvLto"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098A93563E8;
	Thu, 29 Jan 2026 17:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769709410; cv=none; b=XBighsTYdJ9HswQpWNhK6jTKou72wbh8wZEooWArwptDymTGzz6c4mM4zFsAJSAvoST9iFnDam4XOyqJuEtk8+x1dPpf3t68l7OqY0sXVxRuSHg5CR2JIhDjmAwkDSqDQHaDTFp9w1cqPBAOMJWHvAUwqoB4Eniv1+nDgZ2tsEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769709410; c=relaxed/simple;
	bh=OaMoc2A6118+nDZn2O0QT1WIn5m+KAY8fN66hxHA1/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jbSqutp+JpEou3NWWzEuLx/iH8Nxg2LTpOtgbxBO6INDRysXW8i4g0MNG68avoc5J3Av4Cwc78SXaRAuCSlOu4FlNdt5EaK/ex9xRNmsNqGDmBsrKrbyLfxuhfkgF/OuBeezRebYDD3WV02kNsVofLftr9c9nnzGpG+4cFiXeto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f1oSvLto; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85AA5C4CEF7;
	Thu, 29 Jan 2026 17:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769709409;
	bh=OaMoc2A6118+nDZn2O0QT1WIn5m+KAY8fN66hxHA1/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f1oSvLtooLDCP1e205DbOCeyn+gZ6W8Hd9sbLI5c4htIj8uObsajaHiF5sN9U5RgU
	 0Futsv2XMpE98Jur6FA94rhqIRROqAg9rggvfkOVTASMcKiWBNvTNh//SnAFx4NGS7
	 RrIZIrn9I66/DloQznaFBSeJE5IkIC4KszksrBiTUoGvzvH91ZwCZecbqPEC7hoObb
	 mk0JCb5FddU2b7vu1/qTxHKCZkN0BeerS0FMLfvCnUOXgAfkbIQuJ6wuUUauQoPcVN
	 M/EME1Zt2JwArobyi/YQj6H5xI/c1BOdcWk/lPnAeQq2lp9WpbZQCuzPxipA0mr+VC
	 E62vlplw2s2IQ==
Date: Thu, 29 Jan 2026 11:56:48 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v3] dt-bindings: sram: document glymur as compatible
Message-ID: <176970936347.1342436.422291097090839719.robh@kernel.org>
References: <20260129071435.2624252-1-ananthu.cv@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129071435.2624252-1-ananthu.cv@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91205-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 250F5B3537
X-Rspamd-Action: no action


On Wed, 28 Jan 2026 23:14:37 -0800, Ananthu C V wrote:
> Add compatible for Qualcomm's glymur IMEM, a block of sram which
> can fall back to mmio-sram.
> 
> Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> ---
> Changes:
> v2->v3 moved to sram.yaml for mmio-sram fallback
> v1->v2 alphabetically sorted the placement of glymur in the list
> ---
>  Documentation/devicetree/bindings/sram/sram.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Send this with the .dts change using it for Bjorn to apply.

Acked-by: Rob Herring (Arm) <robh@kernel.org>


