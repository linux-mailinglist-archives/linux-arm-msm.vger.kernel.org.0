Return-Path: <linux-arm-msm+bounces-15833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8A1892C50
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Mar 2024 19:11:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5413B2832E9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Mar 2024 18:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2729F3C484;
	Sat, 30 Mar 2024 18:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UwWLEZ7e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED113BBC8
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Mar 2024 18:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711822261; cv=none; b=JWP3/hQ1pMDtVTsfULirTnHXaTQrRMeGISrtGe1bzjHLIoQFDZ5KgnMPNRjwyJIV6nFvrKQJoyjb6NCk3+HAcral0jNqtpHywkmb2xrw/0sRtIjEC2cxPl+nfTpOCOnB0Mxlg55K0E1AQTBGHETxMhkVfKwVMgVfP4Rwpij+fRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711822261; c=relaxed/simple;
	bh=gGWtJStY0jzHlXUNZ/qFEKVUAZbJEmuy2Rf+iVSRPpo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pPvGk8tjhTaoVqrMhCKm1ukJffJ5q5xBPO5XHkWTP/2426szUyaGeRsZATkRXiKy1kHX/pTkQmz2mxrEoPlIzGA1PbqmkXIfp6obsFrYdqyoKF1cumYEyTC91uzsd3nfIv8BltQFmtT+9ks9MlFOy1ZjTC1KebVVBl6/i2jgP38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UwWLEZ7e; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-34175878e30so2228546f8f.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Mar 2024 11:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711822258; x=1712427058; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=87ffxS2Z4k6pRWwiORZe6AOO57FJg09xK1iXk/x6q88=;
        b=UwWLEZ7eVXbJTXRBz0PJCBT0pAN1ONKhOIoi5iZ0KywaZiMzwYFF/QTeg+5wA+vpr8
         DejMWA79w6qxypNy01R9GuaS5nM1dHy54m13IeROW3SA6hbmIk+jCLSSaZMaNJkExPTP
         A9lxEDe1Ur62DLzNi0NaAPGpou1ggx4ecwqzl4MEc4ftaLef4f4jYkigexWa19PbspR8
         AH3S8cnMhrYo9S6n3ZJsUq3Jdf0UqTN0bLWffzXNSHfcZrKuouNtFmuaS6n6SMcKVzqQ
         jcB4Q+Fk6HwjIpLRB+ladmM7dqhPbyN7bURebl2TgBykwYe9J5r8nmKmmKkdHGMD4ABM
         YQFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711822258; x=1712427058;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=87ffxS2Z4k6pRWwiORZe6AOO57FJg09xK1iXk/x6q88=;
        b=L9Lj1mWCC4/pmm9gNIqp1ntcpqcW8Etub9McbCFMeH0Adl8N8cAr2IpjvFp/PMt13B
         AbaUkRkJHbz6gxXVxRGhhxkrdEufp8rc7MffqZtBI3CtcrCMoL/du08BmeuNwKhquGbI
         i3wJcHEAEMTHJwHVesnKKjdf31F3/UjzYhBUJvMEhviIuqv4B6CSPOUJrdysCKLgfMgE
         mLrmxXesC+JhgAUdQHLNuNfOZfZ7fkExrT/Xv+KV69hl83+qHejjq3BTCvKJrzZRCgSz
         yeJjWSgkvbfjvjFwXtqbL09iIwiwfjUQMfNPn2+rcO1wt3eU1IJYNlpu6v336t8gJKWW
         d0xw==
X-Forwarded-Encrypted: i=1; AJvYcCU95vat2sOch+Z3ZZQz38sIuYN9/Dxra4Ltv296/91tQ4d4f2jBCYr+S5LjDXjOoIzAE6v3wHa3q6lJZJEc+B/BHUKDMY8a8A8VeNCjCg==
X-Gm-Message-State: AOJu0Yyk1PyP9rjZmul64iZNl2xfndJLAmlyaD83BxtPfbJU01+/UTt2
	FtwE/Xd3ow1sjERrGI/qjijNXALp7JwKWn4LaGECXcei6HIrwl4t+0P7fT07+2Q=
X-Google-Smtp-Source: AGHT+IHSf24MHXCFM2oQnqc68fb0JfkbU/gQmTyhVXOzuBlSPPZgAtBdkIdsxpek5LvHWlT7coitEw==
X-Received: by 2002:a5d:4a41:0:b0:341:cf18:70b3 with SMTP id v1-20020a5d4a41000000b00341cf1870b3mr4563234wrs.27.1711822257669;
        Sat, 30 Mar 2024 11:10:57 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id ce8-20020a5d5e08000000b003433e4c6d43sm3312954wrb.32.2024.03.30.11.10.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Mar 2024 11:10:56 -0700 (PDT)
Message-ID: <e1a013e3-52df-441c-b0b0-06b6a877f151@linaro.org>
Date: Sat, 30 Mar 2024 19:10:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: panel: Add LG SW43408 MIPI-DSI panel
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Caleb Connolly <caleb@connolly.tech>
References: <20240330-lg-sw43408-panel-v2-0-293a58717b38@linaro.org>
 <20240330-lg-sw43408-panel-v2-1-293a58717b38@linaro.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240330-lg-sw43408-panel-v2-1-293a58717b38@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/03/2024 16:00, Dmitry Baryshkov wrote:
> From: Sumit Semwal <sumit.semwal@linaro.org>
> 
> LG SW43408 is 1080x2160, 4-lane MIPI-DSI panel present on Google Pixel 3
> phones.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
> [caleb: convert to yaml]
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


