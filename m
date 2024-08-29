Return-Path: <linux-arm-msm+bounces-30061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0789964BCB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 18:37:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2ECD61C22291
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 16:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A61B51922DE;
	Thu, 29 Aug 2024 16:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ABQ+Bhok"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F2EEAD5
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 16:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724949453; cv=none; b=Y8uU0hZ8HR5RcjGuouKR8w5sQwZVqOsAzqVvYVxGuv+qIQnw/mR9qFjY1PLq9nC1CmAs6OrtsEMUtqSWOWhQYNbo7X25Suuj50ZuEqFVK3UcoQj/xuJDC75A6XmOQZG/xMhOHlxeF+24bfDH3aueuy2S8v+cpqPBRMa/R5zp1Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724949453; c=relaxed/simple;
	bh=uhL9/HB1FjhDeN0xe90P+EZykmLRNXJXLdcJvYAldvc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L6xQ6wkM6/ic+LNASC+QNKl//XZHRP3z1H9BcxRUU1vB1HWtgXnDodF0xuqklhVGxyGg7yp/MEqppkUBdysNpgc0n4/7x6YcXUUcOTK48N/dYhWkdDM1hOzfAFgPcBYe0WHRIPSeKoYZOkGcZ9bsuqzD32sCOBZN7GikcRrzDWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ABQ+Bhok; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5bec87ececeso1002732a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 09:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724949450; x=1725554250; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DOaqirJ+YqAwQEHiFUcwLd9wSONgEqokFkF8Yi7+TsI=;
        b=ABQ+BhokFHqA8Vq/zHqj1wseudrY1ycrquuqji6Tj5t2pdL4QErkXH15EaMAi1BPgc
         bU7284MXgJC7Y2JaRVbWRdW2iwyBE+QaLoZ1x0OXGKN9+BgPZ6wQDi28y65LmRQp4gi7
         6YicSJu965KCBYl+JIOlnl2QVOFrVs3F0tG+AYBZa1+qddvP09gQsnc1K7TbxruQd1/9
         b0EXe75U/B+PCDBd7tR6iOexPtC7YBS3u3FJ+KmM2RJaMiTWsfeS2UgtGfPvQ3EYTIUQ
         TxnmED9Slt+He0tkH90jL+GcGdQ1MB7+KGaWxCeLm3Mu7hQtwaXOkgrezWX4nqa0iJSl
         o73g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724949450; x=1725554250;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DOaqirJ+YqAwQEHiFUcwLd9wSONgEqokFkF8Yi7+TsI=;
        b=R0aiM0/xhWdRGVSHWaM4xyO1YEzZR6xGcq6IYW0LZ8jDVkoEBxUmMHJJ4wOBI9ikbn
         wsV0XOULXgV1y9oWv/0I7iZjMYQvHeVeExotxKRzBah2fMmmLsWmggnmzmRvqU0hXHPm
         fbqwSWspBREvhmSmvrbI6pow9p0MyCFosdONIMmAoooy70HKi1GqxK0lt0UqBGcqxu9c
         7YeWONtFHoL7Irq9P5E2BODFw4sR2/C0lN+Hm5x5r8CLGWXr8m2JSbFmEktDlO48UYQU
         RKfXR/VFLLJCVstJqVZ7wBJadU888CSSopsSl3EkyzG1JZXJ5QNE6efrmBSc5HMjn2l2
         hbpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTm+F+3ptJBGJV/wFKCnpRO1MN3EoEb9XVAhYeV5/dXGQPtG2o6i5K2s4yipys8XXWl3oGoMmUrOT7VMt3@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8Kfy5aFc6fSkr/72TgTgJ6SmQ6f1APN1JFzCYaq/BLBwp0z8p
	UC5sN2kd7tLP9XdogalDb/wJ+Tv4VvE9JBfEagVa09O3Qeh/8BAF82Qp27Ip
X-Google-Smtp-Source: AGHT+IFD3G0dde0nTtd+lC6j0iaH58BoG1AQLOilheJz6GRVFg4osnjKLYrjQs0cvoPHQ0537uf0Mg==
X-Received: by 2002:a05:6402:d08:b0:5bf:17f:4b7b with SMTP id 4fb4d7f45d1cf-5c21ed9e756mr3039036a12.32.1724949449514;
        Thu, 29 Aug 2024 09:37:29 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c226c6ab6asm867512a12.10.2024.08.29.09.37.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 09:37:28 -0700 (PDT)
Message-ID: <910a53f7-af59-423f-ade2-66d53ddf0538@gmail.com>
Date: Thu, 29 Aug 2024 18:37:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: sc8280xp-wdk2023: dt definition for
 WDK2023
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
 linux-arm-msm@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Merck Hung <merckhung@gmail.com>
References: <5f5487e1-e458-4a3a-af02-c52e50ca1964@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@gmail.com>
In-Reply-To: <5f5487e1-e458-4a3a-af02-c52e50ca1964@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.08.2024 1:47 PM, Jens Glathe wrote:
> "Microsoft Windows Dev Kit 2023" aka "Blackrock" aka "Project Volterra"
> 
> Device tree for the Windows Dev Kit 2023. This work
> is based on the initial work of Merck Hung <merckhung@gmail.com>.
> 
> Original work: https://github.com/merckhung/linux_ms_dev_kit/blob/ms-dev-kit-2023-v6.3.0/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-dev-kit-2023.dts
> 
> This dt is more or less deducted from the Thinkpad X13s.
> It contains a lot of guesswork, and also a lot of research on
> what works with the Windows Dev Kit.
> 
> It is in use and under development since May 2023, pretty stable now.
> 
> Signed-off-by: Merck Hung <merckhung@gmail.com>
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---

microsoft,volterra

please fix the spaces and wrapping, add bindings and resend

Konrad

