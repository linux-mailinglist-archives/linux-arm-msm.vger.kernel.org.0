Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80AC05E8AE8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 11:32:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233618AbiIXJcA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 05:32:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233602AbiIXJb6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 05:31:58 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DE0D139435
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 02:31:57 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id a3so3679717lfk.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 02:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=StTGIEPHvyWjTm61ptad+5eZwzfDx31aYpdqLou0RSI=;
        b=OpmrwFMtPqHOExAFK26eiVFA9C52DBx68ieceF1eEK1xjFpg5wcsP+7+C7oCol/q2y
         NNSK084FuIGvhqKmMJf4/82dU1Tv2Ya4HLspjf559rJFPs/vLyBUMC1UiZ0cGgFyZRPk
         K5cZePwFEyM7ZqVnnXnNMh8duYAyeOJT95jnkNzozM9s5x7R9iV+HhiKm2QwWjEnCwCa
         oOimtcioOA4rLK2XEC8gUUMbosKKKvSr6TQL0RJEii8xoDIVsJABrC/xi2hc7X4HUj9g
         p8x9oKXmfF/oQEeyyvmfxQRvChaMXQG8a/J0KQut7wQQxL5YFlz2IqjADfug4m5+Rm/C
         xqTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=StTGIEPHvyWjTm61ptad+5eZwzfDx31aYpdqLou0RSI=;
        b=C4pIvdp8fcs0p66DrcoBuAiAF6vmOdno3orKb/vt97FB0Hh/zskSxWX657QLAKOn+D
         mFVREd5+nXCtrpj8uyjtke2gwJRcXhR5NLIJx4eDXU4AMn9jXwljnXavjHebktGq1vDs
         ZEUGtvQfEABC8SZVHmfhp/yWg1k/IdwMmz85SIP9PfAK9HZN4bx+3QIdXpqoxZDUDMEf
         3mXEHNXOxQXumC+niUl0XCi55ppg6IXlbmSNvvnkHVlgrqYKGUpLtx8nQxAabFR40yG3
         92snxlHjhhmOPVOVyozYW9HuZOHo66QSKLqzDX+zjt2PM4Pts+1KVoCbSxDD7c2kXtpX
         fzRQ==
X-Gm-Message-State: ACrzQf2K0OlDv2AIXgR4/472cpJFO2qGkXVFthxIp62IRYxERXqLmAxP
        xi5Z61yjfTSX/kqJq+sIFL5pxg==
X-Google-Smtp-Source: AMsMyM4H1hokrlUrFp2OPCor5AjrlT/e+7tCFw6G2FgZ5G2iEb7wmyfhyHcTyBNOH2OoJEKtVk5c1w==
X-Received: by 2002:a19:dc4c:0:b0:49b:ec86:fb96 with SMTP id f12-20020a19dc4c000000b0049bec86fb96mr4763785lfj.440.1664011915573;
        Sat, 24 Sep 2022 02:31:55 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id s12-20020a056512214c00b004974def0b75sm1835092lfr.173.2022.09.24.02.31.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Sep 2022 02:31:55 -0700 (PDT)
Message-ID: <7450f6ea-c940-4f6c-762e-3738b8a9d771@linaro.org>
Date:   Sat, 24 Sep 2022 11:31:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 7/9] arm64: dts: qcom: sdm660: change DSI PHY node name to
 generic one
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
 <20220924090108.166934-8-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220924090108.166934-8-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/09/2022 11:01, Dmitry Baryshkov wrote:
> Change DSI PHY node names from custom 'dsi-phy' to the generic 'phy'.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

