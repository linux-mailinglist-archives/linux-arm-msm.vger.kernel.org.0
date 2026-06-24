Return-Path: <linux-arm-msm+bounces-114399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vZ56Fy4sPGqskwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 21:12:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E467E6C0EAF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 21:12:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=D7e+hkAu;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VAEu5LQC;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114399-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114399-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2B31930FA9A5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 19:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14C98347BC4;
	Wed, 24 Jun 2026 19:09:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCC6343890
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:09:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782328177; cv=none; b=Jgdr/ESsjJMTL2kBYhHKuRSM1/b23veLWRdIcDVVrORCeWxoFmAxq/2AZ760aEZ0R1RfbybubYeAm8RRlFWTvJGWrTrqU2B3aZjJF6WO0tO9CGN7NmqsPyq66Eg+zLwmK5+czDtwoPN1Lb2M6R8UE3He5PK1D9MI/aIaW0HFYtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782328177; c=relaxed/simple;
	bh=l7SYm5AQ1ptqN1wINS7sSNGjFhlD3OrFGjhZqhSAK2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L0WnelNOYONjDNMk73V5k4HrA+J4a8+QK2mqE1ipoeMLhkm0l41W/QskU5iRZxLYMtPv/Sr6eKdZU9a4UmV6nXIhjCFNEpyfg78z2N6lxgDMFAY5nnBH9aGOGsvmaGJsDtIkzImo3wN/MlUcXyZBYTN1rz4mG8WuA/sSVkXrp7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D7e+hkAu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VAEu5LQC; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OITYEf3666575
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:09:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=53Q/gFtuFcD
	hDTA4iRWdeRskHKeQlmWd5rYuvhi+/eo=; b=D7e+hkAuKsLzqjPBiHwg8f3pXia
	s8zQ2E34LjFMfBVhq/thOwTSewPESOOu2Ww+KIUmhoqtL6eh0Pw/gOn5kPMGSuKt
	DKs9ATqDkgY/ZlntdCxV5rAMeq8fvcp2CTuO6wK/uR2lPML3AhL7cjM5f0wWPR9n
	lacEi8SlnEuz2ApU2AFk3axrpDf8SkmNCeJ9IlR9lgNWnM9M3yEXYZ17/AsnskBd
	vw9J2obHz7PZMveVsulO/lpZnFp83mKDfb9ARs9xxF5nykgLPpzwmRi/SkxWniae
	EoT9YbLfE/qCUWEArFkoq+yDTaaiG7izhi34zKmhMVxI6yz8JPRUjo7K5AA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0mjbr56n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:09:35 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8453031c567so1066993b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 12:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782328175; x=1782932975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=53Q/gFtuFcDhDTA4iRWdeRskHKeQlmWd5rYuvhi+/eo=;
        b=VAEu5LQC3XAsbmAEi+6xPfcmSKU82ccBK6hsDvH9RbED9csWeNWVqoddbQ4Whuejkr
         Lr66dnFuds0q7rt3IjKfqSEW8edRJ5AthTwzoN8eoyfZsEoFISYmtiVu/IYcaVNeDDDK
         E/ALaWKMAEZLupsgP59sKx0mhdCJALKj2M+NMVxGgRssXs2jFDy1oeY663Nx5pdSxxwL
         hsJDCWS3R+l+autU+2KQYKZSb+NbQA6iW+8ESs6IqBdNTlfqebAUl658zJS2K9ZgIqOa
         X4ohKwkVe1qgoMnHptW+a++2keSq9zT7qLSAuqTusTaajNTht0lZTsZsnEnrFIJ5ox3g
         XwzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782328175; x=1782932975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=53Q/gFtuFcDhDTA4iRWdeRskHKeQlmWd5rYuvhi+/eo=;
        b=HpZS43aGgrSBBtX6UsQyt+XTbXE+Vb1cGkJvin3c8i0qP3XX+g1RyU8rg8GvbAgGaQ
         1bGvkbdkzOyz/96zB5LKcP2Qh9BuKHyKG0c8lcMcdDVyclPmm0cImv2XS8NXyq4ACZHl
         BFHXKkvv40UzADeh2DaUw0QCgmJod5/mR1dtvu792nJmK2/F0vI5f+KGV8ycpoear7rB
         HHN+etjf/AnbUzMNs9PQtKsEfL1Ns2YqESrIXR3Z7cCPNiKQAW9/UoneAQEyKup/2AZj
         gb/Col60s8wDHk3mfGwmpddDShpU4OQgoV0zbZ0CJbNYSMnSQ3833h2wTvIgrQiFPQrl
         zXsg==
X-Forwarded-Encrypted: i=1; AHgh+Rr4jovu/BSVu5HGYOKlL64JeD0wINvESGlxEVMzhmsoJWVGAj+RqEk9sZSO+nUX/2rowzkJ2j6clU8LLgSd@vger.kernel.org
X-Gm-Message-State: AOJu0YyfPonZk27fG2sri01IPhr/7kmMR12ePI1SiNbB2TB7un4UefEM
	qNF6SxeBJQuTZaCRbjH7BEm3YX1BF21yDqdPzD/b5+0n0ZY47Kd+2PlFDCCgyL+CgSx/C5+1Mbl
	1Of/Xzh1DharlgiPGaJDkskx+YSMmmo19cL4zx3IKR95bSlEs19AYzOx6urZjjfx48e1c
