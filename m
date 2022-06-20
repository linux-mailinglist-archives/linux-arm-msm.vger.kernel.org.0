Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 453C65525AB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jun 2022 22:16:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344443AbiFTUQH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jun 2022 16:16:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344870AbiFTUPk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jun 2022 16:15:40 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 193CBBEE
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 13:13:34 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id a29so18983959lfk.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 13:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=vKLujDnjL4j2FkCuAr99TpLCl8UgQPLzNcwqlNOUIDA=;
        b=Pp8rU3mLd2a9SEGJdamUi1scms6E1PTjom0SnaYbo02O7+4KZrOqkcvCjIV67gGYuv
         wFb4HHFQSDJsQzcPM1myJOH77Q9NDsnNPGny4tYTUo2p/ysmi2Z2fzWQZDzWcXwwF1OK
         MF7dsyNI1wv9jKD25sfDycc5K88Bi3hQ9qUNs2Amd8p+Tvia5+ML73EhZktTfkdi/hol
         u1+yW3sJSQF9hGE/ZwrlQnsxLctK+ohp9BNIzzf4N+RKVkW2pbntRxN14W5LjknioV16
         7KzCA2lM5R0l9+wS6KBIQgb/Ivl4GLqYRpZpNg7Sd1eiK+WLlaqnXSNr3pNQoa85Yiwe
         i0nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vKLujDnjL4j2FkCuAr99TpLCl8UgQPLzNcwqlNOUIDA=;
        b=lgZmgidVhkz0sQi5rCfZuRVmuVVHxSoOZ6MawlfIGtPDD5WXkY+LPfV/HRcRjgRJ5g
         5IwBKOP6+Al6tGfub6gmXrpjKkwh+Wi8AN5/hk8i92MuV3KIwJRoxnZL5TT+JeJLfojs
         V0ibDss++DJ/808Dh4MnA7Fokqo0K8YYW6eS3L3waZKBOr7Ytp80jK4Ip/nUVfXLE+SZ
         +S3CJWdmA2+UBqIwSgYWdAdb+SuID32KImgAauvW4JAGGoOZ4qpur4TAAh8rFy8IBIjw
         5w0g/mYmQzDqbGWYv8yrf55bqn7KCbYWghEeN6BOJ5rRMm29CHInWavw39DyrR6nYeQE
         D4sQ==
X-Gm-Message-State: AJIora8IL0+WWfG9QcTQipQh43ZWkp69+Y9+P62wVH7iWakzp9ZzViXL
        v2NFkSflO1097XQbKefQJYsjCg==
X-Google-Smtp-Source: AGRyM1uqz4s0Q7zVY3nhiumly6PmorhwnXdpd/h701aYhFAZMkuuAaUtlkTvpmlTKVcbjXFnYZbWcg==
X-Received: by 2002:a05:6512:ac4:b0:47f:7a01:c2ae with SMTP id n4-20020a0565120ac400b0047f7a01c2aemr812235lfu.2.1655756012473;
        Mon, 20 Jun 2022 13:13:32 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d2-20020a19f242000000b00479339c8ca7sm1882266lfk.125.2022.06.20.13.13.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 13:13:31 -0700 (PDT)
Message-ID: <4e9089b4-f92e-0232-7439-e615293ca664@linaro.org>
Date:   Mon, 20 Jun 2022 23:13:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v14 1/3] phy: qcom-edp: add regulator_set_load to edp phy
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
 <1655755943-28594-2-git-send-email-quic_khsieh@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1655755943-28594-2-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/06/2022 23:12, Kuogee Hsieh wrote:
> This patch add regulator_set_load() before enable regulator at
> eDP phy driver.
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
