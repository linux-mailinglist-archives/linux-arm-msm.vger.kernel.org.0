Return-Path: <linux-arm-msm+bounces-118729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aqStMrC9VGrIqQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 12:28:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CC0749D01
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 12:28:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YDCaT6y9;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XBBhdxrQ;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118729-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118729-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A0508301C2F1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 10:27:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A14F3E9C0D;
	Mon, 13 Jul 2026 10:26:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B083EDE68
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:26:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783938403; cv=none; b=dAQBP0cza/A/Nq24VPzVCBnKijikDbLs5a90Cij65nypjgJJ8E+JC7duLNL7shZWHrQTgKswQmh26dWxANp7iYPvHsAer6iG/TqKKPjHoanw+7pewerYR8JKdEdx1gc4kU2MxnawCfj1dtIFWfvyaYPnx1Z0kNpm+iwZeZ6nZJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783938403; c=relaxed/simple;
	bh=rQxxLM0jJkOrRdQzxvhz37dQOF0NxP1AODzN+crLYtk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=COkdsEZ43jjhxBxrCJ4uJIadUad2/qvpgMDkatLXZQcLu5FqVF6beuTRk67J+U+vDjU57aJ5pBGm7EH7ppJjr7AZAIMKLJ6AmDYHyET6ggt9NhTX01PoIfUwivodL2JldWnpX9F49uFvbfFqkynqlG54MTPjTWJySRCElq/c/+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YDCaT6y9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XBBhdxrQ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D9RFu61123067
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uAnOOERdIxllvvm3kVk2q1b+wMhPfevl13MsiW4ZmC4=; b=YDCaT6y9hfFasqz4
	3GBngIK8OSFMkdXjMkewNEokHoWWr9t3k5sfo5idc//uMsagCjdjs7bPGMB1kl//
	ESFaWbsiavkRuYgH07hrgDe7As9lNLZGayBP6h4pPqNKLSM+G2Be985+nrEWuV7J
	5yDjFQA+QE17Ix3zwWm6xubwe26knT4bJXCSN75Wyp8XGb2pWgd8h7t64JXgtgyK
	LjKdFW8K92LKiU0xXvh382UUWFWK2NyS7O+hU9MJzJgfB93i1hbx4k/09hdqILO0
	a3Z2GfB7mlkYM09S7ztdIKPRpt9k96j9pOy2n90QjndnUYPHzefSMgcvQg7gU9vd
	stxPMA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwda071r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:26:36 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ca6bd8a190cso4608321a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 03:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783938395; x=1784543195; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uAnOOERdIxllvvm3kVk2q1b+wMhPfevl13MsiW4ZmC4=;
        b=XBBhdxrQLayGOFUa7A9aHafmX5ZHZBlfeA5bCVmZw0J+r70fXrVA4wi5au2o+li87A
         ulmYHh/hW9qp8LzedtlZYLGKeOuocdz1KEqVi//xAYOU5PnPp+v1IN/XBCKDYQyW2Gid
         8cUkrMQYEROu0zTcoUd5uBzOpyK3X2X9KFhsnNQxLqJ5lNetnCZWn767dBAJZJ1JcxRe
         XiVargc4JrFvjTZN+D6TMhR8V0L7/SkJgz+/AtSgaOMb21ELpRqyAxnA2/5KpHKElDvU
         QLlvoFfx2ZY8eyixuQgnKCCzY4V2mi7sP3HtV52meJ51ZEjOxIKy88HTWdlF6DZlE3UL
         mcAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783938395; x=1784543195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uAnOOERdIxllvvm3kVk2q1b+wMhPfevl13MsiW4ZmC4=;
        b=GBF/14HjMxrXVysSeTQrf86kJLAAnvi8on9/aXKQ7wMghcGVrtpR6kIUqgyi/hzfih
         Gbg3ITHX5uivsM117XzQvHn2HgdIfRFAWGSLCqxOUytP9REItJw1RzL86yMEvuLpyobo
         VIeFPrKtYFjTLYoZW7QCMOgvuJl7ud8ImIiXSsL6vYqJkpYv7h7VLwHFc/thyNSwxs+4
         DkfY7IFqm6H1/gYJRAJDqpHhsq0pDuIIrbZLBFK6yyDoueq8ywKq6ivvdt8mbw+W8gQf
         MmMqb+Ug+WSSB+LkJK6A9fxQTvYpxc6p3gNowUTHupboGKDYHnfk1P+vlXUi1cBIk/tE
         pPvg==
