Return-Path: <linux-arm-msm+bounces-103391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMTEFqHP4GkkmQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 14:01:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AE640DC1F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 14:01:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 608473025A95
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 12:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 444F734D3BE;
	Thu, 16 Apr 2026 12:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XI3jzBu2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RmhbYUmV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA283B0AE1
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 11:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776340801; cv=none; b=bN2ogbo1cIfK/pd1q4K1QJ0pLG0XRV0BIB1zSEppX29AeHG7dF2a0gH8smmEnQ5/ONfQ97uuMX38+R7Fld+u4rEDk7aPGx58r83XtZssCgwFZVjsuzKOblbmoDbHCSEkpui/boj8n5V+UNdXCJf1b3uWzn12ZEZ6ouEsqYt2GYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776340801; c=relaxed/simple;
	bh=QhcT7I7/aMxwjiRWv+lMSZ9O1nf1QgKhkc5pxVQ9Aic=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HsTwtqaieoIluqtegEzuerrBHXEX/QOi7dlQzE7DvcoPk1/cvcDle1xAobjfboC/D39F4WIkZPGoPaTTXn1wpg915QRkr4flty1NJJdT82VQRtLIUndn4ih7uZ8zFlYUrnKuAgV51vJua+UUNw/Y4YDLPGxiy4pGTcPcGcfCmiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XI3jzBu2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RmhbYUmV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G8xhkE4124954
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 11:59:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EHpvbENcsLtgvr2XEbf0CXHSig5EkRvJvVRMbKysza0=; b=XI3jzBu2q+89hWn2
	du21tHY8EWhr4GTFPD/rSiV/f8y8pMwMQDvpcX/R+HZ1QYoCLWsWU1x2HCT4Xc78
	VHrlUwTcQZflGeHOZ7vhkYASfig29q1DM7j4OyPaOGoanQLgCMYEpmcEeJhpeO3t
	9Zr1t6GxHrfwDNhLDTpokQh48qRUCEvJYNe5a/PCvLInoK+kEIzKoInHwbm30bwj
	VtAZV4lFyl7MjTOMeZTOGrI6XfLVkIyyZSLsXIm6Fum6C6PfmDN5XhRESHu1SGYp
	P3UwbLD5MiU6OArmTVlRJWYUW5FhF59lx+KqaSfCSAN8Lcc8M/J3S9GEE2AWkZJe
	Gqy2Mg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djvrf8k2m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 11:59:55 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f71437218so810501b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 04:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776340794; x=1776945594; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EHpvbENcsLtgvr2XEbf0CXHSig5EkRvJvVRMbKysza0=;
        b=RmhbYUmVhp0pXEIGaDsTDdHFGrq9ngMno/pr5NYB01kuVgGW0Ka4NLdW59TiRW3JrA
         JUs9tw8e+VH3zQEq5BRE8W1iLO1pMRCDMLTSU28Un1OafpQcgsbvEoXF0X5YVOiX3U5g
         p2v1kuIgTE03HQeeNRTSpiWCwYA4xfOQW30gyicus5EYjmQWoCXpBkZg6dDZiUYpmb8g
         7KJ0UWKcPz2WDn7k74V6jH2hpS7qpamqtlGKFOe1YkqrFJ7YL+xOXI3sbfMs5W7Ngl+D
         0635VUwfvGwtaXp5fC2ukS45sT5ygGREu2jRkz5fmjqQ6puefci9Sd0nSMzD1qRJi51W
         tD+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776340794; x=1776945594;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EHpvbENcsLtgvr2XEbf0CXHSig5EkRvJvVRMbKysza0=;
        b=XXqiVpCCqFcCMjjVgEvmN6gVGgKcgB8VH7dQd0VVpZL/zyftrA3oWODEPIxj0XLruE
         GW9dX3B4pIfg3E+XgZwpSPhq87xUNMj+Y9+cTimEEK14Qm+a9sS3UYrjJ2Ud1r99e1wI
         bq475iSlBGgIwXTNLFKH6eUCqjg49c22t+wZ0zHDRzktga/dWLYBpl83DhtEqvSTx5cf
         giNqACVBc3rTNLgnqYyFAFmQR8k2yTk6lSfT6hC61BwBCUuqTGQ6VqbJFjwN4som3Wsk
         E5moKCEWEtA7iHN/Kroua6Cy/bDEgeRKH/Z5NyMG/qn3yvotb6p+MrsmsSTiMRMkSJym
         QopQ==
