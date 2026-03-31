Return-Path: <linux-arm-msm+bounces-101063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGCCGsrSy2mILwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 15:57:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 642A636A92E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 15:57:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 44116303BE1B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 13:54:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70B4F3F54BE;
	Tue, 31 Mar 2026 13:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B1HcfgW8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IzJy6AAr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1765B3F7875
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 13:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774965286; cv=none; b=ocTLTknKyNN0u/j9QbB9weraLYiUYeS8tWa7w3gnKUaa7mhe5I0Htd/QZvvRDqiq1b1+vXp/rEbWMoDrAQZ072dMyZMih9q+knFQFc+yc/RX3txmrH/qOrmACz3i1Bkk/nZ7kzOPvjUGuOCaLLDuOZfVDu5N/bzZbgQOlvAs2sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774965286; c=relaxed/simple;
	bh=uINeSghcSnHTcoOpGq08LKuvp5VQ26vSLMRX+YztYTE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lS4i36btmP1WmfXQJZicHTblgfFkBB5+RigsPiUbGNhxvZZNnaa6mSJ9Q81RHzHG+DgQz4cWcp9qLJA6aPe8DcTMiHozr/yGgNVQcGQMMHj+KTLnVDlRwXIp25C83I3ODeyaK/hvCziCCBS5lurZYSGOFJ9qNl1bUqAeaBBa/W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B1HcfgW8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IzJy6AAr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VBEF7j1841169
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 13:54:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DDNBhIh4AOJoI28FZRnT5jIY4cmc7LdxaFMdNuNxdxk=; b=B1HcfgW8p8EhAZoO
	4koPyWYua2eCxVsOMv5bwppphbIrnIsI44u7x+Jsi1F37MFCiB/RSXG8S8bz1qr2
	MzG95b5Z5flxeL7riA0gZ+2clb2VXUtLLi9+XOUcTsTwFkPwidFJzK3SqqORMTRd
	gdvUHR8JHo1ctRNIKzEzDkl8GgAw0Ua7WdO+CIjtN8kclU9oqhhueo2MgpzTSozb
	IlQZU3eOVHYqEyQcQPe3Fb/LpyzdAgnVuTV1dJNCaZGYy1tKSz99JKHQReNpEWhU
	2BcMJ25AJEf0Yi+gpCfVpbSEGWjVmSWk5MWrThPjizkxUh+ht8PcBWTkqfUamjzS
	AzB0ag==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d80rskdxb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 13:54:44 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b24a00d12cso31724785ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 06:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774965283; x=1775570083; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DDNBhIh4AOJoI28FZRnT5jIY4cmc7LdxaFMdNuNxdxk=;
        b=IzJy6AArdbVusMklZBbBeziqAaM7FPRkRxzFpBnowoXzod8tf795MVoSdvP4SYKqfF
         0edliB0+jp2QCGs+/0wsaFDTqNdVscOzq56LEJpBQ5JYZXiy5NbkomrGQQa2BBl1KVjc
         GdQvAAo81F9ayaYfuHmbkAWN7MYy7iMfed5ltHjFDMev4kFhvGhdVI5m0dlfj/1Eyu/1
         waGaHGbJ4uwUs8hrL7W2pOM7LuP1nvfmGXINxgA5E9nZPVS5k7GscT6ROD3sol5sznDR
         /C1nxhvUMbeXLGuqqfrV41gatypX+bVKyJvC7AmSJAWCBJQWO22/jGMBvVvNmNM8zKvd
         g8UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774965283; x=1775570083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DDNBhIh4AOJoI28FZRnT5jIY4cmc7LdxaFMdNuNxdxk=;
        b=LkL87pukVpTaEGgZEUXK88tNc8XoAxJ63r4i8gppvb2Mk2NJ/yQGoHAjUDpeGeiJZ+
         +mppDWHK0wicNicr+JXdEWV7l+SDYlzXw1hDH6Bsxn6ft2tF7cHyjwO4KE+QdXC5obKh
         aklaLB4gjF7mjzzwncz59dpNtNtkoj6dPGQAjkdzwqnR85/o5x4r0RYoLqKDIiAnJ510
         nCXymN2mwKIfhPDmahjmaZkkE97V/oAJ99EQD82UD7atVqh2TPGsJP3fOD/Bj48kTqUn
         DB94I+7kxwA44CWj7WQtKDcXooWXJjN8Hlku5gaHKceir7E5TwAkz+P/HxTFBUTgU9kF
         rRuw==
X-Gm-Message-State: AOJu0Yz6Y7mZV9wQ90DgOjfP59rCOOWQ9BsD+CQJ9u6I6BmU/h2vPlHG
	WMdfYCPeTs6FlVEQVEXvHNXDDBOrl0GC7MK6lcf8sLizwI+i1epAGKsWQS5GNv/Em7Ks6ZJhaXP
	+9VbEbr7ffIN5m+cpUTjUy5qnoSpLU6+zeDTIgWKWKnuzt65p5s0TZaL5PzeEUiZlsaMm
