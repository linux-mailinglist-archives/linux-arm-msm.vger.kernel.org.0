Return-Path: <linux-arm-msm+bounces-94218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMaxHQzdn2nEeQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 06:41:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CF91A1159
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 06:41:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF80B3019F2A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 05:41:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04F7138A738;
	Thu, 26 Feb 2026 05:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SgJMvpR+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SfnYZOCf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE91D38A732
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 05:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772084478; cv=none; b=CSRgQNBzt3JW+SuLkROojwhv9YgyN6ct1OWwsFlqmSr4MRq53Efz5pkNcXe0+IqyoB2W6l8mUvy9lCt3O/3yzOOwmfiJGVF4Spws2Uid3bSQsVDy9nD+lBnu5DAsmViO8ROL+OaoTgtE3qOq7lY8AUdkWTHYbV4a3I96hFWjuPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772084478; c=relaxed/simple;
	bh=+xoluHXuR+D/fG+xPGV4oks6EJCgYvXrLylqcr0WyiM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qJqKVQ5O7aPiha43Yt6HvYPwf/wdPWMXEWGyuTOy9VR2N5bMCDxMNN6dlLbPg2VUBsj8YMB/Mqtw/GgHTiD5cYfG+9TdPDhsbjfP9BJeygE5pwZtrlSSVHqGxs1vamOYLea4QqYyJnU4Lzg+iurMi3+YlDPpojUxoAjst5qPwEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SgJMvpR+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SfnYZOCf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q4Vkub1280858
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 05:41:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=qau/tG4eqp9KBsHooQy+rhqtyNgLVQeHb6z
	b03iKaJc=; b=SgJMvpR+UZknoXez/8cvm3CsSLiDDGCTPjrybbYC8WZLu8ALN5E
	PwDeEVecrKyo0nBQMwOau4+ks7JgTyezliBJgY6UfCl8ltAdD12ml5cpJE3CYU+K
	V9sZSGhuDEh1Mq8Ehx6HS+tjeRLRTlnWQ42RI0CkAvsJtfvQPGkIMaEEtzVQDUvQ
	mAY3KsYp16kawtUVGkuBga9V4WNv2q088N2zG/GR1TxlA5liiVIenHd+yzAozd+M
	+i0hi4pn4Ths8YCfcpyHxrNRJaAQ67dyZFFWZMhsTcqhJ1DLoaaHnw4dYPMVZ9tp
	OdEWIwN3rc7bgmjyPr1p+S0o7ZORGg9ohYQ==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chx39kcvp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 05:41:17 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-463a7f204a7so7245822b6e.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 21:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772084476; x=1772689276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qau/tG4eqp9KBsHooQy+rhqtyNgLVQeHb6zb03iKaJc=;
        b=SfnYZOCfXLhEM4qsQX3pAI6uZg6p7AyWaZImiBZLLwI6iSwDqVF0EY5NdGkXGZvCMD
         4iq5Y0rRLPTXoG8+F8J6DU1LzmcZ66hMn31mFOBl4fYK9XwWqQy+fgeldeQ9qx7kWEGA
         rZTph6tBdex/32qW3T9SGGKzz7mTZtbHwexJUzUk+R3Our7PDa9nYgc4XfUo5stcVUsI
         j58kaTFhaBwGuFRh3ClXcuSN2zM1dPy0YfZmH2gjk3wJuPpjumTus2XevFJNH4IKj5yS
         uFGkxh/URcriQKgnzhAZJVSs72m2fNTs30+YYzvFxB/rr1b2q5xjoCo0eTG7LNi5Aoag
         2fMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772084476; x=1772689276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qau/tG4eqp9KBsHooQy+rhqtyNgLVQeHb6zb03iKaJc=;
        b=ZXqkW8T/BqwY8Jg5zhOs9PQSx+zrq+FfKEZMPt3LX2Nm0oUiossgUn9rT/U/2VWhIa
         86j20aGVddIqv2ntmDRnJ8QOmbt+Lpm5DEId8gxoVxnAeIOv0Wl4EPNjDSitvUxzV83M
         L111tXVYr27H5vZaUeKLczHEpOxX3aykNwqflmAnkvR0bME31KULUgeYZadFAEBQ3rTj
         YPAEQ2cnWsiNftAwhP9O+hbcPv7UYxkkTqIOOt10aut8jcFA65ZIlGVqwlR/e+WZzB8n
         CZf1zygxuDF5TcueOb3odtstW9fcNeVrQ4ptnBaQqU2jpXeWto+uPyMjxm+2XJpmNDVa
         +W+g==
X-Forwarded-Encrypted: i=1; AJvYcCXa6724BRGDIdfZXEs5zD0wc5/pbws+teXDinUcCIWzKeMc8tAMkRVdJ3Cqsg7q+w4DsKtEjP9Ue9O2BOqC@vger.kernel.org
X-Gm-Message-State: AOJu0YziHZLD8FwtzX3K0CYnJvxWz/I5c9POTWAd10Ds16qWnXLsPCaY
	XrleMjdyzYx/siFRjxtBaK5iVqfcuBnZC9NKTmrG1HVFCHibgZFQHezigCi7OZ83vNA/yxCft2F
	xi7W4pcsxoOrv3cSu59dosjFq0KRwpwu/PH/mq40bxDOgPQSgYEktL3lbTzRA9nhggEMo
