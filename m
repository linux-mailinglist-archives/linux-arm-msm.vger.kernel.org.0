Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 569A567CB36
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jan 2023 13:47:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236314AbjAZMrd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Jan 2023 07:47:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235812AbjAZMrT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Jan 2023 07:47:19 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37F226DB1F
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 04:47:09 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id n7so1655623wrx.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 04:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJqq3liCIK6Sxes/Unc7rdXMkD7/jgVltCe0AtpGlFg=;
        b=xxWJsSIUitQpuor3AltYkApyMLSiy3P5Kt+csqdhf27TcEp1s3dtKjt8AQBNZ+GtsQ
         0IwC+92CpQDmSW8Sn54rFzJr64cjsTtrIMxDkYLM+piY9/9ag/SjsOyyXeWCuPeYUm++
         fdCdiv0eJEOOUqn28ZqDVN/pnMfFaEb0JKW7vRvTjkDo4+f5YIRGaiCNCVs8QsEVwwjR
         Q34ip0Ow0zkrAerEOJjdcZ3c+A7jltyBrPYKFGGzJNctvoiltymJMh/yWc6x1WRxGx4a
         PspfmqjYmh3vANaoM+V+0Ns0jPOd/9sPxVUgC7sEzlJ7WiSF7JMJkNYByD6G9noeq5mY
         gG+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eJqq3liCIK6Sxes/Unc7rdXMkD7/jgVltCe0AtpGlFg=;
        b=hcf3K6NGksjoG9+6S7AT5EdqILxfn/Tm+elniWcZoC6rAY2HGhBzyhp6iO0YpIS6Ef
         IOJNA2kAJTYhGyTPhJOv05EAdv4Jypf8bNY62ksnKuPpOxJeqY69t4GEdqi0rrWPu2iE
         nTKcWw8W1QK2czRn5oz7vK+ag8iCXUtG/aOUu9AyDV1J4FuV9Q/jc9jPITTg+tgKq+o6
         CexIiFwwnUUxRRU+zlgoQjdrzRNJMM64BCLeMZoFcylbqHChQxTlWsCBDuySo7nFcp9e
         J795fp7sVUOENeXbkxkzEPm+GFsaZV4NNNWXdRLng8IXN1tlXkV0Hyvq9StPOm+gyU5m
         CjSQ==
X-Gm-Message-State: AFqh2kqlv6PBAJb8TQXMW0Jqs5cW/qiSdyK96GoyjCe6NmzA2f66xcZz
        L+iUacCfza12rI6alA/23EwqlA==
X-Google-Smtp-Source: AMrXdXs+okER9160RtErgLQWgo7dU46MJxhOr5qrUowXJiapXAFFIpZfoG2SKsA839a/e35KogTSEQ==
X-Received: by 2002:a5d:660a:0:b0:2be:5162:c8da with SMTP id n10-20020a5d660a000000b002be5162c8damr23369894wru.16.1674737227786;
        Thu, 26 Jan 2023 04:47:07 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id v11-20020adff68b000000b002bfb8f829eesm1198681wrp.71.2023.01.26.04.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 04:47:07 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-phy@lists.infradead.org
Subject: [PATCH v2 8/8] arm64: dts: qcom: sm8550-mtp: Add USB PHYs and HC nodes
Date:   Thu, 26 Jan 2023 14:46:51 +0200
Message-Id: <20230126124651.1362533-9-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126124651.1362533-1-abel.vesa@linaro.org>
References: <20230126124651.1362533-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable USB HC and PHYs nodes on SM8550 MTP board.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---

NOTE: This patch has been already merged. It is here only to provide
context for the rest of the patchset. There is a change with respect to the
clocks, but that will be sent as a separate/individual fix patch.

 arch/arm64/boot/dts/qcom/sm8550-mtp.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
index 31e039f10a1b..cea1f12ce294 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
@@ -455,6 +455,28 @@ &ufs_mem_phy {
 	status = "okay";
 };
 
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3 {
+	dr_mode = "peripheral";
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&vreg_l1e_0p88>;
+	vdda12-supply = <&vreg_l3e_1p2>;
+
+	status = "okay";
+};
+
+&usb_dp_qmpphy {
+	vdda-phy-supply = <&vreg_l3e_1p2>;
+	vdda-pll-supply = <&vreg_l3f_0p91>;
+
+	status = "okay";
+};
+
 &xo_board {
 	clock-frequency = <76800000>;
 };
-- 
2.34.1

