Return-Path: <linux-arm-msm+bounces-65768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A35B0B37C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 06:16:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 616A93B8B05
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 04:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C39619007D;
	Sun, 20 Jul 2025 04:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eq/XdczO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE516D299;
	Sun, 20 Jul 2025 04:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752984959; cv=none; b=C79bkIZh2bIfSNGo9fdndBcIok/GMOUSZwHFhL42WREDrWYn5HKsTHUM9qjrrCvYsQyAt1ZZfMr03cCLLNeUWVQCsvu/Dut5UQfHQjJq/zfuNBa8+7sR8tTNnTkayClhAHC16KDlQ+B3yzutBHQwi9vBv6KKbzQu7t6yRYYis9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752984959; c=relaxed/simple;
	bh=BYAK92bb0f0T5+E39TA12TXr6wJMu1YX8GKgQWR8524=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wek20WW9Z3++rFdcCTgO+gSsU8SQ4nJE42YR+rGtu8a6Nqpr2Gx6mQRpgAOsNtozWYI8jIqu30mcpLu7uz0ehB98Uy/eL1aiGEM8QyWzbPwnziSC15x9WTyP6rxY1qBQNgE6S+70f8aeH0Xl/eWiZnlOPh1dBDoQo4tYIxMaGPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eq/XdczO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AA84C4CEEB;
	Sun, 20 Jul 2025 04:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752984957;
	bh=BYAK92bb0f0T5+E39TA12TXr6wJMu1YX8GKgQWR8524=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eq/XdczOBAxBQm33Hdk06cUMAJBApXpHU+zhILmURLe1MeviTj110wtHYv5Ps0uQE
	 +Q8I4qUrRDDjsMdIz+CILtYXQzuWb84Ph0YRWZAPbxf4H/7Dp/72RjoVbjnivUDyu/
	 YhsZ0T5SXEF4VgZvLldc7jkXCOcyHTxpfiIrOGx6a5sUyM1/hxFHTYKjelfLJcsiWO
	 Fj2Vg1MRbwn8ZZcGtbFA6aFdaqUa2pKpi7rox7dAXRwTimQqrQH91aBmnSLapunE8R
	 Y9tzO+D6UloMV65j8s+wZjZWrRBOiko1OIKihp0bU7apO7+LvNEkmR5DV2ALA7SzSc
	 2QIt34zOjlwqw==
Date: Sat, 19 Jul 2025 23:15:54 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, dmitry.baryshkov@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: qcom: qcom,pmic-glink: Add
 qcom,subsys-restart property
Message-ID: <hrm6fd5hnae2h6hbsb567hmw5a36sm2henvb7la4wwyux6lspr@32l7adxjzwpg>
References: <20250716004004.311001-1-anjelique.melendez@oss.qualcomm.com>
 <20250716004004.311001-2-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716004004.311001-2-anjelique.melendez@oss.qualcomm.com>

On Tue, Jul 15, 2025 at 05:40:03PM -0700, Anjelique Melendez wrote:
> Add new "qcom,subsys-restart" property to enable subsystem restart (SSR)
> notifications.
> 

Please follow
https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
and fully describe what problem your patch is solving.

Most people have no idea what subsystem restart means, and those who do
has to guess what it means for pmic-glink.

> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml         | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> index 4c9e78f29523..90011096894e 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> @@ -49,6 +49,10 @@ properties:
>    '#size-cells':
>      const: 0
>  
> +  qcom,subsys-restart:

And my guess is unfortunately that this doesn't describe the
hardware/firmware, but that this is configuring the OS behavior.

Please write a commit message that doesn't force me to guess.

Regards,
Bjorn

> +    description: If property is specified subsystem restart (SSR) notifications will be enabled.
> +    type: boolean
> +
>    orientation-gpios:
>      description: Array of input gpios for the Type-C connector orientation indication.
>        The GPIO indication is used to detect the orientation of the Type-C connector.
> -- 
> 2.34.1
> 

