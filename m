Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4F935BB9A8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Sep 2022 19:03:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229458AbiIQRDc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Sep 2022 13:03:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229593AbiIQRDb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Sep 2022 13:03:31 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAA682CE07
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Sep 2022 10:03:30 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id f14so39392325lfg.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Sep 2022 10:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=CNlP4WjQ5gD2dVZdm851YFALcjCKHtccpYUpR8J49Z4=;
        b=DfnUDIDLdqg6CeGSnomPiIyWPl9FGL/z455mP7Ly354UMsEwXqUKDKNMZTgG8qHPNL
         iYgOdL6YvessQlDBOFRxqA4bb52EMcOfI7IjvDpiKNGcCgell5vLizFbrqkTxA6LAmpN
         qunDNkWcVGUT239u2rrhYWET0wfCLC6hpQfu40QpY05Jn2N8W5oMsUNDpd172nBVbxQQ
         sSZBNH6QGp/r4D11puhNqSYCnilEK3vW7hgZdg5B8+snXYHDuq86Oa2l4r+0idQ5uRVt
         c0HOzShWNXIGDjGn1duIXbU1UpvEFx1ELV3bpMNem8ZLM0VCr/KoCLahPTxP8BA7nqmX
         mXCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=CNlP4WjQ5gD2dVZdm851YFALcjCKHtccpYUpR8J49Z4=;
        b=znh+131r7Ay4S3pcTFxs3ceSLzFkus4pm6d62bhK0hUq0OLTqfar3dHYEeRvcQqBK0
         5dBIhJZpJw2ts2UXVXlG+DOD7C1y+EwhT8l9pm+7Tn71uFazN+WcDOWJXMSzdWoXsBWa
         pvlp79L7xA2PFakce/wPV2M1S7gyQteb7hbXB/lJHoNq4SKyp6IWxcWD9/8NG0QfPtaZ
         PQ0T8Z+nHvkMHvUhLSwdhB532lB1jb+pTe3vuYP9dfb227CxcSzZp71grCGxNOWq+S3d
         6lILvjQxsnGiNFLIibF9ZWvmOswoIhwi0sOFkgCjj5VndKq2agIwGWydRe7ehXSOXniV
         u/DA==
X-Gm-Message-State: ACrzQf2ENIJY/OiXB+UxrtKK+H/17fcRDS/F7bge666g3UO8UxQH07cT
        QYFczBseXYsPnXbHDoMClh1uGg==
X-Google-Smtp-Source: AMsMyM6yCCGGK54OXLJ5OP/agtg//cmMTA3Jc3j8bIg9aGqi9wiv0UUto5VjD5mRdOjt7u8CLVTYig==
X-Received: by 2002:a05:6512:230f:b0:499:dcd:2fd2 with SMTP id o15-20020a056512230f00b004990dcd2fd2mr3715968lfu.677.1663434209040;
        Sat, 17 Sep 2022 10:03:29 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id z1-20020a05651c11c100b0026c3975f488sm951701ljo.26.2022.09.17.10.03.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Sep 2022 10:03:28 -0700 (PDT)
Message-ID: <1641e41c-08c7-859b-644a-28d966fb00f3@linaro.org>
Date:   Sat, 17 Sep 2022 18:03:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 1/7] dt-bindings: msm/dp: Add SDM845 and SC8280XP
 compatibles
Content-Language: en-US
To:     Bjorn Andersson <quic_bjorande@quicinc.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220916200028.25009-1-quic_bjorande@quicinc.com>
 <20220916200028.25009-2-quic_bjorande@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220916200028.25009-2-quic_bjorande@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/09/2022 21:00, Bjorn Andersson wrote:
> From: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Add compatibles for the DisplayPort and Embedded DisplayPort blocks in
> Qualcomm SDM845 and SC8280XP platforms.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>

No need for quicinc SoB (unless you also take ownership).

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>\


Best regards,
Krzysztof
