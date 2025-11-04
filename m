Return-Path: <linux-arm-msm+bounces-80239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FC1C2FA82
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 08:39:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8916E4F4CA1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 07:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69AE730BB9B;
	Tue,  4 Nov 2025 07:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wp/FNPGT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cI5j7OYb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF07230B53D
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 07:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762241780; cv=none; b=Za3gXqnmHKy/9htjggOYijC/1GtwUbYEnWrHcH1z9GxOKEpmox6bLweXa8bKEeU8kaVBJqteaHIWBQODtFXxITUrUYQ4xyiHc4vsnvy/BwOOs15gKZCIn6PPZhpyirvHVW6HTYzJm1Z9FFqyV+rZj7Y2bJ4dJrgonKZZpsaD3EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762241780; c=relaxed/simple;
	bh=FmKGIfydpIBvZwHLGbtykFwsfVO47sNP+uEYs4V3KtI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KQ4rERBq5vYxWJaEZLao2DTWY5y1rqSi5zq/9fiD7knJSnwa9V+8icNGD2XR+usuvOtfWNV3Ztu494vTiAVuYl/uT1XRDg+rh41Jxa20E6AajqH1BL5ociY62/7X5eA0UZgyS7E2dmjP2bMI3D1VoEWPav2CbWHxxnQRQboai6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wp/FNPGT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cI5j7OYb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A439N113667854
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Nov 2025 07:36:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LqXRNN5WgLhy970VZ7+bHvuWbBP7UIoDXfqq5soCIW8=; b=Wp/FNPGTlUw0CQot
	majLNEPt2dZeq+WVsPM1J8lavB2b4ZupyDrhpja/jGg7y7ABn1wjnTgvhIcJJTGs
	0LpnPWSFd66YRrHiHZDVJZ+ZCYCq1vSNld6t/8/xjzZnXrzHAR0N8hul6h5GznSg
	04VLfGMSUr2r9KAHN5GGRIF1rfueCvnvb9Qdhuu7xjQuYdiX2y4dmk2I9q4Hbzat
	jujGD66rp5ipyAl3oY7ijCVH+M0RkeGu8RvFzgxTo8o29mP+pdVXSqD0c6rTrKmA
	9/BTGM1bGwX78bSPAJ7EBeLZGnGe/k2/mEOFyW61UHd+bh0xNQO/OBy6bOzNdI+Q
	qlg6hQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a70ffj3e1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 07:36:18 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-340fb6acc39so3137149a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 23:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762241777; x=1762846577; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LqXRNN5WgLhy970VZ7+bHvuWbBP7UIoDXfqq5soCIW8=;
        b=cI5j7OYb3eW6Cyt+HZCpTkne17fCCsiwMHG8fIUD58NXQWyvpAHf5biuum6F3rnTcX
         tIs40iKB80MbLGbtNkg2rg91WVwlINPWVPr+CiiGcJSNbhsz7fojVt8zcFtUWtNmdcSF
         nq+O9dT4CzxOCX+lxI2GHb0tf5+CtFv/yiHFLQONjpsw9yA/4gGIA4hxktBzBOlDD4Gm
         pRsBlE/OfzoN0ZY5eMS8yVQQhqOrA1+roKOtKaPJJvmljLL6uEkYYogLO/fIyZS/fUB5
         0+T+VralA6/5E+xumYmPSAhJsBpWN/TCCcd9zxUoAunaECbbNQGIehFYet5OBoDd+ahn
         PXcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762241777; x=1762846577;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LqXRNN5WgLhy970VZ7+bHvuWbBP7UIoDXfqq5soCIW8=;
        b=DOOV9o9kNwwnvQYfYIhjidgvDl4IKgGjiT0xi9WEmO9KDPoa0+320dVJiADEyNQJlS
         +9d+ELtg5ssve/nk72x92+6VxKRbmD0m5GRLfuTXVVtj4SaC2B5zJGrDBjpdPvAKyqXj
         ArD0bsBszQR0u6GrEe3+LAyQ0zayJjNVtd6fO4re9pz+P9CKNM+D0oAzo/oUp9RR5Cp+
         ftED8fOXJ+NXUduHgop6Q65ctb9+1vAgipcy1u2u+rNXSQ1rRZYUmUdIs4kEMNU7Clxg
         Uq/jHOrt5jQtRXgo2g3/636C6rlGw4Oynb07ITNsV3mAoMBfXXXkfMVeXUH+vwxz/c/A
         UpCw==
X-Gm-Message-State: AOJu0YxO4rJSVhK318w6lGKY2YYqgdeQOyCu/k0BV4ge5tjvLX0swt6B
	UJeNgAMz6nryZ5Ej6NSuMzyl4BB7CF6CUD93uB+RUAVB95PmN9Kt0Pr5YnclDuVJ51kDxTuNzHl
	79a6XVA+nPGsmrkBBmR1DXYwn8aJ0inTbUtHOA31SrOzPzz4T3jW+SYEVlXMqc2dWohz8
