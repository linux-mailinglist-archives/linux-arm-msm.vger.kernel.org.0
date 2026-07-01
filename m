Return-Path: <linux-arm-msm+bounces-115612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Pt5OKdzURGpe1goAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 10:50:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F38456EB47E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 10:50:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CMC47t7s;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EkK3EZbQ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115612-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115612-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC93F30E0CFA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 08:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 510743EDE5F;
	Wed,  1 Jul 2026 08:46:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB50F3B440E
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 08:46:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782895604; cv=none; b=Me4Lze+MbGMhEAQ//t2v1DNLlVy3jnQXrMYOKaE+6fSE2Uj4SRVzJZcJKMUJi230+OesLEcYb7ZihJquEZiy1guiHxzYp6ZE4JqOIZdsWupkbUVVPKMjYflOS32rv6rWhuhOFD1uP7x1zB1LH//eFNQsk7nvwAO+sY10ah/N/Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782895604; c=relaxed/simple;
	bh=GRbWxHCWK5woHSJmqcg4vZ8zKDdAitOAXTLbGcGk20k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AwKTrMFvaNB9JLHictsyoFqfgo4tadf2RQxTizMc4G+a2rIv2ku0bew25ynfFsvgiwU79DwkyIvbk2qKDcNugvvXhROYzf74P0l05BDasOetiqJpfdDrayKkrtahfxQ6z6Ho7tOImK18KVhoiBggWokOnhq7wTA+NDfqSDmqDrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CMC47t7s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EkK3EZbQ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6618GDJp496756
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 08:46:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kTd/R/2EJF/1DHxNw7D2N/60ZnX+FUJkLfb7saHZSjQ=; b=CMC47t7sQVuxQ6B3
	hC8OA3TwKerLajEDnYVXu4ESqdt7sH6pcKdMySNpfLcH42rMZImeoVkiE/NSZIve
	wSgwpTyq6E6PJhyBBmzPi1HPbkQZELeVYnj+21O+8EtMQVhXoeqEEu5zal2hFt8J
	pkyNJNuQrUyKYRd4jSZMY1WH/pI4kfJugc9400mc075bYgzvuZUYAqAW4Ej0UW6A
	sxgQgmlPda3j03NUK2Pm7ftfPav+kva7BT1zkDikGoCjnpIFiKiVkV1qfrjuSpjP
	Om+2PivcK4Fl1NJmWucqDUxgoe1SqQTSwAkKbXPiPm2Rv+iORJfyrwtMz7t7gAAM
	tPShJQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jktb714-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 08:46:41 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30ca81e05bfso694758eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 01:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782895601; x=1783500401; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kTd/R/2EJF/1DHxNw7D2N/60ZnX+FUJkLfb7saHZSjQ=;
        b=EkK3EZbQMtG09hwHvn9EDIcaXvg+otFd26XVv9vcpdp3b0o1xDVkPoouN29iuYxShs
         vsXRcXDWDkwaNVa4aB8CVvpgygb8bQVsVTKZPTyqIbkb/g0VIrcDhtRI8Y6N8qs/KcZo
         rjn0qxLd7IUfQWtIjqV3uYDZ+fY5pJsAfDSkllGBVfaDRFjK4qrcjElQeEof9GzXEjAr
         /n3m3RqAonR1OWWU7IT19/4a0aUOi5fKNh+TkAlpLop/P03YwAfp/Oh2KqhxH9dmDoA2
         SBC5w9l85cK0uAYqfJQo4VsMVihLPEmajez6CMzf5OXCy3AOx/BMaJJwrQQqwQM6q0Di
         z63w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782895601; x=1783500401;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kTd/R/2EJF/1DHxNw7D2N/60ZnX+FUJkLfb7saHZSjQ=;
        b=VRxRvxdjJRCyo/Nkg+L+uJWkiB/cfkiqOyoqmWysMbNBhgm6lsGh08hlj9lf+uTel2
         oveBImt9WgptNdGVusFiGZJeTgfYP+UcI1+hxA29UVojrlTfs8vXnIeCkCaqfBrYL85h
         xeCDusLBc1CkzrdD23dAxQkTrsmJMsBcVKhrZmzfAiVxwWyu6JWExt0q6WiT5vbAi8Zt
         nWdr3AlF1YVjS7X3k7z9vLGD73XKIT+4I1kKS/taS/o7Uspl2jIDVY0ofk0Z6J1vqMVZ
         oQbZw4LRcDucWh3vfSzGSMmqEsCZsQ1JqiJDVPjsVBadvHwg3A0JlD8KfC8vrXZszHZ9
         /nbw==
