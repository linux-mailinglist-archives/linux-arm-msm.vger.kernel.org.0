Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 166DD12B16C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2019 06:33:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727126AbfL0FdN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Dec 2019 00:33:13 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:37350 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727047AbfL0Fc6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Dec 2019 00:32:58 -0500
Received: by mail-pl1-f196.google.com with SMTP id c23so11306568plz.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Dec 2019 21:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CACSvkGQXTdbudbrDCr3GVf27K5HI0XInZ9uwni3MXE=;
        b=ylrRXdCYJxPFdRcRwT43YU9htEJXb3RZq6jzea19OthZoBfBd4m9/gGbj4femDTUv9
         KuHvQ1v0+LGkzmPlgXvWU7wHnTpPl0y44bxs+RtiWMm9fZ1ZzxaCPIC+3ueLS5NsksXo
         lExY7XfeYQ1d4pHEXWPRCzBhgaFLJ0FYq/24nd33ipvfzcmOmxessAFWP8ki5PzrQi+z
         wvJ8T//luOhE3WHswVoW8CxcF3xrwCvJRWWm5/6FwIdkW4qzkPTNIZm/IOoAu0ll8/4F
         CNZprkIcdhzbDBj0VccAJpBfZc/0WSl0tCd5Jnp9ljcIrqoX7W0Ujo+pL3dADh5IOv0M
         gfew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CACSvkGQXTdbudbrDCr3GVf27K5HI0XInZ9uwni3MXE=;
        b=AHxU5rXwlhKlE2ppk/mdeFysUDevjNSkPr5TAqHFQHbtcmhdM2sOiQQH7wkfzJW9Gq
         UDu7oIEzHBhajsVZUCifLdF9NIInEuH/HRATKJDvArWrXXLg5f6A9+23tGanEdFfSa6S
         eq9zepR/khUvuTRdBm5AF4JQ+RLcmkKG5FNBCZa7Bx7WNG2pJZW+UE8BzL7mTs/TAR0a
         UoKnX7aVGsxiQRAaMQod3Gjozauq7mfcHyH+pIInfyktQU9rnE1HB0rzccIun9RcaA8y
         0zsrYEs4FsiGQHSJup4AfeO0/hyp/gwbzsEDW4nA43Mc4t+91+1ujAW5ZZDU4VTUYPjg
         CZ8A==
X-Gm-Message-State: APjAAAW2db7mMtwv32UpMD7Ip+85wHdKAM0A6nmods+j+GAFv04CwMg8
        1vQHDzNWKoz/3t5A8HLbuFlMeQ==
X-Google-Smtp-Source: APXvYqwDC4IXipZ7ZUqmtRfUXBo5/Wl/A9WtrtL7RUaMcfUiAMm6gLsuotO/cQTVmLuhTHt1j7S+SQ==
X-Received: by 2002:a17:90a:8912:: with SMTP id u18mr23852528pjn.64.1577424777538;
        Thu, 26 Dec 2019 21:32:57 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id c22sm16789196pfo.50.2019.12.26.21.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2019 21:32:56 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH v2 5/8] arm64: dts: qcom: sdm845: Add IMEM and PIL info region
Date:   Thu, 26 Dec 2019 21:32:12 -0800
Message-Id: <20191227053215.423811-6-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191227053215.423811-1-bjorn.andersson@linaro.org>
References: <20191227053215.423811-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a simple-mfd representing IMEM on SDM845 and define the PIL
relocation info region, so that post mortem tools will be able to locate
the loaded remoteprocs.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- None

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 407d26e92fcc..e1e13d5bfeb3 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -3020,6 +3020,16 @@ spmi_bus: spmi@c440000 {
 			cell-index = <0>;
 		};
 
+		imem@146bf000 {
+			compatible = "syscon", "simple-mfd";
+			reg = <0 0x146bf000 0 0x1000>;
+
+			pil-reloc {
+				compatible ="qcom,pil-reloc-info";
+				offset = <0x94c>;
+			};
+		};
+
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,sdm845-smmu-500", "arm,mmu-500";
 			reg = <0 0x15000000 0 0x80000>;
-- 
2.24.0

