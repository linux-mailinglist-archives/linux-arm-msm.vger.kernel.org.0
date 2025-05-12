Return-Path: <linux-arm-msm+bounces-57640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B154AB45BB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 22:55:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2A5D27B2483
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 20:53:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9B2B299942;
	Mon, 12 May 2025 20:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VatOx3kY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4034C298CA3
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 20:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747083293; cv=none; b=ozZTJemSdFlp1xBap9Jul0PvJz8enDxlX0JZMTAxFHzlrVHyQlw3+eimga1g7shlvdIjwZHhtMxnXnmn3b/q62JbblvE1K0xz1bYzooBXbsy9ucqW9tj1yZwRWcFcoXMmy0d1bJaR/pcXKn3bpjGYIZ/qAsZrNCqoxhFzDBpazY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747083293; c=relaxed/simple;
	bh=iVXmk+6PlFCRAwYWJHcWgZJRCI46HfqbqwSKFjMQVkk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CH1elhxnLBnUZfZp/Lwvv+xe4XVvpQhnlup6nsgU1CRJ40NPCLDrgezZ1kst/iifE/MMDc9Jqybc4lX/LdWQshNbp9Nc+sCQJzXXvKNXOuSgTShm+veyca8y2IJqmUuydKpNybvnPA6f77KhVPdoWTASqJV67c1MV/c2VFiTBss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VatOx3kY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CHW8l3022687
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 20:54:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7gubxlw2eh9/E7VsvX3yb5YKpoQUbGbeurpx1mvSfWw=; b=VatOx3kYhcNSAd4h
	4L6ZSnsqxRX9P4mIndpwzP6G2aSNuOiuluBYMIdzUa+PnYWWc1hjNoMLv/vPwZhG
	qesp20FOREVXfxJ+kLga1lj74EPp5gLIOTvARHokIISPpWmW6yLYKmuXEIBBQMzO
	Qwjdcjb/j3Ii448bAYSizgrrmOAL22gcARtuQHZKqqlxqYDCkrD4qYE690ME5zzs
	Irl7mW6qG7H16nsTBK77kt921FPIZvaAfmA/6lGpdHB2C+XaopKZhqt7Z00jbaQ+
	WV2zOv1RQs9fr7khR6ESnZTfCRN1xfHdvM7AmlxergwFKbFAqLli3SUZW8VhBt1a
	kMFxYQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46kdsp1sxf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 20:54:50 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-30ad9303655so7669390a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 13:54:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747083290; x=1747688090;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7gubxlw2eh9/E7VsvX3yb5YKpoQUbGbeurpx1mvSfWw=;
        b=R/Ew/LTvHRbbep3ft0u51Zxy2RjGTsFd1SLQcSlILDH188uWNjJUevU47RqJ8aZ0x3
         oc4Bv57Tqr9VYPo8Bdr7q5pmE6lnfZkFC1Giy3EiZceG71wx1hTOmkPMb6C+4M33DGgx
         Qa8C18fdZDQPQJr3s5/f3I8FyFRbVKH0pOvKl2RRZa0Uj5D12MXhpyDKwAHIlNThV2Kl
         Ph5pALeD/3itqJ22/uvTGSoOO6VAotul2CUOFPjeAi9WSoxT/8fQLCtWrh+wwyDHR0O4
         3zwnhLi4F2SNVOVzUIAtAgzpqR2GUjgOgF4rZJU0uRP1RtzVZllGF3/MEuhjdnRA4i4b
         wtUQ==
X-Gm-Message-State: AOJu0Yww/g+LqiItlTlNn8AFSIIamwdEGbJrW3fn+4TsYvE3luiinoaU
	4bOqHa7epIEeD5yTJjPN8CPdPzLPT07GaeTxpGFzUS2dIVJVYFMy5z8I8M84bxqfaX3Fm5kZEyk
	eLS1/zUcrropDV1EvnIrTJVXwmjPi0VOIt0mRKuLutbEczOtPV7+nruQZS5cqG3yQ
X-Gm-Gg: ASbGncvKXlNW8aA3l+J4RElLkETXxDwkvg2Njoo3wa3eyffly6tCD/7iFFyemWwMASU
	KGy3y3KJAtgKh10SdAao87UjoHdpBLKwITrAGqtyTEVxNKcmozKNaOFvuOVECDtjEOa9xWVWkZL
	MR1e4GzA/kjvolXmoMqbrcTaqg+AHO0mcNJ2tiui5JU5YtmBYemnufW5U6NBu/yq3JloHCMCdZV
	s5nmqni0b4XTDcLhIOBWtwwASIOeYPmT0nfHiFQsGEtDdrG7TzO28NScEbYUpZF3Z4WPbGj2tQQ
	YA2Z4R60egEuZSQyscDYe1EEX0jNM44kJMfeTqzr9zl8oXBJ8ezctbyDHf81eBqeGsM=
