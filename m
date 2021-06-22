Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 337603B0ECF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 22:32:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229769AbhFVUfD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Jun 2021 16:35:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbhFVUfD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Jun 2021 16:35:03 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3716CC061574;
        Tue, 22 Jun 2021 13:32:46 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id s6so467409edu.10;
        Tue, 22 Jun 2021 13:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hJ3e9mokzvcYFf2RFFI+m+L0p65e4PGAuykS5ZlYTVY=;
        b=u/0Zrba8rWZh50fzgKbTkUXafR/0mXWtFhGYU2DfzdVhVCRggN6ZN8VO1b81bPOSrZ
         KNMvxDfFWVJ/KLZvGVNQ8tB+I5KtQBxAj+E/1jGsi94qTD8smxxBQfkmri96oeoI2WCF
         uZo9D6BaP20sZBZLTwau5gZqOuZazqWgfXRlhbGq7Y/mVPxLMWxNizLQIwF2uwT+NPE3
         +ETaVtqLeTyo1YBeY9vaLP45lfhcTkdK4kTfyNbLFG2ltm0PXXprqvXGF4RKJrUK3jMx
         PfRXNJHF7uTEexXaJZsXv95UeNxtcZ/Kqona3HvlNoM7LDOqoLAbH+cRclh+WA4+GlQ6
         SD/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hJ3e9mokzvcYFf2RFFI+m+L0p65e4PGAuykS5ZlYTVY=;
        b=ZUFKZf0+Ktgqc5UjmiawGXLl3PfZaz3vA8cWnmnLlAFx05YpO7w66A3KMEq7vmE36T
         uqMwdGznG7O66d/Dpb6iye3Qi6HSM8IfveHiK++Yv64PhewBuXhEVyOjIum3x45JaQPO
         jUtDOvdV3QdndM1iZigbdjwtSG4mfeKtIKRBbIyRW7O2TTI6XS63oBe7AH+/OrIaYqz5
         Y/mScRgVRGy33ZHx3iaLUZo2+GsVoK4KVXeVUWtpORWZly1h0onVeSZuwGoxDJjTSBtK
         idx3MwoF6xl7QAid+fzaA7b7HNXDe+g0qDmbURXJe3Sq1EjH/2irETTr+HvI2bfmFjLF
         yFcQ==
X-Gm-Message-State: AOAM531zVfxc2dhpLzeXu4KvQk8uiizNbZIEau1tKnYpl4akkTpo5Q1j
        HGGW1UoAgPxJPqY4pPkeyeccBVdZoSI9Tw==
X-Google-Smtp-Source: ABdhPJxA445qpE2sE2EuJP9nMCYUDNR/+2aGTVa7n4kX0JBTcgRaJwkHQWqgcV/oFmgYlIPOdnAOyA==
X-Received: by 2002:aa7:db03:: with SMTP id t3mr7590601eds.153.1624393964833;
        Tue, 22 Jun 2021 13:32:44 -0700 (PDT)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id o5sm732979edt.44.2021.06.22.13.32.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jun 2021 13:32:44 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Manu Gautam <mgautam@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH v1 0/3] Add USB HS support for SM4250/6115
Date:   Tue, 22 Jun 2021 23:32:37 +0300
Message-Id: <20210622203240.559979-1-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The USB controller found on SM4250/6115 is dwc3 (phy v1), very similar to
existing supported phys (like msm8996), with slighly different tune seq.

Iskren Chernev (3):
  dt-bindings: usb: qcom,dwc3: Add bindings for sm6115/4250
  dt-bindings: phy: qcom,qusb2: document sm4250/6115 compatible
  phy: qcom-qusb2: Add configuration for SM4250 and SM6115

 .../bindings/phy/qcom,qusb2-phy.yaml          |  2 ++
 .../devicetree/bindings/usb/qcom,dwc3.yaml    |  2 ++
 drivers/phy/qualcomm/phy-qcom-qusb2.c         | 34 +++++++++++++++++++
 3 files changed, 38 insertions(+)


base-commit: e71e3a48a7e89fa71fb70bf4602367528864d2ff
--
2.31.1

