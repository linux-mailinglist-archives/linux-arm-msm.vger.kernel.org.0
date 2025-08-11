Return-Path: <linux-arm-msm+bounces-68569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 923CFB2151D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 21:07:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFFB1189397B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 19:07:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 314A42E2DC4;
	Mon, 11 Aug 2025 19:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pp6XP8nH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABB5284B25;
	Mon, 11 Aug 2025 19:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754939251; cv=none; b=b00j8ym5JrFszACuEkPVWM5vPXCKcNIp+kkOVjdGU3YIyrSCiFu7pQAPC2yLB2aikYxd0/LtuPH7ZrL22OatxstcZ+vv0NDhnINrThgysc3+p8695zAO+kExDl5Y1Li0vWvO/XDLmOvAgufSx4O1bptfmXdI/uCWg1HZfKiQ7Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754939251; c=relaxed/simple;
	bh=IT9CfwXtx+8CDN35iEzS9Tir4HmMJGHSAmGC+WIZImU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cm3VefEjHOWcnHHp+6b0dewCLn4Kgo/SQZ4pBUnq34AGnIxJ0BdszD8xioclFHLab4VHjRrX0QCRWWzSw1CqWUOXfK+gBfkB2KjnUyt3AMrhGcHcSkiHXfPNFkuFTa0if0h5pdep5qWCOj/aG0SMehbAVzRsz/pGRpnBiFxsjFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pp6XP8nH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A389EC4CEF7;
	Mon, 11 Aug 2025 19:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754939250;
	bh=IT9CfwXtx+8CDN35iEzS9Tir4HmMJGHSAmGC+WIZImU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pp6XP8nHzsB7zyLsmXpDObs+/yAqTCwxo9Dq0WLkxF7dTahtrqvlGAoiEVwBVy/+u
	 E0hh3AhezbOKckejXfgk0xv9w2Y7x9M3LmslB3D261zFx6TNL1v/DBQyVgFwun1Sox
	 I439PN4wE3sKFrofF52FQwqM3oprido2ipNmW7q31tmSYzLiwD0d8xIHonCf+vlINx
	 8ggXvjx9Gnp1TZr4keiTAZsfRfZNDahpcS5S+agiITBmmo88iGArJxp8Xnuw0dmpdY
	 ecC/4y4SyvqrpjIjbBAu6apOf+H4tMh5GNRX5JhJIvHNR0lp0bidlUUPgbK+KA7Jid
	 6UbfJUHGl4uwQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 909F6CA0EC4;
	Mon, 11 Aug 2025 19:07:30 +0000 (UTC)
From: Cristian Cozzolino via B4 Relay <devnull+cristian_ci.protonmail.com@kernel.org>
Date: Mon, 11 Aug 2025 23:08:10 +0200
Subject: [PATCH RESEND v4 2/3] dt-bindings: arm: qcom: Add Billion Capture+
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-rimob-initial-devicetree-v4-2-b3194f14aa33@protonmail.com>
References: <20250811-rimob-initial-devicetree-v4-0-b3194f14aa33@protonmail.com>
In-Reply-To: <20250811-rimob-initial-devicetree-v4-0-b3194f14aa33@protonmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, 
 Cristian Cozzolino <cristian_ci@protonmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754946504; l=840;
 i=cristian_ci@protonmail.com; s=20250620; h=from:subject:message-id;
 bh=K11gJ9Fb8+1ali2kCYD7nje9AvLP+FV8erJhSLF+Ad4=;
 b=yyaeOmzDqjsMYNO6ZmiidroLAmXuFo8YhZiNNh/IaP9PMk2TmsgPurpq6aEOHRKOt/33sNtGS
 uwPWTIzVJYSBGHaZ+d8r+exDxMHfDnc/+Kg0CJwx2lWjqlwOxjXFP/Z
X-Developer-Key: i=cristian_ci@protonmail.com; a=ed25519;
 pk=xH5IvIPUNHV1Q8R0/pq2CfuVFR/wTiAyuyi6IwedjZY=
X-Endpoint-Received: by B4 Relay for cristian_ci@protonmail.com/20250620
 with auth_id=438
X-Original-From: Cristian Cozzolino <cristian_ci@protonmail.com>
Reply-To: cristian_ci@protonmail.com

From: Cristian Cozzolino <cristian_ci@protonmail.com>

Billion Capture+ (flipkart,rimob) is a smartphone based on Qualcomm
Snapdragon 625 (MSM8953).

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 618a87693ac1dc32b40a2201bc219a4f12e9f3e8..dbe605557af82c2382702011276e920ea18d3bb8 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -274,6 +274,7 @@ properties:
 
       - items:
           - enum:
+              - flipkart,rimob
               - motorola,potter
               - xiaomi,daisy
               - xiaomi,mido

-- 
2.49.0



