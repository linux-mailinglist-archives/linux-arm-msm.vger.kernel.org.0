Return-Path: <linux-arm-msm+bounces-111315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +oQZJANkImotWAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 07:52:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BE96454D1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 07:52:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=nSAtWOZz;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=O7oLRN1c;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111315-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111315-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 175773037891
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 05:45:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F30323FE667;
	Fri,  5 Jun 2026 05:45:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC5A3FE354
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jun 2026 05:45:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780638354; cv=none; b=HLimxdMdyl0w3ws7cFFWjbeYqJ2bVvi4hdol1bFOnMmdlWrKS/vhKzj02U+uT0WAPtuy5VLhIHtsDGNr0HttBJb8Dv6B2t+XAXjns1/MQMovPnLz2xywpNO/HJtIATLjIBEB4BInd+jxI4jsOCrhst8HIP+Uz+gZYen3iDJbxtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780638354; c=relaxed/simple;
	bh=xYfGJGzqi+Ph030q1iDRh6gIu/gZ6goid+/tClxsst8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TyA7ZQCdXE5T5Zj7kXgoPhU8cxoy93aQ6qU85wdkIM6wRJL216l5HhKM1wf6E5mfDyGLNgMs4oMadyUAOPNic44OF5A0lUSzo2daJdPQljJgNAuJKjphdaHmGCCv9btIGTzjx+zMAACkQqryTD+yy8/oaZ3UnBits365Uxc/It0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nSAtWOZz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O7oLRN1c; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6554eFBd3221144
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Jun 2026 05:45:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OgwT+OL+z8vfI+l/SS4Z4sNq5N2cJHI/Lr6cvf4FDlo=; b=nSAtWOZzGBhncIdI
	QGepczeZa/zUuIpTQXCt6kQ79VTq2vquvd7bjsAg6N4fyo6rx3pnnza15G8w5fvQ
	F3QSTDazpO3uhXNWiqVSzCofERjTcq4riC1ub50rySFuzQxTjwCS/dJTL1zY2S6A
	1HhqFHA9lUPSX7WLyL4EzcdyFSlhhUOasp1G1V/nWbPmTfVEoFmdEuwSQJF0Q7PC
	jZmFBykIs6/GJl9u5xE/mlQA8EnwQXFoT0EiFqfTuTEccKOJSpQjg0WjxfZtU8iy
	4Hjcyj1tnJ1ZIU1QnZXSSUE2ueMs8DLlY9bH18QXZxr10I/aPtP7+7zd1R43axpA
	nEBD0A==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek95uc836-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 05:45:53 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-304f23c55b2so1365281eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 22:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780638352; x=1781243152; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OgwT+OL+z8vfI+l/SS4Z4sNq5N2cJHI/Lr6cvf4FDlo=;
        b=O7oLRN1ccRhAMQZO9XfIrac4Ly4yEM4dRXKfb9frMjPswDRHYiktxPItjTGq9FHD8i
         fhKBg776+zmgcDrIGtBRxaqnfhPxp7H6zE+mp7f7V5Cb+z5y7NeT5BXY716y0bnw1SVK
         lCk7B60DquXMEnZ/+auMKgkusuJpxWX8JJgNYoTuHUjY8o3unxLpa6ewjdis5/4WD0Cb
         GQPQVMi56b3nkJQ2AJX64xia6ZrcGDOSjHb+frR/XfvwMrLaKV9dlmfIg5AJ6UXjuLsY
         chcg0UnKFvzT9m7JuroHGBEFtqtAsXZzDSolshvdE88aSKyYvLN3qiYISGtHSQf92Ev+
         rFrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780638352; x=1781243152;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OgwT+OL+z8vfI+l/SS4Z4sNq5N2cJHI/Lr6cvf4FDlo=;
        b=MTqKc3hkSW/7j1zeBTHiQH24/sGJ44izdFKhMtAsk+Dn2IPJWj+VexvtbHzs5rfQxC
         F7hrvnSuESQ3D+6W8qQ9lLBXPOFVk2gH2+h98xeAxwkyqG8omlG1T/98ONwJMgg2wedO
         4RTrjKWlCYcH9R39vnNDkCxW9jQaH8c8pkvji/CnhL6i7yOCf3+AiqimvB0nEeuHBleR
         QUjD/fSMK3D7ImpCh24ExrWeIEaJmtTB0BFpNe5Q2AzQlaYzyz7P+MzUnTKx3h5s+jAY
         I8Df6zQILu1Ztzfklbd4VBXj5u4bw8NLXGmt7WJXItNw+yMm7H/1MbQgWD1X1HVCofQq
         cH4Q==
X-Forwarded-Encrypted: i=1; AFNElJ89TQ1T2o1FyDudndvGQfQ+1hQYR/6/dxn0Nij3Eo/wlcORuXbQzJYDlyfJOW8ZmgIY9DdWVwQ5868BlLIp@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb4DowXAB8MC77fzmBlX4bGAdjIYzFCMm7r6+6dc22gJevfXU0
	QLFCNlcadDnhHAis2TpHW8Y8vj+/zPW7JBEbFvNiORWRxxQTbQhHcr1oycGdoPIMooyLqNidUkh
	U9IINNeJ7K2sLvBC/d7jn3RzyXRczRonljdnsFC5a38QbZ7b4hgOTYNXDMk8Qay2HSf3J
