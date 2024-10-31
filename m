Return-Path: <linux-arm-msm+bounces-36583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F059B8134
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 18:30:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9E6F6B22360
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 17:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C5E91C2DB4;
	Thu, 31 Oct 2024 17:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DP7vWfiX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A4915CD4A
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 17:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730395825; cv=none; b=UB/wL7DneN2JmvhE39N8h0nzbnmGDS1PRiguTG5XTn7x36ErYWb2uILQu6/md0Sw89azKFArU24ssgi4OFwD71eTfcoSorv+lF4hvfe/K2nNGFsMoF0aGkiEwMtwiBSFXa95xoSsJXReGQT1Olfc1iftUvB+yMAh4R/0xxIP+kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730395825; c=relaxed/simple;
	bh=MBOD+KqYko5yyE54zVau7xQJz6iNG2bxzCqatOaQlLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UgCEp6WVzphfzeTxGCt6XWhn1E8or7GeuacKfNXP3xLF71vumSKFAlH0NDQ0CBelrJgoPAE+jF2W5iPua5PY0m3z3ZaZ5oYH+3AaoZVO6ShtkAvax4d5yTJLtJiWZPVyMLIQZ4c/2uCmCaRv3Vm5KwmZxaIPjdHWz8IQtkSi8r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DP7vWfiX; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2f7657f9f62so10744251fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 10:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730395819; x=1731000619; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o71t8r7vgkbjCB+JTzcHx3L635nlBS6oGdELK9pFlKg=;
        b=DP7vWfiXAp2jm4QDQmnl0HObjvWnEHxU5GO/TfiubaNivlMJv87PbZWFYbHt7x8okj
         MFQSqHQc0eZDKTOP4n8BzdKMWiYLf04NI1G+HNWAUEco8/9kazY9DoWUm0EnMMYlVqFa
         NQC0+FbYXLNp8+xJhWuR+FnIOWEZVmQqhcjJUorh65mFNktwMiFb5CaNNoHfBJxFzGdI
         LZBXG4OCqCCQNMGHwbYqZrqSuh8V9tUWeluiKK1a+ckGk264lckKhtHSFkvSTx0Y0huq
         ClykhyiVv20GByqQhNNb02AmhACqO77E+jERW98s42U42+NMxqfgAbdJ9zzS/1UMx5Zz
         /Mwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730395819; x=1731000619;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o71t8r7vgkbjCB+JTzcHx3L635nlBS6oGdELK9pFlKg=;
        b=EUj4Zx+mxEUYdit8wnc0DxwI7SSSf+ftzNmZYNG1vUSjalJdXh+ybJVun/Wsrij//T
         0xaNu5a3aMXfdl5IB0IwbHahUw3ohPiw+EkcTWIOegPIkBF5ChI6RPf92JAPMx1RUDfg
         F2zSakY2pbECO5ul8B9iJvNZTw+vfvIDX5ylSr4i9E9qWnbG/Sk1n5xezXjccZHJm1Ti
         PRg5Tp4ahh3RoFc7xiozfWaASE3UOChnEmV1v+2Q/YbXJBO8eaO4fMktoZvpkGO4R93+
         wYyxd+D9GqIphW/Y35EseqDMEWAf0WIrEPw3nvUHl+VnTptPd10sAm+jRoqmmeROPPVk
         kHvg==
X-Gm-Message-State: AOJu0YzwLpxKdUL/1QqUTGr8Xc9mFSHaGbmm1I+CQsKs52uJs9muWGhi
	p3KGIep6FbinOVOnaOxPTas9G5JCcUDYeQnfz/66CNchn1jnPxbT7+0ewaofEWM=
X-Google-Smtp-Source: AGHT+IHpXHQzRZTpMmC1s7colpkTM22bTNmTJ34E8zhBmy2vF8cs/wIBfUpmNueT0LoWUO6+kniHBQ==
X-Received: by 2002:a05:651c:154a:b0:2fb:7e65:cb27 with SMTP id 38308e7fff4ca-2fcbdf68bf5mr113304231fa.6.1730395818702;
        Thu, 31 Oct 2024 10:30:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fdef5d624esm2791121fa.38.2024.10.31.10.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 10:30:17 -0700 (PDT)
Date: Thu, 31 Oct 2024 19:30:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mailbox: qcom-ipcc: Add SAR2130P compatible
Message-ID: <ctzqe7o6vo6i3rz3lfe7cvkvowcfaxf33hftio7cygxljjnntb@rg6wsg3eopp7>
References: <20241017-sar2130p-mbox-v1-1-906aa78b1358@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017-sar2130p-mbox-v1-1-906aa78b1358@linaro.org>

On Thu, Oct 17, 2024 at 09:17:23PM +0300, Dmitry Baryshkov wrote:
> Document compatible for the IPCC mailbox controller on SAR2130P platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
>  1 file changed, 1 insertion(+)

Gracious ping, the patch has been acked by DT maintainers, but is still
not present in linux-next and got no other reviews.

> 
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> index 2d66770ed3612fd4bf9e28c334b273033e13684f..ecb4ec1e0a82856581f16391813b3c533c4f6f90 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> @@ -28,6 +28,7 @@ properties:
>            - qcom,qdu1000-ipcc
>            - qcom,sa8255p-ipcc
>            - qcom,sa8775p-ipcc
> +          - qcom,sar2130p-ipcc
>            - qcom,sc7280-ipcc
>            - qcom,sc8280xp-ipcc
>            - qcom,sdx75-ipcc
> 
> ---
> base-commit: 7df1e7189cecb6965ce672e820a5ec6cf499b65b
> change-id: 20241017-sar2130p-mbox-1ff72d8eb5c8
> 
> Best regards,
> -- 
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 

-- 
With best wishes
Dmitry

