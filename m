Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D4AA25CD8F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Sep 2020 00:28:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728294AbgICW2T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Sep 2020 18:28:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728988AbgICW1P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Sep 2020 18:27:15 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB91BC06125E
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2020 15:27:14 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id z2so3197348qtv.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2020 15:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Eg1t9In0g5b7CTs/tQIaFcuTzs3vfJs/vuWLC07Pzgc=;
        b=mRrR9ilYMg1OOegUka41qYoRCU25laiyVARX4xxF6J+7i+DZLSjHl+zoXxDIXk55Pn
         Ul8wFONEb6KtDQ30kaWNmGgZaCd0N0ZTEDKKV1X8aTMzyh2HWxPAoZcLtuLEOQiyt36P
         34g2IRyVVcKKr4irRKmfiI8en3pPyt8uVu9IXzE3fBH/7VjoX4cGq9JE/DaK2z+gTBZa
         w5ErxbUjsIqY5YPVmcUcp7CUtwt7PqtBf/atz4Ito2/N5GEfK20gj1vCawafwOzomCtb
         OnqX5UdP2lntdOUAUYL59uwl9Y3EsvJMnc/2JChHAWPMmPgVwaBaMBLQuIMHTEekRGqT
         3Quw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Eg1t9In0g5b7CTs/tQIaFcuTzs3vfJs/vuWLC07Pzgc=;
        b=bTZuMInYasJB2BaA/0sY93YLi8+kapHzWqn9C+Lmr9HH7gFciUmgGdrQ5+aatIKy5b
         oEqZCd4g2yFUMvDUZ6rJ8fCjKQ8OuioxAdVjqP0a19ol7zF45aHvH9294w8glRFBpOXA
         igxRWFJbhL/LvmdiMsrwbJDWxR17/yRfMnfAf0T6DB7eX6QbmaCcQNX94RPKWDhhzrUN
         UtM73IhYZIldK4+iCK4dix3/pMJ7rTLcb+8hQakGf48VVRMyq+lAjtzVomHAJAlkLwIq
         FHrwDgRc3z4TsQ/NJ4Llp0i9oas1+b5lVE00BasnqHxw+4DiAJ65t2dPaQnKkUuT88wp
         2eZw==
X-Gm-Message-State: AOAM532OMgEWXNsKhle/w785TO9oU2QNd9HeT+TNe7Bwk+5cW4Xo93ux
        8X3E8Zm5i7mEcD7HBKPXSUeW4suJX0YZvBpIZuI=
X-Google-Smtp-Source: ABdhPJyLV2eb86Nsfbw+iM3w6ebemM6ZYJF5/tgw4W/oNcN66sgd2w6vSHOiDqWGb4G67oUcPY0A8w==
X-Received: by 2002:ac8:748c:: with SMTP id v12mr5697566qtq.200.1599172033997;
        Thu, 03 Sep 2020 15:27:13 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id y30sm3217157qth.7.2020.09.03.15.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 15:27:13 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/7] arm64: dts: qcom: sdm845-dispcc: same name for dp_phy clocks as sc7180
Date:   Thu,  3 Sep 2020 18:26:10 -0400
Message-Id: <20200903222620.27448-3-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200903222620.27448-1-jonathan@marek.ca>
References: <20200903222620.27448-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This makes it easier to combine dt bindings for sdm845/sc7180 dispcc.

Note: nothing upstream provides these clocks and the sdm845 dispcc driver
hasn't switched to using .fw_name for these clocks (these properties are
ignored), so changing this shouldn't be a problem.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 2884577dcb77..8184d6204b33 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4139,8 +4139,8 @@ dispcc: clock-controller@af00000 {
 				      "dsi0_phy_pll_out_dsiclk",
 				      "dsi1_phy_pll_out_byteclk",
 				      "dsi1_phy_pll_out_dsiclk",
-				      "dp_link_clk_divsel_ten",
-				      "dp_vco_divided_clk_src_mux";
+				      "dp_phy_pll_link_clk",
+				      "dp_phy_pll_vco_div_clk";
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
-- 
2.26.1

