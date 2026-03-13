Return-Path: <linux-arm-msm+bounces-97426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELWgEibqs2nadAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:42:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECEE281A52
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:42:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0DF13152FAA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:39:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEC09390980;
	Fri, 13 Mar 2026 10:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ianYR3tF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d372kwgy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA3D38F641
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773398331; cv=none; b=sc0Z4tPflRngWhVf7df1poqgA+AlYeVODeXlETSguDNQmkd/AiqBzvNo3WKWCHLnZFqeMQnN8Bje1xAV7LFZblkeOoqNTZWixfSv7z+TfaO2Bnj1HlnQvhOOSGCmwFn148EhU4pAQjWZHeEYusFhesp+g3d98Mcgvo21I4KGnYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773398331; c=relaxed/simple;
	bh=hCXR55fCmPiRCyQqGTCJojtheFC9upkm3+wmoWyQkc4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WNpIChpB+vF97VDy+kI4tWd7jsjpxpiaDmWre7ex1lO11X4o/+SMffoeB8kiLrbdyG+a/zx7Ba2dhJ8y+1TullVrl1ICPvJ5g6EJ09/hkrurd09b9YbtDG6M+UhRHl1zoktUHpI9k8u0Oi1vMd6t4oC98EVbXbA5N0HYtIwugWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ianYR3tF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d372kwgy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D6oMMe792874
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:38:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vNi1JDgqv33
	27PJLD+mby9dxes6qBefe5To68tI2NvE=; b=ianYR3tFHT+5TrOJOSUesq1FUGA
	GVq3oaOBrRcU4rAM9ZqC4BqU2b6EUXQqJgdL11/mmeBeDPKv1xZT/gyji5/gjeyq
	TSV4dx3XrSZIPAhx7nSEHLKQ46z8QztkP4rGHZ9dx1RBu/GOyZcZDyzS+H9fazHm
	BXk4n8XYGeIlWCIY0jors7P/MJ0IbHyg28dehT/+/5Y3oUeZGLDrEqEPSeZzC8eC
	xR5hpoeIXm+hKLziwugJKjD6qfSslhtxKtyOcXfJHqtX6IbLS2gQygSfyxiLu1vi
	agkjpz9YWuj6KXIG2ZiRobR3gks0L4mJXn+bhYq5ZoRbv39TfGnmaSeFUHg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvdnt0tpv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:38:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd7fc27cf7so1107400985a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 03:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773398329; x=1774003129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vNi1JDgqv3327PJLD+mby9dxes6qBefe5To68tI2NvE=;
        b=d372kwgy19m7eGQwgym7sTjYnbJlUSxYHsPJa52wrFWgxXictKCdKJJBRhZh9RTjfC
         TrRuqD8TADP4zDzjMIX+lu7y+wG6qU904vnNmHn2ujbVUr1/Yg7mK3ETu4f7dYXoXszQ
         OHZzgotoIj7mQMT02vsAXvFy/sTgckT6HeflcnAuCA0HhxugJLHe5bTnflMLSchSQc+4
         379E8kjdSCbDgbq331VnKBdNDuJOg8mbzztC0R9BPIGWv75fh/jRRAOFGQeWVor/OQAx
         dxZYTn2rlIEmkyEuJnJkvWQd7Xath2Rp5NIxZi7rdNmr6AO92NQikCjX83jU+zjUnJjP
         8TsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773398329; x=1774003129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vNi1JDgqv3327PJLD+mby9dxes6qBefe5To68tI2NvE=;
        b=jdV15PZNv4AhBeA+x7LwqHsx/gvtpmXFbx2Y36FsCvZrGj0yl7CotvHdVJN83pu7B2
         ZKiQ6JnzPxa4sqbaa7vcY0MUHGn9IvTUh9BRrX2gRqcZ19iu8i7BOXpSPjh7k7XI/s+/
         RfRoi1iUG+QI+7NI9vy3FUvqp/mpxvFwIXsZDMqOHumBDKi8xLaoMTyEsDYrOSdyeATf
         caUvwxaVb91qT6uocsfT5au3ybQyBsa8Mdx1GsYpl5NCwYn3xBruBVAzeP5PKW/XDi2p
         0cr1UUQhFS2ZYCXtUY5hOyGwqKahtJwwgfKY4WqxBr+H/u0j4/i3eUcbdMLQTzFnrfDs
         +mug==
