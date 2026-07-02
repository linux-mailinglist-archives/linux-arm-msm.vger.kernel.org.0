Return-Path: <linux-arm-msm+bounces-115901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UZXsGVM/Rmr1MgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:37:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCF16F6025
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:37:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=a1zfGfnZ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115901-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115901-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7553A31C517B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 09:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F25847F2DF;
	Thu,  2 Jul 2026 09:48:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B5047F2C8
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 09:48:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985721; cv=none; b=s5jzNb+MWAliR9OkwrhCNdmB18XFiY6Z42MPR5Ksab4Pw6un5RSPmd6dsLsoULcz6CTLU3yVcLPbg0/splOAtu00h4RrgJaFecnTNe36EVRs2BsJif7g7Oav0a5AibPFddQ4Tdu8iwG6FhJM4dKMuqRAazJ+mJC5YBj80WQcws8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985721; c=relaxed/simple;
	bh=Vh1RRcTefgGlGwMM3sWSxsMTJV2LWf4YqOpbDDrXFCc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RzokAkk1ehQwwUOVOc13Sy0rJrEvYZZDEET7Ac/PlmgPOXn0zsWra43bkG4/rOkiD7iE6b1Woc5PMApA+OXemrK+zMmQH30vDZXSYMK5v7AtXkphvK+9ggXPqc7RF82lLLb8nYgT7u0IJK67Yg0ypaQ3R7b+vmsLJLnUV374um0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a1zfGfnZ; arc=none smtp.client-ip=209.85.221.48
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-461edb387ddso1485847f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 02:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782985717; x=1783590517; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kN4Ek61pglGfbk7aWausofDUuCtDymbVtSXWqrPaons=;
        b=a1zfGfnZTuPiLQlom7pCPz64vW8qJGAxw/qJ5ufbQrBo8NwLORNOKdHfPclMJAD9Pf
         d3Id8peiXJZKZx4fn4oacRJSL4FaERQ/0WdaaQ00ysnZrV3tcDFRTcoTui+E1eFIgznK
         rVUgajH4UjdgFdIwhoCOVBiAPqgt7/iaapcUews2MOM6Sj6Hnm6y2O/FKOGwFnWRqoM4
         B8QPRWwnYpaZYBJo/0U/2Bllrj6mJQY1pGPNgNImUXpa+Q//GeKb6dyB4y2bnPLwAnQX
         NdXZc3cxwMxbREFhqJGI+cE2YUc/nGZZ6LfZ1Z4tKca+pGit01um365s7t0roY2EItyo
         XqAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985717; x=1783590517;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kN4Ek61pglGfbk7aWausofDUuCtDymbVtSXWqrPaons=;
        b=h8CQ0VmqPEZnGKcDKdG2HeznXbFDpwkoauLC3kO1mk/En/sZtbDbGKm0v5VVGLPRHS
         BmB2lcavjoaZlLEzrjXP/XUQ1QDB/KqawTz9y2JFatF7QheIw7xEOZ8gyO04i7ivapAX
         wiB8Etb4twjfb9TPZR3NUHp+goZcgNEBLPTEBFeivAruar/Px8IbGXBB5hrBorGyAZDP
         5Vxlfgw3GY6zc4uA66DSy05MlmJi8WoZQBn6oT3hSIQuFjlTZFk5BtF1sP15VVgtROOn
         +peEZwxQzGoCYCE8Dt4QD2L0g+ozTD1eWaqwFt7WFHUy2u2LqjG2IsAo6CuwmYgDuWwT
         FxMQ==
X-Gm-Message-State: AOJu0Ywz8WyNAzSpg3HkgfEX9ggmbHLTp2xSBjjqr3W74OavzxoFI0ul
	o9d2sl8pad1pXHAdSBJXKetv2Mv4dAm199hUw5J6zdivBAJv1V4LzQDJKemaZQmf6dg=
X-Gm-Gg: AfdE7cnNNwMcJBVjQDr/doVIs1sLnhKEqpyI+SdQCIiAwE61LP/ljz4Gtm//sf+OMwy
	AM4+F+Z2LXKtDDV+z7DCkDZUT8/sp5w+jhmnNUp6I/ga/E3dJAjvUmiWjLnqGSLX9JN125a8Sjl
	ppAuJLxXbv5ePrP8q68rBRUh0vVhTq0Xra3kgNGFxAxhf9Kp2WbRLl558o7JGD98ue0vx+r8/YZ
	fUuah1bbGKnVZuhmd5Mr44nvX6xwh27sTWm9B4G/Ir6mx89XfreZMJ6+MNem4ppfD3ZKSTxrWZg
	vNHt23HE82Zdd28eukx6HpoMD/JRY00K2Rsn0NxJt2jJyaU892JrvbXL0hJLYvntG1fhefOQ7yx
	xjIw3/BMeSE/zS4nVzIks/f5nEkxqmvclNTZom8J3UP0salTVSpu1r52FoDUUDxJSr9L8Dcato6
	RvEYt5g2gM2CPy8kPw85vgUMsp5xq09xj5Hw==
