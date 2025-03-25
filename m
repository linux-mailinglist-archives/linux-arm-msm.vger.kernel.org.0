Return-Path: <linux-arm-msm+bounces-52488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 048B9A70C4C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 22:43:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C08613BB01E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 21:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C901269B0D;
	Tue, 25 Mar 2025 21:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QrY6guO4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CBD269AFA
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 21:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742938749; cv=none; b=LSBIpI3JUAQMzu3z5kd8+djnMh3aF0myBRbE7t6vglAzSF2kU4f8uEY+Bk2iwLRWI4w26+GARu9Y+Hu9Vwn4WG6oaM6bR9bPYdcjnNwi9SzJqnBIBVWY3niPmVhFEIvt0cvhOmFTevmPfp6r066gPP2TJMp20+7EM4LoG+k02+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742938749; c=relaxed/simple;
	bh=/Av7Cs+KayrhjqQVeFvAhc1FGTigGOhOF01svNTvIus=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fTorhO/U07AttzXSP6rcV2aL6R8n1oUD5ilwQvDAczundfns+NyrcaouvjBh0MCn3VxjeOE2+01JHPYmz4d8P/BqZvlMC3j3na8i/sxB8PmUzjF4YLxwbmgu4S8H6EqqaA6p/LIvzU0ceot1iu8YzeVdxuk9ak3G8nXrqlXt3U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QrY6guO4; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso39230155e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 14:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742938745; x=1743543545; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xnMQy1sIVhjqG8H+P2Ah/U7DzsWvzK3schCpJEGDS6w=;
        b=QrY6guO4MSCbhtUAsvnLTopZBN1hnxhvumdYrSzzhufCRIld1u4Kfeqy6uLt10OewQ
         TPYAl3cQ16TAsE2qxnmpMb/aZDbBDMW0K1V7AFkvgjDSBmHMqPbulTcXck6UI4YeiyuF
         fInFIWgAHwdidLH83pEU7sht+PCrC20dNuQ9U4hOdi8fH6cm1Lo2VjoUIsEg/3LJdhcH
         ocDM6MGsUJjAO8n1k4H/xU0e6ymGApVRs+oQQ1hRsuoYkQ+XA23C119iGk9BuRYcfQ3A
         KwW0dhtfnlYSJ2bH6jQUlocQvCTRKF35qdUkODREzNdcvqMfsWhZQYl8Qp3chcb4baKU
         zsPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742938745; x=1743543545;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xnMQy1sIVhjqG8H+P2Ah/U7DzsWvzK3schCpJEGDS6w=;
        b=Tyjy0GxtfRmcZyQP/MG6DjWIC6bIXI/dTcesY4COMyGWEeJuEDYiGGONecSKIZYVs0
         uDdsyz9IMjO8UexX8LoEZi5S9mccx7EcAzDTcQCmMlcYfooYY2bDI3gPK6Yq7UcEnf66
         baLiRfORbm9C/DrVyiMqN5MuOAFRclPoujrBq9sSpqk6hlpP734sG+ZkLRZprTl3wc1n
         DAYbcom2vAP5OlYTbwFD+50CduOTFngXz+1QSOl/y/rN1km9iDw3wC+Q2Kgxwg+pvkNt
         SfUjX+ClH8VfOCiiRfigU1oVmgvRNUGPGeBt/CiJ6RhFmGR7YI3NtqTYkJlEdzf4w4EA
         bWBw==
X-Forwarded-Encrypted: i=1; AJvYcCWM70yrNhxAX9zUUfO54rjnx2r/LWphnXh7DMqeKVQAbhJuqeAKcZdNOm6X49H9hpS3abgAU18qhhlrXc8C@vger.kernel.org
X-Gm-Message-State: AOJu0YzOACMGftCi0HvxMWjhuLjVKMhaiW6i4xiscfBjdlr8JEkANnMt
	c7HwKeECfF5W5Xc5BRPl2xeNetyDvmhqT0sBIQWcd86SjCSd8vZyIttTcep4oDo=
