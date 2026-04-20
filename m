Return-Path: <linux-arm-msm+bounces-103671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CjmHXTO5WlIoAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 08:57:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F0B42788B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 08:57:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8D6703014286
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 06:54:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35E5F377563;
	Mon, 20 Apr 2026 06:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ayjc3QIc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HYghVbtU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DF03803E5
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 06:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776668072; cv=none; b=YK4C+Y0AC+Q8TfxOmtWrd0pYLRkgZxDxKlpoGEkU7tVlenwBsVkAHTLiYWP8WIjYc2RS6P9OBYr366nvCF6RwLM7cWZTCGXXHTFPCScDBt5NlHkWvmbQVzk19OacRsKVBO9hWpYRqdFS6xRj6RYWd8akdCCdevCowoB1siogcpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776668072; c=relaxed/simple;
	bh=+gpiwd/uytI50Y+36bWOKFiJGYYLm13vxU2a9WScgiM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QWS0/qwIrohyNHP9bTBVX5BLNnowloDZOlH8GYhX63pU3oAcdyZJ7TluWtwjwGa1iGkcRDe26tQlLyNxEiaiw0UG42hVP6VCLtfFSeJ1S6cUE7dT3eo3JPbLwScW66JoLLU1eZLB5qMfFkdwtEeJDxBfFZvf2IpUwTFikDkH5TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ayjc3QIc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HYghVbtU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K6id9m489719
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 06:54:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=QQE4p3HA2XSX/yYP31R8chNUnw0g5gaO+Ji
	c8gI1HbE=; b=ayjc3QIciZ6OOJtlw401tejoQitFQnftE/H1Ut13l9BhqzKrQ52
	giLFxbn5VauO88ldBZBCZ/Lede7d89Hz/MJF8bh7nJs0RIRN6B0v6hmBJoHhKS+X
	aG6XAXEhVt5PHO4fhpHPUYV5T7lFlzpkQbWOwsShrMVn905+Vi1YLnfxe9KcJS6T
	vH4nwk0IOkvH17Imza9hKTAYgeXOZdUNL5RpWJtcGE6AqccbDdHtvlH/4EZGnoAK
	GKEnJvOuZe0QSOLwX0MUwbCezRM29kzWQu+k3HyBG4ckA38IjNJAECKz9b2TN7Tb
	xxef3cXVnSaGimsbKvf8VvbRuThUyST3haw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm1hx4hqv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 06:54:29 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2bdf75bc88fso3002365eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 23:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776668069; x=1777272869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QQE4p3HA2XSX/yYP31R8chNUnw0g5gaO+Jic8gI1HbE=;
        b=HYghVbtUtFxbqU+5Jtx/CejWqg11AjHzqGcKZQpPb1pTP0FP0vwa98fSTuctaKzuWY
         //ysK2u7MA0ZLfhfitf9JZDmw7LyOKRtxV+aeMIv7njb0n/8P4xSuPJfiMAhimbsvhKt
         f+NOiqUjURHwhcS3kfXS/absdWxOGsj982PGVnAR1PHHbfYQ4wKBdgqsbs8/g/Gw08ze
         /F1yPPAiH9Rv/yaCA+dVyHVAmLuSF8LqAZYnSSTQgnODLwdm9w9C/uLGi9s6Gam5Ich6
         bPmPsbQIJh02pbPvzF56dYxBsXZpnA7PTPSKinEB7i/RFS0kpVJGSiPWyoS4wOzYUk2U
         H+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776668069; x=1777272869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QQE4p3HA2XSX/yYP31R8chNUnw0g5gaO+Jic8gI1HbE=;
        b=EZ4r6fz94BM5p5TJbegjZF5DyCzjDN1xUmAOjgs5WSCGN8tQLbdBZPW2wPvA04qBfG
         D+Q4TBwlg4hqRpuNyaGDq/PTtEi85enDRLeDaK1rP85VIOjEv8YM6reP+3KKi3FasgkA
         WW1V96Vbozueq7ekqIB7kS5LLRNO9rpMpdYFgHaY0a4auCT6hP9JmXTxaz9+NHVyY89n
         nxWDAO/jmcBLOjwxHrz/xYsW+r62e7VQorS1qsRRb/WEEWzN2qPYpjHffpRsDHgyXCIN
         zY2EsP+J4kmzBoC93q774yElRtDn4p9THklq1XQw2F7RSu8wcdgVVnbJKgKw/VusCdC4
         KlkA==
