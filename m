Return-Path: <linux-arm-msm+bounces-74826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DE7B9CDC3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 02:20:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1BC7018961CA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 00:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86DDA22AE45;
	Thu, 25 Sep 2025 00:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jJsRDp+M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628C8223715
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758759474; cv=none; b=EgJ4za9mDBtT4dzo5cu8Z3JfxA7cNyeROjY85wj4MBlt67o4wZ1cyaJYR4qVzeNG/r7xaV+C8HzANwRQ31Ff8uSEMv81oGyq5Jav+mJUSw+cGtWTPh0mJw4UOh9oIYA7rh3Szq6A/IZjqGpXbFL0cI2RDMmbxK1E9vl1NVaSYzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758759474; c=relaxed/simple;
	bh=ZnxxXrVBknVL5H7ycfQJ0yrFxVkXtooRPcMnrqf/92A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uLEa6yVAtKl3aX+UnELK5sI8Hcgxu6c1Y/iwKJ55Ne4nYuz9jj2AwBrMniW+wsBT7OVFv8SUiCafq0atv1W0lAO6iVPbCmuVKXFobrs1/gAzMCteqV8BDU3qC0opIMld0JTE4/K+Tr8Zv8xxDfqZrccQM9hwVslebpnoquMSX0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jJsRDp+M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODkrgi001919
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:17:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cSFLnPk7ysFol1223CGza3Hdc63+GvMEeu9hW4hWOO4=; b=jJsRDp+MWL8MqeOv
	jmoaP8mr/n+jvzb10X1b3s21XjKqV9fJl4kJ0QRLiUegts7E78hxULDxx6jTuxXi
	0nuDrRcgFjxiXPaVqbej/Zq/4XVQGPaTUy6SwvrNxlUe+JRVjqYKqnfd6RX4+h2V
	zPw4dJyv43pNrKDmk6kHYdeXMji4nU/iUfR116D9XqQovIbNbMoO4rpD76a+FoDb
	IauGraKh55dksMDQPzXk5bUNLgtBTYWwgP6dUSzchWrhYGzsBx2WJM0SQTdrNhPD
	5iBrwu9uyfxvLBlWePbV6ud+fJ9GbKA/Cqx3pxYCVYQhf3bgisYomLQCxYphWnI2
	Ci3oSw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98p5fu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:17:51 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-77e7d9ed351so371333b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 17:17:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758759470; x=1759364270;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cSFLnPk7ysFol1223CGza3Hdc63+GvMEeu9hW4hWOO4=;
        b=e98vFV81zGgZSZEcvuhrM8VcM3bQhCV7Uj+eCTndkQHPEWW+J7i+xVT2DFtJiJwagz
         b0I5ELgcE/1Y2JmrRXrYzeru/6pUoATNiGV1vM3hCL8tGQhnJiFi2oAdPkM6dHqlSOR9
         4EF9k0IdQAOBFDdcHEUkA3LBb+sT5UhV8cWLLGQAWTk+ocJtYZAKJa37iOhBIrbaXGqb
         DE7AvKBhf0gKSg0gq1a1CZksM28OCu0y921qU9hQr5dsyUG9L1mcCzBcEfqv4uuvbBHD
         urG2JQhe0rnCMLwXh5oKk/wczeuTwrIZlPOWHNji5LbcrI2FECqLNkK/VRkmdasm9RTZ
         mZ9A==
X-Gm-Message-State: AOJu0Yzcc5QU3YySggOVo2EgJnYH1jFlI9aQX7LkAx6dpJd2XNFADwOx
	XauN4nW2q2d4Ak5gwrA0YW/ioFGJ1UMwER/T9W+QRBXkairRVm5iISJFXlHF2Pyu1XmYUAhTT1h
	6EYcCbXCo/eBUQlG/JHBd7Hvi9ccrewI8+FP9sMJthgDn3JfTm5WL13okyr35KmnPYvyT
