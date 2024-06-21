Return-Path: <linux-arm-msm+bounces-23602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B6E9128D0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 17:04:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6651A1F27C76
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 15:04:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30B633AC0C;
	Fri, 21 Jun 2024 15:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hC0rpCk7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3E025762
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 15:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718982255; cv=none; b=fso4SnEmWdHneEvyeVNfsLNpwP+feErH3VRbnbepnr4ZZ6c03CA58Jmr6ANR44eIL975F3+spLqlDCg8kSYG9LjvotkoU/vMBRELElX4ef0Yhm+oFXbyxgg5Xak2UesBvI/7owr/xaM2WoM6SCtgUR9J/YovSytWmSRLgNl174o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718982255; c=relaxed/simple;
	bh=tGxhqw3mLbyQg4cUxLWRr6aTTDhcpAjGVSBMHcj9ves=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lbX722X9HhOlTDLNZDjc47hARTkg/IyoFaRDjyM6ra7dOofJ3M/ANVsfc0aeVGD+9+Tg6bFtRWcGaUNX8vnNAR0sdm9M6rT6CojytEKU2ZyQpSejZPU6EdyF4+Ui8+Zdf2F03qJNo86n8taSYAryiJTosLurj/AxyTy/wDLaPGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hC0rpCk7; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52cd790645eso688847e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 08:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718982252; x=1719587052; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6JvYMRLvuuvL4w7w35/VjTNcpNDV51nrNPfhIyrJ3tg=;
        b=hC0rpCk7Nd3LE9CvfjyPcZb3bzjmgcFkXmroF5UzWrb67ba/KI7bD5aQ+MUP2fXljF
         MuGzPMsR5EQZzhx9em8r+0EA+B3ltF48nKiFr0CEMNbPgyE1pbDEpgSHSQYiWuPL8FaO
         cF0I0i6Fo82emN0NUG6Ik5+3bisOVAmRBxxYE3gJH5rQMQ+wbcjkmWRnemj6DpinD3XL
         KrsKrPR47POfGZ7X00SVxs0CVn32puAXl+NxhMN3viYP6RZA10iRtiuClvLwPkjfCkHs
         GEbzsU2cDJMSB6tnM2GWX/Df3+7OZoRWsyuv7DicpgOlvrBRiuwwVaiIvnrGDSwxWE3i
         kBKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718982252; x=1719587052;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6JvYMRLvuuvL4w7w35/VjTNcpNDV51nrNPfhIyrJ3tg=;
        b=emNuSOEy91YpxJRgyRM49jjw5jAU8sIaO3LtAc2fyW4ETO5X9Eloyjwtkf6TT+5kIt
         kbV2ivw62eruWVfDQtLNOBrKWjFuaWKUB2ewt224Os8lyIN+Rgcatob4PX/syEOZZO/0
         L5FE6qOVi7Zdmyux9IomH2gXKmTUOuF7dGldN1tEslsVQR+doa0CknALiWYH5ylBsCM6
         jtbaMCCywDzeW3YubYFA0ZoqExDz5w6Twy/UnHO62KVZGhRcX0RznhuMHIbyS5PeQwQm
         2mVGgGnP4rJmdg+8xM6/CGGIKt47sMXMkVrT0Ko+YwxpLl4QQtGU21Hace2FP1OrQ8I+
         nUag==
X-Forwarded-Encrypted: i=1; AJvYcCUDRgM+PhVPS2DlPVeJvb1iJTkSpqQmQ3hFMwFLw7Z4ingivAKGzHV7xGvKbCAkHGjHymMBecgm9buDFYBHh7m0hxGcgDfQBaZnk2DZrQ==
X-Gm-Message-State: AOJu0YwqgdW6Hno/Or5hNrtS4VJJHcEP3/HO9dJH8hwwTuNp0qQDwI7p
	6jq81d9EjZRKPPfv/yBfSJpn/L06lbs3V9aLHarUhrQR8R2FJChNgQsxUNO0hOA=
X-Google-Smtp-Source: AGHT+IHsoccQ6WNTSCRvP7EXynKaqiN40TtOBGADHnLgqIHVRwl6CbCcueYYZRBTQP0LCEkJiNpa/A==
X-Received: by 2002:ac2:57c4:0:b0:52c:9e2d:2683 with SMTP id 2adb3069b0e04-52ccaa55878mr5449345e87.3.1718982251688;
        Fri, 21 Jun 2024 08:04:11 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-366389b8985sm2013455f8f.43.2024.06.21.08.04.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jun 2024 08:04:11 -0700 (PDT)
Message-ID: <46cb6ffb-68cc-4d36-81f3-f0be0fa6aafc@linaro.org>
Date: Fri, 21 Jun 2024 16:04:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/8] media: qcom: camss: Add per sub-device type
 resources
To: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, andersson@kernel.org, konrad.dybcio@linaro.org,
 mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil-cisco@xs4all.nl, quic_hariramp@quicinc.com
References: <20240522154659.510-1-quic_grosikop@quicinc.com>
 <20240522154659.510-2-quic_grosikop@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240522154659.510-2-quic_grosikop@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/05/2024 16:46, Gjorgji Rosikopulos wrote:
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
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # sc8280xp/sm8250/sdm845/apq8016
> ---

Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


