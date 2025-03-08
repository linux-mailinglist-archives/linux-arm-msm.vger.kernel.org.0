Return-Path: <linux-arm-msm+bounces-50668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B138A57758
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 02:42:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 035F5173695
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 01:42:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8A45839F4;
	Sat,  8 Mar 2025 01:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pmsl+QWu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785FF1F95C;
	Sat,  8 Mar 2025 01:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741398156; cv=none; b=KE7H4aVSDYw5GPPRZkG2Wvwa7oSNoOtF8kAAsQfF1jTOJZmOeLovNMfq6ua0PN3aM+NvmPMT967qWN68lMaP7MX0yE/J7mYk0J1cXg/2d/08sgMrMKz39jndhbsz2ys9qrH5O+/X+j5R8e1QZ+WtZA/xplQq8AzGGHPSX7Bw/IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741398156; c=relaxed/simple;
	bh=5hWJtl0bbFBeYtO0tEd4eEDLjlvjsXOMVv/w4vcQqSs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ggtUVvyrqzT2E6D7+RK/HgTiiUcGprHw8Yub8l0CDBUtBmoEfk1xhx8ii5Lxse4h+ZvPLHb261dQSYyWzxBrsZ+GrzeeyXFYYjTt7E8BbUSHOxZpr8QL67LBLfU6ln2XYmB5yE4keCZAXS/CJrBkWUDVlqnFmSHGBng7BXGVrgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pmsl+QWu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A75FFC4CEED;
	Sat,  8 Mar 2025 01:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741398155;
	bh=5hWJtl0bbFBeYtO0tEd4eEDLjlvjsXOMVv/w4vcQqSs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pmsl+QWuYcfHXCLMH9ZyF/fZKnctpG011XtInd86CbOmleTeoGexB/I/uNZfBfVOi
	 uCedBF3+K36az7pZ2k8kxkqd6rZ+zT5iLvyvhH7Y6MObbhJasz6t+NAwXh/OkbM6rq
	 0+3l8E7zMZwx2H3MkW+xWPTU3Zb52TJVQSjm0Th7WIW6pkabRCHqIzfPNnbS8gAGsx
	 sj2e5r5tJGI1AIkeithbErEE8ugz+qZ9Cn1ea5S+yg+Mm51jSn3oojPVK0O7sMW+cj
	 3xiTRRSXxkxg4b2kxtv+bvNuGNGbB/ha9cF6Wd/3iRZ1OSX+vL4poJ5RKvMFXVOb5A
	 k6lyjszMaG16Q==
From: Dmitry Baryshkov <lumag@kernel.org>
Date: Sat, 08 Mar 2025 03:42:19 +0200
Subject: [PATCH 01/10] dt-bindings: display/msm: dp-controller: describe
 SAR2130P
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250308-sar2130p-display-v1-1-1d4c30f43822@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=883;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ACdmjYmshapneuIqWrn19zGGrSmaveZcBX5lcfEgHW8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBny6B+bI8+Wn/W3nwtSqCnoIReC3di5Id0PJg4f
 sU5YOYJqvqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8ugfgAKCRCLPIo+Aiko
 1TXwCAChR5vuCAEudmiTE+lhAXH7j22cWADUqnSu1Z0cDDyBH67GZhFTX/Zh61+onFk0hMYw4M3
 +tJYPJ1giq8/Y8E/8EGS+3UTQ8op8Qx6SH8PRHz69gn2GvKuGoHUBfu80Lczpf+Hp5nWJaKNo89
 8sO27klWACmew8HJtlT4HUvHXloT4nEYRDVnMUI59tJIAeupKYxcrG80d7cOT/s6Nc96gslew4R
 5jsSwR/HCSp2ZRHKFwZvBZYAa3h7e7yaizcuJZISWm99YaaPlmNqGEvIc1jB42ryovl3pc9Y98B
 wZ7O8AdcP5So2QW236a+ZwiV2oTeGmS0UZxMg3quRJjqYKlX
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Describe DisplayPort controller present on Qualcomm SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index e00b88332f2fed2fc33f6d72c5cc3d827cd7594e..246bbb509bea18bed32e3a442d0926a24498c960 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -31,6 +31,7 @@ properties:
           - qcom,sm8650-dp
       - items:
           - enum:
+              - qcom,sar2130p-dp
               - qcom,sm6350-dp
               - qcom,sm8150-dp
               - qcom,sm8250-dp

-- 
2.39.5


