Return-Path: <linux-arm-msm+bounces-69486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6550BB29A50
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 08:58:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8D1897AA7F7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 06:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D36D827EFFB;
	Mon, 18 Aug 2025 06:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OeZLdcd6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7D427C154
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 06:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755500185; cv=none; b=Y/7rH5goKUknqGbgv33R1v8iVV+jemZ7N6vyJr4xw9U3JFlQ8yta6U0tbu3kyYWIy0bNu94kYLGyckb1unSbYepI293osXUVlHMkrLNOZ+L1uJLhMLq9A/lvSXBnIreOta9dimbm7At3k1+VNR8GeGVB9NxYRlAGbMuHIJ11YvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755500185; c=relaxed/simple;
	bh=VRKkJyPIHYb7eI+77dobbkoEosf8XwqEXf3P34a8jG0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YZpYEeucU/xkqIqpQckW5P2CXGSVrvNRfO52xzGMjMJcBTLWCCMquk0ZSY4VePvuscxVWlr/FrhKrYC9gus61PswK9DX6gm68Qr2aF+DYctlbTSgZDqNPBbod13lWhhLk9iGnrI4ywqSFFDJOTKrtvahCaKDCqpv5GQhxLV+hOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OeZLdcd6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57HMteJg007011
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 06:56:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KqJ0pd1cftmxuJoM3+8jxhExU4GWVeeNWMlPt/Wsh6g=; b=OeZLdcd6mipZH84b
	Bze95LSpZub22oaGvk8PCHYPM2ICddEdVH8a3tg8tbaUQYeoC42gLAS6Xo8z4yat
	EcILVpt5faJ8P3tIVMAn1tpqgtgtWs/kjYud5wkLFtw6JCQoiPmOX+21+8cETl/u
	GfNyOpuRCQcdUaGiA1kV1hqZ4lV6QIQonqpL8BaLqcJ9x8gAq1pIvlQeJKHuzxOT
	rAqxIsO7QeYTpxgzVWfj0P9j2AmK/xNQxGwG1MRrnXd4MA81mLhU1lYpDn536/y3
	3LTig5RmE95x3ktaUjCNG5fnXKGwOd1iEyrLeZyWm/o7QxRcTxj7roI7nNITIVmI
	mW54vw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jjrfuhs2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 06:56:22 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2445823bc21so98471195ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Aug 2025 23:56:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755500182; x=1756104982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KqJ0pd1cftmxuJoM3+8jxhExU4GWVeeNWMlPt/Wsh6g=;
        b=MOWAS17Qyl3IV+jnox5LaLE++o166XaA25LXrMn1kvvD78SgpvaixUic0oKXykfKdY
         ydLBlb2kDtV/p5L63ObKFRF1f/2nb1Gxf/TzJni6r7nZ9CcYHZJ2wV5RWNksezEiOYKU
         JL/mBo+QirdEvFfH8N3HS+AAaD6XRTSPeLE47aeNTdIsvcqHZ6fE7vLC5/vNq7saJqJz
         DpMTf5hVNbIyQHMWhaWxO3e5VCglhpnBbT80N7OWdDHKbORHmC7rdK6UvMITMFLWrgl8
         bWGLkvWuJbv5TihUiHckPLa0U/Ga4MdzvVicAPwY2XsgqYsB3RYHLZSAOib9AUiwn7oq
         OVZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfanlSLYXYm21taFnJP+rT0Vb/YuUl1861MNb1H0UqVcUXsHkCNC40KW67Gqpi7O7mJ0osZA8+TEFrh6Z4@vger.kernel.org
X-Gm-Message-State: AOJu0YygMz2jPd9A7fQMuIfmS6fErKGdaXPnwAWsH1L6eHrHLdG1lk2t
	RyD7I9lzUovlRDfJrKlR7RJGdY6WrvgO7JFNTuoW/mJy/JOqifYqtZTCsF9rQGkG6uaV5bRodEF
	aFbnbYWYEJQ3bxSCRUmi02iYeGEusYpTzbjk1l9XhZYkjmccCsp+IwrlUp7WnNyHIq9tD
X-Gm-Gg: ASbGncsN3alqhzAwscGTXpzVmTbeznkf5Tk2t+epcyoUl4Ix1kbO2L35HHiYefyXclq
	2Y7zfS9uCnLLg1MThkeCJL5h1X3O0sykPfzUk7ADRn8FlqQU9DYs8XZnC7rIYoC36K+XaX3VV+7
	2ZqaaQSVhm/TseW+fw6XmrTPSMUi17ie/ynvdAw8ARJmOm4ckDRsn3WuPRM1ncpMmfidkKuAvbs
	i2Q1jWfr/0+tRzJGLOVB0z0jWRt7ELOL/vcfGWE2NFN/upcVbRJt2y/XbYGuhUdC+FXepXi5RAA
	3gr31uGU5fgbUZjpzcdSDQh3aoDmiOCZN94ckrI2olMFUW2VwCvk4L934TLdxfGOy5EaE9fMvh4
	=
