Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18A2C6634F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jan 2023 00:16:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237768AbjAIXQn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 18:16:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237060AbjAIXQO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 18:16:14 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22442BF48
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 15:16:12 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id d30so10615803lfv.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jan 2023 15:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/freu+ZgmiBA4hrBK8o79X6HX9HTTyxAvA2ufrSoK0=;
        b=pZNIgPrqwP6vOIoXVyulw/nqaeul0R0XTQB95YxSJ9Stjz/bLmk6jl30L3/bWIsL+L
         IA5SImpUOSxXSedgDlgjGsMtJVNAXVDl+SnyE33YWKe9in55w7A6NojBMlhlswnYxM1c
         3z7N71B4UTcrbgInI1hfDz4IXxiJa+1NJxf+buyjVGqwSI4hnUkDNF9LMRakUrXgg9zF
         F01H0sFlD5gT5lNRe4SFDJCAHOL7E15t1NkVy8uSUmE2cLkTiWVsLcUInypZQsGENu/y
         PmZ5cyxKAnkZlJdS07DkNjP9akjznesMKbcHqtGVo2I35lu/C1cVaqh8RsO9SY/RMEO0
         iBzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U/freu+ZgmiBA4hrBK8o79X6HX9HTTyxAvA2ufrSoK0=;
        b=ZvUIQe1RaspuQH3U1tHAoxd1rC/x77WQTeyIZgmxlxnhVvGWoHLNxknFQLt7nbWsdG
         3WglhRJrGKxlTFiZwAEstTx2rQB8tW4FxfpP3nyZsN5uskPFq4jqrqiZnXAh/KNHtFg2
         j7OdFUFTSMaRUmNfhRk73l8XcP3q0/4t17KcCMRusxpwd5sKlf49FWBPHQ3keffkgby+
         IwhAvjBfs1eDghdPypbEspst78APamC/S15wRhpSbtznjmxOkHjiS0kkgb2xfMhUM+yt
         vaBwrdwXKy+iWn3a1jboGjUAvZfybotxgsivpMTdP4tc1Zh8FtkT2bD+HQXRuF3epMu+
         nNeA==
X-Gm-Message-State: AFqh2kqH51zIJ8RQR5jFhpvle7m5YJ1cDnvdat1zU+9ptqIhIh/vBor2
        Cq00NlArP+3bcq6c07USD0A=
X-Google-Smtp-Source: AMrXdXvcdxwsx1YSr7JXrjTTbxqbhA3fSc4tWI1dtLQpJSnCoN2laPR0M5rTWz3oTsB51H66XEQK6g==
X-Received: by 2002:a05:6512:c1c:b0:4c3:3a78:eab6 with SMTP id z28-20020a0565120c1c00b004c33a78eab6mr23365024lfu.65.1673306172157;
        Mon, 09 Jan 2023 15:16:12 -0800 (PST)
Received: from localhost (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id a27-20020a056512201b00b004b373f61a60sm1829571lfb.96.2023.01.09.15.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 15:16:11 -0800 (PST)
From:   Dmitry Baryshkov <dbaryshkov@gmail.com>
X-Google-Original-From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Bjorn Andersson <andersson@kernel.org>
In-Reply-To: <20220617233328.1143665-1-dmitry.baryshkov@linaro.org>
References: <20220617233328.1143665-1-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v6 0/4] drm/msm: convet to drm_crtc_handle_vblank()
Message-Id: <167330408779.609993.9427004517463466813.b4-ty@linaro.org>
Date:   Tue, 10 Jan 2023 00:41:27 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Sat, 18 Jun 2022 02:33:24 +0300, Dmitry Baryshkov wrote:
> This patchseries replaces drm_handle_vblank() with
> drm_crtc_handle_vblank(). As a bonus result of this conversion it is
> possible to drop the stored array of allocated CRTCs and use the core
> CRTC iterators.
> 
> Changes since v5:
>  - Clean up the event_thread->worker in case of an error to fix possible
>    oops in msm_drm_uninit().
> 
> [...]

Applied, thanks!

[1/4] drm/msm: clean event_thread->worker in case of an error
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c79bb6b92def
[2/4] drm/msm/mdp4: convert to drm_crtc_handle_vblank()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/6606a96ab1ce
[3/4] drm/msm/mdp5: convert to drm_crtc_handle_vblank()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e96c08e91726

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
