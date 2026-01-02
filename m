Return-Path: <linux-arm-msm+bounces-87216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 44037CEE556
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 12:26:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51D0D300E3E2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 11:26:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E28472EF652;
	Fri,  2 Jan 2026 11:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H9xzFqat"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42792EC0AD;
	Fri,  2 Jan 2026 11:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767353161; cv=none; b=qgle4tRomS0PTC9gmq0BmLGUDml9HLk6v0+Y79we8pf+cqrx/ebReGmeRJUG0REW8pDtuQWqyRAuJTPciN/E3aV9xk29gAcsJxPWIO38oEciyU7d2rvmFaXQLxDmBhvL5/4D6tCDIurlWKXGy05izoX3H/yS3FQg8e1qrZbpamw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767353161; c=relaxed/simple;
	bh=irxz4kGO/ifwlc6J21n4NxZquijGUgmOe+Gdf3NvF+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FD5SU/OglTVFNXbhoY7wnbneRev0MXDKSLi/+rMbqf4DdkLFgPpgSDQgp7n55mLjIavL2jkgc356XgfukOM8k1aN0AgCaWTnRMThesMcQoCFYljhvY7TUdLEAWWVJFiKDzCQtSBFs5dnTULw+c4SzWfEwGv5nPEG6XFPsSZShmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H9xzFqat; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA066C116B1;
	Fri,  2 Jan 2026 11:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767353161;
	bh=irxz4kGO/ifwlc6J21n4NxZquijGUgmOe+Gdf3NvF+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H9xzFqat7t5rznCncJVk7UDgr96JHMk+T2NDAHDY57kVAc2s8UpJOYQunlJIQXy/6
	 wf4fc6ZDN6CP9UR0B8pVMze2iPj5qsVd8JpDbydyrl8/xZFKAGUe5WuxLs37aw2Ou2
	 57Ktb5MUdY/PRQ4LYRPoJcxj4rvpL7mw7y4wvsUhipt0TKpJLAheE9hPXsiJUK/Gnp
	 3F5PaOwU7agtJBjM+v2hrr710CO40kA87LCJ+Tm/+FBiGwoEXVZfnywQ+qwNT4sI5D
	 T6ByGtbxXLzqh2U1LaCWvAu6Z/piYCd/8gpYb8/WHwAblQMgB3zy/bFgF1ZMGNWlZw
	 ndPZS9AiDU49g==
Date: Fri, 2 Jan 2026 12:25:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, martin.petersen@oracle.com, 
	andersson@kernel.org, konradybcio@kernel.org, taniya.das@oss.qualcomm.com, 
	dmitry.baryshkov@oss.qualcomm.com, manivannan.sadhasivam@oss.qualcomm.com, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com
Subject: Re: [PATCH V2 2/4] scsi: ufs: qcom: dt-bindings: Document UFSHC
 compatible for x1e80100
Message-ID: <20260102-rapid-abiding-parakeet-d0735f@quoll>
References: <20251231101951.1026163-1-pradeep.pragallapati@oss.qualcomm.com>
 <20251231101951.1026163-3-pradeep.pragallapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251231101951.1026163-3-pradeep.pragallapati@oss.qualcomm.com>

On Wed, Dec 31, 2025 at 03:49:49PM +0530, Pradeep P V K wrote:
> Add the UFS Host Controller (UFSHC) compatible for Qualcomm x1e80100
> SoC.  Use SM8550 as a fallback since x1e80100 shares compatibility
> with SM8550 UFSHC, enabling reuse of existing support.

Your last sentence is redundant. "Make devices compatible because they
are compatible". Why are they compatible? Or just say that you add a new
device fully compatible with SM8550. Write concise and informative
statements, not long elaborted paragraphs where only few words are the
actual information

> 
> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
> ---
>  .../bindings/ufs/qcom,sc7180-ufshc.yaml       | 38 +++++++++++--------
>  1 file changed, 23 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
> index d94ef4e6b85a..0f6ea7ca06c8 100644
> --- a/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
> +++ b/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
> @@ -26,26 +26,34 @@ select:
>            - qcom,sm8350-ufshc
>            - qcom,sm8450-ufshc
>            - qcom,sm8550-ufshc
> +          - qcom,x1e80100-ufshc

You don't need this.

>    required:
>      - compatible

Best regards,
Krzysztof


