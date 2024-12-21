Return-Path: <linux-arm-msm+bounces-43044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C9C9FA09F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Dec 2024 13:37:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C3DB189043B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Dec 2024 12:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8F691FA8C9;
	Sat, 21 Dec 2024 12:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FbC8NT+i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5EF1FA8C6;
	Sat, 21 Dec 2024 12:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734784591; cv=none; b=S5T46Lqs3RdhxtEnTmnz3Qfk9gUtY+0+LA+zT8gW67DRqdFN6+bo8raDqwS4yzFfA3+5JQr25ztQ0Hpwm4/976I7rDakSChL/vxZgbgNUzP8GuJNjEYr0GwnTis4WVKKmzMRJiLn3FA5KtmKYZcrqXLXpYTYj1oWA2kyBFrdlpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734784591; c=relaxed/simple;
	bh=6vbavfkLYVFadGRKLFydFfSrnsrMwL9w2+b3BtGnw3E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZLRVDfaAHddGKbtBePYq0w1aV4ViwWOwpnamsfj2xp2OU15wL8r+4hyHuhH0MXmUoS2BEDNWE2XNsrk2aoAPL9cmhLIv/gtA6Q0yyq3Zato+ExXkNCz2+YiOqCdXx+cS9n+yXP8B0XJIQbbm0TYBkCwKexkdEtgv5BNLaAbyJX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FbC8NT+i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08F62C4CECE;
	Sat, 21 Dec 2024 12:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734784591;
	bh=6vbavfkLYVFadGRKLFydFfSrnsrMwL9w2+b3BtGnw3E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FbC8NT+iInohrdEGlFIXJi03qYbPth9ys9ZVrRvXZ03iWqF6OAkkVrhqr3THJDP/F
	 fAbIav61I8agagGeR1odxhCr/2MOnKKlJxEHHbVNaFu82TLWEGZ7nlKGxO3gYUHzHN
	 xs9SAeyqGZDGRkWW/naklCJWVXWqBHLAf2i9oJ9Tc7r/6DHuBj5eelnXBBjVX5ISvv
	 szZa+xpTI3jiNbaKT9KuoKWVxj9GqvhTH5BC8xMLrCs4KnEuRgkcdATAMGve1ITZH5
	 ZW0SeV7Za0/rmYbVLMchrW792LLIUx289Ku+M8X6QR7YbtJUd5qH5gOzpmqBQmpVA3
	 te7QAtBRHOf+g==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Sat, 21 Dec 2024 13:36:02 +0100
Subject: [PATCH 3/4] soc: qcom: pd-mapper: Add X1P42100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241221-topic-x1p4_soc-v1-3-55347831d73c@oss.qualcomm.com>
References: <20241221-topic-x1p4_soc-v1-0-55347831d73c@oss.qualcomm.com>
In-Reply-To: <20241221-topic-x1p4_soc-v1-0-55347831d73c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734784578; l=881;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=bzkUflw+S0MevTXgpaM6q9R4o2M76yNJP6hOKRzeX/8=;
 b=HZFDPneCoJs7yPgMc35EWloyVB0U/3EIrA3UIc+H6KnDpWNvtleUeKFAIMw2EWnHuaOBusRwm
 XT/l+zzFxREAYQtySqIrW7s4z/AqlbLf9a8xOJfPCMxy3WeX/A8VN+j
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

X1P42100 is a cousin of X1E80100, and hence can make use of the
latter's configuration. Do so.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom_pd_mapper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
index 6e30f08761aa43da131a00885b2cc5e95960bc7c..50aa54996901f328146aac0197adfa8d71e4ef41 100644
--- a/drivers/soc/qcom/qcom_pd_mapper.c
+++ b/drivers/soc/qcom/qcom_pd_mapper.c
@@ -561,6 +561,7 @@ static const struct of_device_id qcom_pdm_domains[] __maybe_unused = {
 	{ .compatible = "qcom,sm8550", .data = sm8550_domains, },
 	{ .compatible = "qcom,sm8650", .data = sm8550_domains, },
 	{ .compatible = "qcom,x1e80100", .data = x1e80100_domains, },
+	{ .compatible = "qcom,x1p42100", .data = x1e80100_domains, },
 	{},
 };
 

-- 
2.47.1


