Return-Path: <linux-arm-msm+bounces-10412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B9584FF34
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 22:51:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9928028D15C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 21:51:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52B0821350;
	Fri,  9 Feb 2024 21:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hvd6H2rP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB09374CF
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Feb 2024 21:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707515442; cv=none; b=gTuFQ0px6fGIPV+KMXwyQcBBTMqN0PwOa2Yw1lXUgZqF0Tp3nWq+tzUs2HPQDaiW9SygQiOnihbR0duaqIUaFcVx20vz0CaAjPAlsMOj8IfMBNBZZgzwbDxCfTOLXzpeynMxrjppOOlB95FvhMe+lkbhcG17OqHuXHOUS59SSOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707515442; c=relaxed/simple;
	bh=qFaDb3+HsDF2bsx5hIZxH6UqlzjoVIko72glK0fFo+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tjEr/xiqnXotguvhWBBFX9SBRsB3G9xEr1rerc0SGDO1av4+AGilxOYvfDopymg4dPXC0N6CKu1hE4/OMlMmccDq4Kr/Qn/CGRbp0lRElasHrHNQlFrMTu6bWxh3U8JYrX5l6/KaSGFfECYcQBUh6BamUUPOZB5ggOp/0OQqQvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hvd6H2rP; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2d0e4ef33b2so1843101fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Feb 2024 13:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707515438; x=1708120238; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vO5RBGkhGj7QMxqzI1uI053ZUd8FqxdZU/olLT08QLw=;
        b=Hvd6H2rPXuCxlUPQJ5+7MVQBBZ0Wc78WwonlY9ggjTC3QVRixUIpoGT97O6fbj+u4w
         WvkWk0RYR/7+Gd4vqtLFlw/6hQ+DdOaigu4fS/4P2LTd34l/lgS0HB/bhHQd8lHxpIj+
         mUI4EhrLkH4vIkET+QLvgT6XY89vYAdeJgFp7NvVl+YA7rbaIdA3ZokdWqpkm9R8pn3A
         neIWakoxhnCkFYgQiMBdejpOXO5qJnCTu+76kGapCgxaFyWuVcL+y6qjF/nd/1IEAvjM
         LWSDsR/Q4wU54ocqKXGKdt+YiHJ7uaVt2sAvcAzlI6nsPat3YVdQ4zsgimiobYji2vh1
         qCRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707515438; x=1708120238;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vO5RBGkhGj7QMxqzI1uI053ZUd8FqxdZU/olLT08QLw=;
        b=q0ToYZlErreFiJn0gkIM9YZ/jlggHOwDE4ePh3M/Nqe7WAnUB/ncdzcerGBC/Ovg0s
         CEhwGJafjvyh2wAM5jkJQGgBHoo8UFQuluinNmLyA31RdiqTvC6K9+R50jH86kOamkS8
         PUGEtGmpUdRGW37WNXVMSROpEDpl5dtUxd7Xc1W3CkBAbJFzzbd3xy6H6xjQ1AwfBEUP
         ogeFyebnWPsFbLs1mI255WyldkVwS5Mhoeb8ZrVgiMKAMag0ALs/QWqzbHKAuCy0Bt+N
         LWOV+bbJTiHy23vPo2IRkrNtQ3YLHG/zs6OY3M9PU/dO5JQ3YIHq+nhiTToBwnlIGxVL
         yRBQ==
X-Gm-Message-State: AOJu0Yz4wc+dSveEmdwql2tAtHDaV46aF3A1416qgW+oTKM+zR0rPYCh
	vdr7PEH3F5Z/x/0KXBecPNi01QlRQMc2PZrcH21MhWUJaDfKKkxWqknpH4Z1FGA=
