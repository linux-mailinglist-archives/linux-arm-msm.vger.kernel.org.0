Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF4DEECC63
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Nov 2019 01:27:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728259AbfKBA1h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Nov 2019 20:27:37 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:41530 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726932AbfKBA10 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Nov 2019 20:27:26 -0400
Received: by mail-pf1-f193.google.com with SMTP id p26so8096212pfq.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Nov 2019 17:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BL9nfK/YZXz6FHcCtE1ld8dCJWEO+KWM+7dir2/yBWI=;
        b=CLCYetPjS4hpzofP4d3bpfpkEZMYt2x5RhhPhR768wpbFdHt8mef2MCZyIia2hTQ+l
         CKr2G1DFaSnW5WVJfqV0VyDD40GU1ByWhh213LO5fA3nlAb/Po4dCLimTVrFK7z3E5KP
         1Omg80D5DKFBd2bEjMfhsxhaWlhzCWV1yJ9WXM7HHRiKcYSvAb4zoXd4oHPqrg5MIH3M
         a1qWVzZV19oT0jGsb8wQYX06ROPMogZttKoytkdFHiNHmcIH43x6i28VQLm2M5wqcz0Y
         s7OAn+erXBwocNqQRWEUur9YKcS1ZDKDl7uT5PsTM3GeR1gDiG/03afILypq2101hYY8
         nHsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BL9nfK/YZXz6FHcCtE1ld8dCJWEO+KWM+7dir2/yBWI=;
        b=q8q7acAhYVfYTfXS+e22sXm7BsOZ0t4A+1PJS18kek8GIu89wAq4X87fOpYqVV6LgI
         7MzUgpKfETmTUChaJ+r1JiqWmoAe34rwAVcvROHr2hv//4aFL4oe6Vf/A1ifPZN6pRc3
         kC/n99ELkWTOruvSRC927s6ks1BCdNEMuh7zh6IbQzKfmMUqTOrvX/o2XmNJOIygw3b4
         79lB2r2GIEBTl2cZ1Pd8euZfK+EqFzQrlEAUCN6lMHBL1szxLPPVkPP6fnn6wsu1YqdB
         hUoiAwoFLfGouK9a7ov0PfXE6a/0DwEqzQCIpDoQTVfpgGwogbKgg8Sy9bogxagSEWoe
         u/EQ==
X-Gm-Message-State: APjAAAUocwBeryP89wwpc5csNFib/seuPvOeZPuxEcqe8sIB67067J74
        uk+jabtP69aMpZ6NnOeN0dhmVQ==
X-Google-Smtp-Source: APXvYqz4fgbRB7Ss4a/vrNbFS4/hpzt1NbkCMgaGVg2Uci+ilao9kBf3CIKxrcDmE8nuT5+ZtLLN/g==
X-Received: by 2002:a17:90b:300c:: with SMTP id hg12mr10092036pjb.75.1572654444907;
        Fri, 01 Nov 2019 17:27:24 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id e8sm9395910pga.17.2019.11.01.17.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2019 17:27:24 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Helgaas <bhelgaas@google.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Andrew Murray <andrew.murray@arm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] PCI: qcom: Add support for SDM845 PCIe
Date:   Fri,  1 Nov 2019 17:27:19 -0700
Message-Id: <20191102002721.4091180-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This second iteration of the patch series fixes review comments on v1 and has
been tested with both PCIe controllers found on the Qualcomm SDM845.

Bjorn Andersson (2):
  dt-bindings: PCI: qcom: Add support for SDM845 PCIe
  PCI: qcom: Add support for SDM845 PCIe controller

 .../devicetree/bindings/pci/qcom,pcie.txt     |  19 +++
 drivers/pci/controller/dwc/pcie-qcom.c        | 152 ++++++++++++++++++
 2 files changed, 171 insertions(+)

-- 
2.23.0

