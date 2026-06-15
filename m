Return-Path: <linux-arm-msm+bounces-113229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y8/HDUguMGpEPgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 18:54:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DCC688924
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 18:54:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=wyUAz6Qn;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113229-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113229-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 020E430E6BB0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 16:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77C15410D1B;
	Mon, 15 Jun 2026 16:49:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D87D40F8F6
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 16:49:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781542144; cv=none; b=Hr9wO4dez4W9jFsoaSOdgQ3Ko8iJ+0Ddg0KG6LKD4dVerUwHCUz3WwSUoQ3dwSxQW7UlqnRMREQZDOKH/TL/tCbeEmy3jZu2KOR/vXXZDHuLpqxlBv/D4imJ3/YDrj2EKjc9to7HBQZywa6r2tVzBtEBN3n+4pDHX7a3stvlG/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781542144; c=relaxed/simple;
	bh=BLYP69on+acONkpbj7BDPcs9Wrpg/jph8ahC7zS8284=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PU7Ul5HuRHm2U25KyZ+DN1Uf22Dl95F2U1PQaV2Q36QzQNNRs4PgjNWJIJLnakAg+erUeUIZhSsuIX8inozLQEgEklTLGQ8Q9eiMXeTbJtVTDkzakIdQZK5DN7Bhv/PljRVFIkBcjUZgCZd0tAaxCqlu0Plkua8emK3gINms9Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wyUAz6Qn; arc=none smtp.client-ip=209.85.128.53
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490bc6a7958so36817715e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 09:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781542140; x=1782146940; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sQ1dZAWMIqT78hOt+sG6oi20VAgpv8dyMe6SBppclyU=;
        b=wyUAz6QnSrGFFbhxDGrUz6AbxotOkGq8Q7cE8WjKh5KdVhZgyrpoNvElA0b1xaW3h1
         bbCuMWNPoqEEw1l8Nlw2uyaG32qqNQ46mT/UZcyULURV/w2QoSGkZg7bmyFYNElSmVnH
         fgYdPXdEfkAIVP0Mxg57p1Qb2EpJLKe/S1HpZeO/EpNCc3iJKIV5IisLAJm2RgMg0dfd
         KDNjcJGL+Hykmr1MivaI94Yh9XIXVeTQNTGgx5il7g2LlZHMmAEtF46O8TaJWPgbNQSq
         epjn7+nzFvG4qS7KS3luMiFPn9iWXFBx+PIAN8OTeDTlOCSH6zVUDVTphMvDgmwneCOZ
         oDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781542140; x=1782146940;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sQ1dZAWMIqT78hOt+sG6oi20VAgpv8dyMe6SBppclyU=;
        b=WJFougc4i0aN7lvoF8/LHGMC0v6lfBA1PhGynDn1q9Cp9tZGjJIh7MljKtQKllVuOZ
         4yp8SbuyLxNuxFHdejgBkTTRYS8pKzgzqOEeGBuS6luXhOabjG6X8EUYNrG0c3AVAPuC
         UUb8OboFcOav0N6DVudPl66e0RvJ1/RUrguL0YkJD7GCY5TvcmduTp7Dl45MCPqBFpkd
         2upaIEcUWvoVMXdqErLw3LdiSpS4XfoVDNoeyludVO3tTztbOsXkRFO7bXOm7fdHBU6q
         eIMEe/BXOh/ZaTVOSasxTL1076gEcxXztOL3dkWwfMOdIlEBr6llMgsh3pI4K/f0rRMz
         yD/g==
X-Gm-Message-State: AOJu0YxlGU3bY0Yu3t55RdOJd8kC91cjkaYXbLBBdFOmgIsxto3U3QTJ
	n2AbTLmYo4VgCMMhj9tSI+FKgoyU830VNtb5hJw5nbze2KPepPQfIPJJlyg6jEMm/UF80yGt/Dm
	95HvHKug=
X-Gm-Gg: Acq92OFOprRm9tBONET6MuuM6enWfioiRSao3LhgrK4RpbKOYv66xDr50NZpc6NTrCb
	OA8rgeLtmmoSw+pulGkMESNDLAmy7UXGb2FlEWfkquc2M7pLwQdguOXGO9G14+hA+ZLrglFCnCQ
	vp9D2kNuNoMpvZUopHwzJho1mFjF0p7p8a92S1ipl8nvnlNlGH/MqRVmDNl1jmlIM7MDHH4bluk
	IiROfwRWwAP2UpHouRoE2T1U/yYkGbt9U8TTtF8lu+C83EdmcegeTRehCpTcUGCSoY969n5qPQ0
	vW4Zc077RISr6ZHk86mmJFMCgVg7NLYixEyPAfCRLIaAdFh1Ju+mFPF+Q4pWVVH+taJJi3xpXE9
	5q2y+ZAufXWGJlmHNzVCVCrXmgoyN7GHrAlYuUbRCrIMVcsuD8BWwxXpUhRc/v2lyUh/hDGC9ci
	yXBlFSPc2pBU24dEZltwWKY3B/42SMEjsbZzn/HH9ILWwf
