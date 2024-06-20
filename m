Return-Path: <linux-arm-msm+bounces-23359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2337E910583
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 15:11:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6AC4287A82
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 13:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81CC51AC794;
	Thu, 20 Jun 2024 13:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zzAZJoNe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C8A1AAE20
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 13:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718889088; cv=none; b=qhLkKid8W/taB87aOKiBdi4ZwDrUuX6A6Njfn/XtzMvfvUs744RTgoLAYQ/aCd+765b676qyOHy7PYU8FcGj0GkBcNeWY9qtSQ8iUG61U3LaQi2INcGaElbHQx2X5DehgLCPrForsmLlScU3AJY1CUn+BQY6CBVPr1Z6btmXBsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718889088; c=relaxed/simple;
	bh=DlmtTyVivKa8WpFyaEX4rN2Owu2HvKOCTudYzQC01zQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g9NEm1FMPyHY84RMOLv/VuqzYyj27y6ubAJepZtsQAYac4oOLKrQPqNQf4Y7/XTwHV5XKaCU5xatNo9gbj1cFd5Smk9+7Q6o16MOV/2liQinA1RZqx190apl8dSjxuNe3Mu9ylJY8bzUgpxA9CMhZaOXE8ZRWdJCnopNJDKKI3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zzAZJoNe; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5c1a6685cd5so376502eaf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 06:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718889086; x=1719493886; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dkN89mEfJ4LaMed4sDqwjURvDPEt2Ku3ETK3tWmbIyE=;
        b=zzAZJoNeXFDCVdaviynNJ5nUNKYk794T1GQ5kh5O7VVBKLPUpxYx6YIXIXsCbRZUSD
         FCT9mwyub+QqAVe+fFuEp52FR58quHbiKSgC/giiFNLhyY/GV/hAZFcWiW1B3pUxGkDK
         AulqxqqZMX1DDDRnh8LJc27GXwnzWdDupFvlIzI+FMyOuFm9NirTRgioRDPkWCOaIL22
         beEDf74sKZqbVn98MZ9lKrm2qaFh2ip8zo4hjmWBiU83V5fP7qOAiR4Ga1R2E0oqDCbP
         TQMsWi3EXnxFeEdPrMMnzYPjKuFie3g00g85VKKbwvrt/2oHh0K6Jit3n6yZc1KEDijs
         rXjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718889086; x=1719493886;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dkN89mEfJ4LaMed4sDqwjURvDPEt2Ku3ETK3tWmbIyE=;
        b=Uw2/je3UnOBASHz7nDIKbp5JH0byBJRSkuXoVkcGEyVCt/psggrHKCMCkTckhmNxvE
         EAfEqZVlh58JZ6A0J0pxdXHGwaH8mgd4xY1VljejJopS1/nGZR3/XG4LbncW+iRtbxiy
         fKGt9qjqlL2hiQWpLZHZXOM2jr4CENHQiWmPNmUP9qhS4Lx2m5T2oNq4Sg3Vs0HV5A+Z
         XgLIDMYn+h+hWF9ov46eATx6U7HuzKco6lFFYJ0oee2JClxvSifs7g+XWjFPYwNviBLp
         PL5ylCin7XoiW7vxuK3RPcfGVghLgKcYcvlaDwMl4vziAQ/UKAYVJK8c7BKTdSyzsm87
         eQHA==
X-Forwarded-Encrypted: i=1; AJvYcCW/0GDp7kY16taBP/phV3A4Lp8CjsIQnKg/nobBnl7ToAXoIKjc4oghenkA3yOriJOrb03bS9MkyNN1TdiHFb9AfKXj/suLrhjzrS5bWA==
X-Gm-Message-State: AOJu0YyovDoVWNTwXqif0ql+KhxKD9LdppLqyEPUybZwCTkLWh5QWeq1
	u2pgI+WvR+D2AwSly6ZO8LDgkM/Ayh3N4K+XtGUmZK2JBDhNERnZTRDxXNI3eWdDhZyp9BEOI3M
	opk89QioXhMDyjCmctwxukYtSJv4Kk1cITHopUA==
X-Google-Smtp-Source: AGHT+IGgARg7O7QrdP+7zlIhutKIhRRSz/CaCPjqMdOVRu01Gw0Fms2LWqwLcrTQllkhUJ6LOAOXjpsWMgOw7ZonGW0=
X-Received: by 2002:a05:6358:94a1:b0:19f:54a7:4f0b with SMTP id
 e5c5f4694b2df-1a1fd45b46amr596810155d.19.1718889086009; Thu, 20 Jun 2024
 06:11:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240619-rb2-fixes-v1-0-1d2b1d711969@linaro.org> <20240619-rb2-fixes-v1-1-1d2b1d711969@linaro.org>
In-Reply-To: <20240619-rb2-fixes-v1-1-1d2b1d711969@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 20 Jun 2024 16:11:15 +0300
Message-ID: <CAA8EJpoq3T=c1ZNfPMN5kjjTeat4G3vAyB5yf3YxUcEOAwc1Vg@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm6115: add iommu for sdhc_1
To: Caleb Connolly <caleb.connolly@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Jun 2024 at 23:33, Caleb Connolly <caleb.connolly@linaro.org> wrote:
>
> The first SDHC can do DMA like most other peripherals, add the missing
> iommus entry which is required to set this up.
>
> This may have been working on Linux before since the bootloader
> configures it and it may not be full torn down. But other software like
> U-Boot needs this to initialize the eMMC properly.
>
> Fixes: 97e563bf5ba1 ("arm64: dts: qcom: sm6115: Add basic soc dtsi")
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm6115.dtsi | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

