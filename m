Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 449EC5BDA06
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Sep 2022 04:19:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229777AbiITCTq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Sep 2022 22:19:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229590AbiITCTp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Sep 2022 22:19:45 -0400
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC3426332;
        Mon, 19 Sep 2022 19:19:43 -0700 (PDT)
Received: by mail-io1-xd2d.google.com with SMTP id z191so1116181iof.10;
        Mon, 19 Sep 2022 19:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=/BQevtTAE56YGt/hslWx6Zwf86s3lPcRFEeRKgZTFmE=;
        b=FKZccBdahWhcpJl+govQpLH3iI5YUgy6znQmwKvMingV6bTYI7qjPAq2sHZWqs4FMr
         eIgFJ1hSUIkeBHxw/wl3wVaMS6l5RLpfoY0JzjQnxzsTxGaW/PxKDFF2Y/AIGYWIyMCA
         PU2rCYa+HDzRiKLFngflC1aMucB3lm0oJzwTgaU+kf2KcFBVyTclQjrQh0iN0KE8eA5y
         +aVgE0bH1visv7PiPK/0kLSPMceZUcyFBNj6RszoC1/iPcJNT3GWD7tQ3y3I3oDhEDoM
         N3AbzWg21hIQPNz8Ce8T2TtzqTVRekp8r3c8jYdKAKTvlB+nIs66EAt73YOPY3MowRuy
         sfUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=/BQevtTAE56YGt/hslWx6Zwf86s3lPcRFEeRKgZTFmE=;
        b=21lpyOx6iouWX7vhxTAyeiPByaqFZ57UpekREkuQt2NZHn/c4Vr5B8pwcRM+HIHXft
         H1icnGLg4qZ7ra7ZqlQlPr+aqpuz84N9ZBrqc24/9dcNSyyTAuRQgUb8vd0xbZ0AqXPS
         1mJpsWrobAEpHShRqP2xooNQx2NNEUVMMtmZNwfadLR2dpicNEu7iEqm2MHHs6VY1ngS
         elHGjTVQz2Bd7DklHb9qQcdLAFQITTdBQlYxM6jbWaEajgwBo6LgNplKgpqeAq+s3+iQ
         WG3BlPng82yCZWAQmbvF2qqAGqolijHZFXSDDA/YEYzuUPiCxejaWnX7NTaj/EKSSEur
         V6Mg==
X-Gm-Message-State: ACrzQf2lz8G0JJyio48Uqk+ByXCei6JIcLfJegKZ/uA14qMZDIgZ4kgZ
        4otbRrV4qqaxFqvPxE1NfNvyDde7SF4=
X-Google-Smtp-Source: AMsMyM6bYFRMN8ZURbPjwTmMLnzLbWs1utaNNzK+Bdxo+RRY5UDSCfd9LBt0o/qGn38YwoaAkZHtpQ==
X-Received: by 2002:a05:6638:40ab:b0:35a:52aa:3ceb with SMTP id m43-20020a05663840ab00b0035a52aa3cebmr9856355jam.130.1663640382927;
        Mon, 19 Sep 2022 19:19:42 -0700 (PDT)
Received: from localhost ([2607:fea8:a2e2:2d00::58d4])
        by smtp.gmail.com with UTF8SMTPSA id c5-20020a928e05000000b002f13f7fef56sm170722ild.50.2022.09.19.19.19.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 19:19:42 -0700 (PDT)
From:   Richard Acayan <mailingradian@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
Subject: [PATCH 0/2] SDM670 Power Domains
Date:   Mon, 19 Sep 2022 22:19:26 -0400
Message-Id: <20220920021927.2489-1-mailingradian@gmail.com>
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

These are the power domains for the Qualcomm Snapdragon 670. I haven't
tried to turn on EBI with pd_ignore_unused but it is not present in the
Google's msm-4.9 vendor kernel.

 .../devicetree/bindings/power/qcom,rpmpd.yaml          |  1 +
 drivers/soc/qcom/rpmhpd.c                              | 18 ++++++++++++++++++
 include/dt-bindings/power/qcom-rpmpd.h                 | 10 ++++++++++
 3 files changed, 29 insertions(+)


