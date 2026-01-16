Return-Path: <linux-arm-msm+bounces-89373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3BDD2FB99
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 11:43:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 231D630B9B8E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 10:41:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF80B35FF6E;
	Fri, 16 Jan 2026 10:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VNRB5hpR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b80qXuyb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5E82940D
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 10:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768560102; cv=none; b=fPFOTZo8VSFaZofCfiLz0N1kaqUWOVM7tnOsw8ocQKn1QUMn2MtkcgpZ5yOrKNETmpcdEBnKNLt7BGc8I7Hj+KuUh3+tzYJVSsm+nPnzuqrvjiXkrKFJX+FgFaRFuU1WpaboYmMsl/30FAvxi4xIEvS3+/QUFjJFZQwQXDnPbPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768560102; c=relaxed/simple;
	bh=1HUUEjHgDcWjIk9i1IbMh0KQYREmSO/89fEdC+ob1DM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bRA5At+WdRAGF/6fIP1IRrnFmcqAaO86LtASqVH7+6Rk5RpUThObGy7Mn47kQ9cI1gKXL8bdRD7Zzzne5jOWQXcFz56R/y664dY2kS7xuTc1jq7lV5H/z+bSbl/PvUqeteyKOTG/F524FpJYN65Uuy3ZpsmxWp+FnFgSiSC7BVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VNRB5hpR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b80qXuyb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G8VEvN1240876
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 10:41:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=So6nutfOYbF
	5hqF4ny0RAy4gW3NAh5oEnV9tydHlSvs=; b=VNRB5hpRcHd4RFyUX5wJ8wY2JHf
	V3xNcI+NtrqNof4oMLyAqIdIt/0qjc1JD/pAuttNJV+qsNSQ2/yWwqse2bPtjfP9
	FM+foa5/kVFgtdYOOzlauHmM7GXdUMsZiTlHFQm0JSHt6rCmKgj3LdFbX/NwccEQ
	Lq4F5i8Q0hSi+nMqMpavnGyYsKdB+QMJX91aQJ+AH+zwniuWAf4QiQ8ZXzu/8qRO
	gmWYj3VmuNX/31S1fxnl1AdobvAdX4JZ8nwWcPGOs6IZKTeA+YyQfrT621MkTQrN
	WD7qOzngYB/KAaAXpjBH6tJ3jxDQO3sdUYER6ShWXZsUk/HD5VxgQmoCWSA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq96sstme-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 10:41:40 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a13cd9a784so14810845ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 02:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768560100; x=1769164900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=So6nutfOYbF5hqF4ny0RAy4gW3NAh5oEnV9tydHlSvs=;
        b=b80qXuybk7N3/ki2FVGuzRx6Sd9eWwLHS7Rpy4JhS2GN1tDLIduISkqjotW6b1Dl9n
         vgN7GqWTzXaJxS5IOS45Bc7ZKc6C0vQkQMbHZoLUXOgctovLSCL4wdG6O02+yYfxQv+F
         C1ZzHQBoaq7CLW6gF6aiglQ0fn1NML/nYwrRXuYRdLDmSEIaU+W4zwGR/rzXOYjHYiqF
         2uXPTFoXWtcbs3UxyD3gfgpcYUmYtCgfcl5RknOhY/mpdniexIv/QdMuSFx3qt1Y347x
         H8SOSnrwTv4ToLsQ3hAHaCcqJ9WrfX78JfsmClc8Y1uoM4qRoz49e9Di1bieqCXELpFS
         NnZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768560100; x=1769164900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=So6nutfOYbF5hqF4ny0RAy4gW3NAh5oEnV9tydHlSvs=;
        b=GPandXsvD/uARgq1eiMQceywz1S3NnWaBP7Kx+ZVK652yR9RrJPFur6Z+2dPHnyp/d
         20azEefjQwYpLzlUpPLaCebLtmEB1eET/nfGi2wyZF1QDLLmYPGUUWrGwrmi59JVqvOp
         YQmewfAqVSsY5EbJG4FB4jlC4nFOAnP3mkAuqiDkfSEFjitZI+/DooaXzdOT/MS8/tbh
         uSufx+ISrRS4mLtGrzPBndpfNvEjvyn6aANusaOtVbGJIFz9DdM6xAoMrA+m0ZTE219d
         zhDn9FOm4O5uRkNsLApl0nYiOnYKACYgHulgGoTYw9Xb4AS/kG1Ed3ndywJIht0ylDKw
         iWBQ==
