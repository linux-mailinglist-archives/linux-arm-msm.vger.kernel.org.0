Return-Path: <linux-arm-msm+bounces-21875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D154B8FE417
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 12:18:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E83D61C24591
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 10:18:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FFE5194AF6;
	Thu,  6 Jun 2024 10:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Afvhivd0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD07A194AE3
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jun 2024 10:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717669122; cv=none; b=pEkvThruj2inh9zU+MvySTq5M6JHpcdZJM6f8+u3SgcWXwkoX/6TPIGmk7Lbe1in+eF2kV0eqE2m+75NMftK16yL8bV7Invw70HoI1iZdIFduPpkt1DRcJiVf6vxIic82CzzTNg+VPqFARUi+khD77XqTm9ZOQVDSJjDTljE/5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717669122; c=relaxed/simple;
	bh=s9U2yn7tGTs41JRHl8E3IDPxF/wbqH/25Wi0iemeLQk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=O22odDHxf/IDJIYrsJ7ixVxZFIKsTTyyFqeVWLB769TE58KnSBmP4GiToNOvyrihC0UDwvD05Clke29IIPVi4ieJanmvCgHJ/NhnOv5HG6pLbVIpQWefyMMWhp/4MMoYqfGdIpJx73HXW2FtXKFliS/4qf72XPHZcneBVx3w5Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Afvhivd0; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52b98fb5c32so1227083e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jun 2024 03:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717669119; x=1718273919; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UXddTHSlpNjJNv0PuvtfILGwEDtWQQdWR/jxfT4xiWI=;
        b=Afvhivd0EoeC40btu1W7ZJ1EE7LCjeJskLo11E/M/cGmU37CvomyofKL7zhSfCoNb7
         PYnxj3PbTiBJhXP1FYqE4c5wiu8+vOzkGb3bX/LcdbOHXNpER9cM5s5FWB/bHtF2Vij/
         AD8IgV7+qz7r+MMec846wKfQ6fSwHnS5Rte65C9XIlhxXQijcejwKkiJmSwW+hcXsuKv
         C8aslFbPOTZT3ks4Qn9fKW9FaRJzoC/lb4UgEcpjAoFTAqHwQ7wDqseb2cFaPS8disv/
         U7Fi0rIlHhbZGhYQoeYFrCCiw3YeDph4hIgMdz0KnUL+FAsk4HfDz2/Q0YvUAtsgFKdV
         b4og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717669119; x=1718273919;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UXddTHSlpNjJNv0PuvtfILGwEDtWQQdWR/jxfT4xiWI=;
        b=IiORExyoH2SsQDN+/vAbtWHg+ZwyedaWTIcP/k2YMpHHRL7cQvLi9RYKv3ZPjwGo0Y
         ZtIzD/9PyrSTYtNlYi2MglEnZCGrXpmLQYTAoYrCnBBjvSZSenU2TWY5BzBRrYH8oBt4
         JZ54vbxWEdDR0st0PsnPIjaI1X56EWDz+Q/cIW84iDd46ltFy389eGJ4mWFZsMBusJoE
         woRgx4euWf7yVaD83nD25eX0K68FOGZ7Py+CAd2UK8jfaxeLADj8VvPECDKMEDQH87E0
         AP9EM54UXDAUyN94+keBYzuPd9dIMILBEKXC8odkBtWTsghIvq7yTuHgRrlFw5eFbCfd
         qBbg==
X-Forwarded-Encrypted: i=1; AJvYcCVLR6dDPeMNcZjxfq8BheH7XhPCFZfgSNpubpACo8WD48N2npGNEklY2Hrj0Fp6uNcxKVSGIPGaCAGukVghAtSLDslwW+7BdlTP2L0Xug==
X-Gm-Message-State: AOJu0YyCTmiFKwq/gDML9tMBNv9Upcz5Ha0j/iGxqV6Asqd0B/Ob++mZ
	0pKvwnI4Z7n+hpIS6Q44pkoHlaCzpw/5WZ7xLNxrB+tawzVioZosKZ9gRZRA28eNmlmono4+Elx
	kkd4=
X-Google-Smtp-Source: AGHT+IHiHKEs76i7S7+2H79oAJxUR/R4LLbLUJj2lKyMB/tUI0ZRobpmst7isu5+kSDBOa7FO4SOnA==
X-Received: by 2002:a05:6512:3481:b0:52b:8ad9:cf0a with SMTP id 2adb3069b0e04-52bab4fca86mr3646724e87.51.1717669118705;
        Thu, 06 Jun 2024 03:18:38 -0700 (PDT)
Received: from [192.168.128.139] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6c80581efdsm76366066b.2.2024.06.06.03.18.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 03:18:38 -0700 (PDT)
Message-ID: <7dc8d73d-f702-42dc-b579-4228d6968d0a@linaro.org>
Date: Thu, 6 Jun 2024 12:18:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 1/4] arm64: dts: qcom: sm6350-pdx213: correct
 touchscreen interrupt flags
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240605160032.150587-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240605160032.150587-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5.06.2024 6:00 PM, Krzysztof Kozlowski wrote:
> Interrupt flags 0x2008 looks like some downstream copy-paste, because
> generic GPIOLIB code, used by Qualcomm pin controller drivers, ignores
> flags outside of IRQ_TYPE_SENSE_MASK.  Probably the intention was to
> pass just 0x8, so IRQ_TYPE_LEVEL_LOW.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