X-Received: by 2002:a5d:44ca:0:b0:46f:f12b:e457 with SMTP id ffacd0b85a97d-477af7daf8dmr5284625f8f.21.1782985717092;
        Thu, 02 Jul 2026 02:48:37 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db8a4a09sm7656816f8f.13.2026.07.02.02.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:48:36 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v5 0/5] arm64: dts: qcom: sm8[56]50: add PMIC5 Gen3 ADC
 channels
Date: Thu, 02 Jul 2026 11:48:30 +0200
Message-Id: <20260702-topic-sm8x50-adc5-gen3-v5-0-8169953634ad@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO8zRmoC/4XRyW7DIBAG4FexOJeI1dsp71FVEcvgUNUmBWKli
 vLuxfEhqSKrx0HD98PMFSWIHhLqqyuKMPvkw1QK+VYhc1TTANjbUiNGWE0Ea3AOJ29wGtuLJFh
 ZI/EAE8dgXSectpxLjcrlUwTnL3f4/WOt01l/gsmLtnQcfcoh/tyTZ7r0/RsyU0xwqxriGt0R1
 cj9l59UDLsQB7SkzOzhSCI2HVYcaQwRtgZjFXlx+MOpqdx0eHEYrRXTRdPt63vEs7P9L1EcoVz
 HJG04dfSPc1vHF+H7XNaT15kirRJgE8bR576amx1Fzyvrq3WWfI05LDEHm7ErR4JKCcBkz4p9+
 wWKy+MvAgIAAA==
X-Change-ID: 20260427-topic-sm8x50-adc5-gen3-edf94fbd335b
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2595;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Vh1RRcTefgGlGwMM3sWSxsMTJV2LWf4YqOpbDDrXFCc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqRjPxs4CLUhyHvg9sXRzfQmChrBuUUER5ETybl1mk
 db8kJsmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCakYz8QAKCRB33NvayMhJ0Wi1EA
 CC0H+NwbsxMupjEAm3uI+SHtejnoIaS7Ui9OAXLOHfdSAko5cWst9Qrxbj54ZY6HwLqj4hD1IocJ3o
 dqZqUTSeB6lkyG47L+dxq56KAoJCzcRhXA9tyFkdS2uHC93PhVjbZsbMi58/PmbiH0/pi9y5DFnAoB
 InjoLpueCDhUB2dVkYKsdOF2wE4sneng9Rk3Rz7TfkEWebQ5yRYBjV59m9CBj5wGL1OMyM9GkfHuew
 bXAIXFDHVJdo2tc/K7EADFZTJ3hfc3ghvAWRyljN6burorUPDBkcrHBxV1EsAYQhytOvVyMmMqGDAK
 IIgTqNsqpkxHBpD6d61IuO8wMWsHkdYddFCrVqk38wofXSz8/reMjdGeo+GsyZRMK/eZ4DrAlGFr9Y
 3jGE4aafc1V1Mbigo0XGjHR7SLgzIvCXdxAQH2S1oo0775I7faWyRICGcycCKWGKUif6DrJZzvMvTJ
 Md6xNZu7dKvk6yLpqv9h0WQu+AHbJq/TNTlKWA1SCuRAjIak2eKG9EKV0OmIg+NstMJfjbBWr1ywMD
 V8s6+0LfIUFQxNBSX5XAUVk2iEBCk1C3nRytVgO6kmrKwrV6Q/J43fpT8ikis1/ol5+ag0SsCaACTP
 rO8v02+NBz0WHUelMpS8MgG5s75WDge0C+atujCnP8jucyOBT83JfvqtKOCQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115901-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:neil.armstrong@linaro.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,msgid.link:url,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DBCF16F6025

Now the bindings and driver was merged for the SPMI PMIC5 Gen3 ADC
found on the PMK8550 which allow reading ADC data on the PMK8550
and other PMICs on the system.

Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
other PMICS on the system.

Depends on:
- https://lore.kernel.org/all/20260614-adc5_gen3_dt-v2-1-32ec576c5865@oss.qualcomm.com/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v5:
- Reorder adc node, move interrupts and use -extended
- rename active-config0 to trip-point0
- Link to v4: https://patch.msgid.link/20260617-topic-sm8x50-adc5-gen3-v4-0-4af9251731f1@linaro.org

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


