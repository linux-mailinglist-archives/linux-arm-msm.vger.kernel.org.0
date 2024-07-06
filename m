Return-Path: <linux-arm-msm+bounces-25415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B9C9293E0
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jul 2024 15:45:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BC66FB22388
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jul 2024 13:45:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C225D71B3A;
	Sat,  6 Jul 2024 13:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nTQfCDnf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD3C23BE
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Jul 2024 13:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720273524; cv=none; b=Ew2H1CfBLK9va3DPlYpgCsDmes1t77zcs60LqzbMmg6IcjbHE/HpYir8x1Dc0aLAtuGW9WZLEXua+B3OZyPaMIUomEojzAqV+bFmptTZoo1Anjs008XllXM2gDU/HnVZDur0zf9ysiJHmzpMP7xnthvC9cDpuV6XciNJvcOCLyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720273524; c=relaxed/simple;
	bh=PF0h1+oGkiFyh2lUW1h5DQmynoUC4x0O+nlOXzEkh5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hjn7FYnIcOohw8e1m0ygHr+HznV4FKIRHyniUiMmC1Cn8VAW1mnyDO9yfm1zRmDU9KNIIjWAI1/fyBGuRLQqN8wqPMU6caGScWBz4ufvIUgjsSaQptqq1rRmzf/PQc1IxCVso2oDt3cqqNFjk7I+gpWqk1r21+lYuPFRHQrOq+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nTQfCDnf; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-58ef19aa6b3so1209928a12.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jul 2024 06:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720273521; x=1720878321; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2S1DHxM0yx23XpwNFbOt5pMvU94CeRa/2MwtXb40TCw=;
        b=nTQfCDnfubl7qGD73RX7JTbK5FGfU3jPxBc86X9V1+5jdX1fu3rNXF+2Gwd4QiEvlf
         7Qi49Ip0b9SaONvtnyLZ3a3EJ8FAKO5TF2ZruZchhEGW95vXz8ryiSGNgXF0mzPIaUCd
         0e3ymDTa5bBWlAnAiB/YVymIa6Jd9JhqGjj+7N1yBfBbSsUpaBlD1Cwq02sOyiweLnyP
         F5WGOCQvL/P2WR0cRzXgJG4eTy39y/jiJWheK562Uf2umeiAkDfmbPlE4XVfI+KRLOWA
         L/NegsxqHQ0b2INHfF1IiZ+v388W/UeQ9VjgKoI71/jt/xHLU9aNB0g+iS6cTQJfE6gY
         V/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720273521; x=1720878321;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2S1DHxM0yx23XpwNFbOt5pMvU94CeRa/2MwtXb40TCw=;
        b=nW4hGVvgvH/0n8nho7ibwmwNVgzN9DMqQPZ5DFv9wvCiYsdSfRyRIx/65+UTpuSjL5
         iQ958SArbnQDqjvX3bmMiOC1qSR+qOpdY7DK9AtPAZ/IKlFwOVOp4ZMPeebtpkiwenKs
         fd2ovDZL+hPUJ2CtOWM57o8TnqIuH8set9TPuB7ccSQJANut0qvWWXNzPQQI5GVenWOp
         KKzCWxq2ggJSKj48/GFBZZNnH9yhkrQfqnlNpy7rLUUkHpgOgBldCaI+VPUNDO/g7uqz
         YBNy9yK0z+bdpFzcEJccSZe+kOXmPLsZnChXyp1balXnCmmWb6iTVx3P86lN2u+1qmtI
         z19A==
X-Forwarded-Encrypted: i=1; AJvYcCXgljjH3WvMbTeUVRzbvre+F+9qx8lGGReRrbENoY3qyq/dBCTCusIUF/4lgxkbfkMf7HkoU4/B8PsXhjp9v5jHX+qxvN8SphXPRwsJfw==
X-Gm-Message-State: AOJu0YwuTXgKimx7kxDodpss8jK8geKOir+punLnIYqXMwpPBNpCbBeM
	RCpOU4N9vw0l/GeR6oLrhDvUpWbvOY6vx38DpQoMwo/koibuBS6kO2RnPU9md5Y=
X-Google-Smtp-Source: AGHT+IGzECxaHWskymi62jCPiAax/L3GFDIo+8EkygkRsWMoNFAievbEM7ZIgnZH2Ki65uCIyugg4g==
X-Received: by 2002:a05:6402:5215:b0:57c:a7dc:b0dc with SMTP id 4fb4d7f45d1cf-58e5994e4a0mr7338244a12.4.1720273521400;
        Sat, 06 Jul 2024 06:45:21 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5861324dfaasm11091582a12.32.2024.07.06.06.45.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Jul 2024 06:45:21 -0700 (PDT)
Message-ID: <a70f01cf-386e-43cd-b744-ec71aae923d9@linaro.org>
Date: Sat, 6 Jul 2024 15:45:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] clk: qcom: clk-alpha-pll: Add support for Regera
 PLL ops
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Abhishek Sahu <absahu@codeaurora.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>
References: <20240702-camcc-support-sm8150-v2-0-4baf54ec7333@quicinc.com>
 <20240702-camcc-support-sm8150-v2-3-4baf54ec7333@quicinc.com>
 <kxoxr5cxxedckh7q45zhhyssqx4ahdfbqw7sdsrxx2ddplummh@2s6jv62ipnhb>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <kxoxr5cxxedckh7q45zhhyssqx4ahdfbqw7sdsrxx2ddplummh@2s6jv62ipnhb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3.07.2024 12:05 PM, Dmitry Baryshkov wrote:
> On Tue, Jul 02, 2024 at 09:20:41PM GMT, Satya Priya Kakitapalli wrote:
>> From: Taniya Das <quic_tdas@quicinc.com>
>>
>> Regera PLL ops are required to control the Regera PLL from clock
>> controller drivers, thus add support for the same.
> 
> the same what?

I think it bears a similar meaning to "this" in OPP, as in referring to
the main subject in the sentence.. Although I think I've only seen this
phrasing in QC commit messages so far /shrug

Konrad

