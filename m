Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B630767DD76
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jan 2023 07:34:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229956AbjA0GeI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Jan 2023 01:34:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229948AbjA0GeH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Jan 2023 01:34:07 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89E613A593
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 22:34:02 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id m7-20020a17090a71c700b0022c0c070f2eso6976453pjs.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 22:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:author:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6N+UBn2rnpBa97iC9jvCaWmiVqPMRKzilYeorfm1ieE=;
        b=DgQyxZJo9eaUdZ2iRw8PaWRrWt/hoB2wXhf1CWWiGABXiB3WBnJ3PJooko/P988Bzt
         g+jPFHDF/3V2SGGOif53DoF2X+D4b4lS/DJU2L5t5u8hnX4xGG2c3Fitky6onwNgFrBU
         4X+7K6feOW7x20scVBBSYrMS9CxCHwjVsjOL8dXbhBzxecosB9ciXxLvRpi19Y5umpTg
         Sj5SOhQRU1YT19rJ4ahRz98U3g/qUcoel6NZPT937VLKoQHJLyRks9Iztw8EfJbkv/Ky
         e4hqBJn2T+d5/PzmKMbUmcWedwoOX1b9HWdaleei1TuO0RATVwQPBOa7JZX15k0GZant
         4CvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:author:mime-version:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6N+UBn2rnpBa97iC9jvCaWmiVqPMRKzilYeorfm1ieE=;
        b=RkVLONjVvA3O9a+QN5XaojH4d9iDHDpQ+CnzZB+glErwC6J15yC4vTHcz8v0wjgfGR
         aiiv1IkvYHa+fqtC0HT74TC1klv/rDknMll2toU7llTDp1RFQaFbeEzeiIIca+598D77
         ogKXBrvv9iHNql9xkJoU3svoDKpGoaKbF+emakrVq80sVujbZPFYTFMlUN/WNA3q5X0t
         hJDrwI6kIYCAV8Qr6x9q1VnS49rXtt9BmtLnO1fS+KpFHc2Vi74F7IUB6+7iBqubr32z
         Sq1bEKXq4m6oDe+BTyY/b5rtpP0S3zwN54DmXAu+J/W6jN/JXtR6u8amyC0ZqTbIBv1m
         ybiA==
X-Gm-Message-State: AFqh2kqRFhzByEGvM8gkC3uK08j4BavIb1Alnb4cmU88S3hAlaTDoWG8
        00Xzn5BgnCAzmQOXKTx0t3ttMg==
X-Google-Smtp-Source: AMrXdXvLo+rgivVpPZYlIb+v2QmhY8jJauPV00jAmDz2jJwGWr9u4/ArU0Re+wFiw/eHfac5bRGy7g==
X-Received: by 2002:a17:902:ea0e:b0:195:f0f9:a9fb with SMTP id s14-20020a170902ea0e00b00195f0f9a9fbmr30711803plg.11.1674801242004;
        Thu, 26 Jan 2023 22:34:02 -0800 (PST)
Received: from localhost.localdomain ([122.171.17.192])
        by smtp.gmail.com with ESMTPSA id m129-20020a625887000000b005921c46cbadsm1910358pfb.99.2023.01.26.22.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 22:34:01 -0800 (PST)
From:   Amit Pundir <amit.pundir@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        Joel Selvaraj <joelselvaraj.oss@gmail.com>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dt <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        phone-devel <phone-devel@vger.kernel.org>
Subject: [PATCH v2] arm64: dts: qcom: sdm845-xiaomi-beryllium: Add reserved memory region
Date:   Fri, 27 Jan 2023 12:03:55 +0530
Message-Id: <20230127063355.1775246-1-amit.pundir@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Author: Amit Pundir <amit.pundir@linaro.org>
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Put cont splash memory region under the reserved-memory as
confirmed by the downstream code for both Tianma and EBBG variants.

Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
---
v2: The framebuffer address is same for the EBBG variant too,
    so moved this change from -tianma.dts to -common.dtsi.

 .../arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
index eb6b2b676eca..37591daace73 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
@@ -97,6 +97,12 @@ spss_mem: memory@97f00000 {
 			no-map;
 		};
 
+		/* Cont splash region set up by the bootloader */
+		cont_splash_mem: framebuffer@9d400000 {
+			reg = <0 0x9d400000 0 0x2400000>;
+			no-map;
+		};
+
 		rmtfs_mem: memory@f6301000 {
 			compatible = "qcom,rmtfs-mem";
 			reg = <0 0xf6301000 0 0x200000>;
-- 
2.25.1

