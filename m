Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A290C69109E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Feb 2023 19:48:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbjBISsL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Feb 2023 13:48:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjBISsK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Feb 2023 13:48:10 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0B62166D5
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Feb 2023 10:48:09 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id jg8so9246090ejc.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Feb 2023 10:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C0XFAAN/R3Nk3WTCxVWqIYm+jEES9opCixMqEiVuViY=;
        b=pUGPWsmzseTiUdXm5Gq5C3eb2NwodF8g8zjRmRTiE7I/5aPZbtQUcYbzWCMFGxDoBf
         bW/uqtss3/h+HTZLyKkgMSMIUJVo6Dv6YAjlisoTh92WIfb8U2pCQbk+pv27kg8WMwuc
         QzAahiEQM7+E3qehrq7vSGtBSOjMvWzjNEZMFbvjZwN5ULMTA9P/IH8Iqf1B5mHAGZvH
         RdIZCHwY/E8Mp2LGeKIJWg5TeixFYr0sHRkG9qG73xlqeImTn/agcE/b6LkeFCja85sp
         LBJcPDXUrVsbSYzZt1Xo3DGs6oVZSmgA2iNfzYh/uPbkCmY86JXSGN1mH0MBqhjqvFGN
         1nXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C0XFAAN/R3Nk3WTCxVWqIYm+jEES9opCixMqEiVuViY=;
        b=Sy14qsS01wIYK0w4qfzBOAqz1n7cwcIVYYLfqj46B267jfPF8X0aSrtdPnUn2c5NZE
         iUwO4qUR5HVyV+5j88rPYAa+3+WUv91Nzv9ha3yTEf3VuWaP4ff+a1h5f3Q9Jdw0GgEW
         NL+hLy2hBLIiG6UrgmMs6Wz6NwK6HNlUXy4MGjgcavB9urhIgolFTNfrrgUwEA6z7qSx
         rCHqRf5/hKl2X0iDgcLBwwcNzNGa6Pq2ynusQKN6M8lAxPxSy7YKrJl4M/gRF3kGBwfy
         uVs5nHnyfOL/AgwEg3Gs+P/mRuZrWbyzPTsdOlBdFUu7bJfDUDyxDa5iqp0JlDu8GHTp
         dWSQ==
X-Gm-Message-State: AO0yUKWHylprUCkOw7/oayL9VfP6rb22B4aVsV3nsDKXbMsY9z57+Tb7
        Z+zYHLuT/9+ZZQmCvjD3HtPwcQ==
X-Google-Smtp-Source: AK7set+qkUjZFmf6QQRtEvHs5uIs2uEFZ0sHmBfO82Y5zz2lrkZQXi+23m9SAyU302Gu3nVmrstadA==
X-Received: by 2002:a17:906:b142:b0:7bd:43e9:d3ab with SMTP id bt2-20020a170906b14200b007bd43e9d3abmr14772263ejb.52.1675968488402;
        Thu, 09 Feb 2023 10:48:08 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id m19-20020a509993000000b004aad231b316sm1144383edb.40.2023.02.09.10.48.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 10:48:08 -0800 (PST)
Message-ID: <e4c48c3c-b3cc-7760-83a9-7af6eb74bf2a@linaro.org>
Date:   Thu, 9 Feb 2023 20:48:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH v2 2/4] drm/msm: Check for NULL before calling
 prepare_commit()
Content-Language: en-GB
To:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        freedreno@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        quic_abhinavk@quicinc.com, marijn.suijten@somainline.org
References: <20230209184426.4437-1-quic_jesszhan@quicinc.com>
 <20230209184426.4437-3-quic_jesszhan@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230209184426.4437-3-quic_jesszhan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/02/2023 20:44, Jessica Zhang wrote:
> Add a NULL check before calling prepare_commit() in
> msm_atomic_commit_tail()
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

