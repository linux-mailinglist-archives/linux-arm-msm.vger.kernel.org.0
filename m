Return-Path: <linux-arm-msm+bounces-17644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDB68A7BFD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 07:57:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7D91281B5F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 05:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4C7952F87;
	Wed, 17 Apr 2024 05:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oyQdX9OS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EEE537EC
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 05:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713333459; cv=none; b=DL6z/+bIe1Tsiqv8g+sQYLKjMR02DY6KYn1PDRklK3kCi8uSLoFV9mSkmOfTpKYoZgag1cmY2t2QPQmwWjqKre0wo+E47AC5eBOVYWI3KdNCyYj/w/remTLqloKJKzgl3hPJfdAN8qdpWeIc4gbZXb7uWeNzvq7cqSEZ7l+q3uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713333459; c=relaxed/simple;
	bh=+37MR6MdJMZsDizwLtZ66hNEIJ8H6WWiH+pKyVxVm+M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HrRrD2qLIu3ZrfDh2CGf0IPC6coYK9pGxqoZH2qfTskMbEVB/Tl3qQPT0nqu7Je+9Blo1zRXH/BQFpOLAM/ofgotp8eGaRMdWMLilDyMF1CeMV3Fe9Y5dp80FCb8UDbboiClAFtwZ2JShkfWEj5BR3FcdUQXmrtPrIE3qM0TF+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oyQdX9OS; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dd02fb9a31cso4555875276.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Apr 2024 22:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713333457; x=1713938257; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rNcOWvfk3UIO9gpF1vedzWy9UX8ITuyEtwuAcYcPDTE=;
        b=oyQdX9OS3XwnqqvnV9Yo5QzeRKhxYMDPUxT8GAWmyl7Vow1SDMP3lKiOKPzpQmx7C+
         Ehkv+9pV8OUT82mLXxi2+8j/v4BwYw8NSv1zpMjzJiZkKhIf0vIRrtxPfouMvB3otU/D
         9ZgZiVh/yNkx6H4q5x3Ve8M/G8H48/lWzEIzWIg28P5H5dlyKmqOKsL5gKsQstQ3mF9z
         HjKa7XNBr9DpEtUfUazLaIJ+LMhSrDO0MO8GDeHZ4Wx2yTNXQ4VCvPJ0nbTs6a9MnvYG
         J3ITMn8MWPj/vaLGVmfpmnv9fSOGCBqOAaf3NsuH8T0+zRyo4BWKcLF1I0MEjIsTTRfc
         gg/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713333457; x=1713938257;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rNcOWvfk3UIO9gpF1vedzWy9UX8ITuyEtwuAcYcPDTE=;
        b=CjyhnIyG0tHxM0ab3woXWQvXl2566UwpD3HHNlWjLCaxEaOlC1sqSpwLmwiZ7tgd8R
         FSLJVNFGCEfVGN/7RBlKwxp2u4N5huguuydCJiyX+sdHHaks3v/m94GRJrub/hG+NHUz
         L5lxoCtKi5HS/zoXSto8W40lbFzuEJ7u84SzOP8EcDytV1ImfXzAfrzDpHxV6PFVhB5b
         he9m2FCBsy2JbEagovxVuKHmglr/ZagG2KvaixI/3j0GJ8J4Mfn1P/KQyfEn93D/raA6
         jMo3k40KHFxVGwIoAHSbOZfreqQrJuu2w5W5kUd3dOORaytQyDsuoFrBuJ8QLimkhere
         p6Iw==
X-Forwarded-Encrypted: i=1; AJvYcCW3h4obzhtqDIiynUOeTQrBmYGn7MNVq1ZBNJ6Cz/ZvmKS235LUVCwdLppOnSNmbivnC2ZyIX4lSiqpBR0KIjgszrtfjjgMIfiV6JMTvw==
X-Gm-Message-State: AOJu0YwIbRNA8oONUOpMok4V1rIvp6krysk0MNGyvvCdSple2DrG1evN
	bCwELsyLrX/RZ5bn8jkCq8RCLSp28POSZrjIbci9RfKuuJ9cY5uhw8xRHIXNHcsxL4ILY91hyJL
	2YMQ8zyGpRWMT2QfmrRjYeOOFWg4czSJjh3MsQA==
X-Google-Smtp-Source: AGHT+IFvUyY4VR6NF7RdZCvXFlEENeC2C1SHZuye8tqXC6fIwkIUmwR3VOt9Upi8bmgYZVnv+2wX6k4TBDNDViUqr10=
X-Received: by 2002:a25:81ce:0:b0:dcc:245b:690e with SMTP id
 n14-20020a2581ce000000b00dcc245b690emr8017444ybm.40.1713333457167; Tue, 16
 Apr 2024 22:57:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240415115603.1523974-1-github.com@herrie.org> <20240417045207.3594931-1-github.com@herrie.org>
In-Reply-To: <20240417045207.3594931-1-github.com@herrie.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Apr 2024 08:57:26 +0300
Message-ID: <CAA8EJpo=nd8ywUzz2e42p7WAyuFm439yvNf6H=MD63LCV0xTnw@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: phy: qcom,usb-hs-phy: Add compatible
To: Herman van Hazendonk <github.com@herrie.org>
Cc: andersson@kernel.org, benwolsieffer@gmail.com, chris.chapuis@gmail.com, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, kishon@kernel.org, 
	konrad.dybcio@linaro.org, krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, me@herrie.org, 
	robh@kernel.org, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Apr 2024 at 07:52, Herman van Hazendonk
<github.com@herrie.org> wrote:
>
> Adds qcom,usb-hs-phy-msm8660 compatible
>
> Used by HP Touchpad (tenderloin) for example.
>
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml
> index f042d6af1594..ccf23170cd17 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml
> @@ -15,6 +15,7 @@ if:
>        contains:
>          enum:
>            - qcom,usb-hs-phy-apq8064
> +          - qcom,usb-hs-phy-msm8660
>            - qcom,usb-hs-phy-msm8960
>  then:
>    properties:
> @@ -41,6 +42,7 @@ properties:
>        - enum:
>            - qcom,usb-hs-phy-apq8064
>            - qcom,usb-hs-phy-msm8226
> +          - qcom,usb-hs-phy-msm8960

This should probably be msm8660 rather than 8960

Note, nowadays the rule would be to use qcom,msm8660-usb-hs-phy
compatible, but I wonder if we should enforce this for such an old
platform or whether similarity wins.

>            - qcom,usb-hs-phy-msm8916
>            - qcom,usb-hs-phy-msm8960
>            - qcom,usb-hs-phy-msm8974
>


-- 
With best wishes
Dmitry