X-Gm-Gg: ASbGncvR7HtT7qx8kV5HQtf1tB4kYyL44+1/tCH/hMtuo1Kp7LPVWrI6YdmSYXh7SJz
	n7IUzGwP8kQH0dwYx1wbf7M0tcjutCLTkYYnvPkAp5+uOfTYiAr2wG+Bx51V+TNYa5YN/dtcf7v
	zvpEi2k2oL0SFJKxCgAqXYz9mqv76vCq/xfiXFNYt03zrMLEBu5dSlSIXPqFSxA4xw73GvlboEx
	MqBIZfRwUbqaIqBjWA2To8oFJk4l5jTc7Z6k2CCZbJAbNYzmuRpeu1bQ5w+uNuP79O0nmaak9No
	yiQb13oqHouR/U3HFn8ukssrnbc2e5Dcyoox4zRP0iFSQwE+rgDwtNgz0EW2RrQ=
X-Google-Smtp-Source: AGHT+IEyyd8PC7FCDHlQIj4U+vOvGRq0sCf16YMi7BW8ixBJXbdk2VE9H7MgdgqHwWDw9UD6p4dY2Q==
X-Received: by 2002:a05:600c:1ca4:b0:43c:ec28:d301 with SMTP id 5b1f17b1804b1-43d50a3c7b5mr147764445e9.26.1742938745377;
        Tue, 25 Mar 2025 14:39:05 -0700 (PDT)
Received: from [192.168.68.117] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d43f332cfsm216861645e9.6.2025.03.25.14.39.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Mar 2025 14:39:04 -0700 (PDT)
Message-ID: <b993c7a4-ff3e-4e79-bde8-2b5bdf3f2fff@linaro.org>
Date: Tue, 25 Mar 2025 21:39:04 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/6] ASoC: codecs: wcd938x: add mux control support for
 hp audio mux
To: Peter Rosin <peda@axentia.se>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: broonie@kernel.org, andersson@kernel.org, krzk+dt@kernel.org,
 ivprusov@salutedevices.com, luca.ceresoli@bootlin.com,
 zhoubinbin@loongson.cn, paulha@opensource.cirrus.com, lgirdwood@gmail.com,
 robh@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
 perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, johan+linaro@kernel.org,
 Christopher Obbard <christopher.obbard@linaro.org>
References: <20250325114058.12083-1-srinivas.kandagatla@linaro.org>
 <20250325114058.12083-6-srinivas.kandagatla@linaro.org>
 <vmhrs62ygu2xozcabc6tgy37ta5qskeyks5j3ldponzfijicl4@nudcmxonq7qj>
 <4654f21b-bf61-4b41-b073-407fab4bff6a@linaro.org>
 <14b7f2cb-6f40-f8b8-b3de-fe99080e6e40@axentia.se>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <14b7f2cb-6f40-f8b8-b3de-fe99080e6e40@axentia.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks Peter,

On 25/03/2025 20:13, Peter Rosin wrote:
> Hi!
> 
> 2025-03-25 at 19:04, Srinivas Kandagatla wrote:
>> I wish we could be taken care in mux-core or even in the deselect api
> 
> It is not easily done. A mux is a shared resource. How can the mux core
> know if it is consumer A or consumer B that deselects the mux if both
> ignore failures when calling select? Mux select is backed by a semaphore
> and there is no guarantee that a consumer selects/deselects from the
> same thread or anything like that. The onus is on the consumer to get
> this right and only deselect when select is successful.

Should deselect fail if there was no previous mux selected?

> 
> I believe the documentation is clear on this topic: "do not call
> mux_control_deselect() if mux_control_select() fails".

True, the documentation is pretty clear about this behavior.
> 
> One thing can be done from the mux core, and that is to provide a new
> API where consumers get a mux that is exclusive so that the consumer
> can call select/deselect without involving a lock in the core. There
> need not even be a requirement to call deselect between selects in that
> case. Such an API is what many consumers want, I think, but it is of
> course not really compatible with the existing API, which is totally
> focused on the need to share a mux among multiple consumers.
> 
exclusive apis would simplify the consumer side of code for sure.

> And, of course, someone has to do it.

Yes, I can give it a go and see how it will turn out.

--srini
> 
> Cheers,
> Peter

