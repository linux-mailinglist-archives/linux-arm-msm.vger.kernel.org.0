Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0613F53122A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 May 2022 18:22:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238167AbiEWPzF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 May 2022 11:55:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238113AbiEWPzF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 May 2022 11:55:05 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E19D23FD9A
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 May 2022 08:55:03 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id d22so13477627plr.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 May 2022 08:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vxzgIssUBLkjl5Ck7pCy7EqfLmYDBm9in1HjcPwdZOA=;
        b=D6jjtJOOEYbh1eBozNMRHFHPq1jp4FMBrOna9AsjLJ55+bi17v1TcqR2ccLt4NxFRZ
         yrOZ61fBfNlX4/iF5bUSvLGECwAhFuwxlLoC1+R75iGme2074rJrJaq1Puv0DEzxT8/j
         aWXyy1SnREtD1cJrGVPpM4rSH6RgCvGE5XqxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vxzgIssUBLkjl5Ck7pCy7EqfLmYDBm9in1HjcPwdZOA=;
        b=EqtUYkxRAlRLknzuMDs0I83pgT+1P8o82frUoXILaGXq1ilhn5bNrx/b8WkPUlra2k
         5V+XzhwzCP2tY699jTrykwlqtTvyY94o4liXELRsFajIuYlBUpAhgGvkjzjLETBIahkv
         HkWjuddBRRadAvRl8quBpqjr3hN2J4nwLIzywUvSfMNPv0uCjv9+zCs8excMlwQ57ip0
         zZNlErrLRsNnpQLdbGeMHZRQka/p53EtmrHDCiS5L4fmbQvbgV13ntohPN08pMatuxzA
         C7Rlf4IxFUy2jfmnzrm2ptRjXnYtKiG+dNkLjsMfF11IzZ8PIWfhoyfsZE7nRVUdBleg
         60pQ==
X-Gm-Message-State: AOAM530Uv+RngjamVPLTSVv7+cETscmggbrZ+Hso2ojlmtXWj0Y23WyS
        BFLl3tE7YaY2mSABENpA5c/dAg==
X-Google-Smtp-Source: ABdhPJwH9alKTbdgwyVljLTN+YAQ/hwbuIz1fY7y+CeixPhmhAKFFbAcxbGMbGsQCsNeXhA7J3Q5GQ==
X-Received: by 2002:a17:903:248:b0:155:e660:b774 with SMTP id j8-20020a170903024800b00155e660b774mr23853809plh.174.1653321303451;
        Mon, 23 May 2022 08:55:03 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:ca72:45c6:baeb:e902])
        by smtp.gmail.com with ESMTPSA id n5-20020a056a000d4500b0051887e34143sm4830214pfv.129.2022.05.23.08.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 08:55:02 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>, matvore@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3] soc: qcom: socinfo: Add an ID for sc7180P
Date:   Mon, 23 May 2022 08:54:57 -0700
Message-Id: <20220523085437.v3.1.I26eca1856f99e6160d30de6d50ecab60e6226354@changeid>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some sc7180 Chromebooks actually have sc7180P (known by many names,
apparently, including possibly sc7180 Pro and sc7185). This is a
sc7180 part that has slightly higher clock speeds.

The official ID number allocated to these devices by Qualcomm is 495
so we'll add an entry to the table for them. Note that currently
shipping BIOS for these devices will actually end up reporting an ID
of 407 due to a bug but eventually a new BIOS will be released which
corrects it to 495.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---

Changes in v3:
- s/numbrer/number/

Changes in v2:
- Switch from 407 to 495.

 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index cee579a267a6..c2c879ccc6c0 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -332,6 +332,7 @@ static const struct soc_id soc_id[] = {
 	{ 480, "SM8450" },
 	{ 482, "SM8450" },
 	{ 487, "SC7280" },
+	{ 495, "SC7180P" },
 };
 
 static const char *socinfo_machine(struct device *dev, unsigned int id)
-- 
2.36.1.124.g0e6072fb45-goog

