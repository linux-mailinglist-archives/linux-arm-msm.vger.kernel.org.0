Return-Path: <linux-arm-msm+bounces-118973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kqhnB3TjVWonuwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 09:21:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4885751CAA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 09:21:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=irOwDsGc;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=afc8s9bO;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118973-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118973-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 77B5930BB059
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 07:19:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 536703EC2EF;
	Tue, 14 Jul 2026 07:19:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA993EDE52
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 07:19:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784013597; cv=none; b=iZgen0i9VPJOBUUr6j+rJm60ID2vGIVUj40rA486RM7EV+r32fW9n8FHU2GTQj3SBWaTThL+tIMLbnfdE54NasRvCN1DzAXH0VmKcn0pmMa5KeX+8Lc6/9dcCEr6OCIAB+MuYJvz+HdRbCdXd0OniTVxqL/gdB2+MpHtJFoTU0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784013597; c=relaxed/simple;
	bh=D4f2vQdrdki7ZGOnRFK/bwTkotK/uzROS4ph9Bdpk2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uzwAD41Vec/WGx1D0jFWRIKFZyRNKFkaYqT5OQ5heuf0YiUJUqLrdwip3CcZQSq4QB7kyr4FeXvuhdP68Flvu0PuhxzAswEdcwUXQw8FMzweguqOUZRNCz2NEMXrAr2/OS1zy2hQiPzmbpn39RTFoMlLnS8mfCZo4fhuXbWl3R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=irOwDsGc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=afc8s9bO; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6SdZf3954835
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 07:19:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W7KR++2slyzotzbYYbez+TiPph9cdOcW0blbetyx7dc=; b=irOwDsGcvFpVMJrk
	br/ZU17LxejyM8C+bdwu3FsFaw4F3/W0qbJLexDD/07rI2uBmE5v0jUCeum0Q2LQ
	80MZB++rb0sj0XyOfGTBYSec20di4xQq7RxkruftMi0l8Mwm7s4c9MpAOu6tyqmc
	7nEsZgMoAUwKzm9XzIOAqfmV2mY0n+NivYdy5qe1WYkMzV3kq3PEI15qmtrA2JlZ
	JanbJAeaQja60OjsMI95Gbo2A77yKlqfYxzzOcmcN5bviIN0rcsSs2M4xLyjxTuh
	K8R3agyI9SBkqdYnlu4EwXZkttqEEO8PgsuXBaO4NIPOi0oMB0D2VNMD7icKp6EP
	r/2r+g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44jtkh7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 07:19:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cea6a46766so42405885ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 00:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784013593; x=1784618393; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W7KR++2slyzotzbYYbez+TiPph9cdOcW0blbetyx7dc=;
        b=afc8s9bOxzkECRRDNAtF2Qpf0A2Y1HGFuRA6BIrYV2zz/Hi/YmxEo52tJS54wqYwTt
         /JqujsgKe1ylYG8HlSetArFbjGb4ctAy9tmWTu6lCavvLenCHCYs/k78LO5aX2+3PjB2
         3X21OdshT2G6lcleKctcm0aH87biV+5BBNPDyNwueJYGu4qTRPN5hugy3KOV0cjgcnlQ
         V0UamCxM+z558KQEG6WNOQ7POjjGauYEMXV0dFfxhDenITfUjA7MP6tv1xTsOGMFmIhd
         1ZRnrwTK+HdPfQeO4DVnuTaGdYMmkIxIYcmdwkfNwFgvJXwt/i0bHQFnfPIB7ffZiww6
         Lz+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784013593; x=1784618393;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W7KR++2slyzotzbYYbez+TiPph9cdOcW0blbetyx7dc=;
        b=i/SYJJeSKvwhYXktZhxdXuY1u5Hm08MDfFuKc1SZ6N1RZBDg+w2mWYEfnhZq48UmAX
         +H2zFwh0dVHDwq99CrOe18pgPYYRHhNFtChqbA0DiGFiB6uf9bS4lcEYGTlPNtw9bfww
         OpikWSRSAlYVV0jFukf6OHiVY04BIYblUx+F2GLWQR0Fjj8RxHrK2NbRkrIW+0bCkukJ
         Ifanjc5/pVsQ9eldRYxzWokSnJsLRJ5dxl42Hvsv0o4tlI+lyeFBE1myotsyp7gqu8Ik
         KBNxlPdw0Mkz+9CpK9mAbYmwE/HtFlQTTcuOzqSv7muLek508Lz5KvlAVTzqf5npSAlo
         7mNw==
X-Gm-Message-State: AOJu0Yz83zaqAMPX+9kl/OMpvZx/z0ivBMXYW74S6LLa/9n2qHDbxHX9
	0AiadwObHj7qukaoZLqPmQPchiZJv0RIqGJ9XvO00VSR+cyHqPPuFhqDaHpEOmalMpf20BPSRVG
	4Q2oqAeTRxMSn1rqhyDD6rAiF5gNyPrbl3q49J5DxXNSdKxBdnAshMtezuSVDVxDcIbww
