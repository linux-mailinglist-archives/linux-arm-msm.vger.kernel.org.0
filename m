Return-Path: <linux-arm-msm+bounces-93453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAUeHgEHmGmh/QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 08:02:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C286B165112
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 08:02:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BBFDE3025280
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 07:02:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 119F92D238A;
	Fri, 20 Feb 2026 07:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="ZMnHArYW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C552D29C7
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 07:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771570934; cv=none; b=WF8PmiboiY3UkNwtZbZnbAAJU17HhZP0B8+4FMMx72kcUu2QdQ1jGWaclHmoSJF1IYXISuKLpUqd03KfGKfA70rRbloyj3V9suD+DG+XcDD0q0ILLRkS1kyUhAK0/gmtwxugm1SmHrZMUaP7J5pLR+LwFUODlvSjFA0NKPxi1x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771570934; c=relaxed/simple;
	bh=Ee+OdocZ2twtL1BAKLCxPB1a5MZDzIcVky35G4Ykez0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qXkiBsis1yOB4+TQelfNKTUIDU2pQfdD25WE5baJScXlMEWBSEeaAPxJ3jY6HKpouH9D7aDSrDapVnCtEihgSz5uK32FoDGxG/MhhgXECTg1Eo5lY2K8sdVuXD0QvGwa6g8Lbw954Mz2O5OXNUqnnRN19Z+EkB8cYwArPbtw1cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=ZMnHArYW; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c633984fbeeso1171669a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 23:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1771570932; x=1772175732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x2nLpeNsVx9I5k7S6orQYgamemvZgo/LtBQat8yK7xk=;
        b=ZMnHArYWe5oTPi6mSS2j+oVgPVqUgE8GjAqu7ujEWnbha7ECTMT98+LpLH0D8GhpfA
         pPRamE8Vzec39d5XlDtwHw7L0Gv/AnNHN4NkI0qRXA6Cy8Eom3ZuYwAFYiewYilwYQmI
         a3qbHNKFAi7n62nfIe938dF7QV/vsmox9WsRA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771570932; x=1772175732;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x2nLpeNsVx9I5k7S6orQYgamemvZgo/LtBQat8yK7xk=;
        b=wPfYHmRm44IjjauQFICewgyQsQGjaibwr2Rr35xwGokZso4S8jyAT1AlRoI1neXEn7
         +HcgAMEXloS7dRJ1EbC4w1LR2KgSSvGFvdM2IPwkVrgS7yIMKDrndYZ3QhOw1ysa9MwT
         bs6wMk8nW60ORiKgQu0w+Loe4Fy9HOrug1qZ1qtD6RSMUbLy/wfqHpRO2Tfosk2k1i26
         LJFkoGDhMl7I9WKR7GefRyUrTQdgRFfQ54hKOaimWU5UAdnxlemMHHSH41C2SzXprRp0
         eCt7Op/rkSv371zKnaIpzn1F80MG4M0dY+R/dvOTRjduD7IOeRJyHDHeZsjMzJA+cIMt
         yr2w==
X-Gm-Message-State: AOJu0YwGoMbIiXMIlCGE8WgGzf0W1iXsKGyDypJkaS3LzFSwjJCMuCiH
	29Rbigowe+7jjHpeqX7y23/BBlOagsSN3USKQvOOqP5hN30QGEyv50G7SbEUTJTrZHY=
X-Gm-Gg: AZuq6aInNG2Piwpzav/lxvHXaTcTQB3pyOBYLei6BfogLjKW73k29q/5GC1gg4BK/1d
	2ic1y5JP8zG1Nr5bXpP9AqCqhCqggr1t0qniIKnAgxnCFQWQhLt2NLL1HFUfPCKLgUMvl9Jsk1Q
	O+qiqcNJ4WX0W/jUAHdSUtf6iTcolQ4B0OpD7/Rg/KIR3JyCwgWdhi2Mur+fT5KbcIL/KhT6KkU
	MAOrwYQw3yfenHWM79V1QwJiAOqWMA/bXnRvGn7L1vFv74GYMzx8emBc2E+CNVwjrQSpYeea2yU
	NPRtU/YWCRccmUPkiUMasXRDOUboNid5GKIXvWmQ3MN5KIcCjRNLTcaNaNs3k5UvKz08/Zg+fsH
	phccF9LHykFxf8dUx65e//Mih2cKzmB7IA0gxBizC3YD6gtC2qqy+PH3ucMrYYdULPvVMP9xmtT
	gMfpJ1Zcbp3tvVmTOcDb4PiapnCi5yC7yo+HJWhmutgIhYuLNNGX7O51NYoTX8Qy3kkco3erd6m
	6L5AOoH42Si1LOMZRAqPZ4OyK4PA+o8HFNAjc2/InjOoMVXFF6/BM97TeZncTvnZfjYQzqJRBC9
	CG50+E4ApqoqmjnOinQcM1SESlCXWnkN2xhgUXCakJ+Zx8HPNYqxWMr0NWpu94eG
X-Received: by 2002:a17:90b:54c8:b0:34f:6ddc:d9de with SMTP id 98e67ed59e1d1-35898581006mr3655739a91.16.1771570931936;
        Thu, 19 Feb 2026 23:02:11 -0800 (PST)
Received: from aegis ([2001:fd8:c146:1f00:672a:f6b3:e686:445b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3589d811aeasm2645156a91.6.2026.02.19.23.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 23:02:11 -0800 (PST)
From: Daniel J Blueman <daniel@quora.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel J Blueman <daniel@quora.org>
Subject: [PATCH] arm64: dts: qcom: hamoa/x1: fix idle exit latency
Date: Fri, 20 Feb 2026 15:02:03 +0800
Message-ID: <20260220070204.101672-1-daniel@quora.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[quora.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[quora.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93453-lists,linux-arm-msm=lfdr.de];
	DMARC_NA(0.00)[quora.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@quora.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C286B165112
X-Rspamd-Action: no action

Designs based on the Qualcomm X1 Hamoa reference platform report:
driver: Idle state 1 target residency too low

This is because the declared X1 idle entry plus exit latency of 680us
exceeds the declared minimum 600us residency time:
  entry-latency-us = <180>;
  exit-latency-us = <500>;
  min-residency-us = <600>;

As 500us idle exit latency is overly conservative, fix this to be a more
realistic 200us, in range of similar silicon. Tested on a Lenovo Yoga Slim
7x with Qualcomm X1E-80-100.

Signed-off-by: Daniel J Blueman <daniel@quora.org>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index a17900eacb20..b870f4dc9c42 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -269,7 +269,7 @@ cluster_c4: cpu-sleep-0 {
 				idle-state-name = "ret";
 				arm,psci-suspend-param = <0x00000004>;
 				entry-latency-us = <180>;
-				exit-latency-us = <500>;
+				exit-latency-us = <200>;
 				min-residency-us = <600>;
 			};
 		};
-- 
2.51.0


