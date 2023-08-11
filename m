Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDAA2779B19
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Aug 2023 01:16:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234905AbjHKXQY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Aug 2023 19:16:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233189AbjHKXQW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Aug 2023 19:16:22 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2415E60
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Aug 2023 16:16:20 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4fe7e67cc77so4042090e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Aug 2023 16:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691795779; x=1692400579;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n5AP0tJseIFYkTlhR3QIqGiIBK1ASV4L4JPhzWgvurs=;
        b=uZ02Tzrhpz3B1YN9MvjCw12UyvteJesj+TF2bjuFECQ9j48GhF+TqcYgP8mNztqK7J
         OVm/TCnO/J+3esj5MTIO/taRbpaYAMqNZQYvuHwMm+chh3scVytsNnSpjuztLuv+qrDx
         9m4FbQGag6C/CyDBpTWAL6a6NBcVARJHeW9yRaeFTTWa4iBjSHv1M7AidRkTYj9FRftj
         569fa0HZVL7TfEhVLjFvnGdmeM0Rfnl+oKnrNGJGBJt1bAQ/zrp5Hr5tVbkzaYj042JC
         y0DwA+Xu/UkxTiWSuDskKX9sc0xbUc5nwjzTxD9wiAEBE2N3yvVP+ib5lnXZd4yx/Adn
         1E9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691795779; x=1692400579;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n5AP0tJseIFYkTlhR3QIqGiIBK1ASV4L4JPhzWgvurs=;
        b=JQSRhC1mKz6q7lsr0/88GTIzlCAQptK8ADA9LGmEMvlY5BlREnFMCpmADx7hAujC7x
         Dkox72nvjBsl2l1Ma38ljVbJ9Voa06uSaZjIZA3KUgh0NFeka2g/4Ctdt+Hvy3qteWax
         gZRYrNxEZSmitb6wnnC1EBOT+usRRkeFSQLn9R5SfExWCX0fp0rPgy546XsIeVGq8OAr
         EWV/3FC83axGsDoMJJciob0+98J3/d3jZEk2NKWiNmLL2TKK+3lpWwRXMpB4CyGyFxlL
         j5mJXpw7fHRh0U6vnTI6o+bxI/0dSnB74fJ+T1TY0tOIKuDLOnzOf7XwVHdLxO/7LEME
         s4PA==
X-Gm-Message-State: AOJu0YyUkdUaXPRkLviv02+ao0hqfpIG7+vY7LYZ4kzJdznPZoTmEixM
        NABc21RajvYK4hssxVJdVk0+Ug==
X-Google-Smtp-Source: AGHT+IH2vUHhQYAztEj1Urvk7+74E2NGiJGO7yyU2Mu6d5ah3sJi+p+YeE9osxQG0ELpkusAMxiaIw==
X-Received: by 2002:a05:6512:1054:b0:4fb:caed:95c3 with SMTP id c20-20020a056512105400b004fbcaed95c3mr2696985lfb.53.1691795779041;
        Fri, 11 Aug 2023 16:16:19 -0700 (PDT)
Received: from [192.168.1.101] (abyj188.neoplus.adsl.tpnet.pl. [83.9.29.188])
        by smtp.gmail.com with ESMTPSA id m16-20020a195210000000b004fe48332852sm884773lfb.136.2023.08.11.16.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 16:16:18 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v2 0/2] Improve enable_mask handling
Date:   Sat, 12 Aug 2023 01:16:14 +0200
Message-Id: <20230811-topic-icc_fix_1he-v2-0-0620af8ac133@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD7B1mQC/32NQQ6CMBBFr0K6tqalqJSV9zCElHGgk5CWtEg0h
 Ls7cgCX7+e/vE1kTIRZNMUmEq6UKQaG8lQI8C6MKOnJLEpVGlVrLZc4E0gC6AZ6d9qjrJQztqp
 7VQ83wV7vMso+uQCezfCaJh7nhPw/Qo+W2VNeYvoc3VX/1n+JVUslL2CvADgYY+19ouBSPMc0i
 nbf9y+jJTBiyAAAAA==
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Mike Tipton <quic_mdtipton@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691795777; l=1117;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=CV50Ks9I8A5OMl9nGW5N4CftwCwBWF8T5/FTPzVvlng=;
 b=Hg2lHVMiwl0P5WNhLVhD5veYXoquUo6ROy4sZsx6VhwguLWW44+sLLIHPJzYh/2Fq6NyFz3Px
 KTgH56MWC8EAuX1XybLQD9Uk+ZI7caI1m6i1jcfZesOjBwYSs3iWkCZ
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As pointed out by Bjorn and Mike in [1], we can simplify the handling
of enable_mask-based BCMs. This series attempts to do so and fixes a bug
that snuck in.

Gave a quick spin on 8450, doesn't seem to have exploded.

[1] https://lore.kernel.org/linux-arm-msm/113b50f8-35f6-73fc-4fc9-302262927c5e@quicinc.com/

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Changes in v2:
- Rename bcm_aggregate_1he to bcm_aggregate_mask (Mike)
- Fix never clearing enable_mask that was once enabled (Mike)
- Pick up tags (Bjorn)
- Link to v1: https://lore.kernel.org/r/20230811-topic-icc_fix_1he-v1-0-5c96ccef3399@linaro.org

---
Konrad Dybcio (2):
      interconnect: qcom: bcm-voter: Improve enable_mask handling
      interconnect: qcom: bcm-voter: Use enable_maks for keepalive voting

 drivers/interconnect/qcom/bcm-voter.c | 43 +++++++++++++++++++++++++++++------
 1 file changed, 36 insertions(+), 7 deletions(-)
---
base-commit: 535e616fd036bf8f2307b0f02a1912cf81deed4c
change-id: 20230811-topic-icc_fix_1he-40a3948b08f7

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

