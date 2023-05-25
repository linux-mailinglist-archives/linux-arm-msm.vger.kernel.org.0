Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 989B9710D5B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 May 2023 15:38:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241327AbjEYNiv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 May 2023 09:38:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241148AbjEYNiu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 May 2023 09:38:50 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCDE9A9
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 May 2023 06:38:47 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3090d3e9c92so2084355f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 May 2023 06:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685021926; x=1687613926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SErRfOq2zkA3FjIAS2Y61xvXXIJ9zVGPM+NkpQH62Dk=;
        b=Weef7AvCPpj7mh5qe30JYSMSv+gJ7DQyy/0hL3O1RtI3sM9NpNNtTrrH5fr3Eb8UA4
         uJSMt2R2c5T5F2aTRU3J308IiaRjvjTJ1wTgp6LRORvhlx+36nONPR6yRRnu7hUkjuL5
         iOqa2+cBt+p3ArnN8tRdXC/B4b7e3rrUQR/ovDdYVND+xufTNrzdIvsPfuDWcIVri2gB
         /jwC7S+n7g2aP3Lmc2pWC4G3G5hVlm5GFqSUcyd7nBfciDL6GOd4j8SjG3JBCYSh2iGg
         w0WFOJ4569ugVlpOUqXTZBM2HtWmYAelfzKIg/teOPEXbnKzoT7XBsUEGAk3SH5HzgHk
         7pZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685021926; x=1687613926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SErRfOq2zkA3FjIAS2Y61xvXXIJ9zVGPM+NkpQH62Dk=;
        b=kMwBYnUfx4AZIgHGI6r9DQdxNgKFeFS5Jnhiv4yJw91GlikIQlD5HRcJC32EJP3qQq
         x+SPMNcYcTFnzklDsH9uEP2qYdnpWdqXr3SIRTXAGFdb0In5LZBiZGkIXKx0Vb8RYwk9
         p6X3+1V38U/xkxBKHGdB+uIz9XEtCl8LQGzq62qRf8lT8IURQSrX5V9ZDdMzTK3U/Tuz
         uCWvmgnwqRSDOqS8b1Cacbo9mdJqSv7Pm5KybIdvVonD3e/3emy/bC88PnQ4VowwAmwR
         b0J/b3H5vN0+AtcOd+Jzz8mFxweiDz7mCRXJmWMU4392bxK4uEd2cdwJkKhwVJWg+dOk
         V8+Q==
X-Gm-Message-State: AC+VfDxB7uH/5c9zqtVnAg5SfgQZRMVlBg4KG17JfYDD6XY5b5h4RAhH
        H1KYZ45K2jE3pqvvJxTAbvawJw==
X-Google-Smtp-Source: ACHHUZ4uHJMe3BdseysmijmVyN/Ttxo7RLQkKvYe/bEff1EjOtNqYdCjAhJkNcoKSOE+FzGCphTf9w==
X-Received: by 2002:a5d:58d6:0:b0:307:9194:9a94 with SMTP id o22-20020a5d58d6000000b0030791949a94mr2917781wrf.17.1685021926217;
        Thu, 25 May 2023 06:38:46 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id z17-20020a5d6551000000b00301a351a8d6sm1803641wrv.84.2023.05.25.06.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 06:38:45 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     vkoul@kernel.org
Cc:     andersson@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.intel.com, sanyog.r.kale@intel.com,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 0/4] soundwire: qcom: stablity fixes
Date:   Thu, 25 May 2023 14:38:08 +0100
Message-Id: <20230525133812.30841-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

During x13s audio testing we hit few corner cases due to issues
in codec drivers and some obvious code bugs.

Here are the fixes for those issues, mostly the issues are around
devices loosing the sync in between runtime pm suspend resume path.

With codec fixes along with these fixes, audio on x13s is pretty stable.

Thanks,
Srini

Changes since v1:
	- dropped runtime pm changes patch as unable to reproduced it anymore
	- fixed clk stop flag as suggested by Pierre
	- rebased on top of linux-next

Srinivas Kandagatla (4):
  soundwire: qcom: update status correctly with mask
  soundwire: qcom: wait for fifo to be empty before suspend
  soundwire: qcom: add software workaround for bus clash interrupt
    assertion
  soundwire: qcom: set clk stop need reset flag at runtime

 drivers/soundwire/qcom.c | 100 ++++++++++++++++++++++++++-------------
 1 file changed, 68 insertions(+), 32 deletions(-)

-- 
2.21.0

