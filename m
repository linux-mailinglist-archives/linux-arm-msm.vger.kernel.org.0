Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A20527BCEAC
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Oct 2023 16:01:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230303AbjJHOBZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Oct 2023 10:01:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230332AbjJHOBZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Oct 2023 10:01:25 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C46E08F
        for <linux-arm-msm@vger.kernel.org>; Sun,  8 Oct 2023 07:01:23 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-50305abe5f0so4895665e87.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Oct 2023 07:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696773682; x=1697378482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PoIMpHA56vFruwL7TA1WCypBUc6vcq1UqKu6g/6k+8s=;
        b=ZiwKVKwfDbF90ztXYCyNcnzoPbIxokZBvwow+QuSmW+b55PDEmJ7uLjDdstED2ign9
         dszYqRYE/1oAo15+vBnkEI0j/XHCdACSqMUvFNO/xB7m1Qo0kb7wYjFaRI5XWBWLyn2h
         f8C+aikJkW8qbpTNRHzALepyYLWb2pXgh3C9jEc/nPYatQmTpQe/1KKC/9R6vFoD8c2N
         StjdXZMxgDcKdEi3FZU9TEHmiIRUb0nmSwCG4E2v9VI1r16GwzNSpBQU8A1fcLMvR0g7
         B82Sn8lzkcMlrjB0VERTyH+s2cu9ABdNSnagBjlYpI9tajVAA01+71dwRkqgOhXjrfGx
         yixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696773682; x=1697378482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PoIMpHA56vFruwL7TA1WCypBUc6vcq1UqKu6g/6k+8s=;
        b=CDwVyVu3rrE8H5MQhv4gmTgoSEplta6doXL37PI/ZxD6u60UM/iQ6SBJZnnO1PhwK9
         u8Lek1fuyAI207EV332IZsvSBtl28v8A9kwxAsZqtXvYNqV0ltDjthkaISWB0jhYDFNU
         iFSzQW/4zR+TWjhpR5FErF6MSDgrgCb89VDLfftUj40If3chRUrBrKFJf7tAic+f8IPk
         jqnsMVigngSgRKrZa7l+IHtzo4E1NZnIRUmcfHCUqpRUa9hvoxmcBjue7N6mCnSUNS65
         zHWokerDbCIyuZvED8dRu5PMwuqT6fhRotQMlRR1nb9EsTGOGTMtfcidhYqpCiCe7aHK
         5Ybg==
X-Gm-Message-State: AOJu0YzKnZbL0KrIJpQSqGS8V9jx8s5C6gdc5b35GBIpwZ+FzQFRUwTC
        EE64co2XrGVfS+RZl0MwA2DXfg==
X-Google-Smtp-Source: AGHT+IGNVaAG1fIEJ9vamgFxXU47R4fgVhcie2t8W0Nfu1ttbcfiPbHtC9X/HNM/wRWqsTuVuR694g==
X-Received: by 2002:a05:6512:1104:b0:505:6ede:20ab with SMTP id l4-20020a056512110400b005056ede20abmr13532044lfg.53.1696773682028;
        Sun, 08 Oct 2023 07:01:22 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id q14-20020ac24a6e000000b00504211d2a73sm1080455lfp.230.2023.10.08.07.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Oct 2023 07:01:21 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/dp: support setting the DP subconnector type
Date:   Sun,  8 Oct 2023 17:01:12 +0300
Message-Id: <169677306904.2570646.18328571573756710784.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230903222432.2894093-1-dmitry.baryshkov@linaro.org>
References: <20230903222432.2894093-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Mon, 04 Sep 2023 01:24:32 +0300, Dmitry Baryshkov wrote:
> Read the downstream port info and set the subconnector type accordingly.
> 
> 

Applied, thanks!

[1/1] drm/msm/dp: support setting the DP subconnector type
      https://gitlab.freedesktop.org/lumag/msm/-/commit/631557f9741b

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
