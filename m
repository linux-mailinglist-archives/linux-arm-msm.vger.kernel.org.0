Return-Path: <linux-arm-msm+bounces-86348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E83CD9655
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 14:05:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 92804300F303
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 13:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E13E33AD89;
	Tue, 23 Dec 2025 13:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L6SzWhBU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kGq5f2x9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9231DBA34
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 13:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766495147; cv=none; b=U3WgZED8rT7/iRaTu4Jz2fuWQt09QDoY2IbEOgwq+A8CvvxgofJnd/rFU5op//qr9WfMA044Wxfy4exyZiPStc1mgXTIEIZ0LP48ZYbLbaJZx4dnDFfZPvnRBCeOCpRNp1jVdOOC0gWpHZJqsZBstSxLm9PMzVG1L4SWTzVWYQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766495147; c=relaxed/simple;
	bh=Xr7G7pYRE20ZJueDKTaHR+eC61pXNDkKc3pI94WDNzg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C2XLP+CzepYWyMdwV9hbldUYduBL2h/ySv5rgngC5Jx/T3FnvaaH5nLBlMXxu/yds7fickk9idxtRDkUuWGdoK44J+AMZNNW0C30XpvxKBZ+QaAQ+HrIwuOk16dE8z4VwGk1yE4hg6QF7gJbC7Qvb4tmXclWx0Sg1upmgLhyhrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L6SzWhBU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kGq5f2x9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN76fTB1631206
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 13:05:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jaOC+x0+1SoBwA6HvslEpsQ6NuB4uyFz3cj
	n9JQGZdY=; b=L6SzWhBUqXgAMJDN+1Wo7INS8oyFI3CanfkVZP29ULY8Whvh0oi
	z28auIJ20uKwNW05SicbBSetEspKKXed4uWc/gB/fh3hZ98NVBrxNQeG/jY6PkKi
	JT8gndp3DDkppW/fkixdbLRBLrRMtT3/LF3bw87mmMenpCBKarRREsvXezVsWbj1
	vf1pmcLsr61Pekuo9YjT64Xb/nF/J5dM3CqwN7R4AgDAgQ0fobFBl0IxPdWbkz/M
	RIIAEu8vIxmHjTe62MqXClRNd5AWxiFsx57UR112DoR7KmMh1MU5UJplQafHmRDT
	ulEdFtFHM152qQO1i64PgUOkU9kgbxRYvJw==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7ck8jsvb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 13:05:45 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7880bda8e5aso71804687b3.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 05:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766495145; x=1767099945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jaOC+x0+1SoBwA6HvslEpsQ6NuB4uyFz3cjn9JQGZdY=;
        b=kGq5f2x9I+IHCiV83DLps0HjuO/DQaS03oodmlEtVx44pZqtkW3GPCcKio4hsxIcHL
         mxtB494ds90z0uFm+MZWgm1KZ5WTn1HRG7fiHg0gOD9/aGhYSvHyMNdmqWYnFRkk3QYf
         xP7Rf+BFu0xNJ0UYBZAy3jE8g+Z9rjqo9mvpJRIhx3gNZoR7tSzTX20pyq1q+qdOXmtY
         eWRoib7eWW8l+XoVFZ05zqZixwCAKziVZcH8Y12lrPGKUkF3i4i+N2aQrBXWc7Q4zE64
         1iNQn7KDrVUwrQte3j+xkP2NqRhVo5SnCwyZ9Jb0sAEN309V35XsMJDgZ/3DrhDj5dwM
         uRLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766495145; x=1767099945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jaOC+x0+1SoBwA6HvslEpsQ6NuB4uyFz3cjn9JQGZdY=;
        b=A9hvisIMCBL57mdrgta130J31ELohzcufN4rLQlIw/wJ0LcjNO6B/EO53Q+74rc3mm
         AXThSHjIgwSzsz7DU6edUmCXWANHmtZfyl4ATxhHcp0NTP/nD6e5Ckr6t4kRz3KVPbZx
         av1xxtqzhwSCyIcqdziG7FCKgDDoSojn4fW3wRNNGbcqs4mJzPwwnk7xdTcC6W9MQgfg
         KVxbF8Mcf/KY8KXgUkJ8izMJBOgYRjpwaTWT1ncAQELZTn6+OgW3oo1gPQAttOhUNWyd
         n1mbvOWmF77lb2dIBlfFXvMGlWSIvYfEuPrbpifs5I7RB9eAYt5WtGf7Jjq+7zTpvxOI
         eIvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVT0ys/289/iv0ByMxAHF2/snNn/Hs3uiLdI3SmTXcrKrs6MDcNMOmd1nt3+rlxPquXzpKAJzXv2QoYHwI@vger.kernel.org
X-Gm-Message-State: AOJu0YyBdtveBM168IaS44Tno1tOXB924nSo4QM5Ma67iPx7pxAmb8TS
	8ISRdCc3xg+yO4K7Z0/vF9W+bPLpu4VSbe/0DjB6/ORPmG27kYf34jCEnxm47LFOqMzhNblXk5Z
	TlkIcIaJ6d7fTFOuJJyAC+Qos1cniK2W6fB5TrYtxBisAAZB6dyVXp/jkRkpIz+JdaZed
