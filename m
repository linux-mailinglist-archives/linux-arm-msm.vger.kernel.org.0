Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 913D85525AC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jun 2022 22:16:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343972AbiFTUQJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jun 2022 16:16:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344941AbiFTUPu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jun 2022 16:15:50 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BB8E26C9
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 13:15:20 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id i18so5322148lfu.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 13:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=7mAWEwAU3gEZq8Qvtb1T/fLaJhz7mNwcR+3nDyAol1c=;
        b=Af33aLyo8HjKfrZ7Tc+1YWc476VziQp2himHkyoFWjTGLRheFt9rw1VVDTsRVSyD4q
         XxRoWFO+bb+8qzrmoI7vKYC4yS1cKImApNAI8ZSxtWG4Wc0p82TW8D1xsoEe9iix8MYA
         2Z1xeFv6bW6dTAiTdkqypL+8I2FDLVrUMwkHQ0uzL66Somw4XDfS9rBbXoCl3iRWDdKW
         6eLR5RMhWVzaqDg5NCkSgqnPvaDR6WN5l63YX/ZhmAn3ZjsxaNkB0CKMHxj8BWGtvr3/
         vsezFsOpTf6lmvXwAM9UBRqcheNcmMg197NxAy9gGwExF3Cv6Dp29M2CVEqMcP+qLWvF
         9mMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7mAWEwAU3gEZq8Qvtb1T/fLaJhz7mNwcR+3nDyAol1c=;
        b=kScWP7nJSlieyBDydUUZkFCful8lAeqcwkIecPSq3dwfPPN5PZI/1dwJ7JiYAKlMVs
         kTzeJk6hSkN+ViOjG5TFBNOXAGeqS4FUfig9Xx1kb2jGhm99fNpMrIPJeq1FNYNZ9ZX2
         qY3GJT0ENd8cUtmItDjq6p4/910u4+dOs12Ok1jHaTQbLCacUaAyGBweIjRJ3eEdvCPf
         2sdiq4Q/8FJRgs72BRFo+RonJusoP3MBqpkEXYYzYXd1BqyNKCcoghXcCZuwocw1MdLb
         4ohtBJLT96ESCpFaZfDDI//9S3/d8JjSnK7gUPwDXtKdmUIGw4Sy/AyALVIB+5dhNA/r
         ++Vg==
X-Gm-Message-State: AJIora9LDBvRjuT3kgtOfBp2KF67vswCX0fx2awKCrcoHI09xIK1duSI
        +Z/Mu1oDwKyc5bHJUylVL4qc3w==
X-Google-Smtp-Source: AGRyM1tdY5HOm7jCkDbumUbmMeZBimWkY2nijF1Cx17PbLew7kqeN/gZY8SRY8xVzHcig7PQRCer7g==
X-Received: by 2002:ac2:442d:0:b0:478:ed89:927f with SMTP id w13-20020ac2442d000000b00478ed89927fmr15057480lfl.545.1655756118881;
        Mon, 20 Jun 2022 13:15:18 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i24-20020a196d18000000b0047f71e4b0e5sm439334lfc.255.2022.06.20.13.15.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 13:15:18 -0700 (PDT)
Message-ID: <3d8f5a58-0efb-af27-eb19-ee2236a942ea@linaro.org>
Date:   Mon, 20 Jun 2022 23:15:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v14 2/3] phy: qcom-qmp: add regulator_set_load to dp phy
Content-Language: en-GB
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
        agross@kernel.org, bjorn.andersson@linaro.org
Cc:     quic_abhinavk@quicinc.com, quic_aravindh@quicinc.com,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1655755943-28594-1-git-send-email-quic_khsieh@quicinc.com>
 <1655755943-28594-3-git-send-email-quic_khsieh@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1655755943-28594-3-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/06/2022 23:12, Kuogee Hsieh wrote:
> This patch add regulator_set_load() before enable regulator at
> DP phy driver.
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp.c | 40 ++++++++++++++++++++++++++++---------

This was not rebased. There is no phy-qcom-qmp.c in phy-next.
-- 
With best wishes
Dmitry
