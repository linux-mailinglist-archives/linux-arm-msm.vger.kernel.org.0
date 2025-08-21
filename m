Return-Path: <linux-arm-msm+bounces-70222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE2DB3027B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 20:58:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 12D164E3667
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 18:58:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8EBF34F478;
	Thu, 21 Aug 2025 18:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mLgRJJrz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB58346A04
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 18:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755802613; cv=none; b=mCKjdRGER/zTVB2UvUHhi014M3UdtFF3oJP8uBrDgJ6zRkiSofR6khWWw7ziBYhf9DPRpDuJMOQP3dBYAxemBN00dX8HVpQC4Fe2enWnDBRoIx+nQVZ/8yHojb5ywcPKW+f8h9UU4JcYQfPWNhIzIkscUV0eAJPxkJtpicBmU1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755802613; c=relaxed/simple;
	bh=EfCx1AnACdzORFWTq7a/mK0KpOzkdsdN9am6A77xvlQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u5RycPNp3l5P2Lt9ofyghqlLRZkbTqg1i2jQUH/Y1rdUV/rDZ5mViXITOJlVWKnbYufa1/pkTpjGWhJy7xPv9pEtx8R5Rqf09nTPentjY6eKJzq9t83HGKmp4GtgQDXZJG136IRF7CFF6/GWzgfd9EM+/IOMRfV2RG9krFYd088=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mLgRJJrz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57LI9Td0024211
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 18:56:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L+vnrfh5wkxvST6moGu8zFwo8y31WtRfprWTPNuMSjg=; b=mLgRJJrzeWOzkkBq
	xCdYQeB0PJkwP3l8K9NTongMTO0eSNXFlAhDK+wUFynDp81nQaIRKh7VfQtXOdiE
	xuNxQC9G5nLfpCnYQ5YrcmR8Tnw8E9nrUo2LxtYJH3kR25h+g4omYtf/tpgSpPMm
	3W2mzK6+YR1LZBLUFpCIEYUwfMMsnV73/pN4oRBoVwSh03Ewz28xC6dc9y3vLvDl
	lp3dk6Q/U9HBqsCJXymhGt/iUaVtzVa/xirDK9/vtjMtF7DBADWB99Ta6/53WWOh
	NmwRBcpWwHyBeEl4BBaZ1BQNgfHoI7YDF+DgnMr+dEZcZMQWXo5KUYCgMxluHUSe
	SfZafw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n528xgvm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 18:56:51 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-76e2e8b4ab7so1250565b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 11:56:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755802610; x=1756407410;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L+vnrfh5wkxvST6moGu8zFwo8y31WtRfprWTPNuMSjg=;
        b=EM5E3Q3wJ7TZI9nk4H8VRzQ9/mt7zGqvg0y1RLAFKuVLK1T2fBcLFSzgqLRLb+kKsq
         9qisYyw6AvS0HLETifoIJNg40X7eC6/C0v/VWLuJaweqo/i+LlZm0cgxkOrHUIW+3Nk0
         AfnK+Usja48QVTJeKfybCC3itdQ/ajKCgXbk8PLVbaUOgu/+kz8Pd3MTllt4Vb3zH26x
         zQGgYlL+leBNm7SWOkeJM9dCIp1MQitQapIfeGkNR7f1Jf1B2g4I0hxiauIdn2FnMePq
         IxgyAHNGCIiDsTMEkb+DJI2x8S6JaCgsJER5SXaCSqajzfUwEai+vXBI8kP0UqRSqm94
         Gcog==
X-Forwarded-Encrypted: i=1; AJvYcCVn20aYUrxAsnumfihbajrupV+kO8CcdOjoD7hqqH3zIwdxJ579d8sEKPfcwHJeJIOruYXveSHWnCOHVp2Y@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlak9kjADEPa3ScGLQi1tdOBvuuOX4QJ2kHcwKGad223XTk3BL
	dx/dchdzcxFzVjD31iecuF7qcPjZULUOuckHN8enFNakvkzCn+g7qqz7Bw7AN1cP12qavGNX8yY
	2exSHfJUtsbl8ZiS1pPlS3Kt8QJ7aAMHOCDZo6f4+JgU0Z71giwus2hRltc2/lDvioxSq
