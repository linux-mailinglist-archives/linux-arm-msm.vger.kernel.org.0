Return-Path: <linux-arm-msm+bounces-117238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MLbVBlXOTGocqAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 12:00:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 805FD71A0EC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 12:00:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZusxU2y4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gkrJcjid;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117238-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117238-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9AA64302B200
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 09:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B0D93D75B1;
	Tue,  7 Jul 2026 09:57:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13953D9DC1
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 09:57:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783418248; cv=none; b=oJYk5f9ws6puAEdJoB5FeTmQ+DFFoqGjxwZDQfvXGImI2qbRRSXdmn/3EqVw4Ly6wSqJIBaL2pw5zA5z5MNIqTBb1z7Fv9mg0sBsC/u/x+K0jsmnjeANphwdHP43x0BXV4In2g+2yG4s1tsYTkfEdaz8vryLQgYta8k+KDOCifA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783418248; c=relaxed/simple;
	bh=NWAiJr0rfz/CSlJBzoM7GvuQ0Xss6HkxQc9ZecRc2yk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cceVONwvLCSslWIV8PSCTxBX5DmlHuDnaqo1m+4udulWtnazWh4D3d3vBkhSj4uirKhc3xXo0ol/ZWAYV2Lyl6wYNt9niUn8bSmCch+YvaYQ2dK1JxlWvLG0Hp2x6DO6LP5SF60ff/9l+1c7nzIyEZTuNH/2B/xF7UM80I7JXyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZusxU2y4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gkrJcjid; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678E4UN3004578
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 09:57:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=fGlgyW9VIAd1BpCUXidFVG55zNfYKYnlnAq
	51lL5tyg=; b=ZusxU2y4upi5qPMiq+wS0e63gEuc7Z0Cq2LreO9MAP+x55LvO8p
	+RO4H2zrBd0JjNSkKLpKol88MIvJOeuoReZHrj2p3MwDWjdUqLg7IhdcSuvhXnYI
	60af1Doa+NQQi0J94h7RbvdgbH6BdVa9afFzPlicOLgikJuaEygqXc9ihOqt3+sL
	78bwOAU8swYdKWkHkbFsFzOnd8xNybocn9jPNBeDzFnV+9C5UuWHtCL2+gjqf/ig
	02uPW2CvX9Qd0gSvvD+ggtcHuKl+3/dgFyeh2VOMaEozWgA7T5Vxp5Wogp1+K6G9
	CV31klI+VEWe6k4orYrRiN/IFaKKlCEOGCg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8su71bsb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 09:57:25 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38112fd8b48so4638764a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 02:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783418245; x=1784023045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fGlgyW9VIAd1BpCUXidFVG55zNfYKYnlnAq51lL5tyg=;
        b=gkrJcjidUk1oQ6gATum20SyPqu+y173LhVHclG37MrDSZjjY4mLFGZyETR0qPmvqP4
         p9eiga9dXGsVTK83h5wQgiXLJtHXrztX2yrNSCdp2deaox0cnPRWyTrC8ayZBd5KgIHp
         W3eZxgVdYl2f+h41ziFetxReA75S+QKRhmt+ugsL1HIXOI8OIdQwXv58kkr0ozkQlZ8i
         n/8LkqjxIlEpOlypxPmZam+f16Jy/S2w+vNVMcmG4rBinpF2n1KwdJJKUvD2TjBJHvbV
         VSMYhZmpTSMaDVuVXykPlY4ybR8qPRuyNko6EKiuyucnQfLJpXVcLKYPdfQZ3Hnf3Crn
         0oMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783418245; x=1784023045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fGlgyW9VIAd1BpCUXidFVG55zNfYKYnlnAq51lL5tyg=;
        b=AQM7jzmD4r9taIiSX139bwmLkLuKr3S1Ws8OrMEURFSB1QtcE8a1HjieOnqhj+Xq8X
         hkvzXx3AfJTS0iA5Gk0pwTR8WgrksaU2z/vqIP56RjodMqTAyq63AslOZPgY3VPLzm+e
         6kvRtFWP+ibg3bNJA6qcNqAMfHe1xVYP5/IpvcrTGV6efINXCFPWZ/opgoNfjqS/Wo6u
         410RkIVeHajqS9vC6i35CS7YqKG8HqqGdlZ8yD1Pd0OJesoCVSo7RUFg1OVeeLWhuU0v
         eMCv6Tjss8uhghqp4SmbK4MCKrsIYhYOmuhvXlmHQOVc47rfcjfwKuUmaAsmlSsuKssS
         MnkQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqsd7m4cXOS6n2/4IOaB/Fcx62LIEgqEDg58qaPdo7BFF7UXwwdkRbPd76kGx7mcXmtVrn8q/EQ8SPVXd1b@vger.kernel.org
