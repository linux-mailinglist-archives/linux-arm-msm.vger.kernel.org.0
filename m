Return-Path: <linux-arm-msm+bounces-50671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FA6A57771
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 02:43:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C889189AD28
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 01:43:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 669021527B4;
	Sat,  8 Mar 2025 01:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="otmK/skv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348D71F95C;
	Sat,  8 Mar 2025 01:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741398173; cv=none; b=nep2ACE9DJXHbdwAks2MRc9EbFLWsgEV58XfIDysMdRVNryvY8D6/o+B16HlLHL5HDNB05eLhum9s0PsksV9hIOjvGy34+zPx80LkB6Xw/a2rSf/benZzOJ9z498Nf/zxpVhOZ/fSFNfZiI2PAHipqwN5RAxYGT0wtsTqeJqybQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741398173; c=relaxed/simple;
	bh=6dXzCoSGh5WzYwUYwwUtLNNchEHyZWMT9t7hB0b5vr4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DlG26y/7M6J0yXzrO3+YBQy/p7ZsOTdvCZTKKRihvdXEpz+jVlvCrR1I4X4oZbWZSsqXik34yo9mkzDzwkRN4w1+G9U2lg2ZtRdLxQwtTXXF1Z7ES3MWxK+8iK7sG39akB4Z/oSpDCy7IUgHyJeVAS11kDEhdqBt8tQj5gp66io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=otmK/skv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2F5FC4CEE3;
	Sat,  8 Mar 2025 01:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741398173;
	bh=6dXzCoSGh5WzYwUYwwUtLNNchEHyZWMT9t7hB0b5vr4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=otmK/skvYd4It6dwexM+PP6cMHUGYuiOG/ZvaaH6IgAcYpp0YZhLN9tBuT4VaycYJ
	 TBbaePxJGVqsAShMrXJTs95ghYOPjMXS84jFde6XZk85G92ei0JVJW7kUWrlyO9nQm
	 XLVj3fR8jaPaBYJMLxxJ54N2hulUaEeR5AjmjL25waGrjgXAvn8UqA0/NpiafNb+q0
	 4qTQP6fq7HR2T07l/1Ovcvi7pTcFgAP0/gMX70Yci7TDjiECiwZJlwgcL82T7Xwzy9
	 eVBZlkcY/s/MuZl+uM+DXb96uanAmyeaL2syKBkIDrV+gSZuqnYq+6pFhkcKupLUKs
	 W4i+aa8mQA72w==
From: Dmitry Baryshkov <lumag@kernel.org>
Date: Sat, 08 Mar 2025 03:42:22 +0200
Subject: [PATCH 04/10] dt-bindings: display/msm: qcom,sc7280-dpu: describe
 SAR2130P
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250308-sar2130p-display-v1-4-1d4c30f43822@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=867;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=BgsqxgB1qUMlTQRoXlZNO7IqKII3A0xVwcx4U85mJbQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBny6B/tzXGWNrHLgibC5D4RA6kqoIdExjjOUNDv
 Q3y+8gwEZOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8ugfwAKCRCLPIo+Aiko
 1TNPB/wK27ofImLoecwSAl0GQlgmtsAUmandEjkKhP7SPeQWC8hGc4aiL3iEGtFtos/zRKKNy+n
 GaHAiemJXrOIPewLN2kJTVi+cM4iTsKIEHevghT4II/c72BsznQJynQe43TwydBoXNkrIC0pIWk
 DmhUNHawOYVD/uqcinBYAhInxvebRyA0iqBtaj/oLPFFpljVnctz5kSFqaIQ1Q/eTlzsGcuC+vF
 f+rZEzw5r7T+UALosZtcQH6j4AzX+RAmjEhJwzgys2uO3m9lXn3ONYZBsCN5pEhw7DtCGeJLO10
 ZowXuHHuEiHvpspk/sBbgR+yKgxT66mq5dxBmtFv4etNCU2K
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Describe DPU controller present on Qualcomm SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
index 6902795b4e2c249c2b543c1c5350f739a30553f2..df9ec15ad6c3ca1f77bebaab19ffa3adb985733d 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
@@ -17,6 +17,7 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 properties:
   compatible:
     enum:
+      - qcom,sar2130p-dpu
       - qcom,sc7280-dpu
       - qcom,sc8280xp-dpu
       - qcom,sm8350-dpu

-- 
2.39.5