X-Gm-Gg: ASbGncvHO4miKtlfwlH36RHxLSFjPk9I7oOTwesIlI7mZpC2N1mJul+tG5r8yAysUbl
	zqO/xLlW7nxnkq9TH41m7bLaIO7sxnzLIIJdfkzqZNH/hIFSabDF9cX8IteD9VjuWjPNN8Vss/E
	osoSgzNLIA1M7CJtIz9121RDo6xpF7wj1FjXs9pBCMC+4VcFO9G0cuqhl56A3nb8KethcRPp1eo
	oWme8UgqwnYmNb197guEHFqjeRfa8oBJgRZjeU0GfgEdHixSRLjaF35HXGIu6Mr2GygYnmo/knY
	l7y8R73nqcNuj5h6E6Phww9OT2ffX1NDGjW1DlwJ22Zrg6yaaEJjUKXYuTIV20BP
X-Received: by 2002:a05:6a20:72a2:b0:220:9e54:d5cc with SMTP id adf61e73a8af0-24340daf836mr290735637.31.1755802610068;
        Thu, 21 Aug 2025 11:56:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbkoS9Oleg0BMcUAm50PQQmuIuPc1U5sybFr6bqhLl0blAssfD7XkEWCeGVPUZNhzXoPJurw==
X-Received: by 2002:a05:6a20:72a2:b0:220:9e54:d5cc with SMTP id adf61e73a8af0-24340daf836mr290691637.31.1755802609615;
        Thu, 21 Aug 2025 11:56:49 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4764090b0esm2106977a12.37.2025.08.21.11.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 11:56:49 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 22 Aug 2025 00:25:31 +0530
Subject: [PATCH v4 6/6] arm64: dts: qcom: qcs9100-ride: Enable Adreno 663
 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-a663-gpu-support-v4-6-97d26bb2144e@oss.qualcomm.com>
References: <20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com>
In-Reply-To: <20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com>
To: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
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
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755802565; l=812;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=EfCx1AnACdzORFWTq7a/mK0KpOzkdsdN9am6A77xvlQ=;
 b=XGnXES9y4qk+wZkRRx2ofUbx6TA5EXdyY08i0sz/1HJLxVoi0TaTp4HQb61vD0riKc2tD5RrK
 1hNS0+25QZAB23PNN4ZH5Revq3TcNgTO+Zc4bv5OXYJfmLzq12ECf0c
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=I4c8hNgg c=1 sm=1 tr=0 ts=68a76bf3 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=jbU5qkt2-FsioPMlu34A:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: I_2nLQggeN0pOPZpYKB6xMjSVFC_t65P
X-Proofpoint-ORIG-GUID: I_2nLQggeN0pOPZpYKB6xMjSVFC_t65P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX+ClP/GAZdLKm
 efNjqrE8BpIqYtzs799EuBoNJmQw1vh5JlAUwqYvBu4F+DIXk/BRgZ3CHLk/BeCUJEg1ki3YtOB
 M5zudaNGtF9O0JPM6TpaHSbzXSIWVD61M9GCZYi6dYMhIjMdZWDzpWlPt4t54E1JPPYrhga/Ro8
 +AJcUTkqRuKF3A7bN8BWta1p05pT9/HzsWAwpl17oJk6VyfrifgRVV1NzjdBmldQUxsVv3P3QD9
 0tTEQyNJdRmUPZf0f2hCpwbg+kh5zH9LEeAeJDf0939bAsevviYo+WmUpYk9nm1BnnzCCjvzLT5
 JMhKbVJxRSHK2Mnu8TsLVHrB5dNCRMETKWeTbivqIHcoHYAc2Rr4qeJQ9rtOveolUuV1KBxroL/
 Zmnzrm1qHkUgAIQz3doH2ZWsRqXoug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

Enable GPU on both qcs9100-ride platforms and provide the path
for zap shader.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index 25e756c141606fbe0876ed48a54809b372650903..e9540cbff78ee44d6d92de10464c660a05a68db9 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -436,6 +436,14 @@ vreg_l8e: ldo8 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/sa8775p/a663_zap.mbn";
+};
+
 &i2c11 {
 	clock-frequency = <400000>;
 	status = "okay";

-- 
2.50.1