X-Gm-Message-State: AOJu0YxXBlTR762PLjp+oguFUkU4vZlrDOBx+kYwqXJC1CwCCcYK7dWk
	ZrBsJ9lsxNUth+NQkKk3iGMWYeniMY9lVHdO8Ycvk9rntqCDHJWF4fQIM0CPVoPClyIhOjDzg8l
	0ZEvOGDb43Kt6LBQF4LVd/a2VRqZt2Z7JyQUJDbqV8rV57GaX7z7ETIWDWTn9HXvYSk3U
X-Gm-Gg: AfdE7cnnaN7h/37d0jC7SljPu32vJlKwTOO6V42/bNqsx+DgavggtLk2cLfmvoqpRke
	vMwFebrnMugFUfuhfdvvp8OdMBg3h3GGsyDzIaHN805Y2MRPTF7+mt1bg2vacv9USmm5TXKqpoy
	EdoPiCL3nNKC7rKMm7SHtvxbP4yWrQFTZVWlEYKZvd7Fz/2H6lBVUef/8ajmkLbDdXAYqP50fS7
	MyY9TFHzMiH6ONleDpb2MVjL2/zjgzLeQ+xsw92vXURWzQc/b9NVJph1AG5EMyWo58+KHHGbrsN
	HWxSd/GVCMt+Zl88BN11qyKI+jRNkGB1h8OhI23wHN8nww6A0jEIuMzgGTKpMTbJ3vxFgXYIYc/
	+yJbZC/DBTIjRzfdUKuA1HDMgVD4PWnyN0wVYdA6S
X-Received: by 2002:a05:6a21:a97:b0:3b3:bf95:f7e3 with SMTP id adf61e73a8af0-3c1108cdbe9mr9176897637.43.1783938395221;
        Mon, 13 Jul 2026 03:26:35 -0700 (PDT)
X-Received: by 2002:a05:6a21:a97:b0:3b3:bf95:f7e3 with SMTP id adf61e73a8af0-3c1108cdbe9mr9176874637.43.1783938394793;
        Mon, 13 Jul 2026 03:26:34 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b924258a2sm49010603c88.1.2026.07.13.03.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 03:26:34 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:55:47 +0530
Subject: [PATCH 7/7] arm64: dts: qcom: shikra: Add CPU idle states
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-b4-shikra_lpm_addition-v1-7-3d858df2cbbf@oss.qualcomm.com>
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
In-Reply-To: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783938358; l=4857;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=rQxxLM0jJkOrRdQzxvhz37dQOF0NxP1AODzN+crLYtk=;
 b=HMNNF2swY0UNIiA14wmbPhpGg2FHMfShS5/aKewT3nlu46iz+CqJmZZ4gE74fNJhLIJvH0JAx
 elJPM03GWUICheEqCjN5WsgB0cpNx0rGQW5WaodVj6o/nMMzVxAgmoi
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEwOCBTYWx0ZWRfX92x16jB9yB2q
 Bl4rmnkoyZ6aOlrPQ9WApzuinaAPSQGY2O5V6S0NHFqkM3yDXGae4FYmlIGLykuu5qCRGK4lTYl
 q9PTrtQgldB4AYQkzHwyoSb3cagpInA=
X-Authority-Analysis: v=2.4 cv=cNbQdFeN c=1 sm=1 tr=0 ts=6a54bd5c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=bsYgX5F8lsGEO7NoQ3AA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: op4-VFnGYVNTQr8LjUMwU_YSTyAaiaOT
X-Proofpoint-ORIG-GUID: op4-VFnGYVNTQr8LjUMwU_YSTyAaiaOT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEwOCBTYWx0ZWRfX5wqIQ3syy/3j
 unIgS4+JDwS74hPw8DTZ0pbYckVoLlCrVx6IJYGrUybwxYM7Ewt+BnU2l/XsNNHmtRnljal8HTW
 YMbMwxffrzXlTAhQKcdajP1xmXC/sRL8NGDY2DWVbToYxjvWFAISwiKUAqs6BiprXI2t75HiGZG
 767P/pIhVbsXgTzjcEkr7LgQmlon93CbqsjT4J94C/Rw2wCNf3wYmxJB2ybOqPtxZgGJvxs5IoI
 ybrmHZfNVZlfJa9REF52J0LdkvQyrPgfgfFjQ5wEDtjAlad4Icb0uCd3wQRneTJh9fQSoHPBf+Q
 fnkjwkUlIl8XkZU1MSu+Fdamvq103ND/9rI+dpJIuBl7N6etWEed1p9IoNSs5IRxWRvpmDJJTqz
 Fm2L292H9dVe+K3Y794t5NtWVy5LQWwvz/02WT4TjHfCgT2yqx9GNhM9BmLCkmPHT/Z8aegrOBF
 cGlLrmQB8oc/pA5TDtw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0
 phishscore=0 clxscore=1015 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130108
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118729-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:shawn.guo@linaro.org,m:maz@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 68CC0749D01

