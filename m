Return-Path: <linux-arm-msm+bounces-87801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C574ECFC6EA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 08:44:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC2CC30053C8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 07:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36CBA29BD9A;
	Wed,  7 Jan 2026 07:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vI5cX/dX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F0C223339;
	Wed,  7 Jan 2026 07:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767771699; cv=none; b=jgGQDlfhSdm6bf1va1rBXUM4XciIjhwDEew0he3mtNg8ItTylN/NNGZoMqLcNaX6S+vuZjnCqPz8/K43e+Ujnz2yYm6CTOwjqcpovzHl1WptHxz6Vq/TOC5lfKEnUxSnBzx0RnOoV36gU8YaDC4RKt9cbG1l1vynGBANF034Ph8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767771699; c=relaxed/simple;
	bh=062mbyctiZ/C+iC+h5bxLMpRUbFmO3ltrsYXbgQHMvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NWw49KC8O2eLvh02FoiWGLqcWbsQyowF7uQvzz7cYyTDIXYNJ6VkR0h100UoHkj8gugbEOKCkeavCDCkW6pT8gl18DiaplVaEWyXLyu1gbigwVxAyBwLawBt7+hfR7nU0CoG9nNxCRTBzKmXz9mFtXm1VDLb+lV4R9eWhMLR0xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vI5cX/dX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 456D1C4CEF7;
	Wed,  7 Jan 2026 07:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767771698;
	bh=062mbyctiZ/C+iC+h5bxLMpRUbFmO3ltrsYXbgQHMvM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vI5cX/dXfRf54Bnk0FFA1CBTY6nhy+X2Rc3N20bIHYV2VPbi2QifDWiJNMbJriHlw
	 tmd8fCP5wJJtzWV7deXfVxN7gabb+TD9AUO0nsM3h9FQPLoTJ4Bi6J92xo9g683auq
	 Jb07ghmWLmcz2Lpc/tgGKUMGxhtlj6AAo3Z/cbFI5mo/nRSfrk8J6m5AqUSz5YjdSZ
	 HQIxGyARwWHuI7/cy1A9HQAoDYl2rgWz3/okq+KdqfFNnaLyKCEETSe/kKxKReF+8i
	 a43GAAk8lW3a2dmd/KqTCBTGbbA/gnN62GotAxFMo9OJDrrki5Q2K3GHoHKmfm8S3n
	 8zifQXq9JI/DA==
Date: Wed, 7 Jan 2026 08:41:36 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, martin.petersen@oracle.com, 
	andersson@kernel.org, konradybcio@kernel.org, taniya.das@oss.qualcomm.com, 
	dmitry.baryshkov@oss.qualcomm.com, manivannan.sadhasivam@oss.qualcomm.com, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com
Subject: Re: [PATCH V4 2/4] dt-bindings: ufs: qcom,sc7180-ufshc: Add UFSHC
 compatible for x1e80100
Message-ID: <20260107-lush-bison-of-competence-de27dd@quoll>
References: <20260106154207.1871487-1-pradeep.pragallapati@oss.qualcomm.com>
 <20260106154207.1871487-3-pradeep.pragallapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260106154207.1871487-3-pradeep.pragallapati@oss.qualcomm.com>

On Tue, Jan 06, 2026 at 09:12:05PM +0530, Pradeep P V K wrote:
> Add UFS Host Controller (UFSHC) compatible for x1e80100 SoC. Use
> SM8550 as a fallback since x1e80100 is fully compatible with it.
> 
> Qualcomm UFSHC is no longer compatible with JEDEC UFS-2.0 binding.
> Avoid using the "jedec,ufs-2.0" string in the compatible property.
> 
> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