X-Forwarded-Encrypted: i=1; AHgh+RomTPlen+xvkWSAhaADKJyEQvzSzcpMJ8bMIb/LXcdUbdNxnfN+EfmuNY/E7hB3b9XPUReuIsVko+bfY/uZ@vger.kernel.org
X-Gm-Message-State: AOJu0YydQLsJLIt9hCsEqwzDtGDfXfgEIyZH6Ik+ne8X3lpgbGXibTh1
	yOVaasxSUB8nWCQutOHQhz/JjaVpTyhxTcsbwZQ+WBkhYnmc9IfttVPOKTF6HXSb3y5BHXdUJT7
	AN1S2dH0U8efAaq8BVU34nyGCzeANhJUJXcjrNPJoN3cGLlmS7ZGlogbB5CFymeo7+WCPAORv2v
	jE
X-Gm-Gg: AfdE7ck0M820J9Oidw9c21yhxTKmBROzhTHnyuY3okvU4gvLvsNosE/CMR5pQtCS21T
	dRowGCOqOWRmRwPuq66D7lA0hGH7g+caTGMbb6nvKhQxOKE7D4oFnLtMckB17IFfOWkgF0Ae8Kf
	qiCA8PPjXZJISVEyvHWqfH6tPIGd+zRTwQPb0fSLoFWl8p2rJuzFdoXN8OP5c+9Wwp1HTzNhkME
	5r7Fl/QcBDJIVuBdy4WMvsAD8mqtVSg565nccQwGrUfKFttoxZN18GteeIXfjI0UbIQqTFVkTaQ
	zfPFpzHOcu3XN/OvF4SdgaGAS+KdWN2TeZkngAdlqVQUvdqbfA9BV5+SgUYZ4laK1t/Do7OmKRS
	NMT3C8jUusiJEaOX8vHDszqXcIRSZT2/ik2itPk0H6WQUtdLnRjQrqqPWaSLsJO05sYcKKkQcKO
	pjOleJLf8xLaygPF6jGyatpB6S/+XM8txQcVpvCK+6
X-Received: by 2002:a05:7300:2211:b0:30c:536e:3a8a with SMTP id 5a478bee46e88-30eff0534bbmr843572eec.6.1782895600785;
        Wed, 01 Jul 2026 01:46:40 -0700 (PDT)
X-Received: by 2002:a05:7300:2211:b0:30c:536e:3a8a with SMTP id 5a478bee46e88-30eff0534bbmr843543eec.6.1782895600255;
        Wed, 01 Jul 2026 01:46:40 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30efaadc5bfsm4891524eec.28.2026.07.01.01.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 01:46:39 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 14:16:25 +0530
Subject: [PATCH 2/2] cpufreq: qcom-nvmem: Add IPQ5210 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-cpufreq-v1-2-98656ad20ff3@oss.qualcomm.com>
References: <20260701-cpufreq-v1-0-98656ad20ff3@oss.qualcomm.com>
In-Reply-To: <20260701-cpufreq-v1-0-98656ad20ff3@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Ilia Lin <ilia.lin@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA4OSBTYWx0ZWRfXxdRsZQ877DmM
 WjXNDotE7Pb8cXDEoWObNoveKtRslKMnDw0qjgq53Ym1n0F54jehH1GR+D0ACEBIY5KO2R6E2ML
 rskjyNXSyyM3nJhlU7Gr3Vr4McbeQTw=
