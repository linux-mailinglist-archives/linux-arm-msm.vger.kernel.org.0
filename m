Return-Path: <linux-arm-msm+bounces-9390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1773846101
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Feb 2024 20:33:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3DE41C24F2C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Feb 2024 19:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A379B8528B;
	Thu,  1 Feb 2024 19:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QKA9vuuO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAE785278
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Feb 2024 19:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706815705; cv=none; b=pwXiD905XvZe7rV3qt6emedg7wB6/WspdC7SBKRb2c+1feHxRwkJSE5MpGtUsdSWRu+DWXN5MHaf97CmyepISvS0S50oi0aZWH2SWMIUz4oom8LsSJE8ycdRr4SfY2AcC8eK1OHInwlN//zCQM+njhqcCMD9N2L37LS/LdFDlUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706815705; c=relaxed/simple;
	bh=w67+wJl+1r6/rvPqaLsQ2koCcFro4FWadLNXApUvNao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uGayaznkzSXS82Pgo9n9p0SGUOBYomrMpMTKLXjfPSFEjT78ly9ew04hgpZDEowiYNnD2IW/gggwfr7rGiIt99sEDJcr//1IqUpoYanouRjrzZwzFCVl9I5mX+eRMSaLooLQP1TQzacBmpRG/taNVkc18MC9GCuXla4dJ7hP4pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QKA9vuuO; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2d07f2696a4so6499551fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Feb 2024 11:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706815701; x=1707420501; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z3pufiGKUqGcs//qReBtrsJNDfeYD1hvVlavQxBb9es=;
        b=QKA9vuuOuaOddus3oWwB2VF/wz4cdxHJjEd6Ji1LNoLI6MlAwxCPr5SMNfrIA7fZVR
         EnTp++FfovxDDYaSzAyplkx3GKUE1Fwy/Z4aq1t5pNLymnMDA9qn1RpBuj3gM4wHPX2C
         9a5xPKvFbxZHu1Rbh8US2p+KiAOrIw6spIHjWxWDS4hJGrbxiBLRGydkP+LEp0jJ6yGa
         +e9kVeMEycgWI5Tzajth6Ix/WvJ7QfR/ZtY45ZW1Ev1AHFRE7f5/TGtZQwHZpP7ooJvx
         7U/PQFg+ramurD/z1+/WnKOMlCaKP2Y+0DI/5KaLbgTWHvI69FT2dD8EikIsxoPkUUWq
         Y0Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706815701; x=1707420501;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z3pufiGKUqGcs//qReBtrsJNDfeYD1hvVlavQxBb9es=;
        b=i2TAltsowHj5tgGOfL7SJ3ZmS1OqUjMWqrJo/2g9QhVBKXk2SramYT1ZBNknmgzBsT
         xUoD39FT2s72IAq5tRjUaa3x15WLkRhONyARcT/6zJ2mGPyyiTLuZC7M+OJB9MW/WoPx
         Rqw/IEOuIxytgFrnXTeQl6e36XxvOqWD7tvKdFm1vVYCBDzkobL5sG0FmYPYZI0zIbaB
         cH72c4o9a3Dg1TKwsdV8n008hnl2PDFU2Y0y8y/Wn9lv5LPxeVMjY2Ow388HlkxqHfP8
         nXGnEWALo9zHYm/iX8YmQ63OEzsHl4atYfKOoi9i8ne/BZna8ZZ3yOHoubWNZ7bJVQwK
         elSA==
X-Gm-Message-State: AOJu0YyOw1xbcfvZL2Xp1CWTYWS0g/KbLqCD50lyy+cAtJ8znSeGkcAi
	bfsN6SRmXCMfzUBBVs3rKPzZO9qHjBMP2LgcKrcZoPb3osiJ4pNulNgDzEPDyss=
X-Google-Smtp-Source: AGHT+IG0H3HRYL4jnxKlHPn78BI6dS9y1XE0+mZjF1uJrJ8TNf1moUPFIY5Jjevw4zM5BkPznILtYA==
X-Received: by 2002:a2e:7e07:0:b0:2cf:2491:b49f with SMTP id z7-20020a2e7e07000000b002cf2491b49fmr4069416ljc.40.1706815700668;
        Thu, 01 Feb 2024 11:28:20 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUkgK6AFFqZI+VFH9Fs5Aajv4J7zA5eQTTj/3nu9D1+E68eudW17EPXBAN7YBzX74iE7AlU+NdsgPfcv9CZu6QdAhMHSh7VDIA+6GwemY19zv2HVpPGYxjJpVJD8GOt2qPWsMuw1IxPLNPZVIMOZgnDt7oRUeAUp8EEhUWwU5FXu/AeWQ+rWSvARgn56jSc4FJAJk4yRZBVU/P+t1jiegcdRpFYyFxMXQDg/odWsYkigsjgKWt4JqmcgcZ+6cTSs+BAXZpqWZhSEPD7
Received: from [192.168.159.104] (178235179129.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.129])
        by smtp.gmail.com with ESMTPSA id h2-20020a0564020e0200b0055eed9cac54sm110982edh.12.2024.02.01.11.28.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Feb 2024 11:28:20 -0800 (PST)
Message-ID: <50cdd93c-66cc-46ad-9e86-b422d24e66b3@linaro.org>
Date: Thu, 1 Feb 2024 20:28:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/5] arm64: dts: qcom: sc8180x-lenovo-flex-5g: set
 names for i2c hid nodes
Content-Language: en-US
To: Anton Bambura <jenneron@postmarketos.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240130202755.2289952-1-jenneron@postmarketos.org>
 <20240130202755.2289952-3-jenneron@postmarketos.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240130202755.2289952-3-jenneron@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.01.2024 21:27, Anton Bambura wrote:
> Set names, so they correspond to devices connected to these interfaces.
> 
> Signed-off-by: Anton Bambura <jenneron@postmarketos.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

