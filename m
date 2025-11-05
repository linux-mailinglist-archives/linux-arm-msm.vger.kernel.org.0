Return-Path: <linux-arm-msm+bounces-80468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA0BC36CD1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 17:51:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CB5D189A276
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 16:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21630334397;
	Wed,  5 Nov 2025 16:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="We2S4wmO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O01TtpRM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627733385A6
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Nov 2025 16:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762361178; cv=none; b=g+UPbjfBgIE+OSBeTxAIkDgYepOSEbKI+qPIk4CUoRroAi9f9blJkMrA/HfCfFl7hkfIkjPT16hwScvjnySus+3JW7ehVbpfWd4eTU0LSebv4wHZ6LSUNt1nM5KH6Ae4AMiePxSiaVOtWBREm9U4QBSyEmNAIY65/pZiCAWCzjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762361178; c=relaxed/simple;
	bh=CSOgdQpc0lMePHubTaI8zKt7XuYIPcsGjD7SJ+d1YnY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AuOZzedsAvyQ1omghmxRxAIVtPnjWZAbZPep0VmE10KfVN0TTDlrfJXT54LTmM/BH533YCIEuPTKqxx+/uiMRnh7Z9KAfLc1aHgrJm5kn/hfHql8mCuy8P+D+zE+LG6xFuOPxv3NwylmkwQJ3zZ1wjtz3+djeeuqmVQ/n950VFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=We2S4wmO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O01TtpRM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A5DbSVs4011388
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Nov 2025 16:46:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V0NNfdE3hYTw3zNUDaf9Tkr9rvcnD4dKnWyPzOQRNqA=; b=We2S4wmOLyuO1nHH
	rRTzXzsQ0dFfXANFMEu8iGnKmhNm2oE616DBj3v3aCGlvbiYW9J2KTkWVN8Z2wKM
	ruW7IWzMG4AdH7m3znPgYiDHvwg3/5L3akRs6IJUXJn22vHaFE59yHtS+0DHZVMO
	NugzL9PqaCoXhXizTTGVs5/GJpxwt5KfCUMkqCqcqNIzgax3DbWtc04X+23pIloz
	NnalIx3qCMW26nytLWWck0+rr+N0JycPwuqrqYBgVJMNh6tKo4EC5WphkBlxKDZs
	PtrqDw4kvrkadaw+qnwKayn0ZvJPBEoSCc5F1FtIHEbaNlo0bJM0y2b814WSF78z
	X2L43A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7ynwswwd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 16:46:15 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-341661973daso61890a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 08:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762361174; x=1762965974; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V0NNfdE3hYTw3zNUDaf9Tkr9rvcnD4dKnWyPzOQRNqA=;
        b=O01TtpRMovFxkGkCstjrnZbKxP1Yjz6cmjho6O9dnMb8YxhQb7lVIzSzDkONN1r200
         rEzf3Lxf0sFLfVIHW3Fjvxah/zEjZouwrrZz2T6oIz5Pwp24rU44Dw2RsPrsCxwAnBj/
         z3rBKx2TC5F2p8NY+os0VnVvNUALAhji7ubNZJUbs991O4RSAO/YnFgTO9JIjCBlIuuy
         ALdOa+GmBkymxSL1Hq6JfJqUxvKJFeglzuMqyYSgRot15W5tcY/oN/ZrrUNZVz24vfdB
         oLPsPILWK3+rzk6HWQObUwUuabIt4GXpNMWs5cqHGrDOJ3NCF3WYoLq3Uga0eb0NVPIA
         qNFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762361174; x=1762965974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V0NNfdE3hYTw3zNUDaf9Tkr9rvcnD4dKnWyPzOQRNqA=;
        b=JCKOFRcpNI7zotgNMHk+qkLonP0i3ErhMjsL9xf+f5ac97XB84Y/YbQzlhiIJbUwka
         zP6qGFfv4BuTTmg95BBbKlrI/ShK21kBHzjpcer6/nxC3jSu3MXmbHqyWigueYAjvAMP
         GKY+bWa+MixPs4yyDVWZ3f+bqJ5ckajSN26p3yzZf8s3slS4d21fjK7O6gixMpfXdDZg
         vJ2dpZaKCRD0M+wagwpKJNDa1iPc8jIzIEbmzpXy+puHco7g/wENmTZ2OS1qAjlZ4aMN
         G082PXCdhYovBip4wCrGaD6S3Z7xJqpbgF9kgid1kRFnRmXPmvH3rUEEUGaC1UFy6qzi
         qJNA==
X-Forwarded-Encrypted: i=1; AJvYcCXZ07/O04tBNNd/NangiKTte2B4sN65tjqfSogI6oqtrkw1wa08nuFlxnm1t/BDkw8l8MDu5qaNZqGQKruq@vger.kernel.org
X-Gm-Message-State: AOJu0YyzB6HKhm81qVmaApxtsYKjnnmI5gITJhQFRFEXPmCKG1SHjeS8
	lBde3weFl93R2jAx5Ga6WAUY1cekTqUni6GDnieEbyuTmfeMCZTz9jcrwh9HDtp9qUw19uH3EfM
	FgM+74kAs3GbSTEJEJY9E3Y/xWEcArGLvyQHftK8dRkqW9UVU2NDzxzWjdm3NEvoRDuxk
