Return-Path: <linux-arm-msm+bounces-91410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8N/tKEc8gGmD5AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 06:55:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE88C864B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 06:55:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 72A853017003
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 05:54:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD0B32D63FC;
	Mon,  2 Feb 2026 05:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PzNX5qEd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UXjYErqQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2991B78F3
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 05:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770011682; cv=none; b=botks5Q/7mvb8PTjdg3z5wrvGb2CB3cHXbukK+zFh7I6+0I5TwMa+xS089Ae6i+5uQZeWpM6h9Q/Fwfdv3242e3ddJ/N5dJqZfb1m6+fjJimSjwpJhA97vCCeVeBlo+f8MTPXjysdiirc4nuSRPMyIMxBYdIhtZPEf6OmKD5IRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770011682; c=relaxed/simple;
	bh=Jk7zW9DfAJvos3787rUzzglH4/n5YuZy/w9oENa/MP0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PLZP6pGIJjjiGY2ShrzrB9thZ8wpMEefyQN3gdrM1H/R4g7K5d/A/O0Zy2jLwPHGG+HVacJwV3TdI8Hd4UHmiJwvbYGa7OO7aAZ7H7HinUkuuZu3qz4mw3u8X0G5i0Wi6sBGwKZ5e/4opommb55SaI4FF1/KDl1LuWkVHPZIyOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PzNX5qEd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UXjYErqQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 611LGJjU508286
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 05:54:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=WnOjDn8hve2TQf3r/j3F/Up7LhWDpZGwCJF
	66onCxCU=; b=PzNX5qEdeZvtOkn1ksyc1am8Yr4OtOweoMBrQB+q4pRn23zkKIH
	I0wBba703OarqZ2y9veLT7XrRLQu0PY9l5P9/WORv4OjT2tssjZi+XBc5JN28Cf2
	G9QEyvsTdy/VziwNUb+twYybiH2jUuNHnhzGFEupcBJqeriAGWubWvyXMt00SI7d
	sVY3U2xjqlxkrSSDAnmjPP43LykFaA6OHz7ja9PdkWqZq/+9ikUqImI+hs2AgdX0
	s6J62ptVCpJsYNAAhm+LCmN4JiE/0c3g6y/fHBsuqgGf8rWuFSmzICpoQkC1QNkB
	MV7bUqhWh8E/00p27Ju8xIMqeIIkeiD9luw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1avx40yk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 05:54:39 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2b724ff60e6so4622491eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Feb 2026 21:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770011678; x=1770616478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WnOjDn8hve2TQf3r/j3F/Up7LhWDpZGwCJF66onCxCU=;
        b=UXjYErqQfiQCGZB9p4VzlDybLMI1BfBqJVPAB8PorDFpk+e/BNH+w1LpVuzcIBpvcT
         VBy55D6vK5Y+Teto3jvfnNqLoPaIECJXb9O8MEJiH0MSUZJsA/jSzffbWgMdVdS0Y2XW
         3l2FnAAxLwQkp17NnLkOhR/F9EuVKuKXy+c8AhgJ0aXQ9pyxLBrJzfcVTlaDN5LTzy/b
         AXJaeLp2TraPxI/DWngJzVdvzYjf0o2/yXOtbyv30X6WMJ3T2rCvUJMu8aV66C0x/O0z
         u16vGvqxg7iEKoqEnojI8h56FbxSXoKmTjGKXgiHPogHdAm/VRCpC5lu7zH2ktKpNULk
         rgtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770011678; x=1770616478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WnOjDn8hve2TQf3r/j3F/Up7LhWDpZGwCJF66onCxCU=;
        b=EGvLe2V0z3Zmv9i1SjSc5J/slDCRSaCSBm9n4KlFpQrPxMhqLyEfUXyB16yQhkmvRC
         jImeIZeHLZ8v3SN5JCD46lrzKQSSvlEFwk/PqHOq59eiKpla5I7Dg4FgBqmJGUG0npYc
         gZeORd9+bi2rMymFzvfRcZqbG/9y1hZ0+n9jGFEFu9zw7rmD/wGrPaO/MZ2Xhwt3Z151
         Lb5u6DrP0Cpolb6XL+mj7QoTfk5QlMPCyGh4pEXFsVCFV4JemmL1BTLGQWkgpA3N2+AV
         fikrm6hl2ObjZ16XGRGFMNuXESIL0JjLTgBb7f2+Vj84WbfhFextG1F9xQzRvtCj0VYF
         ABGQ==
X-Gm-Message-State: AOJu0YwHvjxNicIED2kYduROLR/dnLZLhDAZvfSEx0XlTgDBXYKrfLQp
	YNephKWXZ4jx7PeXQ8wSEhRiTV1ZagkRee/5qBq8NYWMR/WuQPLryuW/4Nw9bxAvHD4QYG7Nbal
	+c2Q+++e2Fit1uuZvb/uYSY8XS3McOJxOzxngch1ohuV83Y+5zWDqNkKLXu5kCosPp6EZ
