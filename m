Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1DAD5B9AF2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Sep 2022 14:38:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229796AbiIOMiw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Sep 2022 08:38:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbiIOMiv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Sep 2022 08:38:51 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9376C80498
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Sep 2022 05:38:49 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id o20-20020a05600c4fd400b003b4a516c479so3201148wmq.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Sep 2022 05:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=kbiyzXIrqqVnS3Or15etF5uykJHCKO1KdtudfrmDI3U=;
        b=iA0FYP2uzJZ+HGL/O25lhf8+gT/9xEuMkiR6ptAaSuYurAgUKJoi2GlBXiQSKUAF+p
         hZzzJb2lM7JVSh4E4n9RncjJCGh/Sq3IZMRnSekPPzXm6v6A0C2V+7UoucrHUuT30oUs
         G7kqul1+r7dFC6HjbQ1fQpa4uCOwJCFgrtNemj3ne4UWjzmyLLG/bakhiqMgjI4jV6oy
         5z76jiwsRZNmrU3i0M+ollZj7mpsmtIcdC58n+Su9zer/wZouWmiuZZ+xEApDNwRh/Vq
         t7RrrX8/07LJKtAv3J72NgS21tZIMhH9FS3Au/pLQYraYGX5RK77b7bh9vwvXf64J1Sc
         x1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=kbiyzXIrqqVnS3Or15etF5uykJHCKO1KdtudfrmDI3U=;
        b=RUSa6T9xWMz1ry8Ab9UqKgW784Cn5JaNtCkuulbFVMAY/P0JpBNTKAUkqstKKBrMR+
         gY80MQBCv2YFJYwaijOjUc9Oe1hCa6sx9RR3Fv31nzEzhYLmNx9ZKZCOid8oU/h8Pngi
         LnE1m2CnARUk4HBnyeap1ZNT7xy1oNMFpfWNHmbjssKjrV+xs9OubVW7wLqqYV874mJW
         xxKhzVh9t55Oa9JotocGaSuFlMrMv0qQ/m4zU5Y2UfEiZuNSyD1ve8ktcWV9Fbhaoty8
         QLdrtVVfS/woqsjFC4jpwGf9b9GVJSeIpYXvgbqjqV8q5iYjd+6/F9Bd4nX+KGwkRMP/
         A+Sw==
X-Gm-Message-State: ACgBeo2piF0cWO93nJzkw4QLm06WTTkrnOe0kKnHvLaquIIFt9ezWQt5
        aQS2nanTWKONjMb8zbwXTGU0qg==
X-Google-Smtp-Source: AA6agR6t0LuD3GiIL8CcC5TW8J+oqLST9RZTztmt9uvAY+Da6RjXdnyIFXn4IYzPghMsYlExxPiL+w==
X-Received: by 2002:a05:600c:19cc:b0:3b4:adca:a821 with SMTP id u12-20020a05600c19cc00b003b4adcaa821mr1715121wmq.37.1663245528107;
        Thu, 15 Sep 2022 05:38:48 -0700 (PDT)
Received: from srini-hackbox.lan (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.gmail.com with ESMTPSA id bg13-20020a05600c3c8d00b003a5f4fccd4asm3112559wmb.35.2022.09.15.05.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 05:38:46 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     broonie@kernel.org
Cc:     lgirdwood@gmail.com, bgoswami@quicinc.com, perex@perex.cz,
        tiwai@suse.com, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 0/9] ASoC: qdsp6: audioreach: add multi-port, SAL and MFC support
Date:   Thu, 15 Sep 2022 13:38:28 +0100
Message-Id: <20220915123837.11591-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patchset adds support to multi-port connections between AudioReach Modules
which is required for sophisticated graphs like ECNS or Speaker Protection.
Also as part of ECNS testing new module support for SAL and MFC are added.


Tested on SM8450 with ECNS.

Thanks,
Srini

Srinivas Kandagatla (9):
  ASoC: qdsp6: audioreach: topology use idr_alloc_u32
  ASoC: qdsp6: audioreach: remove unused connection_list
  ASoC: qdsp6: audioreach: update dapm kcontrol private data
  ASoC: qdsp6: audioreach: Simplify handing FE and BE graph connections
  ASoC: qdsp6: audioreach: simplify module_list sz calculation
  ASoC: qdsp6: audioreach: add support for more port connections
  ASoC: qdsp6: audioreach: add support to enable SAL Module
  ASoC: qdsp6: audioreach: add support for MFC Module
  ASoC: qdsp6: audioreach: add support to enable module command

 include/uapi/sound/snd_ar_tokens.h |  27 +++
 sound/soc/qcom/qdsp6/audioreach.c  | 298 ++++++++++++++++++++---------
 sound/soc/qcom/qdsp6/audioreach.h  |  47 +++--
 sound/soc/qcom/qdsp6/q6apm.c       |  84 +-------
 sound/soc/qcom/qdsp6/q6apm.h       |   6 +-
 sound/soc/qcom/qdsp6/topology.c    | 242 +++++++++++++++++++----
 6 files changed, 480 insertions(+), 224 deletions(-)

-- 
2.21.0

