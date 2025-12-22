Return-Path: <linux-arm-msm+bounces-86266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 60540CD6FF8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 20:42:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 52591300CCCF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 19:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 483A433B6EE;
	Mon, 22 Dec 2025 19:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IwgvAxAb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F590337BAB;
	Mon, 22 Dec 2025 19:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766432534; cv=none; b=gtTveOBIE6QsHuLnU/4xhkbQTcBnX6OYa2vOi9OkOjtC6d+W+LLa9cAMf45sJc3EWbevS5MkC7mQwi/BEKmjL9pFxVwaXwVE8s2LYIgTdQOSytOEZ627H9RNFoPg5bkYrZojFJmoKzejgF7gQhAiPX+Qxb/shib8tGGVHYjYNC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766432534; c=relaxed/simple;
	bh=lQwC8Zv6FZRp2lScl8Ke49eBMXRzEwq3dGok1Pl19DQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B3gGHXvnTsETDew4bFPmY5WXHAl3JrnaaDL3NtaDDfUlvvUY9BXg4qyILD4dKF9DuDwPH43UBuiTkIKkDse9mwnQC779zDpmbzvLfy8W9NYnd6AZvkozjB3el2hF34C3fo6UVUgRpT4eK3agwgblLgZ3r2ZrBqXzLn8xjKCdVbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IwgvAxAb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 988ABC4CEF1;
	Mon, 22 Dec 2025 19:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766432533;
	bh=lQwC8Zv6FZRp2lScl8Ke49eBMXRzEwq3dGok1Pl19DQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IwgvAxAbwzZ9gYugZpEBTWQLehjQ+DJ26JFFP68Mt1kZUeIBWwlz1mL8VPbpzpsXD
	 2EHcXFYYDc6TR9t2dXwcRDzqapBssl+6OOiZb7ZXn1VvARaIHhhVkC2K5YwVLE8IDy
	 rXnMvF17iP6VeSAJZ83Pv9IIbM+x/itsVq5Lau15oQrKwwhdQw4mWrQnvkFO0uTKi4
	 UeqvDLyJdXmwyGcVMzGdfnyluszxCKLdL4x8DrFOQVuSNEKtXKchYoIW2Sk7SI2781
	 OGgmkzFd5l4Ak1jlvZmlHbJskDjjr1gOUaFKGVWADAvEdLD6mLHHIZwVNq4Xx0abtB
	 11c7PK+6B92Xg==
Date: Mon, 22 Dec 2025 13:42:10 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: soc: qcom: qcom,pmic-glink: Add
 Kaanapali and Glymur compatibles
Message-ID: <fcb65bmrocuyapp2hocfzxuufa2ttgv7sf4ip72yybbefm65zb@ojka5lpo7iuh>
References: <20251217055655.638594-1-anjelique.melendez@oss.qualcomm.com>
 <20251217055655.638594-2-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217055655.638594-2-anjelique.melendez@oss.qualcomm.com>

On Tue, Dec 16, 2025 at 09:56:54PM -0800, Anjelique Melendez wrote:
> Kaanapali PMIC glink platforms support features exposed by the SM8550
> PMIC glink interface. Document the Kaanpali compatible string to have
> fallback on SM8550.
> 
> Glymur PMIC glink platforms support features exposed by SM8550,
> X1E80100 and Kaanapali PMIC glink interfaces. Document the Glymur
> compatible string to have fallbacks on SM8550, X1E80100 and Kaanapali.

But while the Glymur PMIC GLINK interface does present (almost) the same
features as SM8550 and/or Kaanapali, I don't see them as compatible. The
protocol is different and if nothing else, as shown by patch 2, the life
cycle is different.

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
>            - const: qcom,sm8550-pmic-glink
>            - const: qcom,pmic-glink
> +      - items:
> +          - enum:
> +              - qcom,glymur-pmic-glink
> +          - const: qcom,kaanapali-pmic-glink
> +          - const: qcom,x1e80100-pmic-glink
> +          - const: qcom,sm8550-pmic-glink
> +          - const: qcom,pmic-glink

So this would then result in:

compatible = "qcom,glymur-pmic-glink", "qcom,kaanapali-pmic-glink", "qcom,x1e80100-pmic-glink", "qcom,sm8550-pmic-glink", "qcom,pmic-glink";

Which tells the operating system that it should use the implementation
for the Glymur interface, and if that isn't known the implementation for
the Kaanapali interface, and if that isn't known the implementation for
the Hamoa interface, and if that isn't known the implementation for the
SM8550 interface, and if that isn't known the generic "pmic glink"
interface.

So, in an operating system that doesn't know how to interact with
Glymur, you have stated that Kaanapali is a good second choice. This
does accurately capture the soccp behavior, but looking at the
individual functions we're not compatible with Kaanapali.

If we're in an operating system that doesn't know about Glymur or
Kaanapali, you're stating that the Hamoa implementation is good. I think
this is accurate for several of the features, but the OS will forever
wait for the services to show up.

Etc...

As such, I think the appropriate way to express this is to add two new
"top-level" options:

      - items:
          - const: qcom,kaanapali-pmic-glink
          - const: qcom,pmic-glink
      - items:
          - const: qcom,glymur-pmic-glink
          - const: qcom,pmic-glink

This establishes them as new "base compatibles", which can be used for
derived platforms, by just adding the relevant enums. The alternative is
to add them to the first item (enum + qcom,pmic-glink) and then as soon
as we have derivatives we split it out in enum + kaanapali +
qcom,pmic-glink or enum + glymur + qcom,pmic-glink. But I think this
would be cleaner.

Regards,
Bjorn

>  
>    '#address-cells':
>      const: 1
> -- 
> 2.34.1
> 

