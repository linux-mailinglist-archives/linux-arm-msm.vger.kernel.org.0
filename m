Return-Path: <linux-arm-msm+bounces-25586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D1692B49B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 12:01:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4BDD28529F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 10:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E57B0155725;
	Tue,  9 Jul 2024 10:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UTgAWk3y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A8D1553B7
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jul 2024 10:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720519308; cv=none; b=s2HJAcmZ8G6XyzMxfF3e1TzMQ8QDByKyfXsRM5sKO9vvJZT3veFFPytMDS97qM9ZnUvrtleL0cZz5c3mmM+t6tmU1MJ/POz+vqb2Zv0UkNCRC9kPGwaNYyqTgprsmZwdwgD0LYxz6eGrEo27tuzlRYv4kH5FFbnkpoyLto8aENw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720519308; c=relaxed/simple;
	bh=79uCAl4xNaP19LjZbLPv9ybKUIpkVrFDEzSafAfybug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZfCu+T81KzjURlLtsYiQtixydqAtOFyfKJDLt2ffhGwBmC1BJnqe9p2wtBFSqfm8g+WuXc22yMG2/BiT+VDAA/biVJb91m1o8WRHWZ8DDdoSjBexSTcXsAR0TCD9IqboNEIkpWC+wiepSXJdtiT1wk/Z+dz4FVjEPes7cbqnQ/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UTgAWk3y; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52ea2f58448so6272435e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jul 2024 03:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720519305; x=1721124105; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pjGwGtF2xRizI+srPedcBC0b7P2ztI7j/rQTVNi0iHA=;
        b=UTgAWk3yhlzwPI5H94v7cB9tXyD+SoGbYN8VVqSMmc34elkywwG+idyTTAQBjuNrF4
         kHLaEIToUTCqt9Bk9b6ZrUCGgF2i4a+VXljp+xbBfYYPMCMj/4ZxoMJMaVbaPEy4M1lP
         yUL6632N7uCFTy/DNbs+OQH95LzgISbc1s9OdOCEGWU1vp7Hj+O+cqCZlU6ROh9h7H6K
         CxRVSQ/nB4PMKZpsIrBbjHoz/wVl3DXRwD60Ep6P0Nxy3cw7qwfP3f0ztH3slN1eyEcK
         7UcgFx9ZHv2VVZ2lXeaPz5XNehqgXKtfDcB0usD9sRYvqicySHZwpkEBqG46JeNy9CFZ
         Mejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720519305; x=1721124105;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pjGwGtF2xRizI+srPedcBC0b7P2ztI7j/rQTVNi0iHA=;
        b=W6PoFUyFexkfvEolCWDepaGs8ZMGGF0vb4tTe31rLhuRO/Mmub6wUHdEHsqZpSJ5Tk
         lc2hOAMJ0wDp4NLXs/YsyBYF2XkH5rNUTKzXOWjY2U/mc8ogCmNx1Om/G+36JLeQFMqM
         cqhdKG9VgW41XRoGl/6Nv2ONHQcsifJGJh4B7Nf/2YIQMtgwNRCmfSukT2HFNeFJ8Wd7
         kvN5ONqZD/9nW/xE0SD7vu6J7D6pwRqjKk8QZWIrzegze2i6CcwYTNrSQzF1j0y3x60S
         eFPdUayorr6dy0o1Gn+kxSyPFShYY3cmzug3907AjQ/lqtZKyKfzBGKUOP3A6f/yrwf4
         hl5w==
X-Gm-Message-State: AOJu0YwLHYduHKLd0gz2NEqeBD4TWGyfslS5q4Jssz7SmqWk9cn9WByX
	dsBv4y3Jfi4tQLYDeboiUm8nqJWQWwTCQRSzTBr2UkAvJZiETbd5SU5FAhroyHE=
X-Google-Smtp-Source: AGHT+IFLXhBeqSztq8eF7bnR+mC6OL8ZEmPYgOhofCzxDKWUbMbIUlDUTp0ODWISoYGSEKWBNj89Dg==
X-Received: by 2002:a05:6512:3e09:b0:52e:9a4f:204c with SMTP id 2adb3069b0e04-52eb998e696mr1580790e87.10.1720519305159;
        Tue, 09 Jul 2024 03:01:45 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-594bda308d7sm860432a12.91.2024.07.09.03.01.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jul 2024 03:01:44 -0700 (PDT)
Message-ID: <5139c105-a474-4097-a59c-da158ee1145b@linaro.org>
Date: Tue, 9 Jul 2024 12:01:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/3] Implement Qualcomm TEE IPC and ioctl calls
To: Amirreza Zarrabi <quic_azarrabi@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 srinivas.kandagatla@linaro.org, bartosz.golaszewski@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20240702-qcom-tee-object-and-ioctls-v1-0-633c3ddf57ee@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240702-qcom-tee-object-and-ioctls-v1-0-633c3ddf57ee@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3.07.2024 7:57 AM, Amirreza Zarrabi wrote:
> Qualcomm TEE hosts Trusted Applications (TAs) and services that run in
> the secure world. Access to these resources is provided using MinkIPC.
> MinkIPC is a capability-based synchronous message passing facility. It
> allows code executing in one domain to invoke objects running in other
> domains. When a process holds a reference to an object that lives in
> another domain, that object reference is a capability. Capabilities
> allow us to separate implementation of policies from implementation of
> the transport.
> 
> As part of the upstreaming of the object invoke driver (called SMC-Invoke
> driver), we need to provide a reasonable kernel API and UAPI. The clear
> option is to use TEE subsystem and write a back-end driver, however the
> TEE subsystem doesn't fit with the design of Qualcomm TEE.

I guess a very important question is: how do we test this patchset?

Are there any open-source consumers of this IOCTL?

Konrad

