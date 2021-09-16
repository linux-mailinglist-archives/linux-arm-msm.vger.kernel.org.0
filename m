Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2668740DDB0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Sep 2021 17:13:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239050AbhIPPPF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Sep 2021 11:15:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238593AbhIPPPF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Sep 2021 11:15:05 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 082E0C061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Sep 2021 08:13:43 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id bq5so20016824lfb.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Sep 2021 08:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T4iaKAz281ly8U3YFMuPz3Pm66NQ3ADgiB5fEwkwbfk=;
        b=ixeGRntvkSZ11VxvbdDV/G2hEEwzkmK6bsBULcG1QvCDHacgb7P+82wpKb2CyONy1l
         kvSn7agtq1Qj3RTm4c7evwzkADkTTqjFe0PtDcQsFXmVXnaZBu6lBN60PT0ukyoYZHQb
         yAOk/1Wh9Q1vQpy6ErigZf9/jz5g0entoraHjM2+TdZ6Accs14L/VIz+Ktdpj59K5181
         cHjvSXb2baYA8YRYvfNxsbADGUswVbiPD3qGuTlbPvHx7ND2ZXKlG6NTyOnPhCDyUzHX
         v0LJLXziVapja8vA8Qyh29s22Fz13XR8mPnHSMHuQqP0t1P1frMt4AStvedd3raxGX/N
         PAiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T4iaKAz281ly8U3YFMuPz3Pm66NQ3ADgiB5fEwkwbfk=;
        b=kON432OEdGh7wqZX0uEPSZ+tuFYMzD+tYXgo3ndf+G/Jl6NzOlCeCNtTh5WK22NE96
         ldLZrE7Y/01I1y/9kYj2IyfhBgICWdIGp8xI9vPF76RTc1jBo7DVtbhiWAnTOCAyMaLi
         dVaZLfkK0LXtQDqCQeDD9LHFDSpeWZFEHJ65M0nF+3ePHlUtGjEg1IhgS0hbb/nKEU9C
         J/dx19FZPAZPbdx8OKu4ea6ngoen8XC32M+hbHiUbvopBk8UT8Hn8T8rxPwD95AtjDXT
         FHNV/ltEg3favdW/7a3Jlm8KT6QIJBwwIJe4GGq0gHFBKjiydTzeuxtEZgK1tbqOWWzj
         Rbhw==
X-Gm-Message-State: AOAM532zkXmd3wFv6H3IFzApMz9CmtvzaZYhlGZimNACb09XQSY8U14P
        95n+pEG9j/u/RvoQkTed85vmkbTO+WXK5Q==
X-Google-Smtp-Source: ABdhPJxKnJq/FMypaDZhB3fOlXG/Fs+0sdpV1dn2WmEcAnYvmnYATTGVACGB33tdHdl6qZvWjzYCug==
X-Received: by 2002:a2e:bf0d:: with SMTP id c13mr5243333ljr.101.1631805222136;
        Thu, 16 Sep 2021 08:13:42 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t15sm283799lfe.178.2021.09.16.08.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 08:13:41 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Amit Pundir <amit.pundir@linaro.org>
Subject: [PATCH 1/3] arm64: dts: qcom: pm8150: use qcom,pm8998-pon binding
Date:   Thu, 16 Sep 2021 18:13:39 +0300
Message-Id: <20210916151341.1797512-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change pm8150 to use the qcom,pm8998-pon compatible string for the pon
in order to pass reboot mode properly.

Fixes: 5101f22a5c37 ("arm64: dts: qcom: pm8150: Add base dts file")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8150.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/pm8150.dtsi b/arch/arm64/boot/dts/qcom/pm8150.dtsi
index c566a64b1373..00385b1fd358 100644
--- a/arch/arm64/boot/dts/qcom/pm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8150.dtsi
@@ -48,7 +48,7 @@ pm8150_0: pmic@0 {
 		#size-cells = <0>;
 
 		pon: power-on@800 {
-			compatible = "qcom,pm8916-pon";
+			compatible = "qcom,pm8998-pon";
 			reg = <0x0800>;
 
 			pon_pwrkey: pwrkey {
-- 
2.33.0

