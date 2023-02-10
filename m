Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D07E691DD8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Feb 2023 12:13:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232362AbjBJLNZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Feb 2023 06:13:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232042AbjBJLNX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Feb 2023 06:13:23 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C5E472DE3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 03:12:43 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id m8so4422982edd.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 03:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MqqdeGeSDOP29ts8ZSXxn8P/fMFUJG2jOdDCPZL2sFU=;
        b=rSv7YC1f5xTpNXRb4obgqDngu8l3anLhPNDYGIcR/vrl82EmfI22S5ymgED6jT9Shk
         jFTryOaFC7CgsrzJP/gpPA7G9fwrczGjbWrBcGMEV3tJLybMQw6bRzknqjT7R0lTLPF1
         +y6ubtyU1BTi1h6YORk41jwU9CLuWtFNUSklPaI+eIMthz3gTMnrLgDi/gG9qkZACeGT
         +evGaU5UROzgcCLrodO3QkhpUxK6WwiyPTSra9eTriGwSO2wvx+gdfDuq/A0NJ7ncIdC
         fB1XPSsqZ/e+9Q9+++gAcGpHfJz6nSbAPvFDl+kUuf5H9Yl6K9tssHfHRnQ9IlBbJYK+
         lN/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MqqdeGeSDOP29ts8ZSXxn8P/fMFUJG2jOdDCPZL2sFU=;
        b=6CKz0/XXjarjsBgiyqLSH0q82pzyzC32FmK+kayEIo7xn50EjzK6l5t3q7YwgXJB9J
         /KVBo0nuVFrljgDJ1TvVnh23qBgJezRna6MCrLfi0VaqBGUWuW6YuwdB2myaOitdK6/x
         /LYJu6OhcEvAbgW2gzxWnBHDmD0IaUxXkBejlTuDm4j6ZHfgTO6ix5G8NzGs9dzGeDXa
         WcTTtnPW14eZ8TSojP2pr/o0v2zLuV0IXdGOuQugGNEy2NMfa2cZoz6WLT57z6ey/Xbc
         lIZLsRy3dQ+5yPU0rohGVtYSiKuYyD7ZZJK/ampHHYk2wrwBsjRpttKk3vz6DuKqmkE0
         TGKA==
X-Gm-Message-State: AO0yUKWScmO2K61H34CTzPMPQjAWbIg/OPucut67pIR+tKj8wHmWR9SJ
        CfYdzJDQc6IKQHLK7mHYggbUrg==
X-Google-Smtp-Source: AK7set9QQ46UipbOQC1YYnmQvsAOXxecYxPv0DaiSHoq0lAeBY4V2HJNguMpMqEOMApNZnJF+mWipA==
X-Received: by 2002:a50:8e57:0:b0:499:8849:5fac with SMTP id 23-20020a508e57000000b0049988495facmr15849783edx.40.1676027556681;
        Fri, 10 Feb 2023 03:12:36 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id 18-20020a508e12000000b004aacac472f7sm2037849edw.27.2023.02.10.03.12.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 03:12:36 -0800 (PST)
Message-ID: <7f85af25-efc5-6907-70ac-b264f110918d@linaro.org>
Date:   Fri, 10 Feb 2023 13:12:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 4/6] arm64: dts: qcom: sm8350: finish reordering nodes
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230209133839.762631-1-dmitry.baryshkov@linaro.org>
 <20230209133839.762631-5-dmitry.baryshkov@linaro.org>
 <a8bb4bf1-c4b6-ff02-d2e6-1407900bb006@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <a8bb4bf1-c4b6-ff02-d2e6-1407900bb006@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/02/2023 13:09, Konrad Dybcio wrote:
> 
> 
> On 9.02.2023 14:38, Dmitry Baryshkov wrote:
>> Finish reordering DT nodes by their address. Move PDC, tsens, AOSS,
>> SRAM, SPMI and TLMM nodes to the proper position.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> [...]
> 
>> +				phys = <&mdss_dsi1_phy>;
>> +
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				status = "disabled";
>> +
>> +				dsi1_opp_table: opp-table {
>> +					compatible = "operating-points-v2";
>> +
>> +					/* TODO: opp-187500000 should work with
>> +					 * &rpmhpd_opp_low_svs, but one some of
>> +					 * sm8350_hdk boards reboot using this
>> +					 * opp.
>> +					 */
> It's not a part of this patch, but an idea came into my
> head.. could you check with socid that your HDK has an
> 8350v2.1?

I checked with the bootloader instead, if you don't mind:

Platform Init  [ 2701] BDS
UEFI Ver   : 6.0.210914.BOOT.MXF.1.0-00848-LAHAINA-1
Platform           : HDK
Subtype            : 0
Boot Device        : UFS
Chip Name          : SMP_LAHAINA
Chip Ver           : 2.1

-- 
With best wishes
Dmitry

