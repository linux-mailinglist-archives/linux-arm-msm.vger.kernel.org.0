Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77AE05AB23C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Sep 2022 15:54:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234778AbiIBNyF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Sep 2022 09:54:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238623AbiIBNxm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Sep 2022 09:53:42 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CD0213F0B6
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Sep 2022 06:28:23 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id m7so3290158lfq.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Sep 2022 06:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=SiA5M6MdSXE7H2HmwQwnhi5GK2kXfEKwM0HWUvIY3yE=;
        b=cTzI5O/AAt88HJEv6ZoCOyS1gPfVJU9s8cdDPmuIrjPekxmR7cUP6hkN+DHcjx1Fqu
         1S3uKXIdvuEmyiJvMqj+SIf+jv00S8/SzHUDcMzZpTW/16zTsK3pplH1peW1ZgoWFCRE
         KLBypr0la9jecDh4Xe48w53SJrd5xfHJK1dhm2Get/u2LzM6sM7bVp8VFirXS0uqX/KR
         xvi8YRHYHlx/0XbX2/oG2UN+3Bd8Zda3CFvX5YElr8kkFxJqDXClWD6kKhHVrZ3m/dBE
         8lBBNvjIZ5GradJ8DJZgcid4syLkHzrcHmuTuac0HucFPV5k9MM/FNzxHNTQQPXzxDyQ
         2kbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=SiA5M6MdSXE7H2HmwQwnhi5GK2kXfEKwM0HWUvIY3yE=;
        b=fMyNhNXlJ3C++YP7RBUkALIwj5TYHrLR5+TK3OOzeOsCc9LXRDFyzby6YcRKsL9zvo
         5GNgBpv70qZb74M0VKPokZevFQOH0dhnse7eQ6l0ioyP+AksRdGG2tONyIGkb4hg0VGY
         uXSp84Pio97wdRZFoqPFGO1SnaVSEZgFNXuBdZ2NDeFRi2DXwNL3ZxFfzGxPLslNJu/H
         6VDUl4FbCdXT3kYVQ0aI2Sxy0/aImgSwE74x0rZZXtMXtvYjA76vIQ4RJRn9v3PbUs7L
         7Ow9sa9uViusdrCr+7Im7aCcysYURx3mQfuSTdVcN0dxa7kOx4LD3fc4AtHl8qxqc1t6
         Fydw==
X-Gm-Message-State: ACgBeo2I6kDv+l/armVahi7NzfxlUDts5oqg4ZT667b3Ka7qWnoVU+QG
        TQ8BwNiAHMOgC7RiKaO13EqgniufEILZ6TBI
X-Google-Smtp-Source: AA6agR6w7ZA0VcdPxw4AR1j0sUGb5z/J5AdUO7+k9O5quwUlUDtKGMI4yGIOru5ZnpxqK1K9O2DNKw==
X-Received: by 2002:a05:6000:144:b0:226:da62:6d90 with SMTP id r4-20020a056000014400b00226da626d90mr14342115wrx.609.1662124459631;
        Fri, 02 Sep 2022 06:14:19 -0700 (PDT)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id v14-20020a5d43ce000000b002253fd19a6asm1766253wrr.18.2022.09.02.06.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 06:14:18 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorande@qti.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Ekansh Gupta <ekangupt@qti.qualcomm.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH 00/14] misc: fastrpc: Add audiopd support and some fixes
Date:   Fri,  2 Sep 2022 16:13:30 +0300
Message-Id: <20220902131344.3029826-1-abel.vesa@linaro.org>
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

This patchset's main goal is adding the audiopd support to fastrpc.
There are also some fixes and reworks.

Abel Vesa (13):
  misc: fastrpc: Fix use-after-free and race in fastrpc_map_find
  misc: fastrpc: Don't remove map on creater_process and device_release
  misc: fastrpc: Rename audio protection domain to root
  misc: fastrpc: Add reserved mem support
  dt-bindings: misc: fastrpc: Document memory-region property
  misc: fastrpc: Add fastrpc_remote_heap_alloc
  misc: fastrpc: Use fastrpc_map_put in fastrpc_map_create on fail
  misc: fastrpc: Rework fastrpc_req_munmap
  misc: fastrpc: Add support for audiopd
  misc: fastrpc: Safekeep mmaps on interrupted invoke
  misc: fastrpc: Add mmap request assigning for static PD pool
  misc: fastrpc: Remove unnecessary if braces in fastrpc_internal_invoke
  misc: fastrpc: Add dma_mask to fastrpc_channel_ctx

Ola Jeppsson (1):
  misc: fastrpc: Fix use-after-free race condition for maps

 .../devicetree/bindings/misc/qcom,fastrpc.txt |   5 +
 drivers/misc/fastrpc.c                        | 337 ++++++++++++++----
 include/uapi/misc/fastrpc.h                   |   7 +
 3 files changed, 284 insertions(+), 65 deletions(-)

-- 
2.34.1

