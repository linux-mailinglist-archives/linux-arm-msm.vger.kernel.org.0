Return-Path: <linux-arm-msm+bounces-97956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNq5II0FuGlpYAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 14:28:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E1C29A5A2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 14:28:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5A8F330377B4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 13:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0984396B8D;
	Mon, 16 Mar 2026 13:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hMjzyhbe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i2rR7O5v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2043976AA
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 13:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773667208; cv=none; b=Yaujd5cQfZkDi666MCjVzRZCIxRI4Pv5+8NMAuF/gxcNrvQaL7vR6r9JNl16btllPe6CAg38ot3NSx8igQaVvw0qFJsKeULzK8ucyNwsFtdAXqLzp0jnGgKP+UN5Qx4GDBkMU39OtAhIz+/wihHr2L2XI7pUB53w0bNYnyxgR6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773667208; c=relaxed/simple;
	bh=zzURQ2iZmKgYEW6uRD7yseqVngQWWegQi7IQwZw6XFo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bQ1xWh21kWYuMfiE2QTK33sELqKUkCpKqaDjF8LOBV+Q5CKCZ0BrzY0npjmYjDE5J88fb5DcqQB7nBzJPpuo3HCo5YWXlBmBQNNg5JXjaaeuPNhbi24k9mr21qgkqxl87AIN2BfvUHeK4H5IsFB47rP1ktGEpejR5kw6MpojCJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hMjzyhbe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i2rR7O5v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GBl77O538899
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 13:20:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iP1kOyErYkC
	m69CvjI78yK2kPWPB5SUYFba/JegI/s0=; b=hMjzyhbe1q2sbqRdvKjH0mrodTp
	jKkQ8zjYtiM6aOONe92Je3nJqzHbcFDGRo1eqJk71nGSa63cSvhrLDlANrd1vEdp
	lDOT21auegIEGfLqXwkNmhoYOFH0zuxSBscVf9BudTyj5TFdwshanMSExZ6S5QOB
	ocki5Dc/ugK+ua0EJqMB3bfCa1O5O3wVP+Zd6lHIiugbL3LMVas/SHUwztjdCfO/
	cg9yThU5SYJvx+mfOGmVJVrKmjLYvx0WabhEMY5xNivy9uCzDbBQWDmB7vh38QUQ
	1pI74/YPkqZ0SKXW4V0/5lEWx3ImouffTOn6cp4VFvF5NSeOs+29if0A+UA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvyy5nvhe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 13:20:06 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-358e425c261so5278767a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 06:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773667206; x=1774272006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iP1kOyErYkCm69CvjI78yK2kPWPB5SUYFba/JegI/s0=;
        b=i2rR7O5vvqzbNlLcQeJqS1xirQUVIm3A3Wi8366Gh56CQR3GRVo2HswBONmNSLCDgi
         acV4MzfPW1nWYEJ3ZA7yAC+6Mk3w48xs7AOUrSgYtZKH6PqlcKJRmnDcxJk9rJBmQPXH
         /8criKMf0yRHM6sHSiF04/uevCO19fQ3+OyOv7ZR35z9BX8iNsyRcvd9qqT5K7NT/rVZ
         /tOFjZ4Zn4q4wbX5alg2KNkEKtIA6o26LxjnmwtqNrhiDyLRHyIZzRNyhG7RQhK2su/3
         DMQZqGGWLlCFmIdXoY3T56jybPQSmhoM/aqRJwYn631eDB2/XYa9jAZceL/uA1l4l9QH
         7QVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773667206; x=1774272006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iP1kOyErYkCm69CvjI78yK2kPWPB5SUYFba/JegI/s0=;
        b=CxmugS4gVIPBeCbHHJhZ1jVZfHDmcwpPFGHtj+TpRNDy6mEDlkN6f/kIGMjHdUHqh1
         plZt3f90mDYhy/j6vhxHX/qrYb+SwxxG7JBqPHU9/jjClqnaoBXdl0GNFPxQ8KHB3Gba
         JuINeCibYIWas1FEyk+0/cYbliO4LrBJLdZpRme8p0PNmqon0gRYdw2+bxnGIWe7O2Zj
         Ziz9E5nJVIYPNZvK6pbsY4fzpJ/6XYwwrQfkqg7vVdem5Cs3Y3PKxOjBMUVcvM8DBypl
         JI4moskU7ZSYh8g4Vo4NJamcrKBm6J+aTJN7dQFEYA4gikVBvTIiV3/hno0jck/717g2
         mzbg==
X-Forwarded-Encrypted: i=1; AJvYcCUDdaqdIsRbja+B695mfcm6DykfvY7FIWtSxoSpRyhlq37CQUDhstU73OZm37wLU2iu6KdE8wno6medInTj@vger.kernel.org
X-Gm-Message-State: AOJu0YwRHx1l0EGIfIVRZRFRdQIbYkhNBybEeGDIfiw2oJAZIt1P+aTZ
	zyKweR6psfQdGlLNr1jX9+dbqb2LxG5M1K5duGRTzeaVJj4c9DOieU9jNiVMwh/I02jUAo6KXpS
	bMdJnR3uuFQHhL0xnmDD+W1MM2L9TAs5pSoRTsSyeLwWjxAs4r0h5fQ6IikatLAihv3RC
