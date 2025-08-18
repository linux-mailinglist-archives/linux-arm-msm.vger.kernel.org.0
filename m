Return-Path: <linux-arm-msm+bounces-69485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9679AB29A52
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 08:58:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 436443A6782
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 06:57:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74AF227AC54;
	Mon, 18 Aug 2025 06:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N45gZS2B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A95227A91D
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 06:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755500181; cv=none; b=T6pPef8UO5o+OaO5hmihgNR6ok6uZHgmpMe6DE0fac6/hnwOAxyBtW6yHXw4r1mV6SgiXN5ZGcZhBI5SxTrEyfsFLmJWRVfnuqUas+v3wywOqkj/2LJwlI2zaeMIvl+UFQmu7nqCayIeMBEF1Q/wdENvy3Qg70Lg+9EYbjs/AVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755500181; c=relaxed/simple;
	bh=5Wl9UvnqdPSYwIEMxJ5A0h7SCvl2ekS9J7645gxNgrA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EGSRFjU3CQfWe4jbqx99Hl3uDItpSrl3bh+yWVwqh++kWhYHKHIckGe05PK3UacKXb9JtkFSqYc5LZ0yZzDxsKGuJAhK7OgX2CCpqmtqMNOBBhCC9/AdwhQ7yEjJmq/oDA6CppO3g8Irk8yqs3hDvWtpOdl2KmaXtKyUGpOupl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N45gZS2B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57HMZQFR004083
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 06:56:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8e4z+gf/aWpPlnu9UM4/QNjfkW0jDz1JekqtIfup3UU=; b=N45gZS2BPv8KlZ8o
	6KKpgMMmuhrRuYN/RuLeJ8FaVY+k1Ydw2mDMUk/4dr5gHTJC5Z6Whkx/l+SPaw3s
	gxIfatENG7QdYNGiN10IlbxynvlMTmo7qMvzuSVQyXrjXviMWhTRBIh0ou9ybQh3
	neytKeU++bxYapv8zM685vxwIJdWw3bYXxLwFJSLYoqLKGBP2E4Sczt+hfbn7zwJ
	DPXltSrJMWfUrZCMdeCyTmAMOwRDAsVxv29gGCDxnmkyJHy9BJKigXl7E9wwhuT3
	w48LNr/5PNkDW2yq91fTQAX2Td5F1KAQMfTtCzeqgwSvBHLCAa0Yk79nuiwxRvxd
	I8//9w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jk99kft6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 06:56:19 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-321cfa79cb3so5001038a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Aug 2025 23:56:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755500178; x=1756104978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8e4z+gf/aWpPlnu9UM4/QNjfkW0jDz1JekqtIfup3UU=;
        b=ejTC5xkkkTksDA17gE2ff/cCOhelegld6ayy1j7cYVQSHmc4acm35NzPZnJEu3xLuk
         EujUjeMdRNvlrDLouFxqiffNloRn4CCOQFm/M+twMlRf6C9i+dTplWQdrd1EIyEd0ldt
         HK/FLkZpWTJ8n2L2zdKcL6mUVczBAxBvow3FinIQVHVAunggTSVR9EHuFUYtZsqjLZ1v
         h8Wgv/UMlyJ+FGB0on7rDKH40goOvjyCnIUwzYQwDCAbnKy/8NL2h0hPSPL6dNRRA3Ks
         CzmODz5O0bKYbt/gk3Qhx11H2dQW6SlXKbASyR5CSr2gz8MXRJKBsBv+eYd3JH9TZFHC
         6OnA==
X-Forwarded-Encrypted: i=1; AJvYcCV6CtBqyr88Mkz+mXF05LppsNvX0sp2beEevWPgN2MhR/E4mTcO28JV06N/RkUy7DdTL++kPxFdNKO82a6g@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvvglz8GsOOs8xqDB26EfhKNHaRWCK+yDyUwzs+pbDNIuaZl3j
	kk9vjw17chT809rUepfOF9gOYPJV6oMGRaPmz0WR1T0+whxdFG1vR9aMPezi0nS3rsNd8k6/lk9
	j0xOCQbJnUTm/amZrIHNt+Ibbn/VRPw+R/xu5q1X8AXnvsEZGOrXRCVl7B7NBxfk8nLEPVu6QKe
	ba
X-Gm-Gg: ASbGnculP3epVWCdukqhYJ3o3hsRH1Xzzk5XwnlQ/cDBAwzkLy5/9Ulfb1Yc1e6pAQf
	6lAf25uUnfpa0vDC3Ie3nwNsR3UjefgrJqOxumVQdGF4Yj+oXagSnBBuzIbk/EIX4mNlycxmAye
	luZV0U5nB0B42+4FYW1oX0tqw4tQHZ6wYtszyLSGFyPHOT8AnE7qicMRjELVrrTE9UNGJOOkoDN
	UjTZUA/cn5x6fzobvNmq9TGqdxfmW8V8Leg5GQUZsVWjd/xf8VTusl8ebRJ1TobMOgbcChVG20Y
	NiZzs26VlMOFA/qWx8LVY7RIRchEiM53RkaTFayxlcA9jdeartLFs1WL3Exi/ggcahnLqC02EiI
	=
