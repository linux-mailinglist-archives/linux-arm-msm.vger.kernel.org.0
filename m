Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0C97177D11
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2020 18:14:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730761AbgCCRM1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Mar 2020 12:12:27 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33431 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730729AbgCCRMP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Mar 2020 12:12:15 -0500
Received: by mail-wr1-f65.google.com with SMTP id x7so5389174wrr.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2020 09:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4eKDP7GIf+zMnjkDG/qEX7ZCeXhKuF5qg6jgn8C2ADk=;
        b=UoMsmD2K5l9WOiVbpbiNEApd8TeFTaUt+r74URs727/5CQahPph0IlN5iHxzmlYleA
         K8DGF7JbzczsqyTfShgKNkPFWUI1QK8DEtAcRMC8Ifz6sIooSWOds9GbDcL1A32giGXm
         Ooc043vOOXj6RmGQdVbkYsu2b0ZpFISbBAGZC7bPCKkkxQyjJceuOpt/RrV55/uuotLM
         mDKL3QMf1piLEakwgsGa/zq6MqplOdSbyFVYMiGrNdTWDr4fV2OmHUoUKbQaOSXHKThj
         jXKmRl5FXw8mUF4XJ3Xn5SDcN318iXX/4Dhm46gdtiV8N3GwVoq5ATTgFKLunQ5HMSkk
         zPKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4eKDP7GIf+zMnjkDG/qEX7ZCeXhKuF5qg6jgn8C2ADk=;
        b=tSzkdF881C56iM+lb49Kg9L6dM4pHxojWqKBi9kLDvlnC4oO69RsbGwICz+vatDXUA
         Nan6ZknMmTg4KFw6ovq1nSzod6fPYMJH9mI/fLKzqlgBVA1ARRrpDKbUsynns4SEp8Vn
         aiOjYu5FIkgtRBsY3osD3nUy3agPcasTmBbJlK7lwZ6Or4cBwLiwNlZNigPCzU7i97qV
         JAwtS7aGQhPoa/GIKMJgwR18OtpTkdn35YeCI1dYNM2AYxgIgSCMM0Ux8tKrndnPo6Z9
         fkM3anLVH+w0KfecxFKXFcTGrLik73MdXRS5y27HyPafcBD5++m2u8md5Oufvmf9d79U
         KOyg==
X-Gm-Message-State: ANhLgQ1xJWDigiKIzUqfxns8W1jMOCDBiy9Upf2x7cuFpi12xwtADMqB
        +Pu0HPE0B7cgjEyc6ziCro7/Ck9gFsA=
X-Google-Smtp-Source: ADFU+vtowteZz9CpXpsbjOfaHjhOJCySXoxhaR2Fyaeq3bRDnMOuZZsolsAaC2cGNhFWGhyXYkGoKg==
X-Received: by 2002:adf:f686:: with SMTP id v6mr6156728wrp.176.1583255533633;
        Tue, 03 Mar 2020 09:12:13 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id z13sm5425319wrw.88.2020.03.03.09.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 09:12:12 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH v7 17/18] arm64: dts: qcom: qcs404-evb: Raise vreg_l12_3p3 minimum voltage
Date:   Tue,  3 Mar 2020 17:11:58 +0000
Message-Id: <20200303171159.246992-18-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200303171159.246992-1-bryan.odonoghue@linaro.org>
References: <20200303171159.246992-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Rather than set the minimum microvolt for this regulator in the USB SS PHY
driver, set it in the DTS.

Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <agross@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index 4b529a6077d2..44c7dda1e1fc 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -200,7 +200,7 @@ vreg_l11_sdc2: l11 {
 		};
 
 		vreg_l12_3p3: l12 {
-			regulator-min-microvolt = <2968000>;
+			regulator-min-microvolt = <3050000>;
 			regulator-max-microvolt = <3300000>;
 		};
 
-- 
2.25.1