X-Gm-Gg: AfdE7cnDhi1LVGDqYyxCvbP8NGUEsm7o4o3FRlExju2jPBOxZ0ZvOnfYzZtxTXWUdQc
	t0/z43ag1IUl8qG+wZF9UOMKoIW5U0M+hwSUVFBHzGz9yoU2SGvT4+UrLsMLPWj51WRnVqclEJe
	qEAGo+ZnzS5fzuLOO9QppdW+4NAIiiX/ytchVe3GAbCgOLmhO9s3BQ6a+zdI2RJbWQe5pHfGbl2
	FTOrAUvA7EirhaMu5pPS4c3s+S43cOZVuyzIlbecRhbYfaS3jnTQEdJJkb7n144WdivfFAGbCid
	aMI+lrB4mU9qBQB2Dvc/B5l7wuNLxqg5vAE33msT/PWKxO/ul1TL/BzZjrr/GRCTItaP8XKtrw3
	Uzp8C6S8puJzVLM28ODDx6KH8CFYoTaB8r+FPjQ==
X-Received: by 2002:a05:6a00:14cf:b0:845:48be:b046 with SMTP id d2e1a72fcca58-84595325e66mr9938892b3a.36.1782328174457;
        Wed, 24 Jun 2026 12:09:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:14cf:b0:845:48be:b046 with SMTP id d2e1a72fcca58-84595325e66mr9938850b3a.36.1782328173874;
        Wed, 24 Jun 2026 12:09:33 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a412e5e9sm2932120b3a.54.2026.06.24.12.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 12:09:33 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 13/19] arm64: dts: qcom: sc7280: Add minidump SRAM config to SCM node
Date: Thu, 25 Jun 2026 00:38:24 +0530
Message-ID: <20260624190830.3131112-14-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
References: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfX75lfvxmwN64X
 bZZBKODgcvQJQJ1basVyIkRB7+Q/1qPLGB6uZy5De2do/UgwwxyTlNhpqmSydBeu7W1Lwoz5j54
 MFdeqbY4Q4TyfEupASiURpSZBFc1CUQ=
X-Proofpoint-ORIG-GUID: EZu5H8HtbiNhCNTLaHGy6gfl07ObO3rv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfX+6k2HTAfSNBc
 0WHCJmRBU1vcDx92AEkRLd4sY9Bj32vOTZt0WsBP04RSu7RK3IvFpIyxjACMTwtCTzzMU/dXKhp
 sF7UUcG9ncQr3AxFa7eOrKcpgcEa6m9d8QOUpaLq1YcUCNgTsBHgI9FqPDQyu/Bh+VdP4KYHqxZ
 3h19kh+g2etSfWBJGsS/tWHtneKVFUYv8LAkidnADcpzSWOnJXlMPxKGVDWDzCA1lkc5jCeqywF
 9wPt2LGaqT0YhaXt8dNxobtP+6//kP/wTBfhOZBoAt1NzqDH22UcuRtj3uMT6g1PjE6zkhg5ixn
 mE3cb4lUieMUK5YmvbgyyYcd4EGaHK5bjCUxCT5U4u2k1O5Qdf0aZoiiVOp0Z7vZxZiyz0yYj+c
 uOgHLdYSb0LvRSCz9tCiXjEF+/GVGnTef+IfcWwzOD56Q/DAJVu36zO3WO51SD3Q4dZB6Djex6P
 N6l3Y6kvLbyDQJtWyGg==
X-Proofpoint-GUID: EZu5H8HtbiNhCNTLaHGy6gfl07ObO3rv
X-Authority-Analysis: v=2.4 cv=TcSmcxQh c=1 sm=1 tr=0 ts=6a3c2b6f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=lqovEX5wbH2L0KOpZmIA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240160
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114399-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robimarko@gmail.com,m:linux@gurudas.dev,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mukesh.ojha@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E467E6C0EAF

Point the SCM node at the minidump config slot in the always-on SRAM.
Boot firmware reads this word before DDR is initialised on a warm reset
to decide where to deliver the minidump.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index fa540d8c2615..6d805cbe5b4f 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -720,6 +720,7 @@ firmware {
 		scm: scm {
 			compatible = "qcom,scm-sc7280", "qcom,scm";
 			qcom,dload-mode = <&tcsr_2 0x13000>;
+			sram = <&minidump_config>;
 		};
 	};
 
@@ -6698,6 +6699,10 @@ sram@146a5000 {
 
 			ranges = <0 0 0x146a5000 0x6000>;
 
+			minidump_config: minidump-sram@1c {
+				reg = <0x1c 0x4>;
+			};
+
 			ipa_modem_tables: modem-tables@3000 {
 				reg = <0x3000 0x2000>;
 			};
-- 
2.53.0


