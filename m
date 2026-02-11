Return-Path: <linux-arm-msm+bounces-92589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLvRHJJQjGmukgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 10:49:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4E4122EFE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 10:49:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 70D75301BBB2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 09:48:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41979366DCA;
	Wed, 11 Feb 2026 09:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bs56DhjY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FRKuPkRT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7008E366DB5
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 09:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770803287; cv=none; b=B0kA10zb5Wa3OZuYFjctg/NdsK5rFSnfMC3Iy+X1ktyrq3l8RtvrWZT2E65hJx6QIaKev0ZJxSpetPjOIo1xiD6mWlumxDMFRAmTUq1LhoyNx3CZmfAxOZ8x4y4CT+3ngmf/E+Z2btdvDURdoxoe+dN/0fc615NpyMQT289lhx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770803287; c=relaxed/simple;
	bh=A9DBiNP8iL9dR4Wka9rYBtFBrkJpTxjiScTy9/hyWFo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ikqFziFzYzefPRrw5Vzy3WSRrrE2OXEAwjzwJamTNPQtUyoOMjH+tyXnWyAB8zE0M8C2wsBDBe8/cvn5EAK8ixFFISJGNW8DGYMI+t5QvhvvnpiPBhpJFyaaYzSyPmnYiYgK+9Vhcjwyx85Jv7XmvC+oJwDjPlVT17MJPIW8BpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bs56DhjY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FRKuPkRT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61B3ihJj3204751
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 09:48:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bJF5kOcx+0z0jZVRbBhfjrP6SosQxJ8NlSFELd8k49c=; b=Bs56DhjYDyPDgFsE
	MeU5w/OlDVv3A0fJtiOs9sOZhI2FbRs2YC2nRw7E68N4lDcgfb5+N3SIW+GNCy0g
	uVRYfdrzYStnojBfqwcGGCAxZrDiGGYYaTVvATif1qkpxzkjFFLrqx7uTWheJRcG
	SIig9OyYPI+qdE/1pLJLKvpm05ufIs7lbJMWtQGgUPEQWhLA5ta/9czZKtGDRuIg
	tZDKudRt0y/d6SGsAtn9nv3VcwCnaoulklDIum371hO1TKgtsvm1ZTZBnof/DbW7
	1kOYjdrBM/PF5QdF5gZmcDJfE5mJ0+auqqxE9Txl2Yb69RKGnqVdT+F0JtN6pC0t
	z22FhQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c894g2rms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 09:48:04 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-353c9d644b0so3699507a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 01:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770803283; x=1771408083; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bJF5kOcx+0z0jZVRbBhfjrP6SosQxJ8NlSFELd8k49c=;
        b=FRKuPkRTFdkhOSShs0E4qHZe/kTtDNuEcgN3hFAfKFd4gmu+qNCiEkuW/ktnowdQLY
         QfFYULSWY6im8k0CC8Gb2Kn1gCAzN5t9fHZnLxiXeY0r5PWfBdGoh64nfG5FhgQLDzrf
         4nRUprA0VnsLbWeMPmrCk2EmdCeP5Eep5qGYdhug+tXBDJ6Dbc4mHxx9xdKXMnoptBkl
         SJJjdlA4PMg+y6/lEAIH2ySmqz8DeNTA8BcWoCkVOa86pyZPikxcUbmE8FzsWvIWCwjg
         f0raOc9At3pMb7S93hqhpQAjjfqzxsOObyyynMtNo0Js2gliZpNdTlODDKsFR7Kxj7TG
         8wdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770803283; x=1771408083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bJF5kOcx+0z0jZVRbBhfjrP6SosQxJ8NlSFELd8k49c=;
        b=CMk+tLpaYJsLJz67Et9nA6iI9UWef9hhN3JIgt/3z0o0htTenv3A4hDp9afpFGNDiR
         cQXrHH9hH+FigXahLdB7MYKCm9nGffdEVw7ceETCnkYMtOGwUA8hDaYcWUhwvnYvuHjo
         qyH+3K1mU+WRX4+oXodLxXC5awpVe7sTgu8j7Z8Ks6e7Iej35qab1VS8a4b24PY9vXBS
         3SyJodD/kwfRRInyEHYDDyDpXU56p1rWDQOohffQK0Jh5wmf1VLJN0l9Ui5faqPYQupV
         6qoYijbqq+Wv3xZtc3HAm3SLFEp19hpZ9bmYf9hE8jp7i0Ny9YZweYlIzwT6jP4KQuS/
         4qEA==