X-Gm-Gg: AY/fxX6Y0FNO6TsoIYbOO3dAjuiQ6H2kcg86Tn5KFGT/2zJ3OGg0vkTp3d8KgAUABwu
	dPIgwiCAo65oxKlGAk3CjGCtu5oUqx5DShRP0RqpgtX6YvUx3/kHnz8d3m5TYfJ70BM4MrOMpSk
	4Yxv5ofZ5D1PW0eAg15B4Mdd65qtCAt2k2Y7FuI9ngBFBG3WY4mhPEgXoLSmjIRCnvpgAEOaHh/
	9UyrFjaE6IUvnmn6hSvpUsf40auNZvuDQEIchED+bsr4pERd6F23c50uYUFEcg6TAehuPX2LhnG
	Nki4TZO09DmAk/DrYWE+m4f8hIIIAoArp+Kvn7l3zDCh3W/ACW4srGsoI4XmVNwvBOqe5OdqrRO
	QE0JsvO60QRo4F9vR6tLWYIdZUz5lWB0/8uhvDtA44EaXcWmBjLTUoUwk6OAgXunvgGM=
X-Received: by 2002:a05:690c:4d89:b0:78d:e514:8d55 with SMTP id 00721157ae682-78fb41cceacmr125076667b3.61.1766495144803;
        Tue, 23 Dec 2025 05:05:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGgLKb8TMcOXpwcZvru9oCMvArWZC3DWOOfqkMlVYh1yhW3lIQiET6GBPM7x1qJz1GAk9zCIA==
X-Received: by 2002:a05:690c:4d89:b0:78d:e514:8d55 with SMTP id 00721157ae682-78fb41cceacmr125076427b3.61.1766495144420;
        Tue, 23 Dec 2025 05:05:44 -0800 (PST)
Received: from quoll.home (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037a604f5sm1423882566b.11.2025.12.23.05.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 05:05:43 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: remoteproc: qcom,sm8550-pas: Drop SM8750 ADSP from if-branch
Date: Tue, 23 Dec 2025 14:05:34 +0100
Message-ID: <20251223130533.58468-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1033; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Xr7G7pYRE20ZJueDKTaHR+eC61pXNDkKc3pI94WDNzg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpSpOdSQFbuhPowXjznp7pS5IG/enSUqQgYcPXb
 xg0ljcz/huJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUqTnQAKCRDBN2bmhouD
 17TjD/9XYe1pL4OHHua8ltJqELoeIPkErjg9ZQ75Y3H2imqUKL25B/WBDm8EKPvR7X0cd+r6YLe
 YiZ/pSdrP3KV0dsf8MmPjK70uaW89NKf7dNmIN/0qdBwr3JLI0OxUdqMrpL4IVxIeRDmvYKq97w
 AeqjXN/zGI4gbU6wwNH/wlplIwQuLD9TWRxzJNYWh5WeJtoqm/H/jXT5yIDTDxv0xktdxQVzCUP
 +jzKwWjB7JSZ10ScsxgEhUSXeMWgFEKuZA6n86oR874gfp9F8x+GcNFtj52QepV4lJC1snocT1h
 cUpMOHTHmp1sUjgKNLT3MjR0b20CgXLNZKf6P1sYPJpeNgwtIkNvfA22dwlwp6ucL3yRRyFqa3w
 4IWNfRg99S2TClMIxF4QK1otcl23915Zyz6EThw47FwtbvfLB9nw8V7RaXIhdzFScR9i6J9GZJb
 FJhPxPaTfiVNph5+zj12nn4aYU6DFZrs+2fnE4yYORYagQKxi5ciJ0a9XFPntSie+N3dFzCiKhI
 ai7MSZIu3Usyb2PJV8CggEQOpHthr99WSKMb9ThUp3dv53pQpIgELAmbRiFjhEI/+N7s2nZ3+vL
 0B0um5wzHXnhg7XeuJCd7nr1bziM7ONtdhuPDnOgg5zvNaf4NyX1QkAIWhSOcWmdFyfiW0T6BIh V07EjXXcyoJWVwg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: fGokr0UwgntuiEnuEmtyGVQT4RWR9oY1
X-Proofpoint-GUID: fGokr0UwgntuiEnuEmtyGVQT4RWR9oY1
X-Authority-Analysis: v=2.4 cv=asi/yCZV c=1 sm=1 tr=0 ts=694a93a9 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=SL6rUWVmExZ46PbHItoA:9 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDEwNyBTYWx0ZWRfX+POGAyPGqBwk
 yrx6QVI0Nph8/tZS0yzD5n8jycRqEAaL0FIZVdj5yzmYPY9lAKr5Y3/uijZMygGQMWbx3ZyrPwv
 aKmXz8R5SBJ0suPcjporZBl+QlCSkHfyqCQI3A/2L6dCJ0b34FYdP+o/LxyazJrp5JVMG6HrE/+
 yjbPrD1ezcIf3BWxJVlwv2Scak9T+Ls8V9uJyqcZ0d822HDHNhv4RmP3BTcE0qhuuzGDVCJBh5W
 zaZ7+yP4nwiRlgAkyUWTLVTOAbc8mkMAzKeymvV7GXnM5lHe3BtZ0F9TFGh8fFIJFacFrfnqkCi
 IGUcDWbQRcKyPoDEOg80OHhKF0MDudZUoKDW0ce4PdYg9OdsAKRsLBg0WVn9XrYWQyHtQlx44PR
 QnNZPl9z3mMjTzCb1G8s2tFNnMmRYOgUa8/4/bxb5qp+2Fl2HuC+E2qc4j91E9gahflOvAAuys5
 vo55VLygefEHqwGPltw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230107

The binding for SM8750 ADSP PAS uses SM8550 ADSP as fallback, thus
"if:then:" block with "contains:" and the fallback does not need to
mention qcom,sm8750-adsp-pas.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml          | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 2dd479cf4821..11b056d6a480 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -185,11 +185,10 @@ allOf:
         compatible:
           contains:
             enum:
               - qcom,sm8550-adsp-pas
               - qcom,sm8650-adsp-pas
-              - qcom,sm8750-adsp-pas
               - qcom,x1e80100-adsp-pas
     then:
       properties:
         power-domains:
           items:
-- 
2.51.0


