Return-Path: <linux-arm-msm+bounces-109969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNFmO4a9FmqPqgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:46:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C90135E2085
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:46:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5910F3033F5B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 09:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 515923ED124;
	Wed, 27 May 2026 09:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gs4N81/2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TS8LD6ad"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960F43EF66B
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875089; cv=none; b=Bxh5WNk5rACQPa+Mu/agVxwV/i5JEg5abCpcKshmI1HI942aOEBnH/uAJoL9rCXBM2M5XKDHJ3KMf1e7LBg5d55siT08aevT8bx7lJKr+enx8q1ek4Sd8n5bhUvxTGTO4/e+GjtW7jREiBCC2hjjWnxptVY/gd3vfY/xTn0rgLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875089; c=relaxed/simple;
	bh=zXklJW06SHNkmW/i30zoj5Iisfv7Ksrs9zqE7YaPR6k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OqbynfyPem5DJzfK1v6GSTYemnXK2lAo4J+k8qt94i29U0YcqDTjDAh7DT8u/07Dv6/0HGofJglY5E2qo4WG79LZlViTVolMoP3rsIMZ+foudrfMo9k/cWmvcs62Sar9mNgD8sfHOqJ9XiKBBLFQK2NhhGpt6+fyzGNOugsmTR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gs4N81/2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TS8LD6ad; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mTNC3830810
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:44:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3RBp0Ds4R6F
	66SOARppSLkTR2i6eLyHuZggWsiwXZyo=; b=Gs4N81/2KMjHHZ1CDMqzxe2uqdo
	VcAea8IAF2Z1+SkANVJZ8gi3U2K6gJXCaTqyqaEakDCWPX3qR1gYqc2cw3gotNPE
	J/vxDj9kLqcrRb60k7BzLhbmoMu7/37hU+TcZJGw5lix7vtLYljisbuIoOzu30Ul
	RlZwQXgTGzF8GgVfS5u7UJUXCtaY6gdmTvX7Mx7p/MTK7SEw1uEYwciOkaEzrfx2
	6SmAPoivflOU3A5TsYa2T6oASsqzkO8TiKQKfXzOpjg4+BjPnrSIAZL97SE4RIsV
	mZfArH02wv9jVMPm7kS+UDqrKv9tlnPd5+SHude4rRtAmGIg2RCn608CcBA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edn17hxq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:44:43 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2baf7748d0aso117830605ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 02:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875083; x=1780479883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3RBp0Ds4R6F66SOARppSLkTR2i6eLyHuZggWsiwXZyo=;
        b=TS8LD6adKSn/DtX4asP1AMING4A+QLplB76M2gTWclh+wTKwQt9yyww+C8650MnxXr
         Xj1tyu4iY+pZxtfJXzW8DgbBgGvIBNO9lEPTuHv0sNLpHWZEVmLX6tnHmLmfqQqKICkX
         GYLfNYAAjcUdQwvbPwOImzm5rK6iJTLCRF0+r8lkCeC/46AsZ1+b5HGOiwOb7mZL0PrW
         CtjjoDswdnnW2U00c5AEcGJnyu+pINSVEdVetJ7PswNkZaYBcvQ32KHMEL5a8imH2sk1
         lTd9Th49/kkwP3d42hEN7xpfQSaq+UXhgNR2ENBN+zPmF0iD1a5mjTT3nKNpoDMRLO8/
         gv1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875083; x=1780479883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3RBp0Ds4R6F66SOARppSLkTR2i6eLyHuZggWsiwXZyo=;
        b=ABIlXvJr0QUQLqklhK4Ua0OdL+7ehD8+KeeZ7n7IiQOdlIZUwxiMgqj2JXki/XX5JR
         kKZnJ2VaTyuZB/dzOEcbsK7gnVakHI0HtXPPxaM8ni0C8HTrclUZRGOmOQHeqcLcW5+C
         epfPugRCo+NAY8/o2mqZaoTkURt9tvjxrGAonTDRBlsCGtQm+2SAJnJ/pfJUqNvsx2A3
         pWqgrl4sBWJA5OEBHJz3aR06pH7CeBMqgbgOyhikdBArIdLY+Mtr4qqVwvt7e+LdrVH9
         7K1CDnImzBeNFQ4groF4Or8cxG5ICz1mZbTvz6tTbIrd68YOjrUC1U4I0JWE+t+WQYkO
         8d9g==
