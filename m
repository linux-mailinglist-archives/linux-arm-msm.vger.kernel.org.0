Return-Path: <linux-arm-msm+bounces-23321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F8B90FD10
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 08:51:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 268AD286695
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 06:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D3C84086A;
	Thu, 20 Jun 2024 06:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="inErLHhq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E8E3FE55
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 06:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718866311; cv=none; b=KatldfGVseF2IDvM7wx7tEOCdPTfMUBfWwlB5/uUXjCmAPcwn9qNDg6jHBBUK10bvgNawL1Jw3M/kLfrrbjN1jr5VO3uZd2D8SMYR0VdBiIht/8RI9Rwt8J8pdKl66qX/jdNfPQNJvfttZy7Dy2QPz0rQ0jNqb1V3i8ELckA+cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718866311; c=relaxed/simple;
	bh=rtffoIjSeJkqATxaPj0HVobtWsQcD69dS6bcuwFaiD0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h9a8M/G6ZkAuKPtkzUbyzlC9utwoLTlDlpR5ipZYgQIoC5xP82f4U+YQ2YpzK1B7jADDP/R3s/DFvn4VwKLK4q1UmueT4kT+U5Qv+l6Jp4aD1Z0Tgt2r49YeTAd5Sc9bQHEpN/6xfkd7tovml+4IxDyC57PsRdd/jQrk+trZUQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=inErLHhq; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42172ed3487so4522725e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2024 23:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718866308; x=1719471108; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qOxOZ469DXl5uWG7hPb7uhY0Qm6yX/XE7DoDcQ/MBsY=;
        b=inErLHhqgXwY4haTvf2kAkbzZXtjOcgkSnmh3UGhLOmdxeERAZY5n7MsC7BeY5WR1L
         9+C8m4yTI94gJ8s95zZYE4Ce8QOJEnLCMZlXpSJZLCHjc+wiLN4qgVgkALdqPtBnQvwB
         sXLQ2uw1H3RXkLj8Gq4/50s2JZ1IXAxFejd+ZFAbuyEEb1OAmZ2Qb+tj5+u8rqDVJ8d6
         E3392Ek7Rqi7BUW3HBI7eeXnr97BTsVqgPqUl6+4G75wqEkpdCGQhY3WrhndGkW+/V0S
         mPhB9xW80rZYCyKhSPowXys9OO+Nl2MX1ZvISQVsEgCT+J+Gvk+GJOBM/z5Bg6tWwoTL
         ftkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718866308; x=1719471108;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qOxOZ469DXl5uWG7hPb7uhY0Qm6yX/XE7DoDcQ/MBsY=;
        b=VTsvicbR2UPUzKNJZXesMIswUbJ1e0V5jHEZRiWA5sgkC7CmpdsQ7SAXNU8Nc+bojB
         EehcGoY+qw2ucLd7yshZ+/nFLM6xIVfc2h3aA7nBdFng83VlIoz+u1mKtT4gug9cFLoK
         5u07MEXixDfqao5QHy3f1Qaxm3lA3SBfSvp286rUL3tRYiTOHCRu5pN2TiStoSqdyxp0
         LpClIbUQN9wRJuVQOCrXlTTz5evKp7zCpRACTVd0TgNo1GO5mDfv2fQJN5dvOZftb7+G
         6Tt0LFUR3E7Gra3LbHQ19YPlX7dx8YPMfjIU3aeOOjGDDy1gUgRkrqJ5bWF1rrSSz2K4
         nO1g==
X-Forwarded-Encrypted: i=1; AJvYcCUMr8eYIn3Rw+DTsiIS1lLGIcJ8udwXzCRo302W605MEYg4j8wmWkgu71eNdurmLY701AqyleV3xYZpMc24lTUZuxB2q5oM7wwqx2M+Wg==
X-Gm-Message-State: AOJu0YyM1Eqid7MCM8JL1jLnhGdCk3PhtKMX1aYd+YUDrbUO3pG/6yTD
	39WP0ydfc0S4afLIJ4J7RQpoWR4yVerLXy9CvIVuUDkdwM1rRBZGJxPWbJ0Pd6g=
X-Google-Smtp-Source: AGHT+IH7jpXOVPMELf6SiOhJCO/SgBwwOy8LuwjHgiTc/R+Hduh5AMhAfmOF+NZ56Ge5VPVpB3PDKA==
X-Received: by 2002:a05:600c:211a:b0:416:7470:45ad with SMTP id 5b1f17b1804b1-42475182a8fmr30458535e9.17.1718866307683;
        Wed, 19 Jun 2024 23:51:47 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d0b8d9csm14184005e9.7.2024.06.19.23.51.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jun 2024 23:51:46 -0700 (PDT)
Message-ID: <ef3ab301-563d-4939-9eb6-ec4c097ea07a@linaro.org>
Date: Thu, 20 Jun 2024 08:51:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/15] soc: qcom: ice: add hwkm support in ice
To: "Gaurav Kashyap (QUIC)" <quic_gaurkash@quicinc.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "andersson@kernel.org" <andersson@kernel.org>,
 "ebiggers@google.com" <ebiggers@google.com>,
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
 <20240617005825.1443206-5-quic_gaurkash@quicinc.com>
 <ad7f22f5-21e4-4411-88f3-7daa448d2c83@linaro.org>
 <51a930fdf83146cb8a3e420a11f1252b@quicinc.com>
 <24276cd6-df21-4592-85df-2779c6c30d51@linaro.org>
 <9dc6cece90294657a20384b894b9aff8@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <9dc6cece90294657a20384b894b9aff8@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/06/2024 00:02, Gaurav Kashyap (QUIC) wrote:
> Hello Krzysztof
> 
> On 06/18/2024 11:17 PM PDT, Krzysztof Kozlowski wrote:
>> On 19/06/2024 00:08, Gaurav Kashyap (QUIC) wrote:
>>>>
>>>> You may perhaps only call qcom_scm_derive_sw_secret_available() for
>>>> some ICE versions.
>>>>
>>>> Neil
>>>
>>> The issue here is that for the same ICE version, based on the chipset,
>>> there might be different configurations.
>>
>> That's not what your DTS said. To remind: your DTS said that all SM8550 and
>> all SM8650 have it. Choice is obvious then: it's deducible from compatible.
>>
>> I still do not understand why your call cannot return you correct
>> "configuration".
>>
> 
> ICE version and chipsets are disjoint, meaning for the same ICE HW present in SM8650 vs SMxxxx target,
> SM8650 will have necessary TZ support, but SM8xxxx may not, that is the reason I was trying to indicate all SM8550 and
> SM8650 have the necessary TZ support. There might have been a miscommunication there.

No. Read your DTS again.



Best regards,
Krzysztof


