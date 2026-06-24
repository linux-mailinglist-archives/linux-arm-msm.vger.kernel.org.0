Return-Path: <linux-arm-msm+bounces-114401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id T8bJOp0rPGp/kwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 21:10:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C20136C0E50
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 21:10:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=h7TyvR5T;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=K0F9rk0a;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114401-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114401-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1DFFB30241E2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 19:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4373368D73;
	Wed, 24 Jun 2026 19:09:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FEA36A351
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:09:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782328186; cv=none; b=q//FeuNwLoEyNmHljA4VawA8SjoYgW1Ve94I/r6aEAkX6F4SV/bDzzxzLw3KaDVrL9ms1EpDkQFeQJnAzrxddfGH47ZoYyKxmL3RCDJEzFKfrturWW/I1sH4Anv5/GBqoQqosVmM/qpc4vVZ9s4r86N3ZTwzIx65Az80T4E5YbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782328186; c=relaxed/simple;
	bh=vhbCTiIuQO9jGhqLY3JyEZetbh85mdHspNJQ1sUvcPo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AZ2zoFK5GQQ26hPXHg8X4uXf8G7GTtl+lksadq4g16gHQl/00KA3XJsV0Rkkr/k+Qd6kSTFDqQ6kQ4idyowlOK65lZtvImIy1ho/maWNitzeRnVX7mOZ8KY5LHfb1/jLik54OA9nGA9DDaKaipDeaWFIpKfCxWu/wMXB0hWhiPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h7TyvR5T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K0F9rk0a; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OHitsh977470
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:09:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Cl5DO2tdKTh
	EKm3ySWTPGw4AaZdMgD9aMXdgCH2W96s=; b=h7TyvR5TkOjQhm9IWYMQNSYGZlR
	31Yk/QlKlYdmIQ2xMNDZcxcyCMMN2IPNavRhHnYuaMyUM1t5OEPnKvQy7zTlLN8p
	xNRQKcR7ry80MNmkfiPIrrv0OPu287FrygT21uPkvIew538g1YLOkho+wca+N1zp
	FyE0zigESTvOKAjX2Iw4VKaIYx5tSPRwJWlevXZmdHCZe31PZb7BBd3Z5nbqDuOR
	T45lgRj+0C49a/77j5HmfTF+evkquYu2MoTHDNHEKFLDKVn0CiB96OhNfoYoLuWE
	cEOEBITBFRLiReDltDCWSz/pji5GvqvhZSjIZzzmskhQU4jR+LnDk9bvs3A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0aqpau8x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:09:43 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8620ee0971so1312954a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 12:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782328183; x=1782932983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cl5DO2tdKThEKm3ySWTPGw4AaZdMgD9aMXdgCH2W96s=;
        b=K0F9rk0a63ZmPz0uOMuH8+t565IZUQSBxzGwLf87lLkjoWsMAIur+NXw0iE6sX2kKv
         4Fe7WM7R/vTsmFC6okiJI17YJ2nHJn6bxPJ2wr+cCoeDtragaq8dza4avJPo+00fSOFL
         7h8hS4P42Zsagt8QEOMKIUarvCTKJQ/ikLW1bgjbeMTnQcFocx7Kp73xp+pU7txvBj3L
         I5VeOTY+gjr1xhXAgiYMlpipt7IvmFiB06tQgHIJawv9AzRVm9ofYhZufbpKVugvG0/Y
         7f6A36xfMAmeM7KDfKRm0HtWQXApnAMATCavLgGhI93wFmLnbvsSJQu15lj9P5+kuM3j
         LR5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782328183; x=1782932983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cl5DO2tdKThEKm3ySWTPGw4AaZdMgD9aMXdgCH2W96s=;
        b=PEl5p3KDRyXT8GgN8ux96jgFkt8OvYnc/Yq135OtdqQ+XX4oizG+OI8XiFrHsU7V/j
         2yC001ruUYJQUUNYSnDJlejXdbaaQBFWhnFjEoeYOHPGP6eNAn6o7JTtKu/gVlfU8CUB
         9GgeayuCHNCap1zUBYre0TcFYUuN6s6Ft1jlR94D1QDa3A/BAKqRQnTVmR6JvUoU+aKP
         9t9+zLkCeU1BMgd+aydFWDyYQaA6piUB3AwpluSha/lcorTt8hHAUf2RRclxBzCVlee9
         hw9yyOelElRi3+C3AvG9/UwIhuAih6U9P1rgo4sULVvEiSNpuSmtW2pRmLXNXeA4c8Zv
         HtfQ==