X-Gm-Gg: ASbGncvhjSk8G3Ykd1xxnzUV0WAiLHzqHdzvAs0EZj52I1zHvTKvlkHdFXVMzojTBkU
	tEigMSYKyWZcX4VfhOSJN8ClOZNt4IIk8EA8d/d7M4jSCw21O66r1yN1nCjBpORWvoUZpWUz+rd
	GsyvoKwTrte9DEPYiP9Owlcfrw6hRickhXbxcErPAKeYJye6Uy4YxW75ZZp8tf85s3xl2b8S6B5
	1v0z+WjwU/gt1RmOEN9rhP+wXcEisLOlVsGf/gQQcCO0FVID1HwOQnOpzleU1np2RR27NJ/KFpf
	3PORgKfg+EZVpkaaK33LPxhhyqwVk1mpWfb3X2U4SoP9yj/WN3NK2JYWc7hC2WT1tKHDpaUh0hO
	bn0WZZU/tv/1fg+wJlQMuBXQ=
X-Received: by 2002:a17:90b:274e:b0:33e:2d0f:4793 with SMTP id 98e67ed59e1d1-341a6c2dd89mr5133558a91.11.1762361174251;
        Wed, 05 Nov 2025 08:46:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IExDXPdqPDT2NkdJ7fX7iWKr2pf+irb2Zq0hx+Byc3+KFA1DEVgM9hn1fe4HmX+JkqxfTmWJw==
X-Received: by 2002:a17:90b:274e:b0:33e:2d0f:4793 with SMTP id 98e67ed59e1d1-341a6c2dd89mr5133518a91.11.1762361173752;
        Wed, 05 Nov 2025 08:46:13 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a68c822dsm3426249a91.8.2025.11.05.08.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 08:46:13 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 05 Nov 2025 22:15:45 +0530
Subject: [PATCH v7 1/5] dt-bindings: nvmem: qfprom: Add sa8775p compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251105-a663-gpu-support-v7-1-1bcf7f151125@oss.qualcomm.com>
References: <20251105-a663-gpu-support-v7-0-1bcf7f151125@oss.qualcomm.com>
In-Reply-To: <20251105-a663-gpu-support-v7-0-1bcf7f151125@oss.qualcomm.com>
To: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Connor Abbott <cwabbott0@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762361159; l=998;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=CSOgdQpc0lMePHubTaI8zKt7XuYIPcsGjD7SJ+d1YnY=;
 b=i1IXdpI+2THuQXFa8wLghoNr7UkEvIZ+HYFBfmuX0sPOdoo24L21KRdyc21kfonQ2ky812AeR
 7Q+ZR+DzxwSADT8vgD11jIiqgJfy4qZSSfcOGwkSN4fE6qUFppbBcpE
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDEyOSBTYWx0ZWRfX6TAs44kAl/2w
 KyKDtB2g5UvYdoQ0C0cUVgymlX2XwwUYAiegeEJcjaSdv3cBKgr89tvuIi4NrGbvbY7USq/eFm9
 ul3ItzmTFkqVQ3o8JZRcE2Rx9TQsvLx1W3/CZ4PQhGquwWUVPchg4YYHIJE4lOiwUCLQKRluIWV
 tix2nsHUOUA/zRAKAynkK6NQlMLX2V8C/E7zbJIQAfbvLVMS0lwdglSXDFPYZ5Q08kZyR3cuanu
 9tJPgrxXYhR2Uwi9Tv96k8eYh0/0EsqavsxteL/pAIM9Ih04TsXuYuTP3qUwDCfPmUw3sIJKW2j
 DiwvGlGmeTaa9oeVZb+fo7z9MkQglAzTP8Tx5LbsaWQXyeQlH70EaulkKibr4AxUNPL4VjOub88
 upYNsP+0ndSqRGjDNMXaI7Zho1XKRQ==
X-Proofpoint-ORIG-GUID: v3hTYu7BQF4U6_ZHsocUhQ2Bq4Z0WCwA
X-Proofpoint-GUID: v3hTYu7BQF4U6_ZHsocUhQ2Bq4Z0WCwA
X-Authority-Analysis: v=2.4 cv=IpETsb/g c=1 sm=1 tr=0 ts=690b7f57 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=TNpnUgr77EDisZP18eEA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050129

Document compatible string for the QFPROM on Lemans platform.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index 3f6dc6a3a9f1adc582a28cf71414b0e9d08629ed..7d1612acca48d24c3b54c4d25fa8a210176d3bb5 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -39,6 +39,7 @@ properties:
           - qcom,qcs404-qfprom
           - qcom,qcs615-qfprom
           - qcom,qcs8300-qfprom
+          - qcom,sa8775p-qfprom
           - qcom,sar2130p-qfprom
           - qcom,sc7180-qfprom
           - qcom,sc7280-qfprom

-- 
2.51.0


