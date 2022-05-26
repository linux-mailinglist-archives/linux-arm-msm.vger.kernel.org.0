Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCA02535070
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 May 2022 16:17:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243062AbiEZORy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 May 2022 10:17:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231984AbiEZORy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 May 2022 10:17:54 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 373C4C3D2E;
        Thu, 26 May 2022 07:17:53 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id q92-20020a17090a17e500b001e0817e77f6so4530997pja.5;
        Thu, 26 May 2022 07:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VDs777OliTH4kWriVQk+OBHRXS4ymPCuDEzuvlu40ZU=;
        b=YC3kEAQFMBHiNjPQdj3NjA4HUuJiJ6L4dxWojGiaecKWTwO9suHKyZfLmTN+/kECwB
         8Iboa3vdlYVWwBziFw9dlVfr5aPprzsop7KE7JBTsTAnT8hO8/eFVINhSb8N93jrr9L0
         nuQuDmAPAd2GhXffuKbooPObrmqUHvySebMb6yInYRRqjj1d74J75r51b65ojywDEZ79
         HKMoFcl777otrIimtLFbby0g74MXT0GAg67Hl9K+C6TFWBAflnrfQPtSqhKAgFXQYwQh
         QUWfaqJ9YEo1hqW6y/vt7E8f4AA8c5icF2msWxatmVPalwDBQ9tX82XYloSkC2ZhMzKy
         AvNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VDs777OliTH4kWriVQk+OBHRXS4ymPCuDEzuvlu40ZU=;
        b=iyTeqgxhrbQ2rkkBtzm97hDCIJFThOA4yVD9lAJ4h3ObhN7x3FxRlSG1fTphzo0ZdD
         dOx7L65Agx4AS4GWoDmAB0Hx9b0LMxqljO8+GhAeRHCzYTG8Spk6+X/Wxzdhd8+e7/+F
         OwSDprx83ZgZzXKV9NtvHLFySStRw3PWsrSVIFETVoJOOl8ma+C24DgEIloET3bDK77K
         /Vdk9LBYvPbHaFlP03OPm8TdRW5nqtIfevyGt9jrnrUDiRMv1FSpzmWRgCkZexZAKvKj
         aSreErThdQw6w+b7Whs/OdjinQSOMy4Q1DpLqqDlJ31Yn44H3E6BvM5qbiNfVjQRSYrP
         3lBQ==
X-Gm-Message-State: AOAM531ouFGKe35xxaXU7tTvUdULVfZOKK8fOQSEo/u8U05UltDNc7yB
        8+UWtdcuprvX34HaTOIM1vdCQmDd7PBD+A==
X-Google-Smtp-Source: ABdhPJwTSu3yboXfs2/6TvYY6h7B+6PTcIsCpCu2SLbaFmgyySXgNae9IQ+3DM7xmpsd9B+xm1Bsvw==
X-Received: by 2002:a17:90b:164a:b0:1e0:5da9:ca48 with SMTP id il10-20020a17090b164a00b001e05da9ca48mr2918131pjb.220.1653574672011;
        Thu, 26 May 2022 07:17:52 -0700 (PDT)
Received: from skynet-linux.local ([122.173.191.164])
        by smtp.googlemail.com with ESMTPSA id ei3-20020a17090ae54300b001dedb8bbe66sm1546622pjb.33.2022.05.26.07.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 07:17:51 -0700 (PDT)
From:   Sireesh Kodali <sireeshkodali1@gmail.com>
To:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Cc:     bjorn.andersson@linaro.org,
        Sireesh Kodali <sireeshkodali1@gmail.com>
Subject: [PATCH v2 0/2] remoteproc: qcom: Fix handling of WCNSS IRQs
Date:   Thu, 26 May 2022 19:47:38 +0530
Message-Id: <20220526141740.15834-1-sireeshkodali1@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

Due to a bug in the code that fetches the IRQs from the device tree, the
optional "stop-ack" IRQ was never used, even if it was defined in the
device tree. This also allowed a typo in the MSM8916 SoC device tree,
where the "stop-ack" irq was instead labeled "stop".

The attached patches fix the handling of IRQs in the code, and fix the
typo in the MSM8916 device tree.

Changes since v1:
* Dropped blank lines between tags in commit message

Sireesh Kodali (2):
  remoteproc: qcom: wcnss: Fix handling of IRQs
  arm64: dts: qcom: msm8916: Fix typo in pronto remoteproc node

 arch/arm64/boot/dts/qcom/msm8916.dtsi |  4 ++--
 drivers/remoteproc/qcom_wcnss.c       | 10 ++++++++--
 2 files changed, 10 insertions(+), 4 deletions(-)

-- 
2.36.1

