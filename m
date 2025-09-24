Return-Path: <linux-arm-msm+bounces-74556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 274AFB98304
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 06:18:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ACEDB7A22E2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 04:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7216C19CC37;
	Wed, 24 Sep 2025 04:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FEVtG/3q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB87718DB35
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 04:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758687533; cv=none; b=ej5M9QJDnYV6GbjfzQS4QDvso5jRZHC9lWsgPVj8n5WLtxu8JprCW2NhpSKhgt3wpssJIHAvec5Wp1zD55rLBSqlzire5791q+DATO1pEbRHePvPM+55yoZy6SImoJDYuUzd/ULNSB9RGCxqmilEaphfEn56eioczvmpKoC9mSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758687533; c=relaxed/simple;
	bh=XjqILoXA+71KrBfO561DUam3Ijy3SWuNOgMgA4I4huY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TyVjru+sIu+Ynk009Q8Uee+eo+LBJl1egJX/0TgHvCoQuy/Dgkm0Ddefw4F1vv8kFV3Hos49u0Ze36kTdP8c2luTj9RcxD5yPt7YscZXWZRv0GdWDUfCegx8E1L0ZQf7WOPIqmnXvtuczt8ZPZF24s2hGm9BKvJq72SZE5g412U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FEVtG/3q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58O0j7bT026253
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 04:18:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vpne8kZfYGsyYm1tUZn0/7
	hf3sQHlEA0+dwGg5a9hKo=; b=FEVtG/3qsB5no1GFaKRKUVNyTCbXLi02NF7qcw
	IVp5yUikaWGHS+IvOoRaS8b8orrZrs8YayozfTRa488RPK+N0LZ4tC9wuTmnoWpS
	fAtD2xBSW/ZKxA+mMF7qm54LVEQeC/IomiuDIEH8hNYm2Sy3i3guRQTJqFySdVS6
	sPNBorgTUORDzbFVFAkuKiZppUvZLjOfELtya9GaNtuHel75YUxUe/x51aAhBXuY
	SdMhkLJfQ3Ah1dNMdzdJqt/9refbK9VFTkLU53Lyv42+I5MgEOfoLMsUunt0OkF3
	Pe3+t9ZkPtBEwpZG+OZnbzCy99L8qH3dSckaOmCcVJDzfdRw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyeu9w8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 04:18:51 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b551ca103d8so3399567a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 21:18:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758687530; x=1759292330;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vpne8kZfYGsyYm1tUZn0/7hf3sQHlEA0+dwGg5a9hKo=;
        b=o4HPWafirXaQnKIOxAJrL86RIUTE7l6qECGnN+aw+CmEaSaqCmiFPD9BwTBxO9mxrc
         EpLQOr4GSI+PddbhtAO8Cmb6tnPACPR3prHfcXNNk5h3BlbqIZHYoAsut5gOOuWSJams
         4tmlC3BcYjQPLEHt/d+6AL4Awry4bboaCdcVdotj7idWkob+3spQD3kb91wyOaDyZMMm
         o0molIaaHK06kbkasPlalxRkV01Y3ClzX3vQ/mrva18zMhxoBj6kcthrpNOd4Nz4mwu/
         ffvc0VTF5wYXkVXrbXNJPQl0dq0AeqEX0SqW5TA49YO9hgyX0LId8lQQazjvkIynWBdg
         o0jg==
X-Gm-Message-State: AOJu0YzjhSxfO2ZjG3OxYH9DDA5OVev2p5gfiT07yj0xnbVg3ROI8SE1
	Zm8yCL5b+kFLBXNoOEKuim1MkioGLLwn6ssZlHZBEpsOgg5eTu5hzXSE7BVtitW5CC4oJiy5g7s
	j4VpCy9Ce/jtrBZcOZFJlY+E20KGbMAqDt/eCLMDURec8vKKXjaQagm2Qd8yAmyQSQIPB
