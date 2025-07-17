Return-Path: <linux-arm-msm+bounces-65375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E20B084FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 08:33:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99CE4562BC4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 06:33:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BD72212B0C;
	Thu, 17 Jul 2025 06:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XNlagYzn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AA21E3DDB
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 06:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752734012; cv=none; b=TN5cifnqP5ox7m0PHhi/U5Col2jhx+0v4zV99B1rxfzOl4LgS/9dkZkm3mnYHHpSPBosEAnHKTYiihMmzWvbl+7D2EQolhm7mXuRk2A+J8z66zVlUWgfxR0OIgJPwGVntwf3xqyo1oJcxRfOcLsNNpNAHbUzqWkYlma+IYwOlTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752734012; c=relaxed/simple;
	bh=9oZTNjF33scH8hybVYxUr6ORA/i1Y3K4UPt4Hn3tsiI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nPMcHmKU9dGyu5xTNmRSNFkllj+6mfcO6lcNfMyP2IT44MDlXTdseesx9QWo9IbqUH4UYVx7LZGYcyU/tGgC/voibYnE9zDkuGCzGpUx5uCb5lKZskk5nDmSAk4r7FfMboEo6cAxrFun0c8CaSrIVmgI75u88wLfGsEAHqMNSJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XNlagYzn; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-611d3fcc49fso86619a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 23:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752734009; x=1753338809; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CfOQaGDrQVfIjY38EFe6HsBB3Jv45mBE2DWiG2+Y2u8=;
        b=XNlagYzndPCtfA3S1eurmyDXC6DE/bVn7gmkEsl1dcL1PRdNot8q2/FK4ObGF8vhFF
         B3fFy+PYwcJm9ZLd4t+uQZsNXOFMV1al8BLtVb+pKYWG9yFlEeXoeKtooXajLQLlTCov
         iXeK9dPoXDZHLZTmyLwou6xtvjXXBuR+TnrBl8LpouemcbBxkpVfBp2/FfkvotsuUjgD
         hbZ9JMGtHketnFl8RRmr3cMSCRmOQ/cm/pm+uGbPmK5I+hmAJpIjZPR9F/iPSYpyHgqs
         IxyQKQATT1F4zCJqMKXBtPsm/ra4BINvViDKRnIxiWIWS3YFF01b3GOyDDOKawri/hv8
         56HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752734009; x=1753338809;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CfOQaGDrQVfIjY38EFe6HsBB3Jv45mBE2DWiG2+Y2u8=;
        b=N8bc7NZzhvqZuXpU+6xeDjRgZzsecRsTmdGcxy27dTBcjCzbtS0df2Evc686SQL/65
         4WsmPJA5TDGBmwrZed+7oFZuGkn8YWmKG/mpCC8qa4nfUWBoWHIu9d3DYxVV+/p5+tY2
         8d9WWKKIOfn96kPhYBm7M6IDwtCrj334/OdcvIkGvmggWsqkwUJqnV14UankurMWC4YA
         YxK7Oc1tx3Tj2a2D9/wqqfkJHf0Mg/6kQnMxQe7kXdDjUippsORA3TFixVCWS/S3Gyku
         Nr7FWPDh9Kx1ANMOcXFaJUBAPk3ec7YIinvPn9eTuhk2jtknvZowAZ3EkdlgqjcOLaDB
         fHIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoh6I8NheFDFJ+v4N4CKVcCh2NPi4gWLv7/DbC6zCzmO5Y+CsI+8Kzesw4JX2umtjnDqDTVmgMqmW/mxwT@vger.kernel.org
X-Gm-Message-State: AOJu0YxOilofT0GTlv/lFmpt6T6FD0ElX22dYA7d0SgnjrDFU1Z93Dlf
	Bb78gsUKWSKywDdv5wNoDbsSZBvAvkiiB9qeiClnxEMQBIba8lBj2NhpM6MdOSv6CUY=
X-Gm-Gg: ASbGncvwl7xtkuWPsWIJQElCxoiqH5eqY4DfaygBKZVpBBCvSO7PBwFoKsXh9FThX6u
	L+Y/a/0wzUa7fUN38/b+rS75yc18L+J/IhPOJAUHgxqfE1Qd8imuxOH+4VZ8rh/ml6w5JqcPeac
	jvJDh1z6R71r1B3xw2tEGdZeND+vJPEr1XlHM1jwP+pTKzKBExKZWpXvKqgRZBNOh6vjNn5xs3T
	t32N9aT3iVv7nAFdtyfY1zO3K8eg9Ro8ovaVcwTYgPduSKO+rpSHqoTa8BUVmVf7cala2tgYHdf
	ms3yBQK0HDu/DTh4Qa4E4ppGn4Fldg4+4Jz+EGIzw5UuhLGWAaIsvVb/HIVEoXttQgSUWCpxTyb
	fV7YdqhUEbWV2/pZAgFJdHscXjAtUuQ7+da3EVJLkDA==
X-Google-Smtp-Source: AGHT+IFpIcDigAtPXUjGCbTkKlwsXrNTjQmqgK1xnq4CufoNYY+euKUOhahLELwS8UdYY1gQl9SlRQ==
X-Received: by 2002:a05:6402:2345:b0:5f6:261e:db8c with SMTP id 4fb4d7f45d1cf-61281eca456mr1840070a12.4.1752734008925;
        Wed, 16 Jul 2025 23:33:28 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611c94f2bcdsm9510175a12.4.2025.07.16.23.33.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 23:33:28 -0700 (PDT)
Message-ID: <7a552f24-50df-4c94-9bda-50712fc72485@linaro.org>
Date: Thu, 17 Jul 2025 08:33:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: arm: qcom-soc: Document new Milos and Glymur
 SoCs
To: Luca Weiss <luca.weiss@fairphone.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250716162412.27471-2-krzysztof.kozlowski@linaro.org>
 <DBE47UNGCDLE.3AZF5XENB5BEB@fairphone.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <DBE47UNGCDLE.3AZF5XENB5BEB@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/07/2025 08:27, Luca Weiss wrote:
> On Wed Jul 16, 2025 at 6:24 PM CEST, Krzysztof Kozlowski wrote:
>> Extend the schema enforcing correct SoC-block naming to cover Milos
>> (compatibles already accepted by some maintainers for next release) and
>> Glymur (posted on mailing lists [1]) SoCs.
>>
>> Link: https://lore.kernel.org/linux-devicetree/20250716152017.4070029-1-pankaj.patil@oss.qualcomm.com/ [1]
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> I asked for documenting the Milos name at v2 of Milos patchset... it did
>> not happen and patches are already being accepted.
> 
> Sorry about that, I seem to have missed that.
> 
> However I did not see any dt validation errors with my milos dts or
> dt_binding_check on the bindings, where are these patterns relevant, in
> case I should touch it again in the future?

There would not be any errors, because how these bindings are written -
to ignore other, unknown names.

Best regards,
Krzysztof

