Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5FB013B7FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2020 03:53:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728890AbgAOCxQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Jan 2020 21:53:16 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:38046 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728879AbgAOCxQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Jan 2020 21:53:16 -0500
Received: by mail-pl1-f193.google.com with SMTP id f20so6169224plj.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2020 18:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gF3OskaGa/QxUDmPvNcm3vrogsAuUP5CnJib3LoH51g=;
        b=Za1FQRu8vQCbZEuyQROhvjusnN9d71flpKqSSPSKtR4Bzt8dgkXG5y3Zu5EsyFvqwp
         trTwkkKyfs8WjvaK9KWFv525+pwPnLwe7gZ0wJAJUt1h7l8sFCl+WgkLl85yrrzV6lq4
         fGmzqwTJ6gSJN96h4oStmSNF+ho+Fx8QC51hI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gF3OskaGa/QxUDmPvNcm3vrogsAuUP5CnJib3LoH51g=;
        b=iGyn1oHoCcHPJglYbZx0lnzpYRv90A4OIejIbrQ7qZ4FsJuSLARaJRzzKsLzpYa+W3
         fHNM68x5/1i3seyc7u453/HfctxClysbs1rH/ekQFnJLVhpYeM8VXBtjN/ks1jp1WUKZ
         GJcnsWVT6WYGNyUGd5dSwcXb+Fh4/Prs1ONkqxdGnNUyIQQVyHOlmlaLhGHAeSQhQ/B9
         L0Hs1nCoHoa8QIsNiuvbNwPCWh/85jgHQG5sSONZFt6nqg8iucQfRqzDHB/+mgGwfkZ/
         wUaNSTsbxgOb5aSUELRPW9pZbfR82CaCWumsy8PfFTNdGvaPdm1dXdRihdqUBKdPg3tt
         86nA==
X-Gm-Message-State: APjAAAXlVs9O5RBaJfG8HUDIidFreA/lkqmu1BJnhlOB+t87/GPqkdsB
        uemZxclac3bWUiWZvfnZTOxn8A==
X-Google-Smtp-Source: APXvYqw6IN6SpZF1hcpAEekWajXfWM2TJNeoGT4lM7BuFEm6giP0KF+P+EuMN/yDfcr2UeiTpHcuOw==
X-Received: by 2002:a17:90a:8986:: with SMTP id v6mr32404955pjn.90.1579056795960;
        Tue, 14 Jan 2020 18:53:15 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id w131sm19748652pfc.16.2020.01.14.18.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2020 18:53:15 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Kiran Gunda <kgunda@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH] arm64: dts: qcom: pm6150: Add label to pwrkey node
Date:   Tue, 14 Jan 2020 18:53:14 -0800
Message-Id: <20200115025314.3054-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.25.0.rc1.283.g88dfdc4193-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some platforms don't want to use the pmic power key as the power key
event. Add a label so platforms can easily reference and mark this node
as status = "disabled".

Cc: Kiran Gunda <kgunda@codeaurora.org>
Cc: Rajendra Nayak <rnayak@codeaurora.org>
Cc: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 arch/arm64/boot/dts/qcom/pm6150.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/pm6150.dtsi b/arch/arm64/boot/dts/qcom/pm6150.dtsi
index 23534639f455..57af0b4a384d 100644
--- a/arch/arm64/boot/dts/qcom/pm6150.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm6150.dtsi
@@ -20,7 +20,7 @@ pm6150_pon: pon@800 {
 			mode-bootloader = <0x2>;
 			mode-recovery = <0x1>;
 
-			pwrkey {
+			pm6150_pwrkey: pwrkey {
 				compatible = "qcom,pm8941-pwrkey";
 				interrupts = <0x0 0x8 0 IRQ_TYPE_EDGE_BOTH>;
 				debounce = <15625>;
-- 
Sent by a computer, using git, on the internet