X-Gm-Message-State: AOJu0YwI9kBBPaar1gqIvt6nfFz4oVpM6aNw6JKmf3KjuVlD39TJijBR
	c3kyoFv7QwXHQtqlKGVeDa68K114V63Av6+a9hKoEdr1f1kOJpcyu7Oe2o26xerpCxeYGY1gQKZ
	IpPLPxi5Io0rjYm7buAp95hfmqNYGazJevDd9g2jafJzwOEL19dHjTQSRIlEYBEiS5GMK
X-Gm-Gg: AZuq6aK3vABGqnmpbckWOWlw7WmSalTyWD4KkVjn5CbEx65dcW/te1wtqPKzmqitiXW
	s9o2qHFVxCLZnTaQHV+9/m7nI0CcCcI/pJkdnGbp2Z3D+4E2qQlDSmzubLM+cAya4hJaW6Q7uoC
	WRx7vxfIQVgt+1oYSe78zwZ7iiglhGOfyagokcBm0EvI+nkv/qDj+rlR1urNAfK5ierePV9/sV8
	F8u2lcwGV4tOW2mlp55NsUtHrN2ndAE7kMFtYK/jZU4DQhn6o0Mmn4duQWpOLxaDPzGOz/WloVZ
	wB9KQffbqNrsAu6M0bBc57E2JNK+9fC3na6zZfP3bWeL/hjxkhkLlJeafxH3CT081fH7XEgty/u
	m0oNtFARBwuH/Zb4MZ6d9dZZZfTDMX95L9IprYuICM1B71sVDxI70M9pQVTo=
X-Received: by 2002:a17:90b:5285:b0:354:ad98:7d1c with SMTP id 98e67ed59e1d1-3567afe23abmr1943057a91.11.1770803283393;
        Wed, 11 Feb 2026 01:48:03 -0800 (PST)
X-Received: by 2002:a17:90b:5285:b0:354:ad98:7d1c with SMTP id 98e67ed59e1d1-3567afe23abmr1943039a91.11.1770803282848;
        Wed, 11 Feb 2026 01:48:02 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35662f6b84dsm7526640a91.10.2026.02.11.01.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 01:48:02 -0800 (PST)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Wed, 11 Feb 2026 15:17:44 +0530
Subject: [PATCH v5 1/4] dt-bindings: crypto: ice: add operating-points-v2
 property for QCOM ICE
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260211-enable-ufs-ice-clock-scaling-v5-1-221c520a1f2e@oss.qualcomm.com>
References: <20260211-enable-ufs-ice-clock-scaling-v5-0-221c520a1f2e@oss.qualcomm.com>
In-Reply-To: <20260211-enable-ufs-ice-clock-scaling-v5-0-221c520a1f2e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDA3OSBTYWx0ZWRfXz2/GOikgtV0i
 91JglMFge5sUiEABXsIaqztsnmqpl0WDRPkkT7Iqo2Y6LuTjWHhAn1aoC1CiArRHbgQ92kDvV2y
 ggjl+VNbzWTRhdCKWXdUsAXKjJS3eFCHZ9smcSdokOrUaNeF8YfsNb989I3DB6DG7azYE0OkHAH
 ksmod3Hyi4qUUhY4Gz4GqZP20vGrjvzygg2YfrhO+JVgFCqbsWLOAJJLrrpRHeM01UApX+4RE4r
 xnNHDUsobjaz6YkUMBZQgjHMpoHGLjEip/Wig+6TMR5zI8hEunGr40QQRcct0OjPXyWjsLZhTL0
 3WrTP7T9TfBgLlL32wmq5u3wuMLng3arhI3tAmyOHZBJ73YLQ0q/LPF/PyqbC3n0GJZD988RGRL
 4XyOEaaUnHavbHztpCubhipiNkZguNtrQ18YLJArJL80qvvmnvWwL1D4rsIEL380SE4Z5kad3d8
 HngQ2sTD4Ka8yoKlo2g==
X-Authority-Analysis: v=2.4 cv=R64O2NRX c=1 sm=1 tr=0 ts=698c5054 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=QeJYPjCb9QSwVUWzf6EA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: VLd9Mui1YONcM8PqWMaPU1JNpDTQ3TcG
X-Proofpoint-ORIG-GUID: VLd9Mui1YONcM8PqWMaPU1JNpDTQ3TcG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110079
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92589-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DB4E4122EFE
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


