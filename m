Return-Path: <linux-arm-msm+bounces-4087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1113B80B4B1
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Dec 2023 15:00:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1FDB281118
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Dec 2023 14:00:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1011A13FE6;
	Sat,  9 Dec 2023 14:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tt3H48c2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9C191703
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Dec 2023 06:00:36 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a1f6433bc1eso353508466b.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Dec 2023 06:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702130435; x=1702735235; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LnMLcnjkb1BIc/27S0iNwDJ0c/b6qRVcdQruabcLx60=;
        b=Tt3H48c20r9rf6i1v7GjVz7t+jZESqRLhj0PumLX47D9fOXt5DIMl8zGHPKyvHM6Cl
         brMfUxQuspFky8Em4KMRJ1lwEH0GpE245FDH/THJCNwXfQQROwsf1xhFjqleLZIHh0Wu
         Sd7l8wOO4UBjroot3HJtu9yKMy7ELvJ5hVY/SARdt0TXnuO0j4C0aV9eyarZYWtLU10i
         PdsnPAcZ+Jm8nC7OrsOz79bNOB3tkMFREtyCZTUpUetmM9/NhfVQU4RFey0EQNgQ/ZV6
         ss1q5xgVXIdp7rLSfZOlDTvnf1F0UQMMRCOAPn9i88djBYLqKjYRMv/yOg8wAq/FIDy8
         UE0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702130435; x=1702735235;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LnMLcnjkb1BIc/27S0iNwDJ0c/b6qRVcdQruabcLx60=;
        b=AP7s6c/8Kry3S/T6bcBUSGDFcx7xMEdxNpxopNPiLcJwghvhVuzKFpzV1XjFQ8XT4T
         Sd0y6tiYaXjSIgrIjwrFHtRzAGjvj9s/1hVUTGg9o4R0p8eat6hcPdlsBEvgLuay6Jcm
         KNdQoAQcz996aof9+crxLmoc+7OeQcDDdeLUC1mZn9E7WD8NxbXUHdwTTpVL+6XC3HXj
         AF/0Q6lJ5Vjdt06sVY/WNyr+OxlvTldGoSJFiLL8mmxTfU9WmSxJmGVkfBZgV6QzregC
         MbUQoOr8waoc4fk9HG3QjnHsWYGyvqa7rOArLquqQ+pgNkt5iYyaVAXMSgRVKjseZjQ6
         NNFw==
X-Gm-Message-State: AOJu0YwKSbzRz1TRY3ulyeC2FcfWUdwjFjesJ1rCpTyvMovtHcX02gcM
	z34grNpFHxVLfL9L94rxC7oVfA==
X-Google-Smtp-Source: AGHT+IEXr1lXL0lwzMvYm5jiS6MD218fxa0+rOiA5rToq8olz4MZ+/x9svL77Z5q+Gp6YBnv7KJSCw==
X-Received: by 2002:a17:906:292:b0:a1c:892e:9e68 with SMTP id 18-20020a170906029200b00a1c892e9e68mr1952384ejf.29.1702130434849;
        Sat, 09 Dec 2023 06:00:34 -0800 (PST)
Received: from [192.168.36.128] (178235179179.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.179])
        by smtp.gmail.com with ESMTPSA id mn6-20020a1709077b0600b00a1dbda310f4sm2231561ejc.158.2023.12.09.06.00.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Dec 2023 06:00:34 -0800 (PST)
Message-ID: <1c99bb49-51e9-458e-acef-a0615dca95ce@linaro.org>
Date: Sat, 9 Dec 2023 15:00:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/2] Resolve MPM register space situation
To: Thomas Gleixner <tglx@linutronix.de>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shawn Guo <shawn.guo@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20230328-topic-msgram_mpm-v7-0-6ee2bfeaac2c@linaro.org>
 <87il58sr12.ffs@tglx>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <87il58sr12.ffs@tglx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8.12.2023 15:33, Thomas Gleixner wrote:
> Konrad!
> 
> On Mon, Nov 27 2023 at 16:52, Konrad Dybcio wrote:
> 
> This list of version changes is useful, but seriously not on top of the
> cover letter. It makes me scroll down 60 lines to find the real meat.
Ack

> 
> <SNIP>
> 
>> Depends on resolution of https://github.com/devicetree-org/dt-schema/issues/104
> 
> Is this resolved? I can't figure out from this non-format whether this
> belongs to V1 or to the actual cover letter...
Yes it has been resolved since

> 
>> The MPM (and some other things, irrelevant to this patchset) resides
>> (as far as the ARM cores are concerned, anyway) in a MMIO-mapped region
>> that's a portion of the RPM (low-power management core)'s RAM, known
>> as the RPM Message RAM. Representing this relation in the Device Tree
>> creates some challenges, as one would either have to treat a memory
>> region as a bus, map nodes in a way such that their reg-s would be
>> overlapping, or supply the nodes with a slice of that region.
>>
>> This series implements the third option, by adding a qcom,rpm-msg-ram
>> property, which has been used for some drivers poking into this region
>> before. Bindings ABI compatibility is preserved through keeping the
>> "normal" (a.k.a read the reg property and map that region) way of
>> passing the register space.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> Signed-off-by on the cover letter is completely meaningless.
Yes, I realize that. Blame b4.

Konrad

