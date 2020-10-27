Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADC3429A26B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Oct 2020 02:57:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504203AbgJ0By0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Oct 2020 21:54:26 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:35780 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2504201AbgJ0ByZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Oct 2020 21:54:25 -0400
Received: by mail-lj1-f194.google.com with SMTP id x16so13013686ljh.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2020 18:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LLnZq0fw5BkskFKbMKLE/UEUqWEDM6IwXjFAFUfkNXc=;
        b=s+4T7WNwafEKsaZTJAqZ3ZXZjvsMNvQSvh3sliD1ErIwBmKLUEQuoWTZmohDXucNSP
         7HL54TOrnk4/opKU4jtoZpllD2hpdbugyABT+hEw4Nnal6iEMrMoBKv4QoVRoseDCOUr
         aqH8g1k/l+A1krfPVNTxBd4VAPrVwWx9F53J/wNTr1btUUY+MV7vXn5DC+2vm7qmh3JT
         gzAsm31yPr1T1PHnL/W7Zrzh568dL2CRzKUxr/4BpqILcx51h7AzGKT3XvuGsn+ophlv
         VqY9tK6D6kKj4mTe36yRt++7rxLcKt1mBLMqvSvjI21Srxa9xMmt8MqSDQVmZqUm+pwK
         VCjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LLnZq0fw5BkskFKbMKLE/UEUqWEDM6IwXjFAFUfkNXc=;
        b=abiGcOb5oW8Fm6WbnLCxgjp46YuD5ys8tgOVEytIAHxro+X4/GCVUAitWpk3ZubLua
         CRZ7J/WL2ppvHdUVonWjlTkx55lxKKUvlfSFzM0e7WP7Kl7nCJOT31KTYmWlEU/pULLh
         bCl2An26YO3vQgc+0WJP5gNakyYTnwqS0D/YJjeEO1Hht4SfP//ics4rkAu3W+gnPGaP
         C0dlysl2YGJiDSBLHjipXb8Z8ikeI3ztNOH6WQys53f0m5+qNXVmE/J3MMaYiKAr5Y1N
         8FcJPaCnWRTJZGkKqMsUtNErM2gE63o7dL5/mRmCa4AHsUuGRZkAJYWPNroeMxRoKJt4
         mTuw==
X-Gm-Message-State: AOAM5332ObUF1FpbFHBbvR+nng/+KvFwjyj/duspUCueLld2+Gb+UHzl
        becrEDtfaW0HvMlqSvwc5uCEKiqiGj9wAFNw
X-Google-Smtp-Source: ABdhPJxUVYVcN5kBsztFguH3Pmpi0hgJSeuM94hRMSkFKovpAwN2bz0uYE7Bwzghy6qIKMzyMyvxpQ==
X-Received: by 2002:a2e:81cf:: with SMTP id s15mr18256ljg.147.1603763663627;
        Mon, 26 Oct 2020 18:54:23 -0700 (PDT)
Received: from eriador.lan ([188.162.64.195])
        by smtp.gmail.com with ESMTPSA id p145sm1219721lfa.256.2020.10.26.18.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 18:54:23 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sm8250: remove wakeup-parent for TLMM node
Date:   Tue, 27 Oct 2020 04:54:20 +0300
Message-Id: <20201027015420.908945-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On SM8250 TLMM doesn't use PDC interrupt controller for wakeup events.
Instead it handles them on their own (not implemented yet). In addition
setting wakeup-parent property to &pdc will result in parent hwirq being
set to ~0UL, which interact badly with the irqdomains trimming code. So
remove the wakeup-parent property.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Fixes: 16951b490b20 ("arm64: dts: qcom: sm8250: Add TLMM pinctrl node")
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index ccbdb47d6119..77ea20421752 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2418,7 +2418,6 @@ tlmm: pinctrl@f100000 {
 			interrupt-controller;
 			#interrupt-cells = <2>;
 			gpio-ranges = <&tlmm 0 0 180>;
-			wakeup-parent = <&pdc>;
 
 			pri_mi2s_sck_active: pri-mi2s-sck-active {
 				mux {
-- 
2.28.0