X-Received: by 2002:a17:903:4b4e:b0:240:9006:1523 with SMTP id d9443c01a7336-2446d5ba0d4mr136433785ad.10.1755500181745;
        Sun, 17 Aug 2025 23:56:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETroDxJYGIyIPvDwM5oImCqL+/zZSX4gJhnhKuXRgaJ/nVRPOgHpZ97wp6pTTUeuLGkE9a5Q==
X-Received: by 2002:a17:903:4b4e:b0:240:9006:1523 with SMTP id d9443c01a7336-2446d5ba0d4mr136433505ad.10.1755500181304;
        Sun, 17 Aug 2025 23:56:21 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d50f664sm70240105ad.75.2025.08.17.23.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 23:56:21 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 18 Aug 2025 12:25:49 +0530
Subject: [PATCH 4/5] bus: mhi: host: Update the Time sync logic to read 64
 bit register value
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-tsc_time_sync-v1-4-2747710693ba@oss.qualcomm.com>
References: <20250818-tsc_time_sync-v1-0-2747710693ba@oss.qualcomm.com>
In-Reply-To: <20250818-tsc_time_sync-v1-0-2747710693ba@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        taniya.das@oss.qualcomm.com, imran.shaik@oss.qualcomm.com,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755500162; l=1864;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=VRKkJyPIHYb7eI+77dobbkoEosf8XwqEXf3P34a8jG0=;
 b=ogLjc4Nt0lyt61XbdjF9grKAQZjNggEwG+U62zk8ksA8Di1pRTHGwXONGGpX+RfExLKWxiyJo
 UXgpiO0FlRrCxpdNriEnm0pEngHx+z5oU4KaDHbANZgcvu1xHNs/J56
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: 5KbtiLNcRNIWj3alT967Ol8Mo-xO_AcZ
X-Authority-Analysis: v=2.4 cv=YrsPR5YX c=1 sm=1 tr=0 ts=68a2ce96 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=TFScpXbSeKEp2Eh2D0gA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzOSBTYWx0ZWRfX9+dQCKdVsD+O
 WYjz51qrhgEEJQ4D6c3i00JCpnfxZMmJaRt1XD4GOTz4Enn8tsSB2GqoVvhVUeRr6LBtouiLDcJ
 mZ4GFyTTmKG/ihztEqc7AAwmz3zpK3r2/N1UMKklkdQ+mjuyeCF39e8s9pcgXTUE2sUivEx5c2s
 zijNfymAjvlj4ZkhWNRVDLNPUbipYQH2BVS8HHfM40l4bHm6W1+NTY/usLLQKp8iOhmEkj4fsCe
 pZDYF2DYOH2u8cPX7Gt0FL3YOghFkxROgrGGpwvcYcKPM+9MMA+pDacaNxoNjJmXZR3HF6eM5RI
 cW4iXrxS0LRBuUAh1FBSuHiEFtoqsNe74EhYrd6tUeZnN8wKCPb5v88pC5WjZDJCvgGCuOwdTla
 J+izLS2u
X-Proofpoint-ORIG-GUID: 5KbtiLNcRNIWj3alT967Ol8Mo-xO_AcZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 phishscore=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160039

Instead of reading low and high of the mhi registers twice use 64 bit
register value to avoid any time penality.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/bus/mhi/host/main.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index b7ceeb7261b708d46572d1f68dc277b6e1186b6e..f628198218ef9dc760bbfc3ec496603d1a45dfc1 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -1719,6 +1719,7 @@ static int mhi_get_remote_time(struct mhi_controller *mhi_cntrl, struct mhi_time
 			       struct mhi_timesync_info *time)
 {
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	u64 val = U64_MAX;
 	int ret, i;
 
 	if (!mhi_tsync && !mhi_tsync->time_reg) {
@@ -1756,15 +1757,25 @@ static int mhi_get_remote_time(struct mhi_controller *mhi_cntrl, struct mhi_time
 	 * transition to L0.
 	 */
 	for (i = 0; i < MHI_NUM_BACK_TO_BACK_READS; i++) {
-		ret = mhi_read_reg(mhi_cntrl, mhi_tsync->time_reg,
-				   TSC_TIMESYNC_TIME_LOW_OFFSET, &time->t_dev_lo);
+		if (mhi_cntrl->read_reg64) {
+			ret = mhi_read_reg64(mhi_cntrl, mhi_tsync->time_reg,
+					     TSC_TIMESYNC_TIME_LOW_OFFSET, &val);
+		} else {
+			ret = mhi_read_reg(mhi_cntrl, mhi_tsync->time_reg,
+					   TSC_TIMESYNC_TIME_LOW_OFFSET, &time->t_dev_lo);
 
-		ret = mhi_read_reg(mhi_cntrl, mhi_tsync->time_reg,
-				   TSC_TIMESYNC_TIME_HIGH_OFFSET, &time->t_dev_hi);
+			ret = mhi_read_reg(mhi_cntrl, mhi_tsync->time_reg,
+					   TSC_TIMESYNC_TIME_HIGH_OFFSET, &time->t_dev_hi);
+		}
 	}
 
 	time->t_host_post = ktime_get_real();
 
+	if (mhi_cntrl->read_reg64) {
+		time->t_dev_lo = (u32)val;
+		time->t_dev_hi = (u32)(val >> 32);
+	}
+
 	local_irq_enable();
 	preempt_enable();
 

-- 
2.34.1