X-Received: by 2002:a17:90b:3dc6:b0:2ee:b8ac:73b0 with SMTP id 98e67ed59e1d1-30c3cb1b61cmr26249490a91.2.1747083289701;
        Mon, 12 May 2025 13:54:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGk3d4/Rgx4etOXNcj7wkqAR9K3DKerdvbHlwqKrAsSbHmD3HQ0ohyfs+PmiNKcmz+h9Mwh3Q==
X-Received: by 2002:a17:90b:3dc6:b0:2ee:b8ac:73b0 with SMTP id 98e67ed59e1d1-30c3cb1b61cmr26249448a91.2.1747083289223;
        Mon, 12 May 2025 13:54:49 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30c39df09dbsm7084867a91.26.2025.05.12.13.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 13:54:48 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Mon, 12 May 2025 13:54:41 -0700
Subject: [PATCH v5 1/4] dt-bindings: cache: qcom,llcc: Document SM8750 LLCC
 block
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250512-sm8750_llcc_master-v5-1-d78dca6282a5@oss.qualcomm.com>
References: <20250512-sm8750_llcc_master-v5-0-d78dca6282a5@oss.qualcomm.com>
In-Reply-To: <20250512-sm8750_llcc_master-v5-0-d78dca6282a5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747083286; l=1020;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=iVXmk+6PlFCRAwYWJHcWgZJRCI46HfqbqwSKFjMQVkk=;
 b=pk2BOOptajSAyMagaMVP6uYmAPaTxTnBlyyEjrHkhdE4RSmNSmq8z76wODfjXDJEx4lNKdRKX
 kws4iyoAYuQBONWCKjFxTmsxbhCchsi0fQ8j7YLD0OVlPD2U2KbVv11
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Proofpoint-GUID: UCvtnplIgeFIz7T6zYGI2C6bhlUtxy6z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDIxNSBTYWx0ZWRfX8p0sja0SqJsc
 xO6whFWpqIBOwvN6v1hnjIfz344V6QBwSPD4cv8Ri2UwaviYgUu8YJhcLaE/MxVaSBfvk1Jy1pv
 LSTWa0rhStGlivXIynGnYje849RwocYPTGanTI6jBIfIpOT5u+8+jBL4MjAY7yUip8Fij1f7ewg
 W4qrcLwRnziJGixLv6CiBBBcVaGq5eY7NqlPuJ5J1/inJAT79AYJ1HIb/aCrjk3oUrXIAmplVcS
 F3zXkJAtIXMxhJn77wtkFqsxZ72hdASoNHeC5Mwuyj1hYYOPGgQzQLrxPi+2povoBGFynJe2h/p
 5Gc6uNb6EvEWxdiO5tUip2lBqF+iSw/VHkKkyuQGNX4VSnSANEsQWlPuB3PsmDsM07Xztk4KL+8
 CuThtTsvk+nOPybKgkmtwU/9kShIR+stMye05hZ/8KQWt5IiOWZN51VQDj4iDByBqnAMsU7F
X-Authority-Analysis: v=2.4 cv=TrfmhCXh c=1 sm=1 tr=0 ts=6822601b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=XYAwZIGsAAAA:8
 a=sCV_76e64iQtlowYmxsA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-ORIG-GUID: UCvtnplIgeFIz7T6zYGI2C6bhlUtxy6z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0 mlxlogscore=750
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505120215

Add documentation for the SM8750 LLCC.

Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/cache/qcom,llcc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
index e5effbb4a606b1ba2d9507b6ca72cd1bdff51344..37e3ebd554874f0fbbb8956a718dcb717ee82155 100644
--- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
@@ -40,6 +40,7 @@ properties:
       - qcom,sm8450-llcc
       - qcom,sm8550-llcc
       - qcom,sm8650-llcc
+      - qcom,sm8750-llcc
       - qcom,x1e80100-llcc
 
   reg:
@@ -274,6 +275,7 @@ allOf:
               - qcom,sm8450-llcc
               - qcom,sm8550-llcc
               - qcom,sm8650-llcc
+              - qcom,sm8750-llcc
     then:
       properties:
         reg:

-- 
2.48.1


