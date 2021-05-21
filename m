Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BC7438C6E4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 May 2021 14:50:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230378AbhEUMvk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 May 2021 08:51:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:33630 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230081AbhEUMvb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 May 2021 08:51:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 14B946128A;
        Fri, 21 May 2021 12:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621601408;
        bh=evW5pHUN/T4rGcgEYxzNl0VVIeE5qNWtjDjSxJvpPkQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=swpkH1OlMp8m3dC3Op2knzSP+7dNpwV+GLpnTqKTP6Rv9cOr4ZuDrQg1RerHShygz
         GWLDF2inM+t6mnDbG2UCW7r6z/TwN1q7YgMWTOaDoVRGulMbiBXG8zG4/5b91XLUTP
         rDwf1hQ18aLr1h+gRkhRnfQT8Lqeyrv1Hyxyq9Mt1y1Imwn3MLM8ZTGY/hqHpwX4uB
         TeSq+8VtHdoDVNt4FL7T80PylE2tHdIJvqLYj8bApZz92UPSMmy3eukhXnaatygXaK
         Jd9UQgB4pJ7MrivQRrAButxeohwGiHLp1cdP/JL73buJlKi0PQaKtPGYBKrDtL3LMS
         uVKjiCutUDDQg==
From:   Vinod Koul <vkoul@kernel.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org
Subject: [RFC PATCH 02/13] dt-bindings: msm/dsi: Document Display Stream Compression (DSC) parameters
Date:   Fri, 21 May 2021 18:19:31 +0530
Message-Id: <20210521124946.3617862-3-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210521124946.3617862-1-vkoul@kernel.org>
References: <20210521124946.3617862-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

DSC enables streams to be compressed before we send to panel. This
requires DSC enabled encoder and a panel to be present. So we add this
information in board DTS and find if DSC can be enabled and the
parameters required to configure DSC are added to binding document along
with example

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 .../devicetree/bindings/display/msm/dsi.txt       | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi.txt b/Documentation/devicetree/bindings/display/msm/dsi.txt
index b9a64d3ff184..83d2fb92267e 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi.txt
+++ b/Documentation/devicetree/bindings/display/msm/dsi.txt
@@ -48,6 +48,13 @@ Optional properties:
 - pinctrl-n: the "sleep" pinctrl state
 - ports: contains DSI controller input and output ports as children, each
   containing one endpoint subnode.
+- qcom,mdss-dsc-enabled: Display Stream Compression (DSC) is enabled
+- qcom,mdss-slice-height: DSC slice height in pixels
+- qcom,mdss-slice-width: DSC slice width in pixels
+- qcom,mdss-slice-per-pkt: DSC slices per packet
+- qcom,mdss-bit-per-component: DSC bits per component
+- qcom,mdss-bit-per-pixel: DSC bits per pixel
+- qcom,mdss-block-prediction-enable: Block prediction mode of DSC enabled
 
   DSI Endpoint properties:
   - remote-endpoint: For port@0, set to phandle of the connected panel/bridge's
@@ -188,6 +195,14 @@ Example:
 		qcom,master-dsi;
 		qcom,sync-dual-dsi;
 
+		qcom,mdss-dsc-enabled;
+		qcom,mdss-slice-height = <16>;
+		qcom,mdss-slice-width = <540>;
+		qcom,mdss-slice-per-pkt = <1>;
+		qcom,mdss-bit-per-component = <8>;
+		qcom,mdss-bit-per-pixel = <8>;
+		qcom,mdss-block-prediction-enable;
+
 		qcom,mdss-mdp-transfer-time-us = <12000>;
 
 		pinctrl-names = "default", "sleep";
-- 
2.26.3

