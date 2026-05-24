Return-Path: <linux-arm-msm+bounces-109505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0P/zHa7nEmoL5QYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 13:57:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D280C5C2414
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 13:57:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C32D3007F65
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 11:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD90F3911D5;
	Sun, 24 May 2026 11:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="IM4l3UB9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC1D25B085
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 11:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779623838; cv=none; b=T1Sec0qgXee7OaEqg6In8zf4gjwe47sKmFTjBIgswK6HN6Io0hJtEHXe9hnrB1ZvXWA+V+j5+vt8qpW2xaBFY83lmS+lAAEFW63V8EcOqIUMecdxY7D4kfF1FTs0NFCsB1agRM542j04FTOnZkIpHHcsg/wRz/mrcXvBLpL9t4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779623838; c=relaxed/simple;
	bh=622IsWjqu/Dv33iBQgEoGfptos4IBuvIhRAx8KjaNjM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fRxRTpJDkHmQV6l1O3WEfpMWqZOBqoZfih6CrP+lemwkAE/ZBcQk/+4tj0EvyclH+JKQ/YD7aF4ubQ70ikrqKf8bgsL9nR6+rNr8kywxNi9lsVhzhfN9dTzrRvpeAzPIVDc5A2z3x1D8u1YPp6V54/OiJV8FNjr6HSORAMH4v/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=IM4l3UB9; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-83ec36a13e9so4261125b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 04:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1779623837; x=1780228637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1YJd465RK3GhQ1QFKpfJRaoQk4hxKax7K4+5xuIARHU=;
        b=IM4l3UB9tIYLTRx2odzLJn+yVQamTk8XEA8GH8MceNtOEVp85vhQU46mXlvVggca1S
         aSmlg/aKLhOm4654PrYCgJlZujIbMKypOfXf+xMtsGqqPbR7eu97QQU+RfzogV3fCd9F
         M2JusarBMc3Ijbp0+yWXdEK6pDMmchv6goxWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779623837; x=1780228637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1YJd465RK3GhQ1QFKpfJRaoQk4hxKax7K4+5xuIARHU=;
        b=UUW+9RqrbjMkZ46l8ZWYZ/UrOepFxS8ZvjaDw6iQUSwoi4Xkf0g7jZOiEsDG0zUabu
         cIGpl+n4Xb/jjxLmu9BSmtUp8/FVDVnn200tkVCnylc64faNQaKks+wwRyvga9TlzVDK
         57G6L7DCKWx9od5zC68Pq5uFpjK3AzkEWY72K56+5UFnNBWp4eSOkZEBuoX+dZtPY0BC
         28r4ALzvfJDvIeDdsb50l+jjGx0mlytON2UfF7SWDRFiZ0ALKXKOHGCGjYqgsQun4cns
         tW2hbGyj8WQotUQaBp/IwsinX/GzpzUuUzqj6lcEE96ozRFgOanSaas601XSo0VQDkGc
         xd/w==
X-Forwarded-Encrypted: i=1; AFNElJ84tjhkQERASBl756O4Wg8DtcyLUoS/oFQtLZrxU4/e8rbuv97Fpr9GI9xv94z7jS29GHSRlE4CyGucmPk/@vger.kernel.org
X-Gm-Message-State: AOJu0YxEP3HIEyYd+6nqxwyS2BID1z+2dgWlDWx8hW0vXHuf3UIqfEHi
	/rGLlZGR2o6X1ejiAww4n24Qfbm1258Lvq71EoZtnAhO4LrkSpNokWq1n6ZJ9eosWZM=
