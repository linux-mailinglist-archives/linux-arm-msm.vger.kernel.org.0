Return-Path: <linux-arm-msm+bounces-78411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 05012BFE497
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 23:19:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C28A24E9B40
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 21:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E99B2F363B;
	Wed, 22 Oct 2025 21:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qbKF+xny"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AF32F0698;
	Wed, 22 Oct 2025 21:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761167928; cv=none; b=VNYNvzRlQPMeLVaYUkvdtqSLIez/neQzqCSlYcfi2MZ0LR1BVo/zOhDq3frAMyi/CPcExwKpNQMNu8ng3E9QmBb5YU2KJTqjZeuhc4YlO+kJSlSRLjBKsKfkEj4mVd16HrY4weHHyKqlXn0ZixueIfg1ffjitECqdadjQ9sE7TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761167928; c=relaxed/simple;
	bh=StqPsY0tft5fyU/GLFvw3ZkUip/yJMTlTnpNO4piBeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ih8fT/sRzbMfELSaRGupe/QYF3iLSgcawBE2py6T5dJPZx/Hf02J7Lrm/sCozRGvuzwjmHRi/hReLqRvjfOiS1bmBjvdnun+I9SZqiZHzUv5vO1bvgm7pN48DGgBNuji9VV9BdrwqH/JuSE5yuenSrwdAmRcTZCc5rzn4VWl1Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qbKF+xny; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9CB1C4CEE7;
	Wed, 22 Oct 2025 21:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761167926;
	bh=StqPsY0tft5fyU/GLFvw3ZkUip/yJMTlTnpNO4piBeM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qbKF+xnyokLhP1I0nJPIO2zgZbniimO66RJtBlFh4HSqT1Gn1vRNkNGfkWaWnk1KI
	 /Ao8lPjh9C3vcFLvD5744a22VCewTjEtqDhlZNVJ/FAbYx/mfFtOw8eOrt8Gx+Zj/L
	 cS52y3IdfEW4t/pZoMEW3jDbOzz/rV5NvJxoxVKMTat3yI1iHEZY1AO7qtCsdm45YQ
	 EycfdhqKVc5XMeu3Yy9EDgCYTQp/Nrlxp1O4t2ngaeZdek/4xSfMe8g1kusJHQoKae
	 BA98d1FpUS9bD/jBAtT9cXadecwLydBo+bz0H4Jw2yXH6pYoI91LpAIQcgui1zjR+/
	 dpTClt5yX+v9g==
Date: Wed, 22 Oct 2025 16:21:08 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/4] soc: qcom: rpmh: Add support to read back
 resource settings
Message-ID: <litd6qcxuios7uwwcrz55ea24kj26onrjo2aekouynsce6wslj@vatjbulg64mb>
References: <20251022-add-rpmh-read-support-v2-0-5c7a8e4df601@oss.qualcomm.com>
 <20251022-add-rpmh-read-support-v2-2-5c7a8e4df601@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022-add-rpmh-read-support-v2-2-5c7a8e4df601@oss.qualcomm.com>

On Wed, Oct 22, 2025 at 02:38:54AM +0530, Kamal Wadhwa wrote:
> From: Maulik Shah <maulik.shah@oss.qualcomm.com>
> 
> All rpmh_*() APIs so far have supported placing votes for various
> resource settings but the H/W also have option to read resource
> settings.
> 
> This change adds a new rpmh_read() API to allow clients
> to read back resource setting from H/W. This will be useful for
> clients like regulators, which currently don't have a way to know
> the settings applied during bootloader stage.
> 

Allow me to express my disappointment over the fact that you sat on this
for 7 years!

> Link: https://lore.kernel.org/r/20250623-add-rpmh-read-support-v1-1-ae583d260195@oss.qualcomm.com

Why is there a Link here?

> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/rpmh-rsc.c | 13 +++++++++++--
>  drivers/soc/qcom/rpmh.c     | 47 +++++++++++++++++++++++++++++++++++++++++----
>  include/soc/qcom/rpmh.h     |  5 +++++
>  include/soc/qcom/tcs.h      |  2 ++
>  4 files changed, 61 insertions(+), 6 deletions(-)
> 
[..]
> diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
[..]
> +/**
> + * rpmh_read: Read a resource value
> + *
> + * @dev: The device making the request
> + * @cmd: The payload having address of resource to read
> + *
> + * Reads the value for the resource address given in tcs_cmd->addr
> + * and returns the tcs_cmd->data filled with same.
> + *
> + * May sleep. Do not call from atomic contexts.

* Context: May sleep...

Regards,
Bjorn

> + *
> + * Return: 0 on success, negative errno on failure
> + */
> +int rpmh_read(const struct device *dev, struct tcs_cmd *cmd)

