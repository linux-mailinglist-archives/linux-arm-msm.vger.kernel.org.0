Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA953694C69
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Feb 2023 17:22:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229652AbjBMQWg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Feb 2023 11:22:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbjBMQWe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Feb 2023 11:22:34 -0500
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F628BB89
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 08:22:33 -0800 (PST)
Received: by mail-il1-x131.google.com with SMTP id v6so444331ilc.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 08:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SUt5NV4yj8XYVUt8WynYB+klBAVCk9zqRje/Z1D5fhU=;
        b=wtEdxbzSqcVF2HVNhDhT/bpFtFdaXTbvlKq/2gOsDhUrNOrqeAKeCs87W88NEU0mna
         Qj1EFF4VzZhb1ggLJ3QfJ8ZJfzZ/Q/5S1hKcKhQ077Evvucs4t3Vl6PHI4amxgOmd1vn
         DkxqTyQS4R5hhYIguf02Bo1Ew6B6nyemI+70XGyG9Nvc4tPmWXXx3xnJrhvic3v6mL9Z
         fCnqREa+CpsOXZiGE/S2o/CtxZJ7Vk9KkjBn8BYhbir2zspZXL0pooaY5ZD71V3rDrx+
         KKeDFHfNuGdUqHGtyRGIofhBTlRxUT2W1ww87ydm0a8bx6zCRgbgNBzAbUrZzVBng/SL
         7IuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SUt5NV4yj8XYVUt8WynYB+klBAVCk9zqRje/Z1D5fhU=;
        b=J2+OgId9vVo539hWxyZFwV5VIGBA0bBBHImWlxbeAv4WFYbUsrpRR2gueuV5A2H8jE
         Tw4Ml2Q1JtHZ3+76NLBYhakoeA5hNoZ8axatGxs2Zc1LBQDUGmzyworW8/he25HaR5WZ
         yCkvw43K/xV4geabKOk15nfVsqImrHRlvH06FSjzCzft9+YoiHYrg0mVZjpgooKtpT2V
         ZhMSB30ozq7JLLE18X9ey9Tk3PfHOAl3z2TMPG/rsk+ZJX4sD3CEt9Z5Mg8wGwMkAC4C
         +hsW9ZjJZjbXl2+rbMFp9IWscKkvgPMKtm+zJtfUo37I1LwG6WuS7O6EGvHFicABxrO6
         d4DQ==
X-Gm-Message-State: AO0yUKVH5VHwO7eUXePIWieo8tPfNnTsIwkLBuXJuqIaxJxouKsa3IvA
        EOfs2KK2o1EWAxT41V/FXQe1Fg==
X-Google-Smtp-Source: AK7set8cGRM+7lBnkSPNTOL/nDXk2bgM94zZgZAvy0mKkAGLHnpxmtA3xRmV6hidAMQwxoAiZxD7fQ==
X-Received: by 2002:a05:6e02:20c2:b0:315:519c:87ee with SMTP id 2-20020a056e0220c200b00315519c87eemr1587682ilq.23.1676305352783;
        Mon, 13 Feb 2023 08:22:32 -0800 (PST)
Received: from presto.localdomain ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id x17-20020a92dc51000000b00313cbba0455sm1457831ilq.8.2023.02.13.08.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 08:22:32 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     caleb.connolly@linaro.org, mka@chromium.org, evgreen@chromium.org,
        andersson@kernel.org, quic_cpratapa@quicinc.com,
        quic_avuyyuru@quicinc.com, quic_jponduru@quicinc.com,
        quic_subashab@quicinc.com, elder@kernel.org,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH net-next 0/6] net: ipa: define GSI register fields differently
Date:   Mon, 13 Feb 2023 10:22:23 -0600
Message-Id: <20230213162229.604438-1-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Now that we have "reg" definitions in place to define GSI register
offsets, add the definitions for the fields of GSI registers that
have them.

There aren't many differences between versions, but a few fields are
present only in some versions of IPA, so additional "gsi_reg-vX.Y.c"
files are created to capture such differences.  As in the previous
series, these files are created as near-copies of existing files
just before they're needed to represent these differences.  The
first patch adds files for IPA v4.0, v4.5, and v4.9; the fifth patch
adds a file for IPA v4.11.

Note that the first and fifth patch cause some checkpatch warnings
because they align some continued lines with an open parenthesis
that at the fourth column.

					-Alex

Alex Elder (6):
  net: ipa: populate more GSI register files
  net: ipa: define GSI CH_C_QOS register fields
  net: ipa: define more fields for GSI registers
  net: ipa: define fields for event-ring related registers
  net: ipa: add "gsi_v4.11.c"
  net: ipa: define fields for remaining GSI registers

 drivers/net/ipa/Makefile                      |   2 +-
 drivers/net/ipa/gsi.c                         | 110 ++++++------
 drivers/net/ipa/gsi_reg.c                     |  10 +-
 drivers/net/ipa/gsi_reg.h                     | 156 ++++++++++--------
 drivers/net/ipa/reg/gsi_reg-v3.1.c            | 116 +++++++++++--
 drivers/net/ipa/reg/gsi_reg-v3.5.1.c          | 127 ++++++++++++--
 .../reg/{gsi_reg-v3.5.1.c => gsi_reg-v4.0.c}  | 134 +++++++++++++--
 .../reg/{gsi_reg-v3.5.1.c => gsi_reg-v4.11.c} | 139 ++++++++++++++--
 .../reg/{gsi_reg-v3.5.1.c => gsi_reg-v4.5.c}  | 137 +++++++++++++--
 .../reg/{gsi_reg-v3.5.1.c => gsi_reg-v4.9.c}  | 138 ++++++++++++++--
 10 files changed, 848 insertions(+), 221 deletions(-)
 copy drivers/net/ipa/reg/{gsi_reg-v3.5.1.c => gsi_reg-v4.0.c} (62%)
 copy drivers/net/ipa/reg/{gsi_reg-v3.5.1.c => gsi_reg-v4.11.c} (60%)
 copy drivers/net/ipa/reg/{gsi_reg-v3.5.1.c => gsi_reg-v4.5.c} (61%)
 copy drivers/net/ipa/reg/{gsi_reg-v3.5.1.c => gsi_reg-v4.9.c} (61%)

-- 
2.34.1

