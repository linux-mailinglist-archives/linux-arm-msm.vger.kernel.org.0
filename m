Return-Path: <linux-arm-msm+bounces-114509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2pa5EAYIPWp8wAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 12:50:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A156C4D88
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 12:50:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=nRfvZ60R;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EOsHzkSy;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114509-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114509-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6DA6E303C298
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 10:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04ED138887E;
	Thu, 25 Jun 2026 10:46:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2982EEE6E
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 10:46:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782384411; cv=none; b=bguxc3JrnqMg0Pi/3bvQZJ1Ql1WfILj3U9x3JGxECwoC9iTbPt/NjLazEb9vikGrDopSerHb1Fu2vmM6BOjEl/vqrgVx3m2K8rxfhcPgVdCMpwXtocqzIToRXQAAvghcDFSGOEpLW9zccYycWeqktSmzykliuAJ1R2eegrGQJnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782384411; c=relaxed/simple;
	bh=DsL6kcYT3hY1q2jvZSOp/rxfO6RBNAUHqHA9yEMzJAk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NKxmiLppij46cPhB+6vDhZciKDtA365Gx9rKCQUOckX9JuulPbh+ILnTjBi7iR0uzkWcI/bdwUUTcqRFew1DTDvpypyGR3mgl7+qK9TIW+IwhaaY2a+O+4t+HQYcJM/2ETM/xvM5f1C6zAud/QwtrBrixX/XXV4nKYScHivyCMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nRfvZ60R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EOsHzkSy; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9jwoU1371476
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 10:46:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=; b=nRfvZ60Rlqp9rNcv
	oHgd2pHed7vU4J3YzF3pnvOY4Na4PjKZwiF8sYjhElRIBdebz/u5NmlB9Q8ufid+
	fmTfC01MewRQS075QIm3VdEKATwOGJfMXyChmrpqW3kw1wXAeO4WC9So0Bz/Jhel
	ASDiuB2m0fN+De5JhZvrxVdYXTOyC4dBOrldkdgpScabNKAnXo16YuYW++Jucetx
	N+fPQaCAGWGIqypHj03R8GUrbZAx2enTofHbUwGEpKQwoKfPJiuNpQapqLUAFVln
	egSOU313amuWxKoxA1Ix8lUdNMhKlLBVqmoyxUQnSrciTpEVc1XW/4Nt/PnEN+Jg
	0PssKQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0ymv0thy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 10:46:49 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88da04b71dso1325579a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 03:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782384409; x=1782989209; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=;
        b=EOsHzkSy6j0dyabxvdH/PceVxv2QI939HnZZqAMEOe77qJdOJOeRvO5wNwvTq9yw9J
         rpwuKyw9GVoSUmz/aUz4QOApeezUeDPEx65S1QmT3B9zJPJ4tvbtvBKvMn4YzSoo0+Gl
         F+22qHAthuaQaHAFY1YqOIEdkViVGkmilDzuLnmkDWmn0WA35cVhWdMTMPm1nsc3sAJl
         mAr7Ei9jVmA8EukYf4tV13awlGx0PbuTfNmIM1FwIhoG1NSz1Vbwv+aXCHAtZfJe7uck
         T/AkS78qAig7z+4sgYpSdueiSG1oaWlNb3XHLso/0cTfEw65BHx2frb9xVWb6dS+12Ao
         xxLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782384409; x=1782989209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=;
        b=axPYMnm8wsk5EqVLFkwpDZL1vbw7lKU6/EWu4wfwCvbylpntYZJ0wRf/SkdeEpzUQe
         gDjUDBmDLtCQIBKGZWHFoaMfN0pi+Sf+v4owaADFBO4LFQfaKNuzFOf/2JgHoL7k98rb
         AVwj8NaSJ5pFf35kj0lIwvFOT+GbwsRPJOMpbPo0HELmQrQldCLsjQpluksDY/IZCmbA
         lH+YOoWy/tTachAzujbvSys/5ylcsfYY2U8YStmuU2L5wJSDm73cLbVmT1rkozCO5jH2
         DLnm9rW8QQdGsv+hbCtdqRIe8FjE9GkHXD3KmvGoa+LVagUuqpUZgY8gUruJOjEnv4Y2
         xz0w==
X-Forwarded-Encrypted: i=1; AHgh+Ro9m4kBBaoICTWCRnmDrcr4NkiEvR4qwcsN7KDebps6jZqFMGXRkOWkeJdPbRNismJDf9q2WtE21c7tqoID@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+p+jPleoRxywesI2CMuGRf0htbBF/aXuNW80AjVrmYLcmHcUR
	/ftixjlEnQ03TbGy4MW0/hMTmuWlEVApMUI/9NldtDkbW3bXVCLGkGQ/VUkoAPbaJ+fkoorJmyK
	/BhNtsxNXIO0txnNBV6C8WojupI5H6iqQ10d9iZNUiAUVAaLN8/yJ41qRL5ynUvn1KU+f