X-Forwarded-Encrypted: i=1; AFNElJ/JlcDkE1/mdMukRKU7PxItxEugI9rPZT59/f+wMIKDd6BLQeHRFO4GaVV0u5qaVf5QpAWkeCy9QX1wkoWi@vger.kernel.org
X-Gm-Message-State: AOJu0YwdSSh5/lbmo/qitnZnUZasbSQFmfN88zhAfhVjQmEDyHe7oqfZ
	MqVBd0FxpB/1jl6+RHF33+QTXw+XUw0fJFCI9Huq5hfhzIvcr9CsbiTlKFxPbC9GZ4y+fyYkNnP
	LBnegafgqv+oWqTyxHhjYScVZ/1PCTb5G7P6cdKtQ+61zY3llQYp3nvP4fM9qYLJgWr1q
X-Gm-Gg: AeBDies+wMFypuQLxNcHcqIiB7UppVuhZYEl9MQsMRmiiufG9dZNm937UGNP2H2QLML
	ppU3MHktru1h48dzvN0d0orbbg0kJtzEpH0sWb42oo4TOI7ivwJr9kouGySxu2PQnuhs8jo74F+
	cGSF2TwwkYpQ1gdrRL5/OaBEPjVI0W4UwSbP+pVuwmxUnLVNdwZA4L9k7D6PetW3X88RAL5jf1X
	Ct+XJuTYLcBj7SZ9ufZOgcW7dQQAxBNa7WHtRqtkaha1XgPovHE5yatInyzxmXyqGsPXfigN02y
	ado8V6Z2GGtu5P+Iy42Cn6uI8H2MYdMeIkuB73lEJDleloMUha2UGCv8Qn1gRAgz6elvjjSHtd5
	6kavtU2xHnANU1ORhY7wC23//J2aBWa43E19qHHH+9I9Tjew97DWnmHpARw==
X-Received: by 2002:a05:6a00:4601:b0:82c:212a:8023 with SMTP id d2e1a72fcca58-82f0c12fe20mr25366154b3a.11.1776340794520;
        Thu, 16 Apr 2026 04:59:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:4601:b0:82c:212a:8023 with SMTP id d2e1a72fcca58-82f0c12fe20mr25366111b3a.11.1776340793904;
        Thu, 16 Apr 2026 04:59:53 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f673e0f15sm6335937b3a.35.2026.04.16.04.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 04:59:53 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 17:29:18 +0530
