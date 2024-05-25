Return-Path: <linux-arm-msm+bounces-20453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5978CF089
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 19:45:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA9B9281BC7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 17:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92A2485C76;
	Sat, 25 May 2024 17:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q79xK9lx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6817A58ABC;
	Sat, 25 May 2024 17:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716659133; cv=none; b=O4ve7REbaJAPnkbgorW7zgImFH2oGDhDbxWg7eWgJg7vpeoZ+a2b9gHaNl6fHfymjsXQPi9mSnq4FVqUoEKDymO006UHNUoboUr6oqdXBaN7R2d0lHKWw/rMkoj6PJY63Z38YcTORZpRjMnb9hSDSa/9SKSEmBcmca0xMwrEKC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716659133; c=relaxed/simple;
	bh=7Qxfdxf9w6jrY3F5TbthaloLYesSfD5pScmpoEaqkv8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=k5AuUseJEIMEL5kQAW6IEVcu08L52qu8q2ECRsAzqavo6Egv08PfvbfLkz3jyNA7TJPW96xY05LF5mA3qs5xM+BzfDAuvdPdrC/O3Ll7qZy68ML2zmUQd4yPRntTIaaXysuzebTELQe7QPEpM8d4KXm5y5ttTN2KjcWXBsFNhj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q79xK9lx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EA8FC2BD11;
	Sat, 25 May 2024 17:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716659132;
	bh=7Qxfdxf9w6jrY3F5TbthaloLYesSfD5pScmpoEaqkv8=;
	h=From:Date:Subject:To:Cc:From;
	b=q79xK9lx0MHpwP3ziWWoGvlCHkV7zt4jwCybLwTDtK1OzGPF3QyZGzWuMb9KR+LUu
	 MhoZkrUQ+KTqinwmD16ifKLuvJfZRM6BUNHPWcBmAEk9/1i08egHmvSi3O/Hz2C8pL
	 K87PjCP+JodgmvdkjjlI/U2opGIPAi+2A3xJk31dmFNd/+FQW9JIDn0goTXNrgmc1u
	 zjEaWuQQJ8QiJJQyRpy0zDj3+8jVOCHH5eznlzgctr5POfkwHR80COu743D9Gey1S2
	 3Pct4QAS0xifF/DZSFj5kC+jp2TUPyBeaaB2cZAmvypeZ+KhPRakcCLXRtt5Zr2ke3
	 AYVykOx0jWdvA==
From: Bjorn Andersson <andersson@kernel.org>
Date: Sat, 25 May 2024 10:50:21 -0700
Subject: [PATCH] arm64: dts: qcom: sc8180x: Add UFS PHY power-domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240525-sc8180x-ufs-phy-add-power-domain-v1-1-019d515b1c26@quicinc.com>
X-B4-Tracking: v=1; b=H4sIANwkUmYC/x3NQQ6DIBBA0auYWTsJYiW0VzEuUIY6iwJhorUx3
 l3S5dv8f4JQYRJ4NScU2lk4xYqubWBZXXwTsq8GrfRDDXpAWWxn1YFbEMzrD533mNOXCvr0cRy
 xfwYzW9srbQzUTC4U+Pgvxum6bsbAmKZyAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=843;
 i=quic_bjorande@quicinc.com; h=from:subject:message-id;
 bh=WLW83VPlEaBT6SIFfg08QjOzxrB3SmhSTMMh2S3NOt0=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBmUiTd6gA7ZRZCJj4ceVOXNHU6cObrQRLVWEPk+
 kDdrpzgG9aJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZlIk3RUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcXwchAAs1rn5HUTcOVSqlqag9+2MdPvRfwAUZOG50JReUl
 9CuwyrZ15Ty5PYtnGwcfcVZPfHbB4igjuEorKZmlgW2yZ7EYSvz2rWfUKlsk/cfthGgId3G2c4G
 HlRqMRWaMtvuEGQIbBFvODdXgQNncrBM13uNq6kWB/EjduzNvwYJQMM+fBepxERIkXGlblfFoPQ
 wt89jA70wq7DDe0skdV86Qp06aKO5e8iQP0we2155jBBNwK96FvCEPmv7wRx+LtXEYGeZcljLye
 wNxW+bDoMwzNvIzM5We+ToHSMJgJUKEz7RTOch+cM+fVMEIWrPWPudiSnV5dsLK2jECGuudMciG
 oKkuzvkLWdOL0oXtetTAosZ81g0tn+1rys+xXIwpxQ8oRAWC+Zql770t0/tyU7+NNUIjAu1zVW0
 0d0UJltcJz0dKyA0x5qzMC6AMB2tcHre2VmLwbkaMUkNvctXNByxHaH0q+LqIOxHJm4fWzylGYp
 ++A2MMAq9KkggkaXOnY2rhS5gDe5PHRY+T2NIUDPvTYTih/vYSj/4ZTE1hKRUQw8y4B4wyArQAF
 dOadZSlNbK/fhEwkIhD5YJ8XX03x3fiDcKnTvKt2ImDYp14mRAoY9X1dI7+H2JQl1MM5oz7Ot60
 VV4zSKWyHD2J52WdOtD6PR9+KC8FLo1488fupUaMerko=
X-Developer-Key: i=quic_bjorande@quicinc.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5

From: Bjorn Andersson <quic_bjorande@quicinc.com>

As defined by the binding, the UFS PHY node should have a power-domain,
add this.

Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index 067712310560..4b0a25d84659 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -2244,6 +2244,7 @@ ufs_mem_phy: phy-wrapper@1d87000 {
 
 			resets = <&ufs_mem_hc 0>;
 			reset-names = "ufsphy";
+			power-domains = <&gcc UFS_PHY_GDSC>;
 
 			#phy-cells = <0>;
 

---
base-commit: 3689b0ef08b70e4e03b82ebd37730a03a672853a
change-id: 20240525-sc8180x-ufs-phy-add-power-domain-39f6b8830266

Best regards,
-- 
Bjorn Andersson <quic_bjorande@quicinc.com>


