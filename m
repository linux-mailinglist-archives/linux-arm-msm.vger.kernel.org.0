Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4836A67D4D1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jan 2023 20:01:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230149AbjAZTBO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Jan 2023 14:01:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231544AbjAZTBM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Jan 2023 14:01:12 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FEF347414
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 11:01:10 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id ss4so7623683ejb.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 11:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pIp/tztbC7zmUXL7EUgPj3UhCBeJNUNuWUzm8HG2JLM=;
        b=WGevx/naL4qZvFBxjyn8EVDeyhoS8GFaHGqSzNiRyzh8H+wwaiEt2T1Knvuukbznnu
         /JtnoXHCXcEIbk/Q08aurrA7RiDMlZFb5BJ+f/DdQzXuxRRhlVvQSgjqpHStyMaYWw99
         qaQq65HxxNkimIkzxCccMJlBqsbGbW+nD1tBI277Yfk0nvswBsyIbuf+6qeoyCtISGCI
         zr1PV0bSG8MZIF4t6ZGmAdGadEYxXWnLiy5aEy+x8aWw9Bt2g/tIWigdPS1RtQneeJHM
         ox3OUu5JP83GPBniO/umA+GsTd5gWijoIwzSZE75omgxtBfmHP3+R45R9t1ih+cmtfey
         KBIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pIp/tztbC7zmUXL7EUgPj3UhCBeJNUNuWUzm8HG2JLM=;
        b=tRkFnwpWDHOvj2jUBRawpS+oigkS1MWgTWLSb/7WRXGwb6cKVmqwig9rA+9wiaF3Xe
         a3cOo4aSiE8KbUjKCxqF6ObmAM+HpRf8vStSLS/dGeLEKUovw5j4jQhpS+m0C6NS9bZD
         vapI8gaKgw8B9zv4YM/ULnnpr2Gytv3YliqBcVoj3BHtcdW3O0Amly2C1Et74VoL0G3X
         8FWYwfbdvU1nAX9Rb/CHaSgfjEpVM1kIBm4WYnknAS8FILY1oxa7tlNC2OfC7vRrBAWJ
         wHkwIG8uAG2zY27yM82arlP845JiIyuZ1pWqL/HzKvoAHd4tfUGJZ/KkUzqqbGE2u6Pf
         0lrA==
X-Gm-Message-State: AFqh2krn2l8J8Lno4g4dL9lWlRJVc69zHs5nIUOoRAyYwazQywQTaEBy
        MnvllFAFBF0siVPi/2E5OsbQuQ==
X-Google-Smtp-Source: AMrXdXthSV4ZVP7kF+MIrvM6zfMVfLR27somX+F5tm/T53zRfb66OKxF8SNTTuz2rRuzCKJbenQCVA==
X-Received: by 2002:a17:907:d089:b0:7ad:aed7:a5da with SMTP id vc9-20020a170907d08900b007adaed7a5damr42286398ejc.28.1674759669094;
        Thu, 26 Jan 2023 11:01:09 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id o25-20020a1709061b1900b0084d4e9a13cbsm974982ejg.221.2023.01.26.11.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 11:01:08 -0800 (PST)
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
Subject: Re: [PATCH 0/3] drm/msm/dpu: several fixes for UBWC setup
Date:   Thu, 26 Jan 2023 21:00:53 +0200
Message-Id: <167475959085.3954305.638885945144543284.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221207142833.204193-1-dmitry.baryshkov@linaro.org>
References: <20221207142833.204193-1-dmitry.baryshkov@linaro.org>
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


On Wed, 07 Dec 2022 16:28:30 +0200, Dmitry Baryshkov wrote:
> Several small corrections for the UBWC setup and related data.
> 
> Dmitry Baryshkov (3):
>   drm/msm/dpu: handle UBWC 1.0 in dpu_hw_sspp_setup_format
>   drm/msm/dpu: correct the UBWC version on sm6115
>   drm/msm/dpu: add missing ubwc_swizzle setting to catalog
> 
> [...]

Applied, thanks!

[1/3] drm/msm/dpu: handle UBWC 1.0 in dpu_hw_sspp_setup_format
      https://gitlab.freedesktop.org/lumag/msm/-/commit/975b86f8c2a8
[2/3] drm/msm/dpu: correct the UBWC version on sm6115
      https://gitlab.freedesktop.org/lumag/msm/-/commit/7a9898ec3018

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
