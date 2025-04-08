Return-Path: <linux-arm-msm+bounces-53583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70011A813FE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 19:50:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66B2F1B84450
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 17:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52CB723E32F;
	Tue,  8 Apr 2025 17:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HlqPxcGE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CB122DFB0;
	Tue,  8 Apr 2025 17:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744134487; cv=none; b=oSp9g6wJWJN0KvFd6v9NEJpG2H7+b2byHUElZDUVO2zS8wCqA9eG3nmAHAbzNEMkz5JQs0sonVPDZEenxUSHItVq2uW9ojSYcVBPF286I77bTJ4z8xijDFi9bvHtvL8zAECYQWg0DBnlhu+6OSw2g7a0t+D78jLai81Hli7Vbx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744134487; c=relaxed/simple;
	bh=pxplHlLm5MrbmpU/cI5uPl7BhYBVJR3t6Z98tJVbZ88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nGJuEQgW0GCF9rP74jOxBBoVvkRxVOoJgu4ed4RVXyy6Zq4FaBOCWGU7mpXPwhPmbeTZjXchFEdON0zZ4kZoTOkEYSBE0gXpnDE1jFl32j1wS/B42bmOfQD7/ERMA8SgEA/ByERE0fThZNAn7shGXFsaQopX909he14PaDENiMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HlqPxcGE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52166C4CEE5;
	Tue,  8 Apr 2025 17:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744134486;
	bh=pxplHlLm5MrbmpU/cI5uPl7BhYBVJR3t6Z98tJVbZ88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HlqPxcGEp/UMwUGY5Is0O+TKF1KQj1QOcoo62XyI77r7s9BvCg9tngWbUY1aLx4CF
	 Oh1xrZyxdp8MoR8gJWCdsMAAESxd+2HMDO0TpWXt84+zlfPY+NSb4dHOxgZFsJZmXk
	 BlSiO164sFPaZV0GW6TIZJySi77Yt/dflbitG/9myQZjxEgD1XFvEv0PJT+LoYdZlc
	 /tTmQuV3IAlaR36GI9WCygSzsJVjAS1YOo+viQvbx6kQcN6Qhf3ZNkoKsFmZw9NY1M
	 oxNqtW9EkSQf/cGx3EG3wYhN4CqL5UVIjLDY5zcVpBKfdxu0Jk5GFOOn6NhjoaLaFU
	 jIY4eJUjV2Cdw==
Date: Tue, 8 Apr 2025 12:48:05 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Juerg Haefliger <juerg.haefliger@canonical.com>
Cc: andersson@kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, konradybcio@kernel.org,
	conor+dt@kernel.org, krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: arm: qcom: Document HP EliteBook
 Ultra G1q
Message-ID: <174413447629.2422368.13790847607243067383.robh@kernel.org>
References: <20250404090108.3333211-1-juerg.haefliger@canonical.com>
 <20250408145252.581060-1-juerg.haefliger@canonical.com>
 <20250408145252.581060-3-juerg.haefliger@canonical.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408145252.581060-3-juerg.haefliger@canonical.com>


On Tue, 08 Apr 2025 16:52:50 +0200, Juerg Haefliger wrote:
> Add a compatible for the HP EliteBook Ultra G1q 14 inch Notebook AI PC.
> The laptop is based on the Snapdragon X Elite (x1e80100) SoC.
> 
> PDF link: http://www8.hp.com/h20195/v2/GetDocument.aspx?docname=c08996392
> 
> Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

Missing tags:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>




