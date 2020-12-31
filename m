Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E63012E7FF2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Dec 2020 13:38:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726569AbgLaMiW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Dec 2020 07:38:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726356AbgLaMiW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Dec 2020 07:38:22 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B604CC061573
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Dec 2020 04:37:41 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id o13so43839930lfr.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Dec 2020 04:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FRvyjzrInJpr3JKYBPCGmHtSIznRuodhBrrQbM80/4I=;
        b=VmmjIU5Ul+tMl2tDQKoP+sb1H0ZpnytOlddmTpnhtAbZjE8gaQU4t/IeRTRMZ5TLsZ
         PakilYaLK2ZLnFKkF65UcE22481MPO6enwqz/C+rjTWahfokwrjbxBe+16GSneEEGDHZ
         /MSQJ0ol2LX/Sdh+WY6m99mCM6IFdv0AB3He+8/Jvctbee1u0OVLDlWFhEa4Y4sJBTTC
         Kb+yZJq0XcSPgh8qK0UCnUvft1i6bU60GLdfkY1HNfGBGvjFk1mJr9pMAJgOqiEBZ97U
         tQL+DTuAXiu4aPdSQsQs1aZeSzbmSMOnveg4lU8NHjz74nte75/e8GRaKoqeN22rvmts
         v6EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FRvyjzrInJpr3JKYBPCGmHtSIznRuodhBrrQbM80/4I=;
        b=r5rP82otr9fT9uQjV3cMKqXg+mTSZMDRwCmxc3RtEkJGRvGWUgiwKL/4o/kDsXYBf4
         dyOczyJ/j3ZU8qGfCec0t81d5BdR6nRJcYawEzEDpGGIDLQY3VtNlmSHhDJ3BwEExIjK
         egE3WIaAOJmHj7lWuz50ZMWICVy8uqGL6NQwtzed7PliCTolvT8P1lsHYIdklkfwiFK+
         8TtzKvWMiW8oU42ncpIXlVI22RJHJG07RXUEAAaftFotyhvHXRZ24bGNUGaxNu4D5CH4
         rNq+DqketkItMBAHzxocq1EN6AVqCjxPzBp6+tlweGuJtQoVLJIK69EgA7x/7Z+WnccO
         dNQg==
X-Gm-Message-State: AOAM530hYT0DTY6WNw+n1pP7DGrhUfQAuqeIanwJAjHfL91uAIJR5FFl
        ZiNFwYSqxsQfrAp0wGPtDltqwg==
X-Google-Smtp-Source: ABdhPJwZfUAXME/RWsxQic66C4+o11KELhLx7q5JEgO0B4MxXcmjdKKLZxArx/G0ndiU0iRoGzpakA==
X-Received: by 2002:a05:651c:c1:: with SMTP id 1mr29848841ljr.124.1609418260317;
        Thu, 31 Dec 2020 04:37:40 -0800 (PST)
Received: from eriador.lumag.spb.ru ([94.25.228.115])
        by smtp.gmail.com with ESMTPSA id o11sm6228624lfi.267.2020.12.31.04.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Dec 2020 04:37:39 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-pci@vger.kernel.org
Subject: [PATCH v3 0/2] PCI: qcom: fix PCIe support on sm8250
Date:   Thu, 31 Dec 2020 15:37:29 +0300
Message-Id: <20201231123731.651908-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some sm8250 platforms require additional clock to be enabled for PCIe to
function. In case it is disabled, PCIe access will result in IOMMU
timeouts. Add device tree binding and driver support for this clock.

Changes since v2:
 - Split this clock handling from qcom_pcie_get_resources_2_7_0()
 - Change comment to point that the clock is required rather than
   optional

Changes since v1:
 - Added Fixes: tags, as respective patches have hit the upstream Linux
   tree.


