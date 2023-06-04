Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 234B972143E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Jun 2023 05:01:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229940AbjFDDBx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 3 Jun 2023 23:01:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbjFDDBq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 3 Jun 2023 23:01:46 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1802019A
        for <linux-arm-msm@vger.kernel.org>; Sat,  3 Jun 2023 20:01:45 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f60a27c4a2so4029274e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Jun 2023 20:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685847703; x=1688439703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H4JfXikkMKanDCzgpf1+Ce6ZYTjTAFBs7io/Q5LFwuI=;
        b=yrEofRfbu3dzVN4kOUdLEcwuRepp0hlMduUb/t28RAk6id2fV0Ihre54GXl7W98fzl
         4ONqa0yH2b9gDEmiSncUu4i0ysoOzsbjiuz71hjWEyf+j+mNXe/R3e3W0mmjeg/g5X3+
         1qpIhFV8e4knPsUqXakaHluID3ka7e6d2ysONSjRMaP2u07pxKSIgSO/RBUoz89zA5Qd
         4sGzhjx8E3snKVMvkpAhqJxVYP3Y7j9lTM2yqkdlzK9LEj7Qau43+9lM8hA6i0mkz2Qn
         D9DOZ2uNoVIBbRphPT/Fc9H+Dm37BvPcFUzEzxOY4JA76Bb4eNpMftlTiE91HuINen5S
         F8Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685847703; x=1688439703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H4JfXikkMKanDCzgpf1+Ce6ZYTjTAFBs7io/Q5LFwuI=;
        b=RJqzeeQZAC/oDaxYWZ3A4flnkYanf+/1kSnSuzhaxkJom2JJohZUNOKA+I0isodrdU
         6eldkawbh45jaQ7xHBEWkheFCaqGnvfgytL9QQViEsL+qbLmzAIYc/BxwqZ5N1KNly6G
         /kwVM0fJM2P42oWiBdZzKjWdYNrXGTUD8GU2pXoCqyGF89NF76/kkL2ltPDrBhXhAOIv
         0JEXneKL1GTqRhOTdqU4JbVkdqzuCBU6SzrAlpVYwy3z1SuHUumItscmYFUcJ1mc24yY
         MmOx+9Z4galhMNORWQjEk8gDdWvOpyo04pVFsKx1HnwMdyijWN2ea5PBBLuDi3qrW6Wy
         Jwmw==
X-Gm-Message-State: AC+VfDwoepPLa2EBa79mmhMJFhu7BvT6VTKpgvvw/UsdmUgEqlXhJwxN
        w3kGsax15qIcygIeyuwFBcJJtg==
X-Google-Smtp-Source: ACHHUZ6VQnUAgekbOeBmv5OPbjpVHhR6iZZYiH0sZcYIkuFguqVUe9jewQJtkb9oxjoR8+v6SnxgDw==
X-Received: by 2002:ac2:4245:0:b0:4f1:3d9f:1b4f with SMTP id m5-20020ac24245000000b004f13d9f1b4fmr3616341lfl.49.1685847703457;
        Sat, 03 Jun 2023 20:01:43 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id d15-20020ac24c8f000000b004eb4357122bsm653181lfl.259.2023.06.03.20.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jun 2023 20:01:42 -0700 (PDT)
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
Subject: Re: [PATCH v3 0/7] drm/msm/dpu: simplify DPU encoder init
Date:   Sun,  4 Jun 2023 06:01:31 +0300
Message-Id: <168584750426.890410.3227550430081173245.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230601172236.564445-1-dmitry.baryshkov@linaro.org>
References: <20230601172236.564445-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Thu, 01 Jun 2023 20:22:29 +0300, Dmitry Baryshkov wrote:
> Rework dpu_encoder initialization code, simplifying calling sequences
> and separating common init parts.
> 
> Changes since v2:
> - Rebased on top of msm-next-lumag branch
> 
> Changes since v1:
> - Withdrawn two pathes for a later consideration
> - Changed dpu_encoder_phys_init() to return void (Abhinav)
> - Added small simplifications of dpu_encoder_phys_cmd_init() and
>   dpu_encoder_phys_wb_init()
> 
> [...]

Applied, thanks!

[1/7] drm/msm/dpu: merge dpu_encoder_init() and dpu_encoder_setup()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/9b930f14e530
[2/7] drm/msm/dpu: separate common function to init physical encoder
      https://gitlab.freedesktop.org/lumag/msm/-/commit/7731ee3b06c1
[3/7] drm/msm/dpu: drop duplicated intf/wb indices from encoder structs
      https://gitlab.freedesktop.org/lumag/msm/-/commit/8ea432b8428e
[4/7] drm/msm/dpu: inline dpu_encoder_get_wb()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/04ada3d8380a
[5/7] drm/msm/dpu: call dpu_rm_get_intf() from dpu_encoder_get_intf()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/004be38657f4
[6/7] drm/msm/dpu: drop temp variable from dpu_encoder_phys_cmd_init()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/ed02d3dd18dc
[7/7] drm/msm/dpu: simplify dpu_encoder_phys_wb_init()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5d1227d1c7a3

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
