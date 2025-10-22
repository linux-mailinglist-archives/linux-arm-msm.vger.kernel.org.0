Return-Path: <linux-arm-msm+bounces-78281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B286BFA8C7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 09:29:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 576704EA16B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 07:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5EB02F7ADE;
	Wed, 22 Oct 2025 07:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WJkSjQyn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8996D2F90C4
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 07:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761118143; cv=none; b=D3mciQVVyI7yMlFsdgfuqSk+TlKLkwadeKoPkNF1E+FN9nJqvDFLuDpR4PZt2bxBhZ/10X6tny53wrRqlaW7VPNkSq5nd/JYkGBdmui2zbB5an9jBJgVZOhrrz2tjt4cHprp/VyMYKbwcP1Dae9GpoLyTG75orPJzwqE1bwsm4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761118143; c=relaxed/simple;
	bh=d6LoZRVEAeqEPQShLGGsaUfprEVuMtrCJ2M3G5JH1Ys=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IfYDLNNMudHPoUcyOm8HeWvxxmF+U2LXXN2ROD0mEis8dI/d4dvwu7Y4/EGTcNPv0sR9fzKXYkcBKjxXJybTX72A1dGdRToxhyvzpORpJN88Zrr2vow2wpBmHMd5eClX/GpuVvC1Sv/eyYg4khC+0E4wnuTlJpe/GzyklZGcOnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WJkSjQyn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M24UMw020187
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 07:29:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1vYcux79sr7GRCh2xTNc3z2z/N537ViNEGo9Mt+EsHo=; b=WJkSjQynnCMVHOlv
	LZXwnT5nQhLdVfJI5EUFKZvs8UNAkWV7UIyItyHw15jbvLq1vuPqiSlRSYD454uh
	U8cowu528qvmSSZHCqNyn12PCeKOjhexcNpoqW0SoyIlFIBUuFyLTj9yGm+ulf4Q
	/ccVQtQBDQIFwhgUAFdcY2m/Te5+iVDgvtUI2q0Cj236KkF8jq65W97ePMuDuVHv
	T7Lg3qffTeQVfP7HQF5f/3/jPJlbtta2dW4PHMDJIyFVJHfoBd7COy/hXd9x6jKD
	rccUKjCw2xRtMZ6lgUHdRpnlyiUI2/vOCZRMVjHGmLkJ2k+Th4AaJE2A9Tim0k1V
	D+noKA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3443pq7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 07:29:00 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-33bbbb41a84so2426902a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 00:29:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761118140; x=1761722940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1vYcux79sr7GRCh2xTNc3z2z/N537ViNEGo9Mt+EsHo=;
        b=UGzCcrwvcQmQUWv1tXxAvAErrhTgwdFFkrxSCxO9aNcjXzRA0Fhe2xd3XZlDH/k4xf
         kM+Eb/y431vRsb+e/uohOWE7hF0ai1PDxz58fvPzy7AW0mlGIfkqeJMYmHrH+Pg88QUv
         u9zzt/oaHsuXO1o23V6JVs3x2UAT9tbmaGiu0rqXde4T6xPZ0xf8iGeWJGcQq/7AeDm0
         iRR51xxMqyt3sX/3C/BSJ63WiZeK7cVE1+j6czAP0rqQzIhbZpWrFx3dmFITYy17s36P
         r8w73RwWLkb5ryB8PUOuF+QZIcBNDuZB+2wmHuwphh/0bngsKuJFyNKgbrOE/UcDD0Fu
         zIPQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2m2oxNd85zITs93J1CfNgla79adpQu4iDsUroNbZ+RttJchhuSHoi4JlJlITdbrdIw3pWRg23SoNfVnXR@vger.kernel.org
X-Gm-Message-State: AOJu0YwgIx8tqvykBFTrExcS2ODi+m8YHYzrCPW8HXHRq2rROLeVNOUQ
	vOq/FrHG2X4h2r3wYxA09RBTALGDGTZRE2BOnf61UUGQGSe00NDFHqgXCm6G9tBK4OSab3aoCrL
	m6m+YoZ9KNJMypGSUWqjDlTdDlgldFi+RpOXkhsODuiD6JYWhNh58PfP4wN/++AntQ6Hm
