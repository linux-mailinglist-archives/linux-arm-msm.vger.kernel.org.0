Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FED71E996E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2020 19:29:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728507AbgEaR3K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 31 May 2020 13:29:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728257AbgEaR2Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 31 May 2020 13:28:16 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EDDDC061A0E;
        Sun, 31 May 2020 10:28:16 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id e1so9194399wrt.5;
        Sun, 31 May 2020 10:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VwYKi1TVSKCTfYptId4p6rTM5P6mM5EdUkCP+QK5U2U=;
        b=WUUqbJz8ibnFCPJgjSSFRJ+Mp2NB+PV9t2bzGTM4QK+7xPDoYy0a4USM0reIQJAj6t
         I5GU6T+ZUfc2J3bleAQNgmeEWhxiWVPrYg1h3Bh9aiEZ70Z6udAolq7Fq349JNGYwj5C
         tsBbYjHVtfUOg0BJ2kneC55CRxHAPpPTWMRaiY1hy+oWzXERGRn/n8uyisZj+6Trc90/
         H4AlXuRxLS6BOVd/miD0PpB+GcnP4//yL/vJDWKSzhKYlP8uGUIcG5ygGtAzW5tIpwn/
         aoEX+sxFWfoVhs5ceAVgB5MaRoBKjrAluM+luQoUrauVSCy6gaUCh8q6VZatScIi0Bkk
         pLHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VwYKi1TVSKCTfYptId4p6rTM5P6mM5EdUkCP+QK5U2U=;
        b=lJDa4WrrazZndcD8l+2lkIYXB6mvccv0cmv2d8a3calguoysCil8809xvspSbUFSz7
         8HGrqgjYysYX0hH11oMi/vjp+AInZnt/rmIgjtou1VKvCcY/i0tK7JmdtF5CT8j2+kNS
         xRVvou0voAFg8ZTTaRrFrP89A5f41VOEuSgcnztaIYx3MWcHpzVOEpKNQa0dGa7QUHIM
         aK71AX64Zu5pfUJazldsxO1QihIhC060Y6VtPSAxLZdKhOyb4oVmc72rZAYsdVHmhKC4
         5xllgF27CW0z9BGnAKFVutwqrTHmZYHuqoXOOfLPKmZSgdvoqv0wZeoF+M8LLSFhM4Gc
         OShg==
X-Gm-Message-State: AOAM532sTo7gjChuTHHoKPCN9l7mIRgFBWmCJUBQfh3Q1PYvPQN8HfrB
        xFXjKPi1jldzyCHjbYfFXfg=
X-Google-Smtp-Source: ABdhPJyQsQi68bizr9S3a5ZHY+lQTflW3hKhHZPoizLfBWkgsBpm2Qe9Mu8nmUgOme7vTiKQ61JIKQ==
X-Received: by 2002:a5d:4488:: with SMTP id j8mr17650291wrq.242.1590946094825;
        Sun, 31 May 2020 10:28:14 -0700 (PDT)
Received: from localhost.localdomain (abad130.neoplus.adsl.tpnet.pl. [83.6.167.130])
        by smtp.googlemail.com with ESMTPSA id b81sm8922326wmc.5.2020.05.31.10.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 10:28:14 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 03/14] arm64: dts: msm8992: Add a SCM node
Date:   Sun, 31 May 2020 19:27:53 +0200
Message-Id: <20200531172804.256335-4-konradybcio@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531172804.256335-1-konradybcio@gmail.com>
References: <20200531172804.256335-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8992.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8992.dtsi b/arch/arm64/boot/dts/qcom/msm8992.dtsi
index e255b577af37..535be60521d8 100644
--- a/arch/arm64/boot/dts/qcom/msm8992.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8992.dtsi
@@ -154,6 +154,12 @@ smem {
 		hwlocks = <&sfpb_mutex 3>;
 	};
 
+	firmware {
+		scm {
+			compatible = "qcom,scm-msm8992";
+		};
+	};
+
 	soc {
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
2.26.2

