Return-Path: <linux-arm-msm+bounces-17813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D33AC8A96F0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Apr 2024 12:03:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 730AE1F22E26
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Apr 2024 10:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C9F615B57C;
	Thu, 18 Apr 2024 10:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="32zD3y44"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB9D15B544
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Apr 2024 10:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713434597; cv=none; b=hQWsn+8dfNbELQ37w83cYThiMJfqyviubLzYxnrruPE5fAPUv+iPmd3oR0eTSSTik0/roMWJ75cT7IUkNazNZo7hUFnmLgnWWysjA2e9+f8K1g6gPHdQ9Wl/Auk7W4kHfg+2a4OOPvsiNr/1LJjM1X8viTM57ck1kBbM5wfeF54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713434597; c=relaxed/simple;
	bh=zwzkYWr6U9C4zC2JlX3QMDroH3epi3ZSlaJuC9jmIvY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=g3cEm/QGDniTTAKI3+ELYuoMr/f/O1LQK3tP0nYQ2rMuoHZnkiELqS2FOLq1TPUzad7Kt76240Qnohau8ot7AoJzNkKSSLn3b3oHPwM5/BsDnSFhZKZDsGYe/FI5+Syefzec68UBXiyxJMSc4Fb/yDBtq/+b3EkCd/WUNl/rmMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=32zD3y44; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a5561b88bb3so63445266b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Apr 2024 03:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1713434592; x=1714039392; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zwzkYWr6U9C4zC2JlX3QMDroH3epi3ZSlaJuC9jmIvY=;
        b=32zD3y44hHaLIYej5hYS32GufwYGYRibPGW7H1540N4sCnx1Ra2aQ48QyYnbP/Rtkn
         5LYrRWqRx4iqonM4En5tqQcLAdoaf+DywCMtNDgT07hPKKMY88DG0/1JovWPbJtLMwN3
         6Q7it91+9KwtCPvpbDJKJ6UVUEdt211xAL2lxBBRVdI5AVxZD3Elx+2JNJiUOmhX/Flv
         rmCCk8IttwWC70m9fJqMg5+f9p7fap040O8SJzDidRqbsvOFSl6s6/VKUhbkduwFJZjo
         UFiagZ5L6S+F8R3QiitcE8gYdRxNB/VeRTPrKE28a53pAUXiRHDnWTMCsx+6RHPjBlQu
         AIuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713434592; x=1714039392;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zwzkYWr6U9C4zC2JlX3QMDroH3epi3ZSlaJuC9jmIvY=;
        b=mXIFTbj7eZqZvm9bGZnOTWnIoKzf9vvZedx/C+OHgrmuX3E+67nXqJqdGJCpCiwcFE
         El3qrhM9F6HYujyzC0ufjDuIG/Whayubsb9Uw0DyrWLu1e1L4ZeOZP3938YtXipIQ+zV
         faI51OBLzatGEIB9yUTKI7hBI0U/jgf//inXzO1H63w+cDjgARah7kj55aW1im2iMML1
         zJgawzn/w3ONYQ5lplr8ZphhSSiZz9jvUpkOe8cfwWsQGokNCmzVFt+7GPUY2xufXu3B
         QEpIHDJ389j+CBfN1ixyBjFqyM4s/CkmsnPF0NZ8D4bgV2lU93tPEOqJdjl+rIa7qHVE
         Qvxw==
X-Forwarded-Encrypted: i=1; AJvYcCX0sh9SOY9UTSvJcPw7DhpbgE6WDOKycYCNKaw8H3TRui53Mep6c5z+mIiokFnK4qiS0+s0L09bVnyvcK3DInLMLZ7mJgQzUIHT08unVw==
X-Gm-Message-State: AOJu0Yz76LtXSEna6NNFF9PIPKu7DRMIRRFfcpwbAJ4yOpQ3CJB/aEHK
	MD8I0YTvZhEZGkr85AL0UE8RdUUVXgeTjLZj1EDA/6q7Fq+LHIbgIZtUz8jyszk=
X-Google-Smtp-Source: AGHT+IFwCe4772YEoD9aT9S4d9KsRvOdenXKwAQfIEqOG8jB0+onHAzI0XgYqm54xb5CuulaaJho7w==
X-Received: by 2002:a17:906:6857:b0:a51:dd18:bd20 with SMTP id a23-20020a170906685700b00a51dd18bd20mr1763260ejs.14.1713434592068;
        Thu, 18 Apr 2024 03:03:12 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id gh16-20020a170906e09000b00a5180d5b31asm672634ejb.32.2024.04.18.03.03.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Apr 2024 03:03:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Apr 2024 12:03:10 +0200
Message-Id: <D0N5VCESMRIX.3MY64A0MXKJGW@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: pmi632: Add vibrator
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@linaro.org>, "Bjorn Andersson"
 <andersson@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Fenglin Wu" <quic_fenglinw@quicinc.com>
X-Mailer: aerc 0.17.0
References: <20240418-fp3-vibra-v1-0-b636b8b3ff32@fairphone.com>
 <20240418-fp3-vibra-v1-1-b636b8b3ff32@fairphone.com>
 <c1763d69-f0a4-4415-be7a-31b04153fbfb@linaro.org>
In-Reply-To: <c1763d69-f0a4-4415-be7a-31b04153fbfb@linaro.org>

On Thu Apr 18, 2024 at 12:01 PM CEST, Konrad Dybcio wrote:
> On 18.04.2024 8:36 AM, Luca Weiss wrote:
> > Add a node for the vibrator module found inside the PMI632.
> >=20
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > ---
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>
> On a side note, this is a totally configuration-free peripheral that does=
n't do
> anything crazy until manually configured.
>
> In the slow quest to be (hopefully) more sane about the defaults, should =
we keep
> them enabled by default? Bjorn?

But many (most?) devices don't have a vibration motor connected to
PMI632, some (like devboards) don't have anything, and other phones have
a separate chip that controls the vibration motor.

Enabling this by default would mean all devices with PMI632 would get an
input device for the vibrator that probably doesn't work?

Regards
Luca

>
> Konrad