X-Gm-Gg: ATEYQzyXgBaReTeFKcSXixjxrnB9/KtrVJj3879W0gEPuQPo944JrUjkC5WSmTD0rOG
	dbf/pqVHdBFMrJ4Vlvmw6jXVDdpfBvwHiYq5i+0JrZcha/8RTmLbElEFaUqvWWrqWFrAUr+wQUU
	wTpcLcBZW5AmECovhwN/FmpEhEppuZv0SrP6jNFDivWOalDHdVPJ94BXlvL5ejyVT8LYfiD87og
	0HJzbsBCAUCCa2ibFVGJhWSGbz26TFI3Kb/K8TP4dN8BvY81wwoXP6emcFhX57KNpkEO1ZLPLIG
	tIbNhNLxg/OmXkxOv12Xh7HSHP7RWI0uDgo4GrQEkLeT1h2tsTKMrVhU4rj/LlS2fX0CfSzcN8w
	aqKaManvypNPuinC24v4BW4wpu0lrR029BMkaTFpHvdw62A7HCGB64YpSPQ==
X-Received: by 2002:a17:90b:4d88:b0:35b:a656:a614 with SMTP id 98e67ed59e1d1-35ba656e90cmr1687320a91.21.1773667206194;
        Mon, 16 Mar 2026 06:20:06 -0700 (PDT)
X-Received: by 2002:a17:90b:4d88:b0:35b:a656:a614 with SMTP id 98e67ed59e1d1-35ba656e90cmr1687269a91.21.1773667205624;
        Mon, 16 Mar 2026 06:20:05 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35b9303eb9bsm5209648a91.8.2026.03.16.06.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 06:20:05 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
To: mkl@pengutronix.de, mani@kernel.org, thomas.kopp@microchip.com,
        mailhol@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-can@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: mukesh.savaliya@oss.qualcomm.com, anup.kulkarni@oss.qualcomm.com,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: [PATCH v2 1/3] dt-bindings: can: mcp251xfd: add microchip,xstbyen property
Date: Mon, 16 Mar 2026 18:49:48 +0530
Message-Id: <20260316131950.859748-2-viken.dadhaniya@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260316131950.859748-1-viken.dadhaniya@oss.qualcomm.com>
References: <20260316131950.859748-1-viken.dadhaniya@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2fahbUlK53Gu7dm1z5u5wcwGKB7V6rRz
X-Authority-Analysis: v=2.4 cv=QOxlhwLL c=1 sm=1 tr=0 ts=69b80386 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=MbkHCQl1Ze6FRj4IwLIA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 2fahbUlK53Gu7dm1z5u5wcwGKB7V6rRz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDEwMSBTYWx0ZWRfX6ywjiTKAXDiI
 6xGnH/z+H3Hrr4dOuSR1UO1ocqhCLgpGFCQAzxX/zL+rK/oCe+qw598hgVsWWaZYMkWSdtlw7sS
 EdyyK907oqYWwML/b2yARShht31U/1PvlL/mR/zeVOAjARmFtOMLnKlt8ntPy+faBGRc0JcyUwc
 vfMVMMHw0cLn02SJEcCYMdnEYKDVFqOXWuox/AH/4GP6SaOpgCCReLQFKtLusLJoZMBRYc/dtmX
 G4jTVJiL33VIqNLA1dLJDkmP6fDt+mjr/Phrk1oLnQyFtD/ygNzEU+4hMrRLFHPOHR0Sgc+Pwcj
 OijjIWgOqliwU38i0d3YgxIBhrsvFnN0aFNzpjD8X8Mo41VQYdWPOcG6qZa1oPimhCjouZSFL7I
 2YaGAsFCIb1qyv+r9Sz9Q1lNNfD5gZqib9/XuNYWzh6dtdJ9nSvM0E1LJYgsCBZ6zBUmlHItqHu
 nat0Yp8qOMQJnlbD/gA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160101
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-97956-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F1E1C29A5A2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the boolean property 'microchip,xstbyen' to enable the dedicated
transceiver standby control function on the INT0/GPIO0/XSTBY pin of
the MCP251xFD family.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
v1 -> v2:

- Drop the gpio-hog approach as suggested by Dmitry.
- Add the microchip,xstbyen property to enable transceiver standby control.

v1 Link: https://lore.kernel.org/all/20260108125200.2803112-2-viken.dadhaniya@oss.qualcomm.com/
---
---
 .../devicetree/bindings/net/can/microchip,mcp251xfd.yaml  | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/can/microchip,mcp251xfd.yaml b/Documentation/devicetree/bindings/net/can/microchip,mcp251xfd.yaml
index 2d13638ebc6a..28e494262cd9 100644
--- a/Documentation/devicetree/bindings/net/can/microchip,mcp251xfd.yaml
+++ b/Documentation/devicetree/bindings/net/can/microchip,mcp251xfd.yaml
@@ -44,6 +44,14 @@ properties:
       signals a pending RX interrupt.
     maxItems: 1
 
+  microchip,xstbyen:
+    type: boolean
+    description:
+      If present, configure the INT0/GPIO0/XSTBY pin as transceiver standby
+      control. The pin is driven low when the controller is active and high
+      when it enters Sleep mode, allowing automatic standby control of an
+      external CAN transceiver connected to this pin.
+
   spi-max-frequency:
     description:
       Must be half or less of "clocks" frequency.
-- 
2.34.1


