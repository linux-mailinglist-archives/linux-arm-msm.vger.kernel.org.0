Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33EC3561047
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jun 2022 06:35:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231852AbiF3Efm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 00:35:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231416AbiF3Efm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 00:35:42 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1771A1F2D7
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jun 2022 21:35:41 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id i25so19858705wrc.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jun 2022 21:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mF82bNKU7H4VWQP1YGukVst2LLNLKLALPHMqosyLacQ=;
        b=sFewG08kIEOas7MAKG8nACszaWiiZX9jCyBqLE/xBMk3SfClZEGO8IhZLjWcJ2fgPU
         lnHAn/0mOi0tu3hovtuId46ERS/2EN2fQ3f6WWBeqtkX8YAKo49eAF67kCGEc8atWCly
         pb7oOXfxHlUYYNIw/ycdg5XUeYCsxTBuDZ0ypgEn3l2fsNhFjGPwFClbs0ZvbKKWu2mR
         UL7KhMYDIRwOoT6VgywuDsFe+4irSHen6muKLUY0zsvWJ5O2EcxKC1FCnIUN5JAMPoNg
         dQYoivATX/59pc+CEi9UGyLu88QDAkE/q+oMHs4qdlfl1t0M0UxgKD7kaPHiuRyn+zi+
         AKpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mF82bNKU7H4VWQP1YGukVst2LLNLKLALPHMqosyLacQ=;
        b=lFhtAgGrVU/+8F+5Q005RWXTANZK/V8cwbsdBbwDzojmfhXzre10ODEu7n2M7/2hyC
         BlQCDPJyT3Z8t/D1FuXaDZuQ8rwyUVPMlYXyhgn3nTTVdFV2mqgz7rpyzSwYqdcB6TBR
         KD8bRl+VHZvjWFPiJPBqCvFaZXT1LBWv9tJv88Zt8Z/5cZVIBnh+WM5/LdSe7XoOhEau
         zHkfsbUabaTtgtNVFH0+3KNHaIgm3J3mQY6c1ar+X2dPbGSoMOgKYfrOFIr7ln1OV9Up
         D6MMqVMO4O4FqOhYbj2lntQyXQ9ZQX1G7IVyqBrWOGAh0DsBtYQxlZ/TGTNKNwb2r0zA
         hYXA==
X-Gm-Message-State: AJIora+ov9R2SacumkCWoVbbV+8/R8cz61HjKIxfnn2yewfnslOvcrvX
        kpyYfrO83dfQnvNFTo7E3uUq/g==
X-Google-Smtp-Source: AGRyM1sYqdpwtzWOHk363f7BKWapsJVRhHSOK/anpZD6GbS9MUXD6TzzAcvrrYxs8k2VHxfWMvJN3Q==
X-Received: by 2002:a5d:53ca:0:b0:21b:940f:8e29 with SMTP id a10-20020a5d53ca000000b0021b940f8e29mr6400535wrw.490.1656563739666;
        Wed, 29 Jun 2022 21:35:39 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id k1-20020a5d6281000000b0021b9e360523sm18642335wru.8.2022.06.29.21.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 21:35:39 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        jassisinghbrar@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        bryan.odonoghue@linaro.org
Subject: [PATCH 0/2] Two apcs-kpss-global.yaml fixes
Date:   Thu, 30 Jun 2022 05:35:34 +0100
Message-Id: <20220630043536.3308546-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
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

Adding in msm8939.dtsi and running the binding checks is throwing up two
errors for me.

In the first instance we use syscon on the 8939 and should declare it in
the compat list. Doing a quick grep it looks like that fix should be
applied to a number of existing declarations too.

In the second instance we just need to document clock-output-names for the
a53 mux PLL.

Bryan O'Donoghue (2):
  dt-bindings: mailbox: qcom: Add syscon const for relevant entries
  dt-bindings: mailbox: qcom: Add clock-output-names

 .../mailbox/qcom,apcs-kpss-global.yaml        | 49 +++++++++++--------
 1 file changed, 29 insertions(+), 20 deletions(-)

-- 
2.36.1

