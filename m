Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F89252DF77
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 May 2022 23:42:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245244AbiESVmL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 May 2022 17:42:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245222AbiESVmB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 May 2022 17:42:01 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 795CB5AED8
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 14:41:44 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id p22so11262091lfo.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 14:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uhWv3WU/goe9H6RrJwLR0rTAD91mkctsas9oxeosiUM=;
        b=nyeu2b4E3gZ3IXbMKNXIPrdWezcBSqYuRLJpF1y1WlKymAKjIgBLRVz/iXZjHjDHi6
         M+0RV/heVO4jtBcqcSGZLDz5CMyYgLEGXhlez7iA+ueHzEtvQ7JlcpK+HL8YuvqSiA7u
         j1XMxyFPoYko19tEOSGKR46byC02Gz3ZGxW6Tuk4bRRNedHDrrxfTbrgwEt1WwJCLjwv
         ThI4O4spv6vGRjhXlvbR++kldsVrqNYEx4XCQQpdNL3KgAl1fhHIeKbT6OnS1Hi0SoUH
         tkNqVVJR/71ROyteS0DlsrZxgW9IFndZk8HKXzxe+6aKRErcSgIQCqE1ByIJSMjmG10U
         oTCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uhWv3WU/goe9H6RrJwLR0rTAD91mkctsas9oxeosiUM=;
        b=0VJl/Z6xMvRk0J5QSuseIgGUQkr8ogIX7oQfnmqN1UFmlf4CE8pkU3eLcviMUV64b1
         LGAnm04k3W3EkSesnaKOhVj63BqT76ff/Yfz6yNtq3RvS0xA9oL4AkfY4//pkZQ8dSH+
         /u9t1PY77Xl/JOOIcwZhhcvJy2TTQA2mCtta8uDzgnTmQoUCNAn5v1AZNa8koZ8enYZ0
         98fR7F93QAZViqVG+rBG0ZbHZ60kp16i0fXNaUVQ38vUCvRx8uqih86MnNAGC/GpH/fR
         UZ5ziC8gbI8nguSLvFfeRd8526xO3hJIc2bugAkPddkKEDvtXI60Mb6yOSk/MjpmIMxB
         bmyQ==
X-Gm-Message-State: AOAM531pgeqvKY3R9WL45bJ6lDT29KWTeMpniM2NAI1VPWYiKv2NFFe1
        tR6htdnZye2LhY8yYDkQlGbo6Q==
X-Google-Smtp-Source: ABdhPJzYtulIEkUhT539jaV9/eLzgB0KNC0oraTnZ7zeaABujW1vbk569+5FteRKm1O2ht9lG/HVwQ==
X-Received: by 2002:ac2:4e14:0:b0:474:1f4d:9b86 with SMTP id e20-20020ac24e14000000b004741f4d9b86mr4712932lfr.257.1652996502848;
        Thu, 19 May 2022 14:41:42 -0700 (PDT)
Received: from localhost.localdomain (mobile-access-b04822-211.dhcp.inet.fi. [176.72.34.211])
        by smtp.gmail.com with ESMTPSA id l12-20020a2e99cc000000b0024f3d1dae9dsm53576ljj.37.2022.05.19.14.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 14:41:42 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 0/2] clk: qcom: Fix topology around titan_top power domain
Date:   Fri, 20 May 2022 00:41:31 +0300
Message-Id: <20220519214133.1728979-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On SDM845 abd SM8250 platforms two found VFE GDSC power domains shall
not be operated, if titan top is turned off, thus the former power
domains will be set as subdomains by a GDSC registration routine.

The fixes allow to drastically simplify power domain management in CAMSS
driver.

Vladimir Zapolskiy (2):
  clk: qcom: camcc-sdm845: Fix topology around titan_top power domain
  clk: qcom: camcc-sm8250: Fix topology around titan_top power domain

 drivers/clk/qcom/camcc-sdm845.c | 4 ++++
 drivers/clk/qcom/camcc-sm8250.c | 4 ++++
 2 files changed, 8 insertions(+)

-- 
2.33.0

