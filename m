Return-Path: <linux-arm-msm+bounces-23603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BBE9128D8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 17:04:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C67D1C264A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 15:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D7293AC0C;
	Fri, 21 Jun 2024 15:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bYtJYBs5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056282D60C
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 15:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718982284; cv=none; b=jzjhaogsBflYXIdn0ED8yOj9tHjpeztozeIp6xzr6izhIl3J6U+zH3OSSR0SUoWlkZJloOoQDe+EPjuArptfMarxBjQbmvi/gDcGoPkCw4ptHgtaxJS/wvMFb1FEnG+4LrrQHi5zHo1vJOuc4Bkc3A/4sxPCyrMkMOe6J5010yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718982284; c=relaxed/simple;
	bh=r1fY6Qto3WnTSZU2EOR09gWAkNGeq+niwkknygan98s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WkNCs9gpveW74l43d0eR1d/XbgXAThs4FSyZKdMlMchLsZKkdSGFfSHJRcRh/659TzcvsZRZBA5EHKr8xyRjSinG/wUv9Pjs7YqMi5icVKsHiHt/r4F8u9p7WI3OfHvRcR+t7Iky94P6rBxVkIYQxhMSrhcnRvPkmHEkBJ/w+0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bYtJYBs5; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42122ac2f38so12806655e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 08:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718982281; x=1719587081; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dk28BPsKYM+XeiCl+KoyoYMQGxSVOU9MqtqG9sbIyVc=;
        b=bYtJYBs5BMxMNOMAHyHFLxuWzVyE5RTLhx5jE5urvkCjsudaGb7HfpNjrR4guk792v
         Z9NGtbOdewsH+tZPNQ3h3yjGY1XCAcRVOWqKd1u/mPbIR44njb/D9aiIkibpPJnWFNnG
         9BZoY+nmnNfZLBCNaQS76j59cfeXAmKvCmCxl5lPrrV703L7UjJBdDpF2ZRgKTa3BHy+
         de2GiWFN3XN4vo+akYLK8vixIWq5HcTPMZmbi6+LScnoVDdXq/luuNMHi5kfNFKHfqho
         RRnBclV5n4oWXZeG6wUakPqptrQ3PCDIJQpMp3CCcTqUvY93xR6UeTQdoAaXKbLLevlS
         GfNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718982281; x=1719587081;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dk28BPsKYM+XeiCl+KoyoYMQGxSVOU9MqtqG9sbIyVc=;
        b=A2aDdGABXGGH2JGPIBHX39Dnou+Mk1Oop7p4Wj05mA1rpQFcyNA6NnmzBpyzZjSIIa
         Q352xrDhck9JXAbVqbEv9p5/ug1UJkuqJ3N1e8AejcxRfAK/SkJlp6HLbQFBJ9BeFBKA
         CneTSQANUnuQpg+a1tOmQFmpWuu6U3WScB4Znip0pli4AmwKhxA1C5f4hyhGwLdZdrqf
         nET7wnwBTqj9Jfa4vd+vTlFR9ax6oei/0XWeVZP3ddYgYv5v7IEPDtESS75Pee6z0g2t
         IorIHn7B9dw1T2JXQ6toBG4kRPKqMlI+ryK3Up4QVB1o4VRKs53flses9FwQosjpRIpP
         pT1g==
X-Forwarded-Encrypted: i=1; AJvYcCU6MKD+HlrG8rhjIZfBJDhoRvTLqFV5TkCfTXPdt8hpv8YKeJZVmg+1TaGvNCweonysoVLolxb2jLG9pxKsJtzTBtDqvebpXBlBMFvYUg==
X-Gm-Message-State: AOJu0YxtWI6lGeNHls0kNW20iZo0uXppAo5u3aABuw0GTrU59hulWAK1
	RxZRrwR63p2lZXuChsggQbDmGyQqWKfT2Pjrf7S4C+7kWWF9Co5scx+9g4NtbGU=
X-Google-Smtp-Source: AGHT+IFWNqsQQw2V7TDsQkJB6YzliZ7pPGE+MbOl/MORssIwbIbZrQnCfksipOwhmW8zCnD1SbSoPQ==
X-Received: by 2002:a05:600c:4302:b0:424:7871:2e9e with SMTP id 5b1f17b1804b1-424862e58a6mr964945e9.6.1718982281416;
        Fri, 21 Jun 2024 08:04:41 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3663a8cba50sm1975992f8f.108.2024.06.21.08.04.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jun 2024 08:04:40 -0700 (PDT)
Message-ID: <20367ddc-926b-4395-97da-eb42344d3f6a@linaro.org>
Date: Fri, 21 Jun 2024 16:04:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/8] media: qcom: camss: Attach formats to VFE
 resources
To: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, andersson@kernel.org, konrad.dybcio@linaro.org,
 mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil-cisco@xs4all.nl, quic_hariramp@quicinc.com
References: <20240522154659.510-1-quic_grosikop@quicinc.com>
 <20240522154659.510-3-quic_grosikop@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240522154659.510-3-quic_grosikop@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/05/2024 16:46, Gjorgji Rosikopulos wrote:
> From: Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>
> 
> Video node formats have direct dependency by the sub-device pad formats.
> Remove dependency for SoC version and move format definitions in device
> which creates video node.
> 
> This commit attaches a struct to the VFE resources that holds format
> description, so it is much easier to assign them to the video node.
> No need to use a switch-case.
> 
> NOTE: The mbus_bpp is used to calculate the clock rates and is different
> from bpp which is the bits per pixel written to memory. We need to keep
> both values to not break the calcualtions.
> 
> Signed-off-by: Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>
> Signed-off-by: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>
> ---

Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


