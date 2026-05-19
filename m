Return-Path: <linux-arm-msm+bounces-108356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uA4gBY8FDGojTwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 08:39:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF1457836D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 08:39:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1B4AC3075375
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 06:36:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 073DE390991;
	Tue, 19 May 2026 06:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U7v+4LPg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M998iO+u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C091E388368
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 06:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779172550; cv=none; b=hGJnaaLCLu1+cxGSQvRQVyuNbfB1k5JTfoT08CwEI4LnbN9s6CfEOBePH8Yksn7KqVILP5W0teA5et1nmbSGwzF+WR08SrNF5u3voEiLadTqhp68TKvQH4qUVYtdMaAOQrnaDV4eEvytAk1No6dVmlf1TIKEtFiHqpyJEkZvi+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779172550; c=relaxed/simple;
	bh=7X1ctswchEtMdjBWPQUOoR8aZBAdNL47AcQ/lFZW/wk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VzQJWlaHqTidSY99amFVdY9KmDv+AHdN7X6ADylUGQ8xYCenTgohjxOD0UUC+FFZLxEjmYtHtUOHzZ29QoG1DtqlUdorelTBmUKcXu7hg8o520+l2JDge/cuI8hm8wSNFj81+vztJ56PSI3BEtXyO37cD4Uu7qJcc1v+zh2ytYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U7v+4LPg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M998iO+u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J4ethX1251904
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 06:35:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=F4mv3meOFLS
	/DEkNjNpC0Q/y/CNB2aawbAufKu3fGA4=; b=U7v+4LPghfkytuO/dozaZwhpKDr
	OCp3KTpO/ysFFw70EyLqM4ZKHkYeLFk/E2guLus+XvZAfjE1CR4vtQssh1NqSuWM
	tLD8JbL2jHfZD/6+Uqa9gNk3Qp614WWjysUCXYYhxSFzKhBnxvx19GoG5HeRVm1F
	/OwxMLaDjPuNMqzlw5RHYzSfubzFULpMF56OnPPNR4BN5YRflK6qnU9rXQAtZlsU
	8RXagPn6C3hzWkCKr11EQ0w7NpDxyGG/mKuVYJgnTWw2MckmhAVzM+K61ng+l4QP
	sl74q3pP1gOeKb7ZHdz275KiWf9qRwpOAqG8cNOVR3PHeGSVJk7xQQMD71A==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e82c0krt8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 06:35:48 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-13536592ebeso15266117c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 23:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779172548; x=1779777348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F4mv3meOFLS/DEkNjNpC0Q/y/CNB2aawbAufKu3fGA4=;
        b=M998iO+uzIorIl+6LjfliPnFQahI/8GDPAXhKYH8USLnTbqjjblNLvL86IWUSbPaEo
         DHaYLaNYDA0chjGZqHVcUh8hSm1TlZD5HMMYXbaCT5/E63pNcO43pnlGLwrgtWFwW3Gh
         /Eb/uVsaCG4vDNzuClMd6C9zC/9OvwbKyjvgBZpa57yqpRLvp3xGSQsT1nDF4mFkleBn
         svkfNKUFA3YtLIXWZ1rmdU4C6j3seFiOW28FNYh/9EN2GDeZXwmAcGuC8l0R2rctDvav
         FdOdK+1uNaBoGxEclI48eoEMbmrH6/X2EQW1pdjVwYs09kKO7GQLWjeJCKE6Q22QKlYK
         +ZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779172548; x=1779777348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F4mv3meOFLS/DEkNjNpC0Q/y/CNB2aawbAufKu3fGA4=;
        b=rtI7WfEPFtSGO/FYI133X9OC71kaSrqLI8SKVGbFDudUxvsF81xqx269JloMUvt/SZ
         03dq5/S0RWJhS55FX2Z6LBHjwcBjwog2JB4Fv2gLWXAWxm+XvZ5nQJmZb0axAyHBihso
         0/+62xFbNIqAQj9Gb3L/Gy7TokPayqlLCwneSTKUaWelOc/kS96A3zLKI6o99JiDSNUe
         0ZERI5jhtTo/jPSe4lxgZzq8Ox/zTTU8++tglc+AKPSTFtvY24fSOzdCY3sUh1347g/R
         F7q1SwPNTifZ/oLV8DSK9NxyJsLv2IEiH2DduF5/qR+7tc6Ylpr6QNRpirzSle9I5J9h
         gPtA==
X-Forwarded-Encrypted: i=1; AFNElJ+XoxqRBE0dFtmlP2M5fbpmEKCQ8Y5itphsQeKOw1WAW4+gbqT5LjOaLiuCaZhGMVIKrodm3mrevFoSS5hZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0DJM5XgGis5MYwYL+HJkN33q9cVHZK5WkoNRy8taifm1gS908
	zvPdP4PlRySZ4cUp+3Vlrl/WXZJc2cctt9r5JpL5IONVjRy39xicLNTHmUjDgt5iZvJjyQqjJq+
	GN5NMhsSYyPO0xVarlNCfEYiSAJ3GvnOfzfG+j0VP7/Tpe5chF5leFSvnNd3iDWAS2wWY
