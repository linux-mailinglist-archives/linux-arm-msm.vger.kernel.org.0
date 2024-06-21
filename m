Return-Path: <linux-arm-msm+bounces-23604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF1E9128DB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 17:05:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 369AA1F28377
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 15:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E56EF25762;
	Fri, 21 Jun 2024 15:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aMHQnM99"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593B657CA7
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 15:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718982301; cv=none; b=lquQHsLKQAlDLa6NnxoJl/82TvqUQlFRIFN3ZNj/af1lBzlDj/ZUs5sBHIsWjOoWGAdXcpWOQknMWd+Fc+WN7GrwskuwjBeOrSeaOxHqHFcRSpZ5T3EvqR5rcRz7OPbnOAOKem182bwT02c/+hDVaiEEM48xbmMHA+Y2iBV1yxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718982301; c=relaxed/simple;
	bh=DgLQ+IeB2sPH8dA5pdrtGV2KKq8Gz4mIWxEBjeL8XZw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CWs7wTKK5oBJxTJFHQ2sMmvx5jp0hTQOJIIYWZeE8IDeLGj42ZKdF/fVAIu7dv1g1OkJ9NxslUWsBLWL2QIbcxlC3qekYSfWbrp88sdOWGXPWapHrgiLHkJ0JeRocYjRKTMe4eOqXpySXwkq1mbYj03P8Y0vJUUc0XFBtT7TpIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aMHQnM99; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42122ac2f38so12809035e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 08:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718982299; x=1719587099; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JQKKgfZEnpGv7BDuZ4upLWGUb0nT84TylDrfXWTJUgE=;
        b=aMHQnM99x58jnO3YWXDmVwQnKQlTgVRgfESx8KlLbuntZ/Nncaii0dzXrX21RFYsFy
         sPok4C1gk6uTqnrpeFIjulYBj8svLa81oJ/pH6Fp+NiqaN/JhdM6YdN2ZV1iMEL6+IGr
         4vUL9GAA/QSgx2liCTgQbUdumI8YnfvPztFqf0GNE1m1dbLE3uMHzgZIV3fO1fu5z7bP
         o10XPRrGhfkqtyH4Cuf2N6Y8/IKsbbfDLOb2cRxClQbNrakah+cI+5QfU5QYMRStVdK6
         ZZiZHcbnTjb53o8YntRqB9njj9iLQyiOH7vPjLoY+PrZu0b9DyaR6/WCZ0m1cjbVQNNj
         Ci7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718982299; x=1719587099;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JQKKgfZEnpGv7BDuZ4upLWGUb0nT84TylDrfXWTJUgE=;
        b=ZF4vWacnA1BfXv7Yy2TmhGsFuHmkM/efaC3c6gNymNSkfalDeYg6UzZ0no816/JXzV
         uAujb/Lq9vCewXLV1394NuaHCJTcplq6Q2WC+2LV8Ky4Z0EvutKa5AtI8+QNU+BnV/OT
         lH6gO0bo4IyotIq3sE+puMuAHNZhgZkJEyE5oPcfqFeqDUB+saVpHu9nQ/yijlFd88qF
         aFS0SgfY2RTRWBQuugryt4YJ1QlA++OJXTrEX173UIZAwq5pzhMbQG+JSQ9BtV7GiMW3
         17+LOBAPvdK2Pmg4/su3Ld3GQJBN+XxTw1TgeH9otSjPqHOa0wFA8S5Pja0y9is78hse
         5Amw==
X-Forwarded-Encrypted: i=1; AJvYcCV1pFY/8pdJXUhGQd/LX+j7NnbJ0DO/5pJ3Zbja8H0N7F57FlDG//EQ/wvEG+/uBilg003mPEe/ETy1g2uKd+5QXB87yYcEgTSQ0wAloA==
X-Gm-Message-State: AOJu0YzSC7fLVsVzGTm6oDQ58lNO0H68FSi4TS4/wTLN62mvRt78W3ga
	RcaF5gyN89kKNnq90EzIuAhMr31DvQW8TOs4mrfZ2giifMK+0ZEQFtmSymjKc+E=
X-Google-Smtp-Source: AGHT+IFUIyImB0ZIrSXlC2Xd7dkKSDKHkd6AgtGypmfqBt61RUjyNyfJCXz6eJvy6Ju/rOHPAvsPTg==
X-Received: by 2002:a05:600c:3510:b0:424:84fb:9fd2 with SMTP id 5b1f17b1804b1-4248635993bmr773405e9.19.1718982298919;
        Fri, 21 Jun 2024 08:04:58 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3663a2f6af9sm2009054f8f.73.2024.06.21.08.04.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jun 2024 08:04:58 -0700 (PDT)
Message-ID: <8d0b4878-a29a-4e96-8885-232aeb2627d0@linaro.org>
Date: Fri, 21 Jun 2024 16:04:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] media: qcom: camss: Attach formats to CSID
 resources
To: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, andersson@kernel.org, konrad.dybcio@linaro.org,
 mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil-cisco@xs4all.nl, quic_hariramp@quicinc.com
References: <20240522154659.510-1-quic_grosikop@quicinc.com>
 <20240522154659.510-4-quic_grosikop@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240522154659.510-4-quic_grosikop@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/05/2024 16:46, Gjorgji Rosikopulos wrote:
> From: Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>
> 
> Following the example of VFE, move all formats of the decoder
> to camss-csid.c and attach them to the subdevices resources.
> 
> Signed-off-by: Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>
> Signed-off-by: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # sc8280xp/sm8250/sdm845/apq8016
> ---

Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


