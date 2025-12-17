Return-Path: <linux-arm-msm+bounces-85450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C09CC6930
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 09:29:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D8C703009FF8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 08:29:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EEFD33CEAA;
	Wed, 17 Dec 2025 08:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qOT4PCI6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277E9339868;
	Wed, 17 Dec 2025 08:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765960175; cv=none; b=s9lvzVMcJne3OcMVVIJZ87xmFhj1Yu5zF4V33ohv4xSf7qZP2+F/PxWTEZpAJw89EqBRPGUNCHtSNNGtEmEgEJE+EubKLINUQJQh2yEulVO/9R/DwtCaiqTlSFAti6Qt2B9agajHiT8va0pDZR/BnufQxTian5fC3PlIBFYusjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765960175; c=relaxed/simple;
	bh=hDKd8WAdaRXPUTQt8aHu7rIQ4u3C40pLhxhB1uOiRDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JRUFzuoY4Ipt8jVjFVs1IdbowtUIqOvkOQU/SZCuyx3WlsrnlTVyehUkpJUeuxFLW0z9YB7vF2SX0VZsoaQeKcy42yf3uR7ttSDC6XlW37Nyou/okSK2YC+YC9jllceRkRlcyToQEHDXfBlI4Hkl3TXtbRGvkrH2Iq785dqOIQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qOT4PCI6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D83EAC4CEF5;
	Wed, 17 Dec 2025 08:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765960174;
	bh=hDKd8WAdaRXPUTQt8aHu7rIQ4u3C40pLhxhB1uOiRDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qOT4PCI6j7ZB7VXO5dpDgCJWUAuuvBL0cxduNkUC1OzzsZy3hryoexH6BnDuR6Mbe
	 /VXhOXQfEuoZDZvlNx7AUSjjcUeeZbf91J9DrzgIPk5N+TVo+hdXC8WAl8PfKkVLI2
	 eWYLmzPR3r+TTQ9Oc9vxzIJeIcBd/S3Y3DmTC5UntIS6bXzBggplexNPdrDFfmUHf4
	 omnube9IXnX2BLj4elEuMhq7SKvD+3YOokYbNrxHYzu/ueVF6ZsMl1BfBTTX1bW4bu
	 aarFpzMwmVHeoctg52/+yck+5GNMSUxou9QpECkRuCsvQgb5y5ymvws+MpWOIKME6t
	 nN4EgT9jAxxcA==
Date: Wed, 17 Dec 2025 09:29:32 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com, kamal.wadhwa@oss.qualcomm.com, 
	jingyi.wang@oss.qualcomm.com, yijie.yang@oss.qualcomm.com
Subject: Re: [PATCH v2] dt-bindings: mfd: qcom,spmi-pmic: Document PMICs
 present on Kaanapali
Message-ID: <20251217-placid-visionary-reindeer-eb7ecc@quoll>
References: <20251215-knp-pmic-mfd-v2-1-1e91138c6fc6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251215-knp-pmic-mfd-v2-1-1e91138c6fc6@oss.qualcomm.com>

On Mon, Dec 15, 2025 at 04:39:35PM +0530, Jishnu Prakash wrote:
> Document compatibles for the pmh0101, pmh0104, pmh0110 and pmk8850
> SPMI PMICs.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---
> Changes in v2:
> - Rebased patch to Linux 6.19-rc1 base.
> - Link to v1: https://lore.kernel.org/r/20250924-knp-pmic-binding-v1-1-b9cce48b8460@oss.qualcomm.com

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


