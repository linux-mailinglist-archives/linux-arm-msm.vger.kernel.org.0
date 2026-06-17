Return-Path: <linux-arm-msm+bounces-113633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Qc06KuWYMmpI2gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 14:53:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C25699DE9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 14:53:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=M6ewIPAD;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113633-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113633-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7439E30120E7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:53:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B5973FAE15;
	Wed, 17 Jun 2026 12:53:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B23B3EEAE9
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 12:53:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781700835; cv=none; b=qci7P13yU1pO5QxLXtnhR/3k0g3V6FmuTI4FeTLETkP8nav01+RUnnXVPRfR8R3zvtw1RbU94fOpUn49KF1/x0nfBcUw9c28TnOPAZFH7qyg0NZxWf6uusDDhufmCX3xXPjOakwELBJhucMz6HaivEzB+dNAf/8ZRiCFmOXxnlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781700835; c=relaxed/simple;
	bh=cWBkvZeiRKEJCaz+cZFQiB4EkEoMdRQvxH1u+mCb8tM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pAWEJDwMO9Y6SUVaYZw8F7AVNg1klo/eVUclp1XraaXcTngmAp7jn64GqQK9lgmgB7MAi3sOhF8DZjIw6byV6g25cN2VB6ra8UFf2L0hZSGFVAavHLu77Smy9PAV+Sn7ZTsPj9s4O85xusdg0QBn3EqdWxXM2aDjoumFMXDM8Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M6ewIPAD; arc=none smtp.client-ip=209.85.128.44
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4908b92904fso71289385e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 05:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781700830; x=1782305630; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YUOFRibVcM8aA9c2a3V9XQAESUorPpdInVtdjMb3cCE=;
        b=M6ewIPADAModFcEfYpXTAM+HF/fQHEOWqSwhmbYr/+FQfxvb28k3b8mQ+z5cArjnIW
         /KYul0lOkvae6EsrEUZWsDnqNx5WzzgVj9eKkqJk+3PUncCfSP/op53k7rWTdpUxGNC5
         H8CrUz70tUv9P2TScq1Uaco8wm1fVjPuElifGJZEWB2UAJzWNhaAaLfhsyT2Fjx4W9TK
         bm7NZFfHuEJPl7s/b/IuFGDVXM1wmrrdOkJIQReyoiWkU9e49xpgroGkWIUBRN486bgF
         1lmLQhs6qaLoCNWko7urqt4TUwYN0butn0/De1yftPGa49gUVszovXOgPwXwWLTpbhow
         ElgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781700830; x=1782305630;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YUOFRibVcM8aA9c2a3V9XQAESUorPpdInVtdjMb3cCE=;
        b=Z3MUmnp1Hcv3tbpRHnkXePq6xUTPU7bDUBUfeeRFCoNbH4+jNusd/z9CWBkNVB41pl
         gOedsf1IMiFXYJuZDupvQaEIywKigGnPVH0jYU6UmKMoegx3R66+6c3yNNdJ66sISriC
         W2uh+9+1wc8g5A8OuAUpseZqN6OA19Pqtl4MGE3t4f6EEYASoi3WOI1P15Q1yRoLo6El
         DfP1Bao9W0tPCUNyGZAlQBEqW0lAsVm4RN87uObzMnsTVwB68MKCFv6NGui61dLZ6O+v
         TiKRApihzYoLjS9Yd0UQpe+UFkxPiig2g/rC/rPbuJvlDDo0urA50JjEa+QLv4Qnb7se
         rq3w==
X-Gm-Message-State: AOJu0YzTm7QHF4JAEGvWnwQ5UH3UFovLqxddbUvU07eRi0uGW5HyZPuI
	hprv1+8nBZR8Og3VzytqfqbfbrsyexOLNiDI3algJb1AmFGLSLpbAF0KkOwvpOZKuf8=
X-Gm-Gg: Acq92OHKfGHbgndQDQn8KwQnLQz+RLHMazemI/G4pvgspyeLMtusKwI5CaQfwZSXBn5
	kCWL7Co0HzyuLXoqcCvfoTsTVYB3BNHLUzVd54UIUdB+Rflp70ZytvJ5otKC2atZT+nImMlzZWH
	bFPwux9mr+M4JpU6GxulLopAUg2YacZ4S0F0bX4yHLtngN1MPPYAfNU1fnv/JZCxwYgpvkNvDDL
	L/TNPa7hT5xJGMfZmsSWC5wKd/s3EgWnTvvPEeirApLgUIT4Kju3eGRAsYMNfLFNxWZ9l5Aulcp
	xSKiZ4AHHSN9lOu12OPGMd2tG4psyrZ9fLqqrUuj6zfG95oDH9O1AlAmFJIbVFMuXue/MwOxeH4
	WwGoZPKzwVatF3uP8K0ZWMjWYLFeAZbOTDzi2xjVMWIn9FECDQLnrd4DEJPeMLfTSvGNP4KlN/e
	+LAXS2Rjd4MKcRNbjyU5KDbagoYvBKJ3zmQw==
X-Received: by 2002:a05:600c:314a:b0:490:6e11:c303 with SMTP id 5b1f17b1804b1-492341046c4mr48542565e9.13.1781700830349;
        Wed, 17 Jun 2026 05:53:50 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-462236047c8sm9130562f8f.10.2026.06.17.05.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 05:53:49 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v4 0/5] arm64: dts: qcom: sm8[56]50: add PMIC5 Gen3 ADC
 channels