X-Gm-Gg: ATEYQzwfel6tkmF1WgwpyfGj1E946+TLXMqBYH8YEAPW4g/Ow8CwEmxEs1RlKXchdSo
	NmF/vSIb9m1MSVT3JxEo+K6R0qYnnQf6nnDNanabRSCLfmn42+RyxLxc85xtEX8ELVw9kyg0S5U
	Q5VbGfSXFR10RYl4IWl1QTpAf11Pq2C4LyPdnibNFNEqfenpA0h5lHNeJ1JK9RzqTCm6ZVQE8el
	y7booqcpihF5//CxC3BiUWayPUk3qXD5sUOiQC+qaF6spdNLbodAtBX73kxkJmQHabEM3meAh0a
	FXfxs5BY/kU+CEt8k4vDxqLMknaORUfehjn5J8eo4AFJtJaGLk8rcEoQ1qgkEJcUj/imd8S6680
	x3VipbeGY58N2ahiC02UfsRxwhWXsg3/3LH+hOTeYcMlo1X01tHD8ZND4RcYhyMvCnAzrF0cwsa
	xIaQMCHOuYqZbKPRHuqYXq3SiAY+3Gt8TYo9D8dl68vQ==
X-Received: by 2002:a17:903:94d:b0:2b2:57df:264d with SMTP id d9443c01a7336-2b257df28acmr61863555ad.33.1774965282998;
        Tue, 31 Mar 2026 06:54:42 -0700 (PDT)
X-Received: by 2002:a17:903:94d:b0:2b2:57df:264d with SMTP id d9443c01a7336-2b257df28acmr61863275ad.33.1774965282481;
        Tue, 31 Mar 2026 06:54:42 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24268e7f5sm112748945ad.35.2026.03.31.06.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 06:54:42 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 19:24:21 +0530
Subject: [PATCH 2/2] arm64: dts: qcom: glymur: Add qfprom efuse node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-glymur-qfprom-v1-2-5b4284d23c80@oss.qualcomm.com>
References: <20260331-glymur-qfprom-v1-0-5b4284d23c80@oss.qualcomm.com>
In-Reply-To: <20260331-glymur-qfprom-v1-0-5b4284d23c80@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774965271; l=964;
 i=pankaj.patil@oss.qualcomm.com; s=20251121; h=from:subject:message-id;
 bh=uINeSghcSnHTcoOpGq08LKuvp5VQ26vSLMRX+YztYTE=;
 b=0xs+xR5bvM/EBUxkzmOZnAUpdJkAbXGZzN+xOQaQ8XvGZ/5t3VZF20F5oVQXCE9lPGmefBc83
 5R8+9+5qcpTCMitwe4XaFYKJp27puA154RgdHbSr5ed/Ubn0vCJcuQj
X-Developer-Key: i=pankaj.patil@oss.qualcomm.com; a=ed25519;
 pk=pWpEq/tlX6TaKH1UQolvxjRD+Vdib/sEkb8bH8AL6gc=
X-Proofpoint-GUID: mulM1D_sjp4hR0gUy76d6bEwcn9u2cpI
X-Authority-Analysis: v=2.4 cv=VInQXtPX c=1 sm=1 tr=0 ts=69cbd224 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=hSIpf8IZWTUUM_YmQ3EA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: mulM1D_sjp4hR0gUy76d6bEwcn9u2cpI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDEzNCBTYWx0ZWRfXwE1R1bOZw15m
 L4nkgYaFcne8jiQW+29SebMmIF2c1SlcSTteFarLJ/COVbrlrwE1/3zYQ5/HYp5eIXJ3YyNEOob
 Va2ORRv4G1frT4dfGntuF8ZajELT+96VWzwNmx+0lQrtMb/YtNYvD0nebml3mi3RLglw9HQVAxY
 0BDGuzYHvseJ8ddjjhPZ4OuHMFQoyD9sevsW33MmSI31x/MFHRhcx7sfjV2QA+GaADlikYfeNQ2
 hpa4tcu+xbwodyT6xoDJ5Yilg57+mvcIdM1I133+404LzxBsAik0clbVyYFQxuwC96el1djFsa9
 JjJLresL+SWaJYxr479IQhvWHHRzVCV0Y/akYlBATDY9iHGvFK2khLHarpWnAY1h/O3BxZXSEcz
 NZ/RwifC6kscup1Gw0zCTyPC4+cFUwdGpU52GoL+SeYPWFwx/5P41vj2N8ljIWzwnysbfdugAeX
 JttBmTAHsC7c+mgA7ag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_03,2026-03-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310134
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-101063-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,320c0000:email,361c8000:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,81e08000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pankaj.patil@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.138:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 642A636A92E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the qfprom (Qualcomm Fuse ROM) efuse node and gpu speed bin child
node for Glymur SoC

Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f23cf81ddb77..7a72fcf292dc 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -5914,6 +5914,18 @@ nsp_noc: interconnect@320c0000 {
 			#interconnect-cells = <2>;
 		};
 
+		qfprom: efuse@361c8000 {
+			compatible = "qcom,glymur-qfprom", "qcom,qfprom";
+			reg = <0x0 0x361c8000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			gpu_speed_bin: gpu-speed-bin@138 {
+				reg = <0x138 0x2>;
+				bits = <0 9>;
+			};
+		};
+
 		imem: sram@81e08000 {
 			compatible = "mmio-sram";
 			reg = <0x0 0x81e08600 0x0 0x300>;

-- 
2.34.1