X-Gm-Gg: AfdE7ck/O9EbFNOU2P9dPF2Lx8BHDaDzh+Cl77it78swN3FJZKDXtWo02i2Y9BeCx38
	E5cIh8xUPUDw62D03c2eb0BzH7dcP6nIqwMcaQESehN0zE+9hGkxCrQcPcycvp0DIhFq0LnTzlm
	3hQnjP5ORDf+osKT7EO6EIBAyRhH7JFsxCoGwFUkztR2cMJcin9sO4KqUhbPY8gij0W+uB2abnK
	X+bfshoO9tpLnb3kAbBQmGUnWv6XZEL1FUZYM+0lGX0ppRCDvBWOCrBedXO8tXAu8tCnCSb8RRH
	WLyQZWT5ZPa62M/Ojakcnxlbw5+9v5Tyem1H/eGYkJSHM6xIhtDra4mmLHX2AnUe8C0zDsh1OjZ
	FwsyrfWsxlv+Ba1+zkx8p8039xJBF1zzkdOoqJYm3SxlkRzqqgEOFHffUouaKtdzgJafMp9NyAg
	==
X-Received: by 2002:a17:902:f644:b0:2bf:211c:4980 with SMTP id d9443c01a7336-2c7fc8b106fmr21137675ad.35.1782384409176;
        Thu, 25 Jun 2026 03:46:49 -0700 (PDT)
X-Received: by 2002:a17:902:f644:b0:2bf:211c:4980 with SMTP id d9443c01a7336-2c7fc8b106fmr21137275ad.35.1782384408748;
        Thu, 25 Jun 2026 03:46:48 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f63d58e9sm17114035ad.60.2026.06.25.03.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 03:46:48 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 18:45:55 +0800
Subject: [PATCH v19 5/7] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-enable-byte-cntr-for-ctcu-v19-5-8fbbf22e8381@oss.qualcomm.com>
References: <20260625-enable-byte-cntr-for-ctcu-v19-0-8fbbf22e8381@oss.qualcomm.com>
In-Reply-To: <20260625-enable-byte-cntr-for-ctcu-v19-0-8fbbf22e8381@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782384373; l=1751;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=DsL6kcYT3hY1q2jvZSOp/rxfO6RBNAUHqHA9yEMzJAk=;
 b=NzXxSe9YCbXAOvgLAW+bQfAw5hmoUMFjsQl9kHlNLjYZHW1EJko7qSAjLxFK6OuUzJFyZUeKl
 4BnzXZlDCyQCs8tj3LgEVmXHRuP7meAdUfgA7U0nC1dnKWo3CftEjyp
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=DqBmPm/+ c=1 sm=1 tr=0 ts=6a3d0719 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=gSyxy6DGYGa4b6s9XCEA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA5MiBTYWx0ZWRfXwrNKS2JXyBcS
 1iDfOSMO++EX/hsCagsOTyRo5V21jKKCSQoBF1S/hAwx/cSM/4OqSo+ZB/UDGdGkJaixYg6gMiq
 mk7Jj+R3764SeKVUlNh80+dpzO+AzP4=
X-Proofpoint-ORIG-GUID: m23CtuHC08aJ7EC6FZ9H-lrng9ZZe3XK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA5MiBTYWx0ZWRfX4e4ZeBtiiYTc
 JyYUUrlHqL5gB5omzRWkP3qvIQnigd42dcJaSs68r/2zWyIeUdhhSIx5guf+5hICzHKbO3qgGr5
 AcU6LvYZ1qL1Dihrg4c6JN1I4uNJHfGkacQIUJGNGR5ysalaGLyo9oHGz5cmSHAsK3A0Kwbi3Bm
 4EPculcd+AmXojxu0cDopX3Z52w/LlH1uskIhqUiyZE6e18jS29cet9CyzGa80jvqxEeeWoV283
 FfWbbkMwLk5Iavb/5F0xw0KRsBqP8TWASQNXW4cMkF/eXgDdiviSVS7kbPRgJMne9t8GTzOfAfs
 DVCve/56uZl3jrZKL4j4aqeV1YImJQA5QbAcmTsJHwtc9AiWRjxAXzDI6ENSRcaSNz0ei+A4ytf
 cLOnu7kKalXi0TnVhVsUe+/hB3w3opN/azcpnnBQo/3KuvS4wr9d5NN5Pr6mBjfSR97VspxzwsH
 PAlkr2LOWlwouJg+/uA==
X-Proofpoint-GUID: m23CtuHC08aJ7EC6FZ9H-lrng9ZZe3XK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250092
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114509-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,linaro.org:email];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:leo.yan@arm.com,m:alexander.shishkin@linux.intel.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:jie.gan@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:yuanfang.zhang@oss.qualcomm.com,m:jinlong.mao@oss.qualcomm.com,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D4A156C4D88

Add an interrupt property to CTCU device. The interrupt will be triggered
when the data size in the ETR buffer exceeds the threshold of the
BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
of CTCU device will enable the interrupt.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index e002f87361ad..2981001a7d7f 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -44,6 +44,11 @@ properties:
     items:
       - const: apb
 
+  interrupts:
+    items:
+      - description: Interrupt for the ETR device connected to in-port0.
+      - description: Interrupt for the ETR device connected to in-port1.
+
   label:
     description:
       Description of a coresight device.
@@ -65,6 +70,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     ctcu@1001000 {
         compatible = "qcom,sa8775p-ctcu";
         reg = <0x1001000 0x1000>;
@@ -72,6 +79,9 @@ examples:
         clocks = <&aoss_qmp>;
         clock-names = "apb";
 
+        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
         in-ports {
             #address-cells = <1>;
             #size-cells = <0>;

-- 
2.34.1


