Return-Path: <linux-arm-msm+bounces-91639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKQ2KnDBgWlnJgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 10:35:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1A1D6D84
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 10:35:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A029310000C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 09:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 282E929AAF7;
	Tue,  3 Feb 2026 09:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QdxbBZbo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TdJ/ICs8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E7129CB3A
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 09:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770111200; cv=none; b=GLcreaOtOW5V7FiIFe3hnE/f1hbH/8dQ5nu4x31A04CxxoXRgvYfS7iXpUnMHX5eUFb81APyGjjwybBuCOTMaUoTjAyrFRHG0teHUI9LsYT7A9/F+1itTjlRaTfD5aTacAlS1xME7mM/WH2npjGGhUZuivh2iwAXj8Xu0uOs3dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770111200; c=relaxed/simple;
	bh=SddJbOlXRemaS+xs0O5DFcYSdAaiAYACiMw7pMSHwMY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z/0W9h3HaoVzhbdPcNc23ONrMwqzqwfTHZzWNWfoG8OaMBjFzgO9MCDvVJPUJqm00AJ7cbSo5Yj3oMM71yx+VyLgl4RIMnAFWq5bLlAD8rcri2rhMlTZ/KBp/BVXgtaerxowC/8RiDhEzgNrbpe4yIgwqLYb7SVW9S93M3LvOFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QdxbBZbo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TdJ/ICs8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6136rARM255369
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 09:33:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EQDEF2kC33/fyL2nBGpvpqqwbZvWsduAc47Gm9ODysY=; b=QdxbBZbo6CS8MT/+
	gGA45Ze9Ix1Y6Y8CwK5/lF/YtVt32I0KX1kKcfgZ3vLbSxDeqn00E6V/FAuHa2xn
	7jkxucU2kpliK3yreysqT6SySJwAcdrAOGSm3Q1EJWxUEqmaK/FGt3/cQohy8D0j
	J8S82FLtgS8NUOZ2UZRm8aYXeYxYGYReL6gczVr8qteMGP/C0d18YM8CWecBQs6J
	yMh3d4aOCk9E8zb10gYr2w3MS9ekK9JA+T8Otb9LVYUPTvJqN7j86aZRZVNHNivJ
	GP6daCiKftq7P2SnLuZR3BaztVzPUPUJrrg3Yle6LmiMpYzndAjmCV7gWydB3d9G
	dhckgQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2v0kkhf3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 09:33:17 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c613929d317so3367767a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 01:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770111197; x=1770715997; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EQDEF2kC33/fyL2nBGpvpqqwbZvWsduAc47Gm9ODysY=;
        b=TdJ/ICs8JiCHX4tI5wk40JRbQhLu391rAvyBVNaosFXAKDAuQmvusTww44gg6sP4fc
         OcaX9S4RpL0bUPdUqc2AAbHgsGEqMx0CN9ziBVf5bUqk5Hja6G0jY8vrYOYXIHK2W+Wm
         qwVVsabVLDm/x5uJJJRKyFzltoXc+3sryQCXEuwtd/E13sodgl0moaW1gA5TtfA1BnJL
         1TA3jyawtPggk1XEMYZzkHuOdNol+aAm+IGryZROnNi+8dyXCBI/8Q1k1heqYAC3qEh1
         /TX7XdTjsA81kA3z2x+wyOEbTwkOZKQ1NGeVNg011SIXCSaST9uh9drWOjAom6uVDmxJ
         J9lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770111197; x=1770715997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EQDEF2kC33/fyL2nBGpvpqqwbZvWsduAc47Gm9ODysY=;
        b=q+DlE8fPKipTZqLPiW/jnZ+DStazakWvwprh3fklxv7Y5IoalaxyXnADULMpku+w3e
         vuM/gF29IYv2i0xApL3cN4c1BU0+I097Ch15rDfaqreNipequU/RCXSoTSbQ8qELIfHu
         q0sdHhCzh9G9ExALOGXCeAoP46JedMcNbgbyB9flSkT+r+2rI+eoIBhuGlMIArGlJzOr
         yfTQ6EyffkrIrnlUv7Km9YpON2ThG1LdlVZR6jHr1964d4wYiFrF4+UFGyiS26sa6mA9
         pScczahdEKM18g5FxsgfnmeLQn0QkYq5nHidmd6LVoDEiDKDQhNlNEAd9SZHhZRTgaib
         klaw==
X-Forwarded-Encrypted: i=1; AJvYcCVdFOKlMyzgiqenLGeQ8AvlI5CdTQ6+5lVC27Mab9hyt9js4jrKDtOxiQVHbGIWjd+Tff8hLPMXfkXR4EKb@vger.kernel.org
X-Gm-Message-State: AOJu0YyqrfkkMIFeadHaAF/NIoNL9mm94fjauKp0pxjHkpylo+iiuU7j
	hKShUGSemvdT50cSpyLdH/8QjN75bI1aVaULP2Tnu6gs1rbVQ1q8riFY2UMLw2PA/QBsyVIlexS
	eQ2mZJ0k+PRb5hkXTQJIg7Zq3TujxdPeal3s+93ZkiUnXuvliMf+gCB3IwqG7QwUOAB95I4oLKQ
	1p
