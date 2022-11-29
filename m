Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51CB263BDAB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Nov 2022 11:12:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229954AbiK2KMA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Nov 2022 05:12:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232389AbiK2KLo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Nov 2022 05:11:44 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B0035F86B
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Nov 2022 02:10:28 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id a19so475004ljk.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Nov 2022 02:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KDM+ShLi5j1R3rBNlVsV4BO3GL6r9EGCePLwu3eI7YY=;
        b=TEPDnPhDWvVIej9MlCwmigOjBKXoR5+M8Hy3gBFWWMnoCHfhPp+Y1Yj5cgymj0qX58
         NJNd+LIE5pW8hdvulLI2/w6dfpNc3md1/RsFSitQOH1Pf9E6fxDNNnsw8Nrcsr24ErjV
         N7baOrVbFR4w3waf5QMzo3NthMO1xjqbCtUei8WbDveLSyQzDw8tyTepyJKgVAWd4IrB
         W5yiLm+yJT4yxdsKnkQTwpneme1bUhOhcgV4kjLJpzJiKBvBRGjUlV90ctdIdoJN+gHG
         k1BkTtkh2k4g/HtfddL3qnWDsPqV1FlZObhc9MaIRW5dew5cZkSy9O1ramT76qWIwH2E
         TFmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KDM+ShLi5j1R3rBNlVsV4BO3GL6r9EGCePLwu3eI7YY=;
        b=A6sn1Xz4Q79jgXsdMJVNo/xofPv7OZ6TfwCY/jFJgy8I/VSjrK0BBVsJd9CwhOuq9n
         fQZ3qdlxT9VKw7SjuiQA2zNhqMVDg+gv8AQhA+UUntHpcWaHZ0vUWDNKIYhLg8skX6eR
         3YS/XkPbSmxXMLhmFWE78PrPAg9pHa0ngI3PyLkosNjFcAPYiU+bUFY/enKgIiWXA3wt
         zTRbQBeGZVj+RyAh6aCFkFene58FlDG0T2XDUKnuDTNUBYK53BeCOZiIyyalMMiA1P7I
         iwIOg8Tn+2SEyw71atvvky0kaPRA+fjlb/Ug/Hhfvy2xuvz4r5PNHmkN5f8XQ83aMRJW
         FNWQ==
X-Gm-Message-State: ANoB5pmSgXa4HfysMu8NDjs7PJak+Uuyx7GuIBFLgBP65ceREiHzIVSQ
        n52g5wld8pcWXzE9aUkpDJBA5oRoQ28+7g1R
X-Google-Smtp-Source: AA0mqf6bY3ojWKTwwPnA4/VbJnCoaHvCgzWvXVFaGKunsI/yTRx5Vt8QqIGHBN/gBofIaa95UO7kIQ==
X-Received: by 2002:a2e:9c14:0:b0:277:5665:2404 with SMTP id s20-20020a2e9c14000000b0027756652404mr19282499lji.155.1669716626580;
        Tue, 29 Nov 2022 02:10:26 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id a12-20020ac25e6c000000b004b0a1e77cb2sm2146642lfr.137.2022.11.29.02.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 02:10:25 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
Subject: [PATCH 0/4] clk: qcom: rpm/rpmh: drop platform names
Date:   Tue, 29 Nov 2022 12:10:21 +0200
Message-Id: <20221129101025.960110-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

Both RPM and RPMH clocks use platform (SoC) as a part of the clock
definition. However there is nothing really SoC-specific in this
part. Using it just leads to confusion and sometimes to duplication of
definitions. Drop the SoC name where it is logical.

Note: the smd-rpm clocks also suffer from the same issue a bit, there
are platform-specific and platform-independent clocks. Corresponding
patches will be sent later if this approach is accepted.

Dmitry Baryshkov (4):
  clk: qcom: rpmh: group clock definitions together
  clk: qcom: rpmh: reuse common duplicate clocks
  clk: qcom: rpmh: drop the platform from clock definitions
  clk: qcom: rpm: drop the platform from clock definitions

 drivers/clk/qcom/clk-rpm.c  | 194 ++++++++---------
 drivers/clk/qcom/clk-rpmh.c | 419 ++++++++++++++++++------------------
 2 files changed, 294 insertions(+), 319 deletions(-)

-- 
2.35.1