X-Forwarded-Encrypted: i=1; AJvYcCWdbEwMMO5q+W2+fCv868M8rTMTn6jMAUb/Tmvizgd01JamE+x9QqRWcPr+f4UNA4D7XCs5Bmsoi8bkTSG9@vger.kernel.org
X-Gm-Message-State: AOJu0Yxyv22ps+eCoYt7OAHpOboTqNQYXladq0jBKXO9bt91LzQk9XhU
	k9XTOWQf8XiwFuprbFEYUcwZfpUf6N/FUaZQV3yfETuUPUq5cA3/ckpQHvFqlxxk+gDdSiNyqXL
	aqs5kFVye9wYTppnPDHFLKPSqQbP28diYzqo2wqi49EWz9etXsIib59slQkwXqB40r5vj
X-Gm-Gg: ATEYQzxmStfiXPZ65YP1m/A4hYAjZVwgQjCf755fm+BXXiiphmJj8F8WJcwic+vsCbZ
	2vnCnfNg1lRmdO+Q6G8zOTKW9MrNywUSsvANnXVVWkOHPlDIk/zNis8upLYS0xlV7ksZzhg58Ri
	GNcd2ODXDZhgV3fvy50zLTOirwd83WTmSYTcyuZtGh7+BsoY4Avop1MGQ8QBoajtKnnXzq+Poyz
	sBnc5LPo1BQpgJwfIh2DPvV9bAjOV1wuNtKyHVU7cOmfEA1R9HxcaJW/MizENVyXccGyWRvVguQ
	ZFr3Pc0ZDEgppqBLuv1tguUAweYfQW5ImgW0mMJeOWcMPcJnqBVH6S1H2SeInqi99Dn45ACLCVY
	GOCI3XXC8EOTGY6cVrFs64hNC9unUyXEEHAEmwlqlruBy/jdUYiJa8P0=
X-Received: by 2002:a05:620a:4510:b0:8cd:79aa:6931 with SMTP id af79cd13be357-8cdb5b6f77amr366770785a.58.1773398328783;
        Fri, 13 Mar 2026 03:38:48 -0700 (PDT)
X-Received: by 2002:a05:620a:4510:b0:8cd:79aa:6931 with SMTP id af79cd13be357-8cdb5b6f77amr366768585a.58.1773398328377;
        Fri, 13 Mar 2026 03:38:48 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48556426be9sm20183445e9.9.2026.03.13.03.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 03:38:47 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: richardcochran@gmail.com, r.mereu@arduino.cc, m.facchin@arduino.cc,
        geert+renesas@glider.be, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com, ebiggers@kernel.org,
        michal.simek@amd.com, luca.weiss@fairphone.com, sven@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        kuninori.morimoto.gx@renesas.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 2/7] arm64: dts: qcom: monaco: Add missing usb-role-switch property
Date: Fri, 13 Mar 2026 10:38:17 +0000
Message-ID: <20260313103824.2634519-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260313103824.2634519-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260313103824.2634519-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KZrfcAYD c=1 sm=1 tr=0 ts=69b3e939 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=7wbTcNuVWEeP-7GWRuIA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: EZinNOHs8cid2Zbp-Nr_TP6zEAU2XpSc
X-Proofpoint-ORIG-GUID: EZinNOHs8cid2Zbp-Nr_TP6zEAU2XpSc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA4MyBTYWx0ZWRfX6QDexPSMRCdj
 ri4quEDfiJtrdQ1gRkhIW3hS64dAog+FMfhJAjuvsxgJSTQerHxMywmVLW84bJt+jyNcZf9ZjOS
 HTXN1thChTEC24dCAXKGiiCNPsfTTmJ8wk2yec5L9kmWeLICWkG8FL9hpIc5CJUECE94Zsh3PoV
 YtKJMs67wL1+Cr65MxIe1H3EM71+Bp33waDr4c4kXyVdRKm+hmKNUItaNP+Cv1/sBKFS2yGG2g4
 xXJ7ZG1kK7RF5UQkgZUxcGdqUlimfU1RXFuB7k4JJLo9KXrR+S/ppiP2a/VIIS4CwfoUeiSUD1l
 Ew9/MEZciCdpH0d8BSZJ8k9shftgltDMLgZ23DK3l9EGHZcZPEZJkl/ltvc8vBVwJP/8mMABWcr
 zoyqhCAZr+CeVKmjri3iiNeVkMqURQska+wwcrzVmkGye7jt+2R1TMCR7jUnIuLzOAcIgpZkusr
 lXoAPteeKhbSd3efrDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130083
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,arduino.cc,glider.be,arndb.de,oss.qualcomm.com,kernel.org,amd.com,fairphone.com,bp.renesas.com,renesas.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-97426-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9ECEE281A52
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add missing usb-role-switch property to usb controller node.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index ce1565c7cc3b..b3a2bca58a73 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -5177,6 +5177,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			snps,dis_u2_susphy_quirk;
 			snps,dis_u3_susphy_quirk;
 
+			usb-role-switch;
 			wakeup-source;
 
 			status = "disabled";
-- 
2.47.3


