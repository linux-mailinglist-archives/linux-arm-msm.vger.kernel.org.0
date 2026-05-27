Return-Path: <linux-arm-msm+bounces-109968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOEaNWi9FmqHqQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:46:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6A15E204B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:46:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BDAD93022E26
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 09:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 172BA3EF665;
	Wed, 27 May 2026 09:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UcnYuSxh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DiMLR0Fo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2531D3EEADB
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875085; cv=none; b=EdamF4jGRkRMZI03UUJAbIiTRF5R8A+FLDsHSK2muYjKZSkfc4nuWr0gWCn2hGsawRoryxfNOrUihExMPpQwc5JnJ1h7ifnR23QTq0Vpl6inPrKgqUYurOjnIN7HvPQ8It2wxlawfZD89xLNMlPgDq7f8q4u5bHGpi3nj3MOpMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875085; c=relaxed/simple;
	bh=HvGcdrzs9sv1Za/3YZNiq7OWcG+JUczCiG/j1r159ME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tt1/iqk2E8i61iHiqKSVyAwgPWTFP9SO6inDsRl5AFJ1hKTzE7nFBbQkTLiUYqhlNdyQ3c/dZkmLAtFJPP87D61eUfhmfjDYy6T5CFWVHn6Ri3PnJjDhFq3cPwhsWZzBh0XsIDiJ/bQDP3fGQugM93kbtIHowZDEgEXIZpc+5js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UcnYuSxh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DiMLR0Fo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mZoT1350739
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xfajpo6nrlG
	EP54AarSeb21To7K0A8BSaIgEMLvvC/A=; b=UcnYuSxh+nGn7DWMXp1XO/2wx3K
	eeUfzkgYv3lr2r5Zev/W+RAzarK7z1M44TwcBAsys0YMngBbFZYGJzw0pTAXpfIT
	bLqIfd33nm5x0t13Sv6AluTZRbAoZXQMi+WKy3fEn2t50ElW5XZRffGjCQB/moP5
	iF4PGILCr7Ub67whDyo/8VBdPFGFUAj7ALO4oQxYDAM/MfG///OlTGR64A2Iw418
	No7wtu1+cIoL5uomm/2Et4JO+oQ7UvVP3EEzUdDe7zbQugRBY/XKjy0cCnBcO90z
	SEQ/oEB/5jTPMjERYEfT8AJLPk4mEW+CLG6R2Zj0c2CTD335rqqhuHy3E3Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edentkdu9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:44:39 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2baf7748d0aso117830335ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 02:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875079; x=1780479879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xfajpo6nrlGEP54AarSeb21To7K0A8BSaIgEMLvvC/A=;
        b=DiMLR0FoP7ewOam0PcyT2RAxMnGTvUwqXIe8gDDpXD1jM3HN12ynCl9J+lhyi1a4D+
         rEoRm7tqK4yUCxexLFqCUhj7UEa2Dmsh2sfh44o9/cHTQpvHMP3l4UImzx0/Oo1bb+uU
         c+ZS8xbKZHZknjIw7OgnDXDs1wQk0Hpj8oQbN3J+Kezf04NlsSIMsdqEuTNAQ+UMIveW
         2K5G1RiAPtUlotTxLvVmOzRJ8ihDcvxUH/1l/u6oB3r0Y70QPe+AeEP29uJPVODwIv5I
         E+YFnDszxCQAZ6SkJcBNwfiPrqYSjcf1fiYZMO3uxnDHQURec6OJ3AjPxJGQ98g8STZl
         qnnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875079; x=1780479879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xfajpo6nrlGEP54AarSeb21To7K0A8BSaIgEMLvvC/A=;
        b=P4qpWGHpGdviTy1OkxwTLjdwSCCJ4RtbZj/UqrupI+MZm+ipUhsRhbvJvPG/V4+raf
         2hBnhNSMSTC4z2a64uqOVeMQNNbYxFjPviWjdmkfKoJP6vRa2JcSJOdcBMvfqtZZ9pgq
         WyVqmBIDufLhrEKFHP9EcHyJKqLdY4dZ6TJUjGFG3Fr/JUY2EnTGOfXXVTDXUAbnLiGO
         JpVui3L/YQ93cLWhZFFpfxkPOizKvsJjxfnqCB19L7WbM1s1eIbgDkqg7+VFdGK7f0+R
         rA5tSp8LCZ81K/DS70YRIy/vM3pAcT8PvdVsG9GlIoOvd4jdFF9yuIrVySyVBrwYgYay
         3nBw==
