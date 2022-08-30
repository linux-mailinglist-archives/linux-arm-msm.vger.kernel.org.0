Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 259815A6B9B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Aug 2022 20:02:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230270AbiH3SB7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Aug 2022 14:01:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230293AbiH3SBf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Aug 2022 14:01:35 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9923E9C8E2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Aug 2022 11:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661882491;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=B4ruO31PHkrlH5v1gXJkpOHPSYcHLtyneSEzcjXO5Ho=;
        b=MGsOGheHacR2X/1wl1M99EAVcV0j2UnMbhyfPl8/+Krr8pgI78WRO6D7nbNVEN66/Q6OW+
        mpjcPeKRVVmUnrwnsTB9RhMqEndcZ3+HQt1x0woOqMnrqiB717FfT7wk83AkGrgkNuaNxa
        Q+g1fNGNF+xxp7DrzwFJBjYgn8osq9Y=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-537-3vhQ1L7YPbyhLkhHV2dMCQ-1; Tue, 30 Aug 2022 14:01:30 -0400
X-MC-Unique: 3vhQ1L7YPbyhLkhHV2dMCQ-1
Received: by mail-qv1-f70.google.com with SMTP id nv16-20020a056214361000b00499023aff0bso4041101qvb.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Aug 2022 11:01:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=B4ruO31PHkrlH5v1gXJkpOHPSYcHLtyneSEzcjXO5Ho=;
        b=MNidU+xZontTOtnDRxvCphsOZeQR0bfJdLmnUz9/gE1UGLr+qDlqn6FG7wSPPhGfUv
         sxy5whawgwyMjbR53j6fm6TG2KqcTA9H1JFu9XA4d8z0Nhf/KWcEEOqFlpENjHwPV6P3
         T5AkB32wKSZCmWJ1v6FKWG5O/s5MhKv7fnPsS796qi85lhknZpfdwccRMITnulnzBhxe
         xaMeKHgarifxgqflg7KcnYJPMuA1DduWa+RL/9mXO0V5s4aGkeLpHgQfqM3E8sR5mcJW
         p0FU7ncFf/CbGCyboI/38ylc6Rs6X1NVyVYVtLpdsmDcx4iqKLbo8iVVdoUWTZ+VbRYE
         IxIA==
X-Gm-Message-State: ACgBeo1C+MmH0prw//WHRxMFB+ljAVu3Ny0i9LTmUnQxixHTg67aKq3a
        JdFsZbRZD0N8lcvfUOPIFh6PDlw1/6h17AtEEHont4GADO1g89s2IUd1eXRIUQVGBg6BBHC94wG
        5T1is27rMh7IQ+xqXW6n7t55vgA==
X-Received: by 2002:a05:620a:2452:b0:6bb:d8ba:ca65 with SMTP id h18-20020a05620a245200b006bbd8baca65mr12862208qkn.263.1661882489882;
        Tue, 30 Aug 2022 11:01:29 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4FDpHPGTAEXt4hym2rCFYYguOK7NgS2axRiD3nKOflngOJy2QWn639ZrCJ/MLxORdMitK6Nw==
X-Received: by 2002:a05:620a:2452:b0:6bb:d8ba:ca65 with SMTP id h18-20020a05620a245200b006bbd8baca65mr12862167qkn.263.1661882489395;
        Tue, 30 Aug 2022 11:01:29 -0700 (PDT)
Received: from xps13.redhat.com (c-98-239-145-235.hsd1.wv.comcast.net. [98.239.145.235])
        by smtp.gmail.com with ESMTPSA id bm2-20020a05620a198200b006b5f06186aesm8599670qkb.65.2022.08.30.11.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 11:01:29 -0700 (PDT)
From:   Brian Masney <bmasney@redhat.com>
To:     andersson@kernel.org
Cc:     agross@kernel.org, konrad.dybcio@somainline.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ahalaney@redhat.com,
        echanude@redhat.com
Subject: [PATCH v3] arm64: dts: qcom: sc8280xp: correct ref_aux clock for ufs_mem_phy
Date:   Tue, 30 Aug 2022 14:01:20 -0400
Message-Id: <20220830180120.2082734-1-bmasney@redhat.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The first UFS host controller fails to start on the SA8540P automotive
board (QDrive3) due to the following errors:

    ufshcd-qcom 1d84000.ufs: ufshcd_query_flag: Sending flag query for idn 18 failed, err = 253
    ufshcd-qcom 1d84000.ufs: ufshcd_query_flag: Sending flag query for idn 18 failed, err = 253
    ufshcd-qcom 1d84000.ufs: ufshcd_query_flag: Sending flag query for idn 18 failed, err = 253
    ufshcd-qcom 1d84000.ufs: ufshcd_query_flag_retry: query attribute, opcode 5, idn 18, failed
        with error 253 after 3 retries

The system eventually fails to boot with the warning:

    gcc_ufs_phy_axi_clk status stuck at 'off'

This issue can be worked around by adding clk_ignore_unused to the
kernel command line since the system firmware sets up this clock for us.

Let's fix this issue by updating the ref clock on ufs_mem_phy. Note
that the downstream MSM 5.4 sources list this as ref_clk_parent. With
this patch, the SA8540P is able to be booted without clk_ignore_unused.

Signed-off-by: Brian Masney <bmasney@redhat.com>
Fixes: 152d1faf1e2f3 ("arm64: dts: qcom: add SC8280XP platform")
---
v2 of this patch can be found at
https://lore.kernel.org/lkml/20220825163755.683843-1-bmasney@redhat.com/T/#u

v1 of this patch can be found at
https://lore.kernel.org/lkml/20220623142837.3140680-1-bmasney@redhat.com/T/#u

Note that there's also a similar issue with the second UFS controller
(ufs_card_hc) since it separately fails with:

    ufshcd-qcom 1da4000.ufs: Controller enable failed
    ufshcd-qcom 1da4000.ufs: link startup failed 1
    ...
    gcc_ufs_card_axi_clk status stuck at 'off'

We are currently disabling the second UFS host controller (ufs_card_hc) in
our DTS at the moment. I haven't had any luck so far tracking this one
down and it's particularly tough without docs access.

 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 49ea8b5612fc..2bdde4b8f72b 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -891,7 +891,7 @@ ufs_mem_phy: phy@1d87000 {
 			ranges;
 			clock-names = "ref",
 				      "ref_aux";
-			clocks = <&rpmhcc RPMH_CXO_CLK>,
+			clocks = <&gcc GCC_UFS_REF_CLKREF_CLK>,
 				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
 
 			resets = <&ufs_mem_hc 0>;
-- 
2.37.1

