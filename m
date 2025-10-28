Return-Path: <linux-arm-msm+bounces-79125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D940DC138AC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 09:29:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 47EB7350BDE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 08:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB42D27A93C;
	Tue, 28 Oct 2025 08:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JoBU6eEa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B026D824BD;
	Tue, 28 Oct 2025 08:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761640165; cv=none; b=P0V8iltPFkE0c2K9sZhR0903WjPTNDe8xmZ0i1VUcpesk0iaUxQpMrJqvUJFqd+ikFZ0Ud7zBxZmQLQJeq6sY5CwO31U0IgbsIfQwlTpXeM1c5w2TIdkOZ+tq56LMUXcPy+GpPVV0WdZLHHSMNihXT+PnkgTFMEC57si6S7jZ8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761640165; c=relaxed/simple;
	bh=MxdxPkFbS7WE4/2scpiWgRVhmy2bTK4aDLhQCGZ8pGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MR5KjGNFEXXfvcbO63GF7CP1kXuRm7U+J2KdA/2swi7joAPPrEgewhD8GzZHFIXJWTXgraHyK2jEPr6F6Q549Uffvk03ucxt7Qj+/6rO9eVK0dDljR/psruM5HeVGvk+BNYgUfCSgbRur8sq2c0Tp2gYjrN8IwDPqdo+8Ua7aFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JoBU6eEa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F086FC4CEE7;
	Tue, 28 Oct 2025 08:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761640165;
	bh=MxdxPkFbS7WE4/2scpiWgRVhmy2bTK4aDLhQCGZ8pGE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JoBU6eEau5WZjJex7C5t1Cr95ex2gD/1SknKV58nW5MonsW3YWWEXlXmyIqeyMJRk
	 DUdxzQ7bZo2e5Dh6pdfwyl38nHaz4Q4GnCf8lYgTtRiJI1dmJYzcVjiYBDoNbzS7PU
	 zPkgzpEDYwlei/xvVp/Mi0KpIbxDxLzNsGa9f3VkZMSD5SmeHE69dlkH0VvhC/TiVy
	 yGBGvYNm6psw02aciZvSldLd8AiOO7eLPa/YYngI6jPm1XKAKalV9Kz9joSmOEkV8X
	 jg6a3i+ki3OE1RTrXEb5AVAuAj1ZTJYWwO3O8ds0NngEM05do7Lvjb82BYWoWTUFhS
	 LcXZmO0jzRf/A==
Date: Tue, 28 Oct 2025 09:29:22 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: qcom: qcom,pmic-glink: Add
 Kaanapali and Glymur compatibles
Message-ID: <20251028-private-chirpy-earthworm-6fccfe@kuoka>
References: <20251027212250.3847537-1-anjelique.melendez@oss.qualcomm.com>
 <20251027212250.3847537-2-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251027212250.3847537-2-anjelique.melendez@oss.qualcomm.com>

On Mon, Oct 27, 2025 at 02:22:49PM -0700, Anjelique Melendez wrote:
> Document the Kaanapali and Glymur compatibles used to describe the PMIC
> glink on each platform.
> Kaanapali will have the same battery supply properties as sm8550 platforms
> so define qcom,sm8550-pmic-glink as fallback for Kaanapali.
> Glymur will have the same battery supply properties as x1e80100 platforms
> so define qcom,x1e80100-pmic-glink as fallback for Glymur.

What does it mean "battery supply properties"? Binding does not define
them, so both paragraphs do not help me understanding the logic behind
such choice at all.

What are you describing in this binding? Battery properties? No, battery
properties go to the monitored-battery, right? So maybe you describe SW
interface...

> 
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml      | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> index 7085bf88afab..c57022109419 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> @@ -37,12 +37,19 @@ properties:
>            - const: qcom,pmic-glink
>        - items:
>            - enum:
> +              - qcom,kaanapali-pmic-glink
>                - qcom,milos-pmic-glink
>                - qcom,sm8650-pmic-glink
>                - qcom,sm8750-pmic-glink

Why qcom,kaanapali-pmic-glink is not compatible with
qcom,sm8750-pmic-glink? If Glymur is compatible with previous
generation, I would expect that here too.

>                - qcom,x1e80100-pmic-glink
>            - const: qcom,sm8550-pmic-glink
>            - const: qcom,pmic-glink
> +      - items:
> +          - enum:
> +              - qcom,glymur-pmic-glink
> +          - const: qcom,x1e80100-pmic-glink
> +          - const: qcom,sm8550-pmic-glink
> +          - const: qcom,pmic-glink
>  
>    '#address-cells':
>      const: 1
> -- 
> 2.34.1
> 

