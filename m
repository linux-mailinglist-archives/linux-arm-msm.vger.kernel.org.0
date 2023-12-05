Return-Path: <linux-arm-msm+bounces-3478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE92805CBA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 19:01:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A36B41C20F95
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 18:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D83C6A34E;
	Tue,  5 Dec 2023 18:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="otLhxBWn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E54E90;
	Tue,  5 Dec 2023 10:01:48 -0800 (PST)
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: koike)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D3F3F66072EC;
	Tue,  5 Dec 2023 18:01:41 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701799307;
	bh=VwHWq49kjTDZ3UF6CffpL7rnWqXYoSvsZ2/8l2HARl4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=otLhxBWn+wz/7Hfc8AtWtVJRHG5bcDHllMU1uJjJTdQiBHYi9AY871hD/AP9jwOaT
	 3RcXR9XKK385uT6/VZq++0TvIgSCaK4+vhaecmaZzXFCtSyr2PXD1AlzM7otyZdcSK
	 OHBJKNl21TPaFg2iXjbhiw8UW51wJiEzFA2O7LxJNAoAiVGRTNgTYMpOJ8Zel6P9+J
	 Ar2ixBYuanGVjPJBBpRhnropxXrqLwMNvK/kUmnWgwKyho4g/pSTKj88kiGU7AkZ3G
	 QKM8eMXNRutHPKdX9yuQ67x3Ikebe7uXaCKVr2YK93fZhJn9smqAF3yxh1JqcpzV1f
	 jIRY+gSyCcXsg==
Message-ID: <8a773fef-c3e4-44ec-931c-de2a92d2d835@collabora.com>
Date: Tue, 5 Dec 2023 15:01:41 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/10] drm/doc: ci: Add IGT version details for flaky
 tests
Content-Language: en-US
To: Vignesh Raman <vignesh.raman@collabora.com>, airlied@gmail.com,
 daniel@ffwll.ch
Cc: david.heidelberg@collabora.com, sergi.blanch.torne@collabora.com,
 guilherme.gallo@collabora.com, daniels@collabora.com,
 gustavo.padovan@collabora.com, emma@anholt.net, robdclark@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 virtualization@lists.linux-foundation.org,
 linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20231129121841.253223-1-vignesh.raman@collabora.com>
 <20231129121841.253223-10-vignesh.raman@collabora.com>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20231129121841.253223-10-vignesh.raman@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 29/11/2023 09:18, Vignesh Raman wrote:
> Document the IGT version in the flaky tests reporting template.

Nice!

> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

> ---
> 
> v6:
>    - Added a new patch in the series to update drm ci documentation
> 
> ---
>   Documentation/gpu/automated_testing.rst | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/gpu/automated_testing.rst b/Documentation/gpu/automated_testing.rst
> index 240e29d5ba68..2d5a28866afe 100644
> --- a/Documentation/gpu/automated_testing.rst
> +++ b/Documentation/gpu/automated_testing.rst
> @@ -69,14 +69,15 @@ the result. They will still be run.
>   
>   Each new flake entry must be associated with a link to the email reporting the
>   bug to the author of the affected driver, the board name or Device Tree name of
> -the board, the first kernel version affected, and an approximation of the
> -failure rate.
> +the board, the first kernel version affected, the IGT version used for tests,
> +and an approximation of the failure rate.
>   
>   They should be provided under the following format::
>   
>     # Bug Report: $LORE_OR_PATCHWORK_URL
>     # Board Name: broken-board.dtb
> -  # Version: 6.6-rc1
> +  # Linux Version: 6.6-rc1
> +  # IGT Version: 1.28-gd2af13d9f
>     # Failure Rate: 100
>     flaky-test
>   

