Return-Path: <linux-arm-msm+bounces-103026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOmTB8i73WmCiQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 06:00:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 755513F564E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 06:00:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D684301369D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 04:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 147FD345731;
	Tue, 14 Apr 2026 03:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fBrbb0ZQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G06Tdgne"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C7E33B6F1
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 03:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776139193; cv=none; b=kWI0QyJQ49+mVot5RxC1Rh9GvZjKR+LUhxhixKMjUQ4fUYOQiW10grGfhAHy1tDmXRQUvmnn7mSreXq2hQHLw2H9WaaL4p7tvMFG2ggye1dZOTmXO1UDdGC9GE3KG/8VstSNLV4JOKAYBm5muia+Re1gtiPpktY1jtpc+VLYoTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776139193; c=relaxed/simple;
	bh=WdAwV2ejL3POz12dfXrN1UH7myAW0uxPAf3hSkyDGTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VwJUed3Jv14tx34F5zAUFmBT8KMddE6IS7kE43g5SRFBnhf6q0rkq5fa3sNznmvZvLXCY4myycGAOpfr7y7bXSI9COBwphzpQQ8mActWLRqGOdkKJTFvG/HvgQob+TbXZVDSIJ4jNoT68lygAlvCdGRLMBPyqt2hlJtSBmcjhzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fBrbb0ZQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G06Tdgne; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DLCp4m3505568
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 03:59:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Cfj1ElFhQ7U
	CtHccCgOn3S4aPyvBMl1dKXXhKEwS3w8=; b=fBrbb0ZQSVnkfkZJb/AM//ggNz3
	zC9LhBnb2izxgMyGAgmiAROk36w3j6kaDGsKGhU0HSdNzVaEhyqTcwxnFqQ8hcbk
	LTcqbfJjjmu9QWiWbd1ObYfNaNweqokW9irOVjVS4PLTbX6M34HqUkcFkIRo27YI
	1UHt07kqDfGxdsXuX1JlEeYjgwYpGGX2qiVMY9/7JInvGYpaXe7sZ9SplRBu7vO7
	PXQBCZuNTnoDT03TKt60xOLJ+wIdKvuZJUXHiOeBgwRbIVX5u6n7n8KsgtRYvUOt
	cMdVi0Z92o2kIWAD1mmUkGj2EPwa3sCcW6l9Qs/srhiwGrdrPd5ZykP/NUw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870gwtp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 03:59:46 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-12c35f2c09dso5331906c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 20:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776139186; x=1776743986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cfj1ElFhQ7UCtHccCgOn3S4aPyvBMl1dKXXhKEwS3w8=;
        b=G06TdgneA7BSSmHvaZwdl4PRONTpkK1/HEMMpTSDA3rvYoBElSA9xmMKismwSv7vVa
         RR6bEpAHtRYx+P0nrTul3bIJLMDGuNju91zC31GPkeMprfgPseqMnxCTnYTnEYFTvwLa
         daT6egVitFv5ImDiSx0DXCt152Ly5o3xnyR2FKfvp2jg6fQNP53vC43JhEt/OL1yQQ4V
         q0LN8k7DrDlLGDGnTi1pSft/5gI0EIKeROD8Lb8C+lCseCIU/orsWY1ptPTvuwNTh6HR
         uDbgbCA+xniVFwrruwcsL8t3tAVqzOXduGPxqE6K3X8aNqzXufdpaBDg7GGkuzBg58Um
         M65Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776139186; x=1776743986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cfj1ElFhQ7UCtHccCgOn3S4aPyvBMl1dKXXhKEwS3w8=;
        b=VpQMZRF22kthwK0Q3XTekmVdkDZ481VyM0aoKi7zjY1kOi4dXICJVYc7z2xgyacXop
         AT2OmrVHkBhjbDBaO1dUjFXPLIdbUYZ6EPwfWnSrN5xCL6NA6u7Z1uTCpt4w4ASNzKxh
         Z9LRpCca6UP0EPfOT15xAQYQJehAhey9kYSEYmSA3/25xrX5/246uCqxaQWHn3RrQpEn
         n5+UVVMk2TvzzQhZyl/mpTS416JoTnsrkMHKpx+5UHjRy2lMfMboaQ4PHPZFumpX9xCw
         HpBUH5DOcHtqsp33wXADMjnADfdK0M4YkO7Y0MVLPkY47XtetRdCco90fOpAXz0/AA9Y
         TY/g==
X-Forwarded-Encrypted: i=1; AFNElJ8Rc4i2lPzK2daI06dTS9cytWCyBHX/jnlOzjibKzolDh1FYcHdEoRNe3HWBSre2Y5YCsnv1owqRDobzu/2@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwxz1WWKfVLVm3ML22dUteQomr1jRxuK4BIHwvUiKei/mBHZ5X
	iEYfct4Ua73vz7/DmgnDijhPBPX4Xg78SidfVHh9qbWGSN7eL5A66wIhMgPknN2T+aq+sSU4zj5
	gfIdBCqj/GZ8b0qLnBIJCQ0Phk0H/EPPxohQRFR7gg9NqgxsBaQhkQ+N4S6I2b7Ht7zcr
