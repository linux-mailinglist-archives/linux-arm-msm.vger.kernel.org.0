Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A72CE33A501
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Mar 2021 14:29:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231329AbhCNN3U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 14 Mar 2021 09:29:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230078AbhCNN25 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 14 Mar 2021 09:28:57 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F19B5C061574
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Mar 2021 06:28:56 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id p21so52673410lfu.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Mar 2021 06:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ru9sveYKg+L2B8IzpRRVi3ZCV8Jo9Gbkkg/tYcdbbPc=;
        b=WPYJ1GXcAj7nPNfCVxOiokijB3y4akNa/6Z+Vqoeznb0OFzBtFc/quHTC/tBTxuunC
         nOtswdAkqO5qyhlJB3ANqWvWEt8jTdnPbOae1YLwXi3t1e9WsOWKYNykGR9J8Qe4tHMC
         0xPen5atabVE/s+8PZuex8k13+pPKtmI3N3WozUY60RriE9O4wfJMPW2dmzqiYq46Bn9
         R+GSmiAS/8Elo6yXfe58vD1PRKk882f/qS8q781nZg0Ch+BChyi8DSnti07xt6sNYsEt
         C1u3c34Yps1H+vqNyv2svk6/xVMEqeRQHb380BxDoK9sC5BrmfJSrCrgdbfYCvNwYJNm
         KjhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ru9sveYKg+L2B8IzpRRVi3ZCV8Jo9Gbkkg/tYcdbbPc=;
        b=Xfy/F3dLe2MzHROpSfsN/p4268JsvKxlJDY6goDLvgfQD3GMYsGw4rANOhy/ZbYrDF
         HnlI8mXRa+B2QFjHsIVd/PMoAT8jZNTOoe/YzNDryiQuD5k7rGr5y6yTi5qSRp8C5at/
         NqNwszshgSzYAgIspZ+yUUFLZOZiB3J/AQI7zXY31gaYAXiSokRwEgRPK273hPKLLNK7
         JmGI7ET3qyeOj79LRSopkabrtRi0Hi3x1vQyJcKNEfSfAAKN6LZfm3NLKjX4Yeillh/r
         rMqTh38pgAB1PY8gZHhFciLLq3A2NoU0JuYeVyNscwF0tc/L+ZAEyfO7bPiwgJWg4iQ9
         dn2w==
X-Gm-Message-State: AOAM5309kTbk2XPFgwDyK24q/xNcpz5vGiJSVl1YiwQraVHqdCfVrZIl
        Ez7G3LOTASEiaSbjjI7Oj0GQ3A==
X-Google-Smtp-Source: ABdhPJyBUtVALJ1x9U7K0rX3CVt1AZFYc15dps5Ww7tnqD59KOB9cniT5afcfyM/KDvqgi6MInQJhA==
X-Received: by 2002:a05:6512:2026:: with SMTP id s6mr5094194lfs.43.1615728535547;
        Sun, 14 Mar 2021 06:28:55 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id e30sm2304489lfc.261.2021.03.14.06.28.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Mar 2021 06:28:55 -0700 (PDT)
Subject: Re: [PATCH v13 4/4] dt-bindings: msm/dp: Add bindings of MSM
 DisplayPort controller
To:     Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Cc:     kalyan_t@codeaurora.org, tanmay@codeaurora.org,
        abhinavk@codeaurora.org, robdclark@gmail.com, swboyd@chromium.org,
        bjorn.andersson@linaro.org, vinod.koul@linaro.org,
        rnayak@codeaurora.org, dianders@chromium.org, sibis@codeaurora.org,
        khsieh@codeaurora.org, Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>
References: <1614950952-13351-1-git-send-email-mkrishn@codeaurora.org>
 <1614950952-13351-4-git-send-email-mkrishn@codeaurora.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <000586cb-8364-e4c9-2707-c54f58a0246c@linaro.org>
Date:   Sun, 14 Mar 2021 16:28:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1614950952-13351-4-git-send-email-mkrishn@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/03/2021 16:29, Krishna Manikandan wrote:
> Add bindings for Snapdragon DisplayPort controller driver.
> 
> Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
> Signed-off-by: Vara Reddy <varar@codeaurora.org>
> Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>

Krishna, Stephen, I've a question basing on our experiments with the DP 
on sm8250.
Which driver will reparent dispcc's DP clocks to the DP_PHY clocks?

We can do this using the assigned-clocks-parents either in the dispcc or 
in the DP nodes. Which would be preferable?

-- 
With best wishes
Dmitry
