Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52EBA520472
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 May 2022 20:23:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240102AbiEIS0O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 May 2022 14:26:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240229AbiEIS0I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 May 2022 14:26:08 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8618C50B15
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 May 2022 11:22:14 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id q10so952684oia.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 May 2022 11:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ba1szbgkKAy0W5SiV55aftVom3JgiYLjQJZdVAaKJXY=;
        b=D1/Ozk/howOpLc9WVbkqo7Ir0/Dk87ZlKi4pIvmkZIxit8oBAWCh3SfQxUPiBq7PKj
         waG2QFqYN5YBi1RPpTalsFPAJi1h6YA5gQrfBhOzOrjXpDJL/d5PXLHTpfNM/qOoCzrv
         Nko3AmAIo7uGShcDPDhVQi0xUOHUX2Rjbe7KQlEkUH9u5bKiKebu1f+VD/IGt5LVdoUi
         vcwXLfTr6A1JDHRz6wMRpyxyFa5SZTzE6L7nlQ1vmSexEELRzuV7CXvLbUEsF0iDyD+1
         hcTJQWWM+io4ZK8FREdmC7ySGhHBURBc7TQKgp35sNVHxnwMHvhIHyS7lBBl3XbQymG+
         W1Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ba1szbgkKAy0W5SiV55aftVom3JgiYLjQJZdVAaKJXY=;
        b=E5EwqFSE2cVrGdVFtUlGJzA4DRbCuxZx55npJDvio0d6lQqib+U+30vQKomppTmGL+
         fQXuY6NC/UTG/FgBgLB7hUnMZBmUPEUBgBirMBjkU5mxoTBDS2nxpnEdLfumEqe6sW3V
         fAlvIsgeKxqGaAdbdT2ab7u9zmsA+oLQlnLRZHtxDQKKtAOFunWtdnYjQ1bjlUZ29PKA
         wKO00tNm87Av5+i/tIv6KEm9EZm48PynfgQQhrX7r7ma+B//CjGdLlv+DmlWKW0yz8xk
         by9KjkMwuGvrdrgqcD9giQ29K+dENb8d6rNT1gOnkeQSSdsI449Vm1g6VjXoUnnMHpmu
         LXPw==
X-Gm-Message-State: AOAM5338jAjudouDH8lSa1/Jr0q+o+ICkoyf1vFoS3nqIF9AK5CXvSMr
        kGzRc7qBl1Y7zG6wi2PAtIKmLA==
X-Google-Smtp-Source: ABdhPJw6R7ibHnE/ZnUa8QlxgSIPufu2ZwgCf+uLFvNa9FB2jHELKMcnzadLss78/JVEBYkvh061WA==
X-Received: by 2002:a05:6808:f87:b0:326:a1ed:9483 with SMTP id o7-20020a0568080f8700b00326a1ed9483mr6705349oiw.287.1652120533940;
        Mon, 09 May 2022 11:22:13 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m1-20020a056808024100b00325cda1ff88sm4658158oie.7.2022.05.09.11.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 May 2022 11:22:13 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Brian Masney <bmasney@redhat.com>
Subject: [GIT PULL] Qualcomm ARM defconfig updates for v5.19
Date:   Mon,  9 May 2022 13:22:09 -0500
Message-Id: <20220509182209.317208-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
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

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-defconfig-for-5.19

for you to fetch changes up to 889b94dbc5539c8c45131aeead6d5923508f535b:

  ARM: qcom_defconfig: enable debug fs support (2022-04-07 22:25:22 -0500)

----------------------------------------------------------------
Qualcomm ARM defconfig updates for v5.19

This enables the Qualcomm random number generator and hardware crypto
drivers, as well as DebugFS support, in the qcom defconfig.

----------------------------------------------------------------
Brian Masney (2):
      ARM: qcom_defconfig: enable options for Qualcomm random number generator
      ARM: qcom_defconfig: enable debug fs support

 arch/arm/configs/qcom_defconfig | 8 ++++++++
 1 file changed, 8 insertions(+)