X-Gm-Gg: AfdE7clVuUqrMvmpGCKLPPyQjATMQ/4BG/6bB3FmlVE+3Xq1ZqPOUYQMw5lHMSP/4nQ
	zzVscl+jFAhrNMXVjF/7ekqOnrG/8X+3F3OdXmdZlWrGOmIPIph17cIhKEbQJ1igZrd4W9iGcBK
	v1bgjYHbKhLGJP2+yvX0kApw5CW10KxMhpNZwCaxZqCNH/QI6MV2IyR01j+eaRjie9L0zwpzltF
	Rp4dqKZL+4uIB0vL7Coi0fradbTgqV8Fm0RUIyRqJvogc0E224jxSgHEaE2a/YEoJLxu9+xe5IK
	HCIOYXxzRjiEKKhl4qXo55X25sHe1oVTCfE3envaWDw0m8wNdbEOfKPvwpmcETxDIXigzZtR6Oe
	znzv4OZ1mmJ4aOoXPiD2gT09bPq38/Gxm6wcpgA==
X-Received: by 2002:a17:903:37c5:b0:2ca:ed41:d33d with SMTP id d9443c01a7336-2cef137215cmr13604635ad.45.1784013592439;
        Tue, 14 Jul 2026 00:19:52 -0700 (PDT)
X-Received: by 2002:a17:903:37c5:b0:2ca:ed41:d33d with SMTP id d9443c01a7336-2cef137215cmr13604305ad.45.1784013591970;
        Tue, 14 Jul 2026 00:19:51 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1e1aesm113037435ad.39.2026.07.14.00.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 00:19:51 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH RESEND v10 1/2] arm64: dts: qcom: qcm6490-idp/qcs6490-rb3gen2: Keep wlan_ce_mem and drop redundant wifi memory-region
Date: Tue, 14 Jul 2026 12:49:42 +0530
Message-ID: <20260714071943.2036353-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260714071943.2036353-1-mukesh.ojha@oss.qualcomm.com>
References: <20260714071943.2036353-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 5oHf8WA5MzDkTlK4DQCFiHXwGSX23NZB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA3NSBTYWx0ZWRfX0vUrwlNVy2CY
 LU0d6xxV096FxjID5G7WzOID6Qm9Wf+D9m23Az+U/gFt1MssqUhR40uONwxnjPzCOvnxL+Rcate
 fciwCBXeRuCyCuqjKZo28IWh4eO10tYXnOugNYCTNx8pTJfTvstY5QbhLHg4HEA4jh/EY2M/MjS
 M0XocWKb7suZJNaLZzJ1EUO/4lvlE8Bu7hzaLl8OEZJ3AQcZR87vlhFSxHj4mWqq+4RbTT8qkV6
 0zBN9CTG00FiyEXwtSVjavd/zdwyoUgNteYKwAQrkLgmkGpr6y9SJDqaS189e204Iu64nOjpyYU
 gMK+JMBrbmw2psSuEjibOTowizmyotqaughqPcfhvP9y4uQk5O6wzv8EVkUW4Z9kmld0L+QlRk0
 MygISZVqWzoSZ/wKHMjoDLiHBxK89AAkgFFrFpJFXrnklNNnKrMsZpjW8bEGsyL1LyFVBqXEkGN
 28tx+IDEshn4g4ClTlA==
X-Authority-Analysis: v=2.4 cv=XonK/1F9 c=1 sm=1 tr=0 ts=6a55e319 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=stktXEJXvQgT6foQVzgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 5oHf8WA5MzDkTlK4DQCFiHXwGSX23NZB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA3NSBTYWx0ZWRfX4f1RpkB16vpQ
 K+cY87N0a0AZyDWR7K8smUTOTdA75POOrLLuu8JlbLf8v9bpxxZRg56JWYVY5eFr02jnUFLUCzO
 HWxrw663w7LG7tj38BXW0tAruJGCI9Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140075
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118973-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mukesh.ojha@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B4885751CAA

The reserved region wlan_ce_mem is device memory used by the WCN6750
firmware. Deleting it in qcm6490-idp.dts and qcs6490-rb3gen2.dts is
erroneous — the region must remain present regardless of whether the
underlying OS uses it — so drop the /delete-node/ &wlan_ce_mem; from
both board files.

Also drop the per-board memory-region override from &wifi. Both
wlan_fw_mem and wlan_ce_mem are already assigned to the wifi node in
kodiak.dtsi, so the override is redundant.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts     | 2 --
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 2 --
 2 files changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index bdc02260f902..6ab1bbdc0a62 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -25,7 +25,6 @@
 /delete-node/ &adsp_mem;
 /delete-node/ &cdsp_mem;
 /delete-node/ &video_mem;
-/delete-node/ &wlan_ce_mem;
 /delete-node/ &wpss_mem;
 /delete-node/ &xbl_mem;
 
@@ -1148,7 +1147,6 @@ &usb_1_qmpphy {
 };
 
 &wifi {
-	memory-region = <&wlan_fw_mem>;
 	qcom,calibration-variant = "Qualcomm_qcm6490idp";
 
 	status = "okay";
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 9c24802e476e..c3eaa196a473 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -26,7 +26,6 @@
 /delete-node/ &adsp_mem;
 /delete-node/ &cdsp_mem;
 /delete-node/ &video_mem;
-/delete-node/ &wlan_ce_mem;
 /delete-node/ &wpss_mem;
 /delete-node/ &xbl_mem;
 
@@ -1464,7 +1463,6 @@ &venus {
 };
 
 &wifi {
-	memory-region = <&wlan_fw_mem>;
 	qcom,calibration-variant = "Qualcomm_rb3gen2";
 
 	status = "okay";
-- 
2.53.0


