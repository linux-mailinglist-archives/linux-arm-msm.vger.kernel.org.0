Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95330663596
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jan 2023 00:44:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237912AbjAIXo0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 18:44:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237721AbjAIXoM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 18:44:12 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AC373FC83
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 15:44:05 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id bp15so15588944lfb.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jan 2023 15:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/freu+ZgmiBA4hrBK8o79X6HX9HTTyxAvA2ufrSoK0=;
        b=ei8MTQp7vxUDhE4iKnFq1/ntIVOdVd6tuXdIpOwfrtvx6atVRVyyPKbWmpP1rvFscm
         L/HdGhjbrE+c7TQb0HLPWkDmPusmKnPG+9MOnxpN3/Kf7+ZcxOf74CrMNZKh4weg2gn0
         VAa2vJLjrJdKTjoZlopffsHF0cON4Oosur23OYVwDAeP7QV/D66IEuheo8TXkNSBuSiE
         t4YdtaaGJMd7+GqNvB+m3/veyYEY64bKKMEoZMJ3L5/uN5rWfRg1YOdEMCW7OruZol2/
         PzAjdWAqIKpW2myPiH8sn1TYfz6YIweA2qsyX9r1VZODVzIvPbIuiP31Ckl4nw1fgCr2
         cXLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U/freu+ZgmiBA4hrBK8o79X6HX9HTTyxAvA2ufrSoK0=;
        b=wpnFKuhefahRDnSt/+j2z4gHc9FJ3JDYvhuI63BCFtEoIZhnE0DhB9LQ/fEXdiu33t
         OOVwQfzElPo7h+TmFlrn1FfCvJaGBIYLoZWvRAAohuxYw6mzILpBscwfqqiK/Fx9Dg22
         IW5wShqpIm0EKKk/XzxaTwwO0U3Pd2vhyOISTbqChRSh6/NuwxqmEVOEAsJafy36bEtt
         Wueu/sskdKlVPoEKb/5RLBQ5SoKB4ZgKJrptQQT77K5bc2HuxY8xBWNVO5+IZR2uYyAQ
         D70PDvtZd6rSXOkKRrbdWcdHp8cp/UGN4MR2DGtc70ejZ9MHzZ02lVNQddyNGO9Gul9y
         D+Qw==
X-Gm-Message-State: AFqh2kqmwn8ElTd0ZC3Wu6tjho+JxjOsMQxk/zrtGsgIrjnCRY/wV2gi
        szqHxwNRQSV8QPF010iVuhLdSg==
X-Google-Smtp-Source: AMrXdXvTqLgwZKbMxDEd7mTBv9Kz2IZ//DCx8MFrgLL57L7EaiB/j8/l1Pzsuay0XCa3nvGoVipSxg==
X-Received: by 2002:ac2:5231:0:b0:4a6:c596:6ff7 with SMTP id i17-20020ac25231000000b004a6c5966ff7mr16944972lfl.2.1673307843575;
        Mon, 09 Jan 2023 15:44:03 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s9-20020a056512214900b004b5a4cf69dfsm1835255lfr.261.2023.01.09.15.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 15:44:02 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH v6 0/4] drm/msm: convet to drm_crtc_handle_vblank()
Date:   Tue, 10 Jan 2023 01:43:47 +0200
Message-Id: <167330408779.609993.9427004517463466813.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20220617233328.1143665-1-dmitry.baryshkov@linaro.org>
References: <20220617233328.1143665-1-dmitry.baryshkov@linaro.org>
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
