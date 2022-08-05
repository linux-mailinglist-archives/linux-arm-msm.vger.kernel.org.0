Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D828158A76E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Aug 2022 09:49:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240258AbiHEHtq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Aug 2022 03:49:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240325AbiHEHtm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Aug 2022 03:49:42 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DA0F6D9FA
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Aug 2022 00:49:40 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id q9-20020a17090a2dc900b001f58bcaca95so740608pjm.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Aug 2022 00:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OfJQ8R0mCATwfI9fDCSGJfum0HkydojZTInFEU0mh0s=;
        b=cg0d8WnsOC1iIPYdRWXIufJvvz0yE5RvdVFrp4iL6f5ZCwOYx69KYXVa78G8Bdl7gr
         +e4R28x2ri1DxIqRQwx7CnU83DUeSibBeNqItmp29GXANjTSoeigmt9v81sUmhRYahMd
         9zZfQNebmSQXCTdbazgvxFnSuhXWzJhwXnlE2PS6aQAbQ4QufKDOGFmeHXVu+ybHeYTX
         C70rMbUq6neZ+V8y8InCaEcKnhykI3dYE6ZeA68mN4ZmLRWXEvilKSCAy4Uh/GdslfhV
         DpGy3rFB5FNKbvL98m0a0yS4nCG/JgVjzTIE7Wt4WxnOOsPGwcGosug3Z+VIRI/2pFvs
         tmIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OfJQ8R0mCATwfI9fDCSGJfum0HkydojZTInFEU0mh0s=;
        b=ltaaAPpzf32WtimDfTcXIw32fkrPDe/T8ngd0zbk3LiDsVhH1KfoiRmP3eCm/PbKbN
         OphWRynTJbUDrtcTMnUxj/RpIRTy2CRHhT8OPrvT352NSunxbdEs8vGtwF20Ap7wPoCe
         bmxAUWCBZ56UscO4JIgGSRKuLPTrdDXS5CI34NIK/WRZrvJ5ohOQYK8dO1EoeJctuTQn
         zblrw+AoNwr7XL3dZzLdZHY/QuB5n53wIpRejbCCbnNXf1hKgOwzqA7x6gi0YuvZgN/w
         N+gxiHK9j4WPz+xwvGN2+SNKK13XYezfxDwTSET/64mKnPVBqOWRLg9bv5NStfgZN4Jo
         eqtg==
X-Gm-Message-State: ACgBeo3Zhg5AMeGStjlUqE4uorAmU7FiGN3M9Y8AYSaCYDCKNtRxcEc9
        AlmtAC1bbk9BA2lMq+SspVOhMQ==
X-Google-Smtp-Source: AA6agR4DtEbCApfwN8bj4IG/rcCrnLp0hlFCiYrmCNx3R2PtzojGHcqnDTsqNj53R6uQfCpHwfL++Q==
X-Received: by 2002:a17:90b:38cb:b0:1f5:2321:63cb with SMTP id nn11-20020a17090b38cb00b001f5232163cbmr15034139pjb.110.1659685779870;
        Fri, 05 Aug 2022 00:49:39 -0700 (PDT)
Received: from localhost.localdomain ([45.8.68.134])
        by smtp.gmail.com with ESMTPSA id z10-20020a1709027e8a00b0016ecda71e26sm2309372pla.39.2022.08.05.00.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 00:49:39 -0700 (PDT)
From:   Jun Nie <jun.nie@linaro.org>
To:     abel.vesa@linaro.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org
Cc:     agross@kernel.org, shawn.guo@linaro.org,
        bryan.odonoghue@linaro.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Jun Nie <jun.nie@linaro.org>
Subject: [PATCH 0/4] Support dynamic voltage frequency scaling inside clock controller
Date:   Fri,  5 Aug 2022 15:49:31 +0800
Message-Id: <20220805074935.1158098-1-jun.nie@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Support dynamic voltage frequency scaling inside clock controller with
changes in clock framework. And added msm8916 as the first SoC to
support this feature.

Jun Nie (4):
  clk: Aggregate power operation in clock controller
  soc: qcom: rpmpd: Add corner power-domains states
  arm64: dts: qcom: add power domain for clk controller
  clk: qcom: gcc-msm8916: Add power domain data

 arch/arm64/boot/dts/qcom/msm8916.dtsi  |  14 +-
 drivers/clk/clk.c                      | 212 ++++++++++++++++++++++++-
 drivers/clk/qcom/gcc-msm8916.c         | 182 +++++++++++++++++++++
 include/dt-bindings/power/qcom-rpmpd.h |   8 +
 include/linux/clk-provider.h           |  62 ++++++++
 5 files changed, 470 insertions(+), 8 deletions(-)

-- 
2.25.1

