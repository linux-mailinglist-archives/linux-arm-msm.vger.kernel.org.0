Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78CFB4B55A8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Feb 2022 17:10:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356136AbiBNQKR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Feb 2022 11:10:17 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344948AbiBNQKQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Feb 2022 11:10:16 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 807855F8EF
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Feb 2022 08:10:08 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id w11so27683581wra.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Feb 2022 08:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uCmsBOWygDZgcvn6YZz9clLgl1Vl/Zjf+AzlyIOQfJw=;
        b=JwmdPC0P4fIRnda3EA6veVEbVVTDfn/ELQXJCT8fEb0yi8BP3eU0X1VMbPIf7DOJ+f
         WIalfJoxRaw2+xIFQ97GEz7fA4OyUI3giW/ZefRgSsK0YhL3URUvCh4cPJcN6afTcpqK
         KPAbjEIDRzkOpCtEzr1wsSEYUpifhp5zR7TK8lWVJ1HR/HjDCl+aqbzbuCTAgD2pFQls
         C0wVHoGJ65nttPUGmt/aMK+qt2qKokFbb0SW4FPEQOhLfJrWLDOy+1e46UfORLPdCeUH
         MItADj6iRQs0OQNtE/aQkZb9gR4U1DDFCj+AKhB1jM6NY4aigvuXARycL+MlolR2JVZQ
         ywgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uCmsBOWygDZgcvn6YZz9clLgl1Vl/Zjf+AzlyIOQfJw=;
        b=AwDrlkZJIoMvVQW2Xv2ZJR0hNnbpXslb4mYucB86bSlJbavMOn90upFeVhKNwaJGIh
         gILekpQgQYewkZhTJVvOzUhfLZ2LcqrBr1TCqh/W8a4oK2dgTklcFRxmLKGy4LXjru6P
         N3Hij4jeXvtOuLd0TgJqTZfZnPNHQUeP7TynBnjTzHLVgY3llBhFpjaagWUcdIi3KRxe
         3CdA1aa0kvtE97zkfqPZSJFTFpbl/Fbee4Mwvie1HEoASy5o/Zt/A641YExWU7Ufe10j
         i/Hv96Nerq9Ub9sRvscR2YPf2O0YHzdDlUo0tkfNgRyVUF1yLPLsLixS/zmFmXRZKklB
         x9+g==
X-Gm-Message-State: AOAM5338NLQ+vxnog7S2YWoJ41uzOcKlKiGjTxCe4W53uB5wJZM9SiUs
        h2DVmUjBEjLLrdOEtIKJp+H5ig==
X-Google-Smtp-Source: ABdhPJzW1hsikwKAntwgq4/z8JJqr3ii1hnneAJapj4i/PSijHmBy5VB35QSO+pFdTnVmZhPn3LqFA==
X-Received: by 2002:a5d:4dcc:: with SMTP id f12mr276705wru.598.1644855007027;
        Mon, 14 Feb 2022 08:10:07 -0800 (PST)
Received: from srini-hackbox.lan (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.gmail.com with ESMTPSA id k28sm13677022wms.23.2022.02.14.08.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 08:10:06 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     robh+dt@kernel.org, gregkh@linuxfoundation.org
Cc:     devicetree@vger.kernel.org, ekangupt@qti.qualcomm.com,
        bkumar@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        srini@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v4 00/12] misc: fastrpc: Add more DSP FastRPC features
Date:   Mon, 14 Feb 2022 16:09:50 +0000
Message-Id: <20220214161002.6831-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
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

This patchset adds below DSP FastRPC features that have been missing in
upstream fastrpc driver and also cleans up channel context structure with kref.

- Add ablity to reflect if the DSP domain is secure/unsecure by creating
 seperate device nodes for secured domain, this would used by SE policy
 to restrict applications loading process on the DSP.
- Add new IOCTL to get DSP capabilites
- Add IOCTL to support mapping memory on the DSP.
- Add support for allocating secure memory for DSP
- Handle fdlist in put args
- Handle dma fds in invoke request.

Tested this series on DragonBoard 845c with TensoFlowLite.

Changes since v3:
- remove redundant free in error path of fastrpc_device_register()
- fixed various type cast warnings reported by kernel test robot
- added QCOM_SCM select in Kconfig for secure memory allocations.
- dynamically allocate temp attribute buffer, rather than using it from stack
- added ack for dt-bindings
- removed redundant checks in fastrpc_req_mem_map()

Jeya R (5):
  misc: fastrpc: add support for FASTRPC_IOCTL_MEM_MAP/UNMAP
  misc: fastrpc: Add support to get DSP capabilities
  dt-bindings: misc: add property to support non-secure DSP
  misc: fastrpc: check before loading process to the DSP
  arm64: dts: qcom: add non-secure domain property to fastrpc nodes

Srinivas Kandagatla (2):
  misc: fastrpc: separate fastrpc device from channel context
  misc: fastrpc: add secure domain support

Vamsi Krishna Gattupalli (5):
  dt-bindings: misc: add fastrpc domain vmid property
  misc: fastrpc: Add support to secure memory map
  misc: fastrpc: Add helper function to get list and page
  misc: fastrpc: Add fdlist implementation
  misc: fastrpc: Add dma handle implementation

 .../devicetree/bindings/misc/qcom,fastrpc.txt |  10 +
 arch/arm64/boot/dts/qcom/msm8916.dtsi         |   1 +
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |   2 +
 arch/arm64/boot/dts/qcom/sm8150.dtsi          |   3 +
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |   3 +
 arch/arm64/boot/dts/qcom/sm8350.dtsi          |   3 +
 drivers/misc/Kconfig                          |   1 +
 drivers/misc/fastrpc.c                        | 556 ++++++++++++++++--
 include/uapi/misc/fastrpc.h                   |  81 ++-
 9 files changed, 612 insertions(+), 48 deletions(-)

-- 
2.21.0

