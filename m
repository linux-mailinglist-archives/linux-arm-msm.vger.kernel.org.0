Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0A7E5F4BAA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Oct 2022 00:12:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229929AbiJDWMJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Oct 2022 18:12:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230186AbiJDWLo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Oct 2022 18:11:44 -0400
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0CB86BD7D;
        Tue,  4 Oct 2022 15:11:35 -0700 (PDT)
Received: by mail-il1-x12e.google.com with SMTP id a17so7029846ilq.1;
        Tue, 04 Oct 2022 15:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=AT3x2IJxeb4hdzYIjDWa5p1fq0oqVJPM7XluOqH3KVE=;
        b=ZuwO+ujer+1wYzSSuCZAGzh/0ujQdNx+C1in4CgvOjvTiDEvnFRCjksduwU4/JkiKj
         i5LXpgRIwNtPMWX60ptZZtm2FqGymQ1kqwV+GK8xziWgcOIooU+rUM+rbj3Kxgwpcutn
         Hh6f63xC2mwF6APvMbNVe85/CV6JFqX27Db0w/d6AtofCGuXS+9Hkr57VDEpgvcAolNe
         o9Am61m1n0/be/jqCcioMaO0hcLGqb8ZV8cKe02X4j6nwQ7VFBs3VN7ESWJS2o9iG7wU
         xYHfnHJvS6+njdL3dWlU5d0N9aRyCtY+/KtOTyhRH0fc4co+M97uvHBdgRJQGsLExHBa
         QtLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=AT3x2IJxeb4hdzYIjDWa5p1fq0oqVJPM7XluOqH3KVE=;
        b=PQEjtr7Z8Y0vup4Zhbgjx3A99M9vAAfJArOqP4hSe62Th+4FEFue2waLdFjYu0lX10
         RUAeQNWKesdJIQ/QLMSMjz6aTN5rkvNsxVCZukc6QtMWb/5raxJoSfAy5skQLRe1HZdM
         b0ZNaRAIdVpqUyOUWSjcJyBWuyhE+c+wCTFl+4n+hZBHRmwcdylvSmGVnX17lOhF8hXM
         VdJSqHXwkZ4775lbQ0Dp4yOK4DFsJa2ETENaoAmSI5Q/jydo1OnxXczOSyeiHCUvkXgq
         Qr+g5GPhDiz7qGY0hJUSUwo8/6lkUwziHz+yPbaM2dZ4Ct3tm8e4ABzu1XiS8oJRrnvr
         vo+Q==
X-Gm-Message-State: ACrzQf3hgRDzHTkaYKhjaCvDvXM2zxp1HyIqX0+DkS6Una7MjUb4eHMH
        2IuB5aAJPxUCBkRq4IZR5VkWPDIU3TtF3A==
X-Google-Smtp-Source: AMsMyM5G53/Qx8C+T0fE0UcwC0GKgDmxtUv6YqyA0g4X9qVcC2WCfWcnOuSEqZ1x0Kw+aGjgo06PpA==
X-Received: by 2002:a92:c247:0:b0:2fa:16d1:9cc0 with SMTP id k7-20020a92c247000000b002fa16d19cc0mr3311045ilo.293.1664921495095;
        Tue, 04 Oct 2022 15:11:35 -0700 (PDT)
Received: from localhost ([2607:fea8:a2e2:2d00::1eda])
        by smtp.gmail.com with UTF8SMTPSA id i3-20020a056e02054300b002f68a98e1c2sm5288494ils.50.2022.10.04.15.11.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Oct 2022 15:11:34 -0700 (PDT)
From:   Richard Acayan <mailingradian@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
Subject: [PATCH v2 0/2] SDM670 Power Domains
Date:   Tue,  4 Oct 2022 18:11:28 -0400
Message-Id: <20221004221130.14076-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes since v1:
 - accumulate review tags (reviewers are probably not the maintainers
   who are meant to apply this)
 - remove minor grammatical error in the cover letter

These are the power domains for the Qualcomm Snapdragon 670. I haven't
tried to turn on EBI with pd_ignore_unused but it is not present in
Google's msm-4.9 vendor kernel.

Richard Acayan (2):
  dt-bindings: power: rpmpd: add sdm670 power domains
  soc: qcom: rpmhpd: add sdm670 power domains

 .../devicetree/bindings/power/qcom,rpmpd.yaml  |  1 +
 drivers/soc/qcom/rpmhpd.c                      | 18 ++++++++++++++++++
 include/dt-bindings/power/qcom-rpmpd.h         | 10 ++++++++++
 3 files changed, 29 insertions(+)

-- 
2.38.0

