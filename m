Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B475B6B3227
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Mar 2023 00:44:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230256AbjCIXoL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Mar 2023 18:44:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230116AbjCIXoJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Mar 2023 18:44:09 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A64D67018
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Mar 2023 15:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678405402;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=suVYwY+GLAgBE8RKgc91wO3frwS02s2uzBYIie8ENpk=;
        b=CIPf7xf3KpKfSq+T+PtQzH7nUFouQJ2G/xD9wb8tqb7vm8IQ6DEiOxUQfjGe/mAKHxHltK
        C9lOI08FzCJ85nKT6WBP1xoypx99agNWvvfD7YqeLClAtzbvGaHypk8HlxVjQuLO4IDRQj
        UNHSwO89MRXGwWw3bryJLyS8FxTd4xM=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-59-Podl3TIfP5ufmy5RGuvsmQ-1; Thu, 09 Mar 2023 18:43:20 -0500
X-MC-Unique: Podl3TIfP5ufmy5RGuvsmQ-1
Received: by mail-qv1-f69.google.com with SMTP id jy22-20020a0562142b5600b005710b856106so2150987qvb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Mar 2023 15:43:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678405399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=suVYwY+GLAgBE8RKgc91wO3frwS02s2uzBYIie8ENpk=;
        b=BueDVEvjdgwuGmvJA15zvphgihQuIk92YzMjxBPSPd9Qk8wl7t2rlaxPMNPzyrIkbb
         B5LcyJeyBpxgA0uFdTIwtWgjPkhxrucWYcvYUTvhO/k+zwZKOs9QtQaN105/ix3yUExl
         kdoM1w1cXXCSrDqCc0eHil2qXenqxmb1gEEy5ZolEMyFJNUVHxmHQlfiQ/d067RdbG65
         PmQJs+ArSmp8awRa4XnaxUnWNe45CxHRgxq/BPepf8/R82P2yRbvHc0ADQVwOQRyrWpz
         gIj05eB4in3TgrjyXri8scaTM3zHAoaH/qcBsZTG7CIuhD71xGMwqdzXju5Zr1YPfR/L
         0gvg==
X-Gm-Message-State: AO0yUKUkWYX+FNWsKv9ebY/CiadUaf7HCURqF2WoFE+DtBbwaQsW+AMs
        byt4EIHFzBPE+z6PUgkkL91hZG7wV7fgYOcKVu5ma4wBtgJE2x5eGL2yBjyyvpCxNBsaoYicKA7
        yifwz1merBFQxptuiee0M0B/Msg==
X-Received: by 2002:a05:622a:154:b0:3bd:1728:8886 with SMTP id v20-20020a05622a015400b003bd17288886mr748747qtw.9.1678405399459;
        Thu, 09 Mar 2023 15:43:19 -0800 (PST)
X-Google-Smtp-Source: AK7set/uu7J7MQWeYdrYBK1fDWserIzrfXuEWu5uLRWyUvVyFCL7N4gUzEjM3Np1nsOGAGcxkSmh/w==
X-Received: by 2002:a05:622a:154:b0:3bd:1728:8886 with SMTP id v20-20020a05622a015400b003bd17288886mr748722qtw.9.1678405399228;
        Thu, 09 Mar 2023 15:43:19 -0800 (PST)
Received: from localhost (pool-71-184-142-128.bstnma.fios.verizon.net. [71.184.142.128])
        by smtp.gmail.com with ESMTPSA id c15-20020ac8008f000000b003ba19e53e43sm299396qtg.25.2023.03.09.15.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 15:43:18 -0800 (PST)
From:   Eric Chanudet <echanude@redhat.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Eric Chanudet <echanude@redhat.com>
Subject: [PATCH] arm64: dts: qcom: sa8775p: add symbols to dtb
Date:   Thu,  9 Mar 2023 18:39:48 -0500
Message-Id: <20230309233945.1199358-1-echanude@redhat.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

ABL uses the __symbols__ section to process the DTB before passing it
forward. Without it, the bootstrap is interrupted.

Signed-off-by: Eric Chanudet <echanude@redhat.com>
---
Depends on initial sa8775p-ride.dts:
https://lore.kernel.org/all/20230214092713.211054-3-brgl@bgdev.pl/

 arch/arm64/boot/dts/qcom/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index b63cd1861e68..72e85ab31d74 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -1,4 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
+
+# Enable support for device-tree overlays required on sa8775p-ride.
+DTC_FLAGS_sa8775p-ride := -@
+
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8016-sbc.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8094-sony-xperia-kitakami-karin_windy.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
-- 
2.39.1

