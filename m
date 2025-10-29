Return-Path: <linux-arm-msm+bounces-79515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F22C1C6D8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 18:27:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32B4E9610C9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 16:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3666D355800;
	Wed, 29 Oct 2025 16:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uopo1BI+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FJwpg0qN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8149835504C
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 16:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761753683; cv=none; b=LOm/GYFEOhPw0uZcGOIzk7JSU94nKxvgnUPOI8oe5dbIivIUcYaqwDzZEqeb9NLxR/IBPQQJcAT2HScgdR4ZYwnnva/H1E/3KD5UZkpneptbApJ9bxDt6GtwaM0rpb9uqdGoDoeG5k7pzUz94cZX/8BFjFtBhE2fiWH+4KkHcMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761753683; c=relaxed/simple;
	bh=GsY8XliOywntV/lSkdR2EomMbEJYJdhySDnjPJ9zxtQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gLpfThKK0sVr16P3DG/W1asA2tWB+OEU+G4lNoLqYrAu8qhPAI17BJdHhcqWgbJ9DPOFiDP2Lu5Y8RP3pdh/rlyQstrg7PYDbBJwwsAjZkc7nM8+j3Nnqb3ysrQumcD483hME+6/GZx8unW6utzX0RiGBl9p3OrEXCjiuceDMLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uopo1BI+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FJwpg0qN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T8TXTF4135498
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 16:01:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bCQYJqybrY4
	QyIi5nJG9oiSEgsqPll1C9TpKkvG3Kps=; b=Uopo1BI+3neqkrYpdEHJZFPWU85
	BePw8Wgpkah82je0ldGoTb0qmRJzwoQYS3b51z3JmzXKU1EtpAH+qsx4XqiR69pD
	puF5HXeDH+DiJxgtPrduOy2m+xaGUvsTAbE+fQXNHH1gqE+aPl6atjso3FaexfJG
	v+p66bzeEUP7UzaXHF1j8p54hUu9J0uX+OtHv6VcUs67pqCugrpE7blw4gi0C1FC
	+UcjPiLRyJvIEP+x+XhivZHgHIMmdPy2jnDt0nIwDT4vpJH6MpjNGGyUYpZ0zCfe
	uZ/26d+sBaAAPUElQtvLhSMX8/90MIj/MCrzjEflBKWegTeOdZax+w2fFQQ==
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3ff9sc9c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 16:01:20 +0000 (GMT)
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-940e4cf730aso12483039f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 09:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761753680; x=1762358480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bCQYJqybrY4QyIi5nJG9oiSEgsqPll1C9TpKkvG3Kps=;
        b=FJwpg0qNSksm707+zIKFP41t4uFV4GrWJT4t9nl5eWg5adSHjb3joyadTlFYgkOujm
         rdrcqLE3nXdDoBUhZ7045e/0FP+09oCZ5+WP3OFPflHwxJAJDriX1MEXWa+0ZAg2+PW9
         5rtYhQgZ9dxBHvlvvwk9kT/6ZPDsrX5t8eQlUjeS1hdxdUtKDvtZXLbuuuhvmXaaUrUg
         hoOznqnX4HrUlqrW2M/g2ijonnAp/kDkaH203HKqx5iQybWIPiAxILo6C/idS1fxVL0T
         6csTKYhwhL+//dX/isCCCk1i3W65rmQxsoP5AyHCUBgjlujxIFin9gDaiMhmPVk+c5CH
         68Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761753680; x=1762358480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bCQYJqybrY4QyIi5nJG9oiSEgsqPll1C9TpKkvG3Kps=;
        b=HFVYPMDLW/CaAojTInH82XX0ajhQaHmJvAfa+egS14HxCH3KMzQvAW+9tMzPZionxP
         DKxi0r+tb48MxpIYnMzpjtT8/GXRryJyZiyZk1hY37ma7Y6wpA5DUJS/NDD9A+UIY7Uv
         m17LO1MYM/2sJEUdSKme/OM052JJFmLsg4qZlDRBm8rmY3SfnRfe0hHTtLnD8GlKLfGF
         jBsVmhresqx0wI+v/A76Zml0zN1O5ZSyFZii9lwRAMAdR3iVvvq9c/8HhWIpL1kBznLT
         cKxaYQBeMGF4FVCb7QjRzHDi+Z18wL++ae+oLi+HRi0hddNeQmA5jL8yMBTk9gpvgpMt
         ethQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjOweVReZmvmzKe9YMsGhyI7zv8MYYMhWLiU9CQZ8NxAdfQljOXK3KL2M7UPKqx4gzeCYV2FJV4RN3Q/6K@vger.kernel.org
