Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFB987D56C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Oct 2023 17:44:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343610AbjJXPoF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Oct 2023 11:44:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343648AbjJXPoF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Oct 2023 11:44:05 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EB96DE;
        Tue, 24 Oct 2023 08:44:03 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-507ad511315so6868508e87.0;
        Tue, 24 Oct 2023 08:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698162241; x=1698767041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iAtX50oj9/g4Jj7MoJHLYgtiDO9X9MamioUdOkSL84U=;
        b=Vps4c53XtZP/dWsmj1IqiguYaojqlFC9tdUjCi3hABSg1XOaCP8+puDfYLEHKlfBjo
         ++5xCJHoKes2IBptHA7ZKqmjiyI9t3w6sA2mX0RvqEmkO0AZBZnqolN6Ir4BzgbbTQry
         bUI516qTCzQvVmopUe2KfsAiofRiDtZCACaXr8lzgvpvEKUdHiX7m+h7hiBhD+K9wZBT
         fDoW9dp3mAOGaxJ10huL0lgSSDSUr8VnSetPzdzK2n7CiQ/CRARVWLlulRjy0ysT/rtK
         qX37Z0Ud+3uFeD7spdtLbtJ7HNCLQwtBnbqAORMZWtv9nOY68CHQPr0Dgm3vRrewTPSX
         MipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698162241; x=1698767041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iAtX50oj9/g4Jj7MoJHLYgtiDO9X9MamioUdOkSL84U=;
        b=fvihhZY554UhZyNO0PA2rkVX2y6FgGNM5J8Qo3Lp1Xlq+O/u+lBmyoJAzxH+/nbaYR
         UDcWmUcP5S+XUfSUtdpNA2ApWyG+CmzfLgIPJ/5kUgwbFGrHovPq1Jvc+mHv3hOo1xSW
         pm6VQ+5Z7R36W6p1KAf3hN0cMAz/yF4q2Aj8LidtxCQ+e32ki7jylwNh0i9uQbVxkNG/
         bt5A3cSFJ9Gv4hRQVbY5R1Cjoo7x9ow011lxt3Luz3nKALkPC02z01BBQW1uLiQwCuKy
         aC44kd1y0sjeQbkkCxG6v/igwUzKe5NDlGstR2HQBsjSCxRGgX2QhbWxUERxed60B9Rn
         ByWQ==
X-Gm-Message-State: AOJu0YxIRLoBNY/m+VKOtD5FJ3R1bLnzzkGQ2Tsi65/jOjHOP5U2QkTN
        ZnHSsepan9QdJb3zmSGkwhw=
X-Google-Smtp-Source: AGHT+IHckGOQYFMTmquZLFr43MgbTJoFsIUVfHPS/n9O8bbLfmLjS2FEbsIJj+9O/gNAVib1TLGgCg==
X-Received: by 2002:a05:6512:2815:b0:503:3447:b704 with SMTP id cf21-20020a056512281500b005033447b704mr11756275lfb.0.1698162240966;
        Tue, 24 Oct 2023 08:44:00 -0700 (PDT)
Received: from debian.lan ([37.45.216.172])
        by smtp.googlemail.com with ESMTPSA id m1-20020ac24ac1000000b0050810b02cffsm102420lfp.22.2023.10.24.08.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 08:44:00 -0700 (PDT)
From:   Dzmitry Sankouski <dsankouski@gmail.com>
Cc:     Dzmitry Sankouski <dsankouski@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 6/6] arm64: dts: qcom: starqltechn: add supply to framebuffer
Date:   Tue, 24 Oct 2023 18:43:38 +0300
Message-Id: <20231024154338.407191-7-dsankouski@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231024154338.407191-1-dsankouski@gmail.com>
References: <20231024154338.407191-1-dsankouski@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This prevents framebuffer from shutting down.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org

---

Changes in v2:
- none

 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index 0e2c7df2baa7..59e770073666 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -33,6 +33,9 @@ framebuffer: framebuffer@9d400000 {
 			height = <2960>;
 			stride = <(1440 * 4)>;
 			format = "a8r8g8b8";
+			vci-supply = <&s2dos05_ldo4>;
+			vddr-supply = <&s2dos05_buck1>;
+			vdd3-supply = <&s2dos05_ldo1>;
 		};
 	};
 
-- 
2.30.2

