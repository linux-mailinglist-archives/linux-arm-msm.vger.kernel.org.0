Return-Path: <linux-arm-msm+bounces-6971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEB9829F77
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jan 2024 18:42:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFF1C28AC48
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jan 2024 17:42:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52B194CE15;
	Wed, 10 Jan 2024 17:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dvlAHQar"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B074D588
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jan 2024 17:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-50e7dd8bce8so5122184e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jan 2024 09:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704908535; x=1705513335; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YjMoBaJslgOWw0PjOC5tF8h+iRVzEHZGeY/kRdR3+Yg=;
        b=dvlAHQar4GJFXERCWrckZBE+0/jIA/JuiPUZ+D9LYW/z8sjehVt5ikv2jAbFLfGWva
         Nok8C+TJGceViM8MV0U+lAhcfu8ynjsb6UQzAUDclqxhzf2ue4+IwRUVlOJKz62j1FZv
         +u4vX70sDB7DFWtd3Bbqy3Hr1A0sqfMO0tM0h1WxYqcV1oeEUVF1oA2yFmeKoiPl3jm8
         7SLgfCVkKzedKP3Gjzp5BR/5zRcEUd3qiWQh2vB+T7YG5oGyaTPE86ld9q35MymA7R92
         PvnIK5e1/ok7F630RQk3EKGYOgInhF0Ezc1s01209DIkeKpII+m3cdiMmUGxXPQfzKtz
         neuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704908536; x=1705513336;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YjMoBaJslgOWw0PjOC5tF8h+iRVzEHZGeY/kRdR3+Yg=;
        b=DyW8umfUs1M11WEIr1Qx4XOyORBFufEd2nFm5oDZBqSduR9yxgU5aC7msRFXa/5L2l
         jS4dS0GG2/Nh9Q9sIu2XBsvAQhiSsjcZMauMQDGwrArLj0V1UZaexZTvEidEYVT/zQg+
         ZMy0l955L4/ehzYOUKx5Z4t69Re1V0E/9I0sBEax0Cd6BCA0dM0dYOw/eruBPyfwQSoD
         sWhE95Y1WEZL8HqdRP0V5OKACUlng3oM6Y6oLb109duoTd7jV8Y7i5PqO1mhPdOJJodC
         fUjeK4V+lGhScE5zXkbZqwspIi+yD73M6CgtMUDs0dWeSPTQ9fl4if2EIGv98ibV2dE7
         QJsQ==
X-Gm-Message-State: AOJu0YxLBZ/Fu9PFx90WeIwcfDon0gQigNgd1iQ5iZmULApuTxujhTrN
	LgrTbpceeJyYwdeNZvBtbsxHOAW1BYsIXw==
X-Google-Smtp-Source: AGHT+IHT1prjATADHPcha+6hRVeVajAEKA9n2RxWsP2L6hY0yEyK/iXNVOuhwOgvmCbXJi+mqMHvqw==
X-Received: by 2002:a05:6512:128c:b0:50e:30a8:4c8e with SMTP id u12-20020a056512128c00b0050e30a84c8emr682347lfs.43.1704908535603;
        Wed, 10 Jan 2024 09:42:15 -0800 (PST)
Received: from [172.30.205.123] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id a27-20020a195f5b000000b0050e8cd014d7sm741726lfj.16.2024.01.10.09.42.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jan 2024 09:42:15 -0800 (PST)
Message-ID: <2d200f5f-37a5-408d-9ca9-3137ec717647@linaro.org>
Date: Wed, 10 Jan 2024 18:42:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sm7225-fairphone-fp4: Enable
 display and GPU
Content-Language: en-US
To: Luca Weiss <luca.weiss@fairphone.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Andy Gross <agross@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20240110-fp4-panel-v2-0-8ad11174f65b@fairphone.com>
 <20240110-fp4-panel-v2-4-8ad11174f65b@fairphone.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240110-fp4-panel-v2-4-8ad11174f65b@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/10/24 16:14, Luca Weiss wrote:
> Add the description for the display panel found on this phone.
> Unfortunately the LCDB module on PM6150L isn't yet supported upstream so
> we need to use a dummy regulator-fixed in the meantime.
> 
> And with this done we can also enable the GPU and set the zap shader
> firmware path.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

