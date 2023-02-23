Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FE836A0110
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Feb 2023 03:10:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232990AbjBWCKQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Feb 2023 21:10:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230048AbjBWCKP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Feb 2023 21:10:15 -0500
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 325BB32CF8
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 18:10:14 -0800 (PST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-536c2a1cc07so148976997b3.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 18:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lFMUOoT9K3sV7smyMsQz++3wD9NZYfAOVbqH2hbiHvw=;
        b=NLiX6/4oMH+SP7OZC5H5dkuhYcqk9qtytdK8dpBWBW4NG9sbrJ8niFrUx5cx8SpArt
         2Gf8P6Z+SoOtRcI2MnO0WOv8wdbjFTrl+0HFTP1Gj5+oq7tUncVG6Gr4Iy+Z78IXGg/e
         mQw+Hg22nU2XYHZKBl2yo33jUAg9d1aVpCv8mwpSAB5+NPqOIqzW8/dg0OJNKMtdcsQQ
         gw+Xig4Qd38XQjL20jB7BfTZU8h/ghCmivlJYa/IQrVzHmg3rsPHXilPWjC6PTGlzrDT
         UmvIE7Cksnzci6YyvWhl8ABuTIUSFR/Bq+7gdcq3jDSRKWfgUJbr5+xo0sjjh8M9hlAP
         YhVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lFMUOoT9K3sV7smyMsQz++3wD9NZYfAOVbqH2hbiHvw=;
        b=BWf/G4RPQigU9wsJPcipBMd/E7R952asoOwTWJ1rrMZAqqEx1RuykyOoJAWm5AHgTn
         m4/jk8hPYl74NUVBAlIQR/3ZSJIVbX/M8qG3yaXO+ELHKUodyqrhm/M+iquwhqSxw6hg
         zouGRfV+dCKeT9lRro5WW5OKPgBa6zOz+YDCEL1Bz1DKPGmoWQ9ZKg6d1yZmYfOUjrjW
         7txLBSJR/cpTXFCxRQCYxYdh9dmb2GDAr4r9jPJR4Bn+WFx9BvH8hRJR5Cm9mNpY4RMv
         Hd0l5Q6vmE+8PEHbCCeW0B2Xrz6a4WsSpMK8lUS+f80zT8H1KBNQSg/kRh4d2TiCU/BJ
         JUaQ==
X-Gm-Message-State: AO0yUKV52qX0gBtw3SAhUUwXRwwxEMsCq3K3t+Knm81K3fxcouXPMzmd
        pz+r21gQCwd+pC4SjCPkLGYU3tj6i5LasHgHkw59Sg==
X-Google-Smtp-Source: AK7set/MR6o1EBljJIfausK4TNfCevYS3wfBHGHm1ASRwt2JVCu4Tl6+7XqTiq/FidNJsl2qK9Axd3xTeY6e3XCB5qI=
X-Received: by 2002:a81:ad28:0:b0:536:55e5:2eaa with SMTP id
 l40-20020a81ad28000000b0053655e52eaamr1508552ywh.3.1677118213425; Wed, 22 Feb
 2023 18:10:13 -0800 (PST)
MIME-Version: 1.0
References: <20230223-topic-opp-v2-0-24ed24cd7358@linaro.org> <20230223-topic-opp-v2-6-24ed24cd7358@linaro.org>
In-Reply-To: <20230223-topic-opp-v2-6-24ed24cd7358@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 23 Feb 2023 04:10:02 +0200
Message-ID: <CAA8EJposxNgyCh+LUstVvBO3Pf3119mmwb6CijN8Ss6TWw5+-A@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] drm/msm/adreno: Enable optional icc voting from
 OPP tables
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 23 Feb 2023 at 03:47, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> Add the dev_pm_opp_of_find_icc_paths() call to let the OPP framework
> handle bus voting as part of power level setting.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
