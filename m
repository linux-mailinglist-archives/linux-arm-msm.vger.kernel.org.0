Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99DB17D6A88
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Oct 2023 13:56:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234897AbjJYL41 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Oct 2023 07:56:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234937AbjJYL40 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Oct 2023 07:56:26 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6D4B13D
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 04:56:23 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-50816562320so971168e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 04:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698234982; x=1698839782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tC3hBlKDyTX0Pn0eODz43Ay/ko7vlr8gv2SdlQMKZ44=;
        b=pQLq+hLoXVddm1Dc85Yg0b1fSq06nSPXVucNeAfZJZm83BxFF9pvaZfdWZsRgvFhuz
         OjsuSeeX4FmfDz6b91c4iKeti7cE8p4sW2bJRZKYqVtF34tGbiAOqk1UHofbkaIfyvUk
         +YoZfLykyvJpkLbzNxAW94p6DAmWE4BaAOjTvREKAcjGABBiLo+jDhY2EEf94su8Wt7N
         bc6OXYBMUD09TN7bNAltGewCM/mGHBpMn0daHiutkkWYAeIrHCrS7JQOof0P2JXzmaMO
         Pus2oH3VhHWr6p0nL22zhw7voVaJJhnejPCs4Gb9gEXve4nRwCtlbLYCvPfkhcK7DK/8
         gCxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698234982; x=1698839782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tC3hBlKDyTX0Pn0eODz43Ay/ko7vlr8gv2SdlQMKZ44=;
        b=Xqe5rn0fE2fRyLEnLdHDkpmn8A3TjM6A4JCQPS/ztAjYj/xIhzj0DBA1aWbkyey+x0
         T6+rc4/kHiVdplmezvk28jZJg4VPzaXChLrI5Kn0Wy2TAvntmMlmvXipNGZq82A+S9ph
         xUPIosKfV2XYi1NUhyAz4j1f8mROAkcDw4u95Ud6wThAriLL8VHlel5B3oYd9TJcuZ9/
         DUhumky3d7ZDcNyYhtMYhl7lwdetZD3SyvkBZKuJfJKWMDfh8k3gtkv+4VflEitBbdaf
         ez9fTPa+UJ2hlbA/o7fa5viEkT6R3nhuhzdUNe08UGMvFgtzO2aDnUv/WQqt4W32/VMk
         mp2A==
X-Gm-Message-State: AOJu0Ywn+qYZss4xe2VMxw0F9vCwplVaKObuiUBhzad+72e5PbpHYotC
        Fqk260Hiu9j5T2zuXo3zle1Eeg==
X-Google-Smtp-Source: AGHT+IHDASrMbvXnO9ZZlU49FTn7UPYZ/j7ox1h7m7wzGxNtISh2kopR63Wq+eP/XKEKn9P7fSoJiQ==
X-Received: by 2002:a19:4f0a:0:b0:4fb:7559:aea3 with SMTP id d10-20020a194f0a000000b004fb7559aea3mr9593648lfb.39.1698234981887;
        Wed, 25 Oct 2023 04:56:21 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 22-20020ac25f56000000b004fde41a2059sm2511751lfz.305.2023.10.25.04.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 04:56:21 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 0/2] usb: typec: ucsi: add workaround for several Qualcomm platforms
Date:   Wed, 25 Oct 2023 14:49:28 +0300
Message-ID: <20231025115620.905538-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
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

This has been tested on sm8350 only, but should apply to other
platforms. I did not enable UCSI for sc8180x yet, it has slightly
different implementation, which I'd like to get tested first.

Note: patch 2 depends on patch 1, otherwise people might end up with the
broken kernel and crashed firmware. The easiest way to handle this
dependency is to merge both patches through the USB tree.

Changes since v1:
- Check parent's compatible in the UCSI driver instead of using
  different AUX device names in the PMIC GLINK driver (Bjorn).

Dmitry Baryshkov (2):
  usb: typec: ucsi: fix UCSI on buggy Qualcomm devices
  soc: qcom: pmic_glink: enable UCSI by default

 drivers/soc/qcom/pmic_glink.c       | 19 +++++++++----------
 drivers/usb/typec/ucsi/ucsi.c       |  3 +++
 drivers/usb/typec/ucsi/ucsi.h       |  3 +++
 drivers/usb/typec/ucsi/ucsi_glink.c | 13 +++++++++++++
 4 files changed, 28 insertions(+), 10 deletions(-)

-- 
2.42.0

