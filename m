Return-Path: <linux-arm-msm+bounces-19714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 124758C29CF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 20:27:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 431BD1C221E3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 18:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A70EB22F19;
	Fri, 10 May 2024 18:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OowvFwlg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C733F9C5
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 18:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715365624; cv=none; b=f3zgz1fqJSgInaKJm+iPdJSH+Y1xxRxDQ/uxFDPNMqA3CXIOR65HdXRE/4YnISEDzUTg3yvymwWjlny6KdN38aUmDGStwfKW1K/g2iQV4EuifwL2iYzVs7pcsYaAk6gFekRPq6gVtm9Z4NRGaGyEQFHI8DsbK2OFDr7bOl4wfPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715365624; c=relaxed/simple;
	bh=zU69VrviyyTyXAS1X5SYlcLjt2lhIY2ZG7HklPhkyDM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ket8G6qrIWJssy8lj00r9QVH5fmKZMI2f4hwSOHwdlOrwlmAfRPf/CrKrjHkfxUgqdePrq01qrTi5cMKKQbtDFW83lRRwrYLxJf5V/tdBf14a/J6F/6tCeQ1Xm9uS1bG2Q69pHoyjRZgFlHiLNO4W+qOs4P7NOud1JOReQuVur0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OowvFwlg; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-51f17ac14daso2835906e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 11:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715365621; x=1715970421; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YPId4kEVXJwBhwU8/+wYwyb+KHjvjg99K8h6cyNB8aY=;
        b=OowvFwlg8LoleDf03JelQ2TgMhGTMDWDSMr3VOwdFjLqWsRI9j8Mnne/MxwxmiRkS2
         AfSv29NyDurpNQDMZ9TJiH3ayA0YJpJ4V+bgP0Rjd8kl5fRxQr0w0lAV7QgxrrZzppkk
         hIbUrBkGc0YjA42hjQDbcy8/x7a+fcSHYNyNzkDxEMg+q7FfGBoqzEhwouiHCnLElVej
         ztRwFzj02ZNINfPpU4qHFJnf6J0Bqa8+aj2mp/k1SKiI/GxiHkv6gpI1ny+EGsDL0rmi
         ODR2IMMTTj1FSlWulfGGfCtVWQyeUQ6jjMsMSNdMkj8gQN2B4cFSNNUIf0U1rjX6CmsI
         ac0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715365621; x=1715970421;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YPId4kEVXJwBhwU8/+wYwyb+KHjvjg99K8h6cyNB8aY=;
        b=UT4N/V/ECeQ71qVg7K5GeYRX4XrYNcxS/90rpAFRnxU3jmA0Xqijo320QSBLKXyVTp
         W2YuyERs9BuwG2PLzXCRZVZkECaS2ToIe7MCMeqveODyPH7zR00kfM6/85suGEthhpfY
         XAp0NbxtScPRgj5lFW+Jc9NBzqhnb/vo5UgT14b30bqzc8CAxvCS0NoPUsmoQooXQt+b
         jn1/nXqnErQAV8S5eIec/mixlgtwax2rZadCNSpoY9p5KdgZWe82gpYHMzckHwtrL/Xa
         RhCcst8PVDTZ8rvpQU6jbvxdWbBj1CXOU/gaCq2lKvQ/qWOv/CMFbM46/DVOitYAidR6
         vuoA==
X-Forwarded-Encrypted: i=1; AJvYcCVQZIpho4rN4uFOFzCiFQa0pXXW3tZfSLilNyWLokJ8DPsqAV41A+KismvjGwPIbNEM9v6C5xxb8ajv7uSq1AnVDnrVg8saeJrTgWoqjw==
X-Gm-Message-State: AOJu0YyZsJ0VRr2hPxefzdZEVevGFnp9I2VK46y70VT2QCMOdqpBgjUg
	YflGBrn7J/N02H0rI8It2ThcYaOv1md3vD2OSwgOmeaXWKzjgW6XvhY4ccfiAj8=
X-Google-Smtp-Source: AGHT+IGADrAXj6ujpmJlPxCnjw9zd3gxwONJ4DeH58m5okaIUz/cI5rRGRui+faYzyP8/vrMpLyUpQ==
X-Received: by 2002:ac2:4309:0:b0:518:bc7c:413a with SMTP id 2adb3069b0e04-52210276505mr1828384e87.69.1715365620942;
        Fri, 10 May 2024 11:27:00 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502b79bd7asm5158841f8f.17.2024.05.10.11.27.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 May 2024 11:27:00 -0700 (PDT)
Message-ID: <fa38fbbe-e120-4e6d-ae33-f83691af9646@linaro.org>
Date: Fri, 10 May 2024 19:26:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] media: qcom: camss: Add per sub-device type
 resources
To: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, andersson@kernel.org, konrad.dybcio@linaro.org,
 mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil-cisco@xs4all.nl, quic_hariramp@quicinc.com
References: <20240411124543.199-1-quic_grosikop@quicinc.com>
 <20240411124543.199-2-quic_grosikop@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240411124543.199-2-quic_grosikop@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/04/2024 13:45, Gjorgji Rosikopulos wrote:
> From: Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>
> 
> Currently resources structure grows with additional parameters required for
> each sub-deivce. However each sub-device has some specific resources or
> configurations which need to be passed during the initialization.
> 
> This change adds per sub-device type structure to simplify the things
> and removes the magical void pointer to hw_ops.
> 
> Signed-off-by: Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>
> Signed-off-by: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>
> ---

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # 
sc8280xp/sm8250/sdm845/apq8016


