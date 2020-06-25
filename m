Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44F3420A4CB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2020 20:22:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405853AbgFYSWW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jun 2020 14:22:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405809AbgFYSVx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jun 2020 14:21:53 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CA2DC08C5C1;
        Thu, 25 Jun 2020 11:21:52 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id mb16so6895424ejb.4;
        Thu, 25 Jun 2020 11:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pTVtJVVsCF4n2vh1JzOdJd7gCv+oDiYNsYtyRbNOBIc=;
        b=Yd3+HVPQVYDwRVDUz4oTNKCSfuftlozimjmj1cXgNBPVwaceQn2ajb3LMhtKpOfaGg
         fhIYVbvPuolG/QcFPODVxXS+iaygaC6F0QTkykGVj6ONEz9GmHGWOtGe28RFgYGGLUGC
         j8kbvBttdZRI0vcP7MOXEcUm6z5gnGKaXwWggNRTAaWI/VCHw6H12HoD+7Z84sQ0QVCO
         Gth0yRXbJlJbCbOhPiFGv9/jZAknBdSbgHBARy5LN81BoEIdKntXrdeveFOmoTYNvDcS
         3FRyCko6rkqABz3EyZy0Zbz7lLm0CHox/2sW4tz8vEyiOAIAzDS9v0s5RDOWtKSEIO+r
         Y9iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pTVtJVVsCF4n2vh1JzOdJd7gCv+oDiYNsYtyRbNOBIc=;
        b=J+4b3wAfLHorM2atHJs3NtLRcJJ/6oAYd8bC/95/KZsajToPMNigFhnhXw/MxCJjbt
         EE5DLBnDOSmSG/Lj8hTfwouoClFhf3fKUnniY3ODcdWr7VD/HF8qCLRffrbZDJ+9mNjM
         O9mbuEjk9xDyyQTS3v329xb5g49C25GWXfU3WoUWTAd89q2+Ca1+7pT0EwRETRQkpeIB
         ZNnOU7KW63qgHA1pPMVlupS9a4BX5tfTVPLkFxsEJBtrIFsPu4i8ReQlOOXTDEpTRPbW
         nPAfCbK2HP48C0+5Th/OHjr98NWQuXtwHAK85WWegYQl465FsA1D2r0EWGxipKc1cTy2
         PQOw==
X-Gm-Message-State: AOAM5301aT3/KXHBcPBPP0SFmqRivV9tgWDAYRIqVT0XqveRUXQu8UM0
        Ywy8B3qdP4Gic67yFtkaxSg=
X-Google-Smtp-Source: ABdhPJz8shLktI7VKp6LqVXlW2tEMgj63oh3vfvuHLHLIBphePWeiiaNA9yJ7ksBme6ba2N+4bdB1Q==
X-Received: by 2002:a17:906:a1cc:: with SMTP id bx12mr93990ejb.461.1593109311223;
        Thu, 25 Jun 2020 11:21:51 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id lm22sm1523448ejb.109.2020.06.25.11.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 11:21:50 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 11/13] arm64: dts: qcom: msm8992: Add RPMCC node
Date:   Thu, 25 Jun 2020 20:21:15 +0200
Message-Id: <20200625182118.131476-12-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200625182118.131476-1-konradybcio@gmail.com>
References: <20200625182118.131476-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This lets us use clocks provided by RPM.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8992.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8992.dtsi b/arch/arm64/boot/dts/qcom/msm8992.dtsi
index bc3acc0cf9bf..188fff2095f1 100644
--- a/arch/arm64/boot/dts/qcom/msm8992.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8992.dtsi
@@ -588,6 +588,11 @@ rpm {
 			rpm_requests: rpm-requests {
 				compatible = "qcom,rpm-msm8994";
 				qcom,smd-channels = "rpm_requests";
+
+				rpmcc: rpmcc {
+					compatible = "qcom,rpmcc-msm8992";
+					#clock-cells = <1>;
+				};
 			};
 		};
 	};
-- 
2.27.0