Subject: [PATCH v5 01/13] dt-bindings: crypto: qcom,ice: Fix missing
 power-domain and iface clk
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-qcom_ice_power_and_clk_vote-v5-1-5ccf5d7e2846@oss.qualcomm.com>
References: <20260416-qcom_ice_power_and_clk_vote-v5-0-5ccf5d7e2846@oss.qualcomm.com>
In-Reply-To: <20260416-qcom_ice_power_and_clk_vote-v5-0-5ccf5d7e2846@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Eric Biggers <ebiggers@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776340775; l=2738;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=QhcT7I7/aMxwjiRWv+lMSZ9O1nf1QgKhkc5pxVQ9Aic=;
 b=8WzfBJpvJinzib77N/gNAbcdq+bEhlbv3p4u0qPurYA2X0X4j/xA+ShU0KRMJ3dQbjWIb2Of6
 872NP3H6/gZBorI42sR5SNkpiXqtnQtO5K9jW+tWcUVv5XQK/waTlSr
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-GUID: rKnIpcwngkIgWVxEZpA-wRcA7nUQ8sZs
X-Proofpoint-ORIG-GUID: rKnIpcwngkIgWVxEZpA-wRcA7nUQ8sZs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDExMyBTYWx0ZWRfX15mYOoe0UXOZ
 ok/hpa5tdqWiZHE7HxY0RBErv+3WIzT2bN9I7SIfMogubvpGtZlm9MpvaXK8ecFhxUZl79/w5g3
 fuX0X/HAT4fK4wIKF05qm2kewxOozoXGYuxgt9/af4V4Wdq8d0C2xCESmmBA8U8DO0XPXJgl5/d
 0dpW5ep4nhN2QQsR06kce2tfr/W8ayfTtJ52knqwmvjD2x8lnaGMhLp/ErR7Dz3q/qHXlpULMBZ
 zIh5K2y3Mf4cOZcNSln7M7IBvRGCEO5zA26CnLL1H/eJZoIwt0S/iqj0yDqrLvwEdezDMaZbm7b
 64n3OkYocePuAGgGyniyO2JyDeLePLxIVxVmp1qcV5ZCOZq3H/zEW0JG9mD2SaqnbT1PM/et625
 ekNWwcaTgQGAb3xee4h64sehG9CxKxAcZgF7hK+WGZHTHMO0ySkwq8XvxYrsEFCKroEocNn+vGJ
 cu0ru4TSFEuFBQ3Jp/w==
X-Authority-Analysis: v=2.4 cv=YtE/gYYX c=1 sm=1 tr=0 ts=69e0cf3b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=nlf9mDh_Z9TmLa7YYksA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160113
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103391-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gondor.apana.org.au,davemloft.net,kernel.org,oss.qualcomm.com,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me];
	RCPT_COUNT_TWELVE(0.00)[33];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.5.7.0.0.1.0.0.e.5.1.c.3.0.0.6.2.asn6.rspamd.com:query timed out];
	RCVD_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Queue-Id: 55AE640DC1F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The DT bindings for inline-crypto engine do not specify the UFS_PHY_GDSC
power-domain and iface clock. Without enabling the iface clock and the
associated power-domain the ICE hardware cannot function correctly and
leads to unclocked hardware accesses being observed during probe.

Fix the DT bindings for inline-crypto engine to require the UFS_PHY_GDSC
power-domain and iface clock for new devices (Eliza and Milos) introduced
in the current release (7.1) with yet-to-stabilize ABI, while preserving
backward compatibility for older devices.

Fixes: 618195a7ac3df ("dt-bindings: crypto: qcom,inline-crypto-engine: Document the Eliza ICE")
Fixes: 85faec1e85555 ("dt-bindings: crypto: qcom,inline-crypto-engine: document the Milos ICE")
Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 .../bindings/crypto/qcom,inline-crypto-engine.yaml | 35 +++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index 876bf90ed96e..ccb6b8dd8e11 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -30,6 +30,16 @@ properties:
     maxItems: 1
 
   clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: core
+      - const: iface
+
+  power-domains:
     maxItems: 1
 
   operating-points-v2: true
@@ -44,6 +54,25 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,eliza-inline-crypto-engine
+              - qcom,milos-inline-crypto-engine
+
+    then:
+      required:
+        - power-domains
+        - clock-names
+      properties:
+        clocks:
+          minItems: 2
+        clock-names:
+          minItems: 2
+
 examples:
   - |
     #include <dt-bindings/clock/qcom,sm8550-gcc.h>
@@ -52,7 +81,11 @@ examples:
       compatible = "qcom,sm8550-inline-crypto-engine",
                    "qcom,inline-crypto-engine";
       reg = <0x01d88000 0x8000>;
-      clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+      clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
+               <&gcc GCC_UFS_PHY_AHB_CLK>;
+      clock-names = "core",
+                    "iface";
+      power-domains = <&gcc UFS_PHY_GDSC>;
 
       operating-points-v2 = <&ice_opp_table>;
 

-- 
2.34.1


