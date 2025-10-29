Return-Path: <linux-arm-msm+bounces-79364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B0BC18E5C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 09:14:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B1691C688A2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 08:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F4E831770B;
	Wed, 29 Oct 2025 08:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AGJDmc9D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bBMXCBlY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419CA315785
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 08:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761725157; cv=none; b=dWS9tYfhITMRQhwlXh/blfzCS4ShPmtJ9eLDqe0Lr67j/uXJxUSb1Ac14lAVSbTIF6H9IvZZ9uh5bNFPzPtXoSfKCqbl1cOSjwpcz5tOzgMc4VLQ73vD44WHPsHhsZLWpVU0HqtfxpWcvVNxTcVyM4QsqN251gH4afI+GfoqV8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761725157; c=relaxed/simple;
	bh=wSsC/m90UcMlRas3mHaUoFTcsLJkym6KsxiJChRWUvo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rd3xLVGSaNFJ33OMKeONvCeqQM1CdxtG3UB7h6OcmWjmJq0kS887EKRDTy3u2wGHnikaYldhJHQ7VaIfx2zzrM+f1+QDoYXEzWph9pdAoOnksF1mxrK1S/PiNN0WjLXbFKsNnNf1YtawfeOmmZqM9hZhoelhM3p9171t5haqeHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AGJDmc9D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bBMXCBlY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4v6ej3755069
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 08:05:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WyCMuRsQwYryKroqDg3C2kFC0X1+TeXJPv9gZBeQfSs=; b=AGJDmc9DJHmTpVc2
	WvYAMcxQwEbia0qNhbRMuVUsQVult2FUHNENsrpIrTErBHOfZI5fyixNsFn7ZpnX
	FF2Ek6JAgi1uIxM61r8lXJnzAPRbOJMeOCBVoxEllO8WoYevoiz7dW4VxGjMKFov
	PtZfXyX1y0qAuvJvOe0XuqCDNjcfrUUBgbZFyMq/pGCmR6FHm8wWnuTnARhUGdpA
	sdyeCC7Cf9qBlHVZcoIHk/9Ig9ANwuCBrQmwCPtwgcPpYqHl5f8QZeVhPsVnwxH+
	SWNkJZtJ5dQIYRsslnVhyzw/TSGUufS8L3/YSe0AvxlaYSTNIgbML937acmmelKH
	a5nlLw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a01qr3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 08:05:54 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-286a252bfbfso165579905ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 01:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761725153; x=1762329953; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WyCMuRsQwYryKroqDg3C2kFC0X1+TeXJPv9gZBeQfSs=;
        b=bBMXCBlYvzIhmNJ6ZXmQ12u6vTC7WCsXbFswnmX8CQR+5EQVGCPO6N2SlN/4yPiVwk
         8BQm1FWyWvN97sHuir2TCIQDzLX071xfNkQUwMwovLcqzymkTZkrX1AAphTBm0hGzzV7
         Y5X5Z0LK0cTDQbJzG2dg21Zc3SNRYj+ye1tJKPzHo3bAVCT7hihhJE3k1cXPQDpJY1Zf
         wJIXMKxyh5j317QwQFJ9IQGZMs8JgFUP0KXxCBWAIqpMTnyVfCIUM65dZM0PVjMRv/OI
         xuUpa7PSv+PQNmFzrOblpuA4U3srxSWkmqDLx1Jw/GhntRjwyxzEZbEiR1UyaGt64Qku
         +T2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761725153; x=1762329953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WyCMuRsQwYryKroqDg3C2kFC0X1+TeXJPv9gZBeQfSs=;
        b=ixFl2aOGQPAkjYddpEKKvGh3kFAM/76pQuPE+8aAl8octsDbbUkN0CkQEwORbF7qCv
         lXpWsXhF84wm47GHE6R3OFSbcMeSwDHzFTW9Ze/rBrhZPy7Lj2rLLqZ6ptzHvweobugZ
         ipT94MvcWZ7glKNjxJ9ShyFNMaqbsMoAg09RTKe2KfepdIstosLEiW/6Z3VTrVO2x+xS
         7QGtNHGk4NxBt53hDlOI7VmI/ef6gYU42eABL3xAaMLHOXRbN0tqSKljH7c10t/2FW+a
         lpXYY7k58F5UaomXJ5voDUfx4eBn8vc4Q9lUiKjz7cMN8DxwqMKDx8St+IvSBpESNSIM
         GjUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrFsnT2w+Cl2S+yu+RqXqFPno1BXBnzcUbiELtdc3zph3knTnAnya0fnO2afqe0adS1ps58ZEXCCZ9tJP9@vger.kernel.org
X-Gm-Message-State: AOJu0YxQMwrAzg+zqIkRztAJ4SA/fM+fQpDv8SkfVxOoKXEUClzkdJoL
	8rt5dOgyEgOUemHm2yD7lFs4FEhSUVl/Jo8Yumg1Ifp0b+tkydzGoLgAzyRnlQxUj0TgzfPSgiq
	mkFgehO8tLG6c5gOFq+IYOqrjLS4SVS2+I02HLiAaCTjzs4kiVq7EFd0BSkf/3TLbANVP