X-Gm-Gg: Acq92OHl3Q+DFChxy6jptHCO+qGpDoDhZf1GBMdZyRx9tSyPpfMnqAbJV9Xe4c9mpuC
	buoynBNyNs2GQkwp4UxKXraymxkHz8tI+Sb5C8TdYW3LMIdeddiX5FFMnw10lvRwrAPMiCTiJWM
	zxYBfERQjKaj2A3EEhHozVY3QmzcbEzv25QAxEXYd4i5FvlBNKsDyI15m2egfnma6TBnfBvdkPz
	Qk9gLSjTKuYxga1z6FE4SbOSUcEJC/gv4zzkYEMWwMpwGHbm3Q2cyf9PNp4Ij+PmT8nuGkVcBti
	ETn4mac3fLzKWZj54AryHm3urI3cYGsJ5V2HIVqwCZz0Ps6iPPqIIw2/BiqUs/68M7WgXhT2h6i
	st1vRYmI6txjV2Ert5z6CBWGB3YVJasAUop6Hiq47vtQJu83bYTq6msJk82Mvw20HBJIl7a7K8V
	3Bk7KJNvY=
X-Received: by 2002:a05:7300:8c88:b0:304:d32e:65e7 with SMTP id 5a478bee46e88-3077ae9d56bmr987102eec.0.1780638352444;
        Thu, 04 Jun 2026 22:45:52 -0700 (PDT)
X-Received: by 2002:a05:7300:8c88:b0:304:d32e:65e7 with SMTP id 5a478bee46e88-3077ae9d56bmr987075eec.0.1780638351930;
        Thu, 04 Jun 2026 22:45:51 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db560d7sm9480955eec.5.2026.06.04.22.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 22:45:51 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 22:45:45 -0700
Subject: [PATCH v2 2/3] dt-bindings: sram: Document qcom,maili-imem
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-maili-soc-binding-v2-2-21b5e9bd1aa5@oss.qualcomm.com>
References: <20260604-maili-soc-binding-v2-0-21b5e9bd1aa5@oss.qualcomm.com>
In-Reply-To: <20260604-maili-soc-binding-v2-0-21b5e9bd1aa5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780638348; l=829;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=xYfGJGzqi+Ph030q1iDRh6gIu/gZ6goid+/tClxsst8=;
 b=FeafrsqYHCEo46xdnH9cEd77S3l7arVCzxflAoMOzQZhD3LckYHw1rWcU4U5xxoMjmICvfV3N
 AOcrSWFABACC6LKVE4nUf1amNc3jZz9J5CBodevDJ8uP0EJ/8pYccmp
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=at2CzyZV c=1 sm=1 tr=0 ts=6a226291 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=jc7a-Txr_6JP3MmN458A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDA1MiBTYWx0ZWRfXy8353uozS6rC
 fsfsKVb6rewelfyOPxa0czHdHdDR/FINAvasupAk9YEBaNJH2UxocNzEKBbuCHt/E634yxlzFCe
 1PhXT7rR5yllPYSzB2meyHMIKX435F3HNYzONZl8jtYdsXHbZJ7RC3UqPAi97UUp//gSWDN12dd
 M6qUb84DHqTvt43k172Z2dIOfk1h8mS9r08vbOWMseaTm8u+UjpmGOpo1xNVERiTsCc2of4NEe1
 qSISLb9ccq5dDf4dV3Fy3DT+k7iN7/bUbX41e6kUR4PIUvyhhTsmOp9LOBEydvGMMisLuA86wcI
 NyrIFLvepQZTrZL1dH7XahR0trnTuwRKTsrMIikYgvHT3qojI3A1O8znPXXuiuVk6DilyXtndOh
 HkpWRoomiXtg6JdeCPye9gzcRItNXEdfpW5MnUFJxLd1ikF/Q+pawHDPirnav9+oEAyNt0+6DwS
 mo8pseaKjHbUrAQIFDw==
X-Proofpoint-GUID: WQ1CHDCYDVsQzpAFsV0NgzjuWSqKmgbi
X-Proofpoint-ORIG-GUID: WQ1CHDCYDVsQzpAFsV0NgzjuWSqKmgbi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015 malwarescore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050052
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111315-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robimarko@gmail.com,m:linux@gurudas.dev,m:aiqun.yu@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jingyi.wang@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E3BE96454D1

On Qualcomm Maili platform, IMEM is a block of SRAM shared across
multiple IP blocks which can fall back to "mmio-sram". Document
its compatible.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sram/sram.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index eb695698a03e..14a537e82a84 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -37,6 +37,7 @@ properties:
         - qcom,eliza-imem
         - qcom,hawi-imem
         - qcom,kaanapali-imem
+        - qcom,maili-imem
         - qcom,milos-imem
         - qcom,rpm-msg-ram
         - rockchip,rk3288-pmu-sram

-- 
2.34.1