X-Google-Smtp-Source: AGHT+IFBeYk1rvYkPJ+8zNYGAOEyT0gO0UKqOedDYLNlm5pHL4MiOsfoR8TlpcowCyXvkG4RXe556g==
X-Received: by 2002:a2e:809a:0:b0:2d0:9b68:d063 with SMTP id i26-20020a2e809a000000b002d09b68d063mr184219ljg.31.1707515438313;
        Fri, 09 Feb 2024 13:50:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVR7thEYF863u9XaxkbAukH6ITFAlWWsDnKKjrKRH08hiUBdr9PcLjKBD6aEKZXgC1Ewe+m651NDU+wgC4LbYtvzyEpgKjyzCucJaJ2mTHilEvjHC9OIKR7kEoSeHVdRKQATjNVlrwSCpFvSmF+uQ9yDqrQzn09+v3A1hSMGqFaktHdlLGLV8pRkcPcljI+hrkKbhNgFkx+fO1C0mWbjSybxQb2US7UkESsdyEsRza1ZkSLq/3rGda8rzQbA+PpLwTlcObfhWUxM0se6PpkOg8gWrMRwUGpZdwtv9exyBwt8SCHgXSdpkyCss+TJ85nm+mVxVnRvmeIjJ/eRIIyptdAkUy06sqE9WSLpU58KoLYtrGwvX+QCDsuoEkuK4Xl7/GGexlaP9tJfKR7+0bCTgZDXlmqj43vqOw9hPCxaY00yHcv5zuNNRShXvLkasm+TuLvxQwMBXhXQJz4aznpO/rCSTEgzAHY46pSPDbjZ8wjzU15W433cgIwh7cbYnQmlwXrJ12gChTLoYHUIAQibQ1PiNSBos2eKnNRGf5OEagSfeGu+T44tDImKy814S/jvLAqy/WvRWybK0CdrleAZMEZBgBpLjN1sns=
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t1-20020a2e2d01000000b002d0ac71862csm391162ljt.9.2024.02.09.13.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 13:50:38 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 09 Feb 2024 23:50:35 +0200
Subject: [PATCH 5/8] arm64: dts: qcom: msm8996: add second UFS RX lane on
 MSM8996 platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240209-msm8996-fix-ufs-v1-5-107b52e57420@linaro.org>
References: <20240209-msm8996-fix-ufs-v1-0-107b52e57420@linaro.org>
In-Reply-To: <20240209-msm8996-fix-ufs-v1-0-107b52e57420@linaro.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 "James E.J. Bottomley" <jejb@linux.ibm.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Nitin Rawat <quic_nitirawa@quicinc.com>, Can Guo <quic_cang@quicinc.com>, 
 Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <andy.gross@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
 Bart Van Assche <bvanassche@acm.org>, Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1349;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=qFaDb3+HsDF2bsx5hIZxH6UqlzjoVIko72glK0fFo+4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlxp4ocXormBCjJV1YQU2TLy5kWlu8cty5tBadG
 rGlQyyYLwqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZcaeKAAKCRCLPIo+Aiko
 1ZRpB/9W0blSBVKtdWzVaBEZ2OFl6Afuo/pny8EhwnN2UU+znkCUmxSShEiVqvj48eH2pJ77T3R
 A6lUeYVgjf/P+ofMLm6lFKjPP/1hSYh24Jj+3fqYFKK/9eqRLQ4lBJh9zk6xY9LUyhaCWGpVAzm
 dk67C0bPRsYr5BPdDAPysn+cxIqtXLs1AQL0RtwjjUWCcC+Yuzg3XPX9o8Fr2gm1lQqrDhSUAdU
 dsdVEnwLXs02SU243fSyFwt14NHHIFFS0ln8+MP7xFasMbDeB37vzGLqt1pCMlKGhpwoegV65/z
 DxAmOQFcGCOLf7HeXMy0O9wEx23H5VE1CYE+MkBTyYtvTkl7
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Describe the second RX lane used by the UFS controller on MSM8996
platform.

Fixes: 462c5c0aa798 ("dt-bindings: ufs: qcom,ufs: convert to dtschema")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 401c6cce9fec..4472bbc7f058 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -2057,7 +2057,8 @@ ufshc: ufshc@624000 {
 				"core_clk_ice",
 				"ref_clk",
 				"tx_lane0_sync_clk",
-				"rx_lane0_sync_clk";
+				"rx_lane0_sync_clk",
+				"rx_lane1_sync_clk";
 			clocks =
 				<&gcc UFS_AXI_CLK_SRC>,
 				<&gcc GCC_UFS_AXI_CLK>,
@@ -2069,7 +2070,8 @@ ufshc: ufshc@624000 {
 				<&gcc GCC_UFS_ICE_CORE_CLK>,
 				<&rpmcc RPM_SMD_LN_BB_CLK>,
 				<&gcc GCC_UFS_TX_SYMBOL_0_CLK>,
-				<&gcc GCC_UFS_RX_SYMBOL_0_CLK>;
+				<&gcc GCC_UFS_RX_SYMBOL_0_CLK>,
+				<&gcc GCC_UFS_RX_SYMBOL_1_CLK>;
 			freq-table-hz =
 				<100000000 200000000>,
 				<100000000 200000000>,
@@ -2081,6 +2083,7 @@ ufshc: ufshc@624000 {
 				<0 0>,
 				<0 0>,
 				<0 0>,
+				<0 0>,
 				<0 0>;
 
 			interconnects = <&a2noc MASTER_UFS &bimc SLAVE_EBI_CH0>,

-- 
2.39.2