Add idle states for the  CPUs as well as the whole cluster. This enables
deeper-than-WFI cpuidle.

Add MPM under cluster_pd power domain.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 94 +++++++++++++++++++++++++++++++++++-
 1 file changed, 93 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 4e5bc9e17c8ed8914733ac9fdc9b69128b40216e..bbe198d4a476e9d3037439307a0d12ab58049de2 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -40,6 +40,8 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			power-domains = <&cpu_pd0>;
+			power-domain-names = "psci";
 			next-level-cache = <&l3>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
@@ -50,6 +52,8 @@ cpu1: cpu@100 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x100>;
 			enable-method = "psci";
+			power-domains = <&cpu_pd1>;
+			power-domain-names = "psci";
 			next-level-cache = <&l3>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
@@ -60,6 +64,8 @@ cpu2: cpu@200 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x200>;
 			enable-method = "psci";
+			power-domains = <&cpu_pd2>;
+			power-domain-names = "psci";
 			next-level-cache = <&l3>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
@@ -70,6 +76,8 @@ cpu3: cpu@300 {
 			compatible = "arm,cortex-a78c";
 			reg = <0x0 0x300>;
 			enable-method = "psci";
+			power-domains = <&cpu_pd3>;
+			power-domain-names = "psci";
 			next-level-cache = <&l2_3>;
 			capacity-dmips-mhz = <1946>;
 			dynamic-power-coefficient = <489>;
@@ -105,6 +113,61 @@ core0 {
 			};
 		};
 
+		idle-states {
+			entry-method = "psci";
+
+			little_cpu_sleep_0: cpu-sleep-0-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "little-power-down";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <549>;
+				exit-latency-us = <901>;
+				min-residency-us = <1774>;
+				local-timer-stop;
+			};
+
+			little_cpu_sleep_1: cpu-sleep-0-1 {
+				compatible = "arm,idle-state";
+				idle-state-name = "little-pll-power-down";
+				arm,psci-suspend-param = <0x40000004>;
+				entry-latency-us = <702>;
+				exit-latency-us = <915>;
+				min-residency-us = <4001>;
+				local-timer-stop;
+			};
+
+			big_cpu_sleep_0: cpu-sleep-1-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "big-power-down";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <523>;
+				exit-latency-us = <1244>;
+				min-residency-us = <2207>;
+				local-timer-stop;
+			};
+
+			big_cpu_sleep_1: cpu-sleep-1-1 {
+				compatible = "arm,idle-state";
+				idle-state-name = "big-pll-power-down";
+				arm,psci-suspend-param = <0x40000004>;
+				entry-latency-us = <526>;
+				exit-latency-us = <1854>;
+				min-residency-us = <5555>;
+				local-timer-stop;
+			};
+		};
+
+		domain_idle_states: domain-idle-states {
+			cluster_sleep_apss_off: cluster-sleep-0 {
+				compatible = "domain-idle-state";
+				idle-state-name = "cluster-power-down";
+				arm,psci-suspend-param = <0x41000044>;
+				entry-latency-us = <2752>;
+				exit-latency-us = <3038>;
+				min-residency-us = <6118>;
+			};
+		};
+
 		l3: l3-cache {
 			compatible = "cache";
 			cache-level = <3>;
@@ -144,6 +207,35 @@ pmu-a78c {
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
+
+		cpu_pd0: power-domain-cpu0 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
+		};
+
+		cpu_pd1: power-domain-cpu1 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
+		};
+
+		cpu_pd2: power-domain-cpu2 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
+		};
+
+		cpu_pd3: power-domain-cpu3 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&big_cpu_sleep_0 &big_cpu_sleep_1>;
+		};
+
+		cluster_pd: power-domain-cluster {
+			#power-domain-cells = <0>;
+			domain-idle-states = <&cluster_sleep_apss_off>;
+		};
 	};
 
 	rpm: remoteproc {
@@ -217,8 +309,8 @@ mpm: interrupt-controller {
 			mboxes = <&apcs_glb 1>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			#power-domain-cells = <0>;
 			interrupt-parent = <&intc>;
+			power-domains = <&cluster_pd>;
 			qcom,mpm-pin-count = <96>;
 			qcom,mpm-pin-map = <2 275>,  /* TSENS0 uplow */
 					   <12 422>, /* DWC3 ss_phy_irq */

-- 
2.34.1


