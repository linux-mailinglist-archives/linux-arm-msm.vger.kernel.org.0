Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C96774F1F5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 16:22:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232216AbjGKOWj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 10:22:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233532AbjGKOWX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 10:22:23 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B73FF1BC9
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 07:22:01 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b703c900e3so89922191fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 07:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689085317; x=1691677317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TPRZ+gd8UyrWIYMJdwLBfos9PmPvdWfLdvBP4AoMWik=;
        b=crfdsHFj0xaJim4f+GzG8D2ffkOD45sszrYOHqXmgHMac00P6Gdb1mH5pxVN5+CXdM
         h+ifOScpGauercsDe60g+l06HnEkqVt5c6aThrwHISqCO0Tqs8dGPU5PzycJkqabMm9L
         dcBgnFBCVQllEjUa5ZCfvQMO1ZIYton2blV5yCceyzVTTY4ZUzBegb+f9KPd9CML51uG
         2GGGQR7eNt0jH1akdTmO72HeqqLNaWi4KZKKOH11RxAKBww1PUJpAKs49I42ya0kewcD
         Rjc+ioCzX/t6LCBs3UHX10dB3I9LEe4DSATNtMgosBMkSQuimBCwqUE1rt1Pv4AlbtpT
         hOXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689085317; x=1691677317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TPRZ+gd8UyrWIYMJdwLBfos9PmPvdWfLdvBP4AoMWik=;
        b=ZLcpXwAPxCaAO6KZXI7PT+hcEo4lF7YDq++2wf973oKXIOmb9I0N9gfG/ep28LJJBY
         ZspXgKoLSU/k/ldN0DafIMD9xVIBeyrk0Nfnestvv9DkBJmxwGjTRcn0VAFl77Gh1mfI
         g9tlyoSTbVaNhoWKlh3x8MpyQ2ZZ8WxMWhzwvaWJyo3WCRhCXsgHDdQP5O9OqYm/7lY7
         pKwLykZQH+lK9XVwqGgG17h4c/PbGYlQ0RvjHi6vdLigTc1dueEPgjsvf9TSLgwSmhYM
         lRpcbL8YMMDf+VO2v33a9FbnXNnX7PZH5asLI4oM13UlMlC/yNom3LIvDmuuzHZLbwUj
         M48g==
X-Gm-Message-State: ABy/qLYI7qfZLuJJ8eWKD9qUnIDOoF76nh21n7sF/IgNs6SPV7luCoDN
        /gEf/GcdOZzDtua1SHFI9d+B3A==
X-Google-Smtp-Source: APBJJlFTDurkN21u+ewNMfSVswNiBS2LAEXhbF16OXkIr3d4myzfZtu9l6vxO2mrXrfETYbDSQcMmQ==
X-Received: by 2002:a2e:8e89:0:b0:2b5:828c:bfc7 with SMTP id z9-20020a2e8e89000000b002b5828cbfc7mr12544465ljk.19.1689085317129;
        Tue, 11 Jul 2023 07:21:57 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id v9-20020a2e87c9000000b002b6b4424a28sm487934ljj.13.2023.07.11.07.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 07:21:56 -0700 (PDT)
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
Subject: Re: [PATCH v7] drm/msm: stop storing the array of CRTCs in struct msm_drm_private
Date:   Tue, 11 Jul 2023 17:21:46 +0300
Message-Id: <168908465045.1869384.13676671787620421284.b4-ty@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519150734.3879916-1-dmitry.baryshkov@linaro.org>
References: <20230519150734.3879916-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Fri, 19 May 2023 18:07:34 +0300, Dmitry Baryshkov wrote:
> The array of CRTC in the struct msm_drm_private duplicates a list of
> CRTCs in the drm_device. Drop it and use the existing list for CRTC
> enumeration.
> 
> 

Applied, thanks!

[1/1] drm/msm: stop storing the array of CRTCs in struct msm_drm_private
      https://gitlab.freedesktop.org/lumag/msm/-/commit/274f16147462

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