X-Gm-Gg: AZuq6aJOvTb18MQTWVb9yKgE13JIXSyg/3O/q174C8nfpacOw1ByUxDiTP/5qajCXYA
	p1zpzm5kwJpFhtM2BYYXG+3aF06Jqw3qiANGhoF4XZlk60/dH9EM8I+SyiMQHrhzohsBK7keqfX
	MiKCKE+x+QCYlj6jQQAh2yA862ezGb9aN1w2YsqTbO9SuPni/X/X3xws5HJudSFPCTSsbqL76/J
	uoAeRVfnEBIbpN1dxPUcmOmGD7QIm4JohxydJsNkHfMVCuiocuzte+jrIvVqZwqxMSwlPnJbZ0U
	Hj+jw59B6VPHWJhwczqXpU1gTRZwLEE3xGoZ4rmmJ8GQblKq4KGBAMUzio9o0ocf5Hu8VOAAg8F
	mrhNq/vxew2BTr8lHToHAXUZzMGc7xQQn6kgZjcJvUHu7OmYnUiAIJvZ9Rl97nh9G9wTdgMaA
X-Received: by 2002:a05:6a20:2d0b:b0:38d:f084:e349 with SMTP id adf61e73a8af0-392e0143724mr12396447637.54.1770111197071;
        Tue, 03 Feb 2026 01:33:17 -0800 (PST)
X-Received: by 2002:a05:6a20:2d0b:b0:38d:f084:e349 with SMTP id adf61e73a8af0-392e0143724mr12396417637.54.1770111196608;
        Tue, 03 Feb 2026 01:33:16 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b3eedd0sm162489155ad.3.2026.02.03.01.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 01:33:16 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 03 Feb 2026 17:32:49 +0800
Subject: [PATCH v2 1/3] dt-binding: document QCOM platforms for CTCU device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-enable-ctcu-and-etr-v2-1-aacc7bd7eccb@oss.qualcomm.com>
References: <20260203-enable-ctcu-and-etr-v2-0-aacc7bd7eccb@oss.qualcomm.com>
In-Reply-To: <20260203-enable-ctcu-and-etr-v2-0-aacc7bd7eccb@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770111187; l=947;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=SddJbOlXRemaS+xs0O5DFcYSdAaiAYACiMw7pMSHwMY=;
 b=3FDOhsv15jkr0eG+Zt0bF/AStNg4Qs3wZAy6nUUTYvvXIp3doY/zOiE46GrxOAMXTswMlRfFx
 nM2jVbfkQwvBVdhoYD+8WXRU0ZHH9eHjurpCNaVAzNaX1kESoyax5Et
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=Reqdyltv c=1 sm=1 tr=0 ts=6981c0dd cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=K-gU5Sf5JpjFIvSPVLUA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA3NCBTYWx0ZWRfX35r4lDD1Cq1g
 XvTqTbllVeu3tEacT47sUeDe1Ne3YbThZ7ZoMfU0KbmcJB38q5XF8DJ/TAej62K1yjCzm93wwCN
 bTQoe6Hcwrd2Rpv+u3rQT8oFDp3oAv+8KUy2eYTcLYcHSdAYDFr/3iZ1YNcsD4wbd259sPHCU7z
 +1JHzrwgWPxFeAWNJbKERPHE4P4PO1Mm9NSaMHnWbpexLttn8lxdSC70/fbFgUU/SbnQDGgsaMh
 FaSwl30DLsrf0nWrKvJ87BTNfYEtCyO7Cv82Xi6IzbOanQ009sWUt0e6Qg8r1qmlfyITD9xf6Yn
 iwTUYFsimne0GS8mR8yCFhvDBba/SZN8CO0SoEgIBToHYDhCEw97xuAs0pQ+dMWeNbx0eCmzWQD
 oM9gKKypAPm2BOqbIqX/eE4aay4GJ+K6EHNvR7IpPNHMK0OcFocuTA7C7BNsFZaQcVmMdzsnZ+o
 n2+CR6hCqDMvqU/dJdQ==
X-Proofpoint-GUID: MeVFxTp6dCXt6JRv5n1-M8C95sli4kLv
X-Proofpoint-ORIG-GUID: MeVFxTp6dCXt6JRv5n1-M8C95sli4kLv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_03,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030074
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
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91639-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0D1A1D6D84
X-Rspamd-Action: no action

Document the platforms that fallback to using the qcom,sa8775p-ctcu
compatible for probing.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index e002f87361ad..1b5830579fa5 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -29,7 +29,11 @@ properties:
     oneOf:
       - items:
           - enum:
+              - qcom,glymur-ctcu
+              - qcom,hamoa-ctcu
+              - qcom,kaanapali-ctcu
               - qcom,qcs8300-ctcu
+              - qcom,sm8750-ctcu
           - const: qcom,sa8775p-ctcu
       - enum:
           - qcom,sa8775p-ctcu

-- 
2.34.1


