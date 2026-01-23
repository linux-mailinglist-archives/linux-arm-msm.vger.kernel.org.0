Return-Path: <linux-arm-msm+bounces-90348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QP5IFBhuc2mnvgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 13:48:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB5675F9A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 13:48:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6F97C3023D8B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 12:48:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCD17258CE5;
	Fri, 23 Jan 2026 12:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YPkU7lyy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ajdaBrl+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4E71FC7C5
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 12:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769172501; cv=none; b=LJtYZPzrop0lLmxAdmgosLXRVP+W8zxSQMGfUnuuZrkUdQKj2JZ1yx2Q/dH/sJfqbYvlR+P2ZnnjBCUBiwOLFd4cxCPrL9XSCcfAk0aaCIa2vPkPGRgZAGmd3AGUmYDbus6i8FaBvRd2MkXwrr9LW+XR72KdALZj0KYmAQMcwY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769172501; c=relaxed/simple;
	bh=TPS6X9I+JJ4ux3s8ub0w37/Il7hwYL37igRWramUsNM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gU78k7emAojDj6/pIVRJuUDTz3mPQdcDEmgZFS+UlUyZnkQ51AHZh/uDeUZ5/SsxhLeqd7Mu+hkbPVm9A3vOxMhFEskYSAigMDKp/nz9WCmR/UnmrJjCqOj+0Jd/yg3RGtpIr71ZNwgL1xappr+m/R+XMSzlAet4DY7QDkwIoQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YPkU7lyy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ajdaBrl+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N6rhpP1325867
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 12:48:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+I1sCtj+G7JfI9TPLgcj5K
	s6XVbBmyka9AQmGoyQyyE=; b=YPkU7lyyLlH0PTuKO8LD+8wk3m62cFHxhydYls
	T+NMpQ72VQsrZj9mQWoWiAZWYTftTitzPdN2Q35ej3O60eWr2e4xhUxTCZKfkdtZ
	1ZZl1zlWZyTAtInab9L1hCI42xKSMjc+9gOhZF5OsMqpRK0opcg/3oMznI/ZOs1f
	+4ke3uJioVtcTnn/ytiNuanF3ZksPZuLUPHuwr7yUwk3wohB3ygVocUSbbsq5QfA
	/XmAMivXWwR4igtptgM+m/lI3IPgL4EVwXOUOVVGrBE13cfE0f6ZM0MCEKF/j4ut
	KGo7GSmB3SK96GQX0dfuzvK48F94fgTMBBTh8Y1995TUmHMg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bv44c9b36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 12:48:19 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-bce224720d8so1316937a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 04:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769172499; x=1769777299; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+I1sCtj+G7JfI9TPLgcj5Ks6XVbBmyka9AQmGoyQyyE=;
        b=ajdaBrl+9dLIuhKLQrOjzvXtr+fHavVwL0xkEgO6KYUBZifEnH98ra4B99VXXWpS1N
         uvG/TXCiBzqOnFYNxcdF9ZGEixY4MvogANLKgoyWiXw9NcGPxiMPYQcHpHc78IhmTQTY
         279Aa+mr1eaoMlT4i0VPbTgyZJyaT/0AGNhjZ4BDF/UlIOq8ru+mKslnu9g5ctIx5HZi
         wT5g7eDuNYSSWD0MSgUanJwduvG0Z7kz0ijV3fY7VGhk5upzBl6M8koHqOI1j/SwaViG
         rqWb+vdhyaW7eCTDs0e3uPfubmFa7qFoJ6zoIk2i0JZH3DnYgl9OKvSAGv4Ixw2NswL4
         2Z7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769172499; x=1769777299;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+I1sCtj+G7JfI9TPLgcj5Ks6XVbBmyka9AQmGoyQyyE=;
        b=Joxq4lWuobRRQ9keb2XLyFcmo9OnScoo5WFK8BPGadFOO/rojXQHMM7hZtI7NQLe5g
         bGzQyOjIMW1dl+kd1K0Teo3vIsZoyIICvMQfDdJSM9Q5n70dhIpzOrqrQOnAy9YpMIKx
         Sqx0mX4cMjTWGaDaSxMeiMLaIWHXLx6k6LSszx1/woYw72dEHiK+H4wOQh+hoJArQgQC
         JZOAE1X82usxwU4V4AlJkSUFWCje6yI+M04sFKZjxmdm/p9DIU9pjtsVy8G3J1XChXDL
         SULrrvz21203IyaXHEp7hOIcVqq0SZnyM6si5uVtUNd0xrM9m94nhbsHbboYkGrbwTo5
         wAnA==
X-Gm-Message-State: AOJu0YxsQcTVdt6xerDXESElwGhmYw0qqDIP7+8w6f3BXGg3DKM2RUTm
	F7UZSLtrZ5a8DAQUocu1B54krl52hmdfOwI/JnGQrb/01pKtRVGHQOZrPIveP/YYBbpip8hIgOw
	X1+TD615TrnQBWTQmjw26yFWKPWX3SO/Pcwr/Wbq4ONcTfYCbldlvxrHLdetOnT7KXX0E
