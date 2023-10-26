Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4016E7D89FE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Oct 2023 23:03:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230271AbjJZVD5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Oct 2023 17:03:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbjJZVD4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Oct 2023 17:03:56 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AA2093
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 14:03:54 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40837ebba42so9550105e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 14:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698354233; x=1698959033; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B/wgqf7zM8eB9vC8458/vz6gwRWY3/cTZbVdubKjZKo=;
        b=GHb9C4IEo6THl4Eewqps1+wYKho2a//2xkTQCLnbst1ZJl+PaBCtyRBzM0XjIMf/gj
         ROlHDQcEONdbv2GHMGKhDb+DvEO8QjLOZP5HOWChxXFqS7OSgtE5XiR9zNPNvGzOx23W
         LCMhJipIb5ANsnX2YL29kbh633tYqwdwreeBFjFafwdVmAl5/fpq7vmzGzwBcjNMdOLg
         z4ykkL7QB2KfIBHdY7WiDxboautxK2vrYn5KMVt2K2dlMmMxR3zNjL8x0Sw0qJjTIG8E
         ZBhcRJbebLS+R6K4r/Ze9ByIyc4s4MNtxwYIsSYYrYLLEEmvmsv1IQ0EffcW9JNfLN7X
         UShA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698354233; x=1698959033;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B/wgqf7zM8eB9vC8458/vz6gwRWY3/cTZbVdubKjZKo=;
        b=QHGMzf1DyjTHGpXXY7OIr0G5YvyayY36QX2XBYanoQodrcIW5BKGd3PVqGvU7qh5vV
         Uu7MQlRhBVR40sTKaClgE0O3lNTKoGSBAjCM/oQcFE2XmUvrqGupUhasfjSKjVGpycZ2
         /ttI5XNZz9VEpfZNnqERdIqGqTLts8yaGHnVghUh4vBYhxEoMJF3jmNYEOjIo+2gTVMr
         K9nqaIuVq0JhTxKgkfKmNNJmei0SpJT89QWib+DJjiusnuM5BSHjZqnU1WrmYJ+cClJp
         NnEpZG+GBOEtSn/JaNgLyNJV25HVBWNzQxKIpQzav1iQfvqysRPYJScbl9GCDP4oZIvc
         7X7g==
X-Gm-Message-State: AOJu0YxHmSDA8RdlxKIF5cHJqSVm5sV2uK5Or2vv+4iIgm/tN7Z2JGAP
        fQTTrlaONTlx4+FnoH9qI3CbdQ==
X-Google-Smtp-Source: AGHT+IHCcKAcemS8hwf9I07v2oLrBnbMRG5xiXH08cWmqWS1KElMruGadt46xV+u93VTSaietpea8w==
X-Received: by 2002:a5d:598d:0:b0:32d:827e:7bd8 with SMTP id n13-20020a5d598d000000b0032d827e7bd8mr612280wri.70.1698354232769;
        Thu, 26 Oct 2023 14:03:52 -0700 (PDT)
Received: from [172.30.205.55] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id r16-20020a5d4950000000b0032d81837433sm256158wrs.30.2023.10.26.14.03.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 14:03:52 -0700 (PDT)
Message-ID: <e081ca54-e8a6-40da-b101-194e6a6a351b@linaro.org>
Date:   Thu, 26 Oct 2023 23:03:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/15] phy: qualcomm: add QMP HDMI PHY driver
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-phy@lists.infradead.org
References: <20230928111630.1217419-1-dmitry.baryshkov@linaro.org>
 <20230928111630.1217419-3-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230928111630.1217419-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 9/28/23 13:16, Dmitry Baryshkov wrote:
> Port Qualcomm QMP HDMI PHY to the generic PHY framework. Split the
> generic part and the msm8996 part. When adding support for msm8992/4 and
> msm8998 (which also employ QMP for HDMI PHY), one will have to provide
> the PLL programming part only.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Taking a quick look, my comments from v2 were not taken into account

https://lore.kernel.org/linux-arm-msm/1513ea17-2807-4f7c-30f2-6158b5f3e55e@linaro.org/

Konrad