X-Gm-Message-State: AOJu0YyoQIeJuDNautYsbwsmcMcBvZpFvFwj32jBNrRhhkvWQxscfTBh
	odrpxPyLzZACYvDHNJNjy+ld8qmv8DiMCa/8D8s4x5oF2aR/hel9f9n69ITX+0d19rf2RA0li/7
	yvO3ywVPeQnld0WQo7A+rxY+1SpuSx8h2KKjZZsX/OAdr4r5YR+BzmKXXyeoXspi30F09
X-Gm-Gg: ASbGncsTsmsjEXtd2pqdeoTIDqGPdKg98BKT05CxH442AA4baaBlBovcolBtL0i1kLx
	pFVi6Suyo5bKzTqli3HGPschSma3gQ2AARgKa1gBvZRAZPHRYPI6UkOgTS8sAkLHa4SI2SaenT9
	7h3SGi3b1JRJNoMMdomigjluOuYJeE8wFds+1olk1jbMGEY11EyVCMk31iFze1wvKnnSY1DHoJ5
	TTkntX265zXGS8tm87ocZXPgN0b0RR64f88T5b1wzsizeEj7IS2A42nZuw3oOQuD8jPxw+YI7rI
	DCwVKIFfPS8mengOYfKmVT9/MnZH+frgl1aJZSYNzbgbfpRgY5T18/jiFFmDhj77K0wIbxqDVbo
	prnc46N82JUIH
X-Received: by 2002:a05:6e02:1aa6:b0:430:c77c:cc35 with SMTP id e9e14a558f8ab-432f9086d91mr48455185ab.29.1761753679802;
        Wed, 29 Oct 2025 09:01:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjE2ILUkFn3/Lrhrza2F+LZELq3MCwWNFyOzyJeSoP67+DN5uQCi8Stu/eGsDknJ4oEUzAEg==
X-Received: by 2002:a05:6e02:1aa6:b0:430:c77c:cc35 with SMTP id e9e14a558f8ab-432f9086d91mr48453445ab.29.1761753677620;
        Wed, 29 Oct 2025 09:01:17 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e27f7b8sm57154535e9.0.2025.10.29.09.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 09:01:16 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, broonie@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, alexey.klimov@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 3/4] ASoC: dt-bindings: qcom,lpass-rx-macro: Add sm6115 LPASS RX
Date: Wed, 29 Oct 2025 16:01:00 +0000
Message-ID: <20251029160101.423209-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029160101.423209-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251029160101.423209-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: W85jEzS5ChK5AW167FFMJ9v90PFaliQ5
X-Proofpoint-GUID: W85jEzS5ChK5AW167FFMJ9v90PFaliQ5
X-Authority-Analysis: v=2.4 cv=Cf4FJbrl c=1 sm=1 tr=0 ts=69023a50 cx=c_pps
 a=x6q9Wowz3da5qcMoR2tSzg==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Y2NZmO-KPezWHx3tqIEA:9 a=TsFzuV67ciA61D7d30EA:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDEyNSBTYWx0ZWRfX+N6VNJul82p/
 HwHYRGY64xyy8whJnlBV0xZteIIqUjtUHm87/4Rnc7zgHVpljS8SZpOrOrjGmn/be+0nr5MTqtT
 lQKUpTCq+muDo8I7qkLNYAhPrr5HZ/bjOVfcmB3BMdqC7OF+grEZFO0ja/c+/mQSikmQrEjZ4JF
 7pCKEcDMuJUenFUz6AdUwFkcXXrMBJ8wjqKa4tHvzJ4avDBHuOz+N9VO8DnjY52Um6nH1WwCVGN
 HjAkt+Hmkajry8d62m6daEoRqLv3UqjoP9w8UkUpeC1jjdpl6oJDDWrhJiNsiliSkyk9yU2jGz+
 L/NZvVSxr8D2zFKj1oVfVkbP3i7kF64X2mzDl6rECB2jnyGjqjsBsgWx3v2Bg2RgNDfffVFLMob
 kdNzXEHqSShoL5Hy0lHfxkmf3iZlCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-29_06,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290125

Add bindings for Qualcomm SM6115 SoC Low Power Audio SubSystem (LPASS)
RX macro codec, which looks like compatible with SM8450.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../devicetree/bindings/sound/qcom,lpass-rx-macro.yaml        | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index b869469a5848..7f9697831918 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -25,6 +25,10 @@ properties:
               - qcom,sm8750-lpass-rx-macro
               - qcom,x1e80100-lpass-rx-macro
           - const: qcom,sm8550-lpass-rx-macro
+      - items:
+          - enum:
+            - qcom,sm6115-lpass-rx-macro
+          - const: qcom,sm8450-lpass-rx-macro
 
   reg:
     maxItems: 1
-- 
2.51.0


