Return-Path: <linux-arm-msm+bounces-37967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0481E9CDA12
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 08:52:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 76437B24609
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 07:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B151018BC2F;
	Fri, 15 Nov 2024 07:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cptDjmE/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF0218A6AF
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 07:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731657114; cv=none; b=km5+5J5L1qEaLsFn0ZyYeBVOsu48qOkVRBrXLKZDr9ly9JfxCW2lZc00oc8t2BYaTChVwvqZopGA7RaLbG47X6uGiuDQJZnVT2sVnD1a8+a3cvKKXhjBM95O146vRwteFhJOklz13JV0olCcsUMhsh/4sDeH4v5Gf/pdgmykWGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731657114; c=relaxed/simple;
	bh=2nCYfVUsaK0oWwdibzyqYCBP8hc/L0UKlkeyhaOyjPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qDxI1y/2GLnN7rHWuaXO2qLKhodJ9LPq+Ak9sBbPRTkMKYQS5enrbNs4b2NhB4Q2JMeC34WtnSL6mjCTzpWo16HyJqKrM4otUme50WOmbO8RV1YO67kX5vtFMEcL/E+CQK9Zr3nfWlD3GDyI2sr7FSDHkGjS+cB8BMfkjH2lgg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cptDjmE/; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-539f6e1f756so1443587e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2024 23:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731657111; x=1732261911; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S6uR4lmCvfAJMXeBWCQe7Avlz3fYotI9j6ue3VQ0LhA=;
        b=cptDjmE/iwan+zsRVmKvtSOtYIzh1HJzQkUYKBIFF7V70rA61oYc4YhNr4e5Kk04p/
         xRzuwJpeRZhjOUJly6aYVncmfjxhEqwcryxzWr+gwVY0UKFPCZqGvhs/BB7H2nunMllT
         WfyZsxagRaFsEUtb8QeJWF0r9Wz9Oe3nUFJaWvAc4UKHS01VtNe5Qe668W77x9hpffct
         GkI7U3igRBV3GTT1BQdaHcqfQ1lYT+n1eb5KGaUbgxDZtr1/FdksOsreZ6Yeb4GuwkSX
         aOYHaFdSZqNk/oq3t6vDXDxW6JCSDRmfUmd82uBBkfzwMtVsG99b7F8EYHURALHEUY60
         QuhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731657111; x=1732261911;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S6uR4lmCvfAJMXeBWCQe7Avlz3fYotI9j6ue3VQ0LhA=;
        b=P9z12meqdYdaAOFJSVu8Q51nP2f4+RAnSm0nfcofdl9WSU6qW1PT8oXyFnOmFM2dO3
         1YIhZPKMu+d3pCQUG6OUwvx1z2JqoMVTlqI+6zX/MS/DZ3Xxei4zs5MkL6N0Mhs4EVor
         TfvAPcRljrfzegvjBioY0vsApxJH1Vi0y57yq36HtsfB2FLA1xx4Zdo1TfsSfpUVlT94
         lVyZILsMHcxIgmqVC/jv7PtAe/bR3aZHI21bwh/frxpt7vdQcw7fE0HmslkAHR1bdCdK
         8PgBLm4VcjYH6ycrTf26D6woUqoWjhtIsAycys0BmU31tEgLyZ8HYKy+GQ/IMDkwWw91
         3nhw==
X-Gm-Message-State: AOJu0Yx1JKGwNSFX5beIJ7l35SM9qslohmMTESZY9wuHiRZJ8uvqmy6G
	s37m39sR7y+FSeOWAT59DrnbeMTprFFkwvwHfL+2D3/f3kG3OYgJmJCgvrwMdM8=
X-Google-Smtp-Source: AGHT+IHx4r8PoVffYMSAz6mfCWHjXqVCW3WZr8poXG0AFZMf8cQWXtIMW+eBeMRIXBHDvf9eGOH6rA==
X-Received: by 2002:a05:6512:3b1f:b0:539:f7ba:c982 with SMTP id 2adb3069b0e04-53dab2a8571mr764772e87.33.1731657110866;
        Thu, 14 Nov 2024 23:51:50 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53da65000f9sm470266e87.71.2024.11.14.23.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 23:51:49 -0800 (PST)
Date: Fri, 15 Nov 2024 09:51:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mailbox: qcom-ipcc: Add SAR2130P compatible
Message-ID: <ef5gdymsyeh32jvar6ee4jgjtue6xxnsbvn3ff5kkxfwvl75s5@pmfrcff2krch>
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

Jassi, the patch is trivial, is has been reviewed by the DT maintainers
almost a month ago, but it is still not a part of the -next.

We are past -rc7, so we should not expect new patches coming into the
for-next branches.  The mailbox/for-next tree has been updated 7 weeks
ago. Are there no pending patches for the mailbox tree?  It is expected
that the kernel tree is at least a bit tested before the trees get sent
for -rc1. I see that it is a typical cadence for your tree, the patches
get picked up after one of the last -rc releases. Can we help you
somehow in order to improve it?

Even putting the testing / conflicts / linux-next point of view aside,
being unsure until the last -rc whether the patch gets accepted or not
is not that nice from the developer's point of view.

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

