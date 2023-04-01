Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C19C6D2F9A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Apr 2023 12:01:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229437AbjDAKBm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 1 Apr 2023 06:01:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229880AbjDAKBk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 1 Apr 2023 06:01:40 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28A51E19A
        for <linux-arm-msm@vger.kernel.org>; Sat,  1 Apr 2023 03:01:31 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id k37so32084407lfv.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Apr 2023 03:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680343289;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2ashd2jmNGSIbGJQnNJYWhd+xpZtd9xxM/hYfr9rYcA=;
        b=cvMa0BOgOKuLHFcuTuUangjhtuU9ZabVvI0Y+v8IFlvPGejj0sSIewvL7PGEV7j7x/
         m7keJzkIcw0KW873qypmVzRl4n3BKSuEZCrnIueU1O1MCZ8MQ4007y7RtoKD1QcIwuQF
         NwAISXX+HjvmxoT2DE/UeDk1YxQue+jP35L/fr4iuNePtiFdXtGCKwqpzCBwQBeX5j8E
         h6iQOrydTiQ3WV/4DZWmW0a+T9eUFZyBkYya7PmAra+focN70gHeyDvFH+Gk0rZs1he+
         TcGEtE2k2tmRLbLm1w3sKDg+oeTuZAS8yKlMxHwR7gzK5MS9FVtqaJpsevHksBp7P8FL
         dy1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680343289;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2ashd2jmNGSIbGJQnNJYWhd+xpZtd9xxM/hYfr9rYcA=;
        b=p9zSEFzf2c0114atdC/OIe4T1eFXn1V2SDuAy4hYcdabUgsU+ViDdMspX3yoJLxd56
         8Me8bryQhdDTEIqb1HTYH5YaQTEqdHvnYhRpssKbJT8ES6SJvwcx7kXVuv2C134wao8t
         3peQeOkNXQpwIwZiMNM25vE77w0yJX4+suIJv3G6VBnY1rRHE5O2Bz4NJ7cmG++y7ny3
         dKIsA27CfW39nSHWPUglCCZYaA33kvvG7vlTt6N02iI3YOVd3ICiGl6CoNZelZKUPN4+
         UmTKuSCKEhZd4gPzAsshacZsJbW1blrI9fZ/SEt6anjBXlzkZQP1RJ678cibIjoawvCW
         7XtQ==
X-Gm-Message-State: AAQBX9dYu7h7pTItG++LjRWPMPjPkC8fnEwC+Syl3JTguDtiRMJ7BfR7
        CS9PWtQ017BF5PpIKM7hlcAVnQ==
X-Google-Smtp-Source: AKy350Y0rU9C+2qKJhXR3P4UDAi3oG2kpaWzmNmI8qMFgCf0V70lDWcGZrau2okmTZjXeM+5aRXtrA==
X-Received: by 2002:ac2:428c:0:b0:4e9:9c76:1b85 with SMTP id m12-20020ac2428c000000b004e99c761b85mr7761595lfh.3.1680343289432;
        Sat, 01 Apr 2023 03:01:29 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id d7-20020ac25447000000b004d57fc74f2csm752344lfn.266.2023.04.01.03.01.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Apr 2023 03:01:29 -0700 (PDT)
Message-ID: <e538dfcf-e317-e975-0442-8ab5cdca6c8e@linaro.org>
Date:   Sat, 1 Apr 2023 13:01:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RFC v2 1/6] drm/display/dsc: Add flatness and initial
 scale value calculations
To:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        freedreno@lists.freedesktop.org
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
References: <20230329-rfc-msm-dsc-helper-v2-0-3c13ced536b2@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v2-1-3c13ced536b2@quicinc.com>
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v2-1-3c13ced536b2@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 31/03/2023 21:49, Jessica Zhang wrote:
> Add helpers to calculate det_thresh_flatness and initial_scale_value as
> these calculations are defined within the DSC spec.
> 
> Changes in v2:
> - Renamed det_thresh_flatness to flatness_det_thresh
> - Set initial_scale_value directly in helper
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   include/drm/display/drm_dsc_helper.h | 11 +++++++++++
>   1 file changed, 11 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