X-Gm-Gg: AZuq6aK5JN7jvnZQzEJyv7WEWcEEWHgkG73BXdLKTSUU1Lv4CQNzZ7MNnyJiSFdUclc
	V2BSWAz2xe8eubPrDtRGoG/kyJ8dhCe3d/M21YcyDizOVYgLHZda6DbmKBxAfH5KMmKfMkj8dQf
	ee9/gP5rllqzr7WYlfMU8NtgusG7R4IWbGNb8aVwNQo4dQZC0cUWdXMTDiBGUhgm52ZRfcKSGf1
	5KXili1uRbLNXFbkUceYxiA/8i5TSyFAizL680tPtyxYSUVNI50O+jWR9DTanclM5J9FyWKgNuH
	pzky10LOZib7buxJOQz35SCUKohyDPzQfZGdRjHxOiS0A9uMQa4HVrO39keLwJYvPc8/NW4XJ9D
	Rwyz/X/uIANEoqnfXR4erB0IA/0rCh3p73HclvSotteZuWFA=
X-Received: by 2002:a05:6a00:3318:b0:822:f928:fd97 with SMTP id d2e1a72fcca58-82317d28ea4mr2300809b3a.22.1769172499088;
        Fri, 23 Jan 2026 04:48:19 -0800 (PST)
X-Received: by 2002:a05:6a00:3318:b0:822:f928:fd97 with SMTP id d2e1a72fcca58-82317d28ea4mr2300785b3a.22.1769172498606;
        Fri, 23 Jan 2026 04:48:18 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82318645fdesm2191919b3a.6.2026.01.23.04.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 04:48:18 -0800 (PST)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 18:18:11 +0530
Subject: [PATCH] dt-bindings: crypto: ice: add operating-points-v2 property
 for QCOM ICE
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-add-operating-points-v2-property-for-qcom-ice-bindings-v1-1-2155f7aacc28@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAtuc2kC/x2Nyw7CIBBFf6WZtTdp8e2vNC4oDHUWAg6k0TT9d
 9HluTm5Z6XCKlzo1q2kvEiRFBsMu47cw8aZIb4xmd6c+sHsYb1Hyqy2SpyRk8RasBhk/a31g5A
 UL5eeEMeYJPrmFfCBzfl4vQQ7eWrnWTnI+x8e79v2BfsjaL2IAAAA
X-Change-ID: 20260123-add-operating-points-v2-property-for-qcom-ice-bindings-e4e27598fabd
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=TLdIilla c=1 sm=1 tr=0 ts=69736e13 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=nchbEs_9QIawOzQC_EQA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: oHbCZrgCTLWQgLQnKK0bnXkRhWYUj2FT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDEwNSBTYWx0ZWRfX9XLsSvrEeY0G
 ejWb4ejAo5eE+P/+W2Vxy7tYVqNHw2yIC5L9W1R+f21F/ksqzGxyvwCxhdgOMWookorKOo1xDxo
 7znBAx5NJu7V6sjBhx7WyHq2Myn1cU9/FkyG1FjKp+2gmxQ0n84uXCCUwFsRhyfguBTKcuhbOLr
 Z5+wy1e5WE/Np7eThPm2E5dA1YQwun0DQLdyDCBciCe85X8TqltqThDL2FJr7ATNIw+nesXJRqp
 l956mTKGCB/qt1T/NS6y8oqt4oLhL+DzWeB5eiMhrfXAqlvoi1+qcZIQAGQonhN/tA/26YQgytb
 7XaKVTtsIcMf37Fl/JkwgdeNsiuXXs9d9AcBUt7WbYK7HGqq3R5GoJJl10meI/BjUnp8p47OXxe
 s1m+7w+kQiiHWghihDTASXTnvruajGP8ap4biky2vXPAiKgRPD+d+K8l4kYGTnr8bvMYdtYIJLN
 JawdvnMb80JAEL5rG9w==
X-Proofpoint-ORIG-GUID: oHbCZrgCTLWQgLQnKK0bnXkRhWYUj2FT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601230105
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90348-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BAB5675F9A
X-Rspamd-Action: no action

Add support for specifying OPPs for the Qualcomm Inline Crypto Engine
by allowing the use of the standard "operating-points-v2" property in
the ICE device node. OPP-tabel is kept as an optional property.

Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 .../bindings/crypto/qcom,inline-crypto-engine.yaml | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index c3408dcf5d2057270a732fe0e6744f4aa6496e06..0e7844e64555ed8b4350f0e18bdd20fb64f2ac6b 100644
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
@@ -46,5 +54,21 @@ examples:
                    "qcom,inline-crypto-engine";
       reg = <0x01d88000 0x8000>;
       clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+
+      operating-points-v2 = <&ice_opp_table>;
+
+      ice_opp_table: opp-table {
+        compatible = "operating-points-v2";
+
+        opp-201600000 {
+          opp-hz = /bits/ 64 <201600000>;
+          required-opps = <&rpmhpd_opp_svs_l1>;
+        };
+
+        opp-403200000 {
+          opp-hz = /bits/ 64 <403200000>;
+          required-opps = <&rpmhpd_opp_nom>;
+        };
+      };
     };
 ...

---
base-commit: 46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
change-id: 20260123-add-operating-points-v2-property-for-qcom-ice-bindings-e4e27598fabd

Best regards,
-- 
Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>