X-Received: by 2002:a05:600c:6c10:b0:492:1e36:9a90 with SMTP id 5b1f17b1804b1-4922fb09049mr3353075e9.18.1781542140287;
        Mon, 15 Jun 2026 09:49:00 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa58f80sm5670735e9.11.2026.06.15.09.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 09:48:59 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v3 0/3] arm64: qcom: sm8650: misc enhancements
Date: Mon, 15 Jun 2026 18:48:55 +0200
Message-Id: <20260615-topic-sm8650-upstream-cpu-props-v3-0-eeb6e9fa7581@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPcsMGoC/43NvQ6CMBSG4VshnT3mUP6Kk/dhHKCcQhOhTQuNh
 nDvFhbjpOP7Dc+3Mk9Ok2eXZGWOgvbaTDGyU8Lk0Ew9ge5iM468xJQLmI3VEvwoygJhsX521Iw
 g7QLWGesBqyKXklRGmLKoWEdKP4+H2z32oP1s3Os4DOm+/m+HFBBq1bYFKaoUVteHnhpnzsb1b
 McD/4A5x98gj2ApasKqE00r5Be4bdsbahn4kCABAAA=
X-Change-ID: 20260128-topic-sm8650-upstream-cpu-props-0754ccef3e01
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1094;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=BLYP69on+acONkpbj7BDPcs9Wrpg/jph8ahC7zS8284=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqMCz58NhdAw5qQ8hzNTZ0av58CRBe/QJHRSJ7gPhG
 gFVhOIeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCajAs+QAKCRB33NvayMhJ0dW3D/
 9OvD1c3Ry6pRrTJMAef998mSW5c10VJ4IS7GGGjIrqZyCditjiXWlVQ0NxR8m4oTWLwivVnaJBHiei
 UAu21HK8AdyHeX0mYmz/mQ+ZWh6obsc/KhTMFts1TXOG1hobfl2xLyaBjhoLaGPsCdEFPtv0RlY8IP
 rc5AfemYzFTVR3l5pWo0MvD90AfRI0AMEQGIR/09iR19yp90fWXiboR6IDfIZn6AXrf/Uu9e5izHsz
 smL9t4KrJuMRdSFAGTTjEys5F+RBD2NOTYP4xekgPmrrklR8RWaT+MF3xbqSjwI3qfYvjRWjGVVwaq
 3z4v8uciFW9j4cQmAtFOD7TN25z2cyHBfXUPRAxIGtCrVYwLepiC/IuE/aBdxkd6zxZ6MH4dYbkHbY
 wHkVFaJvK5sOQhpz2z3woGe/Nolfc0XSwongfdD7iHmTwXQ8rVDWXRvvmWTLzKt6XP+R9NIRj4m2BL
 4bV6sAMO+GHXC526GJlkDFtYEcFh2UfDNAkEoCYjGWdmfEIEIFnm591x6t+w2Xg/i7W8rcfXc3qvv/
 KBrJWoRY2hw2n1EDmYzTw6NNEmELyP9pTl6IWb7tmEfCpccJo7fybzYluaJ70j3yB3oWi/LYcgIv53
 cH0WZSYV3zl3f+/LSVcN0DT74XffU1Ud6SyBLV88tebyOu/cgFLOg2a7L3eg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113229-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:neil.armstrong@linaro.org,m:konrad.dybcio@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime,msgid.link:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E0DCC688924

Misc enhancements for the SM8650 platform:
- update the cpus capacity-dmips-mhz
- add the CPU cache sizes
- correct the soundwire ports

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v3:
- Picked tags
- Rebased on next
- Link to v2: https://patch.msgid.link/20260420-topic-sm8650-upstream-cpu-props-v2-0-689e07d8ab8c@linaro.org

Changes in v2:
- Add review tag
- Fix l2 cache size to 512KiB
- Link to v1: https://patch.msgid.link/20260128-topic-sm8650-upstream-cpu-props-v1-0-9fbb5efe7f07@linaro.org

---
Neil Armstrong (3):
      arm64: dts: qcom: sm8650: update the cpus capacity-dmips-mhz
      arm64: dts: qcom: sm8650: add CPU cache size properties
      arm64: dts: qcom: sm8650: fix soundwire ports properties

 arch/arm64/boot/dts/qcom/sm8650.dtsi | 110 ++++++++++++++++++++++++++---------
 1 file changed, 83 insertions(+), 27 deletions(-)
---
base-commit: 8d6dbbbe3ba62de0a63e962ee004afb848c8e3ac
change-id: 20260128-topic-sm8650-upstream-cpu-props-0754ccef3e01

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>


