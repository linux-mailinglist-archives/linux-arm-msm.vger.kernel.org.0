Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 773D85BF03E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Sep 2022 00:37:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbiITWhy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Sep 2022 18:37:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbiITWhx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Sep 2022 18:37:53 -0400
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B789661D72;
        Tue, 20 Sep 2022 15:37:52 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id h194so3626570iof.4;
        Tue, 20 Sep 2022 15:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=XEUmriEa05j5XUrTdorZ1T8HSWvZNuwunsKCBkusk9U=;
        b=Ddt2cJFHLfzeCScpabblZYPTZnrpMPbsfnaH9GSZmOwQfpX9AUcz8s34CJSa10qUSI
         KeYHNq3ntncZhfzp+UqgsVK69GUTOMbfQ5R+WfiF5rbowv/v2m9D4zcIpaCUDInQayLG
         Wl8sFC5zPnIr/TXtY2bjkLALsFcMfonepmr/hW9iJTc8NkdORSXuykJliL2Yjc6g4MIA
         3oxDP0OOG+IIOWVoDPlEPjMglU5YNpnMILVQ+OLNVPH/HGpF3j1lvsS0VQ8nzx8Xd6Fe
         Y4jMlfeNVXWFzt3I3nNR0/X7C1ChU9Te55m3QpPHnggrAMeUB/DrJN8fY1gDRyMQE8zi
         BOpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=XEUmriEa05j5XUrTdorZ1T8HSWvZNuwunsKCBkusk9U=;
        b=xK/y63GRrpCq6zruAU3IXlfKpuCUh1mdA78OQ9X+AjVSp8NTq16HviSQqYs223j18Q
         4AWWUoeWG17bA2DB3wZg2YHzCaIi4qiSkg6kBYFnJPiJkn+yD1GWOfkDa3nKkPJhewUG
         1/OWn6Eapbc0miMyNZQ73fZSpGuVDjvI4ajU/7sSIez8pHwTmHHv2QUSSBB4kUxkSk5S
         Y6Jua8haSpG+ElfWH/AGW4tSMGqCSplwH/p3l6nZSr1J1MIR1x1EYzDoXCETzwW64sAe
         c8Ej475NeLe2nFuXteevp/CCaOwF4eDMS/q96YyHTbZmQImUnF12QvYJHn/EPeQYipDR
         ZvFw==
X-Gm-Message-State: ACgBeo01rx6rIZJjEORoQa7wt5FiKVFLTvDFiQlwqeRFBiWVxWh8D9G/
        du15ewlxFz6RvWtukzduBpbmOkX5u/A=
X-Google-Smtp-Source: AA6agR6iq1v/0PmkfapKfHrZpfQ4BzuMWiHGX8NFFWCW/kNAWbomk8QG5YZ9Ytjr7doxDoZ1m23qjg==
X-Received: by 2002:a02:cb42:0:b0:359:766e:fc8c with SMTP id k2-20020a02cb42000000b00359766efc8cmr11850763jap.108.1663713470329;
        Tue, 20 Sep 2022 15:37:50 -0700 (PDT)
Received: from localhost ([2607:fea8:a2e2:2d00::a533])
        by smtp.gmail.com with UTF8SMTPSA id v15-20020a92ab0f000000b002f6460e4d90sm334913ilh.85.2022.09.20.15.37.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 15:37:49 -0700 (PDT)
From:   Richard Acayan <mailingradian@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <tdas@codeaurora.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 0/2] SDM670 RPMh Clocks
Date:   Tue, 20 Sep 2022 18:37:32 -0400
Message-Id: <20220920223734.151135-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.37.3
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
 - fix broken link
 - accumulate ack tag

This patch series adds clocks controlled by RPMh for Snapdragon 670.

 .../devicetree/bindings/clock/qcom,rpmhcc.yaml      |  1 +
 drivers/clk/qcom/clk-rpmh.c                         | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+)