X-Gm-Gg: AZuq6aK/AzPYAiCtuyVyrD1WOJxpWTV9wvGvr2bVyH/8LFqnbLGOIFECcq2rKRW6Jio
	rd0lp8Fr+EWyw44zkz+tzv8DA0c/gP5xptL+SjsvuDV3pLPLOcg23xwjXjAQy1kRHgKKMRjq4l7
	uJmK7VxTQ8MFPKmK0tp7cmwN7PJWSDLCnYAzQByLqd5PcFb0LxG2mqX1KrqOUfoFOy/1r4oWUhK
	X9bdbXldWqNjX7U/k7T+CjY2z/OfKSxMXxCSHHcqb33APtDbQv00zwTEWsrm1BSRB0RuAx4qOBe
	cB31MKatQOFXgA8+2B26pX5hWl4ipxH7Ql+H/29keTOwipd8Y6a7NZbuFrQVxZo1rCiiHtFMiXK
	5Wjat2cY4skx2743wkgvg3VX525h7WnvZfUR3wfgl1p6buffrjdKpBTc=
X-Received: by 2002:a05:7301:1688:b0:2ac:1e68:2342 with SMTP id 5a478bee46e88-2b7c8940a53mr5005487eec.39.1770011678400;
        Sun, 01 Feb 2026 21:54:38 -0800 (PST)
X-Received: by 2002:a05:7301:1688:b0:2ac:1e68:2342 with SMTP id 5a478bee46e88-2b7c8940a53mr5005479eec.39.1770011677819;
        Sun, 01 Feb 2026 21:54:37 -0800 (PST)
Received: from hu-liuxin-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1add664sm19618604eec.26.2026.02.01.21.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 21:54:37 -0800 (PST)
From: Xin Liu <xin.liu@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        jie.gan@oss.qualcomm.com
Subject: [PATCH v2] arm64: dts: qcom: hamoa: Add remoteproc in EL2 device trees
Date: Sun,  1 Feb 2026 21:54:36 -0800
Message-ID: <20260202055436.818098-1-xin.liu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: rMFV2tvyU-8FDFEU9G5hxuYdD0FAfYrc
X-Proofpoint-GUID: rMFV2tvyU-8FDFEU9G5hxuYdD0FAfYrc
X-Authority-Analysis: v=2.4 cv=P4w3RyAu c=1 sm=1 tr=0 ts=69803c1f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=GxtIMRurDqL_IDABb0sA:9 a=eSe6kog-UzkA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA0OSBTYWx0ZWRfX1W90fuE8qoQr
 pRm5YFnVUNMbQtOMDY7puewG1j3bmm3DYVZ8oZgtzFaSqNE/lTCvl3Yuy0Fmj3AvB26tB7Cyr2s
 4rd4kkLp65wq3iqtLJ0l3xSMMaPzUA2sFqJCDYzbwrvQfdCu/1MyvqPLxuNm+8tl6KLuGDWCFQq
 klJEf3icY72KwNZrOVa3Lnchhlynoo8khe7Fcv4gaXjJBX7JvEyAtIdyGC9ECOlfXlt+5lunu1A
 2L/mHuFD0Xg7IpM1kF53YCUmepa1erjRII2CUWQv/6j1CV8pUQYMGs69vzQxcGJdBS7/BdUq//8
 uxLbwhzMMkYbbilS4EjzqVfBxJimICK1y+w4p3dioYTCeBd+LzoMTSoR9SDf2fK/weHAxIOgsbh
 zbeLfMmWrtA+SY5omq1YgvroHhVATuHctiZ2lDZfhRSTRMaK3dAddLv+aqZgrn8Cr3m1YaWmRha
 V+lcpqta8apIqSBq4aw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020049
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-91410-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:url,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xin.liu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4DE88C864B
X-Rspamd-Action: no action

All the existing variants Hamoa boards are using Gunyah hypervisor
which means that, so far, Linux-based OS could only boot in EL1 on
those devices. However, it is possible for us to boot Linux at EL2
on these devices [1].

When running under Gunyah, the remote processor firmware IOMMU streams
are controlled by Gunyah. However, without Gunyah, the IOMMU is managed
by the consumer of this DeviceTree. Therefore, describe the firmware
streams for each remote processor.

Add remoteproc to the EL2 device trees to generate the corresponding
-el2.dtb files.

[1]
https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-developer-touchpoints.html#uefi

Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
---
Changes in v2:
- Fix the adsp iommus mask
- Link to v1 : https://lore.kernel.org/all/20260130073113.3091884-1-xin.liu@oss.qualcomm.com/

 arch/arm64/boot/dts/qcom/x1-el2.dtso | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-el2.dtso b/arch/arm64/boot/dts/qcom/x1-el2.dtso
index 175679be01eb..ee006742d6f3 100644
--- a/arch/arm64/boot/dts/qcom/x1-el2.dtso
+++ b/arch/arm64/boot/dts/qcom/x1-el2.dtso
@@ -52,6 +52,14 @@ &pcie_smmu {
 	status = "okay";
 };
 
+&remoteproc_adsp {
+	iommus = <&apps_smmu 0x1000 0x80>;
+};
+
+&remoteproc_cdsp {
+	iommus = <&apps_smmu 0x0c00 0x0>;
+};
+
 /*
  * The "SBSA watchdog" is implemented in software in Gunyah
  * and can't be used when running in EL2.
-- 
2.43.0


