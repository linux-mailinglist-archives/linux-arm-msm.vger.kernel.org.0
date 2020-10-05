Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0895C2838CD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Oct 2020 17:03:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726821AbgJEPDk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Oct 2020 11:03:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726795AbgJEPDe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Oct 2020 11:03:34 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C131AC0613A7;
        Mon,  5 Oct 2020 08:03:33 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id v12so9147613wmh.3;
        Mon, 05 Oct 2020 08:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ekPdQa1xmNKs7v3pWlFdm/XtGh/8ZRLvEzXqbsequUk=;
        b=LrUl1Vuba6cCvOnDZ2s5MWWgrXdvy/hkE8hrvl0Yy8GxO1rlDw93Miwn8ugtBP/vA5
         mrvgjXGZLhKtroF9eXHOJ3JJaiPT/dbHKxtflt0zum4SXil9IE+dUKMNO6MAl2vl1FjW
         mwetzCdwV0LirsnXDF4CR08WqMYWtQj7K9NOMmazzriOyURChLyVVVgczGzj4eknrdzh
         pz6R15qTQRWYYrFuyY9WXKuaEO48nWe+c4/eEamGwdL1RrAXBCiW43FSxw8LaWHpqSh9
         2vp2wgO5/Pb3ibgSjR5z+zP651Dj+h51vBUb2JkfAVW1u7tB+0D9ODIqPbv+/6t7aQgu
         M12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ekPdQa1xmNKs7v3pWlFdm/XtGh/8ZRLvEzXqbsequUk=;
        b=odC7jPbfFOYr6D6NS21tneckAHS7Jr6AGWou3KdhgQoZ5IkKHQMH5T/kXkTF57IRmP
         9BvBHAENByKyT9e2IaXo8Gl3MfEMASjRYal2eLL5PIQR2hL9iPoq43/N824ZV9FG9tJf
         vCntQC6v3tuYrvJ/sRCuBOwwFe8/XtHdBgMhBKpkSR1O0Nk6rtPR2XS97ycRDJ461+Nr
         oEkMucFP2i/KQNenc0G516OrccEaD3KApN0tMCdPJL6pq8K/Qn9TgtT9YlOeEtFlsKtd
         GgxcG876tSXkPTD1Z+IbL4t3Wrz7OvBQFy+4cogduYAKltCOah/3HDFGvX8oZurU2FCZ
         MU/w==
X-Gm-Message-State: AOAM531M8/fmPSoqD+Mc1wE7oLDkJA4jzxj7MtyCR480N9BH7TgQ5lQz
        SezWG7Wmc1Hykk9j2RmQqLI=
X-Google-Smtp-Source: ABdhPJwsxuNvDZPavDBF0khnTAJv2VsW/kagDfVoHVe7bW2LChyS+RTQZrdg25/QIrsXp/4g6nyWzw==
X-Received: by 2002:a1c:e444:: with SMTP id b65mr16596146wmh.147.1601910212433;
        Mon, 05 Oct 2020 08:03:32 -0700 (PDT)
Received: from localhost.localdomain (abab191.neoplus.adsl.tpnet.pl. [83.6.165.191])
        by smtp.googlemail.com with ESMTPSA id c132sm4662wmf.25.2020.10.05.08.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 08:03:32 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     konradybcio@gmail.com
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 04/11] arm64: dts: qcom: pm8994: Fix up spmi-gpio node
Date:   Mon,  5 Oct 2020 17:03:04 +0200
Message-Id: <20201005150313.149754-5-konradybcio@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201005150313.149754-1-konradybcio@gmail.com>
References: <20201005150313.149754-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a common compatible and switch to gpio-ranges.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/pm8994.dtsi | 27 ++++-----------------------
 1 file changed, 4 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pm8994.dtsi b/arch/arm64/boot/dts/qcom/pm8994.dtsi
index 9ab5657f7d23..5ffdf37d8e31 100644
--- a/arch/arm64/boot/dts/qcom/pm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8994.dtsi
@@ -103,32 +103,13 @@ adc-chan@f {
 		};
 
 		pm8994_gpios: gpios@c000 {
-			compatible = "qcom,pm8994-gpio";
+			compatible = "qcom,pm8994-gpio", "qcom,spmi-gpio";
 			reg = <0xc000>;
 			gpio-controller;
+			gpio-ranges = <&pm8994_gpios 0 0 22>;
 			#gpio-cells = <2>;
-			interrupts = <0 0xc0 0 IRQ_TYPE_NONE>,
-				     <0 0xc1 0 IRQ_TYPE_NONE>,
-				     <0 0xc2 0 IRQ_TYPE_NONE>,
-				     <0 0xc3 0 IRQ_TYPE_NONE>,
-				     <0 0xc4 0 IRQ_TYPE_NONE>,
-				     <0 0xc5 0 IRQ_TYPE_NONE>,
-				     <0 0xc6 0 IRQ_TYPE_NONE>,
-				     <0 0xc7 0 IRQ_TYPE_NONE>,
-				     <0 0xc8 0 IRQ_TYPE_NONE>,
-				     <0 0xc9 0 IRQ_TYPE_NONE>,
-				     <0 0xca 0 IRQ_TYPE_NONE>,
-				     <0 0xcb 0 IRQ_TYPE_NONE>,
-				     <0 0xcc 0 IRQ_TYPE_NONE>,
-				     <0 0xcd 0 IRQ_TYPE_NONE>,
-				     <0 0xce 0 IRQ_TYPE_NONE>,
-				     <0 0xcf 0 IRQ_TYPE_NONE>,
-				     <0 0xd0 0 IRQ_TYPE_NONE>,
-				     <0 0xd1 0 IRQ_TYPE_NONE>,
-				     <0 0xd2 0 IRQ_TYPE_NONE>,
-				     <0 0xd3 0 IRQ_TYPE_NONE>,
-				     <0 0xd4 0 IRQ_TYPE_NONE>,
-				     <0 0xd5 0 IRQ_TYPE_NONE>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
 		};
 
 		pm8994_mpps: mpps@a000 {
-- 
2.28.0

