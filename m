Return-Path: <linux-arm-msm+bounces-91617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNV2LxmtgWn0IQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 09:08:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E9FD601D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 09:08:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7046E301A903
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 08:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DF383939A5;
	Tue,  3 Feb 2026 08:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eBjz/uUJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hPjI5C9R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37BD37E310
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 08:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770106131; cv=none; b=CYNayHna4qvFbds3MR1mYejZawycpUCD7K7bLlhuYg1vgMGRhd+T+aXTF5X+YxiM+DbJa2LakoA9u0ixtUFMwCUxTGv8ekPiWFlgkNp/9qUEi/0a60oUC95yl9JwulJtaeKhrWexYboD7Tt//E0eg+HBThe1mpHykzkeAUxjTyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770106131; c=relaxed/simple;
	bh=Hg7CPlLaEuR8LoFGJ6BJbJDkzmP003gt/fj56vM6lhM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KIz7BcuJTX6FmGLOHc+UDuxy0X9PcSfbRCqLHuTTC5MJqv2hK//AIZVpu7zuibkNf1ilj6r+EIBKu0dNIXKPSNxmX/C7OC6kesCxKolryLFMrEX1hdbZGKY6SP2P2YyruoCK0DkAyH/QNWBEEf368DBN8hqG4WkRw929efCtKwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eBjz/uUJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hPjI5C9R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6136VH1o2261760
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 08:08:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qIUBUbFCuK7ED8zHiEvhHyphzTrSd1weKbtN3aWFc5s=; b=eBjz/uUJ/PR8UGX6
	mr3YuUOQBwBCO0wV4M1jfxBJfA5qUEAtxjpTm/ouj7kZCDshswhNQSxll9AMyLx9
	WbNiGW7TxBskDd69u94apdsm0GaM2sDRn2KgCYdfAI194BFVRNE2kRJoS7lwN2t4
	2FPbMInr/k+jS4LpeNAtpPSz4qim40N2xGQjpkNxQTi1pXJ+XzMzjULbaEPwimGt
	XiKav6SZpICEEZFkejOSM8j7qk5ZQLzig5WN9kV96bhc6fCLvArsUEaOQBO2A8v+
	tWuEk/Xd4ceHsQTpYM6W0EHADX91JD0sRAZDgUtx5+GtqN1GUW6h2vGHufRqlqKj
	Edl5XQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2tmtkfwj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 08:08:49 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a76f2d7744so52511965ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 00:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770106129; x=1770710929; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qIUBUbFCuK7ED8zHiEvhHyphzTrSd1weKbtN3aWFc5s=;
        b=hPjI5C9RrSRwakyVn+dCWfp5Anv6jiIb7iPAHoS/uK0JectYOuE/y+HQpvdR0/6NTf
         NjN7eYo5RyQh2E9NrYSlk79j7nFIK7K8YFJr2kL8CfBTE6XVUMUApRu06pS4c524NKNT
         ZDhVLSyN8OqAhFzfgVBVtQukiyONp6ByPEIZNUqeoiUdhRB+rrFcMf2xUhKzHGtDJK2a
         Qa7Rez2YgSWxsqtEMYmQ0nci/YXhmfoir5rgReqiko3wILvEK0d7nIRQr9YiAePz3t1T
         XW/nEkHSxmqwcjyU3DawTergyLxUORo+V5rsPP/L64i2zwgc2OpHNJvJRRoePSqbv8QL
         4wRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770106129; x=1770710929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qIUBUbFCuK7ED8zHiEvhHyphzTrSd1weKbtN3aWFc5s=;
        b=kc+alp309WWvn5M1Du6T+zRQQZACM8VFjLsUB+x1sWWNXQlLbaT3F8HduLrlwf5ZqL
         uIVWkNvGnpVlrbMrX139rfc1eRrdpOyvX+BMNjHFY4zneIjfOV8NlveiKCTsqGjw+ghS
         Oc4y/oLttDFTDBcLrwa+K9WkOdCcT8GHgXKgNycrIVhx3mxqXIYYIy9xEQ9+N84AAPVg
         G6/7Mao16dRqKe8c/05JXTq7y96NpKJboZqCQujD2ZVQbpqVv9gUCnngtFipzkG8HWFj
         Bi6hOdQlBBoeI7ECWAkTgKOrXrZEl+3zcaF+RizUytPEWPCOhPxjvou+ZxO3dDR49PBt
         Gv8g==
X-Forwarded-Encrypted: i=1; AJvYcCXJ/8HEywflsT/kv8u1DtNGgWDERCkN6IomfaHEUKM8X6QUiPYzpP5LgVYKyUTgClTG4waaDcb74B/UNwjr@vger.kernel.org
X-Gm-Message-State: AOJu0YyrtqbSycsf2abuqtgYEgZ84Jl+C/q9fKSvzukmR6i9m/CnRA1o
	CY4USnYrw1tuHN91A+0RBBB5daFzf9wg+wmsXPU6j/F2cPmsyeP8SJvhiCQyixpbgRASRA7Rueu
	ATcsecPa8aJJE4VTFsD/K5k6qBbDD/7SNlbhniBDHicSMUsZoZGJZRuTCPz3Es8AXGjX5