X-Gm-Gg: Acq92OHyYU6GL1/LN6bemjLdHZjkPZTt6PalLiEpzuOJd9t/UBblpHzD7DvDAv7bDqx
	iQlAokQiU5PFELDditrDxOC1c9bpfq4zm6v0ylGe8Fs0Xprf1uCUjsW2CelaTMweT0IBWKHYfzY
	YyDr7GWP6TRMEoPaDieCSRF4deHLaVRTwtMn7UyPapAXZEpAtCDo2Z3/qsCXNKUGxX5Jzv3bwBO
	NS/3M5WKRKmk/bJXbqHMuZO66XaC33dVE9T+v+nvWTPXGUjYYEKXt8dRrcfm2v6Fqa6u3pSoLsD
	EOgAAOVi8SVQtEk9M/22gEdlkX829jCiKm3gChp18PVF/MIUx7OXRrrQZ79P/LH2yVlywXgpQ6I
	vWp9T9DcaydpQMlaHOaexE1uojVgFBfLF9BE5zVFKNuLMceWfkwUqsphLU7E2n43FbzWvgaxiel
	HEHw/k7w==
X-Received: by 2002:a05:7022:4187:b0:134:7497:2148 with SMTP id a92af1059eb24-1350552c4fbmr9451583c88.28.1779172548155;
        Mon, 18 May 2026 23:35:48 -0700 (PDT)
X-Received: by 2002:a05:7022:4187:b0:134:7497:2148 with SMTP id a92af1059eb24-1350552c4fbmr9451559c88.28.1779172547547;
        Mon, 18 May 2026 23:35:47 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbdcf140sm22614537c88.5.2026.05.18.23.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 23:35:47 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 4/8] dt-bindings: crypto: qcom,inline-crypto-engine: Document Nord ICE
Date: Tue, 19 May 2026 14:35:01 +0800
Message-ID: <20260519063505.883379-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260519063505.883379-1-shengchao.guo@oss.qualcomm.com>
References: <20260519063505.883379-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA2MiBTYWx0ZWRfXwgO4Ppdfk/0E
 9fIrMR1KNMQwroOuOghFuvpZQibUp2sMqddzUhOJDT3yCpVhDp6KwP1IzrhKUwDX0A9wxefJUhR
 0QvpBBS9B0MUr9DnFJlgCcdwkFltUz5Zlf1e6a5Nd/j/UpGGHq+kTKg4iIJej1mQRn30BRg9eTk
 mLhVkckObfe5g0bdjfH38bOM05aVbJ5E8ezUkGlDLbTOvem5XjpjAFAOcZ62bTXb+CGHzXiQVZt
 XmAGDkHavUc480fX+RNhNErX1f1cN2PgS0YwaY/hHE8zzW6H9JNSQ0tOyYJArKiscHYNKGAaOBU
 0URuFE5YpyjqpjUi0QNjrBizYuRSU1lpWoectbsJo0yFbOrBpcodge/QI8yW3NdSnstMBytAUPK
 9/Hy3rSjCUSTv1GvTzIa6R10IvFQTAncDwgFjFAEymIoY3gSnD1g10VAajapSusrVQfIsjGMrcz
 48yF+Wty/r2ayZghtpA==
X-Authority-Analysis: v=2.4 cv=A5Jc+aWG c=1 sm=1 tr=0 ts=6a0c04c4 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=qu0NaVmkdm94GxaCK5wA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: QinTGweoCcNBtel1eFCAUmdBuA1Ndwwl
X-Proofpoint-ORIG-GUID: QinTGweoCcNBtel1eFCAUmdBuA1Ndwwl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190062
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-108356-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BCF1457836D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document Inline Crypto Engine (ICE) on Qualcomm Nord SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index ccb6b8dd8e11..c497528826a4 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -16,6 +16,7 @@ properties:
           - qcom,eliza-inline-crypto-engine
           - qcom,kaanapali-inline-crypto-engine
           - qcom,milos-inline-crypto-engine
+          - qcom,nord-inline-crypto-engine
           - qcom,qcs8300-inline-crypto-engine
           - qcom,sa8775p-inline-crypto-engine
           - qcom,sc7180-inline-crypto-engine
@@ -62,6 +63,7 @@ allOf:
             enum:
               - qcom,eliza-inline-crypto-engine
               - qcom,milos-inline-crypto-engine
+              - qcom,nord-inline-crypto-engine
 
     then:
       required:
-- 
2.43.0


