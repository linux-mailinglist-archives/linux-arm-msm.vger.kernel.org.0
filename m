Return-Path: <linux-arm-msm+bounces-66203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60324B0ED42
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 10:32:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8EF9D177484
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 08:32:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68A71279DB2;
	Wed, 23 Jul 2025 08:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jHRrgiIi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39769278E5A;
	Wed, 23 Jul 2025 08:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753259567; cv=none; b=HUSZO74ZoJik9Y+yNbdnWJClyeULvkTbg4WpGqakXqYO410aG83Mn8ifJjCq3ew4w52ihOKUqocrhYBAMZUirrKEaZNXuQmNY6rcug17h01EJJwzy3wruixOEU5TQ7ztg6RWrzJk11QHtDF+GcHbJDURqL6hYo77KGHNiw/HOPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753259567; c=relaxed/simple;
	bh=hz//+fyPn6iEdrpgvveWfsPwwbaPjDkwCuRuVl9i7wU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tb5PXhJ6nbkflO1soeQMQyw1A4YJC8g0hlU6P8iWZjp3OisG7fi1P5B+2+bRbRtx2RBKo33phZhAZsMt5xg4QTpCl60MdoUvj413nBOkxtIq4snnOmYosvqi1M60dFEDEhh/OpVPllQ0nBitsvNtbVWwYUeOeAxKOGgX/djy8BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jHRrgiIi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15DB8C4CEE7;
	Wed, 23 Jul 2025 08:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753259566;
	bh=hz//+fyPn6iEdrpgvveWfsPwwbaPjDkwCuRuVl9i7wU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jHRrgiIiqaaPFpTpzPhxESsJ+npF1R9e1GbGn1WNut2kVW3+nyOidVF+f4Sk+62sO
	 IEr//dTLLUUTkh0gjetgMyB7nlw2pqrBJd7kX9j6m6RpAhym/J9hRo4Lxf2bQ2t/gI
	 7WGyLz/22NjFiJfH7falnvZ1JuGbqsbxPmgLvfO/ZF/T7k/92L7xUMW4svo0lwiNO9
	 xUKw3+EgX3jSMeon3Rk7Kv6tTootRL9ESluMPvH949/lxvdCltUVUIlXRU+aoMfUe+
	 IfOcrwPygDKk9oD5BXQo+8wb15Jzi1/ooOT0W1BTyWhRcYpZ4K9L+5WDePifFynNJw
	 BQADnJ2lQZJnw==
Date: Wed, 23 Jul 2025 10:32:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, kernel@oss.qualcomm.com
Subject: Re: [PATCH 0/7] Refactor sa8775p/qcs9100 to common names
 lemans-auto/lemans
Message-ID: <20250723-angelic-aboriginal-waxbill-cd2e4c@kuoka>
References: <20250722144926.995064-1-wasim.nazir@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250722144926.995064-1-wasim.nazir@oss.qualcomm.com>

On Tue, Jul 22, 2025 at 08:19:19PM +0530, Wasim Nazir wrote:
> This patch series refactors the sa8775p and qcs9100 platforms and introduces
> a unified naming convention for current and future platforms (qcs9075).
> 
> The motivation behind this change is to group similar platforms under a
> consistent naming scheme and to avoid using numeric identifiers.
> For example, qcs9100 and qcs9075 differ only in safety features provided by
> the Safety-Island (SAIL) subsystem but safety features are currently
> unsupported, so both can be categorized as the same chip today.
>

I expressed strong disagreement with this patchset in individual
patches. I expect NO NEW versions of it, but by any chance you send it,
then please always carry my:

Nacked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


