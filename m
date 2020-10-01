Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 826DE280954
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Oct 2020 23:19:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727017AbgJAVTB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Oct 2020 17:19:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726581AbgJAVTB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Oct 2020 17:19:01 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B11B3C0613D0
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2020 14:19:00 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id d6so5838254pfn.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2020 14:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o6gfDXEJLeAYyj9Q6Zq3Q1hxYl7JjjLOkCkFFqFw28U=;
        b=aX/si9tOkchkaGMk3LdngnIu1GASm/NLGr+AK+wKhh78asvuqlfSXJGdK5V89uPO7I
         E2gb+pj2CprllK7XDzYwU5ECAEARZno2bMoUScyskTDVI0FESNfaVGfkrVCc+pb+UjJK
         +rr6GkoyuXusXuBxnUl6IBv8UWOJIFHafnURI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o6gfDXEJLeAYyj9Q6Zq3Q1hxYl7JjjLOkCkFFqFw28U=;
        b=GEfOi9+ZybYX5rtOXBJ0LvRKyDi7AyIMLdDyMcQ/cf5y7/Z8c/qQGW5dkDOJSE9I4y
         wvk+VcBQIBfA3ZaYEQPj7kOiuWCTaX0nJqMTqsfmT0af4I147Ir9g1giWIhivSg5aHIB
         bH1hv9xVfhp7A0onGvrh3c7dKa41Tcwe87P5bD8ToHDVgB5THXM5in69kBucLzAQULS8
         Kveiqs1/dPBNUXFgD10/+nqn03zN0NjNcfw/GWJr7dyulGTtB3w1DahqLlg0z5SRgjff
         byofyedbNMI2uetXzgLpj+69GtIMo+evvX/MbTyluGI/1mhwQ/B0xMSm+VqwgI4lvXfv
         OHPA==
X-Gm-Message-State: AOAM531KYZBdhzm7iokEq8Pd+tdtpLfVkapDeoPNOoVUdynfKgyx8x8l
        /6LqmZiKTlJZTr5aLx7wPR1nkw==
X-Google-Smtp-Source: ABdhPJwZF0ZAWF2PfTHClWpYeuET6GaWsOLh7BAKXN8nDHEimGl2jek4GooFykamHhkjawIgEYQLDA==
X-Received: by 2002:aa7:9059:0:b029:151:d725:e230 with SMTP id n25-20020aa790590000b0290151d725e230mr8854719pfo.77.1601587140205;
        Thu, 01 Oct 2020 14:19:00 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id q5sm7268990pfn.172.2020.10.01.14.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 14:18:59 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sibi Sankar <sibis@codeaurora.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sc7180: Fix one forgotten interconnect reference
Date:   Thu,  1 Oct 2020 14:18:55 -0700
Message-Id: <20201001141838.1.I08054d1d976eed64ffa1b0e21d568e0dc6040b54@changeid>
X-Mailer: git-send-email 2.28.0.709.gb0816b6eb0-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In commit e23b1220a246 ("arm64: dts: qcom: sc7180: Increase the number
of interconnect cells") we missed increasing the cells on one
interconnect.  That's no bueno.  Fix it.

NOTE: it appears that things aren't totally broken without this fix,
but clearly something isn't going to be working right.  If nothing
else, without this fix I see this in the logs:

  OF: /soc@0/mdss@ae00000: could not get #interconnect-cells for /soc@0/interrupt-controller@17a00000

Fixes: e23b1220a246 ("arm64: dts: qcom: sc7180: Increase the number of interconnect cells")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 6678f1e8e395..a02776ce77a1 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -2811,7 +2811,7 @@ mdss: mdss@ae00000 {
 			interrupt-controller;
 			#interrupt-cells = <1>;
 
-			interconnects = <&mmss_noc MASTER_MDP0 &mc_virt SLAVE_EBI1>;
+			interconnects = <&mmss_noc MASTER_MDP0 0 &mc_virt SLAVE_EBI1 0>;
 			interconnect-names = "mdp0-mem";
 
 			iommus = <&apps_smmu 0x800 0x2>;
-- 
2.28.0.709.gb0816b6eb0-goog

