Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62AC4733D3A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jun 2023 02:38:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231690AbjFQAim (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Jun 2023 20:38:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231920AbjFQAil (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Jun 2023 20:38:41 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCF263AA2
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jun 2023 17:38:38 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4f655293a38so1851884e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jun 2023 17:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686962317; x=1689554317;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FaAFv9diu+2GntNFHHd2iqlhl6ioeLBHNICmiU3KZV8=;
        b=n5wQL0y+IigIdbYTLWY3sCQhh3h9tnktHjUZctHRKcRVlGS0nCSi7sOQw9XSWdrvPw
         Bk/X+YsBpMESlDsEnYIRZeiP18ej6cJ429oKnaoRL3qM5viO9uLy1h4bvzt8Ng4diuFH
         +bhcRgg2RIdzXYKfQgVFicFhNva9cqrwaXi4sUN94PD2prKqZZisx2rxzNtPT0hB+10u
         MxQSe00b+ftSURqWHqygFwwisHzyrhfZ88V6BUnmciOO8kscavbGEznBpvoWTWuMnHBh
         SUFgddjN4aBGMcK4Jqjii5YOJ6ais481W+rnX6c7a1wS+frPSC/j0bT3OwUqGJNWgX6/
         MZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686962317; x=1689554317;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FaAFv9diu+2GntNFHHd2iqlhl6ioeLBHNICmiU3KZV8=;
        b=JenFjbiLjFNMNZDUdAmYeceZe/xct7x3he+nOaW4PlyuIe06fFWT1v6qISkuwRJkDb
         +c8iYk6CLzZf3+dq41v+h+sQLGhcrRtdKGsiEII/0UnXOtjTKTKlrQXqtbTx1jR28cNR
         ruhr6NDoWYbd6CcWkxkjiS+UQViA4kzs3mCn506GRYo1CEHvduksjk4IUccbxoaWLooO
         ogqKQPyOxnXHlQ9EKPRbnRa2gf5yUy7yyWnwbR4j/wEn8Zwl/g2NuDRCySG5NDNJLhSR
         JsJ2Wnbc0C4+TQxtrfV/yqFKVy9fBFp4TFnV+D0HE2KgoyBKpiA7Por0JUGL60qqImS6
         563Q==
X-Gm-Message-State: AC+VfDyyDUDEwbJ0bHz7FWh4dOvISLb49BdiVtsEvYmbeiHelk/xtfKL
        Z+u25XZVIhAQ5f1EAkT5rgZTCg==
X-Google-Smtp-Source: ACHHUZ7sMmxGRUiPl5CdnszXhiCdm5cv1O0YZuGsNI+lerkiojPmHN74Jz9+3tGXMbrSMJO2PLuxsg==
X-Received: by 2002:a19:5e47:0:b0:4f3:b708:f554 with SMTP id z7-20020a195e47000000b004f3b708f554mr1894705lfi.47.1686962317001;
        Fri, 16 Jun 2023 17:38:37 -0700 (PDT)
Received: from [192.168.1.212] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h22-20020ac25976000000b004f5e681eec1sm3254630lfp.92.2023.06.16.17.38.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jun 2023 17:38:36 -0700 (PDT)
Message-ID: <39101e65-f8f7-4303-dd17-e94d5f998d24@linaro.org>
Date:   Sat, 17 Jun 2023 03:38:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 04/19] drm/msm/dpu: drop dpu_mdss_cfg::mdp_count field
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230616100317.500687-1-dmitry.baryshkov@linaro.org>
 <20230616100317.500687-5-dmitry.baryshkov@linaro.org>
 <gnffmawpcboaxxlpfictfkcqozppzpzaofqu5e75youwicltdz@acpdxcu73k7b>
 <5jevnbocflm3tzyensi5uex4umptyy3wsbjbercm3vodqxx3md@jnbi7g5oyys6>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <5jevnbocflm3tzyensi5uex4umptyy3wsbjbercm3vodqxx3md@jnbi7g5oyys6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/06/2023 01:44, Marijn Suijten wrote:
> On 2023-06-17 00:41:40, Marijn Suijten wrote:
> <snip>
>>> -	cfg = _top_offset(idx, m, addr, &mdp->hw);
>>> -	if (IS_ERR_OR_NULL(cfg)) {
>>> -		kfree(mdp);
>>> -		return ERR_PTR(-EINVAL);
>>> -	}
>>> +	mdp->hw.blk_addr = addr + m->mdp->base;
>>> +	mdp->hw.log_mask = DPU_DBG_MASK_TOP;
>>
>> You lost the assignment of m->mdp to the local cfg variable, causing
>> mdp->caps = cfg; below to remain NULL.
> 
> To solve that in a clean way, you might as well pass `const struct
> dpu_mdp_cfg *cfg` directly from dpu_kms.c into dpu_hw_mdptop_init, as I
> did for the other HW blocks in "Pass catalog pointers in RM to replace
> for-loop ID lookups".

Sounds good.

-- 
With best wishes
Dmitry