X-Forwarded-Encrypted: i=1; AFNElJ/NSBnrKp/l/XuLmjS7WKWIfri/AuJv0SuUFn9IBN0yKJ7Qmgl6NlLQYXfVq1euD5eniB641eKEdymBPWo3@vger.kernel.org
X-Gm-Message-State: AOJu0YxRVbNHYpVWy2bOeQmJu/5gHu07jNNQ6MrjUFqYto0UFjvMdRr8
	U9Beu+K+0JmsvAw0K4MFV1YH7ob4tDNI1m7yDflXl2Y7jL9URlsaS1geStyFPdbAuSENTKvlIXV
	DhPQxW1dt4rl99G9sFHAfSUXNWJddyAHk2UUWKXB/m5/G/t69iSBPQCpJzj+0yLDiOjZi
X-Gm-Gg: AfdE7cleybi7Eo7zwQoiVxjWZxARLtT1EJyxrJGcYaZ0StM51Wz7Q2NtqNo8XsbDd43
	LkCegG6YRd8EJcoTEqBgn3DSrGyXuiU5A8yyyhqAr2exQaGo2ylaA4w5W3cqsNBCRdT4D5b9vVY
	Fx8oZINJULsIfCnWsohTuUKotofp34qATGP/q/yU8a5b5mazOLJqCHdxxbMj4wRFe2NarCmQRb5
	zISURsc4hSw/90CqVl+hh4Z/XN1XwDFOVnOoqWrc+9uAJ0KiL5eentyusBA7lBPoH+AqfIXl3cJ
	THRhC5XTDbIljjg/DCbJdxDtz0qEdkfz/BRyLtXWFGWjLoD9UEtUIPLx3zKgL+wN0uHQ6KfVouU
	qttlboOuM0/Vdj2N4+YnGJjVdKisaz/lCvnOyQQ==
X-Received: by 2002:a05:6a21:6e97:b0:3b4:b259:6965 with SMTP id adf61e73a8af0-3bd2d099307mr5545891637.11.1782328182993;
        Wed, 24 Jun 2026 12:09:42 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e97:b0:3b4:b259:6965 with SMTP id adf61e73a8af0-3bd2d099307mr5545855637.11.1782328182477;
        Wed, 24 Jun 2026 12:09:42 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a412e5e9sm2932120b3a.54.2026.06.24.12.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 12:09:42 -0700 (PDT)
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
Subject: [PATCH v4 15/19] arm64: dts: qcom: sc7180: Add minidump SRAM config to SCM node
Date: Thu, 25 Jun 2026 00:38:26 +0530
Message-ID: <20260624190830.3131112-16-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: e9uDSUbX1arzBJlqJo1wOwecrl-B1YnH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfX/d3codI85wgb
 PsK0XWqX1Ceyt+z+pkvOfIwh31FR2rq1mIb0T2UdsgwzpRjIbPe2mLzTuNa7dP0ijFm1mthyr7o
 1MAjBLGtJR5DYH8smrYLNF9J6pZ8voNfBFtABPlwpF6sI3u3+Z7mt3/G2tz5ZLPzOEJH+TMObAi
 95FefxiPmavAr4qwDTMpR3p9JF1lauqH/rCD0Ontn2fIuMN8bOStY/p+LQByJAVsSmkCWyp+f84
 TEhdJJwA+wSZz3p69mf0z2zW6BR5FoGG974cEOkxJ8bmRA0OOUQdojtnJpzcjjZNPEWgDTn/7lC
 qSHHQQIma2icYREk8NV2ZmKNJGP+8p7UYBczo4Ze1yoDSmNUHBxAg0AuLLPSbVn6HbfBVWmTA+J
 lyavQSjynIgrTAKZFTuojLY6qagHSA==
X-Authority-Analysis: v=2.4 cv=QLhYgALL c=1 sm=1 tr=0 ts=6a3c2b77 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=uif5S2Ty6xZypC2F6NQA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfX5l04ROmenQws
 MVA6Z23XZJI39ANNAsUK1tcB9Hul4MwPYmOdw54UkWBLCxygcPlDUXbHCffLZWqBnKHuHgNb+9e
 G9N70StmQb9CMLy8+sAKdZ+rvBIgQ/Q=
X-Proofpoint-GUID: e9uDSUbX1arzBJlqJo1wOwecrl-B1YnH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240160
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114401-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C20136C0E50

Point the SCM node at the minidump config slot in the always-on SRAM.
Boot firmware reads this word before DDR is initialised on a warm reset
to decide where to deliver the minidump.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index fa65c485172f..1f51fd431ce5 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -385,6 +385,7 @@ cluster_aoss_sleep: cluster-sleep-2 {
 	firmware {
 		scm: scm {
 			compatible = "qcom,scm-sc7180", "qcom,scm";
+			sram = <&minidump_config>;
 		};
 	};
 
@@ -3596,6 +3597,10 @@ sram@14680000 {
 
 			ranges = <0 0 0x14680000 0x2e000>;
 
+			minidump_config: minidump-sram@1c {
+				reg = <0x1c 0x4>;
+			};
+
 			ipa_modem_tables: modem-tables@28000 {
 				reg = <0x28000 0x2000>;
 			};
-- 
2.53.0


