Return-Path: <linux-arm-msm+bounces-2457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6217FD790
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 14:11:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9F515B20F36
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 13:11:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D60701E502;
	Wed, 29 Nov 2023 13:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jvlFeAZe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9560B2
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Nov 2023 05:11:24 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2c87acba73bso88869541fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Nov 2023 05:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701263483; x=1701868283; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aWMf/klpzywMLzA0r9l0xYbzFZeq3FK18LVIlLuRJbg=;
        b=jvlFeAZetzKCkTXAvbY4n8Vj5w3ErB44NvRr5di0IzytgCiIJLSlNHWpTLHj2oJIcU
         isxS+ATxC3PG61uwSwtEp5BS01GVwFoGDDO/LbW3DUiOk97uKiGHo5ju+B1OBXR7A4qd
         3oh3BMZifxmebFSHYhd2xi5KX7/zrXWB4NsHBjX+U/MMfgUiDjYcE9+Cun68E6xg+ck4
         zSECJrhSPVCoWw4IJTyUJDpp2LZnCKx8vrBPv2MLublIGyAHBYToufJN2sq1CkrYi2PQ
         IU7W2HOl1fxfAuBUufIyJyUEJaluz0R6lY6NV+UzFPljeVPMZFKhHWeE8Ja9KP3eQQnF
         ehtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701263483; x=1701868283;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aWMf/klpzywMLzA0r9l0xYbzFZeq3FK18LVIlLuRJbg=;
        b=HVKeMqKz3DZYecFbfsY1MmJfOarEgDEnR+mNVOO/kReqRvBtR4+RdX8C+qsa57AFAI
         o0y9OPlUFaMA/oSOKNIJzvka1xTwADZfxPh1iSscdN50WrIJe/LO1oo08T2PXfpj/zeY
         LQL50VJgMvnVi2EThqvBi3WPK3wBon0g0/cxlm2dlEBhvpIwrP7W4QeMx+n3t9/GGaqK
         lwomH+iYAl4Ko+hO7You1ITQWsiY7ki3DaepizNoM8Ar55hxVuuVQW69r7Ei0wwbsfFF
         z/pY5rDVf5clVO8xhdUcqLD2LUVe8TllscjwBRj6HeWlHKbhthN/G5lP0dH4DBIbKZaN
         Jd7Q==
X-Gm-Message-State: AOJu0YzUNpTsnov5v3Cs9Uj754so84LvNNUzF7JEDOrL0kFzUKXXRCnt
	Yi+nej5jctZa9av6+cVRzhFSzA==
X-Google-Smtp-Source: AGHT+IHpvrnrEzzRn83d4IZPTHmaxwag88GIMbhkKF73ZmvwoY4hLd/VWHGxuvvDqQZdVuP/yVKQhw==
X-Received: by 2002:a2e:8804:0:b0:2c9:b84a:1485 with SMTP id x4-20020a2e8804000000b002c9b84a1485mr2743559ljh.7.1701263482976;
        Wed, 29 Nov 2023 05:11:22 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:38f1:13b7:9b7a:2d6b? ([2a05:6e02:1041:c10:38f1:13b7:9b7a:2d6b])
        by smtp.googlemail.com with ESMTPSA id i3-20020a05600c354300b0040b4b2a15ebsm2142988wmq.28.2023.11.29.05.11.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 05:11:22 -0800 (PST)
Message-ID: <3c92f044-d69f-4593-8aee-6d9b318b90e9@linaro.org>
Date: Wed, 29 Nov 2023 14:11:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: thermal: qcom-tsens: document the SM8650
 Temperature Sensor
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 Thara Gopinath <thara.gopinath@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20231128-topic-sm8650-upstream-bindings-tsens-v3-1-54179e6646d3@linaro.org>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20231128-topic-sm8650-upstream-bindings-tsens-v3-1-54179e6646d3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28/11/2023 09:44, Neil Armstrong wrote:
> Document the Temperature Sensor (TSENS) on the SM8650 Platform.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


