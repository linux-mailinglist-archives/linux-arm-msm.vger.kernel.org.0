Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF6EFD6210
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2019 14:09:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731606AbfJNMJ6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Oct 2019 08:09:58 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:45147 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726589AbfJNMJ6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Oct 2019 08:09:58 -0400
Received: by mail-lf1-f65.google.com with SMTP id r134so11621396lff.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2019 05:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ParE+ZmbB2ikn5nxND/RLYbU3JushIxT3oO/rX9DYCk=;
        b=dv0NGmFNdslQbFptZG0RiJoj1wUM+esqZI+vuDRF87P688gTVJcoTadce6o/7aXEwc
         iRDxqEEbmTLiqF4mAMPoF6+qgFoOyVYyxge8vVLfdjqbFkQOtvSMfv5DjaWWaBKqqDUb
         kPemtJ4Oa5GcQDi6keS1R0I4VKQsM6Jv9Mp9t4O2nv4vDtRbCbuPEW3RZfQAe7Rh76Ls
         s+AsuLPaCx0qlZ6wmBRRal+MKJGIy/uRLQ8o/2aTmHlKupNAJycHmXI8E3PZygodLCLD
         xAMQX7X+wjsb7gO+5mpK6Yk2HlkJY5CFxaiWO9Uqvj8RY/eA/VD6KF4suixqx95LcMQI
         0KwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ParE+ZmbB2ikn5nxND/RLYbU3JushIxT3oO/rX9DYCk=;
        b=dsfj+02O3L9UvlNMatDhcuEpmDn9ARBOqzwZDwP+Dc2A2dvxMQvWMyIEvRMPeYEWXj
         ZVx/7ksRMHt3PJldwRFiQ3zFgvzYjoPRijW85YpFGYhKekIZ1LocA1eRYU2+1M6Vo56z
         pqWzExYriiBYdOFa4NS9+oIlr5SWf9OiYO7OM3fhxlcaDPEFcmN4SF10Q+6uhEpwQMDY
         XL5MVl5kyTanQiyStRV1y3Uo4qRlmuPQT4kU6MHOZTYWUQThQz1OGXG5jgLHWnGofxyv
         hQLO9rA+QVu7tMiCJEZD4RJg/Dem8AiXOpJGeD5nvD4w4u+ofHKJ+Df4gn4i8k+ck0vL
         Eb5A==
X-Gm-Message-State: APjAAAXi52a0CVSiyTxj8dshslaDCoGIpJkkWNwQHfF3cBX0RTWAPwSf
        OKxuGO4MUt0YnjtgE6Iv/SBQJw==
X-Google-Smtp-Source: APXvYqx+L4Cg6HwU5uud5ULkqS844eRSs2NSHhQOhqaaM/hSd11sq+52EA8MQlHp/zaEQoNdvqEq3A==
X-Received: by 2002:ac2:5486:: with SMTP id t6mr18155056lfk.183.1571054996170;
        Mon, 14 Oct 2019 05:09:56 -0700 (PDT)
Received: from localhost.localdomain (ua-84-219-138-247.bbcust.telenor.se. [84.219.138.247])
        by smtp.gmail.com with ESMTPSA id l7sm4137597lji.46.2019.10.14.05.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 05:09:55 -0700 (PDT)
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     Andy Gross <agross@kernel.org>
Cc:     Niklas Cassel <niklas.cassel@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: qcs404-evb: Set vdd_apc regulator in high power mode
Date:   Mon, 14 Oct 2019 14:09:20 +0200
Message-Id: <20191014120920.12691-1-niklas.cassel@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

vdd_apc is the regulator that supplies the main CPU cluster.

At sudden CPU load changes, we have noticed invalid page faults on
addresses with all bits shifted, as well as on addresses with individual
bits flipped.

By putting the vdd_apc regulator in high power mode, the voltage drops
during sudden load changes will be less severe, and we have not been able
to reproduce the invalid page faults with the regulator in this mode.

Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index 501a7330dbc8..522d3ef72df5 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -73,6 +73,7 @@
 		regulator-always-on;
 		regulator-boot-on;
 		regulator-name = "vdd_apc";
+		regulator-initial-mode = <1>;
 		regulator-min-microvolt = <1048000>;
 		regulator-max-microvolt = <1384000>;
 	};
-- 
2.21.0

