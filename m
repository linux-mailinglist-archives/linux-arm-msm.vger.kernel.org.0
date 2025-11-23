Return-Path: <linux-arm-msm+bounces-83001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CFAC7E1D4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Nov 2025 15:20:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9CBD6344EA5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Nov 2025 14:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E65C23908B;
	Sun, 23 Nov 2025 14:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S2PF8B4p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ea54ub9t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C530B2D8375
	for <linux-arm-msm@vger.kernel.org>; Sun, 23 Nov 2025 14:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763907591; cv=none; b=sg5ld9yQZetal/wz/CqoyZxBlBRvgdCNM2E93r2bX96br2fPIFr+uFJ371VXSx6iM/eLA754d7tTBLHm6ya5FJbF3pI7pzNdeIT6JQea6gZYxBAOSZYvQ/rU9BtWPvNCY1tFHBUEPYzVjC+6y2xM466DqIKkdevloa4bmIFFqSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763907591; c=relaxed/simple;
	bh=5rLIH0pbgZVGNRk8Y7MpYv7XibWR+Z+oJAscnT605F0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Je4PuuZoTn6cGxuOPuhMOK7bGh4ad4y0OgVAJmti1fmDRn3D6MKbPeQ0SEqeT9i03GtuVbsq2dN2EesPoQXutLGs7D1CtlsCUUCJOwQnDlf2TnrU6/Rb8go6ZAiQQTJ7PE4rtf6JNfmMbICbxXf6NaPjyQ+Y6X2sdkwi0QUIbhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S2PF8B4p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ea54ub9t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ANCV31O1332056
	for <linux-arm-msm@vger.kernel.org>; Sun, 23 Nov 2025 14:19:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tIUtGezLTYSmkaEQHiNfOZ5kJ5ICHqHIbG7wNlDi+U4=; b=S2PF8B4pKU/MWzM9
	+h3RHovf/fzGplgwu0yaa7dgL4k9wpAOaMOAH4VTZybSP7c4lONxhq69gwOHscs9
	z9hZDu2Q2nwBZflUSKhf49uLjSGEkLRNJO1ldamvOinCvk2joNRUV2pS/TdkxlgQ
	UlFFdK83/twIaC5LglI2kcwT5FmOrrdAFLWCQ8oEW3tqDuGinHqvrfSEkXOoqOYA
	UVU6yr+P9Mj8QT7/YDAYaM4ZY9Pj38YwFMr53BiEJreojVmyKpmV4X6/Uqi8h2HP
	7CKAY29lgXY1R0Ol2AVLHLVyfoBvyMZStGGM6oNut9BGDrT4ZCcqexwxjcqeKUSA
	Y1S+3g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak6cdtecq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 23 Nov 2025 14:19:48 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3439fe6229aso3471471a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Nov 2025 06:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763907588; x=1764512388; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tIUtGezLTYSmkaEQHiNfOZ5kJ5ICHqHIbG7wNlDi+U4=;
        b=Ea54ub9tMH/xMh8CZrNVGpAhIWTnqE3HrVmEXU0clhx5XHqr4nb3NHIQH21e4ZS+f6
         aP6/BHpDLIrb1lpWH4ywk9Di5dIV++QWPvIDlBMNRq8/RN9LPAgrD67JbaTOWhu2EadX
         vxBgyXHc2ZWSNEntbVSXw8UUo7WKu9L7ecipwVCv1R5EUNR2wKie/oersHIhXXEPDfod
         CphvGmZQZ0WcdzI055lkMrCxS8nE4n5Nrggnq73cUWsLZPDVuakd92xBMyKNB7bzmGx5
         /IbbNs8L/18Gax0a8DvoDmGJmLwY+Xq2qEF5cbfZLeVeJPtGwp5VDQIOVXgmkVg+jYaS
         Ps3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763907588; x=1764512388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tIUtGezLTYSmkaEQHiNfOZ5kJ5ICHqHIbG7wNlDi+U4=;
        b=H1abH2kO2Fcdn8fOD5RIYTi8TO+et2+wuy++4DIty8xuaZ+vyHjyL8T7NxO0oLrPi8
         dgmbq1QFfNMqUQxrK0pp6xtMhb9/+Tyh8Gb5GhDNoyldzzxm/SZYlQFHNXhKGcHAV4TE
         SleZMeq4HZ2Y3NahmYVcdiSicVyoqFSZIyMRgN9Wgmabtq68r1NKnjYnvon5q5aIi+ha
         52dH3yj+MK7jYZotC3GvqJlekCy1+WZCYzMNVc+/WLeTuBhSJ4EQ1j5i0RliKfLsAz72
         xjl4s7WvfHHWLhpoVEM9YsMlA+qZOKr7Al7PmNpElJGJmDMb1cN5Hgjm/P3nxNM08s57
         RQMw==
X-Gm-Message-State: AOJu0Yy7YpzPUlflHgdvcKl65e/CmISm2zA7XeXL/INgyhCsaAapggkx
	rpuOALCc9JPMJnOMbnuRAnQjg8y+BxS69ZvG+xR6Bn7A5Oj0F4XsK4L1B9wNHXLFoqR57G099yQ
	jUPhrJSLzRf2Yfq9Pu29FXaDgfGyGVH1oe9cWRA2BoSjYHz/VyX5iyOG2aLQW3qC+TAdr