X-Gm-Gg: ASbGncuDuR3PCdw8joy7QeJ/aiVP/IuSFgJ9uZ2X015Fljh+aZ9gEoXp/X3ee5PnzRL
	TOe+s5qr5SMy9JnYCGkzm6RvkQTpNZ/Ddygep1It4UP7VCNaM6F05DPQAQ5pwALeDmk6ValBD0q
	IgjJSQPJEaerKIG9un2MpheI2EiDDolLx36eMWXptuvjcRA6ElZOiWC1ugvwgDxtW9inR1JLqw0
	ddzEQ6FtXvHKekIaolt9YJFZa2pFBQxGrZJyNAt2zVsA5OZvWTn1qVSrKRUmW3S+3vIakma2X5N
	f9H3h8oIJZX7Iv/YvZpwmp5iSq8mzKNpw559E/YFLvZWTgcqB210TgYTlyaFYZxroBERVc7HEkA
	BH34tXwsRjhrqaVOE/bRfBxmmeYsOoykrQCVT9AuOvLFsXT8dVQ==
X-Received: by 2002:a17:902:d4c6:b0:24b:270e:56c7 with SMTP id d9443c01a7336-294dedfa77emr25415055ad.7.1761725153397;
        Wed, 29 Oct 2025 01:05:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAY5y1XPZmwwX/bye2S8cDKGJs6HaLWTblBH69Q2eN1bFSJbsrs9FLTLCUpKeXfl4vf2jwhQ==
X-Received: by 2002:a17:902:d4c6:b0:24b:270e:56c7 with SMTP id d9443c01a7336-294dedfa77emr25414645ad.7.1761725152784;
        Wed, 29 Oct 2025 01:05:52 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498f0be0esm141754705ad.96.2025.10.29.01.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 01:05:52 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 01:05:44 -0700
Subject: [PATCH v2 6/7] dt-bindings: remoteproc: qcom,sm8550-pas: Document
 Glymur ADSP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-knp-remoteproc-v2-6-6c81993b52ea@oss.qualcomm.com>
References: <20251029-knp-remoteproc-v2-0-6c81993b52ea@oss.qualcomm.com>
In-Reply-To: <20251029-knp-remoteproc-v2-0-6c81993b52ea@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761725143; l=1709;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=MbjJGjYI2p6gxBQQC0Iy4v/3D5XLYqqgbONuf+0Bivc=;
 b=mIqI2Fn3tZsYy5tef004AeqHk+HfppmB5mX2ylArmDyyZkhg29XijEm/2juY+QDwt2wdGs4tk
 6kjJUm5xiNgB+q8TfsGi8xaA3kcUnMlJvRX4wMNtB+uKlAhvCf6/d/t
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA1OCBTYWx0ZWRfXyAIC0dDFVNT8
 /D1PnhF8ja0x72tpkiyXY/G3tWE5ilCamaydoMgtqQeJItRkxqIeNO6ihtHeoIoeD/aMnS2MQ88
 nqyQDs9/PGfyB+7v9AmMl8CScmvZrwX8G6kHnT3VLujVekRqyBBME7xY30yl4czgT+60sEonYSS
 ViFfOCfin4H988EID0oVjGhdIDTIJWnO7SrQBGsK9u8iv0gbC8iAlswpCQFAHoIH9qbs0/TLCcX
 L75VaKpKUU+8xGLaCrc9ZycCiW9f2geR01OU1AZNHJ7315PRsB+6ZB+kWUkDsnHgksDFrwkhwVn
 E4d/9XPpHgqAWzHHZsVOk33PL3cQhPyrIXgcMwRCoI4NPAGT/1PyT6p2rw1cPxXOnMNy1B9UQnZ
 71oQ6Rn1sDZNh8AHhpeIA1v/PhX78w==
X-Proofpoint-GUID: U1KS7ltD3xVw0ZTiXSKEwMJlBuVCREtz
X-Proofpoint-ORIG-GUID: U1KS7ltD3xVw0ZTiXSKEwMJlBuVCREtz
X-Authority-Analysis: v=2.4 cv=epXSD4pX c=1 sm=1 tr=0 ts=6901cae2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=JsIBf0UYXXKOit1WgS4A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290058

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Document compatible for Qualcomm Glymur SoC ADSP which is fully compatible
with SM8750 ADSP. Also with the Linux Host running on EL2, the remoteprocs
need to be hypervisor independent, the iommu property is mandatory to
ensure proper functionality.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml     | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 3b66bd106737..8cb839ba1058 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -29,6 +29,7 @@ properties:
           - qcom,x1e80100-cdsp-pas
       - items:
           - enum:
+              - qcom,glymur-adsp-pas
               - qcom,kaanapali-adsp-pas
               - qcom,sm8750-adsp-pas
           - const: qcom,sm8550-adsp-pas
@@ -101,6 +102,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-adsp-pas
               - qcom,kaanapali-adsp-pas
               - qcom,kaanapali-cdsp-pas
               - qcom,sm8750-adsp-pas
@@ -247,6 +249,17 @@ allOf:
             - const: mxc
             - const: nsp
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,glymur-adsp-pas
+    then:
+      properties:
+        iommus:
+          maxItems: 1
+
 unevaluatedProperties: false
 
 examples:

-- 
2.25.1


