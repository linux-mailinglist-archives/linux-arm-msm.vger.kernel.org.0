Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1FE64DB743
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Mar 2022 18:36:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357663AbiCPRh5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Mar 2022 13:37:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357617AbiCPRhv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Mar 2022 13:37:51 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08DB3674C1;
        Wed, 16 Mar 2022 10:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1647452194; x=1678988194;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=FZbKDaIG8oa2z9OUkUdZOeZmdJdbdYRfDQdDaWJlPos=;
  b=AjHw9OuUpaRv8ElQ3qqP7zcGzsW5TMRFe6hSBXO/IA8v9JI4myS4VyhS
   0NptoCBv/knL2SQy3Vdw1Bjm/QyVnk3ooQpNPMahrgXt25+iHEBrGvywB
   VGh1bm52wimNsLi7b2MsgdB5a26fy0KypXO8k+39+7YVwVRonK+anYjYV
   A=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 16 Mar 2022 10:36:33 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2022 10:36:33 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 16 Mar 2022 10:36:32 -0700
Received: from sbillaka-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 16 Mar 2022 10:36:25 -0700
From:   Sankeerth Billakanti <quic_sbillaka@quicinc.com>
To:     <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <quic_kalyant@quicinc.com>,
        <quic_abhinavk@quicinc.com>, <dianders@chromium.org>,
        <quic_khsieh@quicinc.com>, <agross@kernel.org>,
        <bjorn.andersson@linaro.org>, <robh+dt@kernel.org>,
        <krzk+dt@kernel.org>, <sean@poorly.run>, <airlied@linux.ie>,
        <daniel@ffwll.ch>, <thierry.reding@gmail.com>, <sam@ravnborg.org>,
        <dmitry.baryshkov@linaro.org>, <quic_vproddut@quicinc.com>
Subject: [PATCH v5 1/9] arm64: dts: qcom: sc7280: rename edp_out label to mdss_edp_out
Date:   Wed, 16 Mar 2022 23:05:46 +0530
Message-ID: <1647452154-16361-2-git-send-email-quic_sbillaka@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1647452154-16361-1-git-send-email-quic_sbillaka@quicinc.com>
References: <1647452154-16361-1-git-send-email-quic_sbillaka@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Rename the edp_out label in the sc7280 platform to mdss_edp_out
so that the nodes related to mdss are all grouped together in
the board specific files.

Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
---

Changes in v5:
  - Change the order of patches
  - Modify commit text

 arch/arm64/boot/dts/qcom/sc7280.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index c07765d..bcf7562 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3332,7 +3332,7 @@
 
 					port@1 {
 						reg = <1>;
-						edp_out: endpoint { };
+						mdss_edp_out: endpoint { };
 					};
 				};
 
-- 
2.7.4

