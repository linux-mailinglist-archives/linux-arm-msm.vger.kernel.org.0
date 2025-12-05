Return-Path: <linux-arm-msm+bounces-84461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F23ACA7FD7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 15:41:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ADD11330D1E2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 12:47:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4D04331227;
	Fri,  5 Dec 2025 12:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VSGLmhIX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBB42F5A3B;
	Fri,  5 Dec 2025 12:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764938865; cv=none; b=nTDPVZvblgIydvTsdr5beQIawBPZQW3b8VayJJgU62laW+xEwE3SVSrTj6Sk+D5oi/s+aJkTUeCaq0GK0I/sMFmtpIDb6KOgQdeAz09oSxy85qe1lNJZQ7OGtiOb4hk+taZS4OSScfSJmn4xC3RzL9Y3idT+p9AMfEO8DHp5kbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764938865; c=relaxed/simple;
	bh=oLzJCWfp0p/aIp2zDa3nPqNR6cvpVlbBPc7WZXU++JA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m91tAoeDacVxkLOGUMf5xELw748abxF0chTqo+1ShUrDRao3FI/aoQPBwtGLMmnsZtmmkcFv3xR6xvGcAzjHgYv2KZ78aYy61f2fJCaUjcbwZUcY/4jDg/c19OtIOkkeWGytUAslx+m6m0qaMjKya8I8freEM9CZa3Z9JGyD0to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VSGLmhIX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A726C116C6;
	Fri,  5 Dec 2025 12:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764938863;
	bh=oLzJCWfp0p/aIp2zDa3nPqNR6cvpVlbBPc7WZXU++JA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VSGLmhIXwvrRaJO9IaEu6GOzPSAqkEZxftYxDcndF4VeHNOUym+0FsoRDZapgCKIM
	 07tlzqyDIXaev7OBbNQ1mBYh4PSSzRZJ9MiXZDAIyoN7FwyeE6RvDKlg1+NvDfKakS
	 y8pWZqhfuRMq/LHzVjvh57rB4CvkemXqRjKQXXngXVW3HOcBN2xsHUqKhb2A34+Td9
	 F8K4S3DQwRQ++tu/eW0x0RWTyW9RUpOx2s1AgMpN4dZeGTau2ZQ+ackq3faNcfJPtZ
	 dqq+//TsTWw+lFbkvuA7dk1JJpb6TQkUo+cNZ9i0gD3ffWfWnbEm9UQfFfFuXYYtLN
	 b1F6bIzsWkTSw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 05 Dec 2025 13:47:21 +0100
Subject: [PATCH 02/10] arm64: dts: qcom: qcs615-ride: Fix BT RFA supply
 name
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-topic-wcn6855_pmu_dtbdings-v1-2-165611f687c8@oss.qualcomm.com>
References: <20251205-topic-wcn6855_pmu_dtbdings-v1-0-165611f687c8@oss.qualcomm.com>
In-Reply-To: <20251205-topic-wcn6855_pmu_dtbdings-v1-0-165611f687c8@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, 
 linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764938851; l=737;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=eYMXWp58jWKkvHmuBFOX2dx9edUmyWjVblkhcKdbkqM=;
 b=tu5zQr5/m5JGdZPdHFaI9nn4NOe6K+bfeigbvH/To9VoaoeT5gap1oE0PphGC7gqrmxTTVYhP
 kDD1mCrxzZPAHX7Q8tR8TULm7vlyftbbr+bwVm9zXO36to1hXBVep/0
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Fix up the supply name to align with bindings.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index be67eb173046..9413f2276a55 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -605,7 +605,7 @@ bluetooth {
 		vddbtcmx-supply = <&vreg_pmu_btcmx_0p85>;
 		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
 		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
-		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
+		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
 	};
 };
 

-- 
2.52.0


