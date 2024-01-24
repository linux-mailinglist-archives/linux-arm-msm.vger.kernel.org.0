Return-Path: <linux-arm-msm+bounces-8050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E1183A01A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 04:33:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47D9C1C217CF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 03:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0935A1381;
	Wed, 24 Jan 2024 03:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n0VlnnG8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DB2BE69
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jan 2024 03:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706067213; cv=none; b=kTvCU18OpobECkQbAzR2ShjSwc/1jI8HB07O0LBN8Hc5s0hQIPhcdtt142lRl4ZSuHnjBu6eg0Fc2twV6HZ+K013zL4oi7rn5O5A6758lVd54BzCN8f0EDmnwmiDcMAeODrfnffR1r1qZ0NgOR17OeVBD6enEmIQWlpBYgddyV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706067213; c=relaxed/simple;
	bh=g/m+1nEdRXifGhS61lWzGasqSDIMLxiCVv+HkeeLgRM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pB5MIpV8F7WopPuO6cDJ7jytHBFckTSyullHA6l0MGXp31zD3dr7B+twXDmAPHZ1J4dHOSyZH2ZKUe/91dvrob7+eCxHteC7PN+80cu5vUvvYDSgrYnRurTi5tT+b4qtOCDo6NI+dtUsXVXN4u4PdY7yC7dE1QD2I3ucjXaJaes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n0VlnnG8; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dbedb1ee3e4so4714963276.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 19:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706067211; x=1706672011; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Wc0A1k/7YMLXea6xhKdK2KO1S9xlAAnHvAkEcbtMgWs=;
        b=n0VlnnG8xyfBICSrONnDAyzUUajrGXC4jC22lOzyOTLNHdq5P0VXI6175S43sslCLg
         8RN0Ihors804nU+ll0I+IT7W3s/EI3KpxBQignyp0ufPsDKvrRAJ1+ogi+ZzCKQYr6TA
         NN01/WvoGjP/iRorH36PldRQgCgybURAst885YBQ+cZRilbBYH+iCE2IlHKHfpHhFslx
         oljfdtcFcHS31njJr0PHRvgi/NyQHuk8FlBq2CnEJ6EzLCq9CCKeyW+JXDIuIXwsxZ0l
         Nbf21c4dxjFih0mG6x7rOsz+DdQZffMbetIjYn53YUI+90q5FUij16UkFCkeliPP9bH+
         tPJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706067211; x=1706672011;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wc0A1k/7YMLXea6xhKdK2KO1S9xlAAnHvAkEcbtMgWs=;
        b=H0JwBuclWwZUjJDmNIW6Fb4kFMkhBfCZozFFMga5QGv2bjTYWlDNWwdWCPwbEKibCl
         +KLk7NDsweLaGvbG7I1149gjHeU822Ixl06WAa/0kzOwQQs8j9nTzTkTDZ01Ua7Dyy8S
         YIoPstqIYXdPSxqkwEfK9/wyQUm53hhOtMZUSR5W+LIORxA8bTXcb5hvt4MA2aEmqrUZ
         +eKSDgEEyg5mIKJNZxrKQ6WGlNsTjg1eWxWPkp+te0CU8gDQr4lW9dsNWe6fX8hdI3mF
         WpwCEy31DDsqJAznq2JoZckibhSM4UTTKMDPYYOCrqECus3rjmo6IzWXu1KjCc4XGJUz
         u9Tw==
X-Gm-Message-State: AOJu0Yxfyu0Goh+v15LHg7rqLORC3miu9VuvdPDdpo1kFMZzCdl3KCwV
	1+cfMXZ9Y1mUMquWfy3emvhpyXZllifJk53eZtuWVc6zX4jf0b15HwEhT4JwHjiEddgipPZZ2sa
	RBywCM9zAtUqZmjhUFAT75RDc5ukU1Pv0cX2RVg==
X-Google-Smtp-Source: AGHT+IGdWzzO4xfUM06uANHv4YCY0KTFoCAf9r4oksDWnT70n9BD76/RrW4NMEBu4iEGHildUvFcJdMdvfNw9DZ7Slw=
X-Received: by 2002:a25:6b06:0:b0:dc2:466a:23bd with SMTP id
 g6-20020a256b06000000b00dc2466a23bdmr146538ybc.54.1706067211398; Tue, 23 Jan
 2024 19:33:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240124023305.15755-1-quic_tengfan@quicinc.com> <20240124023305.15755-2-quic_tengfan@quicinc.com>
In-Reply-To: <20240124023305.15755-2-quic_tengfan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 24 Jan 2024 05:33:20 +0200
Message-ID: <CAA8EJpqkDcqjn-8HrK7=rRe49ycDY6fbNDCKKQOeUpa_EDjFtw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: modify the wrong
 compatible name
To: Tengfei Fan <quic_tengfan@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, linus.walleij@linaro.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Jan 2024 at 04:33, Tengfei Fan <quic_tengfan@quicinc.com> wrote:
>
> Use right compatible name "qcom,sm4450-tlmm" instead of
> "qcom,sm4450-pinctrl".
>
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,sm4450-tlmm.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm4450-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm4450-tlmm.yaml
> index bb08ca5a1509..bb675c8ec220 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,sm4450-tlmm.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm4450-tlmm.yaml
> @@ -17,7 +17,7 @@ allOf:
>
>  properties:
>    compatible:
> -    const: qcom,sm4450-pinctrl
> +    const: qcom,sm4450-tlmm

Fixes: 7bf8b78f86db ("dt-bindings: pinctrl: qcom: Add SM4450 pinctrl")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


>
>    reg:
>      maxItems: 1
> --
> 2.17.1
>
>


--
With best wishes
Dmitry

