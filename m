Return-Path: <linux-arm-msm+bounces-2008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 581237F8FB5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Nov 2023 23:19:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04FEA1F20CE1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Nov 2023 22:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AC0130673;
	Sat, 25 Nov 2023 22:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v+7fEEZ4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1FE5C5
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Nov 2023 14:19:45 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-50aabfa1b75so4313603e87.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Nov 2023 14:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700950784; x=1701555584; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q6SbKdQ7lQXf9800oYBDr332T2f2/hW1NVqkx7+W38M=;
        b=v+7fEEZ4yyetXadqibLeW5WG0hFgRCy0drvjuv4IXJWwRB8ae6bjk+ArOfDAtkjF+N
         LS4xhQUR+RC2GLSUAyNMu9mE3AracZQDVKgqenqTdOMZtWkwKkR9+biY5ZRNbLtZKkyP
         zqhDhlHQIpIhgSz/lBmfkKEuu6P+RaIOgzw9Igifidh+ouxb+w8IkiR0gm6xh8UkS2Fd
         ykCJrqA5JB4FB3lS+ddJJhK9jsefJ9Vgx1LD8p4rZgIlTv+T78OkSu985P/Y7+iiWv/M
         WWJSHPqZ0DnLX7POf7F4XNGnswYTmyyy+J9/YKewAR6U9Jk97NruEycbaRbygtTW4Y4e
         YJUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700950784; x=1701555584;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q6SbKdQ7lQXf9800oYBDr332T2f2/hW1NVqkx7+W38M=;
        b=hwediB7m6uGYJz5qBMEwqyjRWnipfpCwxBLFwnVguTbnsWu65lotepUjxdxjdH4XtB
         HIyirgR1X3+zxZDsCCp92Re5/VUiwbCq0gXjd36fNbKm6E7ZNtRPM9V9Rate05+9+/Lj
         1bZBjGihKOpMJWNUxA3F7bHxjUB7QToXrM6lo8/f3N+Qi9f0HgH26I6r6xewF5+5GWlw
         Iyi76fvuCDO3zp0EdzScTB2VacK5Q0jmOlBrXl5Sbnkb7K7bBRDKK3aeMsvAhmzAllGV
         wikt+2I62rEdxFIRgzFW3TJ4GDjvAcJZW3Qma6AExmCnmVpUN4s+MYhtKwYEpCocqMJC
         RzSw==
X-Gm-Message-State: AOJu0Yy4ibJjU3rI1hO1fsUrff71oFZqmbBDJQV/A7YOwW5G4EEiYnW+
	R4faEAhzVQXkBHNHMtOKdm+R7Q==
X-Google-Smtp-Source: AGHT+IHB4Ys5BBphGeNYSrirD0ZD/Br3ORRKCYPNfcsXTRgYRuytxPTCZDF8V/vxxlgYwR8m8BmhNA==
X-Received: by 2002:ac2:4e08:0:b0:50b:ab5e:2083 with SMTP id e8-20020ac24e08000000b0050bab5e2083mr1490504lfr.21.1700950783900;
        Sat, 25 Nov 2023 14:19:43 -0800 (PST)
Received: from [192.168.201.100] (178235187180.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.180])
        by smtp.gmail.com with ESMTPSA id r12-20020aa7cb8c000000b0053deb97e8e6sm3461236edt.28.2023.11.25.14.19.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Nov 2023 14:19:43 -0800 (PST)
Message-ID: <fc91cbb2-2c80-4467-873b-24d5ed606dd9@linaro.org>
Date: Sat, 25 Nov 2023 23:19:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/msm/a6xx: Add missing BIT(7) to
 REG_A6XX_UCHE_CLIENT_PF
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Danylo Piliaiev <dpiliaiev@igalia.com>, Rob Clark <robdclark@chromium.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20231121162137.60488-1-robdclark@gmail.com>
 <20231125191155.5375-1-robdclark@gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20231125191155.5375-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.11.2023 20:11, Rob Clark wrote:
> From: Danylo Piliaiev <dpiliaiev@igalia.com>
> 
> Downstream always set BIT(7)
> 
> Signed-off-by: Danylo Piliaiev <dpiliaiev@igalia.com>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
FWIW this was only introduced in:

https://git.codelinaro.org/clo/la/platform/vendor/qcom/opensource/graphics-kernel/-/commit/704575ac510a6de3ae7813a851c942d19fbcb20d

(around msm-5.15 / sm8550)

Konrad

