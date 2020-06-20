Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 178FD202488
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2020 16:51:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728527AbgFTOtP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Jun 2020 10:49:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728476AbgFTOs5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Jun 2020 10:48:57 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0091AC06174E;
        Sat, 20 Jun 2020 07:48:56 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id l11so12381369wru.0;
        Sat, 20 Jun 2020 07:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4YzpTtuQd8igcmEb94rslBu/tpG/FsBo/caSislaGaQ=;
        b=iwNmrvk/680CIVcmDysYUApImaXy0T8JwUvUbmSL7asI/B/S8GMypZ+7ED7NUvwkE+
         8pNceqGjHvAdILbh4MCWjhyKOS+qtHBINaJRmSTyYLWurHDA1TH7XnI/HM40iizw0hu2
         czzMdJuK3obWErYgS8Z/0981GFXt0FmeVkPlLd/oMPvPlIwCBRJ88W2qW5cawwZs2/Gs
         CdqmzlkWtIjrxWlwOmM2+q6+cNgU7Ed5oM3p+BxqmS9m2fymjWWcTK5OKLFArldAUs1D
         AlIcDEi0lhYIlVOBHcRx35Dsfnyp1Pz+46i+rUS4p23h5KDLCQpPAvOdyZYncMBIgX5p
         qVlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4YzpTtuQd8igcmEb94rslBu/tpG/FsBo/caSislaGaQ=;
        b=i0P//gOedXIELQd8uLv8+JwUsLhAlqgUCmXiVsYqad50wX14mQlkX+oLaWNlQcrBIc
         1Quw0DVPgBYB4Nj2FR1JKUDN1FyAnlJeZpbXBb/aGhoR1WrotdTxNFuSEvlvEpapkPP/
         h9GsPE9WuB0j212HLjR4LrR03Mion8rOA+ZEXC4H9FRXatLKa407uX7xYPxH99hxMOlj
         U+apYf6yLu+Gb9Ie/fo9ohjVH1KLIx4p3D5s+CN7kTKgEIGTJOAV7Rxth+MDqgB8pwfr
         WpG2lkD8xKsa3ZjULpFJDwrv2f2YlcGJuwWu99uYu3gKsiJ04qzA1tD19MFPvTKLI/ks
         QF8g==
X-Gm-Message-State: AOAM530ol9Gdq1oK4QmALKGoe7Hi0JFhsU5jDg5OqNHy87JR/kd9M5A+
        Jkk/cvMn7jIzAD1YlmjEjBc=
X-Google-Smtp-Source: ABdhPJxAPPFs2N1QEGxO1eVQZpi2K00TAe7zNr5W0BALYsIcs5XsPpdsiVUS/XzMOaEciBnT1Lm27Q==
X-Received: by 2002:a5d:5549:: with SMTP id g9mr5585965wrw.419.1592664535797;
        Sat, 20 Jun 2020 07:48:55 -0700 (PDT)
Received: from localhost.localdomain (abae138.neoplus.adsl.tpnet.pl. [83.6.168.138])
        by smtp.googlemail.com with ESMTPSA id 63sm11928379wra.86.2020.06.20.07.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 07:48:55 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 19/21] arm64: dts: qcom: angler: Add qcom,msm-id and pmic-id
Date:   Sat, 20 Jun 2020 16:46:35 +0200
Message-Id: <20200620144639.335093-20-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200620144639.335093-1-konradybcio@gmail.com>
References: <20200620144639.335093-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add properties required for the bootloader to select
the correct bootloader blob. They have been removed from
the SoC device tree as they should be set on a per-device
basis.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
index a5f9a6ab512c..baa55643b40f 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
+++ b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
@@ -11,6 +11,8 @@ / {
 	model = "Huawei Nexus 6P";
 	compatible = "huawei,angler", "qcom,msm8994";
 	/* required for bootloader to select correct board */
+	qcom,msm-id = <207 0x20000>;
+	qcom,pmic-id = <0x10009 0x1000A 0x0 0x0>;
 	qcom,board-id = <8026 0>;
 
 	aliases {
-- 
2.27.0

