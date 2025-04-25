Return-Path: <linux-arm-msm+bounces-55791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C4AA9D661
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Apr 2025 01:48:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D4DD7A7237
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 23:47:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5580C297A7F;
	Fri, 25 Apr 2025 23:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UmJTjqsn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF4F297A5C
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 23:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745624894; cv=none; b=ATCmoqjmCq5hUfAMQo1gdduG06DtWUXAelW59VaXkgmtjqam8eEnv0bc/wObu0He+3phcXUsZBxpK8Y9ep/GMsnRrHBN7vhjrBR2XWJRaXLkcW32N9tIy2SiFfBKqc2EmKnk646AWu5W/VjSqImmTWp8IaTOoEjGMiVCTpiRPbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745624894; c=relaxed/simple;
	bh=gwwTPMyq05pjTkKOQrslTYp8aVG/FQQzoFZPwY0uOew=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lRVGSlS8rSIaHzUJFqoBasH3mQKz8KDPwsx/G3gigKgTtc+fBsZtj4zepPeCe8LkJ7/aPUiqq9zPQPjcNW0CR66yUSq927TuXOCkO0v4Sy9lMfbWDLliCOUT9yuiSCIiT54iteBJpkwP/BLR35B5MYMP0HbG/IvpO5g1TnRYxf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UmJTjqsn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJtPX011069
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 23:48:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ql/GedPHsogfCaw+Of5MFjkN2fS6Wzdt5YLHuFucyK8=; b=UmJTjqsn91dMrfym
	30yGQBWukHXKlcxOU9BiHipRfva700WZk/Hvl6CPEx4GdQ4eYLwMbMRDb1jHumH3
	zUxcHrgeGfPjaqV58BkwqxTOaMbw+9Z/C30Hktl1zK+9c7ro79bzCT+L5k6oHMD/
	XNeAh0GfL8olQw3XRFFtYWy04m+hTs2n8WzcC+JPpUzCw1xlrfc9jeIwLpEJyG6a
	5PqoPFeBFDrTeK9oZFhFgFApWygPWt8phjD16nLsDbmSbVVlIerKLPSKqEnrpO1u
	q7ITnReEhspvGa0YZnCckLU5qQoATxmXbKJ26BvSlXNxRmyaMOrAj+GnbWox60Ow
	0yA8rg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0jpy0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 23:48:11 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-736b5f9279cso2527474b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 16:48:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745624891; x=1746229691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ql/GedPHsogfCaw+Of5MFjkN2fS6Wzdt5YLHuFucyK8=;
        b=nSNBUCJ3tSFM0DoA/0z8UdVfm0v7PsLhFgQVYOJVsrdVxfR49jJiEz/r+YG49soAXr
         C9EgDkrfufO21GUWmws2MEM3vJ3uhCUh9PdeZpQB9TghSJ22xegl9BrUlZsAdBEcEb3z
         UHHFW4ky2DzsvXjjePmXwBpU6OJGqTKHlfIfuD8mIJqy3ew4VeQy/SwtnHTMfPunjOZj
         a0TJul1bsk20rRVyKPnpDLvhIRTagFltyZf8/TxA1IYHiZegRl411JT9yfDmGeDIlxuN
         s/yCT0MIPGS8Mft3paZn8BIVFFuu1sr+EKEGrxL8jqCuFdYJCgYE44J/ooy5sqDfEjQH
         oFyA==
X-Gm-Message-State: AOJu0YxoxPwYE2qNiMy5AsWpfkUSSBfKHPibYAdIuaiBS2+WjOZDpaw8
	gnvP/EgoVUcmNJAfnElnn4xNzsgLZZqQKEhyS9dMoBu/tpFxumnIhHo0WPxtdz9U5EYLNQiboTY
	q3EzSQ/GiEiLQlU2jIbUrILiRZecR7Uvdpu0lQOuaJJ780OVXIoOZwaLvB8v5rh3+
X-Gm-Gg: ASbGncsrJLsF6TgaqPb4M0wZIgzO01MqSJApkmynwigTGBX0ocZbohvYpnPA+iothKS
	bb06dxkUJ31NSytmqPUAoMFwR79NhVVA+6dXcVWNz5YQq/a5fzODKb2/wzscyxTyVQjAZXVH5Bp
	dz62hVH6WJ3IbZ1mnG9SVxFA825Y+QCo53XJ9+1QVkWdG5tjlXecaaxjlq8XHb5fz74+ke3SSvI
	jlCqWtOwdNOC+SURWFPA8K7qreM2gKCfhabkIVARL5LDVGdCybEej6tUCGuQe+PC4ZkGzjEFJp6
	jZIhHTOhESWhJWh0GbvF8vwkdHpGzlD2/Fj/Kx8UjXKlr8O8k6AlIAnn/EGAfhwzYDQxqbf5ZCp
	r/Dg=
