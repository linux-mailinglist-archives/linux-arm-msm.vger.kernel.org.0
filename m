Return-Path: <linux-arm-msm+bounces-75163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9ECBA0CF8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 19:22:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 226EB3A7465
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 17:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7369730C343;
	Thu, 25 Sep 2025 17:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rRixk6y0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A441E0DEA;
	Thu, 25 Sep 2025 17:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758820945; cv=none; b=Wgg5litQl99W8Mk5J/HTQ/0P75Y/HV5txPjTrZntexkKz1/agtYHkhY5q9OUQqK58TEc3T/buHpX/dXEvFrsqMjNhSAVK9zR40BvHSzgn2q01h0aFALt1S7s6/V0a1giVZkWv3uTFmaxLtE+uU8ak8efqMcMf9+Pk73W18pgu74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758820945; c=relaxed/simple;
	bh=dDJFQDaVQ5uaXLI9MnAMiuwznAAVvCXjH088JRdvUzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=teSB+AXZ8QnETSm0UQvl8NjPJ0hX51qk8jF/3TGiMWsN+QTmNN7OzcrH6wPCRgcSn9RsJN8+29hVX/uanPAHiWGBjkLtgQASAV2DtrrLIXcbh3yTxpgEIzcrUuTZ0PVVzKcARpaIQeOsdx+BJYznZrV1GMIrFEYjLZpFDG/DkP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rRixk6y0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11A2EC4CEF0;
	Thu, 25 Sep 2025 17:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758820944;
	bh=dDJFQDaVQ5uaXLI9MnAMiuwznAAVvCXjH088JRdvUzQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rRixk6y09iHKd12jgHzvxRA3YXmjQ4mr2qlni9atr0inoAFjOOip9kJEE6lwIF7WX
	 Mifij3AIG3ZjLtGMNqhucvqt4gStu8DWOZvLJ0slwnN8QJJkZ/Mj6+KY49vLrgwXJl
	 aZP7SGwLlfo9/xw+mo/7VASUFqsRn2MVcO2B4Et0g7W45Xv5XZXL8LzzG0vWduSeKu
	 nPSDDcPaCRUGpfWil4CGoRLxPDUIhTWSYk22Y1laROu9mMIM5bL8dGDZtmo6EwRD60
	 LoLY6jf7jWR5ko1y17cKCv8Tlpt9hgYFRNgubjYy69msOMgyGzAxWBb+QyPxNSdJg4
	 qYwNXHInW77Lw==
Date: Thu, 25 Sep 2025 12:22:22 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	jingyi.wang@oss.qualcomm.com, mathieu.poirier@linaro.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom,pas: Document SoCCP PAS
 for Glymur
Message-ID: <ydfiugeifs5c6v7dzms5tlkkmhf26q42pav2ugfuxjytugr5nc@ppxoiize27ug>
References: <20250925002034.856692-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925002034.856692-1-sibi.sankar@oss.qualcomm.com>

On Thu, Sep 25, 2025 at 05:50:34AM +0530, Sibi Sankar wrote:
> Document compatible for Qualcomm Glymur SoC SoCCP (SoC Control Processor)
> PAS which is fully compatible with Kaanapali.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> ---
> 
> Dependencies:
> [1] Add initial remoteproc support for Kaanapali SoC
> https://lore.kernel.org/linux-arm-msm/20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com/T/#t

Please don't send out patches that depend on other patches sent out the
same day. This just assumes that the maintainer will keep track of
dependencies and figure out when a future version of that dependency
meets the needs of this version.

Work with Jingyi to handle dependencies on your side.

> 
> This patch depends on patch 4/5 of ^^ series
> 
> [2] Add support for remoteproc early attach
> https://lore.kernel.org/linux-arm-msm/20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com/T/#t

This is the same link as above and what you call "early attach" that
series calls "late attach".

Thanks,
Bjorn

>  .../bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml    | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
> index 79f678f5f7d9..8089e0869ed2 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
> @@ -17,8 +17,13 @@ description:
>  
>  properties:
>    compatible:
> -    enum:
> -      - qcom,kaanapali-soccp-pas
> +    oneOf:
> +      - items:
> +          - enum:
> +              - qcom,glymur-soccp-pas
> +          - const: qcom,kaanapali-soccp-pas
> +      - enum:
> +          - qcom,kaanapali-soccp-pas
>  
>    reg:
>      maxItems: 1
> -- 
> 2.34.1
> 

