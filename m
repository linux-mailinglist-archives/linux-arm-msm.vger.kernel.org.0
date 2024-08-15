Return-Path: <linux-arm-msm+bounces-28573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FF39526DA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 02:25:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2880284912
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 00:25:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74963A35;
	Thu, 15 Aug 2024 00:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rDv/ElSp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7084A05
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Aug 2024 00:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723681512; cv=none; b=jaPwPRFRhSa85CKziWyv2cFbGE+wL5CsN50xkx2hGcUdU7EQBeycAP8tuYATtfR+JSiVXdAEe6Mv5o5vO2cIt1chedygmf7I7xBQa27ruwVsRlqlWsBs8S3IHInAdlm2vHig2fDAqBrlbc3+YY/leSBr5qFBuXMavgVF3cz8zUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723681512; c=relaxed/simple;
	bh=g6+dyTfaV4ejypt384XwkQLfJA1ttnYEy1lC+qK1r3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yy3mzKxxKotoMDOxnoJlw7MaiWdAghJ6PYRiSSbbbsaF01rd7XVp2OxTEY1mhCzHBXu5/+i+XT1KBZCWnV9KOK3ql+q7tV0JKHCNtog95uFUYLTix8NIh6nFnGOEHUCPb/JKqNKpLknmm6O1tcpH2IhVqF45BHpUDbFzxbTDQ54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rDv/ElSp; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-428163f7635so2112725e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2024 17:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723681509; x=1724286309; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N/0QdOsIFxUfrsS8J5sSBj2pcKHUSLNB+HboC0R4mPw=;
        b=rDv/ElSpxAGvF4j+qx6rEAm6ynQ1lcPvn/R5Jvm7a8ji5r8oQ9LpUpkLN+sLMTyZbo
         EE8pJLxpqBkyzkyG5VB8Jv9Y132YoDFdsAc6MBOkNmQ+KKnmlCoH/9tMzj8EoUmZhPlM
         juJqmxN5qQP96wArgc7pl07jimAJkk1SFb5U+oQ4A9U3JWFSuj4/1U2WReKNtIO1ZU7G
         l7fA8Foxjm1RhjXZ5WHh2VhgcpLRcwyjRe9I6KPNIASJpWOC91v3Cwk8JPZDH7gXna43
         4XzoKA44JDofkbWJ2UnvGQEwN4+/IMXZOcEOHZUy3/09oMPgUI2nwtSjOQLtx7OGYLHH
         Hbrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723681509; x=1724286309;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N/0QdOsIFxUfrsS8J5sSBj2pcKHUSLNB+HboC0R4mPw=;
        b=ADiJpIzrC4163Xcz7NQGXvjNadzDiTMpQ8A2mdy0pvWrina2zTWz9CtQDag3RpVLGn
         7XMB8fmsLEd2Yp0vCCWZyvi1WJr4Tak3HRZzeAYGeuSDQksBu+w2dUx4PHK9f/gFnzJZ
         bOrZxqK/6KZhbMGPYPJwu4R2vB7RoX4CUtY5n/UvLySAwthn4VwZ5bh7UZn4VyINK18/
         D1jHb6v3sNh/gqX2DfLLacmlfKec9drhraDKQvMVln+Jb0ECGEjPzABAZ8Drgn7TnJD9
         wvkMx30E1OwuS3odsGjFsl8R/w4FBp0RUiW3wCnRstGkelpzT9Q8m8xbj+zOUK1TeZOD
         GRCg==
X-Gm-Message-State: AOJu0YxEgt8Bbtfx6VY4panz63aNqFN2xadckLqCRBXBp5Ms47agRdPK
	IFwrtLeCg3/h1xZviaryTiDAi0x13hSYsAnqA/qrTVl0keiSr9qkAvCA9G9+mq4=
X-Google-Smtp-Source: AGHT+IH6OOO0/mqpv5WEBdqkxeeXkLkx+fI3KP1fNMpiF/1yOPcKF/57UJ/RlG4aNyCcyfEqrARPdA==
X-Received: by 2002:a05:600c:138e:b0:427:d8fd:42a9 with SMTP id 5b1f17b1804b1-429dd247c0bmr29414975e9.22.1723681509029;
        Wed, 14 Aug 2024 17:25:09 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429d877e066sm69470185e9.1.2024.08.14.17.25.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Aug 2024 17:25:08 -0700 (PDT)
Message-ID: <6ddaa41b-86cf-44e5-a671-fd70f266642b@linaro.org>
Date: Thu, 15 Aug 2024 01:25:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/13] media: qcom: camss: Add support for VFE hardware
 version Titan 780
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@quicinc.com, Yongsheng Li <quic_yon@quicinc.com>
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
 <20240812144131.369378-14-quic_depengs@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240812144131.369378-14-quic_depengs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/08/2024 15:41, Depeng Shao wrote:
> +void camss_reg_update(struct camss *camss, int hw_id, int port_id, bool is_clear)
> +{
> +	struct csid_device *csid;
> +
> +	if (hw_id < camss->res->csid_num) {
> +		csid = &(camss->csid[hw_id]);
> +
> +		csid->res->hw_ops->reg_update(csid, port_id, is_clear);
> +	}
> +}

The naming here doesn't make the action clear

hw_ops->rup_update(csid, port, clear);

"is_clear" is not required since the type is a bool the "is" is implied 
in the the logical state so just "clear" will do.

But re: my previous comment on having the ISR do the clear as is done in 
the VFE 480, I don't think this is_clear parameter is warranted.

We want the calling function to request the rup_update() for the 
rup_update() function to wait on completion and the ISR() to do the 
clear once the RUP interrupt has been raised.

At least I think that's how it should work - could you please experiment 
with your code for the flow - as it appears to match the VFE 480 logic.

---
bod

