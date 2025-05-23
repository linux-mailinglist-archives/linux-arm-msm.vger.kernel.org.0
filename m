Return-Path: <linux-arm-msm+bounces-59263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F9CAC2A3D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 21:08:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39771A47A75
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 19:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B49E29C351;
	Fri, 23 May 2025 19:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e60nxV3W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEC229B8F6
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 19:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748027281; cv=none; b=dDwlrIHcdCboPwH39YuMAqrwL6+J2Xe44WXaH2uvO69JorqyTqD2FHa3Ip1wC2n0w62XKei6DirYeumgjATUgOyc2xNd9BFlCS2vEBwpp/PzYhQX5Py/4AXJhREeyIVwZUZOLAI6Sk+f97aONXcnc6xCrKCcASFRleXX/+yNdYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748027281; c=relaxed/simple;
	bh=D0xORoC11ef1b8XnmpFCtI0ADFqZVD+IG8XxNMK2QjE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EkFCDKs18NpXxEyGKH/apu8uYZwk50xgpuo3BtwgL2dT7CQzxCtkH4raNu06SigK13K3xCqaRiN0+8ziXjDPIyObRT1dlkEXHbgZRiMBreYg0/fl+H0IyfQPRADr7orslxe+PuvJOaCqaLBd/SO+zPsBCPjzLim784SXLqL/UN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e60nxV3W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NFKP4X018127
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 19:07:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8EV5IZ/cv+QD0prKkLqN1dGzXsThgsP17A63Jaenuh0=; b=e60nxV3WqIfbHkSz
	gipZ1mw1a+xmAqnpCw8h17wynkLygzlHgJi/vpGkJ1RG7b13XK7sV5CXsG7yjen/
	nlvOjrurBR1FCUMzE88B94r9fftQba8sO2h9HpGaDth7dq1eiahOsIqCT+ebUVpw
	aBZ73skugPKFK7WwPp3CEy62iJQkgdzfyVXZoOZEkdlFaOvMaYPIjMZguZoO4Fqm
	NzDF0Rsen0vWhi45LOUolFgsWCIR7j0yfl9Fj0Ns+/CxY1RQTkGktIgUDC70p3/r
	pGo9fbgAezzXErTRrdk252FQRaD7eseQsOPZ8kKAnRtQX8yDmbzNcc/Q1ZD0dy8j
	SGuU2g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwfbauq8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 19:07:57 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2326a6d667eso1623655ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 12:07:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748027276; x=1748632076;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8EV5IZ/cv+QD0prKkLqN1dGzXsThgsP17A63Jaenuh0=;
        b=EuPq5o2yH26YZqRJ4My1kzJwzF1X0h0m4TBePdJVJxfsjch+12thyj+u52Dr/UJMRN
         lIlhfrwh86iz6R7rHsoBV6pV20cbjGtSTelxbWwH65UaNm5i5TKz9/ZMQJBqNI6mPO7+
         L+r8zTVJTg9AzF5mHdcAvzUKHiKGCl/jvPwDxTQDrJa3DeavMehqontdx/8JT5rY4we7
         seuFhjbhHBBW76jzZxlWewfMzZy+UNddgY2JajRKJ1EF6Qn7FmgBGgCDF2hNe0KyGvFe
         o6vgY4ht2LyY4uU3W3thrn2fCe9NR5AAtI+hiP7RNu+EMG6Yw7xDeRs63pgY4fPX6u6E
         5OIw==
X-Gm-Message-State: AOJu0Yx98W8lEvSoQXNszSzsMgKVitYZnjxuipAg6Tbxx2zF3VL87Au4
	MjTukSYEKIAgwVB6N4RXKG7GLTwiYkOvdJEwfWkkzObgF9FP6n6K+9CNwjPIGiYXqWA5N9J4ugO
	90wXFFZmCMuK9L8u2gpYzFemOxDrbjoPU74k3q98upO9CpNpTSCH1nbkBQlc+X9fDAwkru7jY7s
	jF
X-Gm-Gg: ASbGncttHmbWTVYtsmpiecZnI7x4WseoXKkj+uocZNf5Lmc/gFHvdVhLjzm90YHK7k8
	9t+e9De3N3RWtrfKLliaUDNoAZNZGVV4sn2F7Xws0vzJzcgvYJZM4wTHQHLitEzMiuyDzPYmHJA
	GANWHVmDQ4at7g8HEcit4NxmKSOo6X4Xw8zshKQOlhECpyWdnkLnmdk84tta9tu7mrS2rUYZWZU
	junp4gau3WBs/2R06EOYousC63ZogJYTP+OiS5H1JT4V5rUp2pg7P4jPHr6TFnx4LgB+4BRG53H
	QGxTzctjJe21uUSk13tq/RD1bxLLr/mBWFCG+VhaQCfIQHprZV7WTr5K9GI5gOyD2uzsR1I5bvx
	46rE=
