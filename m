Return-Path: <linux-arm-msm+bounces-71364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA30B3DB23
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 09:34:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B3D31173128
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 07:34:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BE672727FA;
	Mon,  1 Sep 2025 07:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PM6mUZH8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33D427147C
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Sep 2025 07:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756712026; cv=none; b=pflUpGN8VAXhRiD3TgCKfvkDppraPKEnPXgfTxnU3/OcMD0YPRg82NAXAfNirH6OtYWN6II5tiVK0acTb8ElI62KjT7j9BZilOLVEtj00/bKVhAmepLQCnQQItai5hk+biRH9+UpXpZ2HxRR1PviPiSRqbXx1QWscF64H90UmlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756712026; c=relaxed/simple;
	bh=ujcFgU9lsNqpiUBtm/dP2KDUpvBIQ3hN5MxiI40kdfo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YWS/M/a6g5+1Q28dSE3t9MV/hC5AEutndGsLSdTD3p7PuLCQL4+ndnMb8go8OUPm48zl2BGYkaJMDjoKZDtPyPdJ5hfFmuBWkPhuTZ3x3VXSw/aezULTPSiH7Diup+YZsar31jqV1khg1cycokVHq68obJtRdg4tEOdpgCBpkA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PM6mUZH8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57VNoB01015661
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Sep 2025 07:33:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mKI1EuqCEf8olXCKajGIiUgp6StjsHv4nQfApAiwJhY=; b=PM6mUZH8KsGfkmLs
	6jV5Jcfk5v+Q3B7+/TEZsBeTYEJtKHxHWSyD9FK+5d3IJkcIL24gnC7hxFcagIYM
	Fu+/4pAztC49sS2xbpv94XV9s0OGzlN10lebhyvBd20xHxYg7iGC7VIHR1f9FKQi
	b4+qKpzAWBT3bXEQltuSo8CHBUjOLdC6LMKdF2I+qtjQJKJtgTmHBKkpFnvRDuB0
	2zTcyT40YlLbenb9htS4d9iBLeofd3SAXmWuGkWqTztxen80b4vu1rThIL12qFRe
	d/kgED761fa55+EwIGVlCzG62Cy0spb/zWCU6QtnWF1kqEczt6ApgAgs4lLfnIEG
	6x/TfA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjbrjd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 07:33:43 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-325b2959306so7008156a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 00:33:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756712023; x=1757316823;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mKI1EuqCEf8olXCKajGIiUgp6StjsHv4nQfApAiwJhY=;
        b=wh4dlFoTcMU2aut5lS1YuqzTdUITaslMhIhJkt4lvTzsE+liCkIhNlClUmkKqDSplk
         rEFiXqAelCqNtiMAv6ERc3EpZtlJmgEq7CaYffEBasQRzRQmIpiMlOMzvXJ/OwzvKI2P
         nno3vKfXBvyT3mqYXpMMs+kMWYv9t7tiHnTv+TQNWP8kC/LbU1Qfovnip0syi9yLvsc8
         ES2UOnucBj0G6Pv7vbDmvklNg1UVIBcBPW+lPgJ2GqBO7UXvAYHL2Widi6L2Fh1zK4rY
         MX/UNVTkuSKU9W51rGFFTuRqsLixeYEMYRg4EjRHECkz4OU1JqVejE4gA6AUn8mVKenu
         Wx/g==
X-Forwarded-Encrypted: i=1; AJvYcCV52KizYJPJpT3LMuHCqWIQOXORg5Co6zCglB1kl7gHk+LxYId2XT7XmdoT3TZzXPr52G80V8FEZuqEO0VQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwXf20L+5JI0t4qX9+6btuhCZ/q52JdLVEkaXP95yWt7SWl/mvp
	3ClAlXEekoX1obn90dXZXKGSUsmOMSIkVFJiLgSsCPo4bpgljLXUCp4sF4CXG3X8g6RLDWZm75y
	Fzp4Tna0JxKHfAXjQNvh/VoZzQEGpzEo6jVprxaSKEbBbFZSOSV2Zcq4KweFhRzRll9U9