X-Gm-Gg: ASbGnctN4aBK8I+T4h3UT5p/dED6S00mN/wKk4cNJ98t+CqctOxtidF/ql5d7Y8bYVX
	9w5rnzvA6OAYFT9taQlO8ol8okg8DFH9IZqxSNZrkQsZsgjo+zBIgQT1mfZn6PP7JBrZUvSL9SK
	/69DCbF8spFJyw6y5UHsoAAMeM/9XQUgnTYdqoyaJCoWPkrf2efQRb3/7DhN9R8SQOy00q5oxOB
	IMttpGB+QWiEmAUTxhQ46vT/Ke7k32EMKqoNNigxO6PgV+pIm2ApyL5qsyesPSdWqQ1SYi0Sx3W
	fSDMmKDucLcU7m5Slw8YiVvk3ZWzVXMJG8/9+Skl/axqZcm4meM94w18JtJTxbgRanwQN8vstVr
	A2bu4DH+m3tHmQPI=
X-Received: by 2002:a17:903:985:b0:25c:e2c:6653 with SMTP id d9443c01a7336-27cc8f01f45mr56276185ad.48.1758687530133;
        Tue, 23 Sep 2025 21:18:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtTISyFv+vw6Rp5AGaka7pB9YW6GXPmR155iN4EzVrngkZl6LwXVUXX9orIpKdONELQ+C7Ng==
X-Received: by 2002:a17:903:985:b0:25c:e2c:6653 with SMTP id d9443c01a7336-27cc8f01f45mr56275955ad.48.1758687529694;
        Tue, 23 Sep 2025 21:18:49 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2699363989fsm170133885ad.92.2025.09.23.21.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 21:18:49 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH 0/2] soc: qcom: smp2p: Add support for remoteproc early
 attach
Date: Tue, 23 Sep 2025 21:18:41 -0700
Message-Id: <20250923-smp2p-v1-0-2c045af73dac@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACFx02gC/x3Myw5AQAyF4VeRrk1ixiV4FbEoii6MSSsiEe9uW
 H7Jf84NSsKk0CY3CJ2svPsImyYwrugXMjxFg8tcmTUuN7oFF4wtGztRjbOtCohtEJr5+n+6Pnp
 AJTMI+nH91hvqQQLP8wLp/D9HcAAAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Chris Lew <chris.lew@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758687528; l=678;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=XjqILoXA+71KrBfO561DUam3Ijy3SWuNOgMgA4I4huY=;
 b=/xD14ruMZYYv47gcLQJJp3f0aPAUUPyVcTZPLnh0kqBknliAf74Whd+TZwvqGmm/IJ0AgpxYo
 GLzosOvKRsrBZwGOfM1DIfUWp7FBu39PZ7ye3xgpggKSo1xCFQuB+KK
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: n1WpbtY_JqTD5RlCtnJy-vNmr6HYy90S
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68d3712b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=zY-m3Q_QrtyZ9r60RnwA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfX2AOi2qz8JS7n
 LAHCHDeslyGVjutxOIf6uY4pgTqeMDCnaKSklPx0Q3SdfxBnZrXIXZl/MMzYsNFhQY9Ea8wqLTI
 cgRBUOFBJHoNbBx4r2CRGtx9sK2CDBR0u0yWvorLlyqMRpNADVMMiTFLjY3kbgFCyjSxBdqrNm8
 rmkcTxQUT9vfzAHJaRWvpa6peoR/NjGKZ+kRtwqQMrLwrwH3Vss9xXMi3jHQs1CtncGaJNUwfz/
 WyzRydy93ftD1Mea5McJioYqGZgbkMG9dQPqIEBl8+8sB2JgK/7XzHBvT7/0mVx8ZqRi0tox2Ya
 zOOhq2PLvcP5SNfXuoQWGuFVWIC57rAN69GdJShpOItfPCcy2YOyCqPUotr2srj+mu8eYnqhHNB
 b6QUR3yF
X-Proofpoint-ORIG-GUID: n1WpbtY_JqTD5RlCtnJy-vNmr6HYy90S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_08,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004

Some remoteproc will boot during earlier boot stages, add callback
.irq_get_irqchip_state for remoteproc to check the states in smp2p
and mark the state "attached", also add smp2p v2 support.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Chris Lew (2):
      soc: qcom: smp2p: Add irqchip state support
      soc: qcom: smp2p: Add support for smp2p v2

 drivers/soc/qcom/smp2p.c | 90 ++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 87 insertions(+), 3 deletions(-)
---
base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
change-id: 20250923-smp2p-1591de8af164

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