X-Forwarded-Encrypted: i=1; AFNElJ8Olvpp+eysQEmvNbISnyTi40IqA96nh4FhmA2jDH5KYnyAEMaSHHF71t8Qzx6YsZLkYK2925xt6ToRDIuo@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs6nh99dqFvvX7qJ0xGNnM3Q94bZVpY64fQQN5mRbOCof4K8rw
	zj6DynIBhYj2iGtrB86RPCnMXA+SFaXA773MSrFJ8wXdwjAdeBe5Nx5gR5pXx1vJV+5pCf/3ts5
	INXPZn9aATnLVgxgGUusvO40SCtxUr4l5kZg3797+TLbsEnJpdXryuzIP9yhGkkunVPT2
X-Gm-Gg: AeBDieu1XYCao9FKgUWs3QYqU7b24wVuCQSo6U6MejYlLsvPFNb/EBT77wC9gKm+2Ji
	T5iTByvtt9tclDKZcPKSZ4CsdF62Pn7N5OMiTBPWBNVvtPdw411SIbOVYo16knatmpUx59VEW55
	zgM540elhUIwE7hI+GbuR25d/W+oRRrI7lHuqvXVvuf9jEHJPbM4li2wEyTD2qXiB5miPmj4azx
	hfgGNie3EC8X8Af9M7Yi3D/0hlOiVhdF58qSxG6JM3a9u+cWxkmw5x2qaLXpvHjEQSw9K3S/3jK
	BRhtwbk8dYQi8OiiKEMWwPcL907hFqHANlZoGvPoRhHDqGEMfHWpfJUf8MsZ4sZinSwX6WE7BT+
	hLdo3rX9aOUHBcG4OjeIzWGetSTbGAsb+pIEwUYfYDlcDc2KAui7wy7RvhsS3BrZOu4aMBrrY1+
	NbxJjjmSBHUPQo5JQv
X-Received: by 2002:a05:7300:72cc:b0:2be:7885:31df with SMTP id 5a478bee46e88-2e478839275mr7110407eec.17.1776668068750;
        Sun, 19 Apr 2026 23:54:28 -0700 (PDT)
X-Received: by 2002:a05:7300:72cc:b0:2be:7885:31df with SMTP id 5a478bee46e88-2e478839275mr7110381eec.17.1776668068202;
        Sun, 19 Apr 2026 23:54:28 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53a4a8018sm16314442eec.8.2026.04.19.23.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 23:54:27 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: thermal: qcom-tsens: Document Nord Temperature Sensor
Date: Mon, 20 Apr 2026 14:54:09 +0800
Message-ID: <20260420065409.1249030-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ts7FNK2LshxRwbsM6-C5bBsGHwsiv7QU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA2NSBTYWx0ZWRfXyx3+oqbNNzW4
 hFh8+XWTYcpSGZONx+kvLSZiAgJLOl7Qbsa1gQUec4klpbsA7U08GeKn/vQcdvXCwvB/ZRcFmrq
 gZsO0jzT+V8zPsD7RrhxmPkipnQIN5SuXGoCCwUse2PkW0pdvWOhRZUlZduZCl5tbYkdGpaUZx0
 CpAMNUeLzq5Ko6FVe96fm9zSe2t1OWZu0nzSqs13WjUvOi2jRIVJbyJpSMsnEyYuCdRt2BfZ3kH
 rHrFxg+SihlIWqGuERoS9L7umkxEwhc9vktgB1tHPV5+q3+oAVb/GhJMs14vmDFzdSfoAhJJnvt
 qBwknlYsmbCmnTb+DimLDbdukknTZ9dosLn9g9EeGjxnZRhnjtGCHCfFT9XiPYVKMvTBXgPQLKL
 uVH7zKbfLouZI2XfYYg+KSpDDICuTlB9gFHl7K5NK8MHiytAxzO3tXsgsv2U5e5ZZGiOVntuq83
 E2JQW1/DVP5JzOV0vuQ==
X-Proofpoint-GUID: ts7FNK2LshxRwbsM6-C5bBsGHwsiv7QU
X-Authority-Analysis: v=2.4 cv=RoX16imK c=1 sm=1 tr=0 ts=69e5cda5 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=TcyPYtoLkGytR_Rpxo8A:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200065
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103671-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 72F0B42788B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Add compatible for Temperature Sensor (TSENS) of Nord SoC with
a fallback on qcom,tsens-v2.

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index 7d34ba00e684..e65ebc6f1698 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -58,6 +58,7 @@ properties:
               - qcom,glymur-tsens
               - qcom,kaanapali-tsens
               - qcom,milos-tsens
+              - qcom,nord-tsens
               - qcom,msm8953-tsens
               - qcom,msm8996-tsens
               - qcom,msm8998-tsens
-- 
2.43.0