X-Gm-Gg: ASbGnct1kR7SYXRKiORibGWxVcJPbpjlOx9xPf4RIXfkKaEl3Kox/5dg0cCo1+PEIVR
	nY4QpFVHDCCiPvoZM4MmgdzkxUhq5AmITzJPVALe01pQsUxIqMC/oqj86GlIsH59gSgPRHeFAQx
	z43Y5FdWARbaTi5JZTlUsWlJrp0Mabf7q61yrg4bNVze6C88pyb+MARYyr8Oxf1Sxp2BrM875Wa
	jovjGTvyUtj+EejZd+2lUcXEZ25o7rfxCXXtposkzYglurU9g1SI3xLMfGNnHKX2q8A4BOQdX9T
	S6VwGNa2LMJR6vabrsqDd34jIL0XTkvP1fqzJmS4JGSbI7BDpw4HRmS4BJwX11A2EE4petEmtD9
	0cA==
X-Received: by 2002:a17:90b:518f:b0:327:ee13:5763 with SMTP id 98e67ed59e1d1-328156f5089mr8468430a91.32.1756712022597;
        Mon, 01 Sep 2025 00:33:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMj4YhATKJBdX0k6p9CwKSrzEIy1hQHpVWIKW0FjyMWoSgvZO/K3vtkbwdpJGdfV+932/EHg==
X-Received: by 2002:a17:90b:518f:b0:327:ee13:5763 with SMTP id 98e67ed59e1d1-328156f5089mr8468400a91.32.1756712021819;
        Mon, 01 Sep 2025 00:33:41 -0700 (PDT)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276f5a0bf9sm16095554a91.13.2025.09.01.00.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 00:33:41 -0700 (PDT)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Mon, 01 Sep 2025 13:03:29 +0530
Subject: [PATCH 2/2] Documentation: media: update Dikshita Agarwal's email
 address
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-update-email-v1-2-8fd49d58c0e5@oss.qualcomm.com>
References: <20250901-update-email-v1-0-8fd49d58c0e5@oss.qualcomm.com>
In-Reply-To: <20250901-update-email-v1-0-8fd49d58c0e5@oss.qualcomm.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756712010; l=1006;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=ujcFgU9lsNqpiUBtm/dP2KDUpvBIQ3hN5MxiI40kdfo=;
 b=kI412KkTrHeqRBFV25KZpIcRmGUCvuT/ZTUTEmFZCV8daSMJLxwB6vmDd3FbvrHJ9S6bH1lZ0
 rB1zuT0P0/wBZJ4xMuqccMh/JXN25svrieR2FHqYsSpJLHdFBw0y2lo
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b54c57 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=DWy_KaASFEtLuoGz1HEA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: wA9SFJTyZ-mCR58AQwprBmT3tizLoUC9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfX0x/hbjpuXqdd
 qPnkDB2CX82pWYvRqmxWdiqPbcalGL1R20VJpLmUBzvP+KuUlf/x5psAwJBwp6x3sqE7VWNenYo
 E4aCF5lw9Yfx1OZwbrms/6uyxnIQCNfZnMxNS/EU46ydvE1XRoUF/qlVV53Y0hw7XWGJMQ4TwJn
 /N5lggRYkxaZJp2f9uugMgCUgf8a6IaIp/CZCGcrNp3qFdbhzNWX4ZZIfpmy2Bo2tb+ZYIhun07
 WbDk56ALcfC0U56S3wVat6ZIN2KtryzXoyTFsHvUHIOGVPX2yxWLOwYmRzhkoSRl6SQWiAI7pw+
 ZEIpeHwnzEoD7iMeAj+F4UMubtZ14NTlk4KGrKwD8d8MyBhaodBGoPgVGyQ3/m5JZRnKCEx7oop
 OFCPZ9uS
X-Proofpoint-ORIG-GUID: wA9SFJTyZ-mCR58AQwprBmT3tizLoUC9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1011 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024

Replace quic_dikshita@quicinc.com by dikshita.agarwal@oss.qualcomm.com.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
index c79bf2101812d83b99704f38b7348a9f728dff44..0d630e620b097d01001fa866b6a4a3c6328e89ca 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
@@ -8,7 +8,7 @@ title: Qualcomm iris video encode and decode accelerators
 
 maintainers:
   - Vikash Garodia <quic_vgarodia@quicinc.com>
-  - Dikshita Agarwal <quic_dikshita@quicinc.com>
+  - Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
 
 description:
   The iris video processing unit is a video encode and decode accelerator

-- 
2.34.1