X-Received: by 2002:a17:903:2988:b0:224:c46:d167 with SMTP id d9443c01a7336-23414f6e2bemr8194685ad.16.1748027276355;
        Fri, 23 May 2025 12:07:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEt70NeKTNYAk3drZ2nNdndV1zNORhUf309UeydAVRG81OvnP1i/EMYHqZv7xctkGrD4Rbsiw==
X-Received: by 2002:a17:903:2988:b0:224:c46:d167 with SMTP id d9443c01a7336-23414f6e2bemr8194335ad.16.1748027275995;
        Fri, 23 May 2025 12:07:55 -0700 (PDT)
Received: from hu-uchalich-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e97886sm126652165ad.146.2025.05.23.12.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 12:07:55 -0700 (PDT)
From: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Date: Fri, 23 May 2025 12:07:42 -0700
Subject: [PATCH v7 3/3] firmware: qcom_scm: Check for waitq state in
 wait_for_wq_completion()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250523-multi_waitq_scm-v7-3-5b51b60ed396@oss.qualcomm.com>
References: <20250523-multi_waitq_scm-v7-0-5b51b60ed396@oss.qualcomm.com>
In-Reply-To: <20250523-multi_waitq_scm-v7-0-5b51b60ed396@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com,
        Prasad Sodagudi <prasad.sodagudi@oss.qualcomm.com>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748027270; l=956;
 i=unnathi.chalicheemala@oss.qualcomm.com; s=20240514;
 h=from:subject:message-id; bh=D0xORoC11ef1b8XnmpFCtI0ADFqZVD+IG8XxNMK2QjE=;
 b=yd/3KdrfWRyyINpbCMDlshSQ8pxWotIQv8EtjntZ329GjkV1bES6yLijTcQ8uMNFkBuWjm50O
 O6XQ+tjD5fbDSbtR7nC9bfkJfNbhhNM6rLBYxPOUeuAKrtkpLvTj1dr
X-Developer-Key: i=unnathi.chalicheemala@oss.qualcomm.com; a=ed25519;
 pk=o+hVng49r5k2Gc/f9xiwzvR3y1q4kwLOASwo+cFowXI=
X-Proofpoint-ORIG-GUID: ETO3pqCUkaCeAi6ecr9GwX15xVqcPsmH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE3MiBTYWx0ZWRfX2wdVpNE0Nl6i
 Q4RIiGcdxyhlXil8KaDjxQvPqRZxPn9srQWlOl30MrOuZHhylyfoPBZAi27RX6hvOqehs/Du/DY
 EkbX1Bn7BItpDCgvAxX5drGY5oWGuRERtx5/M0z0J7uliMSwLhxV2PnBi5JrgdoXMoVqyKcBosM
 huIGgbYPCYwMQ+l4slvPr9DufbMPLfm2W7xy5NGgs+Axz1nK9PEQsCjekrUycCCOLd4MVFWlwaL
 JyOH1Ona3fAzNVBbtPrAqWSntUrINnZzehWXo444LQ4VjFFN6NnY/qgwUcVbsD/v/Bs10icxzpv
 F7kUs21lanS11xU4W4WQb0BK/YMgpQI9ZeqgCKAKq7rm/+82/EypuOnnDnTsG/PvqHnRvTmq6Ga
 n/N3DFLf4d5Qe+dpmM8DlHJGzA+rH/ITPTEWUnXweuVB88khnmNRH+l/G02K5Jqq+MTEZEiV
X-Proofpoint-GUID: ETO3pqCUkaCeAi6ecr9GwX15xVqcPsmH
X-Authority-Analysis: v=2.4 cv=dLCmmPZb c=1 sm=1 tr=0 ts=6830c78d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=X2av7gLQQKfhQ01XcpoA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=894 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230172

Modify wait_for_wq_completion() to check if task is in idle state using
wait_for_completion_state().

This allows for detecting when waitq contexts are in idle state and
propagates it to __scm_smc_do(), which is beneficial when task is idle
and waiting for a kick to accept new requests.

Signed-off-by: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index c2682e9bde58b6f132af0c1bc2e194db0e401e3b..b8ce02099584c4a87095cdc2dd688cd28bd2dae3 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2189,7 +2189,7 @@ int qcom_scm_wait_for_wq_completion(u32 wq_ctx)
 	if (IS_ERR(wq))
 		return PTR_ERR(wq);
 
-	wait_for_completion(wq);
+	wait_for_completion_state(wq, TASK_IDLE);
 
 	return 0;
 }

-- 
2.34.1


