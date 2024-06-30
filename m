Return-Path: <linux-arm-msm+bounces-24737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA8891D0B0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jun 2024 10:59:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A627D1F214AD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jun 2024 08:59:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AB0B12CD89;
	Sun, 30 Jun 2024 08:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cPMbsAG0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7D812CD88;
	Sun, 30 Jun 2024 08:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719737969; cv=none; b=g+3Dr303wxxUCWxZS3kNWKVPpqhCKC8uBRmhFYnZRa33l0pH0OFg9r/mxKadaZvI9qMw5LaR13C1xN8n6sGU6zI0FRFevJZRFg/Nqq6fyaNc5bH1ZvW0+jWQzd/WVe2XnlQy30gmyLJe6Hxtt+q1aRniiT3IFtchpB6uVfirHDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719737969; c=relaxed/simple;
	bh=j4kaZ/n0kkQyZeMl8GdQ9WiVGP9vxv5fk6NSu79j+a8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RtDn6qEGZN0MIi4ZQD3svYjmFQcyrUWnsy9zq0Kt7Mzc6tJV+e18lnLfQLNadvnc2RuH98y/QDTjrGiKgPhJVlYt89Can86x2LJOXzcwdl5Tm0WlToGEA2FD4jHpWe7VwGZE78oyaLFaKw4sBjM9cysthc3y+GZueRcCRdglepQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cPMbsAG0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A8522C32781;
	Sun, 30 Jun 2024 08:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719737968;
	bh=j4kaZ/n0kkQyZeMl8GdQ9WiVGP9vxv5fk6NSu79j+a8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cPMbsAG0jT1ra84pqh1xrhufub5C7dE7vmlHUY61trV2crAwlgDTEtA5SxtAADOZm
	 3Xrtd2WQLEm/8jy95zT3+x4asJnpwpWnYlEoOuzXIUKaXQn6LgQNJJCHLOxErEXkN+
	 Ay7B0XWqy4g/dyBeLRVyuFJzb+6Vx8QfS7euBWAq9Oe3Sbb6F4mGapVkNIieAC24gw
	 86XcT4GAAEeuoKHKJ7dCRFF2pMR2pvWtL1qR0YMS2Aj6J4a9ZXhjTSD2BvPRNoQQhG
	 gA6iffopgoHwK7qbITuhYIDLKJ3FqTCc6fyD67t1n51OZ8OfCSoA//K8wkx6eqZMhO
	 +Stif/z73+YAA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E328C27C4F;
	Sun, 30 Jun 2024 08:59:28 +0000 (UTC)
From: Xilin Wu via B4 Relay <devnull+wuxilin123.gmail.com@kernel.org>
Date: Sun, 30 Jun 2024 16:59:26 +0800
Subject: [PATCH v3 1/2] dt-bindings: arm: qcom: Add ASUS Vivobook S 15
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240630-asus-vivobook-s15-v3-1-bce7ca4d9683@gmail.com>
References: <20240630-asus-vivobook-s15-v3-0-bce7ca4d9683@gmail.com>
In-Reply-To: <20240630-asus-vivobook-s15-v3-0-bce7ca4d9683@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, 
 Elliot Berman <quic_eberman@quicinc.com>, Xilin Wu <wuxilin123@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719737967; l=679;
 i=wuxilin123@gmail.com; s=20240424; h=from:subject:message-id;
 bh=RGZfgpJlhdnNIXBEd0+u/3mv88NUycmZX6UUfdhL1s8=;
 b=VGNnO0hHtW5WV0FEmwjXOwMYATtZYePWSP7s0lsYPjpad9dW4nlOjgKM9MSaq1SlLilQyn41Z
 89D8oLnRmWTDY4JFdxaj8QAo7frSzadadSLLmKe1upSpWqUtd8Zl6dE
X-Developer-Key: i=wuxilin123@gmail.com; a=ed25519;
 pk=vPnxeJnlD/PfEbyQPZzaay5ezxI/lMrke7qXy31lSM8=
X-Endpoint-Received: by B4 Relay for wuxilin123@gmail.com/20240424 with
 auth_id=157
X-Original-From: Xilin Wu <wuxilin123@gmail.com>
Reply-To: wuxilin123@gmail.com

From: Xilin Wu <wuxilin123@gmail.com>

Add the compatible for this device.

Signed-off-by: Xilin Wu <wuxilin123@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ec1c10a12470..8342e3f2523f 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1036,6 +1036,7 @@ properties:
 
       - items:
           - enum:
+              - asus,vivobook-s15
               - qcom,x1e80100-crd
               - qcom,x1e80100-qcp
           - const: qcom,x1e80100

-- 
2.45.2



