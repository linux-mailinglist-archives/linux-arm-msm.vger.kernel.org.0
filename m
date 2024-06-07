Return-Path: <linux-arm-msm+bounces-22031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4358FFF5A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 11:25:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1153C1F20F5F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 09:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6372A15CD52;
	Fri,  7 Jun 2024 09:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IFAGsa1K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59E915B967
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jun 2024 09:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717752286; cv=none; b=jqLPVx1blwwp0TZiRZwvAy2vJBsAzULe9kq5auHwZYYKKjFOvmvarJsoM+6eIX3sOK5JTUid/t8UadAKQan5V9pM1JK/6kfTTSp8Mx3Ds0/+TGHJj3tAqz1ZsQavRzp5d5722Xqu/rriERwWfyW+OVd6o0KKjsQVKXe0gU8CbhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717752286; c=relaxed/simple;
	bh=zeO9IO1EG8aZKomloMQY39qX1AdlgRGJ9pnmTMbjPUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LDa/E0oJhXMwnK5E3yEEBpmzPscP4kQiw0uqLS+ZGJCB5TdZ42EBGKklxFsBUYAo77jBCQ0p1JEjd3fDZO42likJG8H8EGeXxq1hN16NYoH3Npq4DAi2uKCWeP5WG54TwCTr0yH1Y64fA+6n2C2GT4dNIEeirYOYfyQn9HoVEEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IFAGsa1K; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-57c6011d75dso170067a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jun 2024 02:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717752283; x=1718357083; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=akFm36kfrIU4SBarnRkMIEIkEiOW5duvF8EkGlLWIZs=;
        b=IFAGsa1KUPTFBzd9DDKigHN+qsiYvCDIMY7xpaD/XHzpoSbMRtdr1vtj1Su7nhq93h
         W1tOc3h3OzMP8poYCk+paZsgcgfVxM7TseVmRJ+SP3YG2qNhPoamhgsOXe97CVdXLarM
         3Re0eO3BvhmWLQwLoGbCp/vVR1CrzmAnE7iYiTdY6hB4jVuWsUbALCGaHZEYDdgKpOTr
         QtpIIp2k5LodZo4OXf9VrVBsjvA1QFe+ZHKEN+xqVo+ylyNfk3duviwiUSkZUMagsL+A
         MaNt7gAmH1eiMtlzWffw+0FU7lSil79LHYNC7XasN1175HC1AnPtMJHykQwvTvKIXW0u
         rIzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717752283; x=1718357083;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=akFm36kfrIU4SBarnRkMIEIkEiOW5duvF8EkGlLWIZs=;
        b=VcU35ilguVuSOys8+W+CjrtvJzuuB3C09Fe8cu4nU7YUSLB/x/eS7r+FpqsgY7y5pU
         ZLLr/S1GFoVpqFXDaFeyfPha+BJVcF8G1cdaaXSqyEWZOLa2ho7RZN6Me78xEz8C11eh
         6dcPFRdoRh2hf6YzR/mcbuBC8kvREkNOM74XWum7/UywnGQlRU5CWzRbL/BrJ3Hba6Og
         C4axlnUjQpi2EiAc4EUacb/R9CE4g7x/csUVzYxEEku35HDp9zi+jBwjjb2KhVkXESfu
         2nn7fB71ObayUANxAohvaNhNhfEJQhiwFxdmfT4ZQwQDwH4nfY9+Ke4SF0G/nXpAt6qW
         z63w==
X-Forwarded-Encrypted: i=1; AJvYcCVPwfgU/S5c1y35j+24Go61zQwuOPvBo/ol4NsDlZnjsOpI9C7KCqiMkQayyn2+NPmouA/aatMd9topc5x36R++bwb8q8ScbXwqRXOv1g==
X-Gm-Message-State: AOJu0Yy+RYXjxn5EoLmRJa4os5+w1LEz/HScN4HgycF1KjxnETBC1F4+
	UgjeAfU8Yu/pxTOCx1nonyX55Z3jy495aUvDla7IsyTocOjlWl6EtMZ72GQydas=
X-Google-Smtp-Source: AGHT+IHs0UuMWpOHz0jQHSLiBO2u/tmk0idcq38XrNihu+L3vrr4myn8YIOiHcVv7p6zf3RNO7KHKQ==
X-Received: by 2002:a50:96c2:0:b0:57c:6042:2224 with SMTP id 4fb4d7f45d1cf-57c604225dbmr203103a12.24.1717752282920;
        Fri, 07 Jun 2024 02:24:42 -0700 (PDT)
Received: from [192.168.128.139] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57aae201d09sm2446209a12.75.2024.06.07.02.24.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jun 2024 02:24:42 -0700 (PDT)
Message-ID: <cee275c6-4641-4732-86d7-6da3cc8ccdbe@linaro.org>
Date: Fri, 7 Jun 2024 11:24:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 3/5] arm64: dts: qcom: x1e80100: Resize GIC
 Redistributor register region
To: Sibi Sankar <quic_sibis@quicinc.com>, sudeep.holla@arm.com,
 cristian.marussi@arm.com, andersson@kernel.org, jassisinghbrar@gmail.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dmitry.baryshkov@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, quic_rgottimu@quicinc.com,
 quic_kshivnan@quicinc.com, conor+dt@kernel.org, quic_nkela@quicinc.com,
 quic_psodagud@quicinc.com, abel.vesa@linaro.org
References: <20240603205859.2212225-1-quic_sibis@quicinc.com>
 <20240603205859.2212225-4-quic_sibis@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240603205859.2212225-4-quic_sibis@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3.06.2024 10:58 PM, Sibi Sankar wrote:
> Resize the GICR register region as it currently seeps into the CPU Control
> Processor mailbox RX region.
> 
> Fixes: af16b00578a7 ("arm64: dts: qcom: Add base X1E80100 dtsi and the QCP dts")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

