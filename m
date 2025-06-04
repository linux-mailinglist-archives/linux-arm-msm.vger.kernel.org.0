Return-Path: <linux-arm-msm+bounces-60197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E12CACD9A3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 10:24:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DBD13A41F7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 08:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DE4D288CAA;
	Wed,  4 Jun 2025 08:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z2uPQTyG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D7124677D
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jun 2025 08:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749025442; cv=none; b=CHsYCRuTkEvqgJFbwkd7H3ZUyy4hu77TkI1xEQ0jO/0lML564NNUJHOO/uDvrxwleLc5G5oAJPdInWo9nrSE+S4Dd2m+ulDQjQzoWFXGQl64q3zBQxNX1I3YErTs3qG8Cnmd6mLwL14jE7nO540G08CB08JdZYzDCxWu49fKewU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749025442; c=relaxed/simple;
	bh=zNHoKAB5U9Qmrd5tzPO7HQ0l+s0XRB3gxF4oDsXEwt0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lTaoRFEbKG0eTzqklUnGpOEz95WtYNp5cHGd/kFStgXIlwDxJhIpYSSjDxBtcqyjE6zr49+9AUBDagvd9dVv3L2kmMh6l2GQooYDH0yORbxJnRE1uP7/Fyl+BM6XLc4f4czvGPWx4bamp9FCnDmDd3q6g0O4pUvQiW4bJPeaVcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z2uPQTyG; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-442e9c00bf4so43799445e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jun 2025 01:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749025439; x=1749630239; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h7s6pfygUdaVGCn3GcQyk6cUhVydm03tR2O0SvKmYUM=;
        b=z2uPQTyG16uLb50UVAGXXsn/g1j2QQFVHuMXxl5viKNPbXRNArf6rY9f741Z9n/Ghu
         aEix6jWPfZwEJYgkC1wcdYxym2jUerr4Lq4bOxJuVtPElHVoK906lJXBVNNZLinExaOP
         LuE5DoViPzc+PTNAIlIlgr/oM3SMftD/z8uzV0rfeqYt8yET8R3Zt+/TNJ0jCuf8KQUE
         raRDGtQfIWGxFZBMqgBszOfRygVDi1r51NvkjAhwHRZFybwIXRAXFK8ERetVAnO6o+Rm
         1uLFdwX1R5/v7jIN+WHfqVegWaCpM54aXRRLWyg7k138EHUQDu5xUZ74nBUdW4dzpV9y
         9VQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749025439; x=1749630239;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h7s6pfygUdaVGCn3GcQyk6cUhVydm03tR2O0SvKmYUM=;
        b=rh+QR31zS3O4GtPkmxmc9yWLC3D/JLZOTuuCD/9en0oOhqI9TjhQDWRgFYMBetTl1Y
         +tym/Fka9jkpgpGZ+T4ExjuN+sQNsqZjxd530TdD0ePWz988xyQLaY01jb/KOqB5+3aZ
         wwyPZeRb6ZvbIpiUK7iUPPa1SY8en/TbTPskYRRgWh/WpePppwyPOc7jIRn/em7Zkbh7
         wg2j/gfFksjPy7t2O/gzjkowrZsL5mVvydJ1SyW7U6UuUB3inkS7hX0jdvO7pfmVCzxo
         DwyTO2EesCHWS90s12fG8vHSDxUedNNkt0JMzuaG3XY3o+eev7DGSNr0vtB4hXipMuGs
         A3Ww==
X-Forwarded-Encrypted: i=1; AJvYcCURS3PQLnb5jO+7yIH0KpvqClHCI8Y395QXylSrw52+cNxGMhQfBKxMXUPFsFnBw8ZR2ltv0pzFFojgx1f+@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy1JA4D2+z+o9k4hNdIQZzYiEs/pqbUmHGNJOucIALRdBRkFVN
	3YnxcCbS2la2ogYhjTRn0Iw63h8rEsLkisBkR815X9Xfb1vGpEzfRw28QQgontsMwSg=
X-Gm-Gg: ASbGnctMna1kvYcS5/Hqvz8FDKl6Rn/E3mM9NJsdJ0DIqhkbiQiHsm7q+MJ8ApxrK6V
	UHOiUzoe4cCjMIH+GF6K0V2+l8gNWkvGyC3jH+dPf2Dp3BYcJYsAWQG+GaCb9x0nmWEu7lP/Th0
	iSULQ/0Yf8ZNjL5DmUlsKeUu16cUfifqejbjnROMw9YnbxK/PjJP9EziZ6Si2IbNcblXZrtODII
	HuZGGpwcbbpzFEZUg5pxTH4UJ6+keixMjGmvv5TE38MjT9t+3IBhb3MMhVaPSFKB0bE6ipgUa8H
	rvWX2OHu1ffTf9nhE/gUngiwQKLdnGtNhzZCWvT7drwFB69Xf3/4FxwxHPBUDwFrqWppupC/LEX
	BtdFHv6IeVf/n/vBubSyMZGTq1eY=
X-Google-Smtp-Source: AGHT+IGuDdROqzATGDzK/jjhYn6/52Bbjegw9C/PQ/dD8jHjdp0OUR+ym1KT/jZkS4osD3Mqe91lug==
X-Received: by 2002:a05:6000:40ca:b0:3a4:eec5:443d with SMTP id ffacd0b85a97d-3a51d961c87mr1297240f8f.29.1749025438742;
        Wed, 04 Jun 2025 01:23:58 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe2b35dsm20745556f8f.0.2025.06.04.01.23.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 01:23:58 -0700 (PDT)
Message-ID: <c751b9f0-836f-4151-9ad5-82cf4c282a2b@linaro.org>
Date: Wed, 4 Jun 2025 09:23:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/8] soc: qcom: geni-se: Enable QUPs on SA8255p
 Qualcomm platforms
To: Praveen Talari <quic_ptalari@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: psodagud@quicinc.com, djaggi@quicinc.com, quic_msavaliy@quicinc.com,
 quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
 quic_mnaresh@quicinc.com, quic_shazhuss@quicinc.com
References: <20250506180232.1299-1-quic_ptalari@quicinc.com>
 <VgXAbpS__r4C24FLFz5nqCPgygil3nr3-oNHbL7bQxE0X1GnDStFaWlnts8iSxCeG6TCqa8mzIFqOysqIlWeJg==@protonmail.internalid>
 <20250506180232.1299-4-quic_ptalari@quicinc.com>
 <e6517c54-9163-48d1-80c2-4fd964dac349@linaro.org>
 <pQ70_lZWsA1PB1GdnrxpeWdiDKvQsWaSYURfGNHMENN7uqR7u-OFSZA04GvqAVOu2QiaAaRniqL0kpOznBajGA==@protonmail.internalid>
 <85ba8e7b-a1a5-4f70-9660-bb78e7169acc@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <85ba8e7b-a1a5-4f70-9660-bb78e7169acc@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/06/2025 08:28, Praveen Talari wrote:
> should i keep condition before assign num_clks to wrapper->num_clks as
> below right?
> 
> if(desc->num_clks > MAX_CLKS){
> {
>    	return dev_err_probe(dev, " to many clocks defined in descriptor:%u
> (max allowed: %u)\n", desc->num_clks, MAX_CLKS);
> }

Its up to you if you think this check is justified and/or necessary but, 
if you decide you want it then it should be an error if the specified 
size exceeds your defined MAX.

---
bod

