Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DED9E6123A9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Oct 2022 16:17:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229839AbiJ2ORy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Oct 2022 10:17:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229880AbiJ2OR2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Oct 2022 10:17:28 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45D015F9AD
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Oct 2022 07:17:16 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id d13-20020a17090a3b0d00b00213519dfe4aso6833675pjc.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Oct 2022 07:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EXACZbDW7apLefN1TlPN3pFLWjPl4KvU3572LcUxyOo=;
        b=WQmci7+CXSW6GQ3YZTtOI6wcAHK8ZOSTP+1U4l0Ok+7yrr82esT3H1HiUJZrjVx2yy
         9nfrnV0qL1ebiTDJRX886/fIPM1lDsO52NsEboppfir0n416j8YuHqNfz7x90T1u8Tef
         NoWJmWgAz6Toqlu7Dr2HJP+GB7m3Wq9Qvwwc+PpzsWC5PN4RK0FRHQm1IVsIYQxZrHzQ
         4Gzw9pTYj+VLHFyuQ9SXaR1OEWXzKD8o7gubW4BiRbLSB06I4aO2jRYVrEAYcMY20IF6
         lMoh2TTik1Qv8sTqF1qy6MIGwI7/OeyOzcm0x/njrF+JDVhng5cfwjlNpcdfrZGZBQzr
         855g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EXACZbDW7apLefN1TlPN3pFLWjPl4KvU3572LcUxyOo=;
        b=ycRnONVbI40ghTnQa0nLzMk9gQ0f4BUrl7tIL/vACYl4ollD0bAVfanPUtnIyYIlbf
         YplLWN8nEaw3GSO2+/Qr0j7A5Qr1LM0uZi9XX7wJ2f7wSaNr5unpQ+IbDwRonQgTjO6R
         0OJN06WcnrnTLzrjc4BhuszMgZgD3i/gMxbtVCocEpyhKTTHQxDqjLJce8D1AIKtjDNm
         9T9q+yIoD/XhFJRFzQSHFQZiPJzydtW2xK77m6wqyJPmFtB1C+kkEDwx3W2rWlcZeA5x
         hvGQsAt7jxlrwZLOm3GeoHDt+izCwntNakUUDmhhFYZwzX0/AtYGocN93nKZInIyovK/
         wJFw==
X-Gm-Message-State: ACrzQf0WiC8yWLHj/x5vaWpoirm8Sq4NzaPQIpRCHma+TIwCWOrpIhNM
        KOK7ldp48wMA74YjYLVPvahu
X-Google-Smtp-Source: AMsMyM50JY5Z6mFdet8Gu9aa/pUSRGPLlALcaZIKANvKk5YfmmdIGuO+UMd43hf17ma1Hx7OMWc2sQ==
X-Received: by 2002:a17:902:aa84:b0:185:480a:85b6 with SMTP id d4-20020a170902aa8400b00185480a85b6mr4571563plr.170.1667053035929;
        Sat, 29 Oct 2022 07:17:15 -0700 (PDT)
Received: from localhost.localdomain ([117.193.208.18])
        by smtp.gmail.com with ESMTPSA id u4-20020a170902e5c400b001866049ddb1sm1370157plf.161.2022.10.29.07.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Oct 2022 07:17:15 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     martin.petersen@oracle.com, jejb@linux.ibm.com,
        andersson@kernel.org, vkoul@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        quic_cang@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-scsi@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 06/15] dt-bindings: ufs: Add "max-gear" property for UFS device
Date:   Sat, 29 Oct 2022 19:46:24 +0530
Message-Id: <20221029141633.295650-7-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221029141633.295650-1-manivannan.sadhasivam@linaro.org>
References: <20221029141633.295650-1-manivannan.sadhasivam@linaro.org>
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

The maximum gear supported by the UFS device can be specified using the
"max-gear" property. This allows the UFS controller to configure the
TX/RX gear before starting communication with the UFS device.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 Documentation/devicetree/bindings/ufs/ufs-common.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/ufs-common.yaml b/Documentation/devicetree/bindings/ufs/ufs-common.yaml
index 47a4e9e1a775..591a9bc3b99c 100644
--- a/Documentation/devicetree/bindings/ufs/ufs-common.yaml
+++ b/Documentation/devicetree/bindings/ufs/ufs-common.yaml
@@ -73,6 +73,11 @@ properties:
     description:
       Specifies max. load that can be drawn from VCCQ2 supply.
 
+  max-gear:
+    description:
+      Specifies max. gear the UFS device supports.
+    enum: [1, 2, 3, 4, 5]
+
 dependencies:
   freq-table-hz: [ 'clocks' ]
 
-- 
2.25.1

