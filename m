Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A5867B75E0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Oct 2023 02:31:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239120AbjJDAbd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Oct 2023 20:31:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239076AbjJDAbc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Oct 2023 20:31:32 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0728E8E
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Oct 2023 17:31:29 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-53627feca49so2562950a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Oct 2023 17:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696379487; x=1696984287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5Qd0XvFZtCnhjNqi7/qhEELkHRvsFwfJrMU0NXf13IA=;
        b=Y+UX1RHaB7qqaAKWlHgKkbxp/X9/onvY/8G/pCMYYsGwXq+jwWRSNy0tz1/47N2BXX
         bpdSL403WZtNpMwgBB1/jsR+kXYa39sjhO7RVrfHEyLfLG2LsTlpzUSMSVJVA/GeIBs3
         lRHyPHV1JtAu63fMCKjWJkrwKvrFjHSG1xSvOe5olGkziWXt91nISVX3WlXxxi+VgD9Y
         BOHEruv9CQAERRy3AKFyCNvMmNbuTxdtJFTgFocGiXYTOVujBBWi3fWwrKY+Mqo5x2rV
         ff4ehLX8CNoF7WRUgg7nUbEoUrV0KMhA2uklTMDaes/s3TcN1e+Wx1lgzptzKgaJssLg
         TWzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696379487; x=1696984287;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Qd0XvFZtCnhjNqi7/qhEELkHRvsFwfJrMU0NXf13IA=;
        b=TR97kPH/cWobYi7DEWrIPRx8oSRW4N43TE2gv0bzoSBNYgT88daCKGbBIGKWpNOw8H
         RS2E2FBTM32ROs5hO7PB9Si3Od6Pv4m/ZgQx60bhQoobBbJImob+wuIk7J7VtqSXHjT6
         Sq+8z0whrB7aqJ1ySzqUozyxRVbcmOn8Cx2HHTyRaeJHuO7ESuiBGDVeg3NilIVWaRJN
         avubcnrxGJKlQhYk577rok1MLCJUMrxZoKFEmBvqz4Pp0eIjj2oyrWKmMkcuEFsN4g33
         NQ24+Zaq5EdILPd/brLmHwBpddIyeJO7RSp03MIP4UlYxvVSCHhBTledPMck4DZMDEPf
         aoKw==
X-Gm-Message-State: AOJu0YxdbUdRIlQhzU0L3f2KL5dheZft9rZoALKcxafqZN32+pN7DFkG
        2bxTdks3gh9tu+7jJFGXSXSFvQ==
X-Google-Smtp-Source: AGHT+IGgOw+KKnQkv0lbmacveyuE26amjk0smzsNyHfmaKinFgyepdVzf6ui+/+RR+BxAV/eMTj1eQ==
X-Received: by 2002:aa7:d703:0:b0:530:bbeb:571 with SMTP id t3-20020aa7d703000000b00530bbeb0571mr646676edq.36.1696379487071;
        Tue, 03 Oct 2023 17:31:27 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u15-20020a056512094f00b005056e8bebb8sm366937lft.124.2023.10.03.17.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 17:31:26 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>
Subject: [RFC PATCH 0/2] clk: qcom: provide alternative 'parked' RCG
Date:   Wed,  4 Oct 2023 03:31:23 +0300
Message-Id: <20231004003125.2289613-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Implement an alternative for the clk_rcg2_shared_ops, which also
implements a proper is_enabled callback. Note, to use
clk_rcg2_parked_ops one must remove XO (safe source) from the
parent_data and parent_map.

Dmitry Baryshkov (2):
  clk: qcom: implement RCG2 'parked' clock support
  clk: qcom: dispcc-sm8250: switch to clk_rcg2_parked_ops

 drivers/clk/qcom/clk-rcg.h       |  1 +
 drivers/clk/qcom/clk-rcg2.c      | 34 ++++++++++++++++++++++++++++++++
 drivers/clk/qcom/dispcc-sm8250.c | 10 +++-------
 3 files changed, 38 insertions(+), 7 deletions(-)

-- 
2.39.2

