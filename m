Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D4633549E8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 03:09:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243044AbhDFBKC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Apr 2021 21:10:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232930AbhDFBKB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Apr 2021 21:10:01 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE9C2C06174A;
        Mon,  5 Apr 2021 18:09:52 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id o10so20061161lfb.9;
        Mon, 05 Apr 2021 18:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xlvbZceZiSW5J9rkdV5PiWAGQnMk+aEwtPdEhXkrh1M=;
        b=S5E4TYM8CBVO/vEvpM6kXdTmdVXq+Z194+VmXzkoT48fzDhyuJ+HpAw9o3S9lj0byo
         m48Vev6zZOPpTh42TCucmpaJwvNxo3QDwym51sGBx5S01l2E0bPQfUXH8NO65oenGQb2
         5s55TZhNN6328gKEeM3fOk6q9PzTGIaFNzfHGDr8q7AieDPP1wUiRVMKEVwzZ0Ctfg2v
         o2A7DB/0vmNtCpLhEWHbSGUBP9Brak0pjWMtrJLam9qGmCNwRnPKbOBB24y2G+NCJR9Y
         Hv/7C7BqjmV1kJxA11c8jAscCx6HsJVwAgtNhSUA256Mtq23dHQBr74Ms4no+hSEfxte
         P1rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xlvbZceZiSW5J9rkdV5PiWAGQnMk+aEwtPdEhXkrh1M=;
        b=boUe1ZvPzf1+WALNkKAjXPFWVQ1TcBz80/rKmN5za7GX2qbuKZtM47XHctKAAJaE3o
         5pxoT5e4Ou3yRAOXhsJ426p6pd5JYR3Uquf0NvASpS/GXttl6TL9gYp58TtNTmZBK4uc
         qFn9f7NlKJIYudzOZ0fhLxLu7L4aUoSVHIyqZ1zAU+Q0uA2AV0IuLm7Pq6ZAkGmmkGff
         bWkgnw1Pdxb2YEWyZk3jFopgip1nOK5UFQIQYl/OWQ4IyiWijnbrTAPtJ0nEgIB1q/8N
         47RXMaJAFlnt5t3mIFChvZ24LT1k/11kDlgIaL1rOLJ9tYuL3I7nrTe1s+yq/hXvlXCp
         8Arw==
X-Gm-Message-State: AOAM533MTqqIJQ+piYGI2XIvTSK++RlS6D4ICU5DL/Nk96DPkA90//M3
        iB2XOJGsxbT4yOErrVw/vzwlBEF6pbY=
X-Google-Smtp-Source: ABdhPJzpxfUqMa63aisHXIY3Ily1S3i8SFR+jRwVDTWotsXtuT8NLLqzkJ0dzTecZSOjDW0dMVHDEw==
X-Received: by 2002:ac2:485c:: with SMTP id 28mr18868906lfy.68.1617671391504;
        Mon, 05 Apr 2021 18:09:51 -0700 (PDT)
Received: from Ryzen-Workstation.localdomain (df76-hyyyyyyyyyyyyyct-3.rev.dnainternet.fi. [2001:14ba:26f5:f300::5])
        by smtp.googlemail.com with ESMTPSA id p24sm1948063lfj.76.2021.04.05.18.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 18:09:51 -0700 (PDT)
From:   Jami Kettunen <jamipkettunen@gmail.com>
To:     phone-devel@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        keescook@chromium.org, anton@enomsg.org, ccross@android.com,
        tony.luck@intel.com, ~postmarketos/upstreaming@lists.sr.ht,
        konrad.dybcio@somainline.org, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org,
        Jami Kettunen <jamipkettunen@gmail.com>
Subject: [PATCH 2/2] arm64: dts: qcom: msm8998: Disable MSS remoteproc by default
Date:   Tue,  6 Apr 2021 04:07:08 +0300
Message-Id: <20210406010708.2376807-3-jamipkettunen@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210406010708.2376807-1-jamipkettunen@gmail.com>
References: <20210406010708.2376807-1-jamipkettunen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This was already the case for ADSP and SLPI remoteprocs & doesn't affect
existing boards where it has been re-enabled.

Signed-off-by: Jami Kettunen <jamipkettunen@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi | 4 ++++
 arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi       | 4 ++++
 arch/arm64/boot/dts/qcom/msm8998.dtsi           | 2 ++
 3 files changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi b/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi
index b500f24d47bc..125d7923d713 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi
@@ -281,6 +281,10 @@ vreg_lvs2a_1p8: lvs2 {
 	};
 };
 
+&remoteproc_mss {
+	status = "okay";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <0 4>, <81 4>;
 
diff --git a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
index c1ef0c71d5f5..a1d15eab8553 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
@@ -328,6 +328,10 @@ &remoteproc_adsp {
 	status = "okay";
 };
 
+&remoteproc_mss {
+	status = "okay";
+};
+
 &remoteproc_slpi {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 1f2e93aa6553..e9d3ce29937c 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -1398,6 +1398,8 @@ remoteproc_mss: remoteproc@4080000 {
 					<&rpmpd MSM8998_VDDMX>;
 			power-domain-names = "cx", "mx";
 
+			status = "disabled";
+
 			mba {
 				memory-region = <&mba_mem>;
 			};
-- 
2.31.1

