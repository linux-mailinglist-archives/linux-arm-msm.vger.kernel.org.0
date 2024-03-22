Return-Path: <linux-arm-msm+bounces-14812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 823BB886A93
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 11:42:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 395E31F22500
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 10:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95DC93CF79;
	Fri, 22 Mar 2024 10:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D+YL2wp5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3063B2BF
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 10:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711104116; cv=none; b=d81E+pEgc9BBtKFkUD7b2fGm32DaHnJg1msWVtyLoI2lMkDrvYzg0uzDiAC3Y3tlZD/dt011hJwMMcyIt8RmsPRekaPfMXU1z3OquQ0W3cOtD+BQ947YADRSNwKkXz64+vgr2gbRp89wKapB+o2o3CTIBBARwBkuk+aDgZ3O9rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711104116; c=relaxed/simple;
	bh=XgOxXIIS8s1afwdjn0g6jOtbTTYtoWP3qkygqGIn09c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RBhOfrAzBXEcHNorbBrVq6EVy+/bSv52qogeXsF4uLP4HizllVAbKIGZVoQAvGcKjY9NM4mupbETAJq5kA7mRvRwLuXuxFi83G+RMl6fYz34iIUDm22RHacqYHvLu4pUEw/RjFy6y2JwWLd3cOzb9LkU34uu+iT/QkfoS+8PJ7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D+YL2wp5; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dbed0710c74so1689942276.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 03:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711104114; x=1711708914; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qJ1G2x/oaXXsE8SC8MGGRjcMdOfVG6tRQLbgz1tdtwI=;
        b=D+YL2wp5o60PTdT3GxATJnMcNpa5PGJUE8+YO8wXIv9yZVB0IF1bT7GYcPCQowvawX
         CYNOohq4R24rBTligYNCBxqGQDX4d2kHL0OiZYw62YbRXgvqALGYpszO4Q4owYIZCK/a
         mtnbOMarWZ7I87fTEEIj4e0B6PRlJHnbuyM6eRpHkWzyUwF0+d7u+puTjDq2xbqYMMM4
         /wSIwNqZcUWZAYQync7rOvFQ/nJQCLBjQ31IOCoGdueCm1fUrWv8N/uphKFru88NBVlo
         3RXrE/uri8Sa93ZLlQWifL00R6c6fop2YG6fx8W96LQIEC5m6Q9jMUTA4pioDcq5iage
         /xFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711104114; x=1711708914;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qJ1G2x/oaXXsE8SC8MGGRjcMdOfVG6tRQLbgz1tdtwI=;
        b=l6D5wvl8ihTQpVsxlspAInIeqOLnSyfzgd7v/0JzDT2mIsQpT8tybq3ig4V3qiiPeO
         QM/bA4ou0P1DeN49FezjQt/vyLcCSbkgKvGkLyPilF9JibUcnFOwFL24s9EwpZNGTRbe
         /XtcAS098YfxksZHgH+QfRno+KwmAI8WM9+ZIPJ2Y4Dm35V+jYWu3NC85dItXlLoJtcm
         UrnV1foOrw7hxoHJ0jEMfHBOMjAMhxIP2z/U4zhlbNWXYqACJMJEr62fAzjr5Uhqbl7P
         v6KwpHdqQa9qn3fSZksN+EvMuqGfn3fGF9sxAIbjrYH+JqqVEPqzhm5uFN2rNmZVCwQx
         UjOg==
X-Forwarded-Encrypted: i=1; AJvYcCW8pTCH7guxuOLQq4eXtwJa3lYsTgCkDi2duhIYvBfWxdOed7R3iDETBVkXIHPcY8p0pRzinqDdJR8H8aBuwy2go+vnV3vboxzUskL1tA==
X-Gm-Message-State: AOJu0YyGUJOBcp///yRHiYD1RTIKO4hKDG6uNsZLl9uCPKx4+grWnVOU
	MpuPGGLTtzmauXNSDF7xg3UmBS6pa4f1AY/GmdHT5Gj88kj9XubnJeSlrOVXy69Rz8V6wL99mVW
	przlgrgD+PGmU7GJ7uk1qU0/pThvRsdkcKKi4Vw==
X-Google-Smtp-Source: AGHT+IF+DVq3nhDm54jpxuWlZ1AandcnO6fyhOF34a+zdn1HBb50LNm0GahsR5m0NoIZpPjbkOLpfMdQkKElsW4T2Ns=
X-Received: by 2002:a25:b118:0:b0:dc6:d22e:ef4c with SMTP id
 g24-20020a25b118000000b00dc6d22eef4cmr1726459ybj.17.1711104114082; Fri, 22
 Mar 2024 03:41:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240322-topic-sm8x50-upstream-pcie-1-phy-aux-clk-v2-0-3ec0a966d52f@linaro.org>
 <20240322-topic-sm8x50-upstream-pcie-1-phy-aux-clk-v2-4-3ec0a966d52f@linaro.org>
In-Reply-To: <20240322-topic-sm8x50-upstream-pcie-1-phy-aux-clk-v2-4-3ec0a966d52f@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Mar 2024 12:41:42 +0200
Message-ID: <CAA8EJpoY6V=g2TpP0goj_96Yhg3Hdo+T3iDL-fK2WZCuZW62aA@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] phy: qcom: qmp-pcie: register PHY AUX clock for
 SM8[456]50 4x2 PCIe PHY
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 22 Mar 2024 at 11:42, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> The PCIe Gen4x2 PHY found in the SM8[456]50 SoCs have a second clock,
> enable this second clock by setting the proper 20MHz hardware rate in
> the Gen4x2 SM8[456]50 aux_clock_rate config fields.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 9 +++++++++
>  1 file changed, 9 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

