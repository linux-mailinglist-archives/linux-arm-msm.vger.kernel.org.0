Return-Path: <linux-arm-msm+bounces-62557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E90C3AE8F1C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 22:04:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A38D41897EBE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 20:04:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89E68286425;
	Wed, 25 Jun 2025 20:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aHH9mFrI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8D728F4;
	Wed, 25 Jun 2025 20:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750881878; cv=none; b=m4SbrDzo6qoWA/TOoLsr9crIhmdlFsnxeBBYfQPxNk9/5Vc65FJKkAi0/ue9AMVfvHlrOGYTOna4GqEjMaT3RqBnVIvce6JjMs4/9c+Yy+FvQbm8eMOm5TOd7015a0H+0+BReZaDvctnfDep2iIPr+JuSZQmQpVblJohqvlQnco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750881878; c=relaxed/simple;
	bh=LUlA/DiEIN/Tu/zhjXQCHb0b8RxKqKzkaIf2xrKvops=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kLs4TCrB7TY18MzSHFJasX0fqQ2LMCC77VSrJ3un/UFKBp2MrBmHwVXhzfmVicOuUegSd7Nzy4Vo24XD1zAb5dh5jUT+BZHQUArUDkCNFX25OnA9KZr7WVFXpoM0S0tE9ns/4pLTkJQHVdX1tj7so602fl8OXqA96t1idFuEzW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aHH9mFrI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id F230DC4CEEE;
	Wed, 25 Jun 2025 20:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750881878;
	bh=LUlA/DiEIN/Tu/zhjXQCHb0b8RxKqKzkaIf2xrKvops=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=aHH9mFrIkR3xwzpJbY/jqL1ar8tVOLssrydWZBvDitUOHLH7+oky1g0fh5w9O5KMQ
	 osEbbQw7k+TF/3vgl+S3Nu72CjRXQkctxH3YQogFFQeOX4uJMTijyAUGEG3vhDC3e1
	 v3EjmvGgtuc/xYvLTblHBMj5YkypgpikI/BWBAcxvaqYqd2a7PFK41Lbjn0DrsfihB
	 Wbu0XRtsFC6G96VdljO2ohSu7RDa0v0o6SQM9cz3LL64AG2h9RL3lGsPzk6+s6Xxpf
	 /WgpMo9xMNGQ+x7o3hw6mdLcsK/4Vjf1wUiFploEi9h2TeGZ7xZTZnrlN5FAGBpXcL
	 ujxlyIXz+Sdrg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E342FC7EE32;
	Wed, 25 Jun 2025 20:04:37 +0000 (UTC)
From: Cristian Cozzolino via B4 Relay <devnull+cristian_ci.protonmail.com@kernel.org>
Date: Thu, 26 Jun 2025 00:04:27 +0200
Subject: [PATCH v3 2/3] dt-bindings: arm: qcom: Add Billion Capture+
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250626-rimob-initial-devicetree-v3-2-4017ac9fd93d@protonmail.com>
References: <20250626-rimob-initial-devicetree-v3-0-4017ac9fd93d@protonmail.com>
In-Reply-To: <20250626-rimob-initial-devicetree-v3-0-4017ac9fd93d@protonmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, 
 Cristian Cozzolino <cristian_ci@protonmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750889075; l=793;
 i=cristian_ci@protonmail.com; s=20250620; h=from:subject:message-id;
 bh=rX9AadKtpX+eNxD3sjDhJeQkUeOFBglGYJMKRi4cNf8=;
 b=fLYBJbNYenAh9rXeUZZHelbl0soSmT6xzWnQM93fMuh0S5L1t0Odi2ksuLNWn5XjJueuk6Z+Q
 EGienFyoDV7DAinTC98+Iu3TCBNPfFZqAQQRjpcwGeTALhHEy6SOZFc
X-Developer-Key: i=cristian_ci@protonmail.com; a=ed25519;
 pk=xH5IvIPUNHV1Q8R0/pq2CfuVFR/wTiAyuyi6IwedjZY=
X-Endpoint-Received: by B4 Relay for cristian_ci@protonmail.com/20250620
 with auth_id=438
X-Original-From: Cristian Cozzolino <cristian_ci@protonmail.com>
Reply-To: cristian_ci@protonmail.com

From: Cristian Cozzolino <cristian_ci@protonmail.com>

Billion Capture+ (flipkart,rimob) is a smartphone based on Qualcomm
Snapdragon 625 (MSM8953).

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



