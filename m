Return-Path: <linux-arm-msm+bounces-50670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0E6A57768
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 02:43:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A44C16C95B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 01:43:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B54C214C5AF;
	Sat,  8 Mar 2025 01:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NrzYtW2Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B56839F4;
	Sat,  8 Mar 2025 01:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741398167; cv=none; b=MDB2C9D0gIwCzu6g6kMrh4a22xf4i/599NEUwR58d/YNvx/mq2UQssw0TpGALD3SPcg5/IMqLETkaeiPTpNc5qUzndzS5xKgwjjztYFziWDr8Sy4lzpavQWK0PzkF1x3cVWEjkcoK5ZUFcnk8/rBukMyItWii9cnwSRFE3Ro+Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741398167; c=relaxed/simple;
	bh=8XBXBagKLZU02BZTCbyYSWDs7g51/WZF2wIxyboks8k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=chc3IwQC0nApA1/pOpr7HaHJj9E6XJLmKeGdaeUzyDfAsIPVSKPjF1DNIKNmbXHDgmtqHwK+YUCnEddOl+4GJcN6iaYyv3le11TjG/ZdOXGp6sAGH74jwtdxkY3Bs8Zs3pJxV9besyFTiD54liLb1OHSKbJjOPPqPC4BCb6oGJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NrzYtW2Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18C5AC4CEE8;
	Sat,  8 Mar 2025 01:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741398167;
	bh=8XBXBagKLZU02BZTCbyYSWDs7g51/WZF2wIxyboks8k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NrzYtW2YaPgG88BSMLcj2ypezAXBFLlKiUIm3j9n4nZNT2JSwUB0pFcJZALq3YRYk
	 FRYQIKB541q/XIuzayOlld5S/flpquYYAkBG4v0ZbT3XzmhfLQf/5kdXpfuiCOD0fH
	 CURmXFjU+GqKlikhsGVlD6nbKzu5XnAO6YOhSkpKJfWILVmosp1nMeKrA23snOCrdq
	 FjBAwtevWtQEzFXOshp2EX2EOukhOxpDIkHEWfxxWWYx6KJEsnini/mFJYKD18f5it
	 SstIOMvnwV58CY47TGUnIN8sW7Ig0SPIVQp2EbqstAxTiV0oU2p3eYeXLrkdTKKZRs
	 K/82V06EwmiYg==
From: Dmitry Baryshkov <lumag@kernel.org>
Date: Sat, 08 Mar 2025 03:42:21 +0200
Subject: [PATCH 03/10] dt-bindings: display/msm: dsi-phy-7nm: describe
 SAR2130P
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250308-sar2130p-display-v1-3-1d4c30f43822@linaro.org>
References: <20250308-sar2130p-display-v1-0-1d4c30f43822@linaro.org>
In-Reply-To: <20250308-sar2130p-display-v1-0-1d4c30f43822@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Bjorn Andersson <andersson@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=872;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ewz4mf+BJciAJgxQYRY8QHAfbvsLqEfizb9EYwvy3iU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBny6B/8QvGT0I58bWL8/CWKhSUTHk77FvMas4u8
 Pymrw7zPEiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8ugfwAKCRCLPIo+Aiko
 1b70B/41hJerK6Kc5l4OX8X+HjPetK3Vc9wlLVOOKKZ7VXzUWGn5JFUVW21/Cy+UkWwOmHoxrVm
 lvSzUWPl6BR4gxpcRUUUwIlvolsVbvtV5KknxRh7f6OTvNGst3POwq8idX2XCi6ZuYJx+GWWOTJ
 WdrUxGOUrSWJp8bEt4yVprFbcoAWiQWOWQml0WX7jt5z+w8j/31zlPDFUkhJNegEVvmPhi8+oHb
 +pCdC/JnvpyRDBbktIqHHQYh47ofyk0Jv8PtnA5lQKWTWovTjKtl9Bqu3wz4Heidxpzt5EtNmae
 3m5xjnoB9W58mv0kDjuf8N+sTLpYWWEOozhH+dkOjWHdZG64
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Describe MIPI DSI PHY present on Qualcomm SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 321470435e654f1d569fc54f6a810e3f70fb168c..f79be422b8892484216b407f7385789764c2de1b 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -17,6 +17,7 @@ properties:
     enum:
       - qcom,dsi-phy-7nm
       - qcom,dsi-phy-7nm-8150
+      - qcom,sar2130p-dsi-phy-5nm
       - qcom,sc7280-dsi-phy-7nm
       - qcom,sm6375-dsi-phy-7nm
       - qcom,sm8350-dsi-phy-5nm

-- 
2.39.5


