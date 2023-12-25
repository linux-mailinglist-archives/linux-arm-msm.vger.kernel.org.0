Return-Path: <linux-arm-msm+bounces-5963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A9181E206
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Dec 2023 19:37:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68F8C1F220A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Dec 2023 18:37:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1509E537F5;
	Mon, 25 Dec 2023 18:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kKBA7FUQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F291EB2C
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Dec 2023 18:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-781161d18ecso315028685a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Dec 2023 10:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703529416; x=1704134216; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rhuoQDM0PcQ1Hf0mmTK6WXCkbN9R/6E9/xIlxdvn19s=;
        b=kKBA7FUQaPGX6KlbzlOyg4i2+nwrWRKTnygk7QexAStGWqQeG5nCrxxd5grru9MWTo
         fObF5EJbNQVjmM3GIV8Vd5buSku+nl5lQJkFR2Xa3x4sYVkWKH8QcXTNbVbCfgpWiNbm
         bfEUgAZwY6egp+LWdcA8TTp4AzD7q2BQpTus0F0OtUdJT5/bZyWTR9W6NdPx6tXunKzj
         fmX1h/eVojq88H+fV2PuQHBVEPxCAGFqGaDoVN7L88MI4Q5rENyA9GYWPl+MfoGi/r7v
         FM98UDKcVsparyCGWNxdUpXMsrv026vtcd1SCo1QpuQVKxsgc+zSWDD0Ay5lYCuu2fD8
         MeIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703529416; x=1704134216;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rhuoQDM0PcQ1Hf0mmTK6WXCkbN9R/6E9/xIlxdvn19s=;
        b=KoTHbUy49Ahsf3xpB4Ta1j8S+siZqCkZcV5Yn/mUDMZf+u8Nx5kHONJu1cofDFErYJ
         gwLhRvEXzd1kL76xUfflOUy0B18gm6nJ5tmG6rV6lJ127i3/xU6sEqGJue9CNl3341xV
         Lk4cU0wfDE/nyNDWNJOrEYXb4saG59f4g3iaNfuco8uFfpHnzSmp+wQj1BxBl+iqxIJ2
         1IkrTXUUBjzB8gCMVwKdlJNDExffe9WdFRm9VUeUqCLOAj7L0nxr8c0/VSfpypoMZ9HJ
         Z9f1a/ZRReNS+sOM4oq2ZDOIwr95JGh798uYKdPKpbsGHEdSIz1Xr84gBa3hg8qHCtfi
         u3cg==
X-Gm-Message-State: AOJu0YwwOjCYYI76bLkdVAxoUyo7ybPfCo+ft7yqK+54IqX4pmvHhbsL
	bTRrfHjb9WpuiU/WSBCmwVxVzbewEYPqjUQi9pL0EWGPbwErjg==
X-Google-Smtp-Source: AGHT+IE8CS08JUcDq3WI+3+8WI11iUmJs6u/1qSNRmsQnNIvWnx6Y9KlEVMPs7h/FyiJgfivx9Js3Ldg5moOhBHrYkY=
X-Received: by 2002:ae9:c012:0:b0:77f:b722:50c4 with SMTP id
 u18-20020ae9c012000000b0077fb72250c4mr7269847qkk.83.1703529415782; Mon, 25
 Dec 2023 10:36:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231225120327.166160-1-davidwronek@gmail.com> <20231225120327.166160-6-davidwronek@gmail.com>
In-Reply-To: <20231225120327.166160-6-davidwronek@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 25 Dec 2023 20:36:44 +0200
Message-ID: <CAA8EJpq1QiWwJ1dk9xtaY=0pXr0y-QfoibXyX4SZR=YbxjRBVg@mail.gmail.com>
Subject: Re: [PATCH v3 5/8] phy: qcom: qmp-ufs: Add SC7180 support
To: David Wronek <davidwronek@gmail.com>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
	Joe Mason <buddyjojo06@outlook.com>, hexdump0815@googlemail.com, 
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-scsi@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 25 Dec 2023 at 14:05, David Wronek <davidwronek@gmail.com> wrote:
>
> The SC7180 UFS PHY is identical to the one found on SM7150. Add a
> compatible for it.
>
> Signed-off-by: David Wronek <davidwronek@gmail.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

