Return-Path: <linux-arm-msm+bounces-22963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9714990C390
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 08:30:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2325E1F212F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 06:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5E0A43165;
	Tue, 18 Jun 2024 06:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SaK/Ydek"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D529A1D9527
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 06:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718692242; cv=none; b=BnOTL4G/1xpblzgbEvs4o4/wop2Ry3OOIrxcf2hLr6M2N/eIoisVIF3TvkKAEt/VeyrNhzLrNSIL6G0LHQVXZXejqy/+zY/Q3oiALhoOdOCYkMfYv6nTJqMTbObTmIqSwy6lx/xouFF3LHtXTV9shCMar3fqSh2nqO6R36c5jFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718692242; c=relaxed/simple;
	bh=hZDWCI2YcLFzdh55xjCS9DfloNBolM+/C0zHHdHtNiU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gvi4oFHOlmhTX77iJI2V4PwJ2XMWrjLK6FxPm/2vY75Xgoiu7AsH3YEGcyf3PYfxPG3nPZeV9d+p7hLfXzyOxd5MAQ8NAIo8GyKa7Xot3jHhjvYWIJGjd2Z5Igv1G+JZ5AFxiHxh0QGl2FRRKd/lTVL1yBQYV7NNWxZbfIYlLBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SaK/Ydek; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-421a1b834acso43359005e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 23:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718692239; x=1719297039; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZWeFAAAi2L8rsVHef4RgO7GjNAUeaqypAMAbTcH7e2Y=;
        b=SaK/YdekwElrCs9TdoZGIrQBLFVhY92bRlH69N7EKVGrUpzSt3SF81k3IcdK49ATD2
         xWEOr/qIoyV786gDOgQ7v4t8pe3YP59WSIUHv/sAE0Jpus9IW7TDSy/72DPnzGiQWRxM
         PUp7yeeku0xE4c2KmVJR1/QqPR18Ln7j4R40yU7a+Qa4bhEECxfbu6YQrfjlnuOSETdj
         PWwDuOUXg3dM89/a/p+vYfAEAFGb6MHOY3o4q4l7LqjVCK15+7lUtw0Wkl+eaYnyCvMm
         nFHidbPivnzXOtiUtEwnQpS02HsBUnhw/3oaHcQRydklrGEPV2W99TATy4BN1Ktf5xDv
         FSqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718692239; x=1719297039;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZWeFAAAi2L8rsVHef4RgO7GjNAUeaqypAMAbTcH7e2Y=;
        b=o+jVk2TudAlG1nA5xph81ljZOWxgXx3u66I4D6f8QvGUD+OJ3egh8L/kGOcVTHkGC4
         KPCJwIti8XFFljAQxzMke3WilJ/c10/LShKPaIyTIgJiVQyOJJ0SdFH+DlYZv+TsaMqP
         HZCzpZmgfDN4BWr9csjrnZEOJ6xoZm8vZAs+3WjWSq75cUcTE2lnnPEYDnB7iReK3Iyl
         EaFibygXMG5xri5fL0/mvTNnUC3987ZTt7QI38+iKOBDBE72SXHCxsj6ukayM99CdLZq
         3pu96Iw67wqputt7oKHz1Fr0skhENJOAx0TWKr5vOuDOl6T/SvTzgOZg0a1cS0HIK7Gu
         5uCg==
X-Forwarded-Encrypted: i=1; AJvYcCVxJVAqD3IRJDRiusELjiAbdYlOoRZ/KGNk52Bqrqa0d/V5UVbg+LvlUP4+NkGwyTEETQ0pZUlZU7k/MzE/MWxbjTVd/sa3jbCRU8nlGg==
X-Gm-Message-State: AOJu0YyJSorugVj8Ytt69zxIOI/9iHBtlSONx9JrppKV2FJiZXofepUL
	GPXpLl4Bd4PLhbgASmi5clz+HzcCKjrsyDkKloVkxXR+aP7nXzEUlU8a798hg1M=
