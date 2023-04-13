Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DFA46E1554
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Apr 2023 21:42:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229749AbjDMTmX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Apr 2023 15:42:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbjDMTmW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Apr 2023 15:42:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0743C868D
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Apr 2023 12:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681414889;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pe0/oi4k+3plRUDjjra5Jf/XI2sf8St247Sf5O8j+8g=;
        b=K4a2WduOJ0U5HM/GwlKgiDV+pwL7xXdFRrO2kTpX2h/fDbfGIiQcXihfVFtO8nFyIyikw2
        ZvDK8oeIQNsp7GUn+Xu/4eGdX7Gv1O7Td1BUW4N6zrpWRBZuy0BsWMkQoaCozAK9L+OV6c
        Ksq1c4VXOvnZpaHs7hj/pplJuA8+Etg=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-340-T5squllwMKGt_h2uTc7gxw-1; Thu, 13 Apr 2023 15:41:27 -0400
X-MC-Unique: T5squllwMKGt_h2uTc7gxw-1
Received: by mail-ot1-f70.google.com with SMTP id b17-20020a056830105100b006a42f47618fso764593otp.19
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Apr 2023 12:41:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681414886; x=1684006886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pe0/oi4k+3plRUDjjra5Jf/XI2sf8St247Sf5O8j+8g=;
        b=iF4+QVgNwLyQsQpL7wGXcXEl8Zy1pSLTHXuAaHn5kDPXqmevWOmX9PCzcNWxXT0cw0
         j9kxOI4SqUJixNrgvmVLmxQ7Dr6e7C8OaHOxlsSPo5+GQ3khexG03erQ69Bx4lRSlYMN
         TddG3QoL92iW2glrVpPYSAVkL6Zw1Kd4Ilbx4L8wxcip1IevqV55zGL1PmP3mmSR/3Th
         hrBuTQHroDklp4I8Kq9zMFwNKqnT/2atdnJZRLU+9psNG15mbT73UBS+3GFYtoiN22iA
         F1ZFnlan+T/BvM4DAJvBAYBqDb0ILrY5gw18H2MOu2EOxYzWGMcfgoLvEZ1PRelZtEal
         oP0Q==
X-Gm-Message-State: AAQBX9cUrDHY0/eZSqbnmzrI0SPnEtgJBHhlbZ7n5BUn1uXJ++sBGM+R
        C/2VQ5BpwUhVi8CliClrNLzZh7noNMp75N6gs8D/ZAMtzl/VeKSAFu+uLTJKBDZ9PdGohQSuebd
        gejc0n19JsXIbN8DhNKaqnWWo3vMsaL5edA==
X-Received: by 2002:a05:6808:9a2:b0:377:f784:3332 with SMTP id e2-20020a05680809a200b00377f7843332mr1567416oig.24.1681414886725;
        Thu, 13 Apr 2023 12:41:26 -0700 (PDT)
X-Google-Smtp-Source: AKy350YlwdBnAy6xihkKJw9Nntu9FJ2LoTnC1J6rgKBnqrGWtgp/R0SrzSgYs1pLXe/uellQrAs7aw==
X-Received: by 2002:a05:6808:9a2:b0:377:f784:3332 with SMTP id e2-20020a05680809a200b00377f7843332mr1567402oig.24.1681414886483;
        Thu, 13 Apr 2023 12:41:26 -0700 (PDT)
Received: from halaney-x13s.redhat.com (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
        by smtp.gmail.com with ESMTPSA id x19-20020a056808145300b003898bec0e01sm966140oiv.17.2023.04.13.12.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 12:41:26 -0700 (PDT)
From:   Andrew Halaney <ahalaney@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Andrew Halaney <ahalaney@redhat.com>
Subject: [PATCH v2 3/3] arm64: dts: qcom: sa8155p-adp: Remove unneeded rgmii_phy information
Date:   Thu, 13 Apr 2023 14:40:21 -0500
Message-Id: <20230413194020.1077857-3-ahalaney@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230413194020.1077857-1-ahalaney@redhat.com>
References: <20230413194020.1077857-1-ahalaney@redhat.com>
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

Using interrupts-extended already indicates what the interrupt-parent
is, so drop the explicit interrupt-parent.

The comment about this being the phy-intr is not helpful either, since
this is the only interrupt in the phy node.

Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---

Changes since v1:
    * New patch (Konrad)

 arch/arm64/boot/dts/qcom/sa8155p-adp.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8155p-adp.dts b/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
index ac52a8dfeba1..b65e0203d783 100644
--- a/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
+++ b/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
@@ -361,8 +361,7 @@ rgmii_phy: phy@7 {
 			compatible = "ethernet-phy-ieee802.3-c22";
 			reg = <0x7>;
 
-			interrupt-parent = <&tlmm>;
-			interrupts-extended = <&tlmm 124 IRQ_TYPE_EDGE_FALLING>; /* phy intr */
+			interrupts-extended = <&tlmm 124 IRQ_TYPE_EDGE_FALLING>;
 			device_type = "ethernet-phy";
 		};
 	};
-- 
2.39.2