X-Gm-Message-State: AOJu0YylaYtegsTLKSzLb3yzi6qEyAhJyklZ8FynNOYEOsD2MCgY2YYc
	v+5jYswmzk5jPFEmbYDhfaZeG0kJNI0iv6C3zz//gECUmaf07DeiwfhOM+I/j1TloeCIWQtSuHV
	g3MYRrtRf31xJrs+xHo66mESUj+Z77Qb3k9G8HHQOerrc6TQjlBFGg955gWk0Y0arRx3/HEdH9I
	Ogiv4=
X-Gm-Gg: AY/fxX4tfhuiXn81YQPEJwPnxRM/VzUn2a7GDE2oIR/TZF9Y6LSN4iGFp2A+qaD2uic
	TFErqEhZwCuvryu183Fm8/Yx0DKSfi1SubPO/COMISbpFhS8syyPvrpXuEImnYgHPfmLjZoAjVH
	rRCwea65Ip8al9NWaBY4vR03v4diNi6tQIpf8dh4uLs23vD3pz3AFDvPnj8boAfBYR/+K8HsNIp
	E34H11TOPiEE47UWQjxdpO4ZIi0hx0T+kIW1ZlwsDXXSh3U66Y6d/qL14gy52v9jfBgjU7AAPGx
	Ynh8DpKkm6QJ1bJO1Wr7AaXvuXM9+KUB/QBQqRxMrv1Kg2EQH7RfL16VWvQPLoi4mjm+Y5wriSL
	R4mfP7Ai7hfp8OA+nNe/1Gd1eOjcS0rqDlAKLB4PvIkPwwJYZ0qpVrCcbxjhqedH79W2yE1BocY
	s=
X-Received: by 2002:a17:902:ec87:b0:2a0:f0e2:94b7 with SMTP id d9443c01a7336-2a7188fd7f2mr28644055ad.30.1768560099991;
        Fri, 16 Jan 2026 02:41:39 -0800 (PST)
X-Received: by 2002:a17:902:ec87:b0:2a0:f0e2:94b7 with SMTP id d9443c01a7336-2a7188fd7f2mr28643775ad.30.1768560099536;
        Fri, 16 Jan 2026 02:41:39 -0800 (PST)
Received: from yijiyang-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190aa340sm18009215ad.3.2026.01.16.02.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 02:41:39 -0800 (PST)
From: YijieYang <yijie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, yijie.yang@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/4] dt-bindings: arm: qcom: Document PURWA-IOT-EVK board
Date: Fri, 16 Jan 2026 18:41:27 +0800
Message-Id: <20260116104136.2922032-1-yijie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260116-purwa-v4-0-89b2adae9f09@oss.qualcomm.com>
References: <20260116-purwa-v4-0-89b2adae9f09@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: z4z7naWg1WWQxkwCveVmLTgU0uhx-gtO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA3OSBTYWx0ZWRfX7cUYb/S55gys
 vj2EJ+iRIa/ZjXxqI+8XEBGNgxfyfOV/DvlKSB0KuNjcpKmGJ5eusVPBRApYgrnpRutEsUuz5El
 fdwxm8WgvaQJphSzgzy2+xFfNkCqBBnHKhoNK7JHYiJwcc6s/lh8RK6pIP3iPQ2BoQh9U8+j0iU
 WZlZ9QQaceKLGanlGhX89/uCaE7G99iTrVO9plf9RSawYzquQuuHKJN6HAUS7g0oDoOO8Rg3bWM
 KOQxH7DosejBgsBZkncHJbNVFbrJbzjhQrBg4yFvIZ68NdnRw6lYFyLMNq0KLIlfojhlLkT/+hP
 M6TCgjijRQledhsYxVKGhzm6o7XBpiKPYpjwTKjb6wrG0cLkBZTqXkbL0GKlbo2xlEGwWPpG1kz
 8AUcJgbXp7JB3noVKbH1dlM9/jBOQsKp2Ge+t+grIEKVjvo9zFvP2Hn+ueLr1/MY63O3k5Nro1A
 QXtEtImcI0i69wEr+DA==
X-Proofpoint-GUID: z4z7naWg1WWQxkwCveVmLTgU0uhx-gtO
X-Authority-Analysis: v=2.4 cv=M9tA6iws c=1 sm=1 tr=0 ts=696a15e4 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=NXHrG6A95BBPE0CoaowA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160079

From: Yijie Yang <yijie.yang@oss.qualcomm.com>

Document the device tree bindings for the PURWA-IOT-EVK board, which
uses the Qualcomm X1P42100 SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d48c625d3fc4..59b8a4267c14 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1122,6 +1122,12 @@ properties:
           - const: microsoft,denali
           - const: qcom,x1e80100
 
+      - items:
+          - enum:
+              - qcom,purwa-iot-evk
+          - const: qcom,purwa-iot-som
+          - const: qcom,x1p42100
+
       - items:
           - enum:
               - asus,zenbook-a14-ux3407qa-lcd
-- 
2.34.1