X-Gm-Gg: ATEYQzyDM2HyS8mbzui+IZrNhJ+pA3LDYrosd3Kv7ZvcR4MAwvhLxtRyzVd70hltHQt
	oeqOfo8u/K+x/9oCC4KdGntnOUEosXOzGsRxkHkwDPBITkpdQ2MrfCFICfgGV3/9jw1XOURQHLk
	dG5kxB85AM5x/RUCkXfgkMavAUyjC5iwr7ciZre3woDmkx1nW57G12MUlI/msX4siJkkkY6yPO+
	FTowTEJ9r2GiPCJZtAtbkdqfKc3TL/Y+q9AegyFzLAtviGGWbx5njq6XfLbhoGnYYD8HUgiIbgR
	VZM/UkWwQpMLrZ0EqO64cI+relGhgJ/Ntiqzl7qrzNAE68argPYo9tWxGfkNTQ/uI6LJDUtNt29
	5l77+2TS/i+1bTN7y3Q7Ljb41dEPpyGX4tSalIfeaojAwoDMKl0tP5Lsm1NiiP81fMAE=
X-Received: by 2002:a05:6808:3a14:b0:45e:fdf4:b928 with SMTP id 5614622812f47-464461b5bacmr11446874b6e.24.1772084476427;
        Wed, 25 Feb 2026 21:41:16 -0800 (PST)
X-Received: by 2002:a05:6808:3a14:b0:45e:fdf4:b928 with SMTP id 5614622812f47-464461b5bacmr11446869b6e.24.1772084476115;
        Wed, 25 Feb 2026 21:41:16 -0800 (PST)
Received: from hu-liuxin-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4644a01200csm10434448b6e.7.2026.02.25.21.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 21:41:15 -0800 (PST)
From: Xin Liu <xin.liu@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        xin.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        jie.gan@oss.qualcomm.com
Subject: [PATCH v2] arm64: dts: qcom: hamoa: Add PSCI SYSTEM_RESET2 types
Date: Wed, 25 Feb 2026 21:41:13 -0800
Message-ID: <20260226054113.4156874-1-xin.liu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDA0OCBTYWx0ZWRfX4IkGkvM+MFgV
 ubUBaIr4Iml0xq1CJcrcMTYM2UFFPQf0bEf8MUMDEZTrqjCf8PE4IwK0F8M7SbK3BEkfpmTpJhg
 WjkkKb7x8/+oYqg1YxewVxCmBo2ykVdesfiJdFNq3Zg0eCXv1Lt/IVrgXx/hU6MdfkLp1HmI7RI
 BU81h3hDjMQt/TYNf1Z12dwkHN9gjG2ZipGebn4W4gVsF+TutWo/s3WVsMPfmr82VW9d0DqXOEO
 cF5ojcjnSAsUJQ4LEJ+TpOvR0eAlIo5LdZ2YwXC6q+i7zXIppHXfQ+60WXqc80frvbIlmbiCHPi
 a33773LCre4XTzH7z5wsuK+y3o4j0TNZJfjKAw9Y056098A51+iOtbSPtmtkc40TjXv7EeRAhIs
 Y07il3nrsK9HoWiJTiIu8svVt9MhAMgLoxbe/cwcBKxY1sItgz5KJf1Vq+p02T6r3/43nksx9zD
 zXRIgBwpPfCNMtEeSdw==
X-Authority-Analysis: v=2.4 cv=FvoIPmrq c=1 sm=1 tr=0 ts=699fdcfd cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=dSPudSTnkYQQv60Rkm8A:9 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-GUID: S7IwOp_G9DK8wpDinQLpZki21Dd3EzCz
X-Proofpoint-ORIG-GUID: S7IwOp_G9DK8wpDinQLpZki21Dd3EzCz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260048
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
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94218-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xin.liu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E3CF91A1159
X-Rspamd-Action: no action

Add support for SYSTEM_RESET2 vendor-specific resets as
reboot-modes in the psci node.  Describe the resets: "bootloader"
will cause device to reboot and stop in the bootloader's fastboot
mode.  "edl" will cause device to reboot into "emergency download
mode", which permits loading images via the Firehose protocol.

Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
---
Changes in v2:
- Fix mode-bootloader and mode-edl reset_type
- Link to v1 : https://lore.kernel.org/all/20260209042700.1186392-1-xin.liu@oss.qualcomm.com/

 arch/arm64/boot/dts/qcom/hamoa.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index db65c392e618..a1bd8c3e4061 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -450,6 +450,11 @@ system_pd: power-domain-system {
 			#power-domain-cells = <0>;
 			/* TODO: system-wide idle states */
 		};
+
+		reboot-mode {
+			mode-bootloader = <0x80010001 0x2>;
+			mode-edl = <0x80000000 0x1>;
+		};
 	};
 
 	reserved-memory {
-- 
2.43.0


