Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B703322E827
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jul 2020 10:45:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726298AbgG0IoZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jul 2020 04:44:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726263AbgG0IoY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jul 2020 04:44:24 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8454DC061794
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2020 01:44:22 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id k20so6239258wmi.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2020 01:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mquzEFQTCDzUFiD/E6XrZsuM2nY2ZpaofKnrRJn7TJU=;
        b=izngoBJVr6YU42Qi+79yxroTAZe093DyX4rFmjXGEx2t9k8HIi41sUvftEebfxl5pF
         U3Z9PIRYY92ADq/aXD4lRr3+R8BqRnrffM5+eXG9OLLlQ30NkwfapLTGOy5h1Mwpte/Z
         rzU1MbdbQ5zyNjoirLn26OAM4ozt5mAz4ZS7AQUoXRjOYQTflThTmbR31mWCcKjvO5tv
         qsn+Y40qpd2X9fNd0ngiZQes9CPYxA0/Qaa83Uv7P5dauJlfKhRJYTDFr5FDTpp/+yN+
         I+SclRHTHwntAJS0LnabcFava1KRfSvIhuv/EwSqGbIGAB41o/4ipmtMLU68XfBGdUWx
         l8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mquzEFQTCDzUFiD/E6XrZsuM2nY2ZpaofKnrRJn7TJU=;
        b=Nawd9LkvZcCi1KwpZs8JtfmRc44tuA21yJyWQnkf7L4aE9aReXkfMamKZdQAaTZO+I
         VivEqWpioF95Dy6enjQdsdDja2+lnz9TE+EpdHWVSG0xpLHudovGXkGPXVjkpQF5HdeZ
         jTvDidkmIn8zE8zs9lD4Kw/hZEvOJCttFjz37BPOOqbiQAzWuEBqf40bJDhBRfbzeoeU
         x+mYtzl8VcyrDhTVmpTkBm2btNgmWS/D0t6tzLzBukxZEthEgtEofyY5ZrN8xyX6VazB
         gRfC7oSVL1igFMEMTkcoasMf6XGtm6F5nyLcA5NbseuFK45enKc95e+Cre/yBnP3gM8W
         BG1A==
X-Gm-Message-State: AOAM533M7K4JMTUh5CjFRl9WqnM6y336BQwvdfalpRaCpZOG1O1/92HQ
        VARJF9o5Hy2pvuk0E4JW+ZL6oA==
X-Google-Smtp-Source: ABdhPJxP3MNuIolJleE+j0/kg7aGhjRkp4KYvQ9FsoAX0ZNQ6gOzt7xWIDCNjtgqfjyfMdYJi+ncaA==
X-Received: by 2002:a1c:d8:: with SMTP id 207mr18616844wma.81.1595839461156;
        Mon, 27 Jul 2020 01:44:21 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:24ff:55c1:a76d:5341? ([2a01:e34:ed2f:f020:24ff:55c1:a76d:5341])
        by smtp.googlemail.com with ESMTPSA id v1sm11129411wro.83.2020.07.27.01.44.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2020 01:44:20 -0700 (PDT)
Subject: Re: [PATCH 0/2] Add msm8939 tsens support
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     Shawn Guo <shawn.guo@linaro.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>
References: <20200629144926.665-1-shawn.guo@linaro.org>
 <6615ee72-d222-b16b-df72-0f5117c3e7f5@linaro.org>
 <CAMS8qEWNrU64p1YeS2+G=aSj27eYgvdpEGGMb9syXmKYJciUUQ@mail.gmail.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <46b2420e-4c67-e9c8-f1fe-08c8c742f960@linaro.org>
Date:   Mon, 27 Jul 2020 10:44:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMS8qEWNrU64p1YeS2+G=aSj27eYgvdpEGGMb9syXmKYJciUUQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/07/2020 14:25, Konrad Dybcio wrote:
> Tested-by: Konrad Dybcio <konradybcio@gmail.com> /* on Asus Z00T smartphone */
> Acked-by: Konrad Dybcio <konradybcio@gmail.com>
> 
> Sorry for being (very) late with that, but I've been doing some
> 630/36/60 stuff. In case anyone's interested in the progress, I'll
> leave it there. [1]

In the future, when resending the same patches, please add a new
revision and on the same mailing lists.

Otherwise when using patchwork, it can be source of confusion.

eg.

1. With default project 'lkml':

pwclient list "thermal: qcom: tsens-v0_1: Add support for MSM8939"

1234899 New          [1/2] thermal: qcom: tsens-v0_1: Add support for
MSM8939

2. With 'linux-pm' project:

pwclient list "thermal: qcom: tsens-v0_1: Add support for MSM8939" -p
linux-pm

11523211 New          [1/2] thermal: qcom: tsens-v0_1: Add support for
MSM8939
11631843 New          [2/2] thermal: qcom: tsens-v0_1: Add support for
MSM8939




-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
