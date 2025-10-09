Return-Path: <linux-arm-msm+bounces-76650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C504BC926A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 14:59:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C93303E643A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 12:59:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D8E62E62BF;
	Thu,  9 Oct 2025 12:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G94Rf8Tc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEE072614;
	Thu,  9 Oct 2025 12:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760014774; cv=none; b=oL/N28Q4wBUnB2WO7OVAOq1CTgdX5NMSeyHChHXFxMnIvKeize9B5dUfM/2BW5chmLmP43Z82AZ4iCDlMvLbxVU2ssgmf4SIic1Xa7V6OFWzoNiXkXnw9p/kzosmHUFk6CF3uv7zcd0cEsscbNRWqnzA7ytiRzCJmYuNNBOLY4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760014774; c=relaxed/simple;
	bh=e5JU+EEej+UYaag5RGaq8r1rnPbVxtcpHRPK8XuGuKI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=k/F3u0QPnhckUydB5ImFjbtCRQFL4zD7+WcskxFYoSieE3POCuz6QcekYytLBwwWcsqVbdeSiH6AvmUZ9lU7Sj/YpfjBePEkY2MpySTdEHnBr0gb7WmBl3jhZUEt+tG5dbuSuuLhIyb9wZPWUftDHFF8AGreIB9iJ5KTor/2RNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G94Rf8Tc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D83DC4CEE7;
	Thu,  9 Oct 2025 12:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760014773;
	bh=e5JU+EEej+UYaag5RGaq8r1rnPbVxtcpHRPK8XuGuKI=;
	h=From:Date:Subject:To:Cc:From;
	b=G94Rf8TcwEGdLlN3SnzjIRm3WYgCmLcChcN86VR4YcB/CEIvZlRouqiCiqUoh8U9U
	 TWblrqVDA8ceVUwAomINkWWzvyf+ajyHNUexEZ51sxU/jRRx3crAC6Balab/25XgYG
	 m3Uh+W4hyqBQY5pRHp6NrI7EE0zTIg4Gh7Ef4XCvK3oC33Vw2ktDIoNj/q6J7HpZXw
	 3JhHTMK/4Rv648alUr1wLIigMbbKsRqMtGCMPXAR33zS1TzjVW3NTPL93egSO8Ch6z
	 tC04gxaZaJj2YcY6SHhZ6KPW1TNSHZNEeQijZekRLiH3mpUJ7GpIWIj2D6pJDtRKVG
	 qup9DRwoJkX6w==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 09 Oct 2025 14:59:18 +0200
Subject: [PATCH] arm64: dts: qcom: x1e80100: Describe the full 'link'
 region of DP hosts
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251009-topic-hamoa_dp_reg-v1-1-4c70afa5f029@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKWx52gC/x3MQQqAIBBA0avIrBNUkKirRIjpVLMoZYwIpLsnL
 d/i/woFmbDAKCow3lQonQ26ExB2f24oKTaDUcZqpQZ5pUxB7v5I3sXsGDdpow+9shaNXqCFmXG
 l559O8/t+GMMxcmQAAAA=
X-Change-ID: 20251009-topic-hamoa_dp_reg-5dac7055e21b
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760014769; l=2184;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=BySGI5l3xmSxujvS1r//EHNI4zajTcwhIloUQLpdfQs=;
 b=nIISyw7OoP/4O5B/3DTMjarVufsW3iJyLcwGz7OWZb4NunAI06subptyt1ZX9xFv9xLRJkNwm
 00Fq7AUFwHJBJQCOC77hcBAqBSPv/GQjH9ZzgPKiW4E2wxibuhhAJnh
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The regions are larger than currently described. Rather inconveniently,
some control registers, including some related to USB4, are in that
left-out chunk.

Extend it to cover the entire region, as per the hw specification.

Fixes: 1940c25eaa63 ("arm64: dts: qcom: x1e80100: Add display nodes")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 51576d9c935d..ccd7f9975dac 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -5466,7 +5466,7 @@ mdss_dp0: displayport-controller@ae90000 {
 				compatible = "qcom,x1e80100-dp";
 				reg = <0 0x0ae90000 0 0x200>,
 				      <0 0x0ae90200 0 0x200>,
-				      <0 0x0ae90400 0 0x600>,
+				      <0 0x0ae90400 0 0xc00>,
 				      <0 0x0ae91000 0 0x400>,
 				      <0 0x0ae91400 0 0x400>;
 
@@ -5554,7 +5554,7 @@ mdss_dp1: displayport-controller@ae98000 {
 				compatible = "qcom,x1e80100-dp";
 				reg = <0 0x0ae98000 0 0x200>,
 				      <0 0x0ae98200 0 0x200>,
-				      <0 0x0ae98400 0 0x600>,
+				      <0 0x0ae98400 0 0xc00>,
 				      <0 0x0ae99000 0 0x400>,
 				      <0 0x0ae99400 0 0x400>;
 
@@ -5642,7 +5642,7 @@ mdss_dp2: displayport-controller@ae9a000 {
 				compatible = "qcom,x1e80100-dp";
 				reg = <0 0x0ae9a000 0 0x200>,
 				      <0 0x0ae9a200 0 0x200>,
-				      <0 0x0ae9a400 0 0x600>,
+				      <0 0x0ae9a400 0 0xc00>,
 				      <0 0x0ae9b000 0 0x400>,
 				      <0 0x0ae9b400 0 0x400>;
 
@@ -5729,7 +5729,7 @@ mdss_dp3: displayport-controller@aea0000 {
 				compatible = "qcom,x1e80100-dp";
 				reg = <0 0x0aea0000 0 0x200>,
 				      <0 0x0aea0200 0 0x200>,
-				      <0 0x0aea0400 0 0x600>,
+				      <0 0x0aea0400 0 0xc00>,
 				      <0 0x0aea1000 0 0x400>,
 				      <0 0x0aea1400 0 0x400>;
 

---
base-commit: 0b2f041c47acb45db82b4e847af6e17eb66cd32d
change-id: 20251009-topic-hamoa_dp_reg-5dac7055e21b

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