X-Gm-Gg: AeBDievrRPbkE2z7eiGe8p+VFabNI7dBdtiEBeooGa91DjeGNhyA7w6xWpMrIJqnJVc
	5jmuOJgNLI6Qo4kUGgNRrlNcKjJPT6pL6nLBtXjAlx8lsQdHLuZqNLp4iuJh7/pvVQXpWx2wZh8
	0iYTaAyHpPmQv09HtlVqyoGj1bOqf6FvosbQJEgrfofgu40l9TuDHy+kFv4aMZOHeZ4lCDh+l45
	zNmmbQ8QX2LIvY/8KZBXuyX2syv3/ZGlrzKBHkjW9ZKITqTy2ZGblb0OjIpZx6ttsb7g+hO8Mok
	S2FNP8tyxo4KS+6BbJqt31+J05Fsx+6a7Bb7hksOlsVquNgmJ1KDOugnK7oq0z5Q+iPZK9nm543
	FARi6a1zDyqoWuXCQYUNRDqvvMhfKxieyRvfc4C1h+cgDm4Mo9T5Kxfj/BAPXpcYN9IeskJXKbL
	OZttDNAQ==
X-Received: by 2002:a05:7022:790:b0:12a:b932:81d3 with SMTP id a92af1059eb24-12c34eeb76fmr8472607c88.26.1776139185930;
        Mon, 13 Apr 2026 20:59:45 -0700 (PDT)
X-Received: by 2002:a05:7022:790:b0:12a:b932:81d3 with SMTP id a92af1059eb24-12c34eeb76fmr8472592c88.26.1776139185421;
        Mon, 13 Apr 2026 20:59:45 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d80acca4c5sm13949983eec.19.2026.04.13.20.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 20:59:45 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 2/3] dt-bindings: power: qcom,rpmhpd: Add RPMh power domain for Nord SoC
Date: Tue, 14 Apr 2026 11:59:08 +0800
Message-ID: <20260414035909.652992-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260414035909.652992-1-shengchao.guo@oss.qualcomm.com>
References: <20260414035909.652992-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDAzNCBTYWx0ZWRfX1VZhExiz+Nf+
 qTgxWjzYMpfq41aca1wq2DLvh7Agd7vSeXSGpMymzbni41Hsab35CSucExnq+INA58BSSNc+seY
 Sj5I3Nv8EREoDO4Yc4NU7Z/O2ZAx7sNsuIyBGaCAonXCxiwDaumGksrhzw8M8gBVVUs8gJ2c5ae
 LkwUblZGhYVRaumY0HRXBElngV067qoSEWawJA2FJosvWUJ3QZDTd4N5LwYudUKpgtzO+FQIpQ6
 43FAT4tZqcRTXk0sPZTb3IR7SDT2xJ4f1ITSgbSsy4WQ6Wojfw+WXEdSuF3qXTiXFadCbs2Mf/b
 O5fXv3DOOxWxjrVpKX/KZkyK6oB13qdBso1gOwU1729ufT/hkNXi8ZErYtDH7K+KHbVd1KM1jYS
 ef0P8i5AsNxlm96DaeRGHdvaAwImREno30ZCCuDQTn+SlsCeMMu3XJ2cAo7tEbRnxQn0sigQ6hS
 o5SSmuYfOJo02bDw7vw==
X-Proofpoint-ORIG-GUID: oZW4EsLnEUYaRse6j0caXVOPiLRbDfEB
X-Proofpoint-GUID: oZW4EsLnEUYaRse6j0caXVOPiLRbDfEB
X-Authority-Analysis: v=2.4 cv=btZ8wkai c=1 sm=1 tr=0 ts=69ddbbb2 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=fp39WZOfobdgVpjsm_gA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140034
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103026-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 755513F564E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>

Document the RPMh power domain for Nord SoC, and add definitions for
the new power domains present on Nord SoC.

 - RPMHPD_NSP3: power domain for the 4th NSP subsystem
 - RPMHPD_GFX1: power domain for the 2nd GFX subsystem

Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
 include/dt-bindings/power/qcom,rpmhpd.h                 | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 0bf1e13a9964..779380cc7e44 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -35,6 +35,7 @@ properties:
           - qcom,msm8994-rpmpd
           - qcom,msm8996-rpmpd
           - qcom,msm8998-rpmpd
+          - qcom,nord-rpmhpd
           - qcom,qcm2290-rpmpd
           - qcom,qcs404-rpmpd
           - qcom,qcs615-rpmhpd
diff --git a/include/dt-bindings/power/qcom,rpmhpd.h b/include/dt-bindings/power/qcom,rpmhpd.h
index 74e910150956..07bd2a7b0150 100644
--- a/include/dt-bindings/power/qcom,rpmhpd.h
+++ b/include/dt-bindings/power/qcom,rpmhpd.h
@@ -30,6 +30,8 @@
 #define RPMHPD_GMXC		20
 #define RPMHPD_DCX		21
 #define RPMHPD_GBX		22
+#define RPMHPD_NSP3		23
+#define RPMHPD_GFX1		24
 
 /* RPMh Power Domain performance levels */
 #define RPMH_REGULATOR_LEVEL_RETENTION		16
-- 
2.43.0


