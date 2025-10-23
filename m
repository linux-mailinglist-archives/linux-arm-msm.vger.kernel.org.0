Return-Path: <linux-arm-msm+bounces-78449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6712BBFF30D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 06:58:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5ADC64F824F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 04:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31446254AE4;
	Thu, 23 Oct 2025 04:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VHgGZLJZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A14325C80E
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 04:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761195476; cv=none; b=GTbRFjMkyx8EVbUnXwwImFyq+wBs66GfYIvYw5ii3zC+ZmHiDI+JvsxM9K85O2Vl85Qmnii8u+iHUGLujOwlu9/lhekdvSzRbhdL67GiZo6YuXQ30lVEVnim7n/DCFWVkBl3NVbxcVdrdt5SjTFZ5860as8kcEppV2Upjww4MVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761195476; c=relaxed/simple;
	bh=BWJCkcRPP96Xh9dkql3wSobHLig10eB1qb/PHKQyTNM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qW1ZSX1X03rlHRaJXBUstaOeYSVMHzssc4AbFmZeaiT4wzYJ1pgKdnejxWoD+i5nEasJRbeWkIQDRqa9B/4XaEpImomfsAfpu33M2HiDlC0eFvFSyvVaYRbEhAPDV845DNkS75mnREeH6POzbUx1tqFqxpgMCRaIq0yTRQWHCFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VHgGZLJZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MIelZo007418
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 04:57:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EcjwNkGfwMCJnD1Qj6xY6Vd/84dcedItJ+DPktXYc3s=; b=VHgGZLJZCnr1XMwy
	mgtTMdtOgssMxTHyOFAHb2w65mP6DtUoCvNdu82qAs8GdLMEFfF/KbPM2tmSHGOV
	isySwCUVZLSc3d3XhoPK8b5RgCoBDcRMw3e3TxhasKnUVWQPaZGD188lUWeT8c6U
	Ma77gH1Rmd66UNlywmDkPTYVQk6HQRM+clqWvtF3t8ourjl8ROADfW+yJilbvP7v
	/i5/kgBCpLoa48wAABxJ/4ve6gHFsEM06Xa++vftNmaE07CzEDdcLFVGAlocmJfR
	vE059nkl9EiQJ/CRhHTlVeHlA4Fo1YNUPgy+fupBPvqAsiR8IZXdBVndYnnVuRPD
	VTq/hQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v344747f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 04:57:53 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-798920399a6so1594364b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 21:57:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761195473; x=1761800273;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EcjwNkGfwMCJnD1Qj6xY6Vd/84dcedItJ+DPktXYc3s=;
        b=WJM+49XGGfKDX14d1Cg/OzMDExKzcrvu50FneGygQwXF572j4En2SLygUkji2qbN12
         4/+4G/qQW9L9xaaH692/loEoDzYxj8P4vaSGum6WDECf+ROCM8e55VisAGe1lgToRSaR
         pZgeIdi894BlSerQFrFcP6jn+POMT0o9szIBOuTKRTxQP2WOTRyl4RpQCEMsXvaj9owI
         BKNR70d1gr4WmN2ops2gjiz6bjk5GMXpxlnS+W9afJlhi66WsQSj2akqsP7c1zWxUnE5
         GetmQZZL27kASGe6rw1frab9CKhh1EncyozvdGfvPRxRzz1ObFFJDQ0zaIaJJ0oI1kRy
         hOIg==
X-Forwarded-Encrypted: i=1; AJvYcCWx2n+OLSBPUvWD0DNyVSMuIBJbcuU7MvdHGa0AmIf9JICC2HrpmVgAt3i1Zf0JJ00dRTB8gFxJv6o2Y2nP@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+HuYJAxYqwRkAGle84KWye1w+9y3fQgCI20u1xN1yWUGc04nH
	WhvSAO8T63vGxIZ1PLTrsANorqppJQRg50zytfEA9xAGR5E0d5EWNBizaM8ZyMkzSbruz0hG+r4
	/b7lH4ngvCluepzTGXhLaSOic6LDUoi+u2F7DOgc50TCXGLlSQl9Sp4v4XVAz1JCm4NJx
