Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A849E4AC915
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Feb 2022 20:03:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235940AbiBGTCm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Feb 2022 14:02:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237935AbiBGS6a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Feb 2022 13:58:30 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 798EEC0401DA
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Feb 2022 10:58:29 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id o12so28690902lfg.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Feb 2022 10:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snejp.pl; s=gmail;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3LaHo6rvtgMcP8htqnUDS9n4P7x108y6xlwp9X2USgE=;
        b=D8LO7Cp2X8nXGl9l4bEBN8T8rjc4viTIRYcSoGaXpPafonUU736OG7ppuUjLJNqjhP
         EC2VlIyOuD7Zk0uBYOac7v/iHRr6QKfQFuSNeHBdQiuhmNpUJwnbIKYZDsy19JCfl0gr
         mrco6P1ON+hhUS6ksqzRB7E0odpVgvjzSx5UuzMIgyIAwhACHVTuBCQiUd6Hkqpo2juJ
         iMfZ9h4CK74NiGKF6qficn8pBiKdcS8twcb5smYZ5hvjH+q1MOh0Bh+96hMq1y7bUhtB
         SuSx3DcOgJHKX0A4wLb0Fr9V/xyAw5tOZGLIKYo7RgABRLV1gdSDpqoUbWRUQyNlOvn8
         U8qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3LaHo6rvtgMcP8htqnUDS9n4P7x108y6xlwp9X2USgE=;
        b=nIgNZjjD48jHYXnf8DXHOyMk69T8S1y5pRw26YKjxjMzqlG2t71xtI+g7jT6C6saWH
         pEdD59TDlJpMTLF53Qq4YNIz3qt/jMmTqVVpvroQntg6gbK39soUW1h/08jiIhDHhx9c
         cWq23erUa3qk0SelyXxhs1tC7QilRzsMBQUJ4SD99/SMkvxSgHI9oP5P/1bJInOrVDRt
         /vC5pqcpwc2xqKrweJ323FGznGggkhNXxx1zgPgnix50rx5dryHaDuP423HDXpgvi2Fl
         r7lbsXw6eIBCBBb/Qp6sDHO3SU7TQ8swEBx9wq+/pEWc7S8YYNKWsFGwZgCuZeK6oJ+T
         c6SA==
X-Gm-Message-State: AOAM531OdPmcnUX5cGQSMLhaMkDlxIU5EpMBUglU2VQoeesXO4AebyOU
        cFS+NfNT6a3A2xH94MaFTw/NdQ==
X-Google-Smtp-Source: ABdhPJy7hF9qyrjjwqDLWp1ssuOOYsjTj6/kbGKEPEQ5kxUhYNM2m+buO4lTDiqRDRg/eDazjC+PNg==
X-Received: by 2002:ac2:52a8:: with SMTP id r8mr616293lfm.220.1644260307759;
        Mon, 07 Feb 2022 10:58:27 -0800 (PST)
Received: from Lenovo330 ([82.160.139.10])
        by smtp.gmail.com with ESMTPSA id k10sm1599061lfo.187.2022.02.07.10.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 10:58:27 -0800 (PST)
Received: from localhost (Lenovo330 [local])
        by Lenovo330 (OpenSMTPD) with ESMTPA id 72d7be41;
        Mon, 7 Feb 2022 18:58:26 +0000 (UTC)
From:   Bartosz Dudziak <bartosz.dudziak@snejp.pl>
To:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, Luca Weiss <luca@z3ntu.xyz>
Cc:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>
Subject: [PATCH v2 0/2] MSM8226 Multimedia Clock Controller
Date:   Mon,  7 Feb 2022 19:54:09 +0100
Message-Id: <20220207185411.19118-1-bartosz.dudziak@snejp.pl>
X-Mailer: git-send-email 2.25.1
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

Implement the MSM8226 MMCC on the top of existing MSM8974 driver.

version 2 changes:
-replace `of_match_device()` with `of_device_get_match_data()`

Bartosz Dudziak (2):
  dt-bindings: clock: Add support for the MSM8226 mmcc
  clk: qcom: Add MSM8226 Multimedia Clock Controller support

 .../devicetree/bindings/clock/qcom,mmcc.yaml  |   1 +
 drivers/clk/qcom/mmcc-msm8974.c               | 206 +++++++++++++++++-
 2 files changed, 202 insertions(+), 5 deletions(-)

-- 
2.25.1

