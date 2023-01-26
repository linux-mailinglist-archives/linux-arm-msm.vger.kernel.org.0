Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD5EE67D4F8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jan 2023 20:01:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230221AbjAZTBv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Jan 2023 14:01:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232405AbjAZTBi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Jan 2023 14:01:38 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63EE262251
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 11:01:29 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id n6so114433edo.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 11:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=spxzCvWMZNGjCVdIu38RxpJRhK/Z/NWL8pHycLSebmQ=;
        b=tfFFTgv/BHAgCuMgHic7psoRBdMEThbyYFEoxehEBTOWzQ/uMNX+GUeBHQwaIB2XNP
         ERjJtqrUXoRLqxNweGBee88WGDYcEK/GjmKW4XpartmaLZv6V2ZGdwk3XRiCtQQ2Mdfr
         GL4V29zMIRCN6IUK7em12uijWKTOePoAFg/yEmSIkTePXMqKXhkYmTvEj8/hSZRMng3q
         ZKLEFd9o9OjNvGSNqlD+LQgSLxNw5awj95Lax1bQby6e7bj5R8K2RQOIJ7J5mJ1NXJdw
         NLM3g5Oc/SMso/WSJSusNmArJSBvmLNAz9AoeOzKzzbeMb8fFafvveA3shVqXGmDvCmP
         Ihtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=spxzCvWMZNGjCVdIu38RxpJRhK/Z/NWL8pHycLSebmQ=;
        b=d9XsV/fpiik59BRGQ8aoFGxe1aeRy3g4fIsoTjcXPUl7kpWoIWtczaU9ZbEoXdx6kT
         BnM/GTE4kKZ1cAjqNoobLVxO4SnOEVfA41BPNqAGeMmDY3xKTeoD8MzZF95O0Mw1LacX
         1VW4i7QFIX88VZLXY1J9xvUvZbu5NxUZ50wUDK/P/8KaAA1tcdtS1QAWdUFbc7ZxC/1r
         BnkAv0DOB7ePEljqgO/zg0Ze5whf+lwMyxOSq4stV2GEq833ryAX6sh0BJOx6ScUBeBE
         hdNgd62ntrwy0rIi+siwGtQfvHuOfEBEoLA0IyaUNVGoLpZPsK0PQs8sQBXdZJN+kbkM
         ljBA==
X-Gm-Message-State: AFqh2kqTDb8QfoxPJWkcRB+L3z7LrWlCex+s4J6dYYllsyuPGz2L+R44
        Gq6G6Ac7RqDPHX5DUE4vkDMlYxldAf9PTvVs
X-Google-Smtp-Source: AMrXdXvONfAchFoBBXRLeOSeCkHRQ0a0OML3R0M4wvDJdl1RbQ5vEO1EuPSXU1C4R1XhzdRbckcV8g==
X-Received: by 2002:a17:907:6e2a:b0:871:e9a0:eba7 with SMTP id sd42-20020a1709076e2a00b00871e9a0eba7mr114187337ejc.57.1674759677058;
        Thu, 26 Jan 2023 11:01:17 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id o25-20020a1709061b1900b0084d4e9a13cbsm974982ejg.221.2023.01.26.11.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 11:01:16 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm: use strscpy instead of strncpy
Date:   Thu, 26 Jan 2023 21:01:00 +0200
Message-Id: <167475959092.3954305.6114466663936878073.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118020152.1689213-1-dmitry.baryshkov@linaro.org>
References: <20230118020152.1689213-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Wed, 18 Jan 2023 04:01:52 +0200, Dmitry Baryshkov wrote:
> Using strncpy can result in non-NULL-terminated destination string. Use
> strscpy instead. This fixes following warning:
> 
> drivers/gpu/drm/msm/msm_fence.c: In function ‘msm_fence_context_alloc’:
> drivers/gpu/drm/msm/msm_fence.c:25:9: warning: ‘strncpy’ specified bound 32 equals destination size [-Wstringop-truncation]
>    25 |         strncpy(fctx->name, name, sizeof(fctx->name));
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> [...]

Applied, thanks!

[1/1] drm/msm: use strscpy instead of strncpy
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d7fd8634f48d

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
