Return-Path: <linux-arm-msm+bounces-75378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE1FBA5E49
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Sep 2025 13:20:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA50C2A217B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Sep 2025 11:20:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA4802D9ECC;
	Sat, 27 Sep 2025 11:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dqaGjjH6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E5D2D6E6E;
	Sat, 27 Sep 2025 11:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758972031; cv=none; b=EXLj5tpzrg0NB21fThYAfxFT34Khz/LWtE0UCx1UHxWFzdPNAUpjZgswjbD14Iv3Rm7IoB6g9FP8GjN5gPLnmE0cw8HAHtj0XWRW7OKuJvpcYo939up+LEqWQlAuKBL9uoOGQMPlkTA6I9GXWs993xgac373UX40zz/1wJJui08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758972031; c=relaxed/simple;
	bh=PRorwxyPKIOq1HpgXs6bBnAwowA5ZYf8Untk48TuCTc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=I/l5MuSejZThScYu6zJdy227kCAh+lPyQx7/o18pY45XEzxxFHm+vZa9DDuSvU9wBtAlMQSX5Bopupib8t+dxqiMEQkKzsGr4fd5CXKiypfKuyAcJZLYx+7vcUlShbXpylrXhcJcPFJOqU+UQ9qs+diNseqNOqS1yzOm3t1Oil4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dqaGjjH6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56F2EC4CEE7;
	Sat, 27 Sep 2025 11:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758972031;
	bh=PRorwxyPKIOq1HpgXs6bBnAwowA5ZYf8Untk48TuCTc=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=dqaGjjH6FIEqyEABSgMctM76QpH9QiRGFnosxDUeGz3XqjpkbG6V8Im/D8E0CG4c9
	 TuUN+OOkjnqEinFRvGB9NYiQYzPbmLCsKGyDcAVg5J8mBWACffEB9Ykl3hwaVh7QL3
	 c2R5ToKCiTjvNmoWjRJ6n1sw/NGT1WlZGzleTci84BlB7o/jwfXt/CboD1U6PgvsCO
	 9tE72dOClmuHwKWMk1g3vlEIcbKToMPWunR+5yomnY7EtyxbwAVMSVax32lhSXzuHZ
	 JRlIUPLYJ1VVqao+ZQ6OBwp2Tmm729mplm5/SEpuETc80WzQy8DFRdV/DlvYcYMsLX
	 xkGH/ztlyEKiw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B04ECAC5B8;
	Sat, 27 Sep 2025 11:20:31 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 27 Sep 2025 13:20:28 +0200
Subject: [PATCH] arm64: dts: qcom: sdm845-oneplus: Correct gpio used for
 slider
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250927-slider-correct-v1-1-fb8cc7fdcedf@ixit.cz>
X-B4-Tracking: v=1; b=H4sIAHvI12gC/x3MQQqAIBBA0avIrBPMFLOrRIvQqQaiYowIxLsnL
 d/i/wwJmTDBIDIwPpToPCraRkDY5mNFSbEatNJWee1k2ikiy3AyY7hl7Izxqjcuegs1uhgXev/
 hOJXyAXsVlF5gAAAA
X-Change-ID: 20250927-slider-correct-d34490847d95
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gergo Koteles <soyer@irl.hu>, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1235; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=khpBYuHNK3gqhl7+t9U8Ea2FmJkEV2t39lvpmJj2DM0=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBo18h+p2HI2zxKPnvC/Vj6ayFsg9PhzbcgnfCyI
 TFmmuL+5veJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaNfIfgAKCRBgAj/E00kg
 cleBD/4t8nv6PNKKJ1R1a3L3W7GPVE7NqprA07qLI982TV1KecZ5oxkT+HXQm+Z9EJrqipWeoPZ
 3SFjlZdclKIN+R3PQSu24LQ7+KLy+MfC6CZ1bvECPod50WGMqprigBp9j0YnUv3dwZdEUUI+5JR
 5KwaDwJ/nZCqMKYP2HekCaJpRbLc4KrH97O12BR8Ggkuhochlfv4ONxNtlGIV8sd5u55NZCbo6a
 R3CyacztpUNWS6ySoz31a7jrqSjv37kXespgkYTEuwqKXQIKHFf72crp62dTnKLlt9qZsYIdEFT
 Sk5pl6Hp78BpbkOimGE8KBDRjEBuvgzg1rV19Rmno1Jl+peO0st59ApSHnV2xlgbU1w7Qqpxoqz
 /6czPfGmSi9Fy3BrknzPbBpPsIWTdQNZ2aDLWx1DZJqDCfprgK07TY+H3UCGykdF+CxZzi895jG
 eBVbw3j8UiE2vgXflxsjvsnhLcatsh/y8weh5V7f0xHBJ6s/G7JCkLvKMEvL9e08WHCC5jmJ8cO
 JC5BazebyAhfbmkg6veg0Buwtie1o43m28TOlNIK4XUwTK5mJGbP8/tvJ7Ac6lC5717WORe37mZ
 W72KrWl4q8LCCYrROE/kRgrU4aQgdzAKydNP+GmZGmnKLDVsITP8nKhAZTNmgN5opyEVgkWY4rk
 L3+2ys3vbS2rQbg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: Gergo Koteles <soyer@irl.hu>

The previous GPIO numbers were wrong. Update them to the correct
ones and fix the label.

Fixes: 288ef8a42612 ("arm64: dts: sdm845: add oneplus6/6t devices")
Signed-off-by: Gergo Koteles <soyer@irl.hu>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index dcfffb271fcf3146aeabda8fc19e61b456b76887..51a9a276399ac7de42f4269ace257120236fa81a 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -803,8 +803,8 @@ hall_sensor_default: hall-sensor-default-state {
 		bias-disable;
 	};
 
-	tri_state_key_default: tri-state-key-default-state {
-		pins = "gpio40", "gpio42", "gpio26";
+	alert_slider_default: alert-slider-default-state {
+		pins = "gpio126", "gpio52", "gpio24";
 		function = "gpio";
 		drive-strength = <2>;
 		bias-disable;

---
base-commit: 262858079afde6d367ce3db183c74d8a43a0e83f
change-id: 20250927-slider-correct-d34490847d95

Best regards,
-- 
David Heidelberg <david@ixit.cz>



