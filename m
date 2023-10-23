Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C96357D41F4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Oct 2023 23:53:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230483AbjJWVxf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Oct 2023 17:53:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229845AbjJWVxf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Oct 2023 17:53:35 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 936B0DE
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Oct 2023 14:53:31 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-507bd644a96so5609969e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Oct 2023 14:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698098010; x=1698702810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X+rsmYD1T4XayxZO0d9Wh3lxs23SfSgBqhqU6v10yXI=;
        b=DS5/I/t/a1rn3H4PvD8WGA+Ot6k1fJ2kVgyL+MH5affyN5A9UrUaD2etC4KxhCxcmb
         IeNcXo47DTDb7WunfIukITK1ituOxtTHWyUFuB3BNqmP8VgVRUatIdEgKovyTx005s36
         UYVnHmljV+Rc6J25ZLxxYSACDnU7lSB9D4iSOfr/S+J9ZvVZRl9hFABtThciloeawmge
         dx3BTNmzBvMT7zFPbYbHPiex0dcWy+jgR1SqZjNTAsC+156NLEBdEFgp/pMfI6LZf2bk
         5y6YqphoDt7FXKcm8O3j7Np03kbxiDisJtsJyIH+iQ28OjQPaeC509EyAShDFYE9+UGR
         3o2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698098010; x=1698702810;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X+rsmYD1T4XayxZO0d9Wh3lxs23SfSgBqhqU6v10yXI=;
        b=aciyFepXPcxknRjMVITpGpbqJCKK8NbIj96cMweZcYnagCusVazAyLoq2mOd4tQbWb
         on5qwTmBcy0lZgqPYFI0XkdY8UpgDzlG33BpsS1SzAXgq9auVPenkcKak1BU9p3tnIS1
         x8VSdpcD6TJqYXan8zof5URrzibhfOlcLLIPxBGN0Ko4FvuVZVtH6EvYrLVfecbDEFL1
         FYKfl98iy/Z697VzjleeTQAPhSlLnCTyLVzFAHAIh/IlG/0ZjypAueZAI1S+6ga0z/hV
         DHMQO2cpMLeYepm6Us94/Rrn7UEWNOkfbeP1t3L+WRQ4IXWNs17sT7v6R5Yo0hqvewsf
         jyGg==
X-Gm-Message-State: AOJu0YxqKTd5phuo/gR252H8+56ZEA+/DP6QQlkqp/dOLJwqoLu4yKF0
        MFQshp1L7TDSTSJCOHlF+elr4Q==
X-Google-Smtp-Source: AGHT+IGXavENepsWbia0vw4b+3iZge7gks+4vDHuc1kxU3y//RzCXGuL+EX4pMSlLyMK5HG2fNi84Q==
X-Received: by 2002:a19:4f4c:0:b0:4fb:bef0:948e with SMTP id a12-20020a194f4c000000b004fbbef0948emr7134468lfk.5.1698098009741;
        Mon, 23 Oct 2023 14:53:29 -0700 (PDT)
Received: from eriador.lumag.spb.ru (85-76-147-63-nat.elisa-mobile.fi. [85.76.147.63])
        by smtp.gmail.com with ESMTPSA id g3-20020a056512118300b005079dac9620sm1845143lfr.43.2023.10.23.14.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 14:53:29 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/2] usb: typec: ucsi: add workaround for several Qualcomm platforms
Date:   Tue, 24 Oct 2023 00:47:25 +0300
Message-ID: <20231023215327.695720-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
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

The UCSI firmware on Qualcomm SC8180X, SC8280XP and SM8350 are buggy.
Submitting UCSI_GET_PDOS command for partners which do not actually
support PD and do not have PDOs causes firmware to crash, preventing
further UCSI activity. Firmware on newer platforms have fixed this
issue. In order to still be able to use UCSI functionality on the
mentioned platforms (e.g. to be able to handle USB role switching),
apply a workaround that completely shortcuts UCSI_GET_PDOS command for
the USB-C partner.

This has been tested on sm8350 only, but should apply to other two
platforms.

Dmitry Baryshkov (2):
  usb: typec: ucsi: fix UCSI on buggy Qualcomm devices
  soc: qcom: pmic-glink: enable UCSI on older devices

 drivers/soc/qcom/pmic_glink.c       | 7 +++++++
 drivers/usb/typec/ucsi/ucsi.c       | 3 +++
 drivers/usb/typec/ucsi/ucsi.h       | 3 +++
 drivers/usb/typec/ucsi/ucsi_glink.c | 3 +++
 4 files changed, 16 insertions(+)

-- 
2.42.0

