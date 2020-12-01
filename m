Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE0BB2CACD1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Dec 2020 20:57:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392431AbgLAT4Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Dec 2020 14:56:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388704AbgLAT4X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Dec 2020 14:56:23 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 644C9C0613CF
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Dec 2020 11:55:37 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id a9so6884623lfh.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Dec 2020 11:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uleOdIY2dPVjuzMxg8MkWbINrRuRor9z1336VqiWwIs=;
        b=rjKwiAtdM07kxDIHbmBNBCSxxv7ZgDnJckuzF/SL50Bq4jMru817AZa80ptEQnwd24
         o06MPFT8lKB7zvRmqAnQi118Sds0KWLGdi8VKFs/HMa4hMSGCUXOYIQRedXwwWLpRzYi
         YZ9aAgc1lXBu7Pd1dwjW1V1ux/6kyMW8iDVz0yIbUm3rxd2AKqaWwxELG3jX+ggKR1Zo
         Pjg8OGf0discQPX3aIVa4YjJB2gFb7m5nUpTVoRC0MivRjSBaaiHS9D2xFIMdTGjSqTo
         uuhqVoMk0BO+1i3zMDGnmKaugdyYI+s2VJ1dnySGcxawHHCxJVdXsLOVnZxyS5Bt5Tf7
         hAIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uleOdIY2dPVjuzMxg8MkWbINrRuRor9z1336VqiWwIs=;
        b=q5IZjaMObFDee6kiogku0UGTFPKdrZce3c04NLekMcIqboiMFRG7bMwN8DeTSDKNOF
         7pDfeyNb1Z5287hRA04N7/Uv8kHuN5uE0GiCUKBDGQKt7VqYY8D1fgQKq0Yrk3PcCz0Q
         HAe1YxegKwfzE+UR6nO8buBXXrzU//fYBcqs01Uz/ZmiSI0rKAF6/OQYz8jD2K+vPeHJ
         a4QS3whqvMeRh/xZTLn6ODmmqKoTVf6Puz841Wf+TjthSWeiGKw3gWMTGFbw71jp5kxK
         f2ArH2ksTv4b9kKXYJJtOokQY72DlI/61TOXkb2gGRydby+TQSxdA30a7jsn9K/isZHd
         HNdw==
X-Gm-Message-State: AOAM533362M/0dbjdj89lF3fnUDSwZKVYv7KepPjKvRmtfM3OKEbjVXa
        nGhdMn91BplGTFQsF4eNGQ5Hew==
X-Google-Smtp-Source: ABdhPJxDo0Wz6SOFwxRNSZRtexgV/f1rIrUpMXsrSwVcg3iJQSPz3oTl/zUiVMQvOvX+kz+RkHI6QQ==
X-Received: by 2002:a05:6512:20c9:: with SMTP id u9mr2062802lfr.280.1606852535838;
        Tue, 01 Dec 2020 11:55:35 -0800 (PST)
Received: from [192.168.0.150] ([188.162.65.76])
        by smtp.gmail.com with ESMTPSA id x8sm64685lfq.143.2020.12.01.11.55.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Dec 2020 11:55:35 -0800 (PST)
Subject: Re: [PATCH 0/6] arm64: dts: qcom: qrb5165-rb5 audio support
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20201201153706.13450-1-srinivas.kandagatla@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <3c880eaa-32bc-d3c4-d657-76c058601c49@linaro.org>
Date:   Tue, 1 Dec 2020 22:55:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201201153706.13450-1-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/12/2020 18:37, Srinivas Kandagatla wrote:
> This patchset adds support to Qualcomm Robotics RB5 Development Kit based on
> QRB5165 Robotics SoC. This board has 2 WSA881X smart speakers with onboard
> DMIC connected to internal LPASS codec via WSA and VA macros respectively.
> 
> All the audio related driver patches are merged via respective maintainer trees
> along with bindings. Only LPI pinctrl driver is not merged yet, however the
> bindings are acked by Rob, so am guessing that the dt changes should be okay to go!
> 
> Thanks,
> srini
> 
> Srinivas Kandagatla (6):
>    arm64: dts: qcom: sm8250: add apr and its services
>    arm64: dts: qcom: sm8250: add audio clock controllers
>    arm64: dts: qcom: sm8250: add lpass lpi pin controller node
>    arm64: dts: qcom: sm8250: add wsa and va codec macros
>    arm64: dts: qcom: sm8250: add mi2s pinconfs
>    arm64: dts: qcom: qrb5165-rb5: Add Audio support

Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
>   arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 125 +++++++++
>   arch/arm64/boot/dts/qcom/sm8250.dtsi     | 327 +++++++++++++++++++++++
>   2 files changed, 452 insertions(+)
> 


-- 
With best wishes
Dmitry
