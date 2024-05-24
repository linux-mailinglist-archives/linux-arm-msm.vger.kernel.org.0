Return-Path: <linux-arm-msm+bounces-20432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9237D8CED12
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 01:58:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C00B11C21017
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 23:58:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A5ED158868;
	Fri, 24 May 2024 23:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p+y8mWU8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F271292E4
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 May 2024 23:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716595089; cv=none; b=m3p8jjhupM9/+/Wr3CvoOfKJGfC+XbUdHM5sbUhozlvVdgoV159DBAqBtiJ7oRoxd+Q9s9q/0L+68+FGs8Zxx8tRAcw/vH602iFP+nqTFC2Yarf+lN2S6o+N+uKMYC4eLQPTHh3OTPOx43IkfzBHjRgeUhhYOupSP84WLAqGxt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716595089; c=relaxed/simple;
	bh=5HWALiAhaCDCuhggJpKqNMVshgA5pqPi/lZqDpUtKEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HQu0+NWA2ZCbesBtl/mfQfMhLFf1DQ1Y9/W+dNolpHtQ3Mc2mLf9fWgPihAacnvHik6SNfin/aASggm4gybdA7dT2O6S8pyHYh02Fu32T4GtyKKOOtPMjDKR6eYHGCmkQXyQWXAv1pai3BYjr3bEkgkTRDB/IXJwjoBuE36pFMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p+y8mWU8; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-df771983aedso1407004276.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 May 2024 16:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716595086; x=1717199886; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lYOz+vokpIWadzXcAS8j7jOefrZIjKXgl4pHBz5Rm8k=;
        b=p+y8mWU8AyG4rdpCWOemQz8S3S3hdJuKLR258P9hW1DoLEeFUCfXpkgFpDZ9WcqNTA
         DWWMJishvuyDURpsIU12CQfkhGuD5pPbsJUqJsfYk0M2d9wLynwquIJLc14QQvu+GQbJ
         MYWlDdaRixJ8egmkW9vhIaDBG0gU1dcKmjkNli0QP+OdYszyethxSF6WiyWt9q5Ics0n
         a7UB0fe2S74YgcNMpTAMfenn7BMH6cNjVvgFd0kU3jFQt0RjImo8kY43m117ZrcFPjnh
         KrPNujEHcqd7itPGahBDN00BhRvqWKFrpnnamFiHicouN2txLhDdsyDARyByIjqm3xK7
         8Mgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716595086; x=1717199886;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lYOz+vokpIWadzXcAS8j7jOefrZIjKXgl4pHBz5Rm8k=;
        b=sJ7DSEkfkyyN6VKlo3l/+YQSJtVnrV7zBz8/Y3LOEZV5O05f/K+Dagl+7Szb6dTN9O
         3bMiDpfwbof4v19L38v7aNZUPKo+Prb0gjMtVnmy+u9dL+7R97UxRR0aMaLJKZe1LaBd
         z7CEWxbrrpE8owY8mYKz1ATlIyqVF2zbIQjq5wFVLHmkQH/U+5JEqaIB/48+E4o9fgOE
         2W2Fdl1t12DvqFgt4i4ZE+2pcPUGbMaVWuC/SrfgJukBjpFV9b/CTp5FWTclIwB2nukm
         rHkUK8ysReJCGWIBSJZ4bo0wRJqRwiVeaeOK5ZxMiHbYdKR0mZDHmvhf7xWRL2AMZ3pB
         08/A==
X-Forwarded-Encrypted: i=1; AJvYcCU+TfKPW4Bvd6TUF5RMd6Vjg3IbG/YvjUQTWCSQ2WwNZcbz9yTqIBXQsegg/BLsWC1YCxfCZBGRS39TQxjgmpirsKsY9XVay+mHAedi3g==
X-Gm-Message-State: AOJu0YzNXtBekRfEn32zaOHHhCHII3hyn1H9Rsk68iYepAHHEu5H2Pfy
	osaXY5+wp5wv5bSmauAm+uwtFH3Y8RDJavs6Phuna5kWoVj+kFalXQJvr7gp1zUKpm/QDrbXL4V
	Gn4wLEKUIpgjTICdxZ7lEIM9aDOfqJaeH5Cy56Q==
X-Google-Smtp-Source: AGHT+IEJt5x0q5D99PlS3haolbnYsTanUnYvkV1dN3ctg99GZL50AMveqq1Zym0GFXzBiMKrzHfIb1NU2+LbiK/QvE0=
X-Received: by 2002:a25:8244:0:b0:df1:cd00:b176 with SMTP id
 3f1490d57ef6-df7721e223fmr3820423276.39.1716595086043; Fri, 24 May 2024
 16:58:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240525-topic-pmc8380_gpio-v2-0-2de50cb28ac1@linaro.org> <20240525-topic-pmc8380_gpio-v2-2-2de50cb28ac1@linaro.org>
In-Reply-To: <20240525-topic-pmc8380_gpio-v2-2-2de50cb28ac1@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 25 May 2024 02:57:55 +0300
Message-ID: <CAA8EJpqm3O-2ErRRuPpc-g1o9uPkWz2vBxXtVBUhHb2k_X6jww@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: spmi: Add PMC8380
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 25 May 2024 at 02:38, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> PMC8380 is a new chip, featuring 10 GPIOs. Describe it.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