X-Received: by 2002:a17:903:2307:b0:240:8381:45b9 with SMTP id d9443c01a7336-2446bd131ddmr163984245ad.8.1755500178149;
        Sun, 17 Aug 2025 23:56:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpqM+mGk/RiAx9BWXGjDpBgWThok2W8IwGmi3ZbBQ77hdKXhW9CnBvLhWaOuaZYx5UEkP3dw==
X-Received: by 2002:a17:903:2307:b0:240:8381:45b9 with SMTP id d9443c01a7336-2446bd131ddmr163983775ad.8.1755500177608;
        Sun, 17 Aug 2025 23:56:17 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d50f664sm70240105ad.75.2025.08.17.23.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 23:56:17 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 18 Aug 2025 12:25:48 +0530
Subject: [PATCH 3/5] bus: mhi: pci_generic: Add support for 64 bit register
 read & write
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-tsc_time_sync-v1-3-2747710693ba@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755500162; l=1575;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=5Wl9UvnqdPSYwIEMxJ5A0h7SCvl2ekS9J7645gxNgrA=;
 b=Aa0FKv0m+4xEHETJytTE62MY9NZx7FSScx8slkfImQIpt7JLASHmhuRBxzLlZUDJ/FUYIXcoC
 0WvnTeFEQeTBczlgqTZUTRR1gFNiRvIX+S5CO5/dSngz5Nq73J7fNZq
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: xd_Ib7Qt5f8j51dAUSdoqL-YvSAM_65-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDA0NSBTYWx0ZWRfXwa+esy6doHgw
 FVoYkuG5+TFs89Mgl4zMgMc2aZj3wSbkmH2DryMzWHoONSkbFAnvoiAoAJXfIlnNUDSlxmnwibD
 UV+A3FFqQ6/TPRkwDOj1jLlqRftJP2KyW5q2Em87XCGpPMKw5qi2SjnL6LR0/3kI73kJeZlPLiq
 YCskXvuKSzzREguXAY/LQwMAvOg+N0nyU76oJ27yyVyzwgBpegpkIW63H9VJIyUFs7JAUqYg2AY
 JgY8xHUOKhcYD2QAhrthbDXQAANV1J3kMNM98fiZI/RODolkB5IlB/GWaM4uL0+rNyd4LLLc84I
 jjT7fK+VlS757dQMptPqjFbm19TOe9uBH3smCvpJ335AzWIJKYMi/y8nrwcR4D+5kpf+TGtfMku
 NPk3J2LH
X-Authority-Analysis: v=2.4 cv=IIMCChvG c=1 sm=1 tr=0 ts=68a2ce93 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=MXGvhfJtNsboA4ndukAA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: xd_Ib7Qt5f8j51dAUSdoqL-YvSAM_65-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160045

Add functions which does read and write on 64 bit registers.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/bus/mhi/host/pci_generic.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 4edb5bb476baf02af02aed00be0d6bacf9e92634..e6c13c1a35253e6630b193827f8dadcd22a6198a 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -1039,6 +1039,27 @@ struct mhi_pci_device {
 	unsigned long status;
 };
 
+#ifdef readq
+static int mhi_pci_read_reg64(struct mhi_controller *mhi_cntrl,
+			      void __iomem *addr, u64 *out)
+{
+	*out = readq(addr);
+	return 0;
+}
+#else
+#define mhi_pci_read_reg64 NULL
+#endif
+
+#ifdef writeq
+static void mhi_pci_write_reg64(struct mhi_controller *mhi_cntrl,
+				void __iomem *addr, u64 val)
+{
+	writeq(val, addr);
+}
+#else
+#define mhi_pci_write_reg64 NULL
+#endif
+
 static int mhi_pci_read_reg(struct mhi_controller *mhi_cntrl,
 			    void __iomem *addr, u32 *out)
 {
@@ -1324,6 +1345,8 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	mhi_cntrl->read_reg = mhi_pci_read_reg;
 	mhi_cntrl->write_reg = mhi_pci_write_reg;
+	mhi_cntrl->read_reg64 = mhi_pci_read_reg64;
+	mhi_cntrl->write_reg64 = mhi_pci_write_reg64;
 	mhi_cntrl->status_cb = mhi_pci_status_cb;
 	mhi_cntrl->runtime_get = mhi_pci_runtime_get;
 	mhi_cntrl->runtime_put = mhi_pci_runtime_put;

-- 
2.34.1


