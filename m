Return-Path: <linux-arm-msm+bounces-84491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F422CA7DEA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 15:00:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D679304F133
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 13:59:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8C48332EC7;
	Fri,  5 Dec 2025 13:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TYcsyyDs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE634303A11;
	Fri,  5 Dec 2025 13:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764943151; cv=none; b=ZSGyECm+e1c2R9TeFwfiyn5iCGl2P2I/b8MJg03Bxqp0g6miSLc/QOCIIuckXNNIwWcmEYbkqN1zA828iI87jgwI1UnV1XFmrxRMmgt4dJ25f1pnUqPJjMenOvFN4wkwweFb5ZfhleI9sgFSEZbV+oIGhRu7zPzxaaSZNYdDHM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764943151; c=relaxed/simple;
	bh=SLlMh3YUbCexX05xcDNCw9MPzyvzjL+AToEwatpcYxM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lDIO0tk2OoqG8uAWwb2doaplwd7g6dnEvmmg4oR03w+JjO8iqIAcUKasDKLSEQq+lz6WFEJGLLZ8irIdJO0kDY/gKlV3FALsV55ntRkqLCOXVAmsvK0dHZShImpmaBVRYde9qeg/3eJsDF3Z07XEx+YuU9D/rrXTU7QTE2w35EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TYcsyyDs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8CDD9C4CEF1;
	Fri,  5 Dec 2025 13:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764943150;
	bh=SLlMh3YUbCexX05xcDNCw9MPzyvzjL+AToEwatpcYxM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=TYcsyyDsdgoKMX/qIx3mYGYswaLdHw3SqSX/b82legRaQqkzLqqjwug7p5AKrvi0i
	 BxBrgsWzkT2NMO2I5iFkLx9fz+KMm0g88+RlruCI61vJ9hZfN22ifKDejUtDH6Rk4h
	 zWvdPWjtnk1H3cQpcltyQQ3tDChqvUIt+rlP101CuhdFSukWMLESbvLjsh5bQmkck3
	 3aVKcMq1XA8w7LkUlS4HxN6ZHoPxjzrniDMA+q248Vmd3zEm0TKIfS0qoQ8FwfIl7o
	 Nczqw6qiSnjI4AKhV/ofXSTCWNrDJvetDt9LZWYZpFK/e11AA3EVzNwuQ5xfjLFqR/
	 kGrsfyXXWR/zg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CB07D2F7EE;
	Fri,  5 Dec 2025 13:59:10 +0000 (UTC)
From: Robert Eckelmann via B4 Relay <devnull+longnoserob.gmail.com@kernel.org>
Subject: [PATCH v3 0/3] arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable
 SLPI
Date: Fri, 05 Dec 2025 22:58:58 +0900
Message-Id: <20251205-slpi-v3-0-a1320a074345@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACLlMmkC/12MywrCMBBFf6XM2shMSoO68j/ERZpO2oG+SCQop
 f9uWgTF5bnccxaIHIQjXIoFAieJMo0ZykMBrrNjy0qazKBRV0TaqNjPopwhw6Utz+QY8nUO7OW
 5Z273zJ3ExxReezXRtv4FEilUjpAaPNVsvb62g5X+6KYBtkDSX0lj9ZF0lhrPWBMa58n+Suu6v
 gET2ilPzQAAAA==
X-Change-ID: 20251126-slpi-c616e3a391ce
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org, david@ixit.cz, 
 Robert Eckelmann <longnoserob@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=963;
 i=longnoserob@gmail.com; h=from:subject:message-id;
 bh=SLlMh3YUbCexX05xcDNCw9MPzyvzjL+AToEwatpcYxM=;
 b=owGbwMvMwCVmcOAq9/vk/SGMp9WSGDKNnuo4nn3v53vl7pozfc/Vc288P362YNvGd38kPs918
 ksu/OjQ2lHKwiDGxSArpsiyw+2YTqbr0oiNu/eXwcxhZQIZwsDFKQATaSpmZHh4Plggjot17+xW
 lTvxkVPLA1qXMgSsWHVC+MT6K1xnYpgZ/mnsZXef017C3KmzUa1XMdT5dXDx6oLmrlXbi6fXi5h
 w8gAA
X-Developer-Key: i=longnoserob@gmail.com; a=openpgp;
 fpr=B846C62C6945A558B1BBBF7630C0D50BEF63BF54
X-Endpoint-Received: by B4 Relay for longnoserob@gmail.com/default with
 auth_id=569
X-Original-From: Robert Eckelmann <longnoserob@gmail.com>
Reply-To: longnoserob@gmail.com

Enable the SLPI dsp on the Xiaomi Pocophone F1 with Qualcom SDM845 SoC.

Signed-off-by: Robert Eckelmann <longnoserob@gmail.com>
---
Changes in v3:
- remove stray newline at end of file
- Link to v2: https://lore.kernel.org/r/20251205-slpi-v2-0-dfe0b106cf1a@gmail.com

Changes in v2:
- adjusted firmware paths
- enabled i2c busses
- Link to v1: https://lore.kernel.org/r/20251126-slpi-v1-0-c101d08beaf2@gmail.com

---
Robert Eckelmann (3):
      arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable SLPI
      arm64: dts: qcom: sdm845-xiaomi-beryllium: Adjust firmware paths
      arm64: dts: qcom: sdm845-xiaomi-beryllium: Add placeholders and sort

 .../dts/qcom/sdm845-xiaomi-beryllium-common.dtsi   | 46 ++++++++++++++++------
 1 file changed, 34 insertions(+), 12 deletions(-)
---
base-commit: 6987d58a9cbc5bd57c983baa514474a86c945d56
change-id: 20251126-slpi-c616e3a391ce

Best regards,
-- 
Robert Eckelmann <longnoserob@gmail.com>



