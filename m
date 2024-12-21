Return-Path: <linux-arm-msm+bounces-43045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0289FA0A1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Dec 2024 13:37:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9591A18904D5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Dec 2024 12:37:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D534D1FBE8A;
	Sat, 21 Dec 2024 12:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l57+6I02"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D131FBCBD;
	Sat, 21 Dec 2024 12:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734784594; cv=none; b=f6XJ6LOOi6mZMXA7cWKqhh5RqAET4PiSG8doX7UPdLoE4tP+x0CsBYKJLeWArstQKDO643Dlbe3JGO3ihPr87ZyV27WcRCcyLwcv3igKhr0t7Udl1anw4C0xqL6KZPme/bWw4LgZO260R4MiHYtugGQgAJCft0lAY0VQqraNeF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734784594; c=relaxed/simple;
	bh=AihAtIICWQrBlRFhbXWHBZRKElmInlna0fxi1UtiDf0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DkkZ33I0suitbJoBLTNxgXIBhr57HAY2Lkzgk0s2l2HGebrXe4BPtZ3NoOM8s2WvH/IRW64c78l2VXQ4smqueBpvVIt8lfAeXsNJUt6YWoqS8Z58N2lbEOdYYZ7BpEBdxFAUn5Hl/pgurTyon3+imtcCXExPJGfazj9S61zU1PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l57+6I02; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D1A5C4CED4;
	Sat, 21 Dec 2024 12:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734784594;
	bh=AihAtIICWQrBlRFhbXWHBZRKElmInlna0fxi1UtiDf0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=l57+6I02l7uImel9sh6RJiflXq5X3koswYKiJLsxX9tiDIJwfGhRUXRvd2Iqy+Iud
	 tGyoU7gyKRHoa+63mju6/BgxUj3tWTkbRFHcPycTdT4xiMTiXUapnfqidm2F/9RIKO
	 4RfZIBTvXP07hDzfJwSkkEDonLQrvVi2MkzhVx5KKAXJPsJOFZWLeipvcRoV/4vW1v
	 FlZAoG5bFNrNmIfougfgA1qwCkQEQdxwH9b/62CRglhn54mogGvlVLuXfFkrrxWSmA
	 JFFNRIxq3X42OWswrqesIs1FirgRowowCFu4csN30gQmiz/9pT4IJciv5UI3ftEKES
	 SnWVOegBC2lHg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Sat, 21 Dec 2024 13:36:03 +0100
Subject: [PATCH 4/4] firmware: qcom: scm: Allow QSEECOM on X1P42100 CRD
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241221-topic-x1p4_soc-v1-4-55347831d73c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734784578; l=768;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=vSX7eDnep2Rx1tciL+Cs56+ZSXSTnQuD10/73/fOsmk=;
 b=0w4vqU4DTIlPtHip1PO3S6qHSVrYWyB0RPEbOob6hXvRFyoRgxX8qV1jqal9dU1NASrpBh2M3
 ecPL54A6qWNBDYY+Uq7Ml12BGeJhTaA69zRfPZ5e+XD5+FSICZ38ybc
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Add this board to the list to allow e.g. efivars access.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 72bf87ddcd969834609cda2aa915b67505e93943..4ef219684a2dc7cb93b4812b656bf11cdea5da1c 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1780,6 +1780,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "qcom,x1e001de-devkit" },
 	{ .compatible = "qcom,x1e80100-crd" },
 	{ .compatible = "qcom,x1e80100-qcp" },
+	{ .compatible = "qcom,x1p42100-crd" },
 	{ }
 };
 

-- 
2.47.1


