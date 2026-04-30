Return-Path: <linux-arm-msm+bounces-105275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CQTC+PK8mlpuQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 05:22:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B8549CC60
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 05:22:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 852813023324
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 03:21:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EADF330D34;
	Thu, 30 Apr 2026 03:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rx0Heh2M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ykk3Fe2N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAD3247291
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 03:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777519307; cv=none; b=R8fnCBCp3xdaaAMo/v8EVPLnTA+0WbH6EgHvIPysc4x7RIjp+mwTla8l91yLMpOUg2rMUcn26bkjdaNwlg1DkfKVvF4dV9qj5PsLzuAbRCC9hr1UA+1Us7ZyD1vTPilCtw8KZ/I+3paaCNEV5W8SNAZ9W7koAzqKtlVMc/78TFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777519307; c=relaxed/simple;
	bh=uEo7zaCsh/uf4vxt4ajAnacXjK7944M3mjrrLv7CPaA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bTl85lK9eUuri1PPHYZzz93+wJv+MNsCtKdSljAOhZP/ZbenDTW6+DHM7WoVPBLqBitO95NbLAxrk4/7TbWD/v60Tc4nyQVM8dTAyMwKx0ZzVbd+97Rivl6jltRx+HIw6IMCtmCYANJbk2BUgBedDppG6LxfUTiTG6+YpxVQGJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rx0Heh2M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ykk3Fe2N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TNuPsP3636716
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 03:21:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2m+5w3clrSY
	zovj5QjtuRiasc4IUCrKMC9+BCcw+7R0=; b=Rx0Heh2M1yQjoeX6Z0c3QLKI94v
	3peDiEnrxfH8FKHQQTbV3MEmVfET1Q3lJfa34fT1VEKI1U0m8adDInoIlKqJQEG6
	KWX+9NcDZxSMp2s0XVOvLUaPDM3L41bkFDGvXlADywQSuE3uA0TdSx8T9oh7lucM
	uCPWA+FF9JNR9iPKGCgwXUc+0TjA1LX7FjCyfDnrwvKoJ2zaAVEh/zJXlx1wMtbD
	YkyZ/zDk6oKqevuXJbLHzmUT+fkBtY/S0KyIRosE59qrh147NKRd8AtB4a0TLRQ7
	5ZumC5gVtqzZ4uR2iMVocXSjEAuh3TuFf2x+MLo/8BClG/asHovcakkXunA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duv3q0k84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 03:21:43 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ba8013a9e3so861409eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 20:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777519303; x=1778124103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2m+5w3clrSYzovj5QjtuRiasc4IUCrKMC9+BCcw+7R0=;
        b=Ykk3Fe2NbJKMwbI2HPB5XIcDswwWDZw06odBPdkqNx8hHPbI9zajJ8aDsVPPoYqgzi
         Rxg1OYUfJlh0ILGPytkr7WnBDLxCj3Wp7ZlEIKe0lLYm4R/rmEezqnty/D0GYx3kGw5Z
         t7XR0oLSCuXLL25MqpsoH6nNOdxZjcaAyasq7jOFDprF/FJg+Ry+6Brq4YcSdj+GeCW5
         WztWaS3/2NUwh1d1splfdInT3X/eUrnYkVm9HRDgkOcMxeBcc+rzaPE+xs2LaDyEPReb
         tWrIJMS7m3o+U7Osr0sTXEZeW6RCsXJTpiISOXj4mjL27/XW1Inh9fxBZURknEKjnwUS
         iZCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777519303; x=1778124103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2m+5w3clrSYzovj5QjtuRiasc4IUCrKMC9+BCcw+7R0=;
        b=JNfmnvdV91Qljxv6P/mB/D/GfD21kJ6WPAN4sMKePZ3N2CtdeaTzHtBIewaRxwEFmI
         Ikp9ANdFPXmndCS3YzSla+vPNKaIa04A0/bG6+m12VFSVNevAyMVREJnzjeNi1K8GLG1
         OFSOV/jt9PyEDsWE2ikSOVUpihLgAdA8mFIVCNwOG57EO/Fyzy2U2/m/9xqie1/ZV3Dg
         DMZEmc95lQTIVbljBEUUtuYeNl99heDTclrdv6XEHVZXG+vQbYy8zgnxtFwvpWNFUZZq
         feah8PiYg6E5qOaVneVG/wG+YGBHPh5squCbBAmVeGgFVwFSKIdoyEk/xlwmTOr55ixi
         APzA==
X-Gm-Message-State: AOJu0YxcaKwacOa6E9TZcj2UU8Cx+iO/q9uaIcsyh05Hx1SqissWSeaf
	SWfXzFQ1QWMXMnGjeabJBnOCLuH50Huferc4Io/KIDNKgxfubyvUDuV4GwOBxzca7CjNwg2WBnE
	aWpzyQIlGd+TVle5DfaBED2Y2XXZtFyk23qdrWXoe87acTUsRLm6m5hSlmZYOTemhfK0mO1BvHp
	9r
