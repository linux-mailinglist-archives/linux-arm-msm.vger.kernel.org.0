Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73DBB43DEC1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Oct 2021 12:20:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230124AbhJ1KWy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 06:22:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229974AbhJ1KWx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 06:22:53 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AFB0C061767;
        Thu, 28 Oct 2021 03:20:26 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id b71so4504632wmd.0;
        Thu, 28 Oct 2021 03:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9BgagDVdl/RT1aur7UOCrzXl9Fwq38nLh5I1KlVPcTA=;
        b=FYlBPKRLawFfgEcbPaU5wC9tGugmmKlkYsybPeZDTF5zEeb3Vd7dqMRBibktjdL4CW
         zwiLCZnoMWt6A/kJp9TAKyli74xlUtobMuh2abKgT6ujgIiCZp5z0XykLGJMvXIc6YNA
         6xfE2zuQqXrZvHXoHknBRuyLb+qp8HpGnVVMe/mkxMacS79dSFn/SgtIt1cgpGkx+zO+
         HOXg52q39e6VI2tU4WbHgtOZxIPIvwAdW13aLrjtRv59LobIKzwflw9xRU4dNDXqSjE4
         GJu0BEcfcoaKFV+c/IQfiYrs4Iz4UGGb7aLZ87+HTlhiljEqtdgUbCKt25Ts5UfhvSa7
         i/Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9BgagDVdl/RT1aur7UOCrzXl9Fwq38nLh5I1KlVPcTA=;
        b=EfQ9cCw5M6kQR6iI7QdwLK8hJnu+skzeC+9FpTQ0HcU4QsKTzyxaZTLeuY/4Jp8EP/
         oDKHEgSSk0K2Gcc2Nq5Kzcc4KN5wzzhedTqdAITCL/ZsS0b7GKTKM05rOKFwkznYRXf2
         5/xe23smwscpJxdI/d1KzHtzKWsFQ/PJOUBEqbxKNrAc2b6BgLFWDjWOPEeR8V91kB1t
         xn9gpBqH1VzO7Frz+gabhSfDREKfjITYpNwKCqqwPfBtg/RdDGSnc/F4UZvyTygtuhup
         4l8os6QYWcYuP47keeYWVTmmGPHFWIGKkDzTcC+mgD57Buwu5pnRra1sOLOEJJ0/yYMW
         M62g==
X-Gm-Message-State: AOAM533mmD7ZWc43ymq+4/tA+ppEVlZOBCIx2F24tEdSOGgMqdd6yZXw
        YIVPIcI3fgvTv+kU0dxw/HQ=
X-Google-Smtp-Source: ABdhPJxXLLDTBD3/CBmjX6uTGo75xNkV/DSf6I/TqR0LIANuSnGEqycrU/0SXtbmB1YTaoaTtOwa2A==
X-Received: by 2002:a05:600c:2f97:: with SMTP id t23mr11815480wmn.59.1635416424686;
        Thu, 28 Oct 2021 03:20:24 -0700 (PDT)
Received: from localhost.localdomain (aftr-37-201-214-170.unity-media.net. [37.201.214.170])
        by smtp.gmail.com with ESMTPSA id n7sm923064wro.68.2021.10.28.03.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 03:20:24 -0700 (PDT)
From:   Kate Doeen <jld3103yt@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Caleb Connolly <caleb@connolly.tech>,
        Kate Doeen <jld3103yt@gmail.com>
Subject: [PATCH] arm64: dts: qcom: sdm845-xiaomi-beryllium: set venus firmware path
Date:   Thu, 28 Oct 2021 12:20:16 +0200
Message-Id: <20211028102016.106063-1-jld3103yt@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable loading the Qualcomm Venus video accelerator firmware on Xiaomi Pocophone F1.

Signed-off-by: Kate Doeen <jld3103yt@gmail.com>
 
---
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
index c60c8c640e17..172c496e9933 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
@@ -513,6 +513,10 @@ &usb_1_qmpphy {
 	vdda-pll-supply = <&vreg_l1a_0p875>;
 };
 
+&venus {
+       firmware-name = "qcom/sdm845/beryllium/venus.mbn";
+};
+
 &wcd9340{
 	pinctrl-0 = <&wcd_intr_default>;
 	pinctrl-names = "default";
-- 
2.33.1

