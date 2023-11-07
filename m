Return-Path: <linux-arm-msm+bounces-61-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7F27E3AED
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 12:17:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 371B61C20A48
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 11:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 052672D059;
	Tue,  7 Nov 2023 11:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dWqXvis+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6572D052
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 11:17:29 +0000 (UTC)
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D798DF
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 03:17:28 -0800 (PST)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-5b383b4184fso66377417b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Nov 2023 03:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699355847; x=1699960647; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UA3eKIbLDTi66ojZwbDxHVIuKSsgHZtrRSiuZGWoeyc=;
        b=dWqXvis+OwkoJT65+PJJWt+1Sow1vy5tTWvFEH++6nNf7fw8e08nDjvcf6CstovLuB
         cNSbBnQ4Gn1Dcwoa9E5VGTPQoEtUccyVHHpNqslET08dmI5ktdM7sy0pIF3irRRGBuBW
         uwOM7G9W5IwHgaD5yIGhiTo9y7/HGy9Gz6TDS3DG0xn+mZEqw9kt6ib1iTsB1QJ7Rd6T
         e9TjllZlTgX5Nypl+eOOoaP/L4ShgjBZNBERs1a+OlAI+O8TElZYCfuYuntVv9bK0FoT
         WbVhWVydVrDPfc6UL9Mr19UTuKKvELeugMJzq9Dnx3QVKFbgLCY8ulDjwCaVrDe5Jeqk
         awiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699355847; x=1699960647;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UA3eKIbLDTi66ojZwbDxHVIuKSsgHZtrRSiuZGWoeyc=;
        b=MkdUwhzN+PVp7fyQGdPhvODUQ2bXtqw9yVtV95dYycS94/SIW7aP4ac9D+ZWZZOPGp
         dl6UE2tSAl6WSjHQ1esfwvk0fzjX7DlliUpF+wjRQzeXkk9apDy39/BGt3KhNkkFpTYo
         0tuVfWhklwfUH67sAFsiaGL3OzxrjYOaXD00KVASbcOWoNOXcPw/w6SQJw3YsMnMS6QL
         sVKuXM4J33wkWdM/Ns7bMAvzYIe8RsZqOvvf5zUtBiqg2ywUAcjVHebupxXjHhR/+0HE
         qDXiqZg4BtujAYUqaL/rSyO4GL0tVb8hcHyWX7VIoYFdK9xT6Tkl4aK/mLWGdRf8ysfd
         UVjQ==
X-Gm-Message-State: AOJu0YysZaQnE0j+29C6G8S5mJi5NKFDNhpdr4RbHmXVR2RpRswzs0Wv
	tQJEF1tLkGYf2kp2sRxy9T/SSsXSRklxQbflzvA6Ow==
X-Google-Smtp-Source: AGHT+IHn3xKQPpJfw/yjLuHXdyOodKFRa5wwg/lTDhjEOxriRvZNoqLiIAWRsDO3lXJMhO5jwURzlpoFeGFv7Rl4xts=
X-Received: by 2002:a05:6902:18ce:b0:da0:4576:3689 with SMTP id
 ck14-20020a05690218ce00b00da045763689mr35368328ybb.25.1699355847423; Tue, 07
 Nov 2023 03:17:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231107103540.27353-1-krzysztof.kozlowski@linaro.org> <20231107103540.27353-3-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231107103540.27353-3-krzysztof.kozlowski@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 7 Nov 2023 13:17:15 +0200
Message-ID: <CAA8EJpq6=DbWHzYnhLb2=pnVivQEepcpJvdKgA6b7kYVpnY7Dg@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm8350: move DPU opp-table to its node
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Nov 2023 at 12:35, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> The Qualcomm MDSS bindings expect that DPU opp-table is defined within
> DPU node:
>
>   sm8350-hdk.dtb: display-subsystem@ae00000: Unevaluated properties are not allowed ('opp-table' was unexpected)
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8350.dtsi | 58 ++++++++++++++--------------
>  1 file changed, 29 insertions(+), 29 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

