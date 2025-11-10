Return-Path: <linux-arm-msm+bounces-81055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AB9C47B69
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 16:56:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 621EC3A6873
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 15:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D484F31770E;
	Mon, 10 Nov 2025 15:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dpQ+tuTV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3ECF31691B;
	Mon, 10 Nov 2025 15:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762789067; cv=none; b=ju0wBqIhQU0B3F+3DAPJlGb+/pkrThHFM6e+eWR9rDc8r9El9gKh9EN+dnr8AA1IGnjyEBk3TiJKpgnkvZqgBOaJ6Qaph7JEePJITh3ZhUrwsvyqzzyXxuRw00pf3dFuE/hnABNtUTUhDvw/6idq7yh4yH3MuJRqTcsRwpzbj/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762789067; c=relaxed/simple;
	bh=SA6xGNbHN6b9mWUXMWX+xDVjRNsrYUlySOFnrE7Xc90=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=L3D6jWKz8j/u3siqFw25UXrESBIgSZUh5xvxbwFtzpR2eQde46wh/RInwV8Oioa4bBRZS/YDPV5jLvV5lHW1FvPsHlViP33t4BhsT5flXvbwHQh8o5lUAuZxpyaVVl98VOki/1DZ9YbT0NCqcoxQn0L66W7lvTTVWFIh6FUh4NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dpQ+tuTV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2B1B4C19422;
	Mon, 10 Nov 2025 15:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762789067;
	bh=SA6xGNbHN6b9mWUXMWX+xDVjRNsrYUlySOFnrE7Xc90=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=dpQ+tuTVvkURZKNKhuG6lslngT94GQTL9iy17dngagaropX1IiecxKsAtN20HA5MW
	 qig5fX0A7VDqKZW7KcQ++jlw9glpRzx+wCltKdMSM9n3oBTMMUZJKMfLQ+PXjmMjQM
	 0FnVSJ5JQHeLEIJ7GjRBjfD1TIZ6ITI6KFCq7rsUYLNE75T0KTNAkelv8Jk18uzFlW
	 xxTYBMtzC69EX8+36sLsUl7MKHJUl548QvOpUejnZbZXwHS6JZ9iDb1EDKrHIowbvu
	 eF0K/NE+Y5H8lmWxhC+WJjPsZYmhxowwnOVSMwbVLAafXauY4JqLGHDOeNPdXiIEe9
	 B1qhQdW5vvG+g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23723CCFA1A;
	Mon, 10 Nov 2025 15:37:47 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH 0/3] ath10k calibration variants for sdm845 phones
Date: Mon, 10 Nov 2025 16:37:45 +0100
Message-Id: <20251110-sdm845-calibration-variants-v1-0-2c536ada77c2@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMkGEmkC/x3MQQqDQAxA0atI1g0YqzL0KtJFOpNpAzqVREQQ7
 96hyweff4KLqTg8mhNMdnX9lgq6NRA/XN6Cmqqha7uBiFr0tIR+wMizvoy3muPOplw2x3HkdKe
 cQ4gM9bCaZD3+9+l5XT80qa2rbQAAAA==
X-Change-ID: 20251110-sdm845-calibration-variants-66ad31ff88ca
To: Dylan Van Assche <me@dylanvanassche.be>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=808; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=SA6xGNbHN6b9mWUXMWX+xDVjRNsrYUlySOFnrE7Xc90=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpEgbJg4ACLHbh+CbhUqCU1Iqlj6FH3DtSXLTrq
 fQ3jFDg3mOJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRIGyQAKCRBgAj/E00kg
 clmpEACAIlVRtrvTyYZp+9rq6kTrYLEedExOTvk2bp+o5P41RWmS/9UPBatSv/Llu4740RzC4LM
 Uod9xCjWeiiSHpGdmRSD4IBWI9eXofqAHBK+saxCYTB9j8DsgASFQkvcSl3bgkl4VTE8py3jN7n
 mmX18oBN3AnEtRH0sa9btpNZExZHZtJNKQPdRqf/pCdxBaFYzdjS2OaOu6rnYdotONo/m85eQP2
 fhcjq4/nhgX7ZM3OSaOLOEQ3SgJhjXnRSueHftxQNria+eI0XMbtDIGW+YYpvouB2x/R5t4NuZm
 jCRNkxih6eaJitx3JHvLpO65wuyDaQafZ92+hJUGoM00k+50U8DBje/absmmoH/Zti0IhtTMLBf
 q9DORt/Q0SAovdjlITnU8/Y/W61887SEwQZMEXiKFiFycygkjdJPUNqHZWassdhCq6Ids7OytwJ
 dLY8HC0Nl2u+ADIsOUo8FQLC1EvmZtcBHXZkdSTsdD53iFt1Ke44lT7tqfAQ2wLUpnfbxwdqda2
 nwtKrzeMiS1dQH7Oee7UZ/oo3ogyGL9AV+hPJxgMfbrozSunPI6mhqEGcAToDEEBXR2KrwIVjNA
 RIo7NzFQnni8m2noT0iQNywfD0JYxB5vTHZSaw/iX41A/KTjS5Ix2WAqETaDeW4NCsa/Dya1mE3
 a6TxPt8EfDfjShg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

Let's leaverage linux-firmware and use calibration from the board-2.bin.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Dylan Van Assche (3):
      arm64: dts: qcom: sdm845-oneplus: add ath10k calibration variant
      arm64: dts: qcom: sdm845-xiaomi-beryllium: Add ath10k calibration variant
      arm64: dts: qcom: sdm845-shift-axolotl: Add ath10k calibration variant

 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi          | 1 +
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts            | 1 +
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 3 +++
 3 files changed, 5 insertions(+)
---
base-commit: ab40c92c74c6b0c611c89516794502b3a3173966
change-id: 20251110-sdm845-calibration-variants-66ad31ff88ca

Best regards,
-- 
David Heidelberg <david@ixit.cz>



