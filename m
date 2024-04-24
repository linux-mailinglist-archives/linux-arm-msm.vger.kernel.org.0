Return-Path: <linux-arm-msm+bounces-18498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D2D8B144D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Apr 2024 22:14:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 879F31C22644
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Apr 2024 20:14:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58E6E13C9C8;
	Wed, 24 Apr 2024 20:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b3OhA8z5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B586513C9CF
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Apr 2024 20:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713989658; cv=none; b=tAQnC004K97bvtXyx+zOiMUYSbOF8rfe23B5Vbfp80zmbh8wwIZ7JFa6kTn1+j4Z1HrHE7g52p9T4UvOlJBX5Je0GzSJR/DfOTuxg4bve244WBcoEYdlNYbAkeWzBwpneAtByPcVlLUV1F/p03kwQ2iojliN9ZBcCVQnJVmwk0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713989658; c=relaxed/simple;
	bh=5juKDdGEYxNl2ENPjsF/4a/Y2iZb9ON1oaGj0sw8O/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NNctJ3iZZqVanhyMy9j1q8fP0ko/S/N7hTys3QT1NzUPMVi0R/A/q9LEG2yEuNimRMP2Kd9x8Yo4XwFh6eFAkNsPSKgLvRdF47Kyv7Tq6Gog37fGExlh90UBvP/+IGnUcOzkNau+v1Qa8wDQbJuWCgZck67cX7weALUVnSldZbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b3OhA8z5; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5196c755e82so263667e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Apr 2024 13:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713989655; x=1714594455; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rcWOpWv1JwDPxWKBqvGmsKPJY5XCaFq86YjpwkCYxAM=;
        b=b3OhA8z5o9t6l/iMUxzeCyqwRqemHy07E4e011rU7DnEm5rKwB9+o6rHl8RRvhGeFg
         jH7DPkXESS0e2OiVgQ60TiafxmSCGqDHLQdfVHu9xpmOGBbSlhwKabDDJE04JbEaI5wl
         rUAg2eV8pJH20dV2PYeSkPfwTMGeH9s2aeXEFGlKAMFUbgkGw4UoFfXyzqdnuWYNg1p9
         qNY3mOLZxDD/4ERo0M4IH1g6k7gHdTpbJkYxhW1QCtV7Ds1kuRwSFtk5ZDmTBO1rbNgG
         MUteWEH83DJguTX6h9XzCSwB88l06OfYN+X/o0F/iGzkr6xwCDH5dFd535tJrH6W/dgS
         EW7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713989655; x=1714594455;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rcWOpWv1JwDPxWKBqvGmsKPJY5XCaFq86YjpwkCYxAM=;
        b=a3YPccIYRqSorB021xxkSkiSE3NVvuxxln9T4uSazpHtsoNP7OnlnN1ZnQA4doVHnn
         GKATbOOi3syrrRZbbxOobIAIL6xHD9MI7Zpl3rML6oyrXJ47+mbW7AfN262FiNds9//D
         p5YvySYhF3Om0gWBgO2hrsA5+Ifojmeu9uMWG0khypt1KbeJI8VTof+z00hrKZczS0SM
         fnKA9XqqFeTz483c7gnfwHJoAhrxWz/bc0T76wwJXvpmzCoifVO+6MuERGbRp3Q9eErn
         3t1xKjCY5Fxy7sbL5tgvwSkNGw18r+S4Fm/cfBQ6hNVrktjIaBn8mVTLArRTdoowanGC
         SG5Q==
X-Gm-Message-State: AOJu0Yy9CSuSkBqQ+PKcnXQPgz9fUJoVnU7r0BJWqqjT2go1bGFl71TL
	Qpp6742kEr6iTCjT3EtqhlR/0xY2m4uGUFYmxN7Dd3KrPzvPaFcQGcmn7u+/jsg=
X-Google-Smtp-Source: AGHT+IGKFpuv53xz6smLPRnAcOKCBqQKU3AL5w75zZ1Vfp+dTl2SO2Y83PaVVYHYOotaaRh+b6uWJg==
X-Received: by 2002:a19:ae0c:0:b0:518:f697:fac with SMTP id f12-20020a19ae0c000000b00518f6970facmr2576684lfc.18.1713989654992;
        Wed, 24 Apr 2024 13:14:14 -0700 (PDT)
Received: from [172.30.204.223] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id v19-20020a05651203b300b005159412ab81sm2517926lfp.216.2024.04.24.13.14.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Apr 2024 13:14:14 -0700 (PDT)
Message-ID: <c4a1eb9c-5d20-423f-866d-883917c54a6f@linaro.org>
Date: Wed, 24 Apr 2024 22:14:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] arm64: dts: qcom: msm8916: Use mboxes properties for
 APCS
To: Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20240424-apcs-mboxes-v1-0-6556c47cb501@z3ntu.xyz>
 <20240424-apcs-mboxes-v1-3-6556c47cb501@z3ntu.xyz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240424-apcs-mboxes-v1-3-6556c47cb501@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/24/24 18:23, Luca Weiss wrote:
> Instead of passing the syscon to the various nodes, use the mbox
> interface using the mboxes property.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

