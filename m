Return-Path: <linux-arm-msm+bounces-93356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFT5CY3almlJpgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 10:40:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C507515D6ED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 10:40:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2DD1E304D253
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 09:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFC5032571A;
	Thu, 19 Feb 2026 09:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QsXELX0m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eRzh7SMV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3814320CAD
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 09:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771493968; cv=none; b=SXUjVpvaycybNKt3JrJDkKzMWOLrF0r4MQqHvH2bBmAmI4tc48xt7cxfwR/Mq98QvtprfAgvj1XcTnByNBZGk20UEuZWczSTXzYHIwJNPJYtsCs0e1+qB2dCKj74+R2BJqLgV2RdXUvjldGAKJ15Qll3vu9etioGnyv7jL1x6PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771493968; c=relaxed/simple;
	bh=97/JSwHInanQ5uVj6uZW+Gqa6diRHttxVXWOH4oEHHg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U/8Qvbut//Zhb2bK/MQpEBnOELz64pkktN8dkMMXGht/7XloG8ltrzOzp5DT1cZW7bkDSclOJHkt/1XwXNYFUW9NjbiAN0OgQbDNVztYkxXIMBRvJeF0nV+QgwinbIElEDo6pdcRCdVQKcg5p9vsqsFteQiw2p/4jPOkNKjPuh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QsXELX0m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eRzh7SMV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61J2anoE421595
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 09:39:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pdBiIXF+CtpgVdQJL037m1Y+o4vwFkI9Pmjc70ltDag=; b=QsXELX0mB3MJFlLJ
	tcyvEOHo7LPnnaEFmcv19l6WshoD5R7ICfwHP3JQuZZF9y2tUGjj0dyXbKx8c30F
	dvzr6QjNHCjyQlPvlF4J2GefuV/907F2Fq5UnHTr8sVKQ/C3809n/4dw36ZjQbWv
	2rI16SvKcX18zAISTHrdPQ3EPJLMI9vFQxmdDLd/kiqkczF7HKznoeC3d/KCBcO1
	84/aKWp+KQQAjM346DkVo0m1VHuq2qEc7eyP9rmFel85f4zBMZxdESXmFRru3G/F
	s+E4Xnj9LmA96XqebxDAcjKVYrn7YoZzkn18QuXTMCA56cCkQA9eIK2vIILdkIvD
	4AGKVw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cd76e3y9s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 09:39:27 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-824ae2cac9dso377115b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 01:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771493966; x=1772098766; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pdBiIXF+CtpgVdQJL037m1Y+o4vwFkI9Pmjc70ltDag=;
        b=eRzh7SMVf6QP2uCq5uxoXDvoOgnGcDDrpnRGoNvAkMufM5nZ8JMtrcdVDgD78TmoOT
         f5yy+BUiNCSfIq2/HWnaT2gkV23Cv7fUid3TkmZ0YLya+KaMbGvt1fm0RkTrIFJ2sJoH
         iJNC2bIwgmSH3KEj8ENXF95KtoLII+Gt2+S6PUIzBxm0tpMGx1zDACAvemhYZVCOSmeK
         mWcH60ysRxqYKi9q634Ty7U5gL97zKK0jrQy6iYklsxQp+LjfGTUUCRyNgF16RmECWR6
         SRGKODUgIQLGdUCH3VGIsDdrkE3hSSbMBZXoPapzwp09CLdzAYuyhO9L9rorEYbku1rP
         2BVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771493966; x=1772098766;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pdBiIXF+CtpgVdQJL037m1Y+o4vwFkI9Pmjc70ltDag=;
        b=IsmmaTdUZIE4w69IknDnDSxxLY1Ze56QPMGg3B18+zBXEE7i9S2if0UGwHQx6bEYtv
         sE9lZXfTHSF82VujVAUGloo55UyJKcnJTbpgoFafHeaIz3+Clcfz+EHLg3fVUeV5LX31
         t3/BfcSgn51iFzyiz2NAXRAqlCg11lLQzJC9pbJ5j1IqZYGV8QCQL4UXADIamSw0L2o9
         6h2trykID3aEcNX477mb4ccpNRUyxBP/kTSwpuz5haTDH18CP5wGY4/Xzz46BMwmTE7t
         D+eyDJHZpoOjQkTUZ7oWVhgZe90H1U1+8PiDe/iCn9VCjaTMFLOxcW7hPNKWisBA0QzV
         sTSg==
X-Gm-Message-State: AOJu0YzObEUwG9qpAXk4DVFUZylt6A5LisDddnVYi0KP86SZK+8MivJl
	9ZVQuaqegsDuFD9q2ZZN2N3qxodS/csV64Fkx4DOXsCLsUuNV3YgwzFaHWw/HHPn8nS996BTogp
	0X54sauKsXPe/iZ45q4pZXwW5sfdflnmWTFEYWGUsfap6CDVIQms/Chcmsf8Fp+19GUqO