X-Proofpoint-GUID: KT0zLyuP9fcYCdKIGi-lqkStkd-E5DBA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA4OSBTYWx0ZWRfX7SF1a7Y4uPvJ
 +EMtzOlXN6tJYUa99ML8hXqR/gvflaqd/n8gKdHZiI69//mqXiUN9wkd6MUcS2aFJqPdJYYdOH6
 a1nvylzffxajx7agPmGIH9LnN5pKHIT2T2Q4DKyAh+a74Y+uc7QuDp+AScI2ryHgZ81YO1SRQEj
 F0oVmeg0B21Ouqprld1yQey4e6eAahRu7tIjoRmDlFUH7BFvQpfeNRUfi1tu14R0sTn9CcllqPs
 o4DHKgQuaLvJkp1iYS78/iGoDBQ7RX6FKYjPTQX82OG6oxjJ+ORndJw+gg2rZOYu9e6UYKQ08JG
 0n9Ba27e8FIlXlov1gP1zhyX1qzYJGQuNMxiAGQMdm6TBm7N/mGOCa1RR69UWRc8U+5fYUwiIiJ
 DkVkEPcZ4PAHNTOXzCN6WSfqv7XxutpsdyCuKHbiiqmKh131GtgkUpnwStjwyk+/0LV+5bTVROC
 Q69bwG1fZSgUSAoU3hA==
X-Authority-Analysis: v=2.4 cv=R+wz39RX c=1 sm=1 tr=0 ts=6a44d3f1 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=3tsBT5a87JaRe40zvzIA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: KT0zLyuP9fcYCdKIGi-lqkStkd-E5DBA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010089
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115612-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:rafael@kernel.org,m:viresh.kumar@linaro.org,m:ilia.lin@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:varadarajan.narayanan@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F38456EB47E

IPQ5210 SoCs expose CPU frequency limits through an eFuse speed bin, and
the valid CPU OPPs depend on the SoC variant.

Add IPQ5210 support to the Qualcomm NVMEM cpufreq driver so the supported
OPPs can be selected at runtime using the eFuse value and the opp-
supported-hw OPP property. Also block the generic cpufreq-dt platform
device for IPQ5210 so the NVMEM-based driver is used.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
 drivers/cpufreq/qcom-cpufreq-nvmem.c | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
index ff1204c666b1..284eece9e230 100644
--- a/drivers/cpufreq/cpufreq-dt-platdev.c
+++ b/drivers/cpufreq/cpufreq-dt-platdev.c
@@ -200,6 +200,7 @@ static const struct of_device_id blocklist[] __initconst = {
 	{ .compatible = "ti,am62l3", },
 	{ .compatible = "ti,am62p5", },
 
+	{ .compatible = "qcom,ipq5210", },
 	{ .compatible = "qcom,ipq5332", },
 	{ .compatible = "qcom,ipq5424", },
 	{ .compatible = "qcom,ipq6018", },
diff --git a/drivers/cpufreq/qcom-cpufreq-nvmem.c b/drivers/cpufreq/qcom-cpufreq-nvmem.c
index e6d28d162442..b2aeda7c564a 100644
--- a/drivers/cpufreq/qcom-cpufreq-nvmem.c
+++ b/drivers/cpufreq/qcom-cpufreq-nvmem.c
@@ -200,6 +200,13 @@ static int qcom_cpufreq_kryo_name_version(struct device *cpu_dev,
 	case QCOM_ID_IPQ9574:
 		drv->versions = 1 << (unsigned int)(*speedbin);
 		break;
+	case QCOM_ID_IPQ5200:
+	case QCOM_ID_IPQ5210:
+	case QCOM_ID_QCF2200:
+	case QCOM_ID_QCF3200:
+	case QCOM_ID_QCF3210:
+		drv->versions = (*speedbin != 0xcd) ? BIT(0) : BIT(1);
+		break;
 	case QCOM_ID_IPQ5424:
 	case QCOM_ID_IPQ5404:
 		drv->versions = (*speedbin == 0x3b) ? BIT(1) : BIT(0);
@@ -618,6 +625,7 @@ static const struct of_device_id qcom_cpufreq_match_list[] __initconst __maybe_u
 	{ .compatible = "qcom,msm8909", .data = &match_data_msm8909 },
 	{ .compatible = "qcom,msm8996", .data = &match_data_kryo },
 	{ .compatible = "qcom,qcs404", .data = &match_data_qcs404 },
+	{ .compatible = "qcom,ipq5210", .data = &match_data_kryo },
 	{ .compatible = "qcom,ipq5332", .data = &match_data_kryo },
 	{ .compatible = "qcom,ipq5424", .data = &match_data_kryo },
 	{ .compatible = "qcom,ipq6018", .data = &match_data_ipq6018 },

-- 
2.34.1


