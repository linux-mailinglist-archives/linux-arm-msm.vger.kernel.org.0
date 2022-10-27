Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8BC560F69A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Oct 2022 13:57:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235433AbiJ0L5y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Oct 2022 07:57:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235412AbiJ0L5w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Oct 2022 07:57:52 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B5B2297
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 04:57:51 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id k19so1722097lji.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 04:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+haLpTJY+Yq4kbp0eK3uqAJ8H9p8YmI5+8lTBRSO0DU=;
        b=bijkMGDpdA8sgHlIOQ7XcM13fnEgWD1TwSsfE8gS2+pLPiPPkIaJpHqo2uUDOHcUDT
         SQeBsLBxgJoMoQH/iViYEVJ4JHW/NIOvD5ap6jPuFLzcRC3b2TNvWbxiFbUgW9oIBtp+
         fCYQEa7piPcxHHe/z49q5Kz/g1C7LpGXrv2JCZboM/yz0wOKk6r4rz34OxaMqoSGfeTB
         xHAyn8+OirvuDeHPlMAViArRlcpuefrGkWajpoPHUkILhWMVtkx7bswh41qrq7lpRyW4
         Xxp42e0kTnoDop/zizBZ4bA4mO95z6xPjLixrmaOkCC7zmGbzZK4YAykuqG5WD4pc4dD
         cqUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+haLpTJY+Yq4kbp0eK3uqAJ8H9p8YmI5+8lTBRSO0DU=;
        b=1cm2BeRL0K/9ByYeSVnLAFiipi8jgEN3vS2Cth58ydz5GgdKSGvfI/tUHZdX0Txj9Y
         EYGzgwPY8wQ/p4XT6Vf2BN3WYvH7FswaAPs4kdK7PFET4dk9XEmZfowMwgzfg4QwFpxy
         ZjUVhZbB/klr1oEDKkb6V7aoGebBXt+sSGYhrLujOD6WuXZPsqfzt55SH+FdiTYQ7STZ
         TerBjBfmKn5cMAPVjuRsy0Yt3QlpEjScAWKWu7RUEk6MPmKv4k/UxcEn9N3NJ5+MSmEp
         zpvk2klgIYA+fFORzbEDQttW7skWk/H1psO+P47Q3IRh36z7mYImqs2xraT80QCBLGvh
         K92w==
X-Gm-Message-State: ACrzQf3LBLs/uDP7nxjl8EI8Mis7WRrq00E7ACDP6ITSxqiFQvOME8Dn
        zyJWwUwoYmn/EmoekstFpK1Rvw==
X-Google-Smtp-Source: AMsMyM48/wQq/Jkx50F3FMnAFPj14OpIn9u3fQj2o8IH2V7AQCvr7JRv/tlWtDMIFblkHzUaum92EA==
X-Received: by 2002:a2e:a554:0:b0:26f:ea5d:a075 with SMTP id e20-20020a2ea554000000b0026fea5da075mr18884164ljn.322.1666871869632;
        Thu, 27 Oct 2022 04:57:49 -0700 (PDT)
Received: from uffe-XPS13.. (h-94-254-63-18.NA.cust.bahnhof.se. [94.254.63.18])
        by smtp.gmail.com with ESMTPSA id z13-20020a056512370d00b0049f53b65790sm156841lfr.228.2022.10.27.04.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 04:57:48 -0700 (PDT)
From:   Ulf Hansson <ulf.hansson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Maulik Shah <quic_mkshah@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Amit Pundir <amit.pundir@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sm8250: Disable the not yet supported cluster idle state
Date:   Thu, 27 Oct 2022 13:57:45 +0200
Message-Id: <20221027115745.240516-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

To support the deeper cluster idle state for sm8250 platforms, some
additional synchronization is needed between the rpmh-rsc device and the
CPU cluster PM domain. Until that is supported, let's disable the cluster
idle state.

This fixes a problem that has been reported for the Qcom RB5 platform (see
below), but most likely other sm8250 platforms suffers from similar issues,
so let's make the fix generic for sm8250.

vreg_l11c_3p3: failed to enable: -ETIMEDOUT
qcom-rpmh-regulator 18200000.rsc:pm8150l-rpmh-regulators: ldo11: devm_regulator_register() failed, ret=-110
qcom-rpmh-regulator: probe of 18200000.rsc:pm8150l-rpmh-regulators failed with error -110

Reported-by: Amit Pundir <amit.pundir@linaro.org>
Fixes: 32bc936d7321 ("arm64: dts: qcom: sm8250: Add cpuidle states")
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---

This problem was reported by Amit [1] together with an attempt to fix it. It
turned, that we wanted a more generic fix, hence I posted $subject patch.

Also note that, $subject patch is also depending (from functionality point of
view) on a another for genpd [2]. Although, that should soon reach v6.1-rc[n] and
stable kernels. 

Bjorn, can you pick this up as a fix for v6.1-rc and tag it for stable kernels?

Kind regards
Ulf Hansson

[1]
https://lore.kernel.org/lkml/20221018145348.4051809-1-amit.pundir@linaro.org/
[2]
https://lore.kernel.org/lkml/CAJZ5v0hJxRiL03XDFpU8FuabsHn5i6JMksJ=dfj8B+Dm=s3LYA@mail.gmail.com/

---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index a5b62cadb129..e276eed1f8e2 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -334,6 +334,7 @@ CLUSTER_SLEEP_0: cluster-sleep-0 {
 				exit-latency-us = <6562>;
 				min-residency-us = <9987>;
 				local-timer-stop;
+				status = "disabled";
 			};
 		};
 	};
-- 
2.34.1

