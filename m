Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91B0211D736
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2019 20:36:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730669AbfLLTgS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Dec 2019 14:36:18 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:34629 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730664AbfLLTgS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Dec 2019 14:36:18 -0500
Received: by mail-pj1-f66.google.com with SMTP id j11so1510035pjs.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2019 11:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ImwQrt4+ASNt2Q7OYNBZqW7Xb6BRtjl1Ax5bFWps8lo=;
        b=Ha7vPRYeArv0gldLsw7B4rPz3IGOCgRfcuSYkydMMFSVm/kTtSg7XorAMBS+159yLe
         WKSkV7MosS+nd56fZ/Ls5AssGx/0zdnA9bzJCjll0b1btVLhxmeA4X7/xLKY7hq0cREt
         Ajf2ZlquR+0X2LBG6E9cZuxGZ7byzhfPuU08o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ImwQrt4+ASNt2Q7OYNBZqW7Xb6BRtjl1Ax5bFWps8lo=;
        b=Kes+ZleVhQirFQ3KEEVXin4y404gi7Vvnph1+AFCICOLImTSA9M0LiOUjSybAWtPVY
         mrGvt2DAnwQJO2s3ifbraD6sdvhSfm9D0lEBYM/VwKBxRa+BvP2btsdl7Dv16fdV/HUL
         FzNOhggtTntf0INPTXY7K2qd8FY90MPkX2+MqXdkOUiEPjwV2HswWgV0C6Jn3GHzdM5T
         M0D4x4RNhxV1/p0VYJmnNDVX6YUVvSG6xS2dIablvfM7si1SNXUl+hg+2jRyb8E5G8Oo
         k1MGCddwB8N68s6c92d6dH/Msv4A87V2UybSzMiVTIeNgcbufeXD5YgEt/kjfcCUD8Iq
         VAHg==
X-Gm-Message-State: APjAAAUjTzGmpxaqgUrLkhh1g+z8JD3bbVlARGl2FvCKhblEvA/3NciA
        OTqbnr6x06iDy1z5+fZiFCPm4w==
X-Google-Smtp-Source: APXvYqzCdTRZCR79zSJLn5TFO0zIzut61GTDaUp63R7VMg2CJ5BqDpFu9fCu4/15kGZ6WwefQqKNRA==
X-Received: by 2002:a17:90a:ba04:: with SMTP id s4mr11613215pjr.92.1576179377766;
        Thu, 12 Dec 2019 11:36:17 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id m34sm7568302pgb.26.2019.12.12.11.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2019 11:36:17 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Vinod Koul <vkoul@kernel.org>, Kiran Gunda <kgunda@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>, swboyd@chromium.org,
        mka@chromium.org, Sandeep Maheswaram <sanm@codeaurora.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 1/7] arm64: dts: qcom: sc7180: Add SoC name to compatible
Date:   Thu, 12 Dec 2019 11:35:37 -0800
Message-Id: <20191212113540.1.I158061c65974bf0f653ceb79b442b76a1fd64868@changeid>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
In-Reply-To: <20191212193544.80640-1-dianders@chromium.org>
References: <20191212193544.80640-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Running `make dtbs_check` yells because qcom.yaml says that we should
have:

- items:
    - enum:
        - qcom,sc7180-idp
    - const: qcom,sc7180

...but we're missing "qcom,sc7180".  Add it.

Fixes: 90db71e48070 ("arm64: dts: sc7180: Add minimal dts/dtsi files for SC7180 soc")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/sc7180-idp.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
index f582c9dcc9aa..388f50ad4fde 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
@@ -14,7 +14,7 @@
 
 / {
 	model = "Qualcomm Technologies, Inc. SC7180 IDP";
-	compatible = "qcom,sc7180-idp";
+	compatible = "qcom,sc7180-idp", "qcom,sc7180";
 
 	aliases {
 		hsuart0 = &uart3;
-- 
2.24.1.735.g03f4e72817-goog

