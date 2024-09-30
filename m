Return-Path: <linux-arm-msm+bounces-32763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C05FE989F41
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 12:21:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8D4D1C20B56
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 10:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53F71188711;
	Mon, 30 Sep 2024 10:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WgplqV6r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFA421105
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Sep 2024 10:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727691684; cv=none; b=lfb61NCTvOy6ainafDaM8FXDGgteTlSELlFOdkQH/ZN4pCSUgIWuXZimE2t5Lr0Gf4Qh2JJjNSR1gE7rdGNEISmWDhD8GfofK5oF+2GF3Rcmg3tlt2Wcu8S5Dfm8U08qgCvAwWspHFmdYB4o/Z1QI7qSOuOzMpaz6sl8IT/3n9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727691684; c=relaxed/simple;
	bh=gc+uLrwdpxTyQ+RNbZJMYDfXg9wqIwuTcRkGiZX+HHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L+9MuQsb2Ul26vBAQhNETM0SSwR48KTP1s5Do9gNOSUVjv4HxQrxJIaZIPzgJtoOrc8GqdHzKROEN2+vdWaT716hjZMGGQ3Pb7jCAs53SVRBAIsGoso4F7lj+Spk1owcKoKXzQIgpAekKG6Sb9lAVgb+EgyOID8Iajb25R50vIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WgplqV6r; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a8ce5db8668so745054766b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Sep 2024 03:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727691681; x=1728296481; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OTn+eEp8BtwLb5wSv/YS39w7TOIjFMyAlAJxy5TdSas=;
        b=WgplqV6r0TnJupdW9GRkQqxgNhKVoD3WEbVgBzxWIZ3XenurOMoQoRgm8mfMWWBsgo
         vN3WoRuuCcYQdyQgzua6/erJMbOnkP1h261oyyX0tGAZQCyikx2znzomeOM+UraTh87Z
         ML9NqtzQCVIqUUnlCOhCwMg/fJ77fx7q5y6ZNI6TKMpdqP61KCwOEQWzYX86QgD+l1YF
         8V+/OgG5LJipu9QmGaswgUPiQdYiEWvWRTq6DAwvKrN5oIM5SfH1x3577mXG0QikaJGA
         DRUCtYhCPIhwKfLDciKPBSB3rNbKqlZqLKIfz5byX34tXUTygZt2Qh9EVLgmttNzVWeG
         u9kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727691681; x=1728296481;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OTn+eEp8BtwLb5wSv/YS39w7TOIjFMyAlAJxy5TdSas=;
        b=I1a9z2TjekYWKEUBVC7IPcAWsiopsJJVR01Eyt+N2V5vD03hpHELd61Bme44qYFPSW
         L2xUXp4vZetN1bFUs5lnfjNebBCenjaZBd1gJgtSNf+edH938VOsNT17Cudzg4j7VKKF
         NUeiXleOTvLgW3GKcTQkbNoutDqRERXExP3NtNNlruvmmUNSvS2R9NBXJlFehisxWXpv
         XJPzyN+CmZ4emP3J+GSr7ff73ItkJPIY6AtG+CV/yKjuqJOPKIeiPtIvRbdZhfHv299P
         vgzGONgUxDVWl9shsc2ua6nMP92w6RSo4MPs2RZGg5/4WN8dWYedqKu5OMee5zh0rCHK
         /IVA==
X-Gm-Message-State: AOJu0YxctA9d6GpdRSq5mUqbRbLMGsgE2HWG7LQJDBP3IqAgoeU5yo5X
	3izfb7Ph/zj37MqDkopgpFbizQSSA9moY5Upf0R7ffgi82T6gVF9TYuE++u6260MT7iFvzvs4nP
	etUo=
X-Google-Smtp-Source: AGHT+IGqmsRPDmYEJCJLIxq27ME9A2QHZJbPvw2S1Vb8Xek0EHlKtBZs6+vKRacYJGGh4l21tJB0OA==
X-Received: by 2002:a17:907:1b92:b0:a80:d913:be07 with SMTP id a640c23a62f3a-a93c492a39emr799327766b.36.1727691681086;
        Mon, 30 Sep 2024 03:21:21 -0700 (PDT)
Received: from [192.168.0.15] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c299aca5sm512531566b.224.2024.09.30.03.21.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2024 03:21:20 -0700 (PDT)
Message-ID: <63d9c790-39f5-4f09-a6cc-a45283524a01@linaro.org>
Date: Mon, 30 Sep 2024 11:21:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] dt-bindings: media: camss: Add qcom,sm8550-camss
 binding
To: Depeng Shao <quic_depengs@quicinc.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, krzk+dt@kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@quicinc.com, Yongsheng Li <quic_yon@quicinc.com>, mchehab@kernel.org,
 robh@kernel.org, todor.too@gmail.com, rfoss@kernel.org, conor+dt@kernel.org
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
 <20240812144131.369378-8-quic_depengs@quicinc.com>
 <b1b4a866-fa64-4844-a49b-dfdcfca536df@linaro.org>
 <82dd61ab-83c0-4f9c-a2ee-e00473f4ff23@linaro.org>
 <da60cf71-13a4-465d-a0ee-ca2ad3775262@linaro.org>
 <97e4f888-1ed7-4d82-b972-3e0b95610198@linaro.org>
 <6eadc285-f413-4bf0-8795-59ff19c734da@linaro.org>
 <6562a958-47e9-4a49-b235-fe8deba3c051@linaro.org>
 <cab95caa-9ffb-446a-858b-342939e80811@mleia.com>
 <4e94106d-5ca9-485b-8c51-c18dcd4e64b0@linaro.org>
 <b779182f-a963-400a-8fc1-2468710082d2@linaro.org>
 <a0f66292-fb97-40ae-9fb1-d79160e70bb3@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <a0f66292-fb97-40ae-9fb1-d79160e70bb3@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/09/2024 16:40, Depeng Shao wrote:
> 
> 2# Regarding the CSI supplies, if they need to be making as optional?
> Looks like there is no conclusion now.
> 
> @Bryan, do you agree with this?

It doesn't make sense to have those supplies optional. If you 
instantiate a csiphy for your board you need a power supply for it.

I believe I said I would _try_ to come up with a proposal for that. I 
should be able to get x1e80100 first pass patches out this week - 
including such a proposed fix.

---
bod

