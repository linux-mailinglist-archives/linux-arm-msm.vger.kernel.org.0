Return-Path: <linux-arm-msm+bounces-87800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 521DCCFC723
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 08:49:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3ABAE300C28F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 07:45:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7CDD28850B;
	Wed,  7 Jan 2026 07:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pYjdyRFC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393102877F4;
	Wed,  7 Jan 2026 07:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767771505; cv=none; b=su5D0wPWXQEz1ATDZ3pS6pdu8lwPzaXIFciQb1O+sIPQibH0LtNX+VycKbG10RowaU3U9DfxgpNwrJbudEnqSKCx6KL4bVUX7MtZFlT5iPvnqk7aJtmZcPP7T3viYUdwJKqiwYOLDMHzbWDcZF4JyjOv0e+zxA1EtjyRtMpAh2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767771505; c=relaxed/simple;
	bh=zBBSW57kO3abF8Yx3PD+kRbUG1WaWnGVNFtQrxvNE8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gd50M0S4mtqUMajw8aNt4YyTQn28J+qawjtWOnkVxDEL8+Mp06+b7s041RSmenfzN7DVury3DrSu1K9sLp0f6ahbqEofz1Btsf2HmIyXfp6vM+RiycVJviY1DzysdFx4xWbw1urIZJGQ6HKWf8uLrrpWHKqwEFF+3MTrW04OAxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pYjdyRFC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3430FC4CEF7;
	Wed,  7 Jan 2026 07:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767771504;
	bh=zBBSW57kO3abF8Yx3PD+kRbUG1WaWnGVNFtQrxvNE8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pYjdyRFCSl2SmJSVtyBpHu2UPLsW0cEXOQSIqlSmNY4qEP+mcYo6w/Tcwpv57aNiH
	 qfuZR/gsqcqfbFSsVnquS4NoAT5ENNINaLzpaboi3osLm91UhIgutb1bCWXuvLCMD5
	 h9kfjSrvCBUK52IPwY9ZvdSHnrhcjBllwHkaMiRGNCH1FysivBS6HLy3LsSOUSYlO1
	 4si7u+UH5KOVwpTyYxDrXoKMbJEsL8whyXbEO7vM7gPRddvR9wvxP39DXbjVqg25xI
	 edTlq19ZETrrk6inDPX3w2mCSBTEsLzCRjLLstoV5WqG7Hkpam9M/1NhCQg7QKTh0A
	 Hex8H+pLPmLhA==
Date: Wed, 7 Jan 2026 08:38:22 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>
Cc: mani@kernel.org, alim.akhtar@samsung.com, avri.altman@wdc.com, 
	bvanassche@acm.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, linux-arm-msm@vger.kernel.org, 
	linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Anjana Hari <anjana.hari@oss.qualcomm.com>
Subject: Re: [PATCH V4 2/4] dt-bindings: ufs: Document bindings for SA8255P
 UFS Host Controller
Message-ID: <20260107-deft-mouflon-of-shopping-baaece@quoll>
References: <20260106134008.1969090-1-ram.dwivedi@oss.qualcomm.com>
 <20260106134008.1969090-3-ram.dwivedi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260106134008.1969090-3-ram.dwivedi@oss.qualcomm.com>

On Tue, Jan 06, 2026 at 07:10:06PM +0530, Ram Kumar Dwivedi wrote:
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +        ufshc@1d84000 {

Completely messed indentation.

Why did we ask to drop the unnecessary soc node? To make it simpler.

Even if you do not believe that code should be simpler, you should
immediately spot the odd indentation.

For such trivialities you cannot get this patch merged. It's third
revision which you send carelessly.

Best regards,
Krzysztof