X-Received: by 2002:a05:6a00:2e08:b0:73e:1e24:5a4e with SMTP id d2e1a72fcca58-73ff73a63bamr1864847b3a.24.1745624890997;
        Fri, 25 Apr 2025 16:48:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHezxpYHXCCMetb617T7Rci53xT0wLk2loNMf3snuVi5zRli+LkvdJ3GxYxD64Vb1hRLfTu4w==
X-Received: by 2002:a05:6a00:2e08:b0:73e:1e24:5a4e with SMTP id d2e1a72fcca58-73ff73a63bamr1864820b3a.24.1745624890666;
        Fri, 25 Apr 2025 16:48:10 -0700 (PDT)
Received: from hu-uchalich-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a9a308sm3868948b3a.136.2025.04.25.16.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 16:48:10 -0700 (PDT)
From: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 16:48:03 -0700
Subject: [PATCH v6 3/3] firmware: qcom_scm: Check for waitq state in
 wait_for_wq_completion()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-multi_waitq_scm-v6-3-cba8ca5a6d03@oss.qualcomm.com>
References: <20250425-multi_waitq_scm-v6-0-cba8ca5a6d03@oss.qualcomm.com>
In-Reply-To: <20250425-multi_waitq_scm-v6-0-cba8ca5a6d03@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com,
        Prasad Sodagudi <prasad.sodagudi@oss.qualcomm.com>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745624885; l=956;
 i=unnathi.chalicheemala@oss.qualcomm.com; s=20240514;
 h=from:subject:message-id; bh=gwwTPMyq05pjTkKOQrslTYp8aVG/FQQzoFZPwY0uOew=;
 b=0CAPlycTtrHQjH6dpC9Sdnb9RW1CnD6mYUNayot61XtWt57KYcFiLU7eYQ6KnMoHBBYP18axg
 e2GNFHyEQhwDP6GZwlGtLFvVF7BGPj7iGY9+Jq776+O1DnCXYXdrONp
X-Developer-Key: i=unnathi.chalicheemala@oss.qualcomm.com; a=ed25519;
 pk=o+hVng49r5k2Gc/f9xiwzvR3y1q4kwLOASwo+cFowXI=
X-Proofpoint-GUID: 5aium46vN1M63I-jLZ9E3Njmv5nOcgAo
X-Proofpoint-ORIG-GUID: 5aium46vN1M63I-jLZ9E3Njmv5nOcgAo
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=680c1f3b cx=c_pps a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=X2av7gLQQKfhQ01XcpoA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE3MiBTYWx0ZWRfXy7/Rgp2Ms32V HZXosXcXG6WU9X2KhsP9iPGe/VzTyMNhycj2h+ZAZ581jQmWFTq2n9RiWMIFznbXA7DYkCJ1+d9 4yVKKr9t0DUvZvxsxntAwcEe5zXP0pRyJoBEr7fLU3jdUWwb5qAtqz7TKhFQF9TrEyAL2rOEu9Z
 bpi7h9yjXFN22vc6wQqMuODwIhm7rgpC4MHIdq9bhBrVEXjIbIdqM03KG2zP7+ir2hrLrsZ2aPS vSah0j1m1ZyoOvUAc3ecGqnywpid2Zk9B4tvn/HsN+zcmcI0KQQo0dBMxTC1tdCIVycrGo/xpbT gKMjPxD/IDiLgWrE15psonsHW3mcu8XVylnWtcLHUl4OIS0mrTc4kfq1cYuSIoL06g00FX5jRvY
 OE4tpvwWv56LpzGl0aOSlUlkHEovp21qgun2vXY/HPILrI3o286UBVkr1g2m+NbecGSoT1FV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_07,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=889 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250172

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
index 9f8db13ef1ce14cc324fa9f0abf5c6a97ceb7b8b..a03c18fadd9c6ca6ab5fcd5e386834dcc3663eb8 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2192,7 +2192,7 @@ int qcom_scm_wait_for_wq_completion(u32 wq_ctx)
 	if (IS_ERR(wq))
 		return PTR_ERR(wq);
 
-	wait_for_completion(wq);
+	wait_for_completion_state(wq, TASK_IDLE);
 
 	return 0;
 }

-- 
2.34.1


