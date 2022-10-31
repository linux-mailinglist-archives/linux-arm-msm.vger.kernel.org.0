Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6D9F613D7B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Oct 2022 19:39:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229452AbiJaSjg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Oct 2022 14:39:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230076AbiJaSje (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Oct 2022 14:39:34 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DDDBDFBE
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Oct 2022 11:39:33 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id bp15so20549841lfb.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Oct 2022 11:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QD9I/Io73NXhv6vuPQAZR34rbl9fAgyID+CM+BVilyc=;
        b=PRkvD8+7IGrRwcM9Ip5T4GblFOF6r6tyWWuKUS3ImEeadOL8xg+PbVwma0dejRyRbf
         6N758/uamhpU6ylDssgp53nleGS/mxXKVt+sFuhch3XDjv7q2jKUevC78RHQeH+0Jx4V
         c5AJKkDlFMoYDVU3HQSXp/t9q9Ij8JEBWc4ngwn4oeSH5jHGqml90AFxbCrelZMocpgK
         KvddzSlNFx+peRiwP1rLfuQOHjadWGwpdf3RaYjPFRPIJpoTIy6vYc2G//+rl9Nc4qg2
         0pPSU6AeaSw/qBqsnEQD6g4ay7a4sEdwo633tDWzKhWysqii9Hx9Xur+kkIW0goaMa7f
         E1DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QD9I/Io73NXhv6vuPQAZR34rbl9fAgyID+CM+BVilyc=;
        b=AKmDZWEDbqQg8lLaDrbt2iTdDp+iJ1FYVLzn5sLH9eVNEgqAxuC4kfVJr4pwP7v7ik
         WRHD46WM2+df/nIdhpFyHRDurVDa2kYx2lrU8JkrZOkuAhU31fZh5bkSR+4u4YZC7Bzv
         MBpQiyVaNvzR/JW49ZAyGR5T1xVcqbJMWIihLmqU4cDg6tr+w8Q+uZOaMfqZ4/Y9Um5M
         PnJeAypJh9s2TlN804lO2KKwQtfy/1LKT4C9zaXRchuxDmusbi8twsdT5t9IRfdian49
         NvVSxM+2yYrtH4aq1PNRzLNr3wBYJEJlQxTDfX1+jG1Hm67fcgaBNvlemIQ1M9oS8t+7
         G78w==
X-Gm-Message-State: ACrzQf12dZpicpo30Jko5gMsXv4yBITHqMqEaRajstWETyouEhiDrO1h
        uBkHTagK6DqOOvLU0oKEg6MWuQ==
X-Google-Smtp-Source: AMsMyM65fqNU07UkemXao1tc2YoXEJiQEjyudhb9/27IgSRVRQgveOlVeBWO9nEII7wnswEaYRfBiw==
X-Received: by 2002:a05:6512:3c96:b0:4a4:7abe:10d9 with SMTP id h22-20020a0565123c9600b004a47abe10d9mr6541928lfv.350.1667241571373;
        Mon, 31 Oct 2022 11:39:31 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l15-20020ac24a8f000000b0048a934168c0sm1397698lfp.35.2022.10.31.11.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 11:39:30 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     linux-firmware@kernel.org
Cc:     Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@gmail.com>
Subject: [PULL] qcom: drop split a530_zap file in favour of a530_zap.mbn
Date:   Mon, 31 Oct 2022 21:39:30 +0300
Message-Id: <20221031183930.103623-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

Follow the example of recent qcom/venus changes. Drop the split
qcom/a530_zap.bNN files. Replace the qcom/a530_zap.mdt with the symlink to
qcom/apq8096/a530_zap.mbn.

The following changes since commit 8bb75626e9dd831d323c4e460414b56260f0b700:

  Merge branch 'for-upstream' of https://github.com/CirrusLogic/linux-firmware (2022-10-31 11:12:54 -0400)

are available in the Git repository at:

  https://github.com/lumag/linux-firmware a530-mbn

for you to fetch changes up to 7d2bb50ced53767875f30f94cebdbd17b1346b9b:

  qcom: drop split a530_zap firmware file (2022-10-31 21:33:47 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (1):
      qcom: drop split a530_zap firmware file

 WHENCE            |   5 +----
 qcom/a530_zap.b00 | Bin 148 -> 0 bytes
 qcom/a530_zap.b01 | Bin 6536 -> 0 bytes
 qcom/a530_zap.b02 | Bin 4900 -> 0 bytes
 qcom/a530_zap.mdt | Bin 6684 -> 0 bytes
 5 files changed, 1 insertion(+), 4 deletions(-)
 delete mode 100644 qcom/a530_zap.b00
 delete mode 100644 qcom/a530_zap.b01
 delete mode 100644 qcom/a530_zap.b02
 delete mode 100644 qcom/a530_zap.mdt
