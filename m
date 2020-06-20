Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2493220244E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2020 16:48:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728303AbgFTOsL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Jun 2020 10:48:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728210AbgFTOsK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Jun 2020 10:48:10 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A59B2C06174E;
        Sat, 20 Jun 2020 07:48:09 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id l10so12342521wrr.10;
        Sat, 20 Jun 2020 07:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gc0U5BY5xfcdQl/eC7NgZpP6UnL7LldYy3w5rHojCg4=;
        b=EzaSBXNBnxFRM6fuFA81/CVP4RUExXAKANnj8fH0ME9BCKMj6aR+oEsIEWKLADI07H
         xS7nTzJsYvK7MWKNYLggwY3cWR75kF5K+vAOjgYHGtkptdj52b0MCS2+ShfBKjLvlphU
         5dzXAE34siSY6Hy1WZZthzK3tk1MNQSMsMKSbq0kfcuL2bxyc4qbhGr7ldBzmJFSfGVM
         C4GCZ+jGaeuk4NldIiWnwuo2K4KwqGv2wkdmQM1MDc6iqC4gpnBitpSsW5+0wB47LdBD
         pJhV1cXnvl9bTIWFzVPCsEMKad+nIH+bed78x+2CUSln/zUJm/LhER2HPmLvO82CzoIn
         TM/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gc0U5BY5xfcdQl/eC7NgZpP6UnL7LldYy3w5rHojCg4=;
        b=G9NJSxU/8jX5bYnYvVawMGvkPAjSZwiGkW9NEbIvl8VMGSmmkMvylOungHGNBvWS5Y
         BdkzHx8i9DtzvrlZC9mukGqb8SY3EMh5RMovuItgR5Vvh7e2YRymxrtVqxxxh3l9mjV+
         VaRuuorhN98Lh8VCIhcuMaofjliXM6UuhU79fEzrsWviHh500sExnqwfG1+ozWLcthdz
         n1vA2VS/S10Sqh+vJF0vMHeBul7F7gJQJdYyynlbdzEcILKW5o2Ln60pfrUYi05lAX8M
         yV031hRCyGy7KXrq6Yk1Hy9VdLCiPYcc1n7DHTNExb4QJLvJviTPLGAMv+iYP6M1Wv5P
         DwiA==
X-Gm-Message-State: AOAM532YtIYrzFjYNJHJY2rFAiwclT6mgrRaa1uJ2gsFRmy0oQXoQDQn
        nGTJ7pdC4rdMa9kf/Bb9TXmx0PDVLh0=
X-Google-Smtp-Source: ABdhPJwLjTvuB811cO0MxzNKNmFnd9+h9sS47O5p7YfQzAjHcqoe6HNS9NlEowLN4/yHzUthrYubOA==
X-Received: by 2002:adf:e50a:: with SMTP id j10mr10142108wrm.71.1592664488324;
        Sat, 20 Jun 2020 07:48:08 -0700 (PDT)
Received: from localhost.localdomain (abae138.neoplus.adsl.tpnet.pl. [83.6.168.138])
        by smtp.googlemail.com with ESMTPSA id 63sm11928379wra.86.2020.06.20.07.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 07:48:07 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 05/21] arm64: dts: qcom: msm8994: Rename the smem node and remove its unit address
Date:   Sat, 20 Jun 2020 16:46:21 +0200
Message-Id: <20200620144639.335093-6-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200620144639.335093-1-konradybcio@gmail.com>
References: <20200620144639.335093-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change the way smem node is described to match other upstream device
trees. The previous style was used in downstream kernels.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index 0e8cf7e3dd85..5206605d3bad 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -308,7 +308,7 @@ tcsr_mutex: hwlock {
 		#hwlock-cells = <1>;
 	};
 
-	qcom,smem@6a00000 {
+	smem {
 		compatible = "qcom,smem";
 		memory-region = <&smem_mem>;
 		hwlocks = <&tcsr_mutex 3>;
-- 
2.27.0