X-Gm-Gg: Acq92OF1LeXyDkBoqrqcxUl016wacbLMVqR9tsI0rA0NCLy9x2wam07g4t9uCION+hd
	dvZfT4+oQODLdAzEMT4B2S7/9qg0NXC+JJj1l3HKxPpLuEKdXvPdZ2f0nCTwGnMUaLM2viJIlWU
	jcATVb9t5FXTCJqGiMRN+EhxrNauAvPkxBss0p5Fr3xA746Qhm0EJlS9EbGmJ7YQtvalbqvC2Kt
	uzvWo5w+VXBC+sX7RQfhUuIdw7f4+BG2Hh3m5oPGo57X1k6473LzzVLXibjnC+W7wS12sVOwXQ2
	Mpuukt5695GXZxmxS5QYum2o39gMWZvBpXW8oC1hNERI7m08jqwuDlL6rr2Hdj4MpGt0bC5yv73
	XASY4J02WEW9eYXyBUZo9zWme00LswmlIChAKya5i2H2Esx7YNjM/JHoIJdAKskPh/ka1IyGuiq
	dxAJwGDgaX1e2QGNnVs+Fndpml8vWhQ6bp1K8ZRR+U8cF17Mg6HyZW/X3849hQLslAh3fOy6YNb
	pr0KAXClFD77Mzjh1L/RvK8K163YvhdjxDAPet/yJx5ZgouDAS0h4JZQ1qEov0w7p9BQw82Q0Ua
	H8uZAKL3tJEpWdxwGY8Sxz8pqj+9q90Fj4Y7N85GqWQ0qb8/9XIqZfog/i6jKLWPWdkAtl34yF0
	=
X-Received: by 2002:a05:6a00:ab85:b0:83a:7565:3505 with SMTP id d2e1a72fcca58-8415f1dc87emr10131980b3a.8.1779623836798;
        Sun, 24 May 2026 04:57:16 -0700 (PDT)
Received: from aegis ([2001:fd8:4d03:6402:d84a:6f89:2d65:de88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164fb01a7sm7014274b3a.44.2026.05.24.04.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 04:57:16 -0700 (PDT)
From: Daniel J Blueman <daniel@quora.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel J Blueman <daniel@quora.org>
Subject: [PATCH] arm64: dts: qcom: hamoa: Set MDP MMCX corners to LOW_SVS per Windows
Date: Sun, 24 May 2026 19:57:03 +0800
Message-ID: <20260524115704.9442-1-daniel@quora.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
	TAGGED_FROM(0.00)[bounces-109505-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,quora.org:email,quora.org:mid,quora.org:dkim]
X-Rspamd-Queue-Id: D280C5C2414
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On the Lenovo Slim 7x with Qualcomm X1 E80100, the current Windows ACPI
DSDT votes LOW_SVS (0x40) for all 7 MMCX OPP packages in the _SB.PEP0.G0MD
F-state EXIT package:

"FSTATE",
Zero,
Package (...)
{
   "EXIT",
   Package (0x02)
   {
       "NPARESOURCE",
       Package (0x03)
       {
           One,
           "/arc/client/rail_mmcx",
           0x40
       }
   },
   ...
},

Apply the same in Linux for power saving opportunity. Validated on Lenovo
Slim7x across daily workloads over 2 weeks with the internal 2944x1840
panel @ 90Hz and a 3840x2160 @ 60Hz monitor over USB-C MST DP alt.

Signed-off-by: Daniel J Blueman <daniel@quora.org>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 051dee076416..bdd9e7e0768c 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -5657,22 +5657,22 @@ opp-200000000 {
 
 					opp-325000000 {
 						opp-hz = /bits/ 64 <325000000>;
-						required-opps = <&rpmhpd_opp_svs>;
+						required-opps = <&rpmhpd_opp_low_svs>;
 					};
 
 					opp-375000000 {
 						opp-hz = /bits/ 64 <375000000>;
-						required-opps = <&rpmhpd_opp_svs_l1>;
+						required-opps = <&rpmhpd_opp_low_svs>;
 					};
 
 					opp-514000000 {
 						opp-hz = /bits/ 64 <514000000>;
-						required-opps = <&rpmhpd_opp_nom>;
+						required-opps = <&rpmhpd_opp_low_svs>;
 					};
 
 					opp-575000000 {
 						opp-hz = /bits/ 64 <575000000>;
-						required-opps = <&rpmhpd_opp_nom_l1>;
+						required-opps = <&rpmhpd_opp_low_svs>;
 					};
 				};
 			};
-- 
2.53.0


