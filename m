Return-Path: <linux-arm-msm+bounces-63149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 90ADCAEF09F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 10:12:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8796A3A12E4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 08:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0D8C2698AE;
	Tue,  1 Jul 2025 08:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rSPsu2Qa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEDB26529F;
	Tue,  1 Jul 2025 08:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751357557; cv=none; b=UrjssArdTTPdI5/vymv17PBTj9PZjWDjT5JXtmDjCjZ4C8iGE9M/BNQHckHXJG5y7R65JXFO371deI5vKClkDyzORtY09XFw35NBHSfIH6FlY3DHFUrno7tNpflpGxYcS4ogADj9qpPU4UnlHjzoeJPZ6yjImoryrKM5uGio8vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751357557; c=relaxed/simple;
	bh=fxLzDesq/YwkqQuH+ZL5XgTE8NaVtf9vtpKbGl9UHXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sp7v6JBgIx3FinEG7fO8zh0F0qeIAJ/cAiuhlw5oy6Nu79cBWVJtOdMx69hr2RZV6YAPUKBEBxoxMi/xmiF9eNuQn1oQy4c6u+OUvCnHk2Yw7H3pNsKlRyvr6xJe2VKFu5cV1YjVJMrSsXBLCBYOJmZsJYkuOEf0o4RtqTwP71Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rSPsu2Qa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B40D8C4CEEB;
	Tue,  1 Jul 2025 08:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751357557;
	bh=fxLzDesq/YwkqQuH+ZL5XgTE8NaVtf9vtpKbGl9UHXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rSPsu2QaS8xQgdl82VsQBmcsRWDMxOh2dCYDxnaWV3Q4R/0EeYSSSddUcMEKE3MnJ
	 gOWwfrINqxIOcmXNqX+C2tUjtHKXULMIW7mo0N4u22p6w3Q/H2hGkjU9hfXvjBmRO3
	 G4Q+lvquPEj3CMYLEjROF7YvtqkPVRUigrF+n1c493ZtQMPul2SAx2jNCneOL3VAhk
	 ONAkWmAH99SZGxspbGPCWLjRnCMqkjobNDqqwPciKHz7tReyO9U+qrujMOmZSy/aW9
	 FvmJDu5ngYU1kSI7ZnqmaddLv0YO/70XLati4CDc7xxiU/zP+K1SEKKbL5KepZ4v7n
	 IysK7RrFg9low==
Date: Tue, 1 Jul 2025 10:12:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: remoteproc: qcom,sm8350-pas:
 document SM7635 MPSS & WPSS
Message-ID: <20250701-melodic-courageous-mussel-0bed22@krzk-bin>
References: <20250627-sm7635-remoteprocs-v2-0-0fa518f8bf6d@fairphone.com>
 <20250627-sm7635-remoteprocs-v2-1-0fa518f8bf6d@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250627-sm7635-remoteprocs-v2-1-0fa518f8bf6d@fairphone.com>

On Fri, Jun 27, 2025 at 08:55:42AM +0200, Luca Weiss wrote:
> @@ -91,6 +93,7 @@ allOf:
>        properties:
>          compatible:
>            enum:
> +            - qcom,sm7635-mpss-pas
>              - qcom,sm8350-mpss-pas
>              - qcom,sm8450-mpss-pas
>      then:
> @@ -142,6 +145,22 @@ allOf:
>              - const: cx
>              - const: mxc
>  
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - qcom,sm7635-wpss-pas

Everything fits better sm6350 and no need for new if:then: entry, at
least it looks like.

Best regards,
Krzysztof


