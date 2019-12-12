Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC12311D729
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2019 20:36:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730708AbfLLTgX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Dec 2019 14:36:23 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:38609 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730699AbfLLTgV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Dec 2019 14:36:21 -0500
Received: by mail-pj1-f66.google.com with SMTP id l4so1500189pjt.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2019 11:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MZ57NewYQ5jCW+orc5j0iho3oQqTOLJRfXQb3djfClk=;
        b=EFLfk5/wrWx5pLPfaF/UOh6Smi/+pjD8PoHeKagvsin62PiZrYK6RRmMsDJ+EBGxq/
         5yFpUShhrfpIPBoWr5Rrnw4Wr+MQ1tVBQfTdw5Ya0a2Xqf8YvedgklWYEP4JXtYZvA5g
         +AagCBsPzO1baHkgxbuzI/YbWPP1rL4IwVudo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MZ57NewYQ5jCW+orc5j0iho3oQqTOLJRfXQb3djfClk=;
        b=O5Z09bCrkFbCVXQJdczdrls71yMAx9ir7q8sPdbK+ATlF/q2pHna9c3mLQj6ONcVUq
         NFbxiH2BHStZCrcvU98XVR/k/ycU0dr9001nvCLR+buIFCLX4HN3y1j5JkXZ8nplvThL
         yuCpU/wCgW7dd2bftBiNAB7UYUy2o7Z7LBeBxSZi3gR3TbWO2WtzIEkYXTWu9g4fyvN4
         yVqYm5S/C3Q8hPmB+VV5CCmy7zEyQMhQ5WvRikUGlRGBy0UdSKyADRmcVoyNzgUP3vMX
         HyjOjJwMFh8RcYdptZDRoqKmRBWcaRKR/Z74cVx3EL2yEzTx0tN7O0fb8iVV6f9g1e3Q
         emSg==
X-Gm-Message-State: APjAAAXzvcII2e6bF4Ggy+k8lDHG8WmL8t+TmwIIcflfeqfChv45g+h9
        PoUysBU5fWYJDDo0CMRNgEC8eA==
X-Google-Smtp-Source: APXvYqyskd7SVHbWkbAc5v5MMN+YnTMGS0xA4okHOYs7JP1HFDoveJw+PF97RoIsZu5gR5lxa5ktaw==
X-Received: by 2002:a17:90b:911:: with SMTP id bo17mr11802904pjb.11.1576179380909;
        Thu, 12 Dec 2019 11:36:20 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id m34sm7568302pgb.26.2019.12.12.11.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2019 11:36:20 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Vinod Koul <vkoul@kernel.org>, Kiran Gunda <kgunda@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>, swboyd@chromium.org,
        mka@chromium.org, Sandeep Maheswaram <sanm@codeaurora.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 4/7] arm64: dts: qcom: pm6150: Remove macro from unit name of adc-chan
Date:   Thu, 12 Dec 2019 11:35:40 -0800
Message-Id: <20191212113540.4.I5f67a5ed7665f658c95447a837cbd0021e1dc689@changeid>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
In-Reply-To: <20191212193544.80640-1-dianders@chromium.org>
References: <20191212193544.80640-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is just like commit e77cc85ee390 ("arm64: dts: qcom: sdm845:
remove macro from unit name").  It fixes the error in 'make
dtbs_check':

arch/arm64/boot/dts/qcom/sc7180-idp.dt.yaml: adc@3100: 'adc-chan@0x06' does not match any of the regexes: ...

Fixes: a727ec1232d9 ("arm64: dts: qcom: pm6150: Add PM6150/PM6150L PMIC peripherals")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/pm6150.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/pm6150.dtsi b/arch/arm64/boot/dts/qcom/pm6150.dtsi
index 1fcbc7a1e062..23534639f455 100644
--- a/arch/arm64/boot/dts/qcom/pm6150.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm6150.dtsi
@@ -46,7 +46,7 @@ pm6150_adc: adc@3100 {
 			#size-cells = <0>;
 			#io-channel-cells = <1>;
 
-			adc-chan@ADC5_DIE_TEMP {
+			adc-chan@6 {
 				reg = <ADC5_DIE_TEMP>;
 				label = "die_temp";
 			};
-- 
2.24.1.735.g03f4e72817-goog