X-Gm-Gg: AZuq6aIoZZwxFEx4GqrTzYCk0s7EPMzFCe4nvE8xOvZFM5RE1NXzbyDWQydrDUPcflY
	3FVzcjKWMWKaoZ79mqUAOlX5q2NbD16Vsax1xNtIUgxYOTchxoHZVS7AFBVYmbtBsaOVJeytr1q
	HxoE4oSYpAKrLmSX90zFk1SMtGNdSjHpnSbjmMADiaK3fpjSkY+NsWUXEjYm+IVRC8m8Mr1PH20
	hcnrQ+ZbqqYTHm/ABKxjCDT0Of7Sr3R8Erb4uznbxGxMFnDg60r1pAVB5ovy4rU37SdJSggmht3
	G8da158AaSyADjDbYMpJ5oeOerTWpUcpY8H41Af18XgK0lKA5NfBX8QLZ2xvweXUu+d4F3IO/WS
	hwQgwU3ytTDkc6Ryln2J2+RiMSSJLZ+iR2RuOgGCb7QzXUjv9jD/mxI/jYKU=
X-Received: by 2002:a05:6a00:aa84:b0:822:6830:5900 with SMTP id d2e1a72fcca58-825274893ecmr4662541b3a.6.1771493966331;
        Thu, 19 Feb 2026 01:39:26 -0800 (PST)
X-Received: by 2002:a05:6a00:aa84:b0:822:6830:5900 with SMTP id d2e1a72fcca58-825274893ecmr4662513b3a.6.1771493965853;
        Thu, 19 Feb 2026 01:39:25 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6a2ac83sm17710250b3a.12.2026.02.19.01.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 01:39:25 -0800 (PST)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 15:09:13 +0530
Subject: [PATCH v6 1/4] dt-bindings: crypto: ice: add operating-points-v2
 property for QCOM ICE
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-enable-ufs-ice-clock-scaling-v6-1-0c5245117d45@oss.qualcomm.com>
References: <20260219-enable-ufs-ice-clock-scaling-v6-0-0c5245117d45@oss.qualcomm.com>
In-Reply-To: <20260219-enable-ufs-ice-clock-scaling-v6-0-0c5245117d45@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=OKsqHCaB c=1 sm=1 tr=0 ts=6996da4f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QeJYPjCb9QSwVUWzf6EA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDA4NyBTYWx0ZWRfXwGLH8/vlvVCE
 VZxNFF2lsZwJBUVgjd67quz9F3xNCtIdPjHk7iGU/UkOZe6N93rpVKnoVOymZJYi2pkKO+o+SPA
 6TUKSo7ZVr0Z8nFgG0Cm4QfKd3If9Jo59iM/iO/a39y6f9visPn2Kgd4V46EK7Jkw4D5ijA1bQ4
 X6cDBLVh8X3XAwLQajaVRbLwN5llk9OLldrXoYKGvrEJ8QsDxxSG8okt0N8BxMl+sCDgQ08ERoF
 EE+4Q8f4mk/wlW86sCumzMGSMaG6glVHB3bTwFBPq6pzZJfSnQTMk0AEodTGId2Wrgwob4ScEIO
 shj5bVkB4NHaG6YGXVSXv4sTanYeYZDahklQlbivbnSw1mZb25yW6uagK0nv9uVngHQkzyLAjHL
 vuFBoqV8AvjQZ45hoCM/9aWjCiYXoxBJIp+Vgs6wdDZ6EiYrNxWeBOsKmp5krtztM0LUcp9tZ/Q
 JTFMNm/8yEWhu5TtE7A==
X-Proofpoint-GUID: _J2iQ8t878h5kuClI-mRmfQ2kEbpCapE
X-Proofpoint-ORIG-GUID: _J2iQ8t878h5kuClI-mRmfQ2kEbpCapE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190087
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93356-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C507515D6ED
X-Rspamd-Action: no action

Add support for specifying OPPs for the Qualcomm Inline Crypto Engine
by allowing the use of the standard "operating-points-v2" property in
the ICE device node.

ICE clock management was handled by the storage drivers in legacy
bindings, so the ICE driver itself had no mechanism for clock scaling.
With the introduction of the new standalone ICE device node, clock
control must now be performed directly by the ICE driver. Enabling
operating-points-v2 allows the driver to describe and manage the
frequency and voltage requirements for proper DVFS operation.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 .../bindings/crypto/qcom,inline-crypto-engine.yaml | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index c3408dcf5d2057270a732fe0e6744f4aa6496e06..50bcf3309b9fa0a3f727f010301670e5de58366f 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -30,6 +30,11 @@ properties:
   clocks:
     maxItems: 1
 
+  operating-points-v2: true
+
+  opp-table:
+    type: object
+
 required:
   - compatible
   - reg
@@ -46,5 +51,26 @@ examples:
                    "qcom,inline-crypto-engine";
       reg = <0x01d88000 0x8000>;
       clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+
+      operating-points-v2 = <&ice_opp_table>;
+
+      ice_opp_table: opp-table {
+        compatible = "operating-points-v2";
+
+        opp-100000000 {
+          opp-hz = /bits/ 64 <100000000>;
+          required-opps = <&rpmhpd_opp_low_svs>;
+        };
+
+        opp-201500000 {
+          opp-hz = /bits/ 64 <201500000>;
+          required-opps = <&rpmhpd_opp_svs_l1>;
+        };
+
+        opp-403000000 {
+          opp-hz = /bits/ 64 <403000000>;
+          required-opps = <&rpmhpd_opp_nom>;
+        };
+      };
     };
 ...

-- 
2.34.1


