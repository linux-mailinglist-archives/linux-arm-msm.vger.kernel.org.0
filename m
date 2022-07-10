Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B33756CE2B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Jul 2022 11:00:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229680AbiGJJAs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 10 Jul 2022 05:00:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229580AbiGJJAp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 10 Jul 2022 05:00:45 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DA6E11A18
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Jul 2022 02:00:44 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id z25so4294020lfr.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Jul 2022 02:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VZs4kXHK9xbLHkrqMGuJyZ5VoLx/pQiEUX4aKEkcY5A=;
        b=NE0ahQ1LMEzRiDmam57ajPEX+MCfHm20NEAFqzHi/YYk76pgWNaUlBynt1fjo/qMqo
         A5T7sD6O3yrfZ+QlLQMO8PtLQxQMwVmJafXTbs7ZuetGUdqlXQh5HTNaVbSAN2wVKGUc
         cMNEjYgeVeYSPiXtMLgVYI5kF7Bqlmycx42OBbb7lYvSGfrmKY5t+YOkZlpsRZIG4I7y
         B4e2VMR639gQv28cRqt+G/I0+5/d+5fFNL/Owvr2JlPJ/Bo+OZH6Thpd/pvl4DgEK5Q1
         vetJToJjxA0y29kuoXjHpUQO9ixHE8maBjjvBA1B52WYok3uv8CkCQY3Z8HTAEaMAp0R
         CO1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VZs4kXHK9xbLHkrqMGuJyZ5VoLx/pQiEUX4aKEkcY5A=;
        b=XfQud1HUF8uN31fNPUJzmwODE9ykwp5acxCRfjvIg7X0lqO61sbSyVsp8yYeaJfQmD
         SLBfc2018IKiUqmeD34cpFPYtFQ0DD+LydQmX+GoGLLw5fApVseIf8EsSqmLH0lKAVr2
         UPIsbrOcGQW+d0uwZkDZD0hAAA+4zLhI6z8Vh+PXdDXtoE1OSBXCzfOmLo/hZTtB9Cbz
         ICXQOuKFfDXoeuYTYdpfaN8xsEjPi+gpW06vAAng1RsuflMRUaM1u8FI0WvNaTGP9/N/
         NpUqIuUtkxKnIs3nSJcJFAscW4BSlNHABvT53DM6zdMyzWwNTiBfpBWXrBJTO18PFuLu
         aF3A==
X-Gm-Message-State: AJIora/X1LTwPnoCsbKPqL6QoJeqJMaQ93WWz5YEtPPT9KFtuvPiJq9s
        nhy2iVONjdnJc6VIIKe16Yn21A==
X-Google-Smtp-Source: AGRyM1vJ2bvlLB+NlRwTwtW/ZZXgTuVBInd2vfmXy7JJPK9tbJTYw/ZGF0qL4Nv+Gv+WtrPPjOt2CA==
X-Received: by 2002:ac2:4e08:0:b0:47f:7b73:c9b9 with SMTP id e8-20020ac24e08000000b0047f7b73c9b9mr8006082lfr.5.1657443642786;
        Sun, 10 Jul 2022 02:00:42 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u16-20020a056512095000b004896b58f2fasm822881lft.270.2022.07.10.02.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 02:00:42 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 02/11] arm64: dts: qcom: sc7180: rename DPU device node
Date:   Sun, 10 Jul 2022 12:00:31 +0300
Message-Id: <20220710090040.35193-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
References: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Rename DPU device node to display-controller@ae01000 to follow the
DPU schema.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 72994f599825..e63b4515453f 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -2911,7 +2911,7 @@ mdss: mdss@ae00000 {
 
 			status = "disabled";
 
-			mdp: mdp@ae01000 {
+			mdp: display-controller@ae01000 {
 				compatible = "qcom,sc7180-dpu";
 				reg = <0 0x0ae01000 0 0x8f000>,
 				      <0 0x0aeb0000 0 0x2008>;
-- 
2.35.1