X-Forwarded-Encrypted: i=1; AFNElJ9KGZTux5i/2xIyK1PKJIg6lwR/dVdNrZj+Q23MtS1ZutJhR/Dbj7vc6X3wx1ag9S0qrEqe4NIyo/fUeGgP@vger.kernel.org
X-Gm-Message-State: AOJu0YyRUAPjeYiBVtLHZSn091jSuqHxMsoon8sE+luRDAoGv+zVPILz
	WzkYD6P29UX5fcuTncLvUmIukHpbd0Ylg36xuh0KXHFLhMEIwlIKkV3mkHMLVGUPSGMHENTkGxy
	zCFEuSBqUAGfBtrmiVPv6orvtTpJ4/z2N6vGs1m0vCpXDX48BLjji7zEjJZ2O4UTMj4lu
X-Gm-Gg: Acq92OF+DYhrr6c0gI7v+ukhaitUuJDlVy0c5miB3yRqpii2qp7+hcFkiSeHLmqWGyf
	5gOPpUsQIpA2xkZEcCFsUJ9gpw6/ZalvA1zp/BYx/Ix+X1JR0Y7JEePH6utD45OS9dg2YBhMcB1
	E86MwvUfPxRRnPGQ4wLIrO4zXhDE5gJQvfN9dBbCB/L/Dfp/sKwaanbL8t48DWo9wZzcB1LLD0C
	39whQ0TYXmJkQMH4zUNvbjHCDeIFrY3LZwBHdl+YWZ9dRVlG02qNqoJRt7XIVGTbM9nBXEDCBmx
	9f+4lUUe6z9g/r/+/d6BA7xEf4KZ74FNboPI7n+0X9mED1A/wh4xLmMoRYsoTVO3ltHAsVkzsCT
	iBUv6EUWKhlSa+LGyE8zSkL5OzykXxKdXuTUmK0rk1LZ9Ri1V
X-Received: by 2002:a17:903:252:b0:2b0:ac1e:9737 with SMTP id d9443c01a7336-2beb058d650mr256210615ad.12.1779875082628;
        Wed, 27 May 2026 02:44:42 -0700 (PDT)
X-Received: by 2002:a17:903:252:b0:2b0:ac1e:9737 with SMTP id d9443c01a7336-2beb058d650mr256210485ad.12.1779875082147;
        Wed, 27 May 2026 02:44:42 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b386esm154738185ad.44.2026.05.27.02.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:44:41 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 15/24] arm64: dts: qcom: x1e80100: Reduce OS PDC DRV span to 0x10000
Date: Wed, 27 May 2026 15:13:20 +0530
Message-ID: <20260527094333.2311731-16-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5MyBTYWx0ZWRfX3JvmDpKjJbnz
 Be+XLVvYCr+3WRoygCYicR9Kk/2iGWSG/JjVLRWhwTMF22NY+cXISEDaLI0carLT2OYBUgwa3kQ
 rQz917nDsd2f+aijX1GvsYK9TwMJR6dy9TrcyU5JNYPJUCQATITEkrDn52dWuwHDSn3dtFjUNkV
 a9eq7HGzoLMhYAajX7tf3GEARfQ0AApIQPkcvDdEbmQlQug5Rf7QVIxCvz7Uwb0ogP8UneM+eIe
 cCQOv6Fp+w8/Z/TbyUjvzxENGFlk9i3cT7U+Kmm6cqm9OTG+wdjPG+3fSKn7rHG62t7RRf+FjFJ
 JHOl3kbeWjBAdWqez7r37uV2VAaib3Lia5B+vv1JCOMvUcpYWNM+0je3/6S5d0lpGeCwiIhXzrK
 JWex88nBS7tf5VN6gnNwiR5Gwca5A8sfp6uA2pcJtDQE83tByBgUIAvQF/A9n+daprfTnS+cPyB
 slA7hXymDYBPtNLDzgg==
X-Authority-Analysis: v=2.4 cv=R6Uz39RX c=1 sm=1 tr=0 ts=6a16bd0b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=2snmNNp68HHBpTMW588A:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: t06U8NI4tKZWdD61lYa33VudyTFqTkuf
X-Proofpoint-ORIG-GUID: t06U8NI4tKZWdD61lYa33VudyTFqTkuf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270093
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109969-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C90135E2085
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The OS PDC DRV register window on x1e80100 spans 0x10000 bytes. Reduce
the size of the first reg entry from 0x30000 to 0x10000.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 4ba751a65142..b5516655db8c 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -6047,7 +6047,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,x1e80100-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>, <0 0x174000f0 0 0x64>;
+			reg = <0 0x0b220000 0 0x10000>, <0 0x174000f0 0 0x64>;
 
 			qcom,pdc-ranges = <0 480 42>, <42 251 5>,
 					  <47 522 52>, <99 609 32>,
-- 
2.53.0


