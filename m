Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14AFF46E809
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Dec 2021 13:07:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237075AbhLIMKb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Dec 2021 07:10:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232748AbhLIMKb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Dec 2021 07:10:31 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7BB7C061746
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Dec 2021 04:06:57 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id d9so9318347wrw.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Dec 2021 04:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B4jzaZ5YOJWu9qAvUf9/4CV89gWjgVfjWYj9x/kP2HA=;
        b=hfcRJLtLiVbPbRF4KYYE1ebR7ZfnDM508HNZLaUNAsnv084HrNTvRgeGbymQrsP73F
         7kCWBmRE9/FvmBifXPnF2YXbpkkq9DlCwcUtAJrOvmirv0o9uf2sk5TQao+YraIO8ivr
         +piXSH2QVbamvpDna+Ce5yv9dAP3k2h0RJEbvDshABs2AlnMVSBpmW0yPus18bMBQ/Ke
         x/UQWvsQKMpRV0DpLMaq9xuIvtpv537/muuMZ7Zhl8WBAt/icnPvY3RVdBeaF7VGX532
         KkA9hHn6i5Pb/UgUwxSMHehCI5kw1mfUxuUf1nQPEqgXHZGKnezghXiDTIHFIj8bTl2u
         XdKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B4jzaZ5YOJWu9qAvUf9/4CV89gWjgVfjWYj9x/kP2HA=;
        b=IUGq8svTgumEkwvNKL62eqwo1oZ4kN0Df58oINeyLGHRvwCGWYegRo2HeXXXh1YGOK
         wP610e8/9yW35rI4EIbi5fNAw+ncl/QcHf1lvARiTQqK6fnrnMzzfj6trLnKeYHc5vyQ
         gFV4zNE4XipQz06MtyDTK8cCy/1rbdKlhRlaQUWV5A9pq/L6f4FlZkrWXRssd2JWqzWM
         poUmoEUAUkIVYWwuUpt+0nZCwC+LDKb0o5nN7Kd6SN/abzmbTx7AYP4O3FtEOR150v2Y
         cNsmjBm5a6fXw8jTEY7ssGycN0kETHha+lWf1SD6efdB8EhdYSMWa4dj2EHd300oc2ft
         Jd2g==
X-Gm-Message-State: AOAM533XU5kvxwI0uFoqebjd2vFodY5rPnU4nDPlNcxtLh5wbW1XhjcI
        kqfjNTiBR+0dSq/NVrn1D1cPLw==
X-Google-Smtp-Source: ABdhPJzZfw3mlbeipW3+11C2/S0zlS2fPPTFDvdDIuXdoewUGyedFIfxJ3HNrw1JuefDqKtL1WiY8g==
X-Received: by 2002:adf:d1e2:: with SMTP id g2mr6212838wrd.105.1639051616283;
        Thu, 09 Dec 2021 04:06:56 -0800 (PST)
Received: from srini-hackbox.lan (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.gmail.com with ESMTPSA id 4sm7513289wrz.90.2021.12.09.04.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 04:06:55 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     robh+dt@kernel.org, gregkh@linuxfoundation.org
Cc:     devicetree@vger.kernel.org, ekangupt@qti.qualcomm.com,
        jeyr@codeaurora.org, bkumar@qti.qualcomm.com,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 0/8] misc: fastrpc: Add missing DSP FastRPC features
Date:   Thu,  9 Dec 2021 12:06:18 +0000
Message-Id: <20211209120626.26373-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patchset adds below DSP FastRPC features that have been missing in
upstream fastrpc driver and also cleans up channel context structure with kref.

- Add ablity to reflect if the DSP domain is secure/unsecure by creating
 seperate device nodes for secured domain, this would used by SE policy
 to restrict applications loading process on the DSP.
- Add new IOCTL to get DSP capabilites
- Add IOCTL to support mapping memory on the DSP.

Tested this series on DragonBoard 845c with TensorFlow.

dt bindings patch has dependency this yaml conversion patch:
"dt-bindings: misc: fastrpc convert bindings to yaml"
https://lore.kernel.org/lkml/20211208101508.24582-1-david@ixit.cz/T/

Jeya R (6):
  misc: fastrpc: add remote process attributes
  misc: fastrpc: add support for FASTRPC_IOCTL_MEM_MAP/UNMAP
  misc: fastrpc: Add support to get DSP capabilities
  dt-bindings: misc: add property to support non-secure DSP
  misc: fastrpc: check before loading process to the DSP
  arm64: dts: qcom: add non-secure domain property to fastrpc nodes

Srinivas Kandagatla (2):
  misc: fastrpc: separate fastrpc device from channel context
  misc: fastrpc: add secure domain support

 .../bindings/misc/qcom,fastrpc.yaml           |   5 +
 arch/arm64/boot/dts/qcom/msm8916.dtsi         |   1 +
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |   2 +
 arch/arm64/boot/dts/qcom/sm8150.dtsi          |   3 +
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |   3 +
 arch/arm64/boot/dts/qcom/sm8350.dtsi          |   3 +
 drivers/misc/fastrpc.c                        | 390 +++++++++++++++++-
 include/uapi/misc/fastrpc.h                   |  76 ++++
 8 files changed, 470 insertions(+), 13 deletions(-)

-- 
2.21.0

