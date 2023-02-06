Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2335768C0A2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Feb 2023 15:57:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230393AbjBFO5T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Feb 2023 09:57:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230407AbjBFO5S (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Feb 2023 09:57:18 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F34A425BAE
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Feb 2023 06:57:12 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id mf7so34937674ejc.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Feb 2023 06:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D1ct+0Sro7EnXGsDjzq9X4UuMN/Rv5Rt1GCdZWWWtQ4=;
        b=g0lk6lQ9/5qDlN+jx+cIKAK+CzDdnGuY79fTWxVVVflZQYXH8iOFmI4KMOSOrIvhyB
         yvGuhqjex8kNCLXPbiLkRDL2D7Pdf9T8r2q2SilOM1VHQB/sYjT+WEhT340g/LZBcyEa
         98Zxsn4QZcvfL3KJGXgA5UGz0A9/r0gU+NOeJ1YWeyYRhD7kBdkLnjBmhTG/yi0jbDTR
         MV9bFXXpKsxbiKaZXHRzUWiUz3dO2Vadji/AGOZzxHcmsK5bl2Z7UbdVObYptduxl4Nf
         O9X/ICh1iLtn2b3dbyqxOTZcnbOuSBaXM60072rlPwt6zxl9Dzf3AUlHF0rVlKlmn+wN
         kOuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D1ct+0Sro7EnXGsDjzq9X4UuMN/Rv5Rt1GCdZWWWtQ4=;
        b=wQ5PyhyKETG2GjjueizF5BYFb7iWcBW6s4shSIfxua06QVOTmvi4+4ZzzQYC1LSadG
         MChCX0UttlizXPINfymjgVbHzASkwSMr+7QLVTHImgN852jgPtGMryidQI/Ca+ao8kkx
         q284+qxbsnt0RA/3iQVhxrDlWYgUniRMRJd1PGgaP4JVF3tBnUByeoHafdqY3OjQxqih
         cFRJXsDfXkShl6MmphKuNPifRydW9cmtkuyy9V3OIgbcI7By2qRY039MGd2SEr/groOr
         +8t9VE/GXMLmkd8fWC/+cxjgH5Wa9n5ES/v6JyJVXzD3TRgul7lTvuOgpQIn33OYczSW
         faJQ==
X-Gm-Message-State: AO0yUKUN/Aa2otWOP1odfZ0MOeyXM+sGPENKjz9lZW5OefwkoPDbTk3v
        XpfS8eqRUyBBp2zugMkxFZwNyg==
X-Google-Smtp-Source: AK7set+fswQrgLJfUMmLNflu3azfuIvJJxV2viagzNwy/64d4QWg+EyABuN80ZeWFRLqMjPKz502HA==
X-Received: by 2002:a17:907:6d9c:b0:895:58be:957 with SMTP id sb28-20020a1709076d9c00b0089558be0957mr10435653ejc.2.1675695431555;
        Mon, 06 Feb 2023 06:57:11 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id gw1-20020a170906f14100b0087bd4e34eb8sm5495533ejb.203.2023.02.06.06.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 06:57:11 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 2/8] dt-bindings: power: qcom,rpmpd: add RPMH_REGULATOR_LEVEL_LOW_SVS_L1
Date:   Mon,  6 Feb 2023 16:57:01 +0200
Message-Id: <20230206145707.122937-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230206145707.122937-1-dmitry.baryshkov@linaro.org>
References: <20230206145707.122937-1-dmitry.baryshkov@linaro.org>
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

Add define for another power saving state used on SM8350 for the GPU.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/dt-bindings/power/qcom-rpmpd.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
index 4a30d10e6b7d..1bf8e87ecd7e 100644
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -211,6 +211,7 @@
 #define RPMH_REGULATOR_LEVEL_MIN_SVS	48
 #define RPMH_REGULATOR_LEVEL_LOW_SVS_D1	56
 #define RPMH_REGULATOR_LEVEL_LOW_SVS	64
+#define RPMH_REGULATOR_LEVEL_LOW_SVS_L1	80
 #define RPMH_REGULATOR_LEVEL_SVS	128
 #define RPMH_REGULATOR_LEVEL_SVS_L0	144
 #define RPMH_REGULATOR_LEVEL_SVS_L1	192
-- 
2.39.1

