Return-Path: <linux-arm-msm+bounces-23360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A87CC91059A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 15:15:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1195FB219A3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 13:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6E3C1E4A0;
	Thu, 20 Jun 2024 13:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jtvq/OrQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648C11E493
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 13:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718889317; cv=none; b=GxLYQs1620GLNvWHBhzkhrw3RKkQCGhQVBmGsmDTeYqN//C18HHjANcOW7ijOjvGtcVChvDUkATPx9NXk9tYR9jtpGs8lzK8dmawg5e9fd9dXviHhsH+4ZpKw3DG5BZTmUYHMyBOD3KX3UsDfdGqGQIhTXHEKWInSSnK2t6g78g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718889317; c=relaxed/simple;
	bh=kBLzfspHe7hKHDfbBHbG8TW9qCmp7NiEtdiB3iW7K9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=quhre4d91+c3rPJXxq1e49b3PHroZORECAuWv6lgG+ThLNzRE7LHo1CYWKQPNGXt/xxo6RTDfBpz3h1tadN4XBeAGOINC7aAV6uX7zxsGD6ZS77kpnA+cxHXI9JaA4e959nTvE57iG3F2UNchyRc76ewS7uIQGSmNqmjayhtZ2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jtvq/OrQ; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-632843cff4fso8103277b3.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 06:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718889315; x=1719494115; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CkSFRwhot+Q+s4R6yyDj4mTZYzkLcyxsGikvlN6BeU0=;
        b=Jtvq/OrQrOUF7Cv0JzvV6d9BN0Rudj8Rylfq5CB5jAd8u+YetnMGVjIXEP8oNUxxEr
         T3Tu5xxrqSowg3UT4zPbAvzpcPZ2PTaQNlC9Cv/4RYxcpPELrv3hMF50IQ5DhxW5+hFT
         lQnallWqddrXA3xpvlKhDlYLIbQefIwjpELes5zT68vcYaJPzBn59+q86mCADPYDcpoO
         QxZehRciIHdZvoWaIPd0hDZbmxrrbUosPdbdQBIgS15LmDQYDklvJj9C4Cgpaze3D/yO
         RMtvxH5G3LZrnbAg6aJB4mzMTki4Rt85fv6tlZxiq3ZOxlw4ClerJl1HdlijLaT+5ItT
         ilGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718889315; x=1719494115;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CkSFRwhot+Q+s4R6yyDj4mTZYzkLcyxsGikvlN6BeU0=;
        b=W6Sgt3/Xi2cFQvF8BEkAym0GmIIyrJ6X/MldYs+hIoybLCB97u74dYDC3mHgHbnDEX
         4zHULVXyudFzsGaM1j+Ljhzy5w1gUPr4uGQE+VKldTzl5Y/uoxeRtb5jlhRXD1RkmKJ4
         6h5tm7uotuXdGQdw+xSviUwGvnSAPtM/CDNkjYVnAdyIwC+urif0zOPcWaUJx6C3OHMi
         y74tk/fP8obIKtvk5p3ENFpDKw+rrXgB1yEY0UMxBDMgR7MJ1NPGOdkcj9pZbRraCjwh
         Z9RIQTZ63+7Qu8MnhgWAh83QuvI2+griHmgs0pXUShJO33ZPn9G+bdOyR8n7J1SM2UmQ
         jdyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKQRGco8oiwElbg9Ark9hcy4SKr0eflCZWWOrmTv5BPGDd7PQuaP4UhNTiZXUR5MYjXM15wklksnEc/h7VRLIq9XpOq9BTLGmt+geSgA==
X-Gm-Message-State: AOJu0YwZTOzidWoAGZCMIm2xjAc+gFyvgw15nQkecnSrc12Qcd+YEvh6
	w88fPzQ3M66fqYSEvZQqL0lwdks1U6vWqu/eBtyPKOA1dLE0wYaSuMVUOU5v5Hc7K5OMUzd4x3V
	qcfv05hhz5CLn22ZN1aS/l3pQrf9RlHb6kL6E4Q==
X-Google-Smtp-Source: AGHT+IGlaxOg+qhS8w/dfjzjflLigb7w15n22/6LqN/Z3zeD60eqK5Mqhbk9OZg4Q56aWj4Uad7s4AzBlrZsGGf1e7Q=
X-Received: by 2002:a81:e249:0:b0:62c:f6c6:d5fc with SMTP id
 00721157ae682-63a8e6af304mr51597497b3.26.1718889314811; Thu, 20 Jun 2024
 06:15:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240619-rb2-fixes-v1-0-1d2b1d711969@linaro.org> <20240619-rb2-fixes-v1-2-1d2b1d711969@linaro.org>
In-Reply-To: <20240619-rb2-fixes-v1-2-1d2b1d711969@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 20 Jun 2024 16:15:04 +0300
Message-ID: <CAA8EJpo94qg0dDR-H64v0yC7jLKHuD9O59m3hG2tNR4v3NAkLA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qrb4210-rb2: set role-switch-default-mode
To: Caleb Connolly <caleb.connolly@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Jun 2024 at 23:33, Caleb Connolly <caleb.connolly@linaro.org> wrote:
>
> Give a hint to the OS which role we prefer. Host mode generally makes
> the most sense.

Why?

>
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 4 ++++
>  1 file changed, 4 insertions(+)

Would it make sense to set this for all the RB and HDK boards?

-- 
With best wishes
Dmitry

