Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FEDB669273
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 10:11:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241061AbjAMJK7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 04:10:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241161AbjAMJKW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 04:10:22 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5075C73E35
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 01:07:48 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id cf42so32239620lfb.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 01:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QSmE9cynsrYFh6rLY5hIYK83BZ2PiKJQicmF0TXjgHI=;
        b=O818piWKVwWTAlBLjP7+WiAvM94Ja+tEgOOBWTdIwlXn3o+UStwTdfcqWLzbaNGNrF
         0zOucrzuLUKSUH2qTKs0CXuvNchvdQgR4gMOA2U7gjjd5V6CAv6AYxtDZQKpqSqPT5gI
         /K3XPjtZCGr8bSEsV5rbdsGLqUfmVBhvNw7suFDaOol3VuaYvFMo6gcQ4OmnmUIlcnhR
         s007J+lvXDiOyvlBYzkBsH1JPhT/s+c6VlOhWcvaScZwlY5xDcank6G5CQ5vwnZmLdlf
         vsq8Ex9JJ40UV3v/cBGf2tH3wrT7hK22YEJ3lq8IDqovp0RoCsogJ671qpLObDE6qOi9
         o8vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QSmE9cynsrYFh6rLY5hIYK83BZ2PiKJQicmF0TXjgHI=;
        b=7p0VFnw5XmpMlo9PnFpEOSERS3zqjUgBz/Lc2aj8JP0eF84UxouOI/+nprK1lEap4T
         fmZiw3LhfdIu6YaJzu/3XhxeCJikCbRys3j7tcB27IHYdoagelR0uoLhYSHqERC4+Ym9
         AycqivDvrdP7Oqf2BAbFMldp18/c4HwoXKl9LsXtsWDHHA8YAtt1kGEuBz1JenlcimsX
         jk5EEnbb0L8lS/Z8WPQLxE+T/9FpqkhPU0lbSy7cwAOF2q7qzsx0XrAOSEQOygnLbj2Y
         MR2BnUIErrirPsrSUIVfFo1PxMVKROu18uqk8YF5rh3CgH6r6ozeo9rwQAYM1JNeU1lg
         0Vag==
X-Gm-Message-State: AFqh2kpeSBCI+xtblfmO+C1/HsbnBxB+uwOrV6uqjowiG1p4OeF+81Iq
        2Y2Qx+Uz57hZ4JhmtscGzFNoIA==
X-Google-Smtp-Source: AMrXdXv52XNgEnvFlmIuqurMzUPHvUK49R14rOwiq/ZuyaFirHZMRKKJsHyWuK6gRqbDTtg4ERbbKg==
X-Received: by 2002:a05:6512:308d:b0:4a4:68b7:d61d with SMTP id z13-20020a056512308d00b004a468b7d61dmr23034123lfd.4.1673600866715;
        Fri, 13 Jan 2023 01:07:46 -0800 (PST)
Received: from eriador.lumag.spb.ru ([194.204.33.9])
        by smtp.gmail.com with ESMTPSA id d4-20020a05651233c400b004947a12232bsm3735296lfg.275.2023.01.13.01.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 01:07:46 -0800 (PST)
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
        devicetree@vger.kernel.org
Subject: [PATCH v2 0/4] clk: qcom: msm8996: add APCS clock driver
Date:   Fri, 13 Jan 2023 11:07:35 +0200
Message-Id: <20230113090739.45805-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The sys_apcs_aux clock can be used by CPU and CBF clock drivers to drive
those clocks from GPLL0 while doing initial setup. Add simple driver to
setup and export this clock.

Changes since v1:
- Removed the clk.h header inclusion (Stephen)
- Changed the module license from GPL v2 to bare GPL.

Dmitry Baryshkov (4):
  dt-bindings: mailbox: qcom: correct the list of platforms using clocks
  dt-bindings: mailbox: qcom: add #clock-cells to msm8996 example
  mailbox: qcom-apcs-ipc: enable APCS clock device for MSM8996
  clk: qcom: add the driver for the MSM8996 APCS clocks

 .../mailbox/qcom,apcs-kpss-global.yaml        | 10 +--
 drivers/clk/qcom/Makefile                     |  2 +-
 drivers/clk/qcom/apcs-msm8996.c               | 76 +++++++++++++++++++
 drivers/mailbox/qcom-apcs-ipc-mailbox.c       |  2 +-
 4 files changed, 80 insertions(+), 10 deletions(-)
 create mode 100644 drivers/clk/qcom/apcs-msm8996.c

-- 
2.39.0

