Return-Path: <linux-arm-msm+bounces-84471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A7CCA7B3E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 14:12:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0AA39312BF98
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 13:09:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 970AF33B964;
	Fri,  5 Dec 2025 13:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mIWSmqTl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E8833B6DD;
	Fri,  5 Dec 2025 13:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764939656; cv=none; b=TP/haiSD2P+EoMmF/3BoSf64qZVsq/Z6ysAjYW/NFRMZlz/e8BFUjOX817Jrvld3SWHJfbPxFhPZg9J+O9BK8RgeJTy4cjUprdpIk6cg4kvI20FNjudhqVPgoI8YartNPk++UXYxEI0lvZR1b799zhwBZUWkEmP67JMvqcWt8JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764939656; c=relaxed/simple;
	bh=dnuZJZL8TlJbC+gn2skXrXqLMNfZHBRasjG07Eo7sjg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cJrzrv6syMKuySaHZredEVDjHlt6gfRovQFJ3dEq3aIMVV5z3UNqb3IzZsspai0+e+d/tryqnx0kKYfLcYvYYwdsxYYfKpjH0ruj8BDD7rZ7982ChpbQdiEJH3Sj170/Zox98fzC79I7vpzEms1L7qWH7iKPryVMzLH3+ejxNUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mIWSmqTl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 71CB6C16AAE;
	Fri,  5 Dec 2025 13:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764939655;
	bh=dnuZJZL8TlJbC+gn2skXrXqLMNfZHBRasjG07Eo7sjg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=mIWSmqTltEgl5Ok2rK6cxGC/CnEMjpzU8NjQjKSJi5RKWhcBi5Mq1nAWuz6Q3Bu6L
	 E14tOr/6Aoh3NR5GPE4Kd4/SDFdAjOUPid8vb4xzE2NAQRYvTUrhWhbKtUVgOfln5z
	 B/Bz6E99EEw6OaWEUUIrifxMhiWqt3acf/3NH4cG/MoMSi/Q4OlmrddOklKQ2azVzc
	 OzCr/zYc1XZvXqwnjJFjtwjuTFOlIDT8fyn0pmE1d0LrsPSn4nvCT0S0N59L/vg3sP
	 vw4BuhZ1alP5KIKpCAsBZloZdZgM7SPJZGy8/zywOk+m9Nuf2LFmtlWVLNO2m34rdd
	 4/eAic68P/4tQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59C75D2F7F1;
	Fri,  5 Dec 2025 13:00:55 +0000 (UTC)
From: Robert Eckelmann via B4 Relay <devnull+longnoserob.gmail.com@kernel.org>
Subject: [PATCH v2 0/3] arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable
 SLPI
Date: Fri, 05 Dec 2025 22:00:03 +0900
Message-Id: <20251205-slpi-v2-0-dfe0b106cf1a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFPXMmkC/13MQQqDMBCF4avIrJuSGWlou+o9xEWMow6okaSEi
 uTuTV12+T8e3wGRg3CEZ3VA4CRR/FqCLhW4ya4jK+lLA2m6IZJRcd5EOYOGa1s/0DGU6xZ4kM/
 JNG3pSeLbh/1UE/7WPyCh0sqhxl7fO7YDvcbFynx1foE25/wFLLVOo5gAAAA=
X-Change-ID: 20251126-slpi-c616e3a391ce
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org, david@ixit.cz, 
 Robert Eckelmann <longnoserob@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=823;
 i=longnoserob@gmail.com; h=from:subject:message-id;
 bh=dnuZJZL8TlJbC+gn2skXrXqLMNfZHBRasjG07Eo7sjg=;
 b=owGbwMvMwCVmcOAq9/vk/SGMp9WSGDKNrqcplE0+pf58Mad6g59m6nPVzQuaBQQbr7c9LlX08
 9p8b9KujlIWBjEuBlkxRZYdbsd0Ml2XRmzcvb8MZg4rE8gQBi5OAZiIqAEjw+fbC64FJKy9mPvH
 4NKMva7izUwLy7vXLH05sY/3X3XFtgxGhvPv7ZIS/0THRhbXcWn093x9fC/k/UqX+MDfh6uXpj+
 x4AAA
X-Developer-Key: i=longnoserob@gmail.com; a=openpgp;
 fpr=B846C62C6945A558B1BBBF7630C0D50BEF63BF54
X-Endpoint-Received: by B4 Relay for longnoserob@gmail.com/default with
 auth_id=569
X-Original-From: Robert Eckelmann <longnoserob@gmail.com>
Reply-To: longnoserob@gmail.com

Enable the SLPI dsp on the Xiaomi Pocophone F1 with Qualcom SDM845 SoC.

Signed-off-by: Robert Eckelmann <longnoserob@gmail.com>
---
Changes in v2:
- adjusted firmware paths
- enabled i2c busses
- Link to v1: https://lore.kernel.org/r/20251126-slpi-v1-0-c101d08beaf2@gmail.com

---
Robert Eckelmann (3):
      arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable SLPI
      arm64: dts: qcom: sdm845-xiaomi-beryllium: Adjust firmware paths
      arm64: dts: qcom: sdm845-xiaomi-beryllium: Add placeholders and sort

 .../dts/qcom/sdm845-xiaomi-beryllium-common.dtsi   | 47 ++++++++++++++++------
 1 file changed, 35 insertions(+), 12 deletions(-)
---
base-commit: 6987d58a9cbc5bd57c983baa514474a86c945d56
change-id: 20251126-slpi-c616e3a391ce

Best regards,
-- 
Robert Eckelmann <longnoserob@gmail.com>