X-Gm-Gg: ASbGncsk4kYO0dadUhbBAOmoi6oqvJqcRAQmMuCrhAFAup92eYQWGGJMUCyNJpg1H9q
	12rT9ZZpqZAlwYoKP+g9pa2+X2sPnnfPeFbuVcaXUVB/ADmQVhwBRk1kmvJ/JPcQi3kwzByJSg9
	LKdv8GuDSWCpR/ncm/alwZdCOoH2/SFsC/bmRYzv9cP2KrzYyNMxVyTBp1FzU5epnh9x/wnYUgK
	ClTzYV35giKFJ7PITe3a0KC7gzP9FuaX9rpH0LJ3OrydKpPUqQMFDmaoXpA1KyxGBel0FXoraQf
	PeQvMGAOIya92L7bG96DT51J5he2nIKTYFCkAktXPTyh68j1CZdqX5l9qZMk4FQiisi0LsAQmIF
	byh6gpIjvArZV096em58kP/6xY3oSx+lc5a8KuHegVfhGDmuQAg==
X-Received: by 2002:a17:90b:2692:b0:338:3221:9dc0 with SMTP id 98e67ed59e1d1-33bcf91f1dcmr24381157a91.37.1761118139847;
        Wed, 22 Oct 2025 00:28:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEeAy6LGQ5ragdIjJI48LVf4NMUjtC7IuDfdWsBV7Haqt/Ymfy9bfKowNu0VlG3/QwAd7mG3g==
X-Received: by 2002:a17:90b:2692:b0:338:3221:9dc0 with SMTP id 98e67ed59e1d1-33bcf91f1dcmr24381117a91.37.1761118139416;
        Wed, 22 Oct 2025 00:28:59 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33dff4498d0sm1687342a91.11.2025.10.22.00.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 00:28:58 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 00:28:42 -0700
Subject: [PATCH v2 2/4] dt-bindings: soc: qcom,aoss-qmp: Document the
 Kaanapali AOSS channel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-knp-soc-binding-v2-2-3cd3f390f3e2@oss.qualcomm.com>
References: <20251022-knp-soc-binding-v2-0-3cd3f390f3e2@oss.qualcomm.com>
In-Reply-To: <20251022-knp-soc-binding-v2-0-3cd3f390f3e2@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Eugen Hristev <eugen.hristev@linaro.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761118135; l=931;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=d6LoZRVEAeqEPQShLGGsaUfprEVuMtrCJ2M3G5JH1Ys=;
 b=QmAA0XesK6oX0jh2aKtFroITSokVtnP/WidJx2NR1Nz90BayYXnxJRWDlHSbfoiU/A5hsR53G
 Mrj1r7XzgLPD/Np+IubFoKQnk79zGweVapMrYV44uMlKSzHVyz3SYza
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: 23afngLkO4iYvWrB1rXXI2rd60RMXYCl
X-Proofpoint-ORIG-GUID: 23afngLkO4iYvWrB1rXXI2rd60RMXYCl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfX6NQa+BhkDyqF
 jo7tiFRcRZoYfZ3nUAlUo+3OSHOvmNX9CmFcWJNkil38coc33oHx+vcYw/H0vn3qXiwpzgYwADm
 xZBDXtJPWIlXR5Q3c42i2DeMx4SJbPSqa3b/T51H3Ubz9wRmKA1MtBgaNesuIKh9LZj70NJaiu+
 igR2O3MRRQNpvRkuEJ2v13rFQDYe/i1fAKoBneab1PaeUY7r6f9pyR66Zv4650WSp3bQBV0pYEB
 oWxf6MimywmkevYoFKPkgkKpt3JcGxfOyANN759u/7uewjT4/H2Z+KhbAqzZRvYmIFp3VVN9HML
 lTJ3QnWputlwUasilJIL3IsXkkMllcfYzqOi6hLkIqk5g7xgPIBwYXJVpMKe9DfHEo3d0dF30d4
 ikNMRFW3+JCOG5sANxNxw8LMFyLLOQ==
X-Authority-Analysis: v=2.4 cv=E/vAZKdl c=1 sm=1 tr=0 ts=68f887bc cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=XyoQbdpzVujUkJi0dowA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180023

Document the Always-On Subsystem side channel on the Qualcomm Kaanapali
platform for communication with client found on the SoC such as
remoteprocs.

Reviewed-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
index 851a1260f8dc..57aa819939f0 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
@@ -25,6 +25,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,kaanapali-aoss-qmp
           - qcom,milos-aoss-qmp
           - qcom,qcs615-aoss-qmp
           - qcom,qcs8300-aoss-qmp

-- 
2.25.1