X-Google-Smtp-Source: AGHT+IEJ4gLarh4h757fQ4nJrn6vzZRFlVK5KgpSEj7lt/PYKYzRz80A/D0z0k+dx/QjESmAgiEWvw==
X-Received: by 2002:a05:600c:1c9a:b0:422:6449:1307 with SMTP id 5b1f17b1804b1-4230484f994mr115936955e9.32.1718692239154;
        Mon, 17 Jun 2024 23:30:39 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422874e73b1sm217722655e9.45.2024.06.17.23.30.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 23:30:38 -0700 (PDT)
Message-ID: <b0f52816-8a9e-4f6a-8b48-18e77ed5dfaf@linaro.org>
Date: Tue, 18 Jun 2024 08:30:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/15] dt-bindings: crypto: ice: document the hwkm
 property
To: "Gaurav Kashyap (QUIC)" <quic_gaurkash@quicinc.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "andersson@kernel.org" <andersson@kernel.org>,
 "ebiggers@google.com" <ebiggers@google.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "srinivas.kandagatla" <srinivas.kandagatla@linaro.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 kernel <kernel@quicinc.com>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "Om Prakash Singh (QUIC)" <quic_omprsing@quicinc.com>,
 "Bao D. Nguyen (QUIC)" <quic_nguyenb@quicinc.com>,
 "bartosz.golaszewski" <bartosz.golaszewski@linaro.org>,
 "konrad.dybcio@linaro.org" <konrad.dybcio@linaro.org>,
 "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "mani@kernel.org" <mani@kernel.org>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
 Prasad Sodagudi <psodagud@quicinc.com>, Sonal Gupta <sonalg@quicinc.com>
References: <20240617005825.1443206-1-quic_gaurkash@quicinc.com>
 <20240617005825.1443206-14-quic_gaurkash@quicinc.com>
 <a9d8606d-fb4a-4394-bab6-3304e1f8b9e5@linaro.org>
 <af1df42efdb4497cb174bc664c692651@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <af1df42efdb4497cb174bc664c692651@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/06/2024 02:35, Gaurav Kashyap (QUIC) wrote:
> Hello Krzysztof
> 
> On   06/17/2024 12:17 AM PDT, Krzysztof Kozlowski wrote:
>> On 17/06/2024 02:51, Gaurav Kashyap wrote:
>>> +  qcom,ice-use-hwkm:
>>> +    type: boolean
>>> +    description:
>>> +      Use the supported Hardware Key Manager (HWKM) in Qualcomm ICE
>>> +      to support wrapped keys. Having this entry helps scenarios where
>>> +      the ICE hardware supports HWKM, but the Trustzone firmware does
>>> +      not have the full capability to use this HWKM and support wrapped
>>> +      keys. Not having this entry enabled would make ICE function in
>>> +      non-HWKM mode supporting standard keys.
>>
>> No changelog, previous comments and discussion ignored.
>>
>> NAK
> 
> Apologies for not addressing the previous comments.
> https://lore.kernel.org/all/9892c541ba4e4b5d975faaa4b49c92ba@quicinc.com/
> 
> Maybe we can continue our discussion here;
> " SM8450 and SM8350 QCOM ICE both support HWKM in their ICE hardware.
> However, wrapped keys can not be enabled on those targets due to certain
> missing trustzone support. If we solely rely on hardware version to decide
> if ICE has to use wrapped keys for data encryption, then it becomes untestable
> on those chipsets. 

That does not make any sense to me. You enable it for SM8550 and SM8650
not SM8450 and SM8350.

> 
> So, we want another way to distinguish this scenario, and hence I chose a DT vendor property

What scenario? Show it in your patches.

> to explicitly mention if we have to use the supported HWKM.
> If there is another way, I am open to exploring that as well."

That property is just entirely redundant. If you claim otherwise, show
it through patches.

To be clear, so you will not resend the same ignoring comments: NAK.

Best regards,
Krzysztof


