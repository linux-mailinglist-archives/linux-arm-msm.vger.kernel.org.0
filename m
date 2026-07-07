Return-Path: <linux-arm-msm+bounces-117313-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id b16vKJfzTGrysQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117313-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 14:39:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C82B71B703
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 14:39:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HJpP01Db;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YLmr1EGa;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117313-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117313-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 855E730568BA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 12:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25ED840A95F;
	Tue,  7 Jul 2026 12:39:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8558140D59B
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 12:39:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783427983; cv=none; b=ZhH4JyXmvaiaQSJd2cGpkZw74fs1VyTnvH5RkRLPvNOXYBGZ+q+ucCm+vAe42i+5xmBSfIM0CBdsF+m0TVdra1Mh30OZO46URCpeMNEeTPQ0vAMuyvRC3wHXwk9ekOXRDFfhanDNV+Xgh3d+I7774JEMkxaqxpn275eV7zrUchc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783427983; c=relaxed/simple;
	bh=eHDpd6vgtbA0sxM6kFLyR6Zm++9MayE3SXUYYVCO4NQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=apUaM1iKWabqIzDt6879g6PnvCBaVysyMiutZ24i1BK18Xk2jUt5sbwzNn0vye1Vq2i0VriBXv3xRYVIdOZ7DmBfjCep3e9GQD94ao0/S8nK2JxD2ap39ORPGf49Yzn4LRq3AlcX6jJHvB+4Z+pQknpRxdn5vW5Cwg99gwIZD+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HJpP01Db; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YLmr1EGa; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C8hKa3755503
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 12:39:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O+MZWcboub5Sx3zK/u+zp/SZpNFTfsnA40dFne5ZTno=; b=HJpP01DbxV3KMaPa
	o87Z0eKtFLx1mowpDDoWDEvfi+E9/0mLUC/jbcJspPUrcZ3QuMjejwWJXfQgpnVS
	/CW38GHQFSMtOPFa15nBf6AnLxy/NBSupUk+mYbKOoZsChm29yaaomlwPMDK/zN0
	DuHAiFG93OVCKnhNCrqnwe7XPGR/OJ+L7FClOARgSZWy2noCi2/WJDBNhjXOyhi/
	NitYMO0ECX0gHIV1jj3xXoyDpuvEUUfbiPyaRSfS6ZPa+SdWvCjY4MlSKizdGhpU
	3RG6c0dgdaFjmRpRIuKjqNrVkXhlSLk9BnlOmf2oTJdNdadvjwu+z3o5kiHgkFoR
	v31dbw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8wep13ux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 12:39:40 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8dc607c8a54so86749726d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 05:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783427980; x=1784032780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O+MZWcboub5Sx3zK/u+zp/SZpNFTfsnA40dFne5ZTno=;
        b=YLmr1EGalcfwcKcKHw8/bslVnemiRk8rkfT2Pc0WPo+HlHGP0o1B/DnWJ53mGzpvOw
         zLsM8xi3b+bg+5pY3XQ8SWTK6I1hgY2oiKu1by50FA6mbuF+FoEByeFSZOZPOWMwSLnn
         70THNdeKn1vPQCKztgJrv51ei5JTn69dfo2J6WJ/dG7BqU4nDpeTILsVmBzVys4TGHnE
         47LlZNgCcSIjb3gr2/N6Wbk9FEPGynNOMZ7cDrShjhNd55R2F3yTDVIFHW+9O4Asnud4
         bYZ3qI9GAfjhF3/y8sa7L5TXgo3k4hQeoyTiU8mbYkR9s1/lGNM2ZCM7dfLZ74vL74Ya
         5l7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783427980; x=1784032780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O+MZWcboub5Sx3zK/u+zp/SZpNFTfsnA40dFne5ZTno=;
        b=tOb7K/Rk/ZD2gO6ipIS4LJK2nF0TIaLiDlfC61saZFhF//lAfkxB3TKCZN+LpU0nVM
         WiQ5hGXJOS2ztnQxdd2n8L5gHuujSJMYb+yH6/Dqtw0N4VOMpFny8Wrp9kmsPenEm6aJ
         pVgp82qpe+g6uLyA85YorLNUufySpDOvImr/rTO75KSxSU9dbs+TiCyIBUcEnK78+i0U
         bIOsNTGBrbdw416MQZgJVe3Y15ICUxB2eXrwnq6kkjcKUGDbQKOi4bZryFp52/cGrJYo
         KKdNg4IfqpdicOXy0kDjSb0Egmd9+vL1pb472bkguDCZbCAr5bYiarbj+x+XrqXd7xLH
         oDpQ==
X-Forwarded-Encrypted: i=1; AHgh+RpJ/JsVvXVtZMuvQObY1orR5yy7Y9zdltGnP2DacjwuaD1m6TapmsGcNqeGcCGnsfDevW9KfvgrCd+Vuff9@vger.kernel.org
X-Gm-Message-State: AOJu0YxQGlkOJf0bP78Q01tKJcbQDMhftJVPdzlz3HXontaTXRT0yRfs
	Ayb3d4ZWMsivMoNCUwj40PFAFHBsXlEmSbXzJAcBlW0/EzO6Bm5TAe/X84ybiNUkfwRKu2j1jZH
	MIkwLEZ8/PFyT/WnvF2pBy6cr0k2qe3Ky37vdiVZ5gujfgIlvMg/q6adO5AVl2Oo1D+ma
