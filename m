Return-Path: <linux-arm-msm+bounces-786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 405107EDF61
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 12:16:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB385280E11
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 11:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A76AD171C7;
	Thu, 16 Nov 2023 11:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TSNxKRsh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com [IPv6:2607:f8b0:4864:20::c36])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23AD7D4B
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Nov 2023 03:16:15 -0800 (PST)
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-58786e23d38so362577eaf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Nov 2023 03:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700133374; x=1700738174; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=th8Cj+mO5ZqE4oT+uIcINI64qJyiQSbMF3c9mZmKXE4=;
        b=TSNxKRshYHGslR/rsQSfQ+5IRZI6Rl2JjTiS8Et/KbKDJFQXq5KL+UO2AkgA7ZbvN/
         Nn4HlGu3SFHT8eGG/BwfX98vZb0Yx+GU/YCr5WVNJrm/AQbDFh5hBJ+xZ++6Bt94okF8
         Q8oDrM04Urn9ZvxjfyoBcNarTzka0Hhy8KF6iCZ86jPCiThXvueesvXeMSVmvlNcH/Gt
         8qjm6ePYvJABLiOzlW2kUY5Mvt4bch9yURxv8niBK/3mOY9YkE7GNUvxnrq2ayt32F7j
         aacyYjYS6vlmNAn6U0xgxJ+OqniV9SHereRol11ZSNqHqfUzHvGmPtZt4O9d+I38FBy3
         l8gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700133374; x=1700738174;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=th8Cj+mO5ZqE4oT+uIcINI64qJyiQSbMF3c9mZmKXE4=;
        b=hthtqNkduY44osKHOyqh9/GVL3DQC2f+dRb8fQm6p1GlL+jgVbPVgPfdPufJUNDPTk
         x9aSGAY2juOHY9SWQ8kBv28i3i5a6CmCxioWN8GPA8RuZgPbwlzpp+tOR3NPOCvMF9Qv
         9nCnaoTdIMeNo1ofF/0wGFkI8nLESX4VGplH4rYmRStKw8H8ZDYggDBk6C24sjJe8x6Y
         G0quXach2X4wLFUlTUdRTTnS4Z+1qUgpo1vEyjOQCR9mG7K/67ymYhX8SK/QR+Apu0TW
         mlPCAivrCRw3AN4mcftV0t9HymKp92TTtXH6diUyre4hfGxHlvZsa64cV7rxdqHwERif
         1teg==
X-Gm-Message-State: AOJu0YzTEa/ChLiE/fBcqsLL15MJvWJyaZ6VYIK8gf2nB5lj5HZ7ONyE
	UZ25KHluifk9rsSjhQb3bZM6XA==
X-Google-Smtp-Source: AGHT+IFSWNcDMjr8E6irP+Q08pFVSG9V1Gb6j+9OkSIJrID9ggI0EyRh9jEEnDLPbVksyHfdMz7EbA==
X-Received: by 2002:a05:6359:5c29:b0:16b:fa0d:8265 with SMTP id pu41-20020a0563595c2900b0016bfa0d8265mr6709135rwb.4.1700133374359;
        Thu, 16 Nov 2023 03:16:14 -0800 (PST)
Received: from [192.168.212.13] ([12.191.197.195])
        by smtp.gmail.com with ESMTPSA id r5-20020ac85205000000b0041519614354sm4271080qtn.7.2023.11.16.03.16.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Nov 2023 03:16:13 -0800 (PST)
Message-ID: <4b8b486a-3bce-4b1d-b844-7d2dc499db0f@linaro.org>
Date: Thu, 16 Nov 2023 12:16:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: defconfig: Enable GCC for SDX75
Content-Language: en-US
To: Rohit Agarwal <quic_rohiagar@quicinc.com>, catalin.marinas@arm.com,
 will@kernel.org, quic_bjorande@quicinc.com, geert+renesas@glider.be,
 konrad.dybcio@linaro.org, arnd@arndb.de, neil.armstrong@linaro.org,
 dmitry.baryshkov@linaro.org, nfraprado@collabora.com,
 m.szyprowski@samsung.com, u-kumar1@ti.com, peng.fan@nxp.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, kernel@quicinc.com
References: <20231116093513.14259-1-quic_rohiagar@quicinc.com>
 <20231116093513.14259-2-quic_rohiagar@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231116093513.14259-2-quic_rohiagar@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/11/2023 10:35, Rohit Agarwal wrote:
> Enable Global Clock controller framework support for
> Qualcomm's SDX75 SoC which is required to boot to console
> on sdx75-idp platform.

No, really, this is just one patch, not three. You do not enable a
platform with one-by-one config patches.

Best regards,
Krzysztof


