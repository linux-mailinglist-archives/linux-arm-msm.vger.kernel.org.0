Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5F286A5C04
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Feb 2023 16:34:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229993AbjB1PeD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Feb 2023 10:34:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229996AbjB1PeC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Feb 2023 10:34:02 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C39CD24120
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Feb 2023 07:33:42 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id g17so13749696lfv.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Feb 2023 07:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677598421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wapMaOqchluVI5tnjNfV5uxZ60xitrew7RorJPMT/uM=;
        b=mxKTi8sNmZWV62zuf0HlXlHHclCDyh4z3c7sCc5UKSZ71w3Ad/MDf+qXw3jqttzGva
         kavOx0hnfigejb+GpVTI8Owxf3wlIzypiVXrR23W5DJTF0IjvywSXuoFYdXoroAYZSlr
         uNAwLBYhejiNBFD+RZ/2AfcsmeIdz6x2dS43jZhKiQtINuXAqKSal/wrDbp6gztw99ai
         rC+3NZ8GHdf3x1ifEWWvVOwnVRZ/l4/B/9YCymQkh1IIimbx8V/CfMmz+7KGf3LAMKnZ
         t0W2JkXaF3inTjRvHErzmMKMo/8gShtGAXg9SgYJXdimwDLOZlSZwzfhHLitpD5D9zgk
         RBTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677598421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wapMaOqchluVI5tnjNfV5uxZ60xitrew7RorJPMT/uM=;
        b=CXLZQl5fdShavXx+6fabHWE3iug8bS/ndyGaoDuYiaGK1OMzkiJfb4s4MMd4WjJCj1
         3bTT8LEyAm5cdWZHMuTFLkFt5FPuKmhLl88bOs9GYDF/C3sSaqfxJM4wnBlQ7uI3MeIy
         yKN/6sGAQBhiDEcHff7774CmdDWcHJmrVNqwyHr2relJCkenXn8matbLfng4/rPa/cTo
         IHoleNlUefZa5P0mxy+BUfYDiOw2AH3k+izmEBNBTUVnHEAoo16UYIvMgp9t2rp9l4DW
         HMlSIBqMKhV+9VIeOA6/3qdZxolKEG01kq31wr0L85fyXO1yChvLetTzebO/Sw0g6Rau
         MGTg==
X-Gm-Message-State: AO0yUKUzGBtz+RLQyDp81rgV5InQ1TPC1GL2HM5qQ7ijm7cGkCK1av/e
        PFB0QiGsvmTufLbAlXbJQQc3qlDRegg0grwO
X-Google-Smtp-Source: AK7set8xgl0jPMo91htLT6E2DAIAWrhbUVo73zoMsPZPdXltXE2v+BpAyOTCyqptYiHFFxV8b4kAYw==
X-Received: by 2002:a19:a403:0:b0:4d8:4fed:fa0c with SMTP id q3-20020a19a403000000b004d84fedfa0cmr789733lfc.9.1677598420845;
        Tue, 28 Feb 2023 07:33:40 -0800 (PST)
Received: from localhost.localdomain (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id e13-20020a056512090d00b004b58500383bsm1373308lft.272.2023.02.28.07.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 07:33:40 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/2] Add some CAF emails to mailmap
Date:   Tue, 28 Feb 2023 16:33:33 +0100
Message-Id: <20230228153335.907164-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.2
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

Add some emails that were rendered unreachable after @codeaurora.org
emails were disabled. It would have been nice if all the folks that
used to contribute from such addresses mailmapped themselves to
prevent tons of bounces, but here were are..

Konrad Dybcio (2):
  mailmap: map Dikshita Agarwal's old address to his current one
  mailmap: map Vikash Garodia's old address to his current one

 .mailmap | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.39.2

