Return-Path: <linux-arm-msm+bounces-102735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKgXKKBG2WlToAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:51:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F044D3DBA2C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:51:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B686F30E056E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 18:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 566333E7140;
	Fri, 10 Apr 2026 18:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oigV01+g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T+ypDEuK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA353E6DF4
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846609; cv=none; b=o93+tfZ0ydUqvBUrHv65rF31UafFy4jfV3NMIgveYzi1oYCtBwUXPpJlvTRYreEcIX1ABPn2357FIVJvC9e/H14rYGZaY+4e5yZJFT5OJ0+5AFtnUCI8lmrvSM3SN25oVGd8sNrQkfNUsgMuit/UQo3fs+R7iOkImDl85H6fQvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846609; c=relaxed/simple;
	bh=fpqAdcevsL8mZMWycu0irlvSW1JOLScUUGkXgN8MZwY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e9JUaZNqTOwt90trgLix8drJ9yhNVbL1Knha1dravWgqMZRM7zFLZzZ+xNfWe25p7XEoC8a1731n4xDYpzfvxfaS8lR07u9bOdRV78o5XPeyArWtxfaGqkv/365wqf26B3wSqMWF4TMHVCKDAXClgTfXCepZKR/XPS24ZCcmkaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oigV01+g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T+ypDEuK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AApIof3743053
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:43:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jdONFNCs1Iz
	fT68MjzY5Crzyu8ygeDCV8E1xlePuVhg=; b=oigV01+ghUDEz8gfm6ySNvmmCuX
	FGKSrcJZQU5tC/NWGMYDDyMq8bA/175DDYW8zGP4nYaGGw5zSSdvJGe3ap76lFRa
	N7N2tsf8RRWoMX5yhaUq5E/3b8/yMeVZWlaL/rzY4SeHNrX7Akz88rru9COUduu4
	mxDyVGkOw3fCVB168vUd0yyq0WJEGLAKGVf2RQhyjQFFNmZ5n519Ues7aSAKxBqf
	kh0sU1QCBkvxLvmJ2bzv1sh4Uzz836r7tKqOH9BP6HL+i0ygpE5uDU+FI6nKDYz1
	dpvVRkN4PTcfrY8F6agEMmFmuTQ4Qn/8GVTl384odjtNhtWQ2DpYE09wDYw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deytnhdmk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:43:27 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c76b6ccf298so1457468a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 11:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846607; x=1776451407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jdONFNCs1IzfT68MjzY5Crzyu8ygeDCV8E1xlePuVhg=;
        b=T+ypDEuKHiNyiqCHBmAqG3abpaeth9Drs7aOYhx2uY6l6iUJL5LH2oT0fa1ovi3LPH
         OexezNkNcJ3YHyCdDcYZuIqVzIyXZqDMLw0NG2dcBPFfX64xO06ysK1IszNjLKoLWjD2
         0ZJEkwHs/bDKJNb+iAwDWILNGIim21FKbRo5UdusmClrrf19quLwDx0aQYyes2kXM36M
         JEzhdrlg8dXW4ffLe2Glf8datz+JATjuCAT8YhdF2xQROjQDEsm2cFKGpigjoAV8JKBN
         CW24v8ygMR8TycQ3KMorm/iQEgh72KC/Z5+w+iVsW0MUSN9CTuunc5wUSWfVso6rx002
         ssew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846607; x=1776451407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jdONFNCs1IzfT68MjzY5Crzyu8ygeDCV8E1xlePuVhg=;
        b=HajacTttpRaiYrZbPBV9U1CPxJDOX+eHU5GTigxagqurw8vd1RaG2sIctzRMHq7DY2
         ycDg5i58jJvK2OZJ+LM56qZat6Y9N8Qft9tr9bDVq58TpDCtq1zrMVvF3Y5x8keF90xy
         k/S2H+g0eB6E3Jrh2K6L2oGymAvi42Z0LP3yudMvQM/gd5X7C74TI5ni7lq3PKxa/DrY
         npt490xSFQYBoY5TlBSH9/0K14DnpEJcrRAJpXDpfwXNV9fgFdJbF9PUKPtF8WkZuVZ0
         JY/scArkhklUHeU9ZsSwr6O9RBhZo3Y4/3oz24DsVJpg8Sfh7wPFPWo+W7S8HObSwQlj
         N/zQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgZtWS8tmP8EsaeKYnPJXHGLo81c+KKivKp+UYN1/Dl8V/CYVvhsiFjuTdWzjzgJURBveXgNset2b5T5RL@vger.kernel.org
