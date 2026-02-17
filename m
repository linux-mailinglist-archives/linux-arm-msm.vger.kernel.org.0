Return-Path: <linux-arm-msm+bounces-93184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UF49Cq5tlGkEDwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 14:31:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D308514C990
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 14:31:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9B53D30387FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 13:31:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F025536BCE1;
	Tue, 17 Feb 2026 13:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B/b05Bv+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1D536BCD4;
	Tue, 17 Feb 2026 13:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771335046; cv=none; b=il8Me4bmIriBjVL8vHxZOv0deM1BxSiay7N6U3twtwwmZ3wc6wmmoLH733JSg8swTtoK5iHDr/djXuH/ahtHD6BQw2+BSB3uJwCjtTERAmqoApMiZtVIpLKCfRl+LgmVe7CUxqd3O9NKM5hT/opjYNnZ61D4dOd5YNWuxKzRPKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771335046; c=relaxed/simple;
	bh=0M9Dd0azDdSLBxIT5OL+TpdmsfjZf+cKrxgcoZpNdvo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BKhHrUDQLEnofWYHhB+986l/WsOWTC/bkTPAlxq3z4FX+y0ijyZRIiXGXSakdQOGfBZbf2uqO6S1YEYNrwhw98WS8w7Wexohw8NcAOlPyGTW8V+r3EFSAtNXzPwmmtfjYyRNJ8kILg1GeTlnNzlzbHHfIgXOBwFJgjnRFTtWDPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B/b05Bv+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B34AC19424;
	Tue, 17 Feb 2026 13:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771335046;
	bh=0M9Dd0azDdSLBxIT5OL+TpdmsfjZf+cKrxgcoZpNdvo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=B/b05Bv+LfTxbGl5oYUWEkEzZNSr3HgHyWxutJwWPT0s5xWIsc3vPNyiQ5LXrUN/U
	 KD9XCVVN6L1/CzkaABiUEYH0ne8k1CQhtdz2BWwToebV2nPRmjgI+bKCs7T/8nNnz4
	 wOa73/VOLbvTdmtwzuIOQgbHi+OrUbCBWzHF/XuDzto/ETjl85eEqs7F4J+NjyAc3W
	 Zw5eqayTb1dLnRfN1AJ3PZlegJ5kE8bSWViAfnVlOt85UGM/HJZ/4wE2kdKDdZrRkL
	 ExXvTQFbPux/LUxpOm9MWaym5na6WJeoCNeIxaPFBbuXHrQOYPVI8wMChzzH599lmc
	 wa9U6Uhi4ayYQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 17 Feb 2026 14:30:31 +0100
Subject: [PATCH net-next v3 1/3] dt-bindings: sram: qcom,imem: Allow
 modem-tables subnode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260217-topic-ipa_imem-v3-1-d6d8ed1dfb67@oss.qualcomm.com>
References: <20260217-topic-ipa_imem-v3-0-d6d8ed1dfb67@oss.qualcomm.com>
In-Reply-To: <20260217-topic-ipa_imem-v3-0-d6d8ed1dfb67@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Alex Elder <elder@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771335036; l=1360;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=VAi1muvo7JWVgjq38LEgp0VTJgMrkoPVsq0eeChfM0g=;
 b=PWFYj69hN81Uu/g8L01nxknVXA+B3kr8nW/qHaeRNkoq7I6wtPuZgEckqKaNwlvf9fCa+UVrk
 T/waaMzt9J0B5arvPqlUm8rq5hqf6mYFM8xQuyEBeDu8xUzF7ACHrEU
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93184-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid]
X-Rspamd-Queue-Id: D308514C990
X-Rspamd-Action: no action

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The IP Accelerator hardware/firmware owns a sizeable region within the
IMEM, named 'modem-tables', containing various packet processing
configuration data.

It's not actually accessed by the OS, although we have to IOMMU-map it
with the IPA device, so that presumably the firmware can act upon it.

Allow it as a subnode of IMEM.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sram/qcom,imem.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
index 6a627c57ae2f..c63026904061 100644
--- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
+++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
@@ -67,6 +67,20 @@ properties:
     $ref: /schemas/power/reset/syscon-reboot-mode.yaml#
 
 patternProperties:
+  "^modem-tables@[0-9a-f]+$":
+    type: object
+    description:
+      Region containing packet processing configuration for the IP Accelerator.
+
+    properties:
+      reg:
+        maxItems: 1
+
+    required:
+      - reg
+
+    additionalProperties: false
+
   "^pil-reloc@[0-9a-f]+$":
     $ref: /schemas/remoteproc/qcom,pil-info.yaml#
     description: Peripheral image loader relocation region

-- 
2.53.0


