Return-Path: <linux-arm-msm+bounces-25587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D91192B4D1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 12:10:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52B30281764
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 10:10:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99B27155730;
	Tue,  9 Jul 2024 10:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cO7XRAQD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271FB12CDB6
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jul 2024 10:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720519844; cv=none; b=iaWmfMfFo4Ro38gJ2z1YxLLwLr5Eh9DUaUM+F7SEyZk0lXe8yp8zMO8DDaIoPWYtQlJIHcMIWhKf+31WKwKX3iwyE/MoR1vJHm/apyDJuAeGG1rdl8iztmieCfPFQqmO2c9tI6k83xF9bPXXpJ2/Zopas3QIRYq6pnhXC1buEH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720519844; c=relaxed/simple;
	bh=NPDJQWFMBg1N7Ij6Du+SoVPn1EVzMY6sx/kDXOi+R70=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eIT5/hC+6nUR6bCQ7Fk6VW3UAve40VFwqJ5/62Puyfyg4rg6aREbpLu2slrjjDbGdRqQa6ZgZdsOqnrGhhYjeu91vql+w9wj1zqIRLXEwHFls11YVC6oDX7DaS2asyYGzIuOWTDFVRJ9HGdF+ZYCFSWIBAPvDt748YG1Q1m6QRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cO7XRAQD; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-70b04cb28acso3314930b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jul 2024 03:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720519842; x=1721124642; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nnPeUwagpX34GrQVUm/eQerepI0eGCCGd1FU50bUkf0=;
        b=cO7XRAQDPKe3qPpjgEUuULiFCnv7YEZBTsTRcm+kM2nyAQb8OfTgKsHz4ysoeGcHYE
         tuArtDrSnsUC7ylk1Po2f2C84hLkzePmdToDaY6mEYkbAaHQP/J26ET/VE0rjp+5POHh
         PWTDyk8qUgHaxD+8sPIqvxyDmgI2J0ofp6cxdJIErj2vsj7DH3jTupEzKDV2UmhSUZQJ
         /WzemXJfSMkU9mOpiaGAd+lTXL3AmHapukD3/IsZX1HmoCLVH/HExmfLuDhcrsg3Y3Fy
         cFDt3qXvvJw4u9bhVkAVBu9/yJtUg0aJ0URy7DIkqUvp00Q1rsdPLM5GvVTPNYKjvHXv
         CRWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720519842; x=1721124642;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nnPeUwagpX34GrQVUm/eQerepI0eGCCGd1FU50bUkf0=;
        b=WAH9961nN5kKQdel15FZWtTdrH3h1BUnYC89Xtsf1+YcAP6D8hLAO9flwOUpehG9zQ
         HtdIpUz72Gc35SfRdleC8cEiLQmCc2YozgNZbTTqfZ6ynKMxqo9L3Ufp4LS8dZscKl6I
         /Bakq0E5mEE4sOgszxBtGETM1Kdx9O56AI/+0/lH2Wa3y6u967+Tq+uODGyWQHj7KRYu
         ++CtjyG2pI0Jp9buTPba8zwIkCf1FhqtMTODamL/EmCf9Zhi2l9ZWWz7pQfGi0GU1+c1
         CiopiY6430ppSk4vI3KNKoAcjd2u1mwhaAZCqw2KqlGH7YZg+9qGYWI/1GNWpBFimI76
         95Dg==
X-Forwarded-Encrypted: i=1; AJvYcCXOuSPeVSkMqOn/AwwPxhW56UNnEMZahfctfkuTZxPMbEyLqkosEcRjYI8eKQllf3wssx7YSkGmM+Xgb3RvsPlJkMyDGv5bwjJ7ndJSqw==
X-Gm-Message-State: AOJu0Yye3F+veMZJw2wCXs1USO1GIl5PXfc6hTHHPlN5jp4J9v7XgZRE
	17gIDsO6ZKOXWKoFbnxn1ntUuvuSbB2hK/9cYKBEDLoqfsoKKzrKvFltyNh/V+4=
X-Google-Smtp-Source: AGHT+IGY1Pe1r//Dd07K6/Nl+QdtHZ9ZtoZxqKzqVdSu70UadlzYzvyA0dW27fLhNu8Dx+V1hklbLQ==
X-Received: by 2002:a05:6a00:2190:b0:706:938a:5d49 with SMTP id d2e1a72fcca58-70b44e02bbamr2756913b3a.14.1720519842470;
        Tue, 09 Jul 2024 03:10:42 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b43899614sm1465109b3a.17.2024.07.09.03.10.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jul 2024 03:10:42 -0700 (PDT)
Message-ID: <2b278a27-f527-448c-99b5-fc307d792127@linaro.org>
Date: Tue, 9 Jul 2024 12:10:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC V3 2/4] firmware: arm_scmi: vendors: Add ARM SCMI QCOM
 vendor protocol v1.0
To: Sibi Sankar <quic_sibis@quicinc.com>, sudeep.holla@arm.com,
 cristian.marussi@arm.com, andersson@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 quic_rgottimu@quicinc.com, quic_kshivnan@quicinc.com, conor+dt@kernel.org,
 Amir Vajid <avajid@quicinc.com>
References: <20240702191440.2161623-1-quic_sibis@quicinc.com>
 <20240702191440.2161623-3-quic_sibis@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240702191440.2161623-3-quic_sibis@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2.07.2024 9:14 PM, Sibi Sankar wrote:
> The ARM SCMI QCOM vendor protocol provides a generic way of exposing a
> number of Qualcomm SoC specific features (like memory bus scaling) through
> a mixture of pre-determined algorithm strings and param_id pairs hosted on
> the SCMI controller.
> 

[...]

> +/**
> + * qcom_scmi_vendor_protocol_cmd - vendor specific commands supported by Qualcomm SCMI
> + *                                 vendor protocol.

include the word 'enum' or:

warning: cannot understand function prototype: 'enum qcom_scmi_vendor_protocol_cmd '

Konrad

