Return-Path: <linux-arm-msm+bounces-912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A34927EF03F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 11:25:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D266281101
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 10:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 576F919454;
	Fri, 17 Nov 2023 10:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GQXBO0KZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26DBBD52
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Nov 2023 02:25:04 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5099184f8a3so2649551e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Nov 2023 02:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700216702; x=1700821502; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xLXI9Xt4UVPpx5LWxP1RlOZuVkuXv/tUB5AZ2nCxcL8=;
        b=GQXBO0KZNaY1QoTPvqKxvNJMXzDpkBfTZLWLR9jo50ztS39gvl0hboAlp/Hh+usKaV
         4LULtBZD9Vt9tLa4U5YTRqLeZSDS5fEpQ8r95o9H/L9OKopTqEWWtybkvSGb0JWa7Yw+
         45yUjuHcA3Qmnm8TP5uBDqhxaa6zMvVsp3nYYAx1x9eBYpmILhs4zMs6TtbPWD5jqHqD
         CWo8UAYPw94CFmYQ3VRE/C7hn8lLEmRyDvtHoyycJXVQSpX52MMwFSMGZzWO+HlYA4kp
         JkDuG0lEKKkkFOU2IcNzp4BXZsKTQs6RjasR5LI44rWdoXnF1kk11GuYzFcg7Iq1mq8U
         WvLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700216702; x=1700821502;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xLXI9Xt4UVPpx5LWxP1RlOZuVkuXv/tUB5AZ2nCxcL8=;
        b=a2Q27xQKCrnXC++aUChosbUoJA7MPTcerqwoQ48eIcxXj43x+SZNSjmt5A4Pr0TGV0
         6StOS6ZzaI/AAORps0jwoSNI+K5OLPGcaJxm9TPn2+ltH4kQahnZCokq6laayjVQ6jS4
         tzfH7BEhNATF1UsCJ4KPEmnzJkcRGUxu+ns9zkNkf09fYnzzgSEmVq7zJNY4mj2ZxUfi
         FbqBihgazjiuHhsu2MR1mfzqlHk53rH0vK8F5HGWgHZ7yzZUhBYLfaMGvEjoYbxsQGXP
         FmvlQvIfxfY0FVNRRn4r44RE4yXCG+ltFIxBMlWMtRlz0x/Y5OKk/rxODiZMq487sRPt
         07ow==
X-Gm-Message-State: AOJu0YzYPTXOHMvBvsIazlhpQf5T6dp8qz8DyOQtvidC4e4e1JTqy9Aw
	YPlgLNUyLhwlJehvKlUdHeNuUQ==
X-Google-Smtp-Source: AGHT+IH8Fmec+7T4NatGDuj9tyynxLUtAtWwCu7h5QwDdtBaylwLKCJMWtXd/L4QlzJ8GhaQCLEkjQ==
X-Received: by 2002:ac2:5475:0:b0:507:9b70:1f0e with SMTP id e21-20020ac25475000000b005079b701f0emr12508111lfn.24.1700216702271;
        Fri, 17 Nov 2023 02:25:02 -0800 (PST)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id d14-20020ac25ece000000b00509447753c5sm181454lfq.308.2023.11.17.02.25.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Nov 2023 02:25:01 -0800 (PST)
Message-ID: <dce6ae40-1ed1-4a2a-83aa-283d0188a9cd@linaro.org>
Date: Fri, 17 Nov 2023 12:25:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/16] arm64: dts: qcom: sm8550: remove address/size-cells
 from pwm
Content-Language: en-GB
To: Tengfei Fan <quic_tengfan@quicinc.com>, agross@kernel.org,
 andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, tglx@linutronix.de
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, -cc=kernel@quicinc.com
References: <20231117101817.4401-1-quic_tengfan@quicinc.com>
 <20231117101817.4401-5-quic_tengfan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20231117101817.4401-5-quic_tengfan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/11/2023 12:18, Tengfei Fan wrote:
> Address/size-cells will cause dtbs check warning, because pwm node have
> not ranges and child also have not reg, so remove address/size-cells.
> 
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/pm8550.dtsi | 2 --
>   1 file changed, 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry


