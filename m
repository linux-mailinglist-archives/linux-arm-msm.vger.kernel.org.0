Return-Path: <linux-arm-msm+bounces-103471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKK+OjvI4WllyAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 07:42:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF2D417292
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 07:42:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9373730A8DEA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 05:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ECAF36606C;
	Fri, 17 Apr 2026 05:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CNlhbGE7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g3a5BcZ9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF6235F18D
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 05:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776404526; cv=none; b=tBhK+4uM4slp9oWGNo/2EjxsEYv8dHaeTOv61iMpv7v88C4KG7zUN6m72xORiXOxWQybxIdUZM+Qt5ANEVLmQPYIL0KqjjyQ6t/z+AIH31RYIwp1XgHcR5rVfkKYmklqz/vkqyRgjsJAnBm7WHNzog+iZhwLM0pRT+Sk9JT1j4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776404526; c=relaxed/simple;
	bh=4fBy2Ayi3Y3s3mKutKb0WAzySIwI4/LsQJp+ImZikFk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T3ySmtMCriCTdUsIBD1CVqCvydoAW2UEUDmxDXHVEpV6eEqCGosLs615CPVn2oyabBn1bDlRhRIy25bYUa2AkPE9Vyd19u3m45rYeXO167vF/3Dks0SXwWGsdHczSqVaiNXRlP1h/6xeoG9d0Wr109Lzfz8VjfIToJMDq7OInA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CNlhbGE7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g3a5BcZ9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H0fXqk1872469
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 05:42:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Cemqp6qLwYfP4Q8XQ3qHM17EeUxhiS0X8cJ
	K/o7jCyM=; b=CNlhbGE7Hpp4EkMVhT4GYWKDNBTESB4s/qN6EDgWD5JcV7l4FWh
	0+RNq9g47rwz7kVqTOzZQ8TKCwpbteVIBkyLKMcmRN3DHlZDOcgt04wtiU9a6HgH
	1s4zADHmEisELdsMy9R0iKo/kHngkPRi2vBtWo/KRpWiBR6z1+uMqPvsNIzY0psz
	TU3wnjC+zFEaqFAaJgAAWV4CVv4EVkVxVB3zIszX3J3Bx5KytOOfRGtuUnngzc9x
	frSsBsHrxRO3orEAiSznNTlVaUN7ryeBTpdnMB/7nFHVsFXhP2OSfIppQBRNoJNs
	WdjhC1Ghyj++gbxlOkgZOhjyZsM/o8Qztpw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dk2knafhc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 05:42:03 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2d889997495so1523080eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 22:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776404523; x=1777009323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cemqp6qLwYfP4Q8XQ3qHM17EeUxhiS0X8cJK/o7jCyM=;
        b=g3a5BcZ9xkn9DZxKIYXSpmDPZkMjwgExdUvTZ7SyDpmxA4iJgyOr2jUJ0JPYwd132Z
         DW5vEB/rfmcJSeclIsAR7rsO6n+NRRGJ0VveDAERBKmLf3YAAuJPx5yIHhJVFdehDM+g
         8/yj5gPJbMbRRKZxMVev6hKNcmDNdqZPkkUBmzkGKytRzNAUwD+ivr4WHEevZr5Yh60v
         OdjEasndwOnmCXLxxIjtGIZ3j5dm4V20fnHeaZP3qcpOgoH4V8BEZBiL1540P5O9CmyS
         eXJoyf4nr+sSipm9XDgrou6mOmAv7xBBI5DdTi3IlzKq01Muxr0LqIe9+gY8N513MFZO
         pl/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776404523; x=1777009323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cemqp6qLwYfP4Q8XQ3qHM17EeUxhiS0X8cJK/o7jCyM=;
        b=UPHqcOVE4SvCnf/KSFxA2o88LnVYuhrlWlphSh2mADSchGEIFbeofn7+TNMkDqNU/3
         XVCU5bO5lVod/mR31wIrFGfH7QmNXhwB3NBAOf7FebIrHkhW+f0ytX+4/78ajLNPSfqq
         VMmmKEPzmMSpHyvKi665HmKG1jqA8y3xmdRuzkWqTsHzDm0AS3zpPHrSkmihcuh8hwst
         AjUBQfuLDKQXL/hDipTA1vmrHl+DffvSKt1MIppD78nA2rdcCAA+H+VacWEpmLR/Sjxx
         UlgY7zn1+OetE/DbZ1zn6rK9iKfR3kxaPVwlvHJCbhCyfxePl2sdFb+wF0mcWJrmbs0i
         A8IQ==
X-Gm-Message-State: AOJu0YxsygYMmnsQ0iy14xvGmiehWaJJjZW2d3y5EraXh9pCSTnJ5mwr
	V+sPucAWRAYNJSrLSvqEaay3KKPW9Oa0VA8LiSQpNA54oCAWcyhoaZZELnvNuWeGOrFUuL6k+vh
	GIRdtLBaxTPK9QXM93Zl05G8oBQDZdcSNbj5U5PPMn6kXhkyO42pALiebZuCq5nlU7Iz5
X-Gm-Gg: AeBDiesJyFox6zUW1vUTDbAUWXjV8Z2quilZWCLKNZ0DKlRY5NVgasyc9DjSl55wey+
	K18GbMjRVVOH6nTUq45HJEuizOkfo/ezOm14DKg6ApmenjIV40Zvwl3RHaiOCaY4WLGX7sBtdzw
	w+53kI88sJ0HVxUbi4iO3or0pv08u9T8uD59nl9F2etMbdlgp2fD24+s4tKEgL46TwC9bFwnUJx
	LMQ4ujXT3QJv25jx17i/U2IY/go3XT3JdCHPG+SVen5qiky8GDedNdR65iNV3sf8MfzuEy9q1Xb
	p6Yiqup53Vmle1fQJ1O34QdGmME0ADApFk16hNyh1qu8sXNfhFasO4+kfU6QtUhHdpkpOQOZ5tW
	HOc2lCY63ZSv3vzUbbvt9iPo83eFuWZ4VuIU8eQVtzrW1jJbKaM7hc5tueEUeJ7uvBNb/idUgAI
	hARw==
X-Received: by 2002:a05:7300:641b:b0:2df:7fe3:96a with SMTP id 5a478bee46e88-2e4522010e4mr758859eec.0.1776404522628;
        Thu, 16 Apr 2026 22:42:02 -0700 (PDT)
X-Received: by 2002:a05:7300:641b:b0:2df:7fe3:96a with SMTP id 5a478bee46e88-2e4522010e4mr758842eec.0.1776404522135;
        Thu, 16 Apr 2026 22:42:02 -0700 (PDT)
Received: from hu-liuxin-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e539fa244csm823606eec.2.2026.04.16.22.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 22:42:01 -0700 (PDT)
From: Xin Liu <xin.liu@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        jie.gan@oss.qualcomm.com
Subject: [PATCH] arm64: dts: qcom: purwa: Add EL2 overlay for purwa-iot-evk
Date: Thu, 16 Apr 2026 22:42:00 -0700
Message-ID: <20260417054200.2402281-1-xin.liu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: L8b0sJfdoVjx_8gi-aUDVW0IffwbgBm6
X-Authority-Analysis: v=2.4 cv=XNoAjwhE c=1 sm=1 tr=0 ts=69e1c82c cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=zlCN0eSkoFmFCwwApYwA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: L8b0sJfdoVjx_8gi-aUDVW0IffwbgBm6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDA1NCBTYWx0ZWRfX95rYGYxAQa+I
 /1TIx/hEveEuRYVW5iWWzxDcI+I0nDp/ZUXDnfrIElJGyq4aWMxC6mwiJSj4UcFd+yn2vftu7L8
 j6k6mla8FC2mhJTumWWsIg70wxeybn+K1Yf1Y0NS2GNjHwOhQfcFhXJMI2zkbjeaw0SlzzwHVZG
 NJwMoFmZMlqwjl2NY0tVO4mHfw/FGOBA0qe3Jv6dgw9sSNZCFdoC+0aCSblmmyfqg434WwpmWIl
 EBpSADGWM5VXRlqDePr0bhQk7Ouvty+wFPFgKNMJnpfQ6NSJ2CUB1fZ/rtAyl0R+cC75t9aLNXo
 5dINT2BARzBqcev7hmipmXwiSFgFFjtbxiShkpNyo7mvdfxrFXTICvTF94fTDXbgrBNpLE+cg30
 VAP5Kel8aCNa5jMTUmvYeEYciKBTL6aVNtl+UT1VaFwG9CyzWornkynY+EL808c/cw7SkwmoNFu
 ynHFh1iiI5xi6B8IpBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170054
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
	TAGGED_FROM(0.00)[bounces-103471-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: 6EF2D417292
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for building an EL2 combined DTB for the purwa-iot-evk
in the Qualcomm DTS Makefile.

The new purwa-iot-evk-el2.dtb is generated by combining the base
purwa-iot-evk.dtb with the x1-el2.dtbo overlay, enabling EL2-specific
configurations required by the platform.

Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 4ba8e7306419..0e326f62357b 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -157,6 +157,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-sony-xperia-yoshino-maple.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-sony-xperia-yoshino-poplar.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-xiaomi-sagit.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= purwa-iot-evk.dtb
+
+purwa-iot-evk-el2-dtbs	:= purwa-iot-evk.dtb x1-el2.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= purwa-iot-evk-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-fairphone-fp5.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-particle-tachyon.dtb
-- 
2.43.0


