Return-Path: <linux-arm-msm+bounces-58869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8A2ABEFCD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 11:31:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F22511BC09DE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 09:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E94AA241698;
	Wed, 21 May 2025 09:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AbmB4VM7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFF511185;
	Wed, 21 May 2025 09:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747819889; cv=none; b=uM9jiBZDIlCJYbzrT85qU3d4j3bjifVxe1/SnOPhlaGIAYQ/Glk2o9LLt5dgCF8EL3xFj/7tsY2/N75NzJC8nKyDvkLpC31AVUVRssFN3baHIQfPg+o0mK8XWrYIeQ5UtCQu4uMxvK5+KvdOvRT9+eT+uAhKN3dLwn4/wj9pius=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747819889; c=relaxed/simple;
	bh=jWMonnDaquqE0UMLzisMG7ohtq59kWDtJskJ1V33tTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZQY31NNCRSG4tUF8OlXHr57FQRZmp9w4Tz028VYACvqpVCocTVu+SEUc2OdDmLylhkxiYmYWP+3D/AO1wKfY3o0sqMMfW8MKnWdn8B+d4EkdDvtO5E8Je0QqJNTNOEaDHQ1uIWczpQi6xV+D0G8sVP42nqzAqEOx9SgbffscmsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AbmB4VM7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF8E2C4CEE4;
	Wed, 21 May 2025 09:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747819889;
	bh=jWMonnDaquqE0UMLzisMG7ohtq59kWDtJskJ1V33tTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AbmB4VM7ouIJkj091JPz8jckcpa94QTzAyiELGOVcluByO9RUJBJU1p8s6sEkaT/C
	 83ff1PjLoWEUrZaRD2tYZEgPbrHBUEl0slmZaj8L/6NBFDt9I6awyVfxjTN4D2zLjs
	 AtMAiDMHAUgHdE8X7gxx0nJRNNHJFd1htsQj36TjNjsooJxB650jPQ1wOyNca1GhgI
	 JhCoCgBat0CmT+QwZFHbZiy48NaekEsh7UjfBHdHUXzS68o6iWTDtWz5xuG26eTg6D
	 isvqYclyQ9HvKBQffxzyySgZav3KR6c9dYbJNf+gVY2A9NZBYgYJKR+gCBNKL74gk6
	 Ws26aWoyeduOw==
Date: Wed, 21 May 2025 11:31:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Johan Hovold <johan+linaro@kernel.org>, Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: arm: qcom: Add Lenovo Thinkbook 16
Message-ID: <20250521-abstract-rampant-vole-5b3ee6@kuoka>
References: <20250515-tb16-dt-v1-0-dc5846a25c48@oldschoolsolutions.biz>
 <20250515-tb16-dt-v1-1-dc5846a25c48@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250515-tb16-dt-v1-1-dc5846a25c48@oldschoolsolutions.biz>

On Thu, May 15, 2025 at 10:38:55PM GMT, Jens Glathe wrote:
> Document the x1p-42-100/x1-26-100 variants of the Thinkbook 16 G7 QOY.
> 
> [1]: https://psref.lenovo.com/syspool/Sys/PDF/ThinkBook/ThinkBook_16_G7_QOY/ThinkBook_16_G7_QOY_Spec.pdf
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index a61c85a47e2e759c7c86f3bd49f8597fc5054929..42d22e2fb7817810742a15226807bd6a984e6acd 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -1152,8 +1152,10 @@ properties:
>        - items:
>            - enum:
>                - asus,zenbook-a14-ux3407qa
> +              - lenovo,thinkbook-16
>                - qcom,x1p42100-crd
>            - const: qcom,x1p42100
> +          - const: qcom,x1e80100

You break existing DTS without any explanation in commit msg. What's
more, your commit msg says something quite different than you are doing
here.

Best regards,
Krzysztof