Date: Wed, 17 Jun 2026 14:53:44 +0200
Message-Id: <20260617-topic-sm8x50-adc5-gen3-v4-0-4af9251731f1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANiYMmoC/4XQy27DIBAF0F+xWJeIp+14lf+ooojH2KGqTQoEJ
 Yry74V4kVZV1OWg4Vy4NxQhOIhoaG4oQHbR+aUM4q1B5qiWCbCzZUaMsJYI1uHkT87gOPcXSbC
 yRuIJFo7Bjlsxasu51KhcPgUY3eUBv+/XOZ71B5hUtbpxdDH5cH0kZ1r3/g3JFBPcq46Mnd4S1
 cndp1tU8BsfJlRTMns6koiXDiuONIYI24Kxivxx+NNpqXzp8OIw2iqmi6b73++5r98O8HUutaa
 1C6RVBGz8PLs0NLnbUPSz6qFZO+BrzKHGHGzCYzkSVEoAJgdW7Ps3+aFWDLoBAAA=
X-Change-ID: 20260427-topic-sm8x50-adc5-gen3-edf94fbd335b
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2381;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=cWBkvZeiRKEJCaz+cZFQiB4EkEoMdRQvxH1u+mCb8tM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqMpjaTZ2PSk28S+Lq6jvx5m90GW5KFTZhHHMMjm9S
 4bLVP4SJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCajKY2gAKCRB33NvayMhJ0Zd6D/
 9NuYdSQnGVBHUWG4MeXucESSg0Zc8Vjzr0AVCa7YYZcjLIT3oLDNNPhZz8ytcnMpeogjtRJXZexsJP
 SnCwmG/ILIiwk9gbVM7JUWIPm3w88Nwczf5x0db0X7xle5YyL4uJyjrHXIhnKwE+6FhWm0nrSVj0JK
 rvgwek6WvThaEWYkfN0RIpP/dMsa2zl8hYGFMjGJrEwgiIoDUPA0vnV5dgDpvrUR2QmfW9Bq3TA/ks
 kww15Nzb/MeM+5aXUag5/kzVbxzP/V+rQh1AIkXsDmhhZAwmD0FcuReDw9puQnZ/ZueEkzaYvd3pCq
 /XWPxYzqRC9IIYfe2IK8ilMbAYhzYgsGrnG+Sa/Ug2PPlEdVF86iK1iryfDsJepjlZoXs5YhG/Evj8
 SVpGYT/ulifk0fZWRW9lk54JG6SrwDduW/kybpwsmtpLn1peUfc9rxaCiAaXoxRRdLUT2HR0cx+zXN
 TdXcZKYKRKU6T3PmRCeEkn9fTxqZ0Z94zwV9TyrAcTAyvPc/ZfVmLN8ThKX1ZVZtqg5lSkrEQFvbpv
 QKclve6IQV5zBhLKAwGHv7EhQEIGnFRuFam1L4rnEMNWYfAVYvW4MRnjHJJ+t2Ju+Wtgn6/Psc6BRb
 NLtrfabs7dwC3HkGPgLWhSfb84AR5Xouefd0SAjiWb1thINs35YwlqrfHgkg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113633-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:neil.armstrong@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 63C25699DE9

Now the bindings and driver was merged for the SPMI PMIC5 Gen3 ADC
found on the PMK8550 which allow reading ADC data on the PMK8550
and other PMICs on the system.

Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
other PMICS on the system.

Depends on:
- https://lore.kernel.org/all/20260614-adc5_gen3_dt-v2-1-32ec576c5865@oss.qualcomm.com/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v4:
- Rebase on https://lore.kernel.org/all/20260614-adc5_gen3_dt-v2-0-32ec576c5865@oss.qualcomm.com/
- Change all defines
- Reorder nodes
- Link to v3: https://patch.msgid.link/20260615-topic-sm8x50-adc5-gen3-v3-0-216a2b5ccb85@linaro.org

Changes in v3:
- Added note about nodes ordering in commit message
- Rebased on next
- Link to v2: https://patch.msgid.link/20260504-topic-sm8x50-adc5-gen3-v2-0-5cc04d6ecda0@linaro.org

Changes in v2:
- Removed stray line from patch 2, added review tag
- Added missing header file
- Link to v1: https://patch.msgid.link/20260427-topic-sm8x50-adc5-gen3-v1-0-8a70f7b90a75@linaro.org

---
Neil Armstrong (5):
      arm64: dts: qcom: pmk8550: add VADC node
      arm64: dts: qcom: sm8550-qrd: add SPMI ADC channels and thermal nodes
      arm64: dts: qcom: sm8550-hdk: add SPMI ADC channels and thermal nodes
      arm64: dts: qcom: sm8650-qrd: add SPMI ADC channels and thermal nodes
      arm64: dts: qcom: sm8650-hdk: add SPMI ADC channels and thermal nodes

 arch/arm64/boot/dts/qcom/pmk8550.dtsi   |  30 ++++
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 277 ++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 277 ++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts | 277 ++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts | 277 ++++++++++++++++++++++++++++++++
 5 files changed, 1138 insertions(+)
---
base-commit: b3f94b2b3f3e51ab880a51fc6510e1dafba654ed
change-id: 20260427-topic-sm8x50-adc5-gen3-edf94fbd335b
prerequisite-change-id: 20260430-adc5_gen3_dt-f0434155ee25:2
prerequisite-patch-id: 42a8f026b28f4f1edf4932ce99a86ced84c4cc41
prerequisite-patch-id: b370a1d9b3c61a0031e10db2aa9c7779e0a26e14
prerequisite-patch-id: 179d8932fff0aef7eb84bb7e731597f8333f4427
prerequisite-patch-id: 2a2e07499d57f0497c7ce757b2d74077ae4a843a

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>


