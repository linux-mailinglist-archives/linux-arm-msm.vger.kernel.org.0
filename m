Return-Path: <linux-arm-msm+bounces-52569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A48AA72846
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 02:49:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DD883B5555
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 01:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE8057DA95;
	Thu, 27 Mar 2025 01:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GackwGZr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B6778F4B;
	Thu, 27 Mar 2025 01:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743040049; cv=none; b=WZjoTujLrWUb3mHeZa/jAE1Lc1c4nd+eKkRNd7gvOaUdWPpCJpXwFWz1/YBLUh/WMjSVGDNe1rh+3NtAJklOKV5JXxGVPxM62tHx3+xRXKXjPT290QiEfSo/BIhDBjb/QySDx5kDuvZY0xZx3ksHMSX++pZE/uSvH5B1kTpr4yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743040049; c=relaxed/simple;
	bh=oBRd6wImJHcw1AyK1R69WS4Vqed4sQSl69EVg4TbkUI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JxxKDfDKtCL2kGP2Ps+O84J1v/OspECNOb88bnHfTzGel0QPKGhpqjfNYkrBsbUR1fhONNm0Xq08EBAXvVLJKLkIGhPHqrAI4jWhhHi2GMu7B2zrYAb22KKTr3D7enbypNknTbgtyTth/NTIZ11E80NjV+RZ6NIIqLXWvAzmUaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GackwGZr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 023DBC4CEE8;
	Thu, 27 Mar 2025 01:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743040049;
	bh=oBRd6wImJHcw1AyK1R69WS4Vqed4sQSl69EVg4TbkUI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GackwGZrE0KAij8jyx34lftiAl2Nu3YKJt2w1+yscSZGvl1Xec/lTLg0vKjz3yU8Y
	 xDDeUdOS+4z0fT6rcyBNj9WFkP7oJ70kLYTVODyxu8tIEx2o1hqnkOJId8Phcpa5vX
	 i6SYrK5oEnqqMofkV85NL/tMwmK5fdWhdT1Wp9DlvFgCcNgSZjd2NdFqfSoPqkH5t1
	 pKCbxxarzDVlGUDj99SiM5skDB1ifQ8LENW28ZXiFZzW7V+wV5HKJph3kWezv3zR5n
	 h23a3f8hQfW4Br+w3YPRdfU0PnmPmY0IxVWlnrDVKb9So3y1cG0/usDsQjxdorSV9p
	 H4iMGG/BkhaCw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 27 Mar 2025 02:47:05 +0100
Subject: [PATCH v2 03/12] arm64: dts: qcom: sdm845: Add specific APPS RSC
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-topic-more_dt_bindings_fixes-v2-3-b763d958545f@oss.qualcomm.com>
References: <20250327-topic-more_dt_bindings_fixes-v2-0-b763d958545f@oss.qualcomm.com>
In-Reply-To: <20250327-topic-more_dt_bindings_fixes-v2-0-b763d958545f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Marc Gonzalez <mgonzalez@freebox.fr>, Dmitry Baryshkov <lumag@kernel.org>, 
 Arnaud Vrac <avrac@freebox.fr>, Sayali Lokhande <quic_sayalil@quicinc.com>, 
 Xin Liu <quic_liuxin@quicinc.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743040027; l=1126;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=SVTg8/g07XDg0dRDvO4sTWR2W4ciOG2P5W+0+Wo3CIk=;
 b=QzKxMUg+1JY/l6aew0oic714OtLgXuFEm407lW6C5bL02Sly9LFhetpp3So4Zo6UMK+bUns+1
 y2XwZAElZOdCXFXVq/KGxIDxm+A5ZKcwKFg20D5TRTGRXloxeYSRkZj
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

SDM845 comes in a couple firmware flavors, some of which don't support
PSCI in OSI mode. That prevents the power domain exepcted by the RSC
node from providing useful information on system power collapse.

Use the platform-specific compatible to allow not passing one.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 2968a5c541dc0a6c1c28e32160c4c40a8f332497..4466c08a8bb08075d71835e04733ff4dbf6f190b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -5264,8 +5264,8 @@ apss_shared: mailbox@17990000 {
 		};
 
 		apps_rsc: rsc@179c0000 {
+			compatible = "qcom,sdm845-rpmh-apps-rsc", "qcom,rpmh-rsc";
 			label = "apps_rsc";
-			compatible = "qcom,rpmh-rsc";
 			reg = <0 0x179c0000 0 0x10000>,
 			      <0 0x179d0000 0 0x10000>,
 			      <0 0x179e0000 0 0x10000>;

-- 
2.49.0


