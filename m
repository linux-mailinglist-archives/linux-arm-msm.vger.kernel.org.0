Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB11B72143C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Jun 2023 05:01:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229546AbjFDDBv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 3 Jun 2023 23:01:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbjFDDBp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 3 Jun 2023 23:01:45 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56E2E1A8
        for <linux-arm-msm@vger.kernel.org>; Sat,  3 Jun 2023 20:01:44 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4f6255ad8aeso180744e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Jun 2023 20:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685847702; x=1688439702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EOhs/tS1z2KZqjSiRBgaVj6mrShh0pQk1Td6JEJ93d8=;
        b=DYUVb/FPnmCn5BudxjU2PrMMrcUxNwdQO0JgFLwbXz/d8+BbFM3tDX4igYIZ1lAXOi
         o02H6Om9llDzfCLuEe+b6QaXBLLpVr7oEauSlZkrSqsceQIEDLda57b7NdpEoGyS4m6T
         elwDItQZFXUb5YDL8+vwI6FZD5Qc6o033tJenpgUrxFRJjF1MKZyRXD3niIlhhAnsITR
         fPrwPQnolNPSz6qQAdX/ROkM6fl7J6/S+d+UoM07B3aQAuXUZdJJaiJ/hcH3Ot0vXpJ5
         xM1hHLyG5qK8tmfDCNKfkK6Y2J83ZdZApJnzYuBsQx5QQfs0UdNt9hsMaG7cKfpFBsYF
         lGHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685847702; x=1688439702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EOhs/tS1z2KZqjSiRBgaVj6mrShh0pQk1Td6JEJ93d8=;
        b=irdLwFElJTr68rijnSCVJxkDTPWfnzha7USYo+ayFHUbPSIxBnVN/VCWRtj62FHRAX
         w2392Ji9nlEIHibppXdL70mbIpPKJt+I9CvYZmH1kSw0G71HeAiqxklwDd7HPWoFJYhk
         9IGgNY3PHIEfSLxcUwwIMiFhNJ98KbWH1u4N2/tBOYPCcNPq2upu++eblAzSwjoHrx9C
         4vmd4qwf2OYepVbYfCMA8c1E44BH/8iMvOmu1wLLbOcYXv6jd2tlYnzqeeMdbol/CUXA
         z6PakMK+8CpYRzzcjIhrmkDIPeU2X1xSNqRPlplkgwHeFPQNrJ6+T0+XLFcf78v4NfMj
         cWgA==
X-Gm-Message-State: AC+VfDwrNmkYPZTxaM5bzpR1QZuCVI6N3dhLJ+PIonAB51AOiPPTkj2N
        RVc7T27NOW0O5WJ4vIX82Agj4Q==
X-Google-Smtp-Source: ACHHUZ6IrLL+2bXjdukj4F3KjJLmrz/q4vPDuE2sfcdPIw79Y1yE/TxkzF+its+HLg9OV4mCFwz1Ug==
X-Received: by 2002:a05:6512:98b:b0:4f5:a17f:4897 with SMTP id w11-20020a056512098b00b004f5a17f4897mr3669531lft.43.1685847702602;
        Sat, 03 Jun 2023 20:01:42 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id d15-20020ac24c8f000000b004eb4357122bsm653181lfl.259.2023.06.03.20.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jun 2023 20:01:42 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/msm/dp: remove most of usbpd-related remains
Date:   Sun,  4 Jun 2023 06:01:30 +0300
Message-Id: <168584750426.890410.9360297124272055235.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230520182050.4014143-1-dmitry.baryshkov@linaro.org>
References: <20230520182050.4014143-1-dmitry.baryshkov@linaro.org>
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


On Sat, 20 May 2023 21:20:50 +0300, Dmitry Baryshkov wrote:
> Remove most of remains of downstream usbpd code. Mainline kernel uses
> different approach for managing Type-C / USB-PD, so this remains unused.
> 
> 

Applied, thanks!

[1/1] drm/msm/dp: remove most of usbpd-related remains
      https://gitlab.freedesktop.org/lumag/msm/-/commit/1c5f6051ffdf

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
