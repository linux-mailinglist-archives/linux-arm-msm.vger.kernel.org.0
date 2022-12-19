Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B88106511E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Dec 2022 19:31:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232484AbiLSSbJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Dec 2022 13:31:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232415AbiLSSaq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Dec 2022 13:30:46 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C74063A4
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Dec 2022 10:30:43 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id fa4-20020a17090af0c400b002198d1328a0so14650827pjb.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Dec 2022 10:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4GFA6I79C1YmmOYQX1BIX7MOGuUjMMgmSjlJ7uhFCjc=;
        b=Mc7784uK/Dw0M484InJTvQvSUNDaFw8UiRgYeeDdWTnmReOBwnEaenVNCjR/vLX19t
         hL+mi+n/PMoOVTJH6HRLDr9WvZCR+YWQTJgwpI3DDrZe97EPKHGd3x6XUBSKpP3+hHdu
         oQPzCTYD7QO01+XhcMitf+V3QpkpCShljaO60sqQ6eJKc0FB/DeZMylhscXOoPz6hRV1
         vj9BFl6uQzkRfVSyEI8DN/IyZKx6M1yUOxjYgRUgYiVfNE1CINmMMLweR9viI8KDnzAg
         o/qwPNuERzjj+AAWmTTS9ndhK1Ub7wIS9cW7NKIt5Il0Wq4qnOgD3cQDKhBvcCkf6as1
         Pc0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4GFA6I79C1YmmOYQX1BIX7MOGuUjMMgmSjlJ7uhFCjc=;
        b=nLpLcqjF/XXHm0HXPf0wTvkyrIUC6vdBPv7/p23mYCIyKPSOcBZ0SaMYbsItjOT2Mc
         bhh5CAo7CLP2U4heOTRHlGHeOCoCbP6UTkIWC2Y/xAM6MDBCriXMg72Fw/46N+COJ3eq
         Nij82lZhnK6E4s6NBvTNMp6U5oGfeCGRg9zhMgs6WDEIVAS/BcNRNe8qU1FFhPLbK2QP
         5ZHe/mDQi40bEBZImilrk4yNyUWxlpY+6aUy1uUeMQGeBvrLrAeVc7GKnW+XH+ZsAIH8
         ol3WLPhZ9vf9o3O5fB7FT3dgkPUiqznxW/Nfdh1HXEFexMfP2AznuaqBchlQeomj5oIO
         RLoA==
X-Gm-Message-State: ANoB5plqiK/jH6qBPvDgDdXDQLVFbih8pA/l9BbTDAfbOpSovPB24q8s
        /JzlpehE0EnvSpgtWwRQEe/o
X-Google-Smtp-Source: AA0mqf6Y38L5DAw/sVsUjdYt/zYyUfnStsHv/mEzh7Qzg3UzmexrcTOcJFjATaNtynnHB/8hA45R3Q==
X-Received: by 2002:a17:902:c1c5:b0:185:441f:709c with SMTP id c5-20020a170902c1c500b00185441f709cmr43485056plc.33.1671474643251;
        Mon, 19 Dec 2022 10:30:43 -0800 (PST)
Received: from localhost.localdomain ([220.158.159.17])
        by smtp.gmail.com with ESMTPSA id d2-20020a170903230200b00186e34524e3sm7480979plh.136.2022.12.19.10.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 10:30:42 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, bp@alien8.de,
        tony.luck@intel.com
Cc:     quic_saipraka@quicinc.com, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        james.morse@arm.com, mchehab@kernel.org, rric@kernel.org,
        linux-edac@vger.kernel.org, quic_ppareek@quicinc.com,
        luca.weiss@fairphone.com, ahalaney@redhat.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 04/15] arm64: dts: qcom: sc7180: Fix the base addresses of LLCC banks
Date:   Mon, 19 Dec 2022 23:59:47 +0530
Message-Id: <20221219182958.476231-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221219182958.476231-1-manivannan.sadhasivam@linaro.org>
References: <20221219182958.476231-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
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

The LLCC block has several banks each with a different base address
and holes in between. So it is not a correct approach to cover these
banks with a single offset/size. Instead, the individual bank's base
address needs to be specified in devicetree with the exact size.

On SC7180, there is only one LLCC bank available. So let's just pass that
as "llcc0_base".

Reported-by: Parikshit Pareek <quic_ppareek@quicinc.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index f71cf21a8dd8..f861f692c9b1 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -2759,7 +2759,7 @@ dc_noc: interconnect@9160000 {
 		system-cache-controller@9200000 {
 			compatible = "qcom,sc7180-llcc";
 			reg = <0 0x09200000 0 0x50000>, <0 0x09600000 0 0x50000>;
-			reg-names = "llcc_base", "llcc_broadcast_base";
+			reg-names = "llcc0_base", "llcc_broadcast_base";
 			interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-- 
2.25.1

