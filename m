Return-Path: <linux-arm-msm+bounces-14274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 264C687D481
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Mar 2024 20:40:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC5D2284A97
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Mar 2024 19:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65BE6524BC;
	Fri, 15 Mar 2024 19:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UybiJ558"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C47E524DC
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Mar 2024 19:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710531623; cv=none; b=kYiDa7BclWQi9oJMOmqyT2MIPKW+UtHK1kEDCKo1mo4c0dq+NWcBY6gHQGqc7YPmJirgXGQ3PmKoCeyce2rmXEf9MN5A6XAMQJB9op4LLIQ4KhYWo2H4JhPE0endNHtPvFtyI+mu8oln+ONl49tJsIUKMzyNS6XjUn/slrv+zFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710531623; c=relaxed/simple;
	bh=C8VocPAHBU5oMLWcdQnETq6+NgeEczJEka1FC54P6Yw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MaIu60jCk+tmpHDU2TWvYcovqrim1pbcmuuAG8nSRBek28Kefw46yhAU+K+spUo9n9eZI3Yw79+0aMbiRDLPkB2Ds2bkv8/a2QX6/5WoPMsmFMujUQeXk5SCQguCHVse4HPM0oQWObW5OtPyL18mEtbdjpneSrltHvG104WsHLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UybiJ558; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-513d212f818so2682752e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Mar 2024 12:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710531618; x=1711136418; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cYaD8h2YZDs24TOtiqJaFcLSOchMww2DmpDClzEatxE=;
        b=UybiJ558Iw2Xmw5DUSs91h76JBCEc/erqptsnPflVYawkYCgVLXMMjSMlWJlCLT8h8
         UUnTlWyVTTjRomYWCMaZI7qmPnGTq4ZQ8jhIK3YmyNdS87qzsRhtKqghKfDVU5h2prxC
         DTa0OVS1v7OssAFxS3TehdvtZBKiJCYqwMXbjSCdVhMzaav9I4IW6kSMYy4duv1v762D
         mB2LnrX8JAlTmrAoRrnc66iJVvNQX7ii2giDP8CWCCiOj8QlV/PuZVD7G0q6rUoxwrDt
         mXmCK4sgvz6DsNgPPz9pXytNlHkER92NDrQjcZ+LGV6JJ2+h6weURk/Ope6yle2vNOkE
         l/7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710531618; x=1711136418;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cYaD8h2YZDs24TOtiqJaFcLSOchMww2DmpDClzEatxE=;
        b=fWEv1y3ClBRYkDGrnsV7U2w1r0zXI93LSV+cxPvaVLdNThyRigR8Yz8PtNr4pQbi4b
         EOKsBugwsnsIdVh/cXlBVo4KlJrmm1QWqgNrwgxGYM/TXWDdYdbLE8GOIFUa6S0NfvjP
         Qh74emafU5WNgVbGCqulapG1n7hwhlXRR2dEPpmK8KyAxmRMqlQvyfUSnvnINtUFhvMS
         KJ+AmcMPlASNjkmxDfgRE/1TD63SdwbMS6ZvdDyn7RZWD0wJilvio/fV4eeNMzIkObjZ
         3weHP88qUCAwtp3SwdfhFGZiypuhsqNhkpASP/vRjZTMBIorWxXtHpR3/AVFM1M2j194
         3riA==
X-Forwarded-Encrypted: i=1; AJvYcCWB5wbEvQNPl0+yoZqWP1OKsIqB+vt9m//pCR0+1OjHdvlbtu8meechiN08VRai0X+UGDyUJZ/QGChrYv6Qx7yig4Xfdr+dYMpri0okJA==
X-Gm-Message-State: AOJu0Yyt8KYe+mYzIFq9HH3Rnen8fhKPVOx9FZQuewi+b2k5CEk3AAXn
	Ev5AVjJN9gBev1uNyWywev0WkBQAcilM8AJedU44vauwO5LhhB1HyD/09X4nAeg=
X-Google-Smtp-Source: AGHT+IFtBDh48GI07L27lE8v2ub2aRiEvLnRn0ejcdd4ZxRrz4EBTUQtfnDM2zYErTlr9EnkuChqZA==
X-Received: by 2002:a05:6512:508:b0:513:c936:7fe6 with SMTP id o8-20020a056512050800b00513c9367fe6mr2886719lfb.34.1710531618125;
        Fri, 15 Mar 2024 12:40:18 -0700 (PDT)
Received: from [192.168.223.169] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id v9-20020a197409000000b00513d021afd1sm723212lfe.103.2024.03.15.12.40.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Mar 2024 12:40:17 -0700 (PDT)
Message-ID: <77f41b38-dcd0-4dfa-a4f3-e5fb7f9829cf@linaro.org>
Date: Fri, 15 Mar 2024 20:40:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Fix the compatible for cluster idle
 states
To: Rajendra Nayak <quic_rjendra@quicinc.com>, andersson@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: abel.vesa@linaro.org, quic_sibis@quicinc.com,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240315132423.2422484-1-quic_rjendra@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240315132423.2422484-1-quic_rjendra@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.03.2024 14:24, Rajendra Nayak wrote:
> The compatible's for the cluster/domain idle states of x1e80100
> are wrong, fix it.
> 
> Fixes: af16b00578a7 ("arm64: dts: qcom: Add base X1E80100 dtsi and the QCP dts")
> Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> ---

The title should mention "qcom: x1e80100:"

For the contents:

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

