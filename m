Return-Path: <linux-arm-msm+bounces-28532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D4095209C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 19:01:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D38461F26B49
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 17:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A8D11B14F9;
	Wed, 14 Aug 2024 17:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b9Luck5R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB92733D8
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2024 17:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723654857; cv=none; b=TDchrgDuc0/MC1XOw2OUz1BJw4X5phMrZHtaQAt4ZCRNj/KbciGaueXsEH2H+Iu5Z6oiC3woHhhx52SlrLBvqs6YQLVYj89DChlHSvcPb7tQ+nQXwnT/sb5z2mpBsIfZ0L7fgrNxhD1sfcJnMCrBrqSYTlhMKqtSMHALN3bmP0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723654857; c=relaxed/simple;
	bh=tMNKunLk5goW/y3VPPeJTH5gdtVob2YOFilXLryVWNQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OabL7sRRKJWstqCJTYiUhmRw7nPwpbhW2aCyanKGFXwVUPRmfkJcYV8+a5oQH16bee/79NRJXr6w9gnqRkXlYql8JPepuaFmuyOzz1m7e1s1KzCe63lgdiDmHiJzHcjy45FBKoC4a/aXCHNlQCTy5AT3siy2PU3njUqKzz3pmEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b9Luck5R; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6512866fa87so1427157b3.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2024 10:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723654854; x=1724259654; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tMNKunLk5goW/y3VPPeJTH5gdtVob2YOFilXLryVWNQ=;
        b=b9Luck5RziTh8umvRJBV0/E+N89tPC8wwd+54j+PDPLcNtf5JPYUS/70lMh3DAN9IP
         gx3THKW/znXwd65L+R7MkkYra7f2LZaIhWZUgnT5jC6lPLmGhDBL5hcrsSvkyZulNO0H
         DVkyARHjy0qCk7AGeFuYKwUG8UJ2VzhQtO+MLeie/rTPZ6uvjSeo1YDGDWu/N/AewJ0G
         jWHLVX9rdSN2UUiAkRNAlRnV3/azOrLQotqn5PoFZbvwwRI8ZK9YYQbXR6djL9mPENnj
         nHNMLACmaBaMhZWKDXA89pUbptIAmD4NhH/h8/7oHhICvYK348MV51hcL8SolRbHH2OA
         FPQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723654854; x=1724259654;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tMNKunLk5goW/y3VPPeJTH5gdtVob2YOFilXLryVWNQ=;
        b=M6PGLN7sev/H37fa17vey1+pICVII5GqjlttquFJySYlzP7mUZw8owIzT9wYRZIcxa
         iwAYOI8kogaWZLpz6lKfQsSgPdf4cgO/T2A5Paw33bZ7TddCPp1xoSJQWPBDqUjk7V9c
         SYoJFlJLviEFXkWxspZP5Kyc1qUTCCxEI/PNeQQ/GQur7NZiCMf7lh4I58wmL/ddbPZN
         Xw3hCTn5EWihvYH/2Z5pdmAjakyzdMfq9U8MlXLLQvfZhBmanIAjgTCitAWF3+reKWPk
         k76ISaLXq9KYEK2+rlZW7sMYOIKOXYBCsxidZcr2frjGGvwAsujWKorYX1w0jW1l+Yby
         1SQA==
X-Forwarded-Encrypted: i=1; AJvYcCXLEPb8atC/axAqkZXf00QCyGFoduG/OgH46OGLDGJuEcjwrQVfq9A9T9G9Y1jBSKluvN/fCYQYjXMzMO8iNgs41CjXKMOlcVnE8gkoog==
X-Gm-Message-State: AOJu0YxyC2sz2rnGWdifeiBoEQVoldK+Hq/MdeG5FoiAmkPPSnUO7T3E
	LrFjqV5EmxsMCmmJhMs8NIt3N3xRt8eyzm1XJbqL7G4Mr4MgozoSBAfDhO49Vn63VkiRZyR0SrX
	2a4x8EcAeW4jI4yJiQrM0IAcvyybxoNJdXELJpg==
X-Google-Smtp-Source: AGHT+IFOk3VYqWbTKciKOosTCRuiEV6h3yG1e9kqTFin1Q7BiOL3QiVjeZp7p4oYQKYKWFnzBhvwTS75twwWuDvHaNo=
X-Received: by 2002:a05:690c:3103:b0:62f:67b4:790c with SMTP id
 00721157ae682-6ac97b10984mr33941527b3.14.1723654854591; Wed, 14 Aug 2024
 10:00:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240813190639.154983-1-brgl@bgdev.pl> <172365034673.2714461.1759726822181293291.robh@kernel.org>
In-Reply-To: <172365034673.2714461.1759726822181293291.robh@kernel.org>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Wed, 14 Aug 2024 19:00:41 +0200
Message-ID: <CACMJSesrLxbgSFBOtdNsvkYv+3ytNPrws6h_DM+xFmjiw3yUzQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] arm64: dts: qcom: sc8280xp: enable WLAN and Bluetooth
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Aug 2024 at 17:48, Rob Herring (Arm) <robh@kernel.org> wrote:
>
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
>
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
>

Bindings were sent separately.

Bart