X-Forwarded-Encrypted: i=1; AFNElJ+A8ZV3YcnwUR30eXo0x7F4bkjbXBRPbdd1G7bKlUe7p0tCEWQN24Cbp9cWJXa8CqWI3FH9N5Gx3n5YgZln@vger.kernel.org
X-Gm-Message-State: AOJu0YxpJQ0uD+jy47KrlNmKKQJ1ulxh1Hp3mZEhF5/ATjry2fDeVBhP
	rzq0G8qUSIeREQ7x27mjTZdGcRb7RZ/drzie7jg/gveRIxzFf80XNadwlv50kRIxDOHWezKv6Uu
	+8FJC5vOLPCTMgVnD+ZeNdjf3rO/1X3Z779ZVbwAVWuuWrv2zquDnuqbXOH8ymI4QDeWq
X-Gm-Gg: Acq92OG/wCRMwzjMsQkiAXwQVLw/peKpAiIbXIEYTR+pq7azlqi+cF+V2AJkM6eNztb
	DTHO2N4Q5Xyg73C4wh76FnSLSKC+CSJKPjsutv2ZnJ+0q/oNWX8kW0MwJlQgwl1HUlFICrB3lcA
	7hwtV7rTbbECrbinrWiPsRcSAqgQwuABKSfLdWLdfKYyzKFfxdRUTa07SUPeijLD6UFhHtcLVfF
	E/qV1Uv3IYquCteam26gxj4pi9+HWUIw4M2MZqm9LMHULiKMcuuN7jMo5I5KbKr9DkIo9UuV0qD
	RYOPIUUeLVxqW55qFF0X4KT25JJZi+5e+oG5EDbdBIbw7ne52tcb3IrVL50hB7/hJVFXcAckEgB
	LjyECmSzCAuQeDRv2BB865U1v3RQBSTG3wOQFpksz0u9Wo9rujUpiFIMxI3M=
X-Received: by 2002:a17:903:11c6:b0:2bd:3bfd:7512 with SMTP id d9443c01a7336-2beb065b6edmr245162845ad.29.1779875078712;
        Wed, 27 May 2026 02:44:38 -0700 (PDT)
X-Received: by 2002:a17:903:11c6:b0:2bd:3bfd:7512 with SMTP id d9443c01a7336-2beb065b6edmr245162605ad.29.1779875078164;
        Wed, 27 May 2026 02:44:38 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b386esm154738185ad.44.2026.05.27.02.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:44:37 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 14/24] arm64: dts: qcom: sm4450: Reduce OS PDC DRV span to 0x10000
Date: Wed, 27 May 2026 15:13:19 +0530
Message-ID: <20260527094333.2311731-15-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
References: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ja+Ma0KV c=1 sm=1 tr=0 ts=6a16bd07 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=0iWJZJwAwNium_avJeQA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 1c-DnMk0muonZeTcYm0uuE5tl0HELghS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5MyBTYWx0ZWRfX+JO1jmcISpHV
 X5O24xnlA0LJx+rBrOLdlDMIe05WzIQPlhNlmiMkdPVida6cr5yqxB8q4ARV0IJoolDkxpU3tZu
 EwfBoEIvTkQ+r51BNsgTMmbcgfmb+h28K93Pd1ZMjclq8zBUon8rlmcexpla28slLk+OxNhn69U
 nnxj+NFileXXE8pPqfNR/kgNyEZgCASyYLwTId3dU0dRDiXxVkk9xUXdo10igVD81t8qwT7dEEq
 GU804yVU281B2LtvdWRnL3xXBR6/LE1BrC1XXLOA2x54HAnOCrxdc1l1cF3XDH9yCtQyY5FVRHX
 1Gp6SL5jt9fmc8L4a/pkx3HcJZmXZ2B99SlFzFsurqMOEgWOxs6/2znd/QVTrQysY8d5lg9/cl0
 1hOkmFTTLNWYPuuG/U8xDXOQ6KfbrPC+V+hKMDoRTmK6go3jTjcCcVRyLM5RtyGPIVwKtXKaajc
 zQhmYVqUBt1vwD41tyw==
X-Proofpoint-GUID: 1c-DnMk0muonZeTcYm0uuE5tl0HELghS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270093
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109968-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,af00000:email,b220000:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.997];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9D6A15E204B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The OS PDC DRV register window on sm4450 spans 0x10000 bytes. Reduce
the size of the first reg entry from 0x30000 to 0x10000.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm4450.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm4450.dtsi b/arch/arm64/boot/dts/qcom/sm4450.dtsi
index 696e2e0841ad..b7dc40f3778c 100644
--- a/arch/arm64/boot/dts/qcom/sm4450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm4450.dtsi
@@ -464,7 +464,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm4450-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>, <0 0x174000f0 0 0x64>;
+			reg = <0 0x0b220000 0 0x10000>, <0 0x174000f0 0 0x64>;
 			qcom,pdc-ranges = <0 480 94>, <94 494 31>,
 					  <125 63 1>;
 			#interrupt-cells = <2>;
-- 
2.53.0