X-Gm-Gg: ASbGncueHsjuTnKdVbWGXfd3AfeLyPCDCfOTYwQv0Q1oC2D0WLmTWTZFXt/RK7j6XB2
	D7e3JTxZBRFJKY45mgCnrIXwvkjdgc6XaJcNUevhaOMnuvY5KvAbOhY0G63Xj1B3/EZChicVu2c
	VJbgGv8dBOTnMWZrDp5FSgc7E5nzpqzGMAsZYHUP/FFej0/WnYQxuO4zGuNeeHlOKA4ogcJur38
	IQAKP7QZjBy8GpV85x/h+huO64Y6n98080qtVMSyscNOyNQbOOo/6p4+L4gtzoBKgj7BYx5gVwK
	nQQKVhsQqa3McRe5+u4a4eFLc1CyczBHmniuk9qR1hfvjAf1c3miP1vngDDU/NOaV2TN3nRMmeL
	M4wHGyRvspACROCt1EQRWSJ4hwbJGrLUY61xIBTXmmuq9UiYpgA==
X-Received: by 2002:a05:6a20:d088:b0:334:ad99:7e99 with SMTP id adf61e73a8af0-33b6a5dcf35mr5241409637.17.1761195472697;
        Wed, 22 Oct 2025 21:57:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMTxhqhL+ktvwqE/YLE0iG/l3G2teVCl5Mj3JLXQrTPp6ntWIdAjtA5UiZSlixP0cbKprHZg==
X-Received: by 2002:a05:6a20:d088:b0:334:ad99:7e99 with SMTP id adf61e73a8af0-33b6a5dcf35mr5241384637.17.1761195472265;
        Wed, 22 Oct 2025 21:57:52 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6cf4bb86cbsm814289a12.7.2025.10.22.21.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 21:57:51 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 21:57:37 -0700
Subject: [PATCH v2 2/2] soc: qcom: socinfo: Add SM8850 SoC ID
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-knp-socid-v2-2-d147eadd09ee@oss.qualcomm.com>
References: <20251022-knp-socid-v2-0-d147eadd09ee@oss.qualcomm.com>
In-Reply-To: <20251022-knp-socid-v2-0-d147eadd09ee@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761195468; l=680;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=BWJCkcRPP96Xh9dkql3wSobHLig10eB1qb/PHKQyTNM=;
 b=k6289RchbVm3PRam54CCkf+f1qp+jhTz2xYwJ7heEtyLgCLOuGoYSqHiiVQ6ROzjdExGR5SVE
 WhEB+9s5/UQDQaEINLMmfjhZ855lSCb2lCiyZSojsltmjwuodwJ6Glt
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: 78kMIwr34CAIl34WXOPFLCOV-Y14aIlY
X-Proofpoint-ORIG-GUID: 78kMIwr34CAIl34WXOPFLCOV-Y14aIlY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfX05GcMJevYmAl
 Eu7GC8xMDZxK637YFy2NYe0ROWBSDB3LiHvy244ndI7L7Ql/CtdJ5wJd6CmgX/hxJtamFd3S6nP
 WACip92WTVXr3LiLV0Bu2lPlbwz3pq4rR814e7AqQ4Aap43aHwISkjEfbqxHg8lnKrE3iOR33qO
 NqUobyZjb+8JbV80WEScfLVe8PoBmwkQoCqL2ZS7OUZrLsH9FqkpGNETqJu1nZsmQW+dfqd2iLO
 8uCY7X+8VEFiSErSmV1sAkkheFxFFF3tMmlJ4tCssSpFXvFfD4aA1VY7f2mRPJFxFqwuC3Y0x0R
 7x55SjAb4vc6L40m0lqPRQlwUS2GHOPQndFX/qIUMlOLjLbGbDWFVKbZI11Mp2KAqpFLXp0cwB4
 Nn1OGsOzI36vU/PfK0iOjXKF+osIxw==
X-Authority-Analysis: v=2.4 cv=E/vAZKdl c=1 sm=1 tr=0 ts=68f9b5d1 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=SCjz2f6kJreciZqEAHEA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180023

Add SoC ID for Qualcomm SM8850 which represents the Kaanapali platform.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 963772f45489..a2e2e15b840c 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -461,6 +461,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(IPQ5424) },
 	{ qcom_board_id(QCM6690) },
 	{ qcom_board_id(QCS6690) },
+	{ qcom_board_id(SM8850) },
 	{ qcom_board_id(IPQ5404) },
 	{ qcom_board_id(QCS9100) },
 	{ qcom_board_id(QCS8300) },

-- 
2.25.1