X-Gm-Gg: ASbGnct/v/j89Qzu5MRUy3a73jTLpKgXSkXxqObUNA97aBH+yqupjXAlpEZoVxtskHb
	rvhJipQGsEvT/iimqmzSa4TMm08zNqi29EGVsq/3Ek8FeosKfDYY3rOoE/PQ4qCj7laBD+TeAav
	i8ubomHfiD8TDC1GGzRJmsLVQ3VqsYMVDfWC9mTV3Vmyy+k1LNd8nXsdeoiIX8E5vdygEcg6apJ
	RwJO8K+OuiSbgAqWKQmF3kA55ETMn3eV+3myg1IKDmKlMGDtsTrGzxMLyZ27edF8md6Rmt6xMtZ
	mCq3tRvpPMoNkDkLp31+WPLLc2N2RqENqhyBWkmlT3oSp1kN5XMkpj7914AhzHODk0xtBxDvDVA
	sEYnbb3wHPLTyPBo=
X-Received: by 2002:a05:6a00:b8e:b0:77f:3204:efce with SMTP id d2e1a72fcca58-780fce1e944mr1355715b3a.10.1758759470244;
        Wed, 24 Sep 2025 17:17:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5TgNMXbf4MVufpWFUDFnWgDHVNG8MKlTqGJetdLMSZMeJ8LIAXTsyQfcT0GbHH2qoz6OvnQ==
X-Received: by 2002:a05:6a00:b8e:b0:77f:3204:efce with SMTP id d2e1a72fcca58-780fce1e944mr1355701b3a.10.1758759469818;
        Wed, 24 Sep 2025 17:17:49 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810238e6fasm262748b3a.1.2025.09.24.17.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 17:17:49 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 17:17:32 -0700
Subject: [PATCH 15/20] arm64: dts: qcom: kaanapali-mtp: Enable modem
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-dts-v1-15-3fdbc4b9e1b1@oss.qualcomm.com>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
In-Reply-To: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758759448; l=835;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=ZnxxXrVBknVL5H7ycfQJ0yrFxVkXtooRPcMnrqf/92A=;
 b=88h1SfUl/uT/sG3wHC4ylffWfLG269Cyw9rxlcD8h2YBm14w7Uw+DK4ew8FpNK0ZL+hCyCwCi
 GIfpUYm0PH7AaK8wVDGlmhilu87brR5A1Fol6ECCJVCK5fFCqI/saCK
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: CZUqn-YHQYXjCmBnpAukOcSuYt2P2kSq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfXwy0ECOwU8yi+
 34H7gUBmcY9xL9kPm54fYWu/XPC/uo+95QWrRVwUxJFC02/pLSNP8zzkcRouWL2mjGB6nGa2LRb
 e3DT+MBFSIcwIokaV6F/P7m+Ej28gsGOa0gKjMCxZsLDBDHGCDjmnidCanKb4MTwoQF+oCcSgc9
 CqbqXl4xdgET9R+RGxPrjYALx/coVdCRgO8RNYU3VVbxqS4MaL2zHQhc223+m+XGQfYDhrrt7Yp
 1zaCyWc28Vjv72nOvxLqaRWnKYMbLV7WZeK6Fbl0wLDBBXzOAzgoifcai+Fn8sv/5P5vHYd8emi
 J0fWldJyqP3rXoPoh0BPaBa4RPUPTjKm/j/JqciX4oOrrqQUlO+b4sJE2ZvC8ZeBRPtP06QLFhk
 IeyMoAL1
X-Proofpoint-ORIG-GUID: CZUqn-YHQYXjCmBnpAukOcSuYt2P2kSq
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d48a2f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=4W-xSDX782KYlO1dws0A:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

Enable the MODEM on Kaanapali MTP board.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index 2949579481a9..8d1b3278389e 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -1263,6 +1263,14 @@ &remoteproc_cdsp {
 	status = "okay";
 };
 
+&remoteproc_mpss {
+	firmware-name = "qcom/kaanapali/modem.mbn",
+			"qcom/kaanapali/modem_dtb.mbn";
+
+	/* Modem crashes after some time for OEMPD load failure */
+	status = "fail";
+};
+
 &remoteproc_soccp {
 	firmware-name = "qcom/kaanapali/soccp.mbn",
 			"qcom/kaanapali/soccp_dtb.mbn";

-- 
2.25.1


