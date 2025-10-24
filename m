Return-Path: <linux-arm-msm+bounces-78673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0602FC04619
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 07:21:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2E321A04D87
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 05:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DE6426E6F5;
	Fri, 24 Oct 2025 05:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V3/qyISm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540441DE4C4;
	Fri, 24 Oct 2025 05:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761283308; cv=none; b=e2+wvdaCBNLCo7YeXVb/7haJX11KjAoIKZzbpfriCJFnS4oOilvrIDT0mG521prSccmXYmQeiMR/k6wps8UkxFPvxdJJSM8Fybc8HRBqUHGmexgrFsV7tFPx++aoa+rtIU5IOtu4aNuxzI0TelYU7Rmhy4zWpGCIf8u+h0cRMQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761283308; c=relaxed/simple;
	bh=fgNbmC/qQVvGIa3HEQEwBDR0sTBCMsP9GKa0Yn+M21g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cX/hjwTW0vllJ4y8535RIG8WH9bnElrQdeOEbqWh2UXeb8z7BUruWUW4lw4pmU6M/TRDcpwhMO38tQPjfAUrH1mWlK4iqlntMyfhqnJMsVgtb/15gP/g4bj2hKeLX+HrFc+t8FJ1ZPPacRzVXgJMf82YVmR5jm04a1QKcLLTnhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V3/qyISm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id F1872C4CEFB;
	Fri, 24 Oct 2025 05:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761283308;
	bh=fgNbmC/qQVvGIa3HEQEwBDR0sTBCMsP9GKa0Yn+M21g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=V3/qyISmtzfFruiiKoBzrxdmCJJfXNz8aiomXDUOun42GUF98OpBXOJScOiKAWCMs
	 B/ObDV+P7pqKVyODn1HJe2Lin5Km5ikbSnZ19w5yhdjWWg5TYcUl1BKAFMoWa3+cCM
	 i5JzfTdfTdfb9HjLRM9x41tkN5hZyK40Esjk3fJoGAIG5Tp3eojbVGX+pdNnpcFL1w
	 jI+Frn1zGCtzMkJBh+LWJICg+uR1uJvDai3xJFvq4vV1XEme01uSOlGkOeYAs8bVWJ
	 jFY+wSKGq0HhqDwcSK9yHc5CiJl2iuGP20Z+4Xdub/ag660NESK8my8NDpNipRpiHJ
	 7hDdvXVXVmvTw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4E6CCCF9E6;
	Fri, 24 Oct 2025 05:21:47 +0000 (UTC)
From: Xiangxu Yin via B4 Relay <devnull+xiangxu.yin.oss.qualcomm.com@kernel.org>
Date: Fri, 24 Oct 2025 13:21:02 +0800
Subject: [PATCH v6 2/4] dt-bindings: display: msm: sm6150-mdss: Fix example
 indentation and OPP values
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-add-displayport-support-to-qcs615-devicetree-v6-2-c4316975dd0e@oss.qualcomm.com>
References: <20251024-add-displayport-support-to-qcs615-devicetree-v6-0-c4316975dd0e@oss.qualcomm.com>
In-Reply-To: <20251024-add-displayport-support-to-qcs615-devicetree-v6-0-c4316975dd0e@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, fange.zhang@oss.qualcomm.com, 
 yongxing.mou@oss.qualcomm.com, li.liu@oss.qualcomm.com, 
 Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761283306; l=2505;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=y4mnUq7LzHW10KKLH+nf6gjJ/MAmcz9UJ+dZcgRQN14=;
 b=V8T8jDE+c94oJdOpBld3BxRonpp4Qd0Aetpd/l6CzM6eWyAtECrf+BD7QYbBlamxhUxhpgx5E
 5n8Yb8K0TjPD4KRXfcbMH+WJd6O7HoGKhFbCywGZXDu7n/96rgNNWi1
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Endpoint-Received: by B4 Relay for xiangxu.yin@oss.qualcomm.com/20241125
 with auth_id=542
X-Original-From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Reply-To: xiangxu.yin@oss.qualcomm.com

From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>

- Adjusted indentation and added missing blank lines in the example.
- Corrected OPP clock values to match actual DTS configuration.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 .../bindings/display/msm/qcom,sm6150-mdss.yaml     | 32 ++++++++++++----------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
index ba0dea2edea98cee0826cf38b3f33361666e004a..80183df71cd9288f652dc42afeae101e8edcbe65 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
@@ -140,35 +140,37 @@ examples:
                 #size-cells = <0>;
 
                 port@0 {
-                  reg = <0>;
-                  dpu_intf0_out: endpoint {
-                  };
+                    reg = <0>;
+
+                    dpu_intf0_out: endpoint {
+                    };
                 };
 
                 port@1 {
-                  reg = <1>;
-                  dpu_intf1_out: endpoint {
-                      remote-endpoint = <&mdss_dsi0_in>;
-                  };
+                    reg = <1>;
+
+                    dpu_intf1_out: endpoint {
+                        remote-endpoint = <&mdss_dsi0_in>;
+                    };
                 };
             };
 
             mdp_opp_table: opp-table {
                 compatible = "operating-points-v2";
 
-                opp-19200000 {
-                  opp-hz = /bits/ 64 <19200000>;
-                  required-opps = <&rpmhpd_opp_low_svs>;
+                opp-192000000 {
+                    opp-hz = /bits/ 64 <192000000>;
+                    required-opps = <&rpmhpd_opp_low_svs>;
                 };
 
-                opp-25600000 {
-                  opp-hz = /bits/ 64 <25600000>;
-                  required-opps = <&rpmhpd_opp_svs>;
+                opp-256000000 {
+                    opp-hz = /bits/ 64 <256000000>;
+                    required-opps = <&rpmhpd_opp_svs>;
                 };
 
                 opp-307200000 {
-                  opp-hz = /bits/ 64 <307200000>;
-                  required-opps = <&rpmhpd_opp_nom>;
+                    opp-hz = /bits/ 64 <307200000>;
+                    required-opps = <&rpmhpd_opp_nom>;
                 };
             };
         };

-- 
2.34.1



