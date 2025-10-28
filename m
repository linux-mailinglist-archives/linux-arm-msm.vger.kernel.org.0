Return-Path: <linux-arm-msm+bounces-79086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FC4C12D0F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 04:55:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E613E3A5EA1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 03:55:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF97E28725D;
	Tue, 28 Oct 2025 03:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tbRLEqh3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8200D286426;
	Tue, 28 Oct 2025 03:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761623724; cv=none; b=gvzHx/SAX+hmpzY8cRrDV+dC/ABTokyUYkwutLcHoG5uK2tGm56UOWz7794lMQ+YuobTlKnA5hliDkcpj+rNcDwk/lLMMl7ekAa2QU/GAFxjd5z+KgP5JIJq3aP0SF2x0d0HcbXO4zKynYYHSag1tb6eYns/LPgN02m8dJ3lrQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761623724; c=relaxed/simple;
	bh=dDXQDxxY8lRWIpUbLl6a0HHlcgShkDugrbP6Xi3mWSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y8RFc+rw91GwSB9wcfvWV7TaIz2iV9FCDA/9DdueFVpOdlgTq7YXPsSJAJgtFFAPRhi4WkrbCmNs6hXoGY63euYDPEyJwCrGKtzize675hUXEgtjFeKkP4fvxSiJauJJR2dxqJVtU5mNsnjmWhkxvnxSw6HZUoeXVOGfB0cegSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tbRLEqh3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FC02C4CEE7;
	Tue, 28 Oct 2025 03:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761623723;
	bh=dDXQDxxY8lRWIpUbLl6a0HHlcgShkDugrbP6Xi3mWSU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tbRLEqh3OKPeAdCoe3L8lyhKJXQDmJVCxY/hwVkRr9/1QUDbSShRX9qAMpEcqc1R5
	 Mjtb0kNXQpAW3r8gNgTR+6SS8rjbZhlXHDfs3crbTDBSnJk+WDDBA+SitPFtNO6Ahb
	 dcyU55bkAAe5TjNPCY5MfkCWXJvxgKQfXZ7t8jIZWOAsA+NJoDbVc23V2PB7RQh4pw
	 wjodNbr7hBnP6RKWsENhZ480CQeMeOhZctB0MvfyzwpvpIj06mCijHkl9XYcO2k8J2
	 sHNMiZ+kAV3Ucg+VnGETZcum9mO7l+I9dYnJ/rwKvcE18zfOJcMQIznwOHI6UbD3zH
	 wjh+2IUeDRsIQ==
Date: Mon, 27 Oct 2025 22:58:19 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: qcom: qcom,pmic-glink: Add
 Kaanapali and Glymur compatibles
Message-ID: <xlf7ubya3qq4nehugwbdjkx755m5zhmkbezs2w4hzlanooeomo@3wgf37cypvie>
References: <20251027212250.3847537-1-anjelique.melendez@oss.qualcomm.com>
 <20251027212250.3847537-2-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027212250.3847537-2-anjelique.melendez@oss.qualcomm.com>

On Mon, Oct 27, 2025 at 02:22:49PM -0700, Anjelique Melendez wrote:
> Document the Kaanapali and Glymur compatibles used to describe the PMIC
> glink on each platform.
> Kaanapali will have the same battery supply properties as sm8550 platforms
> so define qcom,sm8550-pmic-glink as fallback for Kaanapali.
> Glymur will have the same battery supply properties as x1e80100 platforms
> so define qcom,x1e80100-pmic-glink as fallback for Glymur.
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

This seems pretty reasonable, kaanapali-pmic-glink being "the same" as
sm8550-pmic-glink, just moved to a different core - with the changes
that implies.

>                - qcom,milos-pmic-glink
>                - qcom,sm8650-pmic-glink
>                - qcom,sm8750-pmic-glink
>                - qcom,x1e80100-pmic-glink

Why did we say x1e80100-pmic-glink is "the same" as sm8550-pmic-glink?

>            - const: qcom,sm8550-pmic-glink
>            - const: qcom,pmic-glink
> +      - items:
> +          - enum:
> +              - qcom,glymur-pmic-glink
> +          - const: qcom,x1e80100-pmic-glink

glymur-pmic-glink indeed has parts in common with x1e80100-pmic-glink,
so I guess that makes sense.

> +          - const: qcom,sm8550-pmic-glink

I don't think this should be here.

Regards,
Bjorn

> +          - const: qcom,pmic-glink
>  
>    '#address-cells':
>      const: 1
> -- 
> 2.34.1
> 