X-Gm-Gg: ASbGncsGztiM78ei6POvS6oJ4pcxVzXMsUthBFd7mtKahAtY4iAmgT1seGLnoH/hkVo
	5TG8y5ohqkaJ1yLn6ez2tXJqEMvoxouyefbTumKtHGLyvIz1pkD9XTXioEDfM09mJVdMX1K87G0
	GJ5SjO7ZjWvZ3tckViYioNaTY4VZVAR3pBwj82VStmm3lwPhD2QnbmXUtvcJisbDcM/ufuyCzWS
	lHmDTQWxWcoCh82XZnxZfi3PuKQbZWiGPkUFlk+/xv3ulK13mzDOcvSUyPq7SwuX8YVzplnNgRH
	HZAXHcoGqo7bUzzFA4ztGqzVkIXV2qozs8WQPLWAq4SDRz4RHQHDZ5tt+jAm1IGOFLuSHmkrJCB
	EUfzHgcnVw1Y+PuZ9gl+5uYCn7x1q547Lvhubp3PIsH/8Vw==
X-Received: by 2002:a17:90b:3bc4:b0:343:7410:5b66 with SMTP id 98e67ed59e1d1-347298a9f91mr11492030a91.11.1763907587640;
        Sun, 23 Nov 2025 06:19:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE8+iw9JEE8KL8V2QvoLa7/4Y0GF8+Y5R2fOPNQ23o+4pOOjfTQhH5KQZFUI73ZVRLcgefsQw==
X-Received: by 2002:a17:90b:3bc4:b0:343:7410:5b66 with SMTP id 98e67ed59e1d1-347298a9f91mr11492011a91.11.1763907587170;
        Sun, 23 Nov 2025 06:19:47 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345af0ca952sm10135992a91.0.2025.11.23.06.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 06:19:46 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sun, 23 Nov 2025 19:49:32 +0530
Subject: [PATCH v9 3/3] firmware: qcom_scm: Use TASK_IDLE state in
 wait_for_wq_completion()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251123-multi_waitq_scm-v9-3-0080fc259d4d@oss.qualcomm.com>
References: <20251123-multi_waitq_scm-v9-0-0080fc259d4d@oss.qualcomm.com>
In-Reply-To: <20251123-multi_waitq_scm-v9-0-0080fc259d4d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763907576; l=1328;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=muVZyS/ZI96TOitovzS/6m9ldXptICgjgmgqz4hzF0Y=;
 b=sh5nb3RAWPn/vaCaXuixCnnOdhSzRgbViCdbwqzaXFqPjzk3iUKqKJtvTHcNrWUZnjNn17DYE
 mB3ruW6MV+wAP6IWDAlf6ipRG/K77DQ971d5glZJ1FWjbv1AL6L+E82
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=bsdBxUai c=1 sm=1 tr=0 ts=69231804 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=CXMSIrXqJIVyGMYrj-4A:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: IfNVISzl9SAKWD94jW76yJ6Bd9rySl-_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIzMDEyOSBTYWx0ZWRfXwsVnausUeuSv
 FnLpJoBggB9LnRIO0JmfwLllGyFfLYHTuJU4QrJnDA8tDOZRBvoBvqic6zh8WW/+Xq6zf87F8oT
 NX1aF9FXOe29MT9nfTtiEEC29qg6Gt2/PLBsCNE1RtS+NFCuKGw/SO8OEuCgLw9yfd3SgNSoh1C
 mpkwRZXbFg+Ot1JTlS/Ur7Vsvv78x/3saFpV/YFnTyHpWbNNU0094E0THEreG5DS4DcDhwIx8Yj
 iLcoFBvtgzCLMcqH0uxfWkRYOCVu2U3UCkJnJsO638fHV/3GvfQqVQEVSAPnYZ7vpDp1avCTcPh
 Uo+74mIqGVjJjA8dU8L5iFIMAHq+Y/jOi6jcs3tdB4msl0jsDVr9+LPLBJmfR7GzHEppZfcwQ6/
 b/IPBclsDI5eiPCcdIeDO4vB8lLmvg==
X-Proofpoint-GUID: IfNVISzl9SAKWD94jW76yJ6Bd9rySl-_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-23_05,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511230129

From: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>

When the kernel issues an SMC (Secure Monitor Call) and the firmware
requests the kernel to wait, the waiting thread enters an
uninterruptible (D) state. In case of an extended wait request by the
firmware, any device suspend request, cannot proceed because of the
thread stuck in D state. This blocks the device suspend.

Replace wait_for_completion() with wait_for_completion_state(...,
TASK_IDLE), so that the waiting thread, show up in TASK_IDLE state,
instead of TASK_UNINTERRUPTIBLE (D state). This allows the thread to
block until completion, without blocking the device suspend.

Signed-off-by: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 149c2ccec2a5ff77054178fa021fd0b721d9f8d7..dfe0410fa9f965b16f8b0a9d98f3046e80b8b97b 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2320,7 +2320,7 @@ int qcom_scm_wait_for_wq_completion(u32 wq_ctx)
 	if (IS_ERR(wq))
 		return PTR_ERR(wq);
 
-	wait_for_completion(wq);
+	wait_for_completion_state(wq, TASK_IDLE);
 
 	return 0;
 }

-- 
2.34.1


