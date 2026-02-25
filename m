Return-Path: <linux-arm-msm+bounces-94104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WB/aISnrnmk/XwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 13:29:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FC2197592
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 13:29:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7534E310CC3F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 12:23:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C15763ACF1E;
	Wed, 25 Feb 2026 12:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aqPWUOrU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2343ACEEF;
	Wed, 25 Feb 2026 12:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772022227; cv=none; b=hhKGx7HEgeye7RTywlwYMwqIhoLe/OiA5+cIsIVmSlOnO7IyGT1Li7JGfISjGZt7Q/XU+9R4+VKY4d1SyfU4qV5shjFl7kcpgNzmueZqZUgepMiG/s/DMreJ4RupjN1WCP2pZWWeAmmhKMmeDutSr1VHleHj6ONfHih/JnkJKBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772022227; c=relaxed/simple;
	bh=IpWeYGdKooURHgHmsLF+EBdUMykTa9EkrHqqEy6kyYA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZX2mIX5KUrm2RU1L57IqWrwAML+HLyhRUy8TY3VzIuCtkeIGNecm0nZ4OKvwLJ7z7S9OWGTYCHvREm3dfEGRPGZocy9SrgeQ87TfuMjVfayM3zaPnrXiOulOr7INdMi7BaC26Z6NS9auPqaazDzHsQ7JIk6rJYDF91zUmSK4wUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aqPWUOrU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34D56C116D0;
	Wed, 25 Feb 2026 12:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772022227;
	bh=IpWeYGdKooURHgHmsLF+EBdUMykTa9EkrHqqEy6kyYA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aqPWUOrU7fXm4CXhh2uXlTDeoOuv9tktdcbTVL27Efe5FRchV9JgiTj+Oy1NjT/Kt
	 G1vSnLWKGcKCFy4xRjORcOS25S7Y+qsZqN+11ZGkbNuIlKXhww2OFLp+FUs2q3QkuG
	 9PDo1DevvLu4mE1tQVSyEAlRGURATpb9Jc3FvzsjTseZRK5UzKgN7Ev7yANdmO9X4c
	 d5+Dnu9xHperlEFpSFML0UbpMIxGAzdYmF8LqKHGdDOg23RCOtHybWI8DaNblaq9ah
	 NJVUlAODgLJUyO+j4nruSCVDCMPt7GXP05gTRuMFn8cc2SNuTzfLTizK1KqrPq0h2a
	 kkFaKYSTzSGng==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 25 Feb 2026 13:23:22 +0100
Subject: [PATCH v3 02/10] arm64: dts: qcom: qcs615-ride: Fix BT RFA supply
 name
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-topic-wcn6855_pmu_dtbdings-v3-2-576ec5c4e631@oss.qualcomm.com>
References: <20260225-topic-wcn6855_pmu_dtbdings-v3-0-576ec5c4e631@oss.qualcomm.com>
In-Reply-To: <20260225-topic-wcn6855_pmu_dtbdings-v3-0-576ec5c4e631@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, 
 linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772022207; l=930;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=BWpDm6xdEfEBqpcjc1Ndl64Pv0YBayYZ//C/tGLrpZY=;
 b=txfQNj34ETC0go5+AzwAP+wuLYSHPGqK9M1wrQP3rZDfvNW3w7fApMPZi2PwR7L5SE9lRLj6v
 /bE9z9PXX7NARHs8D8MSvAVK91Mx9fwCxqTvB0HaUhmEQysd+KmS94n
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_MATCH_TO(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94104-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,bgdev.pl,holtmann.org,gmail.com,kernel.org,quicinc.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E1FC2197592
X-Rspamd-Action: no action

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Fix up the supply name to align with bindings.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 5a24c19c415e..3c204ccba052 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -628,7 +628,7 @@ bluetooth {
 		vddbtcmx-supply = <&vreg_pmu_btcmx_0p85>;
 		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
 		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
-		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
+		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
 	};
 };
 

-- 
2.53.0