X-Gm-Gg: ASbGnctn7JsU4J/eYW60d6VOySHETX8IWdL4QpSFAB2300YWgBaoXex3aO7qIrDFC2/
	2HbUoesd8GxaPAZUvyrqdNmoEXTxUqbKqt4Lo+RL1iCUcSwHPdopqGgp9/xestuj50JmT1YILMs
	Yu4neEy6eCbNCSvuRkQg6/8KdCJbvZJHH+jCOk1iRcPWt5akKQJiqks2iUogSTQO1GQpo/VK/KV
	ayreuhZtsMP5U2n8rqIjEIK1axg3qCJ83wR4nDOWqtAl/AQKW+jjNSD+a2rMaTRpKnUcEQIMUxq
	4d7MxESIZNGk7VA84U8vxTF/bJH/OVm4kWWABpfpoU0R93k4fCTFAeb980eLGvYTKZScZ311vAZ
	dEA/OOyRvHq3TwAfvPtC1DTkXsw==
X-Received: by 2002:a17:90b:2b44:b0:340:f05a:3ed3 with SMTP id 98e67ed59e1d1-340f05a4111mr11890996a91.17.1762241777215;
        Mon, 03 Nov 2025 23:36:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFC0zzraVPxykKEoWBCgsKtSlR9peX7tZKI1998OGHVxAi0b3AuVr6yJ9IR0P1G35ZoVuRFiw==
X-Received: by 2002:a17:90b:2b44:b0:340:f05a:3ed3 with SMTP id 98e67ed59e1d1-340f05a4111mr11890952a91.17.1762241776608;
        Mon, 03 Nov 2025 23:36:16 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3415c8b5cfcsm3484367a91.19.2025.11.03.23.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 23:36:16 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Tue, 04 Nov 2025 13:05:42 +0530
Subject: [PATCH v6 02/14] firmware: qcom_scm: Remove redundant piece of
 code
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-kvm_rproc_v6-v6-2-7017b0adc24e@oss.qualcomm.com>
References: <20251104-kvm_rproc_v6-v6-0-7017b0adc24e@oss.qualcomm.com>
In-Reply-To: <20251104-kvm_rproc_v6-v6-0-7017b0adc24e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762241765; l=701;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=FmKGIfydpIBvZwHLGbtykFwsfVO47sNP+uEYs4V3KtI=;
 b=JaZMbmQPwIaJzEwbqi26osYgo8y3y8kiIBl0iE5kn5gZ4x4ye9GXg/gks3sL/Cs7FcDBR7nMs
 zO734FNyCQcAIWUJKEm+gpEv0OfPdPdaWUU5dlR2GEWi4HhpZmqmNwx
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Authority-Analysis: v=2.4 cv=esbSD4pX c=1 sm=1 tr=0 ts=6909acf2 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=QKOBHnd7J3GditHIzEoA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: TAs-NFj3AaSl0MP-aQ98HegIBQ33NPXC
X-Proofpoint-ORIG-GUID: TAs-NFj3AaSl0MP-aQ98HegIBQ33NPXC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDA2MSBTYWx0ZWRfX7JhlYNXQsFDD
 Bhxil6+jYFGGKFqmUlVAgw1M8xIVk/PRKHwrLyd00VNbiwinX8xL4WjePTuj76bkntdLwt5tYu/
 Q5jZqEFAEFW4CUgMgr6eEaQ3yY49+Wh076UZ+dMmuiTXnqCmrc768Pi3Pjb6XZR/v2KB8IyCh1w
 78x5ULpbNxSaXAd3iAuwqxIvKlGgS8HHA1dhn8a0X5uRAJ/+mCHrDWIo5I3GpJpoKgGKLGGIxVi
 jD1zWYdxMmf/A9JFVf3vaE3/+lAACTycjFzV22BeUiLqNXcCTU+8o5jsrgh9N3vN1LBLaXshvqk
 X0KSEdPIMrCyUHr6BLaR1ZO4E8118ffE+MVCqP5bfvx1btJQtRJf/KxNPGAjKmfMy+D8cvLPL3X
 G1U+SWuBh3gRYnYsDOQmDfIckvZFTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040061

Remove some redundant piece of code to save some machine cycle.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index e777b7cb9b12..26969bcd763c 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -650,8 +650,6 @@ void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx)
 	dma_free_coherent(__scm->dev, ctx->size, ctx->ptr, ctx->phys);
 
 	ctx->ptr = NULL;
-	ctx->phys = 0;
-	ctx->size = 0;
 }
 EXPORT_SYMBOL_GPL(qcom_scm_pas_metadata_release);
 

-- 
2.50.1


