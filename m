Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B8806580A4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Dec 2022 17:19:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234581AbiL1QTH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Dec 2022 11:19:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234616AbiL1QSk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Dec 2022 11:18:40 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F017193FD
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 08:17:16 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id hd14-20020a17090b458e00b0021909875bccso16817067pjb.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 08:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JUcPSGeQSyCQV+5RFes2Or9gqPhDpOlebNcO/R3D1CU=;
        b=kxfWZabu89t81jk2jvL8stxvjeLflrKxQXz2ozJNyxkF5MYc4q4n2AIrv2IZaCUAJb
         iG0kmZN/VOiV6NmWKK8U/5pPqr7DK5Q5ESWVUeZ6h5BC7yeyFPPqcCbx4qJw9Vewgr8Q
         +L0CXOnS4eOgzGrsfKTaLmdnrm2M+mk1P0aXnnjGyDqI3ipOi8p3hy9L+w5sd0y9FYDB
         +hW9cJaPTImgM40r7cE1AE4Ssgcjv6RXGfXGcjU7hzaI+1s2yxnOYAbxqbUGtUx5guNW
         /ZlhGlTJmUvKPSmRHiSRLJ02aE/cHWv6I1iMHRodAjyXAROugL+4F/APK9T9Dw//c0zS
         /CdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JUcPSGeQSyCQV+5RFes2Or9gqPhDpOlebNcO/R3D1CU=;
        b=zWFIWrD3Qvy6uGUceaJ3MnhKHkNwVxOq2tSdwkdHgeBFgDTlWp9unwzQqh/awu6HDt
         p0EQakLzEUJTQ+Psb+nctoADsuWI6GExNO+wYIppnJNFQvB5iSSW+DRaDiKFT2E/jUuz
         FJx8eAyHmpr9iuOmm7KNG4rLKhT6BsPjeIN0Q59Zrr0JaKGq92ikZE0fK3Z+HNr/qP57
         1+xD1jwGixIZtML/g7K98ZodqFhf1FJVvZ66I/AhMT/0J5UYkcNAp8qwgRtm+PVF8wpS
         7nSDcgvJ30HhmuKb8822llzv4jSgIC9RCh3XTiQbXi9mIoEgB6c3Aho1F/JYFSR3dhUz
         arOg==
X-Gm-Message-State: AFqh2krFfLfvYCIEiPv4QB3Qmho2Cbi7ccHDZ+hUo2gv1EUCPM8W75Xh
        KnBc6CrCy2o5GYzwkZVm9QFi
X-Google-Smtp-Source: AMrXdXtfcTlGv4bntW66iorHD9IAD2wtLmAxADop8o1iYxMOg8y49yKk51bJjKOVc0X02LM15lWJig==
X-Received: by 2002:a17:902:704a:b0:191:7d3:7fdd with SMTP id h10-20020a170902704a00b0019107d37fddmr42210555plt.60.1672244235781;
        Wed, 28 Dec 2022 08:17:15 -0800 (PST)
Received: from localhost.localdomain ([117.217.178.100])
        by smtp.gmail.com with ESMTPSA id s3-20020a170902c64300b00186abb95bfdsm11256798pls.25.2022.12.28.08.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 08:17:14 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mhi@lists.linux.dev
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/6] MHI EP fixes and improvements
Date:   Wed, 28 Dec 2022 21:46:58 +0530
Message-Id: <20221228161704.255268-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
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

This series fixes several issues on the MHI EP stack and also improves
the suspend and resume functionality.

Thanks,
Mani

Manivannan Sadhasivam (6):
  bus: mhi: ep: Power up/down MHI stack during MHI RESET
  bus: mhi: ep: Check if the channel is supported by the controller
  bus: mhi: ep: Only send -ENOTCONN status if client driver is available
  bus: mhi: ep: Fix the debug message for MHI_PKT_TYPE_RESET_CHAN_CMD
    cmd
  bus: mhi: ep: Move chan->lock to the start of processing queued ch
    ring
  bus: mhi: ep: Save channel state locally during suspend and resume

 drivers/bus/mhi/ep/main.c | 79 +++++++++++++++++++++------------------
 1 file changed, 42 insertions(+), 37 deletions(-)

-- 
2.25.1

