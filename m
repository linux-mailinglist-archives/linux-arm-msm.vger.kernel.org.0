Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CC5F6A0CF9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Feb 2023 16:32:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234876AbjBWPcn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Feb 2023 10:32:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234832AbjBWPcj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Feb 2023 10:32:39 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B6A758B79
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Feb 2023 07:32:38 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id a10so11265334ljq.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Feb 2023 07:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LRKRWprEZuD2eBwpUD29JzKZTLuOFVMqqL7Lx+nXuUU=;
        b=eh/ODz/HpObGw9DUdcihpcqQXSZ4JBk2sakl4v/kqlyd1dr9ykX5wA0w4TXymNXNJK
         lfF0J7bNo8oCwheZreU64j17DMviDkqjBL3W61vHHWGqYy/qkfHatCOVqEEkodUh/Jsf
         GsTQFpHlZTyI/0+aZq5GQXlNo/u+T4aU6c4ZsgQrgXz0P37ca+VCRSA/jpRFCwyhctXI
         jNL4WNPP5NP/OP0WCE7PeLvQ7za+A0VX5vT9gfXBkfhkM6KAwHKoBNT9875lTFiV2MJt
         bQljsRSW5ed3ORe2gbLNFemzYwZeYGioMzDp7k8guN8UsAlq0LBsl2eYBhEaHtbE0neZ
         drqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LRKRWprEZuD2eBwpUD29JzKZTLuOFVMqqL7Lx+nXuUU=;
        b=nL7ZordE7Or7NpgpZpAUd8W/7ABI8jfmqJEDwKrfd49ueBvHZ/O2sfUy1UgeN2GQTL
         sLzJnQENfX/gnkuO++X0SpKgvhmSMqO30cNnqJCsY39mlKXzcuUB2+8hqopVlpgOX3SH
         M7ef5awgExXx5lutttNZXLeMETcq4FhsdRCHaNSiJ+fhXMYX5+wubhpICdEA7WhChcUd
         rbeFSWa075NyloWidHIjVceaGYkp+ATKveP3TIQ54RFiFdNfIArKs3jXwlgFFjKBG/0S
         Pvh8sWS7S3RvJJZcrmIbbEhMqzuf8mogWkGCD9W+Slkpg6YWBXWpFcmwDv8Kd7fkXvgz
         W4CQ==
X-Gm-Message-State: AO0yUKWgB2IKbdM3l0j2uJfM3JvM4cbheo3sWWyq0VUMVu70MbbjvVEZ
        M4uMLSHfwfGxKte6yJf4+BMs+A==
X-Google-Smtp-Source: AK7set+gDpYSnmThwzayYEy7qKRW50AOGBJZpkb3kJM+3R0C2IYIfKQw4BstjGsuW05TEGxOJzPYYg==
X-Received: by 2002:a05:651c:204a:b0:293:4ff1:5936 with SMTP id t10-20020a05651c204a00b002934ff15936mr3865262ljo.47.1677166356725;
        Thu, 23 Feb 2023 07:32:36 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id a13-20020a05651c030d00b002906c22d6f1sm1045866ljp.18.2023.02.23.07.32.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Feb 2023 07:32:35 -0800 (PST)
Message-ID: <365754f1-757e-a997-a734-19e79550c63b@linaro.org>
Date:   Thu, 23 Feb 2023 17:32:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v3 1/7] drm/msm/a2xx: Include perf counter reg values in
 XML
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20230223-topic-opp-v3-0-5f22163cd1df@linaro.org>
 <20230223-topic-opp-v3-1-5f22163cd1df@linaro.org>
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230223-topic-opp-v3-1-5f22163cd1df@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/02/2023 12:51, Konrad Dybcio wrote:
> This is a partial merge of [1], subject to be dropped if a header
> update is executed.
> 
> [1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/21480/
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/adreno/a2xx.xml.h | 6 ++++++
>   1 file changed, 6 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