X-Gm-Gg: AfdE7ck0L+uqPO+7kPamW4jYR2WPPr4/p7thLQT54w+AcsqGKxK0pFJGJDv6ZvLE5Qc
	VWhow7080LO8Lf6EJMsfqqMxuuHByUmzIo/Na7jXF2GZMq39NLnmfNnd/Lc/4AnRM7/SLLkYUSh
	OWEm0JaB9cIQ2u6bRkLw5IOTANECL4modpphgvo0dQ3DK12h8PafSzzaGRUCXj0b4XYsSUAujLn
	mEzEa8OyzE+vDa0xG/IpO+G9LhK1RcN1vI3CV37wieHZFqwqs+TSsuguGgPqRF+iCRPJHkFBR1L
	A1L/XgQKzjo6K02O+sqxeeuR0+CAbf4Nog+5MAIp3h8fS8OL5zPjZ8BTaHG9mvlluzXO1EiCyoM
	cOryu8DHfg44xtcQJaLRcvlPOprvtMQE+yB2Y7kAjUnZGs1ZPDWltPT5S10EsC9eeiA89gN0=
X-Received: by 2002:a05:6214:5f02:b0:8f3:9586:c179 with SMTP id 6a1803df08f44-8fcb375d1f9mr56764336d6.17.1783427979934;
        Tue, 07 Jul 2026 05:39:39 -0700 (PDT)
X-Received: by 2002:a05:6214:5f02:b0:8f3:9586:c179 with SMTP id 6a1803df08f44-8fcb375d1f9mr56762376d6.17.1783427977708;
        Tue, 07 Jul 2026 05:39:37 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f46ea3ff80sm159724616d6.15.2026.07.07.05.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 05:39:37 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 3/4] dt-bindings: arm: qcom: Document SA8797P Ride board
Date: Tue,  7 Jul 2026 20:39:01 +0800
Message-ID: <20260707123902.3868016-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707123902.3868016-1-shengchao.guo@oss.qualcomm.com>
References: <20260707123902.3868016-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: VXsJzJPpEnezzYyvTR5qeCqV_QE2p2XU
X-Proofpoint-ORIG-GUID: VXsJzJPpEnezzYyvTR5qeCqV_QE2p2XU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEyMyBTYWx0ZWRfX0pOvk3Timk1N
 9fs+OmG6I0yLYvr325gBc7LN8358HrIrJxZ8ZORcpYCCEea8JXhI22ie5yty3HQeuev4g3TXvvZ
 I7Tpx8BdooBZKgtY+eenb1TryEIVfY3m2Rpp8OCIkLmR95hWxV4Q6bxaBMMffK3YoGyKUQY4U59
 OZF4tkwQDS46ca+PjTShANi6u26k/25C4kBDrlj9Pf15jm0q5R0/XyZIE1gQvJX3OH1HKCVTjny
 n8TSoqZG2vvCTQPH73MK0cV6b2QooBW/c0oqkdrDQPnVq3qDp8i2ikHxFzB1+SkyMr430ITRCUU
 ryWai8I86Wp5eOo2vT3k/UD62qmMoyu25ihjNRhbOCw/QcfzF25EgNjLD5W6bZ6IZn70pMPD2Fm
 2VlPpZJszB0jW22b20EQHqNnuJoT9N1w9zOS1zW6B7rcbJPXItMg8w9lqFgaVclZipghS0s0U1n
 tZjjducH5icmsNh3jHg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEyMyBTYWx0ZWRfXwlyaAz1eqEBv
 ai+D0RZzZyPyr3CRq/gvez/nfY+AsMGVufhUATldsVpivN/6j+B4uSAe/coG+lSO46tUc+umsoC
 jvekZpxv8UqYMyAxUC2o8KjoGJF1rcI=
X-Authority-Analysis: v=2.4 cv=atSCzyZV c=1 sm=1 tr=0 ts=6a4cf38c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=dQQo7YwDhi1l8iBccy0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070123
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117313-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:deepti.jaggi@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:shengchao.guo@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7C82B71B703

The Nord is a new generation of SoC series from Qualcomm, and SA8797P
is the automotive variant of Nord. SA8797P Ride is the automotive‑grade
development board built on SA8797P SoC. Document the board with a fallback
on SA8797P and Nord compatible. The SA8797P model compatible is added for
distinction from IQ10 model (Nord IoT variant) which will be supported
later.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 9df4074bb582..7f137b7a478c 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -389,6 +389,12 @@ properties:
               - xiaomi,sagit
           - const: qcom,msm8998
 
+      - items:
+          - enum:
+              - qcom,sa8797p-ride
+          - const: qcom,sa8797p
+          - const: qcom,nord
+
       - description: Qualcomm Technologies, Inc. Robotics RB1
         items:
           - enum:
-- 
2.43.0