X-Gm-Message-State: AOJu0YyJHKShJXMcnYFpGyncW5oIau75faW6juqxQirTCkkjU1eZcMxI
	qjkOul7778XucqRGDeMJm4WYl0tOnGnCQjAh756CnnwHPx8NUdFjuBVid7tOBTmMyPYqoYt+N5z
	J99PKM+7U67KRfS0umq6ARXUxP5bXJ3qFtmWpGG8ve7/KZyjYx/au0qZaR0i1kL330pqe
X-Gm-Gg: AfdE7clMPsVrj/AnT4qC7/HPrM3LBgRzUY3OV6M/ogJBiuBWozvwIMEbbByCOX/ynJK
	0STYKM7IQ6xQUvIXHIC/6V531gnDAnVipWNuglzqKgQkxycEAoCRal+9m27ogWgFeMRDYNETA3O
	lMS9U/UdZwuJN9NHbI5cjZNjU9ko1zORO60F2jF2n7tIA2VkIr8xnMF3QQX5UkvTqFXdIlxoafl
	RRvpABvJaPB8WD92kWtJMTaR44CSiyh14N7YdsjN3cgdDAZZUv/qTK1SLj0OXgwirMdJrtLti/N
	KqBGW+ZvDkoLLC9XX+KFL0A8PowDMpYDeWvM44yROpW2UB0MirY+LMkLS3hK5agZJ80GyvMvABw
	ww+Huy9n0Eu05n5+5GzhNE/rD7IZzYvKN5kDI8QE22yvGVweTbONNnnghZCvFdlP9y+I0cAQ=
X-Received: by 2002:a17:90b:2805:b0:387:e0cb:c8df with SMTP id 98e67ed59e1d1-387e0cbcac7mr2011577a91.40.1783418245308;
        Tue, 07 Jul 2026 02:57:25 -0700 (PDT)
X-Received: by 2002:a17:90b:2805:b0:387:e0cb:c8df with SMTP id 98e67ed59e1d1-387e0cbcac7mr2011550a91.40.1783418244867;
        Tue, 07 Jul 2026 02:57:24 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387a83f99e4sm574350a91.1.2026.07.07.02.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 02:57:24 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: i2c: qcom,sa8255p-geni-i2c: Add compatible for Nord SA8797P
Date: Tue,  7 Jul 2026 17:57:08 +0800
Message-ID: <20260707095708.3801043-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5NSBTYWx0ZWRfX2qmfVseL1l/F
 fhH5JDRH5XUZ4++wqFi2JntjXMgFa9jBAdLUsjN0far3IeG80KQj8v8/bRY5f34JZWgwqCSAa1E
 pmgKEaW6nHJmcxikE9vq+Rrk9p7c05asZEe2KzPT9cnauLN12kSpvEk2R2vpIFymP4eF+L9d0+k
 IRgGBFV6Ugmpjz+2C5DN0JuXylg2sawojKTdss+SrAiH1yqtS9/QcPRp2ne1CPa7NntgPr+o6zv
 i3UDdJqzPvEG323bZCPlcjJHmqFPWVJPDsUUiNU9ZVGZX4TpQxYS095qYvvcY+V9rmrz6O2rpl2
 16p8gA0YFaT2apXtKUb7cpLMSml/ExSTyp44L14GiFpscJcb9OnWd7BjY5mGwNH5Jhr5Q3YinQJ
 7vXNA65aNyuzt0kuCGLw0/PKgHAlwsKSBYIrFDyCkbeBqKVr5G5j4FzCgTFK6SjeuEORMhRqa/p
 MEocD1Y/SY3+WODfpeQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5NSBTYWx0ZWRfX0uXKEQTutadG
 80UO12rGsYtFZN4pwWdoL77DNlsYf54KegGd1inJLDz/CuunGpX2b5XCsO5Hd5Xvyu+dD6f315d
 hnlHwfJro+2DFqX4FAwl0xX1K3eauog=
X-Proofpoint-GUID: z2Slkts9RTixC3rRSBGsGW76ivT62Elv
X-Proofpoint-ORIG-GUID: z2Slkts9RTixC3rRSBGsGW76ivT62Elv
X-Authority-Analysis: v=2.4 cv=HN7z0Itv c=1 sm=1 tr=0 ts=6a4ccd85 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=dHqo4WMNoFrl8pwT4n0A:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070095
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117238-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andi.shyti@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:praveen.talari@oss.qualcomm.com,m:linux-i2c@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:shengchao.guo@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 805FD71A0EC

Add compatible for Nord SA8797P QUP GENI I2C controller, which is
compatible with SA8255P controller.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml      | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml b/Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml
index a61e40b5cbc1..04caf622b3ba 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml
@@ -11,7 +11,11 @@ maintainers:
 
 properties:
   compatible:
-    const: qcom,sa8255p-geni-i2c
+    oneOf:
+      - const: qcom,sa8255p-geni-i2c
+      - items:
+          - const: qcom,sa8797p-geni-i2c
+          - const: qcom,sa8255p-geni-i2c
 
   reg:
     maxItems: 1
-- 
2.43.0


