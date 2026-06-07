Return-Path: <linux-arm-msm+bounces-111569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1H1tFQ1YJWoFHQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 13:37:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6067650774
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 13:37:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=QlyX1pft;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111569-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111569-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DAD433015891
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 11:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DE7038734A;
	Sun,  7 Jun 2026 11:37:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FDE3112A5
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 11:37:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780832246; cv=none; b=UI+N2kC1tcs6PERWHHpGAODl+BZH3A8wxj83jt/jVfGQM3Gu9m0I6RH4bt174B8bQujayKUH1RCCiXlxwFCGhNy8rl4rbw4P9tn2FTx6qs7t9GIaVjNIOYAa+jp2oQHwLPgQfJI8auRVXkAYxum7VaizW3UCbudqkVJioDYCYq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780832246; c=relaxed/simple;
	bh=mvbYsq6s7d7W1oouiNX7rgDJWbcpYrxcLw9VH/gGvVU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mRRifAjHhsU5MpGjTAVT5GmtGpq7xgFTrVGK+BT6UwF9eI3h7IOp+BUaiNvOAhmlLTTAGe01DXf5prxYC46xaQPkPfvD9+dRSFcKQNm1DodEELparXisM5mQ0G9brTnUkgtxosAOkJFfNAgx5Sy0BeWr5L+UnfYwWw9Nbpq9HDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QlyX1pft; arc=none smtp.client-ip=209.85.214.180
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2c0a5354da1so27176305ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 04:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780832244; x=1781437044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3pKNoUwm+VouMr3Z4tAY1A3s0+1K7EgEZOm34M+sxQY=;
        b=QlyX1pft3k38892FqvdLHVROFQuS6Qc72A+e4aTLWwcLn6cp3iw+78AFO+00c1RBb0
         0guAcTf6F6D5tkxYg/wmtzdPcrn8t4EXb8SwOSKciotPB9WBW8rKCzfYpN3zpX7JhLgv
         Pz8lbhYmHkAUhwdEOeZvM9pE6qoG1SZx5dpD9U0E843FvZ8YK+4vh47p6vYFGTQ8GvJx
         NdO/8/4iBrhyJsiL4EazcUOfVawRrHVjNnE98JmOWFSqJP9yN1jN5dndsNgr68Nq8qv1
         kPYfqkjhC8ztGmhrVEJFfJoGINn4G+CrxySfAtVHVSsjesLtLfqnVkUzFcpiCwiSmPUl
         xhcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780832244; x=1781437044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3pKNoUwm+VouMr3Z4tAY1A3s0+1K7EgEZOm34M+sxQY=;
        b=g7OR6m113ubHekW9dE7s4N1vrHdIMN2DDusGMc36VlrTFG/mctFlKxdJzoz7A1oLV5
         FcmtknPSrDJvuTZHn1v/6Qc00kyvT7lpUgLuJ0QUNzopmtI9qjGHoYopwywNoGpkrdXw
         llUGa2Pg1oMbX2bTWzlp2l4wvjUuO5GAzskRnjbO7a8muCvsGpXr6KR859P/bQf0KKdM
         l0s+XvPovYDseDYDGJIsULQtO/9QXTs5U0q6toLX/h2wo274ROrUS0HlBtB5J/9RDPHj
         u9fTC5fbsEtX56MPKXZELmsBzCS4KORyi/bJy7RnlQvEsu02quCq0+RtVjoNe/K6qiPy
         S8Vg==
X-Forwarded-Encrypted: i=1; AFNElJ/Ia0wNZAkrYEt6+K9m7cknHExBv9ottQr/Ioj66qvSk4aIjyV6yVdQ9kCiFmXWw7NpoSa+nX91NAS9vjJP@vger.kernel.org
X-Gm-Message-State: AOJu0YymwjApmww/M58KJwwXyRW4BIWGc7wVGpKwGDgo8J4b198NIP4T
	eig8IAKd6AQKOEak9hirEjpZFjMEAsvGGdOzMC4YB/IdeEiZ9fGAnfKS
X-Gm-Gg: Acq92OEs+94f03oI+G34Yk+n5UgpvMK9WEBK9b/VjsQVdecrbatlSeiQT+nY5STaXZF
	Xo0ehR5Aqw2lgbD6QxtiExarN0t6g9aKY8YkWMHLJL8zNJ25ze/qD1k3O5u8DURcrUZa/O7Drvl
	SV9z9JxpE4ebNrxaYT40dmxA/RhrywNC18q3DeRSp4hs5TrqnyA+Xg27AElKG+bAvk10Rje3F1E
	nDZuwgpfGpHBdB920/ZWV3NkhtOFrY+83s+bi55FJKvfE+5lDtFguewxD6KOY5C1+W3dhqxdH60
	gdUWNTuE7/UBiXUGFkP16AtgXOJ18qj635wTVN3sGsS5+0WjEOMberk2JXk197PXeVZ2L5G/0tb
	uj60dK2g5kUkvN6jx/LgXyq3m4BfTFgmywPO9/S34Q/S6RMuKq6RAXWcsOm2t2YBVrdUyK6J1/d
	WdxlarUUIBZRfnNmSLFWoAGCpZ/0vTzVLmuZ076QJpRWdJfEyRCmUW26EYLtcLyJtqa86qiSw=
X-Received: by 2002:a17:903:1b43:b0:2c1:88a1:9839 with SMTP id d9443c01a7336-2c1ec527f50mr94707405ad.11.1780832244342;
        Sun, 07 Jun 2026 04:37:24 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:88b6:5847:b159:e15f:b4ca:e80d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649c302sm144144165ad.73.2026.06.07.04.37.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 07 Jun 2026 04:37:23 -0700 (PDT)
From: Ajit Singh <blfizzyy@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 2/3] dt-bindings: arm: qcom: Add Vicharak Axon Mini
Date: Sun,  7 Jun 2026 17:06:57 +0530
Message-ID: <20260607113658.25117-3-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260607113658.25117-1-blfizzyy@gmail.com>
References: <20260607113658.25117-1-blfizzyy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111569-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:blfizzyy@gmail.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[blfizzyy@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[blfizzyy@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C6067650774

The Vicharak Axon Mini is a single-board computer based on the
Qualcomm QCM6490 platform.

Add the top-level compatible string for this board.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d48c625d3fc4..6924bfe7b949 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -361,6 +361,7 @@ properties:
               - radxa,dragon-q6a
               - shift,otter
               - thundercomm,rubikpi3
+              - vicharak,axon-mini
           - const: qcom,qcm6490
 
       - description: Qualcomm Technologies, Inc. Distributed Unit 1000 platform
-- 
2.50.1 (Apple Git-155)


