Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF9D343DEBF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Oct 2021 12:20:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229809AbhJ1KWx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 06:22:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230164AbhJ1KWs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 06:22:48 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C89A6C061570;
        Thu, 28 Oct 2021 03:20:10 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 192so3704030wme.3;
        Thu, 28 Oct 2021 03:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8Sj7C6Dnac0nTp32ajTH4SxrpJdFzboWeLZFqmfs2ZM=;
        b=Z2m7/jiOnzgxDvNkpsvHBm8STGe1+Fr/8TFX0lhFYaWiF5HuVnogCG9T+lBJiWBelE
         /y0YfD1AShscmqjJWszTfCVhVJ3b+dLWuTcc8kcQD/4gLSCPtDf7YFqHq6o0ZbGyBXdU
         Cz+9/iQIavB8wsnai4J6OBFMZ/rojh4xmBJR0wBVbQDTK7i7TtwaYQgTqahEstUOdlL1
         v8yavzts1DfqtkEtWv2Wkk6sm1Yzcs1ZagMXdvcCDJeck8W36qayOlVxz4FMXbS+SvHq
         B+9nme4VwQsJ3ev6NqBwQqBmliaae7QXknACaC43Cmiwzwe1z6sfkw1S8+njxD/6oUgv
         +CMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8Sj7C6Dnac0nTp32ajTH4SxrpJdFzboWeLZFqmfs2ZM=;
        b=DSztsuebcRSQcDRzKXQgLCr4G5XZd1eva6nomMmCGBH0ibUkfUrnYS0DGX2PYJGMSh
         H/3T6Qg/54zjCcSEHmGtD3D4K/bJ6g0nP5C+pe58Ycnd+tiM27U7r+eNBfryo72a39Cv
         xhPeMfW5SCbxIL+Um0rXUumagsQpRxrlciiLADXskNm1Xb4NI2DOQoiYlug04oOWRSAM
         PBXDgzW9waLKeTGWa+Lp0B0Bh22XqThCi9AD/4b08+3oTG63nL+hjNXuRyvJyA9bEumr
         eDyATIC8UjlfxTkMtFuxsqRaaCxfQcCJLpgWulBIGNJblSeq3nC24v9mzQiqJm7OKcBa
         TyIw==
X-Gm-Message-State: AOAM533ihxOtv5UJUpXQesOluvFZHo5iAUn6H42vow0wigfeTcS0sn1H
        jsmpkYtOt5TiA83PGam09NHJWshWPHOfjg==
X-Google-Smtp-Source: ABdhPJyl/6JqwWjtlxpQx05gNNHbh6+mbNeGs7GdkWvmxl8uNpj8oLXVPl3gjw7p+RjY9wySiHAOUQ==
X-Received: by 2002:a7b:c1ca:: with SMTP id a10mr11666462wmj.91.1635416409449;
        Thu, 28 Oct 2021 03:20:09 -0700 (PDT)
Received: from localhost.localdomain (aftr-37-201-214-170.unity-media.net. [37.201.214.170])
        by smtp.gmail.com with ESMTPSA id s11sm2555181wrt.60.2021.10.28.03.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 03:20:08 -0700 (PDT)
From:   Kate Doeen <jld3103yt@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Caleb Connolly <caleb@connolly.tech>,
        Kate Doeen <jld3103yt@gmail.com>
Subject: [PATCH] arm64: dts: qcom: sdm845-oneplus-common: set venus firmware path
Date:   Thu, 28 Oct 2021 12:19:57 +0200
Message-Id: <20211028101957.106034-1-jld3103yt@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable loading the Qualcomm Venus video accelerator firmware on OnePlus sdm845 devices.

Signed-off-by: Kate Doeen <jld3103yt@gmail.com>

---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index d4355522374a..b405271bbf37 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -641,6 +641,10 @@ mux {
 	};
 };
 
+&venus {
+	firmware-name = "qcom/sdm845/oneplus6/venus.mbn";
+};
+
 &wifi {
 	status = "okay";
 	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
-- 
2.33.1

