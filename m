Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22ABF4CC90C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Mar 2022 23:32:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236834AbiCCWdf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Mar 2022 17:33:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236946AbiCCWdd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Mar 2022 17:33:33 -0500
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 826B74FC7B
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Mar 2022 14:32:44 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id j3-20020a9d7683000000b005aeed94f4e9so5874426otl.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Mar 2022 14:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=V81iJtyobtEfcvtMkpIA2e+dDXWgImsI9k96/3JHfPU=;
        b=GbaSq7Sco4VRA/oh0xEl8QWO6Ytp28GTZ8m3hxiEvIN/2JlsRqI6+keQBbF8189DgD
         xGy+QATLDYi4YFxo42Kpb4SUZ3GN0gX3bVhC1qbvLNF+RBC26Y/Ffs6iDBAOc3Qg8D8i
         wWz2xqZCr+o2pu0pAOA8yepl8YzncN0/PrADs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=V81iJtyobtEfcvtMkpIA2e+dDXWgImsI9k96/3JHfPU=;
        b=vvSWYgSTJpf34v9fQkjRP2j4nlaNSv0K6Crbf3KqNe/Ew+7bVJ85D2cS5He6MZTg30
         iDvLeFE4C+UA8yPg+VUGLUUosQ/IWZKRmuaVNjbOo9SPug8+upA/vJHuoWW6EA9XyZEW
         EekSyBIUJiH4hlZGajjyY1zRX/065d0ELcNip7vJmdZKxPKFoYnwlQqPDB7TvclTJyjG
         +KaYClprJ5MthKV2SzveC8hMqy5N59Mm/ejOUpjgIRQ9CQHzN0S2NVDr8sx+YLMiDKLB
         1qHwvhvL6hYHwzuqLXhzkZr/vA5wHU39qiIWBl2otqyDkiT9XiiJ6nwtO08P6OsEqSsP
         dSgA==
X-Gm-Message-State: AOAM5316iMnx9li7+k953iWisv7jYZvT61uDTIlrYlczJRDa7aF0s/VW
        YveV/dmc/l0FCsMwdulTGVctwegiIGSMQZP+Fn1UyQ==
X-Google-Smtp-Source: ABdhPJzCsxybXW8deEcr9YdSM+FzB0T9BmHhm0B2lqcjqF/EbQQDy/dHZ8QPTz2FpMjry8F/Y2/GdGbvlKYpn+FbRik=
X-Received: by 2002:a9d:7687:0:b0:59e:da8c:5d32 with SMTP id
 j7-20020a9d7687000000b0059eda8c5d32mr20728475otl.77.1646346764025; Thu, 03
 Mar 2022 14:32:44 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 14:32:43 -0800
MIME-Version: 1.0
In-Reply-To: <20220217055529.499829-5-dmitry.baryshkov@linaro.org>
References: <20220217055529.499829-1-dmitry.baryshkov@linaro.org> <20220217055529.499829-5-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 3 Mar 2022 14:32:43 -0800
Message-ID: <CAE-0n50bntVXJ_Z7hNbuCUchP68eLa1X0tMxkVtwpKVsTnQyvw@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] drm/msm/dp: inline dp_power_clk_set_rate()
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-02-16 21:55:28)
> Inline the dp_power_clk_set_rate() function, replacing it with the call
> to msm_dss_enable_clk().
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
