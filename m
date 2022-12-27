Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F151656CE6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Dec 2022 17:32:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231305AbiL0QcY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Dec 2022 11:32:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232049AbiL0QcJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Dec 2022 11:32:09 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 452AAB85A
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Dec 2022 08:32:03 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id bp15so20237254lfb.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Dec 2022 08:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=frC0CMdSQBqRvRfV0Ly2ms9MOr7jMien4e0QpzgS4Y0=;
        b=ioGOQbrwpxf9zbZNpX07DCYteltcLFONw7PZ/AdAZS1rp3VVGTaokfcHJaASR3on9l
         7d/p7tQ2TGINwm1/LuAo44wxzkXHWiKzesovAjOXHfqXhnpIDiJbNFeZfo5QxYRRCuix
         g7ZtFwQNY9ViDfTjGt1DcqOpl++KxkIIKLR0P/u8R/j3daZwrkXKqKvnChpggvTAne8X
         YuvQjz3RzFqvfrd7KdK+/HmbiYEN1Ft5DiyYYWNZc/QQObjTGCxfL8UbJIZXm8a1U0vV
         bfHHUKZA80s7xz0ZW2fVF8EBFSRd5AZqas7Hbm6p/ypMNh2zDWCshKmWg46bMuOyC+CE
         pJ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=frC0CMdSQBqRvRfV0Ly2ms9MOr7jMien4e0QpzgS4Y0=;
        b=J+T6m51THuDiCtnEET7Dy5Go8Z1iRI94OFsKk9KmrMzdBkR4kcEn0j07tNJK8aYE7g
         JdW6k/zNCu19467qk4JhAGktVtYAirjwAmItApGjNd6/oXmvVpjKmeIz/lrXklPCMuRF
         0t7b0w8YMJwBeTKt+kIlKry+qzJm1q+cI9cyiVq1sVapX6Qu57mcDkllWYAYrbH32q67
         hkf3BVEiw/mJaqulmyiXdYxvQa7RGSWwEN9aw7HsonkcTTj+7p89WOtlkMqkenvh3ooa
         RWhdDHCrmDS0++s2bObhFaN6ZBWXXCO1V9Hyl1/fbSaBMW5cYtZqszScqCcqu28Yiv34
         BZOw==
X-Gm-Message-State: AFqh2krDSwsz8MkenN12zQK9rWGKBVoHMkEe8CZhUOAQfXeUf1m/eFpv
        YJKUmWYaMk4iPvhNlMpppCv6XA==
X-Google-Smtp-Source: AMrXdXt9Cz0ZmNvQ1RK+Z+vtmF660kCSUOPgVi3EWU0VmRLB9+L7Hxqajr5QuGPf+oYMgeyvVZ8CGw==
X-Received: by 2002:a05:6512:ba5:b0:4a4:68b9:19f9 with SMTP id b37-20020a0565120ba500b004a468b919f9mr6635267lfv.33.1672158721634;
        Tue, 27 Dec 2022 08:32:01 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id q8-20020ac25108000000b004aac23e0dd6sm2319853lfb.29.2022.12.27.08.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 08:32:01 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] arm64: dts: qcom: sm8350: drop unused dispcc power-domain-names
Date:   Tue, 27 Dec 2022 17:31:57 +0100
Message-Id: <20221227163158.102737-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Display clock controller bindings do not allow power-domain-names:

  sm8350-hdk.dtb: clock-controller@af00000: 'power-domain-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 0726930c9e28..d473194c968d 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2637,7 +2637,6 @@ dispcc: clock-controller@af00000 {
 			#power-domain-cells = <1>;
 
 			power-domains = <&rpmhpd SM8350_MMCX>;
-			power-domain-names = "mmcx";
 		};
 
 		adsp: remoteproc@17300000 {
-- 
2.34.1

