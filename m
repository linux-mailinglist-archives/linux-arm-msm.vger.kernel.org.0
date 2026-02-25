Return-Path: <linux-arm-msm+bounces-94103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKu2Os/pnmk/XwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 13:23:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4062A1973BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 13:23:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 16B8530360AF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 12:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 358133ACF1E;
	Wed, 25 Feb 2026 12:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IccTMrUl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B403A1D04;
	Wed, 25 Feb 2026 12:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772022221; cv=none; b=NI0X2LD7YSdLgOFHlWS766YHnVzw90kJI5fhJVvwh70H8J8wR4wH1KbzNG0NgjL/4vATITt3EBLQ0ZWwRQ5JdRkeCAHocVsTcL7dxAvOdpOBMYWn2Yl+XEybBWc9lxGtSH2PKjAjgkriiyJE/+4hQm9C+kOxw2JxL+HRFI12JbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772022221; c=relaxed/simple;
	bh=hMU7ZBz2I6X9lqbW6Icu7jcBi1PXsB/AT/siiV67kaw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q4lc5Vsb3I1ZkDfdaCBf9z4sIFhVxTRRsYSkznfljw4Vq3fpdXcD4aaKljmP390FcUobg4072wkLpzA4vyOQ3Evnq7PNeKLu3eJbDB34ejOJcxO0DiQdbPEsWmC1kiaBs70oxN+dzADXX0XHmEQays9hhhlcuSu6imF9qsSgNDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IccTMrUl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BAE2C116D0;
	Wed, 25 Feb 2026 12:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772022220;
	bh=hMU7ZBz2I6X9lqbW6Icu7jcBi1PXsB/AT/siiV67kaw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IccTMrUl6RuD+bNTdXg55j6nNcQBIC5FUViVQTcMgWWRlM0Bg1G1TOe6ukm820CUS
	 yG3zk+A5B1oFRhOVc1H8TXx3HdC5gA5dw2SRjU3mWUWhSLIDOwUi0o82d5LqeUWLFE
	 0o+PZs3lLJ+ioTc6X1cFzv+h06+7pTUn0ED7GVlZitm7oD6KxBiD2fLTsZNJjj2eJn
	 nJVyEEguaJ1XaqWPCWH2mFRc2GNTAo6Uc9PnCLOD+mFRUPKgSlrFRsUKfG9LMFWIvX
	 wDtLyshOyr79sEvp1sI8mkjFDx/L8cIkcWFrcHa+pnD2KJwHrV72SQisxVpYesC/n0
	 k+7D0dJMRrYfQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 25 Feb 2026 13:23:21 +0100
Subject: [PATCH v3 01/10] dt-bindings: net: bluetooth: qualcomm: Fix
 WCN6855 regulator names
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-topic-wcn6855_pmu_dtbdings-v3-1-576ec5c4e631@oss.qualcomm.com>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772022207; l=2166;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=mSV6ZB6+UTEhWhUmPjgCR04fL8nG74mb1dDGMZiyRjg=;
 b=xtkaADYhs5VKMXZklPxf3T+QktF5tr0VUtA2qJz73p8Wrm+hQog/P62lbWI3CLhsmktuS0AbP
 xaznLmM7OdoCZGy7VK2hZ1o3d/JQ30NhUszMX/oGKlU8AkiOlXiRVhb
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_MATCH_TO(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94103-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 4062A1973BC
X-Rspamd-Action: no action

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Commit 5f4f954bba12 ("dt-bindings: bluetooth: bring the HW description
closer to reality for wcn6855") changed the vddrfa1p7-supply to 1p8
for whatever reason.

The schematics footprint for this chip definitely says 7 on the input
leg and the driver still expects 1p7. Bring it back.

Fixes: 5f4f954bba12 ("dt-bindings: bluetooth: bring the HW description closer to reality for wcn6855")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml         | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml
index 45630067d3c8..0beda26ae8bb 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml
@@ -50,9 +50,6 @@ properties:
     description: VDD_RFA_1P7 supply regulator handle
     deprecated: true
 
-  vddrfa1p8-supply:
-    description: VDD_RFA_1P8 supply regulator handle
-
   vddrfacmn-supply:
     description: VDD_RFA_CMN supply regulator handle
 
@@ -68,7 +65,7 @@ required:
   - vddbtcmx-supply
   - vddrfa0p8-supply
   - vddrfa1p2-supply
-  - vddrfa1p8-supply
+  - vddrfa1p7-supply
   - vddrfacmn-supply
   - vddwlcx-supply
   - vddwlmx-supply
@@ -91,7 +88,7 @@ examples:
             vddbtcmx-supply = <&vreg_pmu_btcmx_0p8>;
             vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
             vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
-            vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
+            vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
             vddrfacmn-supply = <&vreg_pmu_rfa_cmn_0p8>;
             vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
             vddwlmx-supply = <&vreg_pmu_wlmx_0p8>;

-- 
2.53.0


