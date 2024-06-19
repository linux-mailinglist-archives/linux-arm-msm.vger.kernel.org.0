Return-Path: <linux-arm-msm+bounces-23245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B4190F486
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 18:54:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A18101F21EE5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 16:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29553155756;
	Wed, 19 Jun 2024 16:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="fTaVMi2e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982BD154C10;
	Wed, 19 Jun 2024 16:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718816068; cv=none; b=etD8lv2J2oWqL31r4wJZeeXIKtH53qKnk0Ytx8gavKDDfTTooIp77SV69XrFzYFuOn+RqozEh/sNxp9EUZNOhmNaRruwRWiwaVb81MlFYsguBQyCYB10OrAPGGY/PhVfOKhh+mcd9vBo6iH8t1kdso1TYRBVBg9ipYEjW3eJYso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718816068; c=relaxed/simple;
	bh=0D+UB1kVXwAQOenN2+8F6NzA+AoKGa6bvJ93lTW+NVk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VMFBKQ153iZwZsdME/hI1kWEAwuJn1UVzO9ycskYhh58FJpzIZKbAah7zXgPLe9Lo+xYrhBA5wWTNyDrRFTr2vrXmZ589/uZ5wOPkRbk57nY9uUzEjA1QzqzkVR00HiGinekkpvgZLPlJ4H3Kzytet7KI00h3CitcRtcLe/Ba8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=fTaVMi2e; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1718815510; bh=0D+UB1kVXwAQOenN2+8F6NzA+AoKGa6bvJ93lTW+NVk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=fTaVMi2elo0CuFj44jz3SrA3qOoD+c01zcnT4L79cTeLZbi4fxAzwJKhmmz9/lJmR
	 6s/jdA2vDDuv70xvLzYWlVJ2w1msZ6jtu/gi9sbAHhZgL0OywgMuQFDDk2tkTdbh3/
	 cp0YkvCUCR6AOUqFNclu5Sc5kkKpY7sPHvWGUSnk=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Wed, 19 Jun 2024 18:42:29 +0200
Subject: [PATCH 3/5] arm64: dts: qcom: msm8939: Use mboxes in smsm node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240619-smsm-mbox-dts-v1-3-268ab7eef779@lucaweiss.eu>
References: <20240619-smsm-mbox-dts-v1-0-268ab7eef779@lucaweiss.eu>
In-Reply-To: <20240619-smsm-mbox-dts-v1-0-268ab7eef779@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=756; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=0D+UB1kVXwAQOenN2+8F6NzA+AoKGa6bvJ93lTW+NVk=;
 b=kA0DAAgBcthDuJ1N11YByyZiAGZzCxKh3Zi8nYxVUdJ9KyTZp/rFbQamDaRewU93RNsv82F8Z
 okCMwQAAQgAHRYhBDm60i8ILNqRuhWP+nLYQ7idTddWBQJmcwsSAAoJEHLYQ7idTddWic4P/3a6
 HEMgi5FJ914FgQVF4Y2hhAJ6iCT8+HRPx0M1PH8Y0W3miDV/03AKBYGkMdYtxCiM5ijIanW1KAH
 oSJV/JJyDDikw1uZfW9DNUYCu9k7br0NiavJ11ZNuDds7BvWqluKE8i78qoe1OoOIPuAnniNZwZ
 4FwfMbnud7fXwW3hd0yBoyg4YiHgYlg+fth/F3UH/8XjVREUdeKdTyLxruAIBaNSct+z2ucE3/c
 SIxklcb6Nt8F6L/4CN3+qo2r2bEt9DA7W0be1gnMTucxhojWYVzkFOYHfBU0wMOG8jqV4n8fEBI
 0huw8p83YF8GnhBh7VzG7GhLPZJXt9z9hQM1KJ4BP0cl5vDExcFCuDNS+k0sEhR+ZVIc2HDh5tR
 8NFKYWxsiieu4R5aeVyTS3N8GPlBPfI2LA04ArQdSXvwUMKQr/Yu5tTF0NNIhBcwFJE6KvBFYA1
 LqDYFRa+/jd3TFcxnE/kP1QYnts49oHvjllTDf93QBKisyhkesTFrYzGkiTdG9F2vd2oWppl+dq
 VbJAA6UvRizrZb0Jz1+eHxbkHroUpSEo6i1hhZjU8VLHAM0LI5WjHoQnKaoYtIKN1GU02CQk6ar
 HFryQQm5OclJE49V134kXSFx6KN/7Jho7Gn9w4egtMUiZsE9XapqXckR50DaSzoIYArHO/fJhUR
 j3QAs
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

With the smsm bindings and driver finally supporting mboxes, switch to
that and stop using apcs as syscon.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 arch/arm64/boot/dts/qcom/msm8939.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dts/qcom/msm8939.dtsi
index e309ef909ea7..46d9480cd464 100644
--- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
@@ -443,8 +443,7 @@ smsm {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		qcom,ipc-1 = <&apcs1_mbox 8 13>;
-		qcom,ipc-3 = <&apcs1_mbox 8 19>;
+		mboxes = <0>, <&apcs1_mbox 13>, <0>, <&apcs1_mbox 19>;
 
 		apps_smsm: apps@0 {
 			reg = <0>;

-- 
2.45.2


