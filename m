Return-Path: <linux-arm-msm+bounces-88642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F41BD161EF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 02:16:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AEBA73029D01
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 01:15:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DF48265629;
	Tue, 13 Jan 2026 01:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TJvoLo1g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f195.google.com (mail-dy1-f195.google.com [74.125.82.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F537081F
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 01:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768266952; cv=none; b=XRYlgZftP2vlMK1o0c6VygWDlPAumDdRrRoXT97jPID1Q6SKOZqPgTiGZKd0UMkk267zBTlC1NlMbxWK2ZgqEKMeePVbAIywwAycwisfkneq5YqzS0Wo1UgOIT4gYIdkV7m6rQLlmIqs9JUPMeUtvn95PQFvVQFGE+j+0U+NRa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768266952; c=relaxed/simple;
	bh=gAZgSlkiYfw5eyUhzonXkubJPtzNocvWYTcK/lgE39Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cVGb2tSFwnsBfCfaCrqXOkMCWN0tPdq5N3vMSa57SsIJWBZi0UbVp/DGd9xcV+XvVR1KKP07gOxcoriCNHlCNPOGQoDe2ds8RVU+Vk2cmYBTOhCRbEysR2gbN1uGYH5JxNGNc7nrHmSsvoOX9evAH9SIMzpaQ9xDjVg8yVX2U60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TJvoLo1g; arc=none smtp.client-ip=74.125.82.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f195.google.com with SMTP id 5a478bee46e88-2ae57f34e22so6794494eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 17:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768266949; x=1768871749; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Xc46JlJ8geJJu3FFFqsm1fT7R0qCgtyg3WaAfisoecw=;
        b=TJvoLo1grwExGEqRlcxlQhL6g2pd3emdT22iajWBIzmSNKQILo+EYcyWX8FPsaV8k6
         OKqDJsIi4EfolZ4r8jhBBpia+fZpTAodCS9qm25Q8+8T2sWIchKo3MEAz+hBNedM25PP
         pEuKOPlb8/8nWlz4xdhV1SG9SGoeoJn0oyc3U0IFvGhpnwzHY8Gnc05NxQgbq/Hkxr6j
         mCRqoee+OtId6algxWARIpl7C2QXxuecMvqz1b4a2Xdx1qHL5z+7VaXnT0/ITYFIXatJ
         8+qZzDrsjtIciuAT7tbBnCjiiV+TtPNDkudYeh8VR76A7Ze5VU07yL495XdWBCZeRrLE
         JwqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768266949; x=1768871749;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xc46JlJ8geJJu3FFFqsm1fT7R0qCgtyg3WaAfisoecw=;
        b=k+QxH+QIqtdkWnfl5kViwtZfYlAG+7oz+CdKNXStZeE/9ljPfWKkXYwB3VM0Y1g2dv
         Cqsfig7F+inCq8BgfSe0BmMQJuD0civptwYY80VPO1P37QFs/vLlGxNvL4csHgfHAPxI
         WhiubEslUN6a+hgIfwFviloirUzxGAew+4SqTu2vQnrnmh759noxUj3Qu/1ywRVvJlle
         EL3IltM28FQ6WCuUC+bq0n2lu8n+eLa0Zlts52wpkBpMvQ4v5I7vMngOfkKvOAJEmM1Z
         t45EB+mojA42e3t6ECLYBcAy2v50/URwz4Tpq1sooppGt6skC8rcL+iYTI/9nuMuetQN
         CqDQ==
X-Gm-Message-State: AOJu0Yx30NGR/WvycSpyMMqdKSD7u6n+O++aE5CiR1bODn7/vsKdMgVc
	3pb5RnwCx/KQXns0XGuAitFWTaCeftPaWFxY2Tt37y5UDdYKkZpWQ3xc
X-Gm-Gg: AY/fxX6dnr8m/HgfpbXjF7ORc7fdBu52r4GOdzR6Bk33j1eBODQoBDkdi/Pv3bcmCvt
	efVvU+UM7C3//ndSEeLQqrsioZz8eORkZTJhbOh+wpmRgag82p11OX2JQshMeX/uvYWLI2Ura5B
	Lbq4rU0XMox1f8+Ophg1y5yKksGdz/xYXwiShi+ggL9eH2AHKBw80CKHCqp+vylSlErsUt+BPsg
	XudfRlh3qQKGkErF+cIa6wjXuM5ZZEUh/RVS7FC/3Esjwqbb3fE3IvdkIlOi7IoSAXrAZ8EACa7
	/v9XeMo2ol6sXkYsKPxl0s/AwV0y8p7dak6hiz8np8yFgDMHrPiQkuQn1OkB0dVa/+ONKaAYZfH
	YXC0PLxdh3jNlU0dcaYJCaVPm/hAN5VkaAiBgW52/7Mc8cMpkXB/yS/aeiRsZxiJBVVKzzcJbhd
	eAXKS1k22+NpmuWJpueOzTCPtTu+Dm6SIjWsNIOmJp+r+2H/unSRNbOizspiLwXoK8bUPMQPA=
X-Google-Smtp-Source: AGHT+IGbZjuwF7rU12AE5M0CXkptaF4zJFDGmstaaLSpfEpyurKooce1MlrulB2XCsBbxCJGKNaWlw==
X-Received: by 2002:a05:7300:fb86:b0:2a4:3592:cf6c with SMTP id 5a478bee46e88-2b17d208cbfmr16731287eec.16.1768266948465;
        Mon, 12 Jan 2026 17:15:48 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b17078ccf4sm17046883eec.16.2026.01.12.17.15.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 17:15:47 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <de7f0b8a-a355-42c1-ac3c-d0b5de754711@roeck-us.net>
Date: Mon, 12 Jan 2026 17:15:46 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: watchdog: qcom-wdt: Document Glymur watchdog
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>, wim@linux-watchdog.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 rajendra.nayak@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260111155234.5829-1-pankaj.patil@oss.qualcomm.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260111155234.5829-1-pankaj.patil@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/11/26 07:52, Pankaj Patil wrote:
> Add devicetree binding for watchdog present on Qualcomm's Glymur SoC
> 
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> index 54f5311ed016..f5eb648e2801 100644
> --- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> @@ -17,6 +17,7 @@ properties:
>       oneOf:
>         - items:
>             - enum:
> +              - qcom,apss-wdt-glymur
>                 - qcom,kpss-wdt-ipq4019
>                 - qcom,apss-wdt-ipq5018
>                 - qcom,apss-wdt-ipq5332


