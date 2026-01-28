Return-Path: <linux-arm-msm+bounces-90921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFE1LVfNeWnEzgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 09:48:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E8F9E615
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 09:48:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 087D3304EE96
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 08:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69A0133A9F8;
	Wed, 28 Jan 2026 08:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cNxQ5JfG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AdEu4vU8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80FB337BAA
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 08:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769590017; cv=none; b=nHPhCGPHZewQzzVD2w358CVPYt5z4fOydnEfcINxwxb2cTYhjFIA5blsbImBoo3/hCAtXICXHbbaFqFhclC8A7Rg0iz+QPv/ZUIthobJlI+HZ556v+NK3CfJx8CzL+Xyc7SfdAy8eR88b53FGPGjctGcTNa6w+bBWgyHOMFxYbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769590017; c=relaxed/simple;
	bh=fmj74JXS7b3/5JPwnhbm6Z+ccfNWzkm0zWwsIkb9dMc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JCj427pY7WT0D5rMtqfvmTFaLmwfjldZrIeGlvH5l5p0VhMRnyiINF+RsAd57Y8IP0FWnviqy/dzHVy0L8Ew6dY//7u22jsmXnZ+FUpUNYjj9GJ5IQBg5BBEtie4X569muHIg8AGaugpB85y5qjtLwkBX8+TMt8BozHGTqFjds4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cNxQ5JfG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AdEu4vU8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S7hPjD3713403
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 08:46:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yfXxaOd9plb61s8TF4WmKmUfjZnHFbvBpCT+9AAgBMQ=; b=cNxQ5JfGTdFsguwq
	a+yQ6WlBN7RzFzTRD0tCyWzIPX4XOzNr2G9Y4oAvQpogqQ89P/TdJSu97PQ1P8zA
	ZLg3qx6lgKzK50lCuRKoHVnfLgENZbBSlUEzExeR7CX3VZd0Lm7hoXs9PFNvOwbG
	f+IgP9yqMZadQAXgsk0e5vvrZLLwAU1qirkRF+QpZPI6p8MM1SKf57Yvpb6pY48+
	0SPNhno2fW0eIGnrRbjCVcwPFbj7WMUOOrSkizVgIPYdCYrAjk4dAMlDC/wismbs
	aih70PHfzdVQnhGGbUVlkRyZyvOo8LD2xXuv4Cg1LR/MfT65+eDTa4SJMqvPGyoE
	uIpBLA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by6qbhp52-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 08:46:54 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a7a98ba326so11148835ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 00:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769590013; x=1770194813; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yfXxaOd9plb61s8TF4WmKmUfjZnHFbvBpCT+9AAgBMQ=;
        b=AdEu4vU83H6CuuMdwpaVK4nj0g/nkmOA3bDrmNJTOJAJlNZjB5eulSFTbiIjhBdBsV
         IsKGRiJHx+nbZP3dXgUPtbMNK76Jea08gpXIHvTpUlwx9Oo6F9wwQgpR3xHr57HaElOh
         KJ0M5p2e31PWKlH9zTRJlKU1pLZgMLwgNnsvSvRLwbfjoqM7QSi6w/3OxGiYpCahd3pS
         CRD6LiiRJDFKpF5h8AtqAhGJMFOrZqRaj6uANy8zvMKLxasISVFrh6T4XCkHx+FwJ5nb
         NKbe8WIaGYJvWbhNH2ccaR/NHBui/DQ+qk1YmWnL7GS3kV9fJU8y6p5L6GiuOHbcKMu7
         MInQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769590013; x=1770194813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yfXxaOd9plb61s8TF4WmKmUfjZnHFbvBpCT+9AAgBMQ=;
        b=e2qgMvl7lVpXTkgK6F5subVxym3VkE0CCWno4D4cTOWlPPmMqOfKVZp+c+KMKSOldQ
         gBS75BMSMFADhQ2lReTQjQD1pHNrrGEANRbYeFSbcJHIqo37j1ATTe2SvEz1lZj00MPV
         4VdqyrSTuoFxcpEXEVhOpEHlT2xsaAjEbLwujY4XpuB081kP+e21iKo4o/oPxmamBh+m
         1znf6ZTbS2V+0cKZfyK4UYrekgW+eHfeLPlboOg1IRDhtUdA9LjgF/kpvJlwamED2aEG
         AUd9ne4lz1ZGhxnojWshFlsqgu/2X/8dNPZZ2ZTS9yopK2RQhdKwCzGSsACEJMzGpZmC
         QIMg==
X-Gm-Message-State: AOJu0YwcAWWfkigEE0P92b2QnRP5GjHhVhfosTi+f04Sbu8LbuT4dTnD
	eHkmGdgUEg5/tyxKkN7uF3rHKXEh9WdfaOIqHBxqhyEafZqwfGyOqOEokvolxTqHnM+KBbLEnvU
	ufALcZvXQU8N4QeZBChtVkfCK9xW7ROic9iV/YNXUcpfY25VJRALWBNTpQQaU5q5A5yC2