X-Gm-Message-State: AOJu0YzVZMt2RvLQ1jYPJcHtoWymX1ddEK1GlKOgSiIfLhwlWXap4ul1
	SlIW9QC5RHX28LCTwco8WvTmo7KAgrZXCqqQztds5vZoabmGwjyjGiuLIGBkyOfGRx/Ilwqcel3
	AjNFgZo1cI+ZSnT3IUjYmbHCWRlnjCzeiy+aSmddWH4cUcdXaJfBcKqYKd9P5P/DMWaAq
X-Gm-Gg: AeBDieuOuGTbF5rG62Wf+xTyRWunSbkQ6xAz/AwtC8lXxpEKJAupDAEvvmOXQcaXLM9
	Yr/D9FeQdB6xpzLlTdZe44OzBQKb2AjTQnu9/tFiIOfxw/XcFUih7F/xyyxe/1mZn00shlPkzg1
	0Q3GjGBZ1ix+UncX/FFBiKXNZMCB6LWfyDQIVIjothfQbyeeI4T25d4KS/p098tpYMgt5l14UQU
	Hx/hdUKDbKJLcSCyoJhcCyGaP+t7xIq4Ptl5XkQSML8XsQMxP1QAxT2Vk5gz9zUvpIjqtyz0IMs
	jqXRosG4L8QqtXCz+4bTpzbM0/uTMVhJTKER8PtdNM7KaiCMYQsbUxCI4BKsDViwm/r6NfBPeqb
	3SVnSQxXWVnzotspPIVXAmspCH720mZpndPdoEFDnJcfyuhqi
X-Received: by 2002:a05:6a00:cc5:b0:824:a0b9:64ee with SMTP id d2e1a72fcca58-82f0c169423mr4799168b3a.17.1775846606630;
        Fri, 10 Apr 2026 11:43:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:cc5:b0:824:a0b9:64ee with SMTP id d2e1a72fcca58-82f0c169423mr4799131b3a.17.1775846605976;
        Fri, 10 Apr 2026 11:43:25 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:43:25 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 21/35] arm64: dts: qcom: sm6350: Fix PDC reg size to single APSS DRV region
Date: Sat, 11 Apr 2026 00:10:58 +0530
Message-ID: <20260410184124.1068210-22-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: c_ZbrxtwnUMzN5JrPwabWYVd6iacOj2G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfX63hKlvspCJhi
 X2bLkzbNp2G5/fGfa5VWjPQ8cYHxlMg4QYvFh4TVp+qGMFVe9Tht5o+gMiKZXXvKrVLXietJWz7
 v/kl7roNAyUuq2rqBFHVMZKIyQDw/3osg7MKrcuUBHGvLwhenT7Sr4G4lOBikcaSFfxEvlZFnev
 bWzBf32EIBV0rnm3+fHwd1LuZBqpomwDLj5b9tjyJ+7WONS6YAXMMWWikzxJm4vD9kWMSH6aD9S
 C5wqyep3cGnjzS1oSSqTJEt5Yfz/K+w8oav9A7W0GOeCsf50rZWHVz8QVRiANpbDFV+kGD6S6j9
 BxrT7XdjFJE2xR+9qGE130P7NO0TuMC0Fh6Niv11aO5S94p+cVBOWd7EG3S5fqQqAHq8ZxBGuW4
 UGUqZkQEIPNNwJKvjPsqie3pLLFyjBYFcBrdkKnvNgzDvV3I1gNBsyuZrNxmvFDENpAwP/eEITr
 X74EyYcrY9baiAHCffQ==
X-Proofpoint-GUID: c_ZbrxtwnUMzN5JrPwabWYVd6iacOj2G
X-Authority-Analysis: v=2.4 cv=crGrVV4i c=1 sm=1 tr=0 ts=69d944cf cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=gy2XHVjqFIZi9_LM-XYA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100174
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102735-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[b220000:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,af00000:email];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F044D3DBA2C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PDC reg size was 0x30000, covering three DRV regions. Linux only
needs the APSS DRV region which is a single 0x10000 window. Reduce
the size to 0x10000 to describe only the region actually used.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 9f9b9f9af0da..3b78835ca41b 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -2489,7 +2489,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm6350-pdc", "qcom,pdc";
-			reg = <0x0 0x0b220000 0x0 0x30000>, <0x0 0x17c000f0 0x0 0x64>;
+			reg = <0x0 0x0b220000 0x0 0x10000>, <0x0 0x17c000f0 0x0 0x64>;
 			qcom,pdc-ranges = <0 480 94>, <94 609 31>,
 					  <125 63 1>, <126 655 12>, <138 139 15>;
 			#interrupt-cells = <2>;
-- 
2.53.0


