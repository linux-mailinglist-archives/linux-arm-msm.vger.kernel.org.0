Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 848423218AC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Feb 2021 14:28:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229907AbhBVN2o (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Feb 2021 08:28:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231214AbhBVN1g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Feb 2021 08:27:36 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E829C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 05:26:55 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id a132so13590701wmc.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 05:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xD3+oGSeqfkZUU2bmYztKuoONRC5N5R319ryT4VB4VI=;
        b=bG1J9hEjy0Zvzggr0fasa/DE8DLM8lkfUh/Hc1TooeSmRSMKSCiAMQtVdNTTu+ov5C
         x6HFwrrj9jklrHgNNHOeFtkl/ygIGuh8hTITtwNnBvE85hKJcWvWVDT9mZuE5f/aiZwa
         8IkUCGCOP6WudVLkXDTI75hT4CbFBnrvXdqcmlzUTL0ejETdaqgWsgcxwwuKgTH/mk+3
         lZS8f7O4LKtCeeJ+TAfKI5hLAsbuRNtU7Qk3AZHob3efWLPc7c/O++gjxzJCuQiWZatj
         iFd6IdLhoDHTjT3B5rvsfx9egpMDT8QqWoxas/DU0sRVrGiVG6fsYOIKMLma83pdPEWu
         GMdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xD3+oGSeqfkZUU2bmYztKuoONRC5N5R319ryT4VB4VI=;
        b=JR/uEKK1A93HjZnBEvDouyF83VpS8xT8er1AmbkNnAxJhZFqpotyLrQauVWtjL8UiT
         fQhmkdPhbtq+mwUrYJaY0+74/JHS14Dcjimv15YtCU8ryrEbqToeK0HDWvqT5gB/TIv4
         R4APia/4Hdfqf/Sy5+rwE7pOUoZpK9uQ5+3kOP35PO4Qh87nslkC/pybL2iR61FwdQkj
         TeCuYh9Ldq7r6ElDjgc7gtowxaTDxGeqvBtnghkBp9btYvkZpHZmaDm3Acxn0D9hnubV
         +OC7a13I6q7qLJrnERPpWn5+zBDVQq4YozXgurYKQ0o/8SKnNS+OGyE3sX/gkkqTYd+K
         Zz1g==
X-Gm-Message-State: AOAM533OQSWAgrY3y1slMM3cKMHI+7oJ+GHpQog6NfpM3vGCLIYV8dIh
        UJPqfR1DG0jQgTSXoqsEdbSMPA==
X-Google-Smtp-Source: ABdhPJyOFo+vgwLhxtQHD38Y4jsqUQ6Yty+rGAiTYLpNFYljnHHeC4+TZzMxEm4npqYNygDQCDuF5w==
X-Received: by 2002:a1c:4603:: with SMTP id t3mr20568136wma.135.1614000414392;
        Mon, 22 Feb 2021 05:26:54 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id t7sm3079918wmq.44.2021.02.22.05.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 05:26:53 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, stanimir.varbanov@linaro.org,
        agross@kernel.org, bjorn.andersson@linaro.org
Cc:     bryan.odonoghue@linaro.org, jonathan@marek.ca,
        dikshita@qti.qualcomm.com
Subject: [PATCH v2 0/3] dts: qcom: sm8250: Enable venus related DT nodes
Date:   Mon, 22 Feb 2021 13:28:14 +0000
Message-Id: <20210222132817.1807788-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

V2:

I noticed this series doesn't apply/build against device-tree/dt/next

- Adds dependency patch from Dmitry
- Adds "#include <dt-bindings/interconnect/qcom,sm8250.h>"

Depends on dt-binding:
https://www.spinics.net/lists/devicetree/msg406892.html

V1:
Adds
- videocc
  The clock controller for the Venus core and codec blocks

- venus
  The SoC DT description for the core, encoder, decoder + associated

The second patch is contingent on application of this pending patch
https://www.spinics.net/lists/linux-arm-msm/msg80960.html


Bryan O'Donoghue (1):
  arm64: dts: qcom: sm8250: Add venus DT node

Dmitry Baryshkov (1):
  arm64: dts: qcom: sm8250: add mmcx regulator

Jonathan Marek (1):
  arm64: dts: qcom: sm8250: Add videocc DT node

 arch/arm64/boot/dts/qcom/sm8250.dtsi | 81 ++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

-- 
2.29.2

