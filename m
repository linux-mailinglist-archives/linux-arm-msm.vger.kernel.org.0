Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22E5F207667
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2020 17:04:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404081AbgFXPBb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jun 2020 11:01:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404074AbgFXPB3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jun 2020 11:01:29 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9863FC061573;
        Wed, 24 Jun 2020 08:01:28 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id a6so4702012wmm.0;
        Wed, 24 Jun 2020 08:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j5MHiXaY87xhcFzSgoEppWOIw4PI/W2mTXO2EtAtsrk=;
        b=nWg10ic5Znyqh2nkSm7vMQi6C4s3M9LDGWAXH3OxhJmD6waqTf5Eq+TAh+jRq5WWs3
         MLf1e1aNlbwbtjU0rtL0S0YLvXUu0+PoXol/dsa8YFTXthdFwBOt+du9bbxvvI25gPHi
         SdIx89pOASlb7qzSZRDIsRkxzYH5PSZAomZXUXnii3tTMDWXEniBCN2U9RGGOGaXIkk9
         bfRvx98VR1BX1sO9DRKGCgC/pSTSnSpNFR4R+3TeZ2z2NVsJ7S8ERpSZVIo7ruDL3bu4
         Q/bI3PcAmaiSh2cCSN+Wu66lv0U60rTtBDquNCa0yeMCO50LzAd2b549ZcBY/sVMriCj
         +lgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j5MHiXaY87xhcFzSgoEppWOIw4PI/W2mTXO2EtAtsrk=;
        b=cedF6Ng/b08jZ7eNwBRupFfI3gOs0F2yDhDmJHwszZTqnU0kgtP9toXkLfSDXrfJpn
         rjmYwpU0vsrjVTMW9xW03ZCeb1ne6vvSk17JhkM61wpxUL4UgPGtcuaCHmkgWzOl6+Ms
         6Wa4Flz3eKwJmyOnTvZAHFAL7Be5bgweElEvuSlId0H88Qeg66Ph/jD4Jtwtdv84w76d
         m7Vg2bMlhxVd55giXK9KXzD456VePWv2Nj1fmZVg6NlfPTYdysZe+ChK1cCxzQB0x+wB
         RJ9PaajEtjta75TQIMq21Sk98jG9m2ZM88/rL6t6YH4lqRpFE4JlUpuwKJu7Oorkrc7n
         bhsg==
X-Gm-Message-State: AOAM531wcVckcMdYrQ7PIdY+Sz6yRHiX737/tfj20B6xjLemoq5pqWTX
        UY+kUr/T4KzDtaTVTGmnrKs=
X-Google-Smtp-Source: ABdhPJyTDzQBb99Kqj+gLNwD0kcgxLpUoW49nBppIz1AXz5BV4NPu89aY27trGas2TqrSflMrgq/oQ==
X-Received: by 2002:a1c:143:: with SMTP id 64mr31671929wmb.182.1593010887305;
        Wed, 24 Jun 2020 08:01:27 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id s8sm21339390wru.38.2020.06.24.08.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 08:01:26 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/8] arm64: dts: qcom: msm8992: Add a label to rpm-requests
Date:   Wed, 24 Jun 2020 17:01:01 +0200
Message-Id: <20200624150107.76234-4-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200624150107.76234-1-konradybcio@gmail.com>
References: <20200624150107.76234-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This enables the node to be referenced directly from other
DTs.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8992.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8992.dtsi b/arch/arm64/boot/dts/qcom/msm8992.dtsi
index 2021795c99ad..8e5a3ae79997 100644
--- a/arch/arm64/boot/dts/qcom/msm8992.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8992.dtsi
@@ -258,7 +258,7 @@ rpm {
 			qcom,local-pid = <0>;
 			qcom,remote-pid = <6>;
 
-			rpm-requests {
+			rpm_requests: rpm-requests {
 				compatible = "qcom,rpm-msm8994";
 				qcom,smd-channels = "rpm_requests";
 
-- 
2.27.0

