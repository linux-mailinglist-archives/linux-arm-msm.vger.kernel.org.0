Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 944635AB5EC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Sep 2022 17:56:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237368AbiIBPz7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Sep 2022 11:55:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236426AbiIBPzA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Sep 2022 11:55:00 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5960F186C2
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Sep 2022 08:49:21 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id w5so2806107wrn.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Sep 2022 08:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=A8QQlHJvfCbaBzS2PU/2MLWW0321DP7okLoPDVol5xw=;
        b=L1XAi25oPDm1oqbBc0NuoKX6xUAiKUJPv/QUBAj3BkAK6+stxtIFbCLBLDdIuWO1dO
         Nn0pRB4aPwhsg8Oy8hWyF0m8BzX5dkv7w5R/m0X6jxLh94EakrU74/tmhjAgpGP1Ma4U
         J44U1OC32lBeC26XYKILdz4k5P24ml1aNIrO6k0uv82UA7Gh0xu43C9UyhrAc6U26G3d
         jhTxQvCt2RbBjSgMK3toWoLYYGOrohjNzaneN2FQTv5RjXQN87dHWGYQkgGHnFSV7mf0
         JIvpTHf73ZVN+X4dq5XuQP6nJ6SGUR5YHLq/wV47eWYj0OwNfJgqzByOiLtLvLnTbkd4
         BGmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=A8QQlHJvfCbaBzS2PU/2MLWW0321DP7okLoPDVol5xw=;
        b=Y/Rf0C2Ne4Fg+bCWkHJE/1ZNSSAuOEp9vxbGcgWArZWuuHh7Y2G6EY1tZCSIAZMY4u
         yHVGfgswltaejLfZk2QQytUY5rd6p7et541eRd7FA8eFdQHJb8lFE+N+mK+io+ICWILV
         XAY1tH6BpPa894omx6QBRFENnrjrSsBeZ3SvOwi2Rqvers8ti2EU4fCclxmBvCzQfRMn
         uaT/eODGCUMAG+ahtB1pTPCLm0xAwVTvDH6v+3dB9flWuRctZz6vISg5cwGOMNVYnN8/
         lMf/j8tIoV0Ml6HddrqYaRZEUkJ+EfCHV+u2Obv5nfcbmnwMBGIuVHNowtbvyC2iVtta
         S1qA==
X-Gm-Message-State: ACgBeo1TOcKBMlIe013uboagMJqqW9tNbae1ETIpUikayGwlxUyqkBdR
        XRG0gQW2OFhCOG7WJfj3dTGttw==
X-Google-Smtp-Source: AA6agR4VhQ06SJnCyHhZEG+L586fFuHuQTr0G87F4kmmMfOUykSVSJAybuueleO+BSeFErj5j4IXvw==
X-Received: by 2002:a05:6000:1a86:b0:226:fd9b:7357 with SMTP id f6-20020a0560001a8600b00226fd9b7357mr3863759wry.458.1662133759948;
        Fri, 02 Sep 2022 08:49:19 -0700 (PDT)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id b1-20020a05600010c100b002250f9abdefsm2046741wrx.117.2022.09.02.08.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 08:49:19 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Ekansh Gupta <quic_ekagupt@quicinc.com>
Cc:     Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org
Subject: [PATCH v2 00/10] misc: fastrpc: Add audiopd support
Date:   Fri,  2 Sep 2022 18:48:50 +0300
Message-Id: <20220902154900.3404524-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
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

This patchset adds audiopd support to fastrpc.

The first version is here:
https://lore.kernel.org/all/20220902131344.3029826-1-abel.vesa@linaro.org/

Changes since v1:
 * dropped the patch 13:
   "misc: fastrpc: Remove unnecessary if braces in fastrpc_internal_invoke"
 * sent patches 1, 2 and 3 as a separate patchset

Abel Vesa (10):
  misc: fastrpc: Rename audio protection domain to root
  misc: fastrpc: Add reserved mem support
  dt-bindings: misc: fastrpc: Document memory-region property
  misc: fastrpc: Add fastrpc_remote_heap_alloc
  misc: fastrpc: Use fastrpc_map_put in fastrpc_map_create on fail
  misc: fastrpc: Rework fastrpc_req_munmap
  misc: fastrpc: Add support for audiopd
  misc: fastrpc: Safekeep mmaps on interrupted invoke
  misc: fastrpc: Add mmap request assigning for static PD pool
  misc: fastrpc: Add dma_mask to fastrpc_channel_ctx

 .../devicetree/bindings/misc/qcom,fastrpc.txt |   5 +
 drivers/misc/fastrpc.c                        | 267 +++++++++++++++---
 include/uapi/misc/fastrpc.h                   |   7 +
 3 files changed, 247 insertions(+), 32 deletions(-)

-- 
2.34.1