X-Gm-Gg: AeBDiet78NcNWMjjCNYb7Dw15Csl7kXwpqEduxUNadgxb+M3RCda2GFCBNQLo0Cinn4
	frsqa2Biw6LVu2GvvWwnGWn7ZynqnwpPbSumtnZMkH58QSqOoULv52/fzDzL6+ZQ44E06f/uLCC
	bw9XmAdhHtWooejUS7UGOXdNyvri/OvxDpPtGpwMmePkatn60mzLV/u0VZkOJ6HAcLGgy+yD0h0
	kIU4GCZ7b7f2QDpss3cpUnHdYKnvQZZT0mKIoyZqqJnw/1nG3hkdwJWyKbtWd4l1b98rI9MK/ei
	bnxS7xFaW/o/VGTvFpQ7Q+moUYMq3h9iKSi3CSgvFgipgstwAIPcsIBMpV5BFwKjlffX0zhb6a8
	8Sk1GrM7NlacQaPbgFnc8i96PLZP9SIr9jSX4xyNPexJiH4D651LRymjTTiAmBSJEBfumvbUlni
	CYzbzvzQ+o73p3yXY=
X-Received: by 2002:a05:7022:b88:b0:128:d375:f1cc with SMTP id a92af1059eb24-12deac5fe8dmr615663c88.12.1777519302631;
        Wed, 29 Apr 2026 20:21:42 -0700 (PDT)
X-Received: by 2002:a05:7022:b88:b0:128:d375:f1cc with SMTP id a92af1059eb24-12deac5fe8dmr615649c88.12.1777519302112;
        Wed, 29 Apr 2026 20:21:42 -0700 (PDT)
Received: from u20-san1p10573.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12de321df36sm7572644c88.7.2026.04.29.20.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 20:21:41 -0700 (PDT)
From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org, ebiggers@google.com
Cc: neeraj.soni@oss.qualcomm.com, gaurav.kashyap@oss.qualcomm.com,
        deepti.jaggi@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com,
        quic_shazhuss@quicinc.com, trilok.soni@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com
Subject: [PATCH v6 1/3] dt-bindings: crypto: qcom,ice: Add sa8255p support
Date: Wed, 29 Apr 2026 20:21:33 -0700
Message-Id: <20260430032136.3058773-2-linlin.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260430032136.3058773-1-linlin.zhang@oss.qualcomm.com>
References: <20260430032136.3058773-1-linlin.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Z0Sz9vJW8YMy0WwOVt9DuCeDj1QyKzIw
X-Authority-Analysis: v=2.4 cv=dOyWXuZb c=1 sm=1 tr=0 ts=69f2cac7 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=UuHxjPGgWbCNvu6MkpoA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDAzMSBTYWx0ZWRfX9UHqucfNqATG
 Br2P/opsXCHFLIlgw7XuY4RJlTicaI7uRLWV4Gh91NR4i+G74Tv9Q6L50LE23PYG3/hdoadmLuR
 XN1gCBu8YxY7n4ntkiIeM2bGhvC8Piz4YvQ0k4NjOhN54QdDUsUNdbiHPk+8NQPF9yozwDhHZF3
 Z8zW/lOUc8K7zTIyw9tSvtDOWJpaTKZP8UBwXaOuyweNgJ9cv9aX04SqO0oaDETJa9zi/tTww/5
 Zr1UjAg1mff7Wl3KHGVVfVqJHKD08AQDCwnF7nMzIwFiLJirCjrC0NW5whrf5lCIAInO/LdpRQT
 pEo2MFqaXu2TSlZQVFm0Flxsd/oppEwnu2pCgb0TwjbmrUGKBMYCOovtDvNLatPva02OA21uMDI
 vTIV2FLl7ODygqhRdtt81c/r4HFvzXf5DDpidMFagr8w7Chnt/Q2Dj4TRHxZTkZ5jHGyXgCcsGI
 F6f+vHkdDLYY+F32pMA==
X-Proofpoint-ORIG-GUID: Z0Sz9vJW8YMy0WwOVt9DuCeDj1QyKzIw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300031
X-Rspamd-Queue-Id: 96B8549CC60
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-105275-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,1d88000:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linlin.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]

On sa8255p, resources such as PHY, clocks, regulators, and resets are
managed by remote firmware via the SCMI power protocol. As a result, the
ICE driver cannot directly access clocks and must instead use power-domains
to request resource configuration.

Add the qcom,sa8255p-inline-crypto-engine compatible string and make clocks
optional for platforms that use power-domains instead.

Signed-off-by: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
---
 .../crypto/qcom,inline-crypto-engine.yaml     | 27 ++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index 061ff718b23d..f90e5da550db 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -16,6 +16,7 @@ properties:
           - qcom,kaanapali-inline-crypto-engine
           - qcom,milos-inline-crypto-engine
           - qcom,qcs8300-inline-crypto-engine
+          - qcom,sa8255p-inline-crypto-engine
           - qcom,sa8775p-inline-crypto-engine
           - qcom,sc7180-inline-crypto-engine
           - qcom,sc7280-inline-crypto-engine
@@ -31,10 +32,26 @@ properties:
   clocks:
     maxItems: 1
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-  - clocks
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sa8255p-inline-crypto-engine
+    then:
+      required:
+        - power-domains
+    else:
+      required:
+        - clocks
 
 additionalProperties: false
 
@@ -48,4 +65,12 @@ examples:
       reg = <0x01d88000 0x8000>;
       clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
     };
+
+  - |
+    crypto@1d88000 {
+      compatible = "qcom,sa8255p-inline-crypto-engine",
+                   "qcom,inline-crypto-engine";
+      reg = <0x01d88000 0x8000>;
+      power-domains = <&scmi26_pd 0>;
+    };
 ...
-- 
2.34.1


