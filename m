Return-Path: <linux-arm-msm+bounces-19720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 379668C29E1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 20:29:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8CFAB26048
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 18:29:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C10229CF4;
	Fri, 10 May 2024 18:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HI0qHsCk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25601BDCF
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 18:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715365756; cv=none; b=XpQR+KoiNc97Oi+1X7vPkhj5tGTru069OmaBtWxbE5GD/Zr5EarO76Rl72qU284ZTfJtgf6p/SxyoqQbKDaJzrdVEYh48tSFJJvh47B2aynBy4bsP6OFKD54sfGrtclyUoNf22Un3e/tOhRw6TyZYyT4HObjxwuNBJcpxFH3W+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715365756; c=relaxed/simple;
	bh=yhly72VVKccbiMfx+cENIzjabu3cOQqm4EBPf6OImHk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=llWgR7J4GDgY/PS2rp5qRhH6Q1oJsu2FA7o0srqfi1xwAut28xnFEehEdiiKPY8l7M+RdIvjbPSvVEoioyZzWpCumnHVVOUCgDxTxQED9HMAPmss8l002C3aYgOkyJFXeHHc5rldIWmcwx0QgCoaNrlyj8EhfHNjcxS0yCqu8Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HI0qHsCk; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-41fd5dc0439so13382005e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 11:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715365753; x=1715970553; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VCkEuSVJYt7RlOhxbLR5g7TF908FVYC7+hF9WOPRXWM=;
        b=HI0qHsCk5r30yp881wB7JWXsfxPUAj3VOX/voVNn/WNWAsS0s45pxAYmww5CmA5PGs
         OrFXzbq9qIfegaGI2QXwpa2Bmx/zRKOn3ghJ3E1BU9r9erJy62FpwpPdlRAe/1ykoeuH
         8iSJA/yvzcMgA0olZHD5gIiNs8XaV22npO5huOnygBaAfCeDfkw4DJDjUkpHmYVI1zRE
         F77lMLqfamaVVuJqleHitr+ZCLx7w2PvFDsTRdbhgKPsygQBcBheYIQORO0cmFGzM/DF
         c/QtES8eMzhmCxeI5Y5uNZScri4MwUwhb0arpexhjCzETmGsIeYSQQtvjQNqUQYJRmny
         Ukyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715365753; x=1715970553;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VCkEuSVJYt7RlOhxbLR5g7TF908FVYC7+hF9WOPRXWM=;
        b=A0XAlEDyF8TwbLmZ35zoVV3YH+iHUPooSjI5HxzyHmkAayBreQ4w8HCyPpkcsQFrxm
         Wm+A1aHZvnDjSxRM94gPj5aGwyWH9Wh8Gov86TYkzVdmc+nL8ITfMtbKPc4Lz8VHi7YY
         iFOQPdpnBEygoCzB2BlbzToH8L79tcUxR9FjSjt6D5Wm4q1v4xjX3bq7Xb0ZGxrqey/u
         MCzEZftp48y4zN0lPOYaJm7aKDW/kr/vahGXFag84Lud4NXlSrxwiFywyELZEfSGBz/b
         Vv6Qm4H362A/xTmde1xcjLUMBGlEDx3YtERYxyaLptjBrvQTmL8HBBr5NwrbYoYHfAnY
         ZmDw==
X-Forwarded-Encrypted: i=1; AJvYcCWbD0yH3OSF+weaDsuuHx7yGJzRc5ccjKk6dv2Gcyu360deOcndL/awEIOjY+buDMcEoPiJE5ujGK5pVVLeI/60vKKnNddFu9awUbOHvg==
X-Gm-Message-State: AOJu0YzLD/zW+hdEBmB01SuqDIQNg5ckGo3OuOD7lPXCXALgXDx7Hg3k
	KGZC+oNygia0qVux6Zu1ZbYDwIsvQxka4CbrErAe3yWAGFSfQouDOr/m5AYovFw=
X-Google-Smtp-Source: AGHT+IFMY5QwRraPUNoFODyCy49WmKXoIYe4fMvQ12aEK7Q/OPD1O/i2IEjle0XXbyyx7xn6ySqLyg==
X-Received: by 2002:a05:600c:1553:b0:418:f307:4b82 with SMTP id 5b1f17b1804b1-41feac5a6c9mr25078535e9.39.1715365753179;
        Fri, 10 May 2024 11:29:13 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccee9292sm72666245e9.37.2024.05.10.11.29.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 May 2024 11:29:12 -0700 (PDT)
Message-ID: <dcf82105-76da-4637-aff9-0c7aa8ae55d8@linaro.org>
Date: Fri, 10 May 2024 19:29:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/8] media: qcom: camss: Decompose register and link
 operations
To: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, andersson@kernel.org, konrad.dybcio@linaro.org,
 mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil-cisco@xs4all.nl, quic_hariramp@quicinc.com
References: <20240411124543.199-1-quic_grosikop@quicinc.com>
 <20240411124543.199-8-quic_grosikop@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240411124543.199-8-quic_grosikop@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/04/2024 13:45, Gjorgji Rosikopulos wrote:
> From: Atanas Filipov <quic_afilipov@quicinc.com>
> 
> Split link and register operations.
> Add dedicated link callback according to SoC identifier.
> 
> Signed-off-by: Atanas Filipov <quic_afilipov@quicinc.com>
> Signed-off-by: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>
> ---
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # 
sc8280xp/sm8250/sdm845/apq8016


