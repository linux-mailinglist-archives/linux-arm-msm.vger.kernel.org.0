Return-Path: <linux-arm-msm+bounces-85797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50098CCEDE2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 08:59:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B2FC830173BF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 07:59:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 686512C0291;
	Fri, 19 Dec 2025 07:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MUyEhz+L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B00D246BBA;
	Fri, 19 Dec 2025 07:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766131194; cv=none; b=LWcNi2wthKdme10C7ryU3NjoLkFW6J8kEGTGAGW5Hz7kHvJnEM9Mm/zJa+ym+5JdlB81Ja470wQr04ARPqYWEI6YqjsoXs69uqzs2jVu84lRJPNxuozB3vZL/U3o02XgzEWaiHotuMIqq7ib53tNSRVpXX9RgqZc3lHGoykz4HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766131194; c=relaxed/simple;
	bh=ug4JtzHK6U4qG5YLhEYfr1JtKSz9B9iqdgSijCnuPyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AAF93SiHk9zYbY6M9cTuCtIVdl091KIhLcYSI0mIIi923LbbhxBWA++zLqKZW1fMNxlFsed8ytm/c62LSFKlmxcsVJ0ecojKnvgCIV6W39XDxh71j/6e9HsjBXVOGyiiN6mfOzu0+XcKu+3Nj8g/NaQ45G2ooFNkBoa1OLdUQuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MUyEhz+L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5216C116D0;
	Fri, 19 Dec 2025 07:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766131193;
	bh=ug4JtzHK6U4qG5YLhEYfr1JtKSz9B9iqdgSijCnuPyw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MUyEhz+LeEDa+w0LOy55a+5p9cGvU8ojQp8lQ56ttlOM2gfTAGauOXUOi8umSQNTf
	 RGDN5RrN/fDBQTdRId6npeLV/n6+TF2p/jKTJxn9N+AQKtePGszpPgMyIaEh3SZ1Wh
	 hr4Ks+rJcDVaaGDZHM7raVI/C8pYJN/N8YshYqVuzRBLct4dsHpdBnJJhI4QU6o2RP
	 TccqtPsb1VcoHbqKvOr3gH1tTETOMS5KcXxCCcXkVl79DLPd1Q6wrW1qqQxkW4ngkJ
	 /UK2uLZQsowFRnfZwPnlOfJ3CDW7SURoiU9U3duZY3NbennIXNpWWl96XsfwjOsGPh
	 cYSU+18zPfyoA==
Date: Fri, 19 Dec 2025 08:59:49 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: soc: qcom: qcom,pmic-glink: Add
 Kaanapali and Glymur compatibles
Message-ID: <20251219-practical-tarsier-of-influence-64baf0@quoll>
References: <20251217055655.638594-1-anjelique.melendez@oss.qualcomm.com>
 <20251217055655.638594-2-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251217055655.638594-2-anjelique.melendez@oss.qualcomm.com>

On Tue, Dec 16, 2025 at 09:56:54PM -0800, Anjelique Melendez wrote:
> Kaanapali PMIC glink platforms support features exposed by the SM8550
> PMIC glink interface. Document the Kaanpali compatible string to have
> fallback on SM8550.
> 
> Glymur PMIC glink platforms support features exposed by SM8550,

We will be repeating the same discussion, probably, because above does
not help me to understand at all. How Glymur can be compatible with
Kaanapali, which is both: compatible with X1E and not compatible with
X1E

> X1E80100 and Kaanapali PMIC glink interfaces. Document the Glymur
> compatible string to have fallbacks on SM8550, X1E80100 and Kaanapali.

Half of your commit msg - this sentence and last sentence from previous
paragraph - is redundant because you repeat what is in the diff. It's
obvious. Imagine please that we can read the diff. But the weirdness of
compatibility is not explained at all.

> 
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml     | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> index 7085bf88afab..302b338e7012 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> @@ -37,12 +37,20 @@ properties:
>            - const: qcom,pmic-glink
>        - items:
>            - enum:
> +              - qcom,kaanapali-pmic-glink
>                - qcom,milos-pmic-glink
>                - qcom,sm8650-pmic-glink
>                - qcom,sm8750-pmic-glink
>                - qcom,x1e80100-pmic-glink

This means they are not compatible...

>            - const: qcom,sm8550-pmic-glink
>            - const: qcom,pmic-glink
> +      - items:
> +          - enum:
> +              - qcom,glymur-pmic-glink
> +          - const: qcom,kaanapali-pmic-glink
> +          - const: qcom,x1e80100-pmic-glink

This suggests they are actually compatible.

> +          - const: qcom,sm8550-pmic-glink
> +          - const: qcom,pmic-glink
>  
>    '#address-cells':
>      const: 1
> -- 
> 2.34.1
> 