X-Gm-Gg: AZuq6aI9oHhKBF7PWWAaqViJMNS9FqjLT9u7h71glMFIxNlipSK6nNdkDZsVSasl+OA
	VnBjRSmBTtHSxEOSXa8kGlVMoEpn2frVDNsANH2dQ9xQVklr2EWY/KKuuOf6pbSn8Jc05GmhO4K
	ziXQObd2tvBedyAt/Q+1RJKrXC07bGHmC03Cd1QXUX7F3tWv0/OsCnqt+Trcqx+ow8t/9d9ojoB
	xAbY+rRDQPMRV3FbUn9yASM0WEh1td9rObbRENN3wZRBvtDr7x323649JgwSTR0YzCmp+nSMCMA
	xsgjb1/2ij6CoGNi2/NEi2eieE4FnBUd/iO1QpTMueb+ru7aan0QoX5FjzNtfrmh0ir1yaFi/at
	lzBxhFzoEGA0FTt+faBVevZi+jQFGDl5SsDlnPeSl68fizow=
X-Received: by 2002:a17:902:e881:b0:2a7:8486:ef13 with SMTP id d9443c01a7336-2a87134ea8fmr48957245ad.29.1769590013382;
        Wed, 28 Jan 2026 00:46:53 -0800 (PST)
X-Received: by 2002:a17:902:e881:b0:2a7:8486:ef13 with SMTP id d9443c01a7336-2a87134ea8fmr48956775ad.29.1769590012783;
        Wed, 28 Jan 2026 00:46:52 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c3b1esm16263075ad.63.2026.01.28.00.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 00:46:52 -0800 (PST)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 14:16:40 +0530
Subject: [PATCH v4 1/4] dt-bindings: crypto: ice: add operating-points-v2
 property for QCOM ICE
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-enable-ufs-ice-clock-scaling-v4-1-260141e8fce6@oss.qualcomm.com>
References: <20260128-enable-ufs-ice-clock-scaling-v4-0-260141e8fce6@oss.qualcomm.com>
In-Reply-To: <20260128-enable-ufs-ice-clock-scaling-v4-0-260141e8fce6@oss.qualcomm.com>
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
X-Proofpoint-GUID: BcpYhISRA6z7E5UXAS26jXx-SGoPbkhq
X-Authority-Analysis: v=2.4 cv=Z4Dh3XRA c=1 sm=1 tr=0 ts=6979ccfe cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=nchbEs_9QIawOzQC_EQA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: BcpYhISRA6z7E5UXAS26jXx-SGoPbkhq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA3MCBTYWx0ZWRfX3AB9TYs6Uwx6
 hGiJwHJUMAgRNXaTJ41v4jtWTHkCV8Y3hmhdB9KK/Z5OIzy3/SPQHaXCKuPoBzmRiy8izzbn5RV
 hJxp1jpKDvYXuRvOUnwbq2Tq5G3E2rgpnPZ5Eo+sD9HFZEcWMI3vmEJMgyt/H3xaAhCi3c5iZ8i
 2IlxrcLluxJzIHbNbI5iqOCzIdH/7A8Vd5hV/9fSfa9tBQnkn8SXo39Vy2wIv0HqCdJc2TNsLLt
 fdDQyV2nMivp0GclazN86fia3uLgkPrzjK/+b+RYetncFD8FVzH5zWqi5zMcm3LEoPCf6dzFUg4
 yi8O8oxtHA8SuVrO4C0ZQ4uXlF+vurpdLQKUqBNWqXuyi+44Y4Zj2/Oqv9qYmKbjXmw0ge+eybY
 EQQgKJkw4Z2I8MR24nYLB+OVS5YYHgMU52QH/X//V7J51AvHVZOurq5vA+nhuV8cOZrxbe/zDiE
 ROJSykPXMX0UURLnNDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_01,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280070
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-90921-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 77E8F9E615
X-Rspamd-Action: no action

Add support for specifying OPPs for the Qualcomm Inline Crypto Engine
by allowing the use of the standard "operating-points-v2" property in
the ICE device node. OPP-tabel is kept as an optional property.

Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 .../bindings/crypto/qcom,inline-crypto-engine.yaml | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index c3408dcf5d2057270a732fe0e6744f4aa6496e06..1e849def1e0078feb45874a436411188d26cf37f 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -30,6 +30,14 @@ properties:
   clocks:
     maxItems: 1
 
+  operating-points-v2:
+    description:
+      Each OPP entry contains the frequency configuration for the ICE device
+      clock(s).
+
+  opp-table:
+    type: object
+
 required:
   - compatible
   - reg
@@ -46,5 +54,26 @@ examples:
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