X-Gm-Gg: AZuq6aJiw1PJI594NsvYfIxEYgb0crzCsBo0V2z2xQA3/eWbsPq9o8ZsIiOQGZbaC0c
	w1nt44QqF9SVSzfqbtYZjNrkfGC43CBjuvGM60dAyKBmGYiDqKG/I7Aj73cV1useeyrURwXcqYi
	xW5zdDMPrUT4+nJJRx2HZ13/LL4yXXgh8t6rzz6WQ6GuPkq8iOFS5c0N8AtixBaDPXN0kM4e+0u
	9B114RT9fvFmMwPiXwpmnklH4ZxkQfFUB9/2LwRnuZSmhte93z/e9IfdMISWiiJWULM0ujI4LLq
	ECr4TsukpUrcM74udSALgJNN/ChzpqRBcr8LZIyBmtL47xkDqDStqWQsMFHtFk1L3/A0lcia72F
	dhw+TNtdqYJa9rVWAHsT+xJ+dWSuCsfgFFohnAIKADbJzU/BknswRc/q/ITFi22b/7V2jx95m
X-Received: by 2002:a17:902:c412:b0:295:9627:8cbd with SMTP id d9443c01a7336-2a8d8150724mr147540095ad.33.1770106128627;
        Tue, 03 Feb 2026 00:08:48 -0800 (PST)
X-Received: by 2002:a17:902:c412:b0:295:9627:8cbd with SMTP id d9443c01a7336-2a8d8150724mr147539885ad.33.1770106128161;
        Tue, 03 Feb 2026 00:08:48 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a8e512bc2asm103144485ad.100.2026.02.03.00.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 00:08:47 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 03 Feb 2026 16:08:24 +0800
Subject: [PATCH 1/3] dt-binding: document QCOM platforms for CTCU device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-enable-ctcu-and-etr-v1-1-a5371a2ec2b8@oss.qualcomm.com>
References: <20260203-enable-ctcu-and-etr-v1-0-a5371a2ec2b8@oss.qualcomm.com>
In-Reply-To: <20260203-enable-ctcu-and-etr-v1-0-a5371a2ec2b8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770106119; l=915;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=Hg7CPlLaEuR8LoFGJ6BJbJDkzmP003gt/fj56vM6lhM=;
 b=WRZ2bvUyTTm2rpmGeFEKx1/5Y4HF4BvYZpYDjG0rMqZ2Idc8R5G8oL9cV9xMGP2gygP0mejBL
 baTmZ5LN1iVB6wj8l6pRqYdqE9+yXdEcKFPAyFxZkFVHX8IPrLlNukv
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=Xb6EDY55 c=1 sm=1 tr=0 ts=6981ad11 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=K-gU5Sf5JpjFIvSPVLUA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: nFqZhWioEkLxH-SA4jXWTBjwDzwLwovB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA2NCBTYWx0ZWRfX3bt5u2jLc2gU
 SJS4a7tPM88d66Gk5ATFESgFoqS3i6p7miQQ5cRF33aen26oEpLl27RjQh8lQROZwKlIFsxManm
 Q85d85SIVt7nbxaEptXqhp6vGWj7lmgEj4MU+wkgnzGd5/03rnkKO5WbPTiNNnWZ7AseM00zm5y
 RmZLdDll4Hk+Vh2DCpyFF+ikCmzcnpoIvKdabddP58aZCu9LkuGPfVX1kBMqMUzwd3JPKPphVm+
 YLv2hK2WPjQ9Z85V/INrXwUbB1j+lP8fV+X5rh50LcG+ZpP5KHMlTfZWN0YYBQYZMKvbcBsWQ/d
 0FXARqx8hk7KVllT7X8sp9ffiBQ8LsQvwi1dJd8JabdGCnCI5aPMp87f4OcnppNw5u5p8Qi5drh
 fP4spL9dUgP+1QGghKwEmoVNznUn/J77wQKcS/O5Dq7aL1dBKwNlGvcWPGWv8rAk5NjTP8Act9X
 0+H3xAi2K3aa9NNHMew==
X-Proofpoint-GUID: nFqZhWioEkLxH-SA4jXWTBjwDzwLwovB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_02,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030064
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91617-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 54E9FD601D
X-Rspamd-Action: no action

Document the platforms that fallback to using the qcom,sa8775p-ctcu
compatible for probing.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index e002f87361ad..68853db52bef 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -29,6 +29,10 @@ properties:
     oneOf:
       - items:
           - enum:
+              - qcom,glymur-ctcu
+              - qcom,hamoa-ctcu
+              - qcom,kaanapali-ctcu
+              - qcom,pakala-ctcu
               - qcom,qcs8300-ctcu
           - const: qcom,sa8775p-ctcu
       - enum:

-- 
2.34.1


