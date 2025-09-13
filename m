Return-Path: <linux-arm-msm+bounces-73415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AE9B563DF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Sep 2025 01:59:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B7C6481049
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Sep 2025 23:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29E522D3212;
	Sat, 13 Sep 2025 23:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="BVpJvwVl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8822D24B6
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Sep 2025 23:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757807871; cv=none; b=NUzypclv3ZfSMGQibQ1aZRKyjPS2oSUH4MUSU2EYZVsaEIavVW4yBM2IhBTZHPcEs6yIs2HLtcnUu3SQHOr1P7CdTCaLnKgIS1y5v94xe5g2WOOpMWZDw3bDXIkNV70ogWxDXY4INMJiy6cz4lEaF3PdU+gFiz/oEOz7iz1VOb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757807871; c=relaxed/simple;
	bh=MEU1oZmW1Jz9g6RW9HISsnJf9ZCGb65MDgxqC4G7np8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l4A+1w/iKTZzmPOnpU2o6OMEBLJ2hIUsa3LcITy7iMZC0sNjvSl9NTDigiSigHrwpkyIEh8bOP0v7gHKHP6lnSWWGTxFYJxJm4cMpwB6GZlA67/1asWijVlIFvGE7ep9MIzJpE4QFW4cqok9Qa/6sBDXPxcONoxhNphbsN+yyl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=BVpJvwVl; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1757807867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j8D1ir0Q9bChlrsdFEwZAmyl5VzWBsMa5nKRtnzFmQg=;
	b=BVpJvwVlLRhUc7s3su3bWYtIrE910sVf55Wmq3fraLHKk/Z77UikElWz+k5Llr/5BwioEO
	S30YPFnRctWtddTabcmySkqRZ9aEWwtU/lv9cyNa3j4XRDmCAzWW1aFJQw+BEB5HtoLBna
	JpBBEZH2C7OoIqaA5Ul6YVxL4STAlt1T5ylpB7H9Okc3ox+pKe3iWnstP9/V8P7RKaD3mj
	uEA3WCmdyrQp8g3jQDIYpfE5gdo1FiUE+zkcNNyyAvvllqNCePUBkeaJoEZZh6p6etXi0/
	PdZ/ANgU6idWRh/COtgilsrByfNrUe5zqL1CNXEHB1fGqEVhqifHvpPpN3Y2eA==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Sat, 13 Sep 2025 16:56:42 -0700
Subject: [PATCH 09/11] arm64: dts: qcom: sdm845-lg-common: Add chassis-type
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250913-judyln-dts-v1-9-23b4b7790dce@postmarketos.org>
References: <20250913-judyln-dts-v1-0-23b4b7790dce@postmarketos.org>
In-Reply-To: <20250913-judyln-dts-v1-0-23b4b7790dce@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Amir Dahan <system64fumo@protonmail.com>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757807839; l=689;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=MEU1oZmW1Jz9g6RW9HISsnJf9ZCGb65MDgxqC4G7np8=;
 b=u/TL6YX8xcosSqpv53f7s5nWx9KDmUlWd1iRrbuY8HnQwhisCup9KL6UhF/kPZRHbPInZhJMH
 3E1Zy62WGfxCFsl/MOuVN7UAha9w1wvAysxeuJkoD450s54afT25CPD
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

The sdm845-lg devices are all phones, therefore handset chassis

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 3853f0e5d89ca87b6fe7882e50ab9421a42efb0d..1f4427194fddea238c1b97afd8494d08b006a40a 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -30,6 +30,7 @@
 
 / {
 	qcom,msm-id = <QCOM_ID_SDM845 0x20001>;
+	chassis-type = "handset";
 
 	chosen {
 		#address-cells = <2>;

-- 
2.51.0


