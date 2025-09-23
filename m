Return-Path: <linux-arm-msm+bounces-74540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A12B97372
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 20:38:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 222AD17EDBB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 18:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACB9015624D;
	Tue, 23 Sep 2025 18:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SZ3u91zt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2051E2FFFB4
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 18:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758652727; cv=none; b=gDCV/PGGiCBV4Y6SFZHAdvAk5ASiNYQbp0eziK8/fEHo88sJr4J4gY62wumQ3kIgitDu2oB46jqfmjPcv1vLppya2tJi2H1a5Jna7tkdbI4MuzgqZiR03W9EPLQikqTVHqNz1Trno6i8wC8ZWf4DHMXYA05ckp4a4mCT3YEoGsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758652727; c=relaxed/simple;
	bh=Sb5UShRUU4nS9qa42rFaj2iOMPPLKIv2ZgL3lYceuN4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GcpDLJnsq+npHVvBYfIu4uzebQYZXe5bu/FsZLKVOzE47r/lUag5+Ea3xbVS/q0dEf7F2LUruZMOll/wphGjVx6JaKgxkob0sfMYoWRR1KaEHxqj8b/+nWKWGMae3xIEhM9pXgpFkKvhVmp850B4XO7orjOSPL8FoUNnILI7Ybg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SZ3u91zt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58NFOtNS004583
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 18:38:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PpmjLuxmp2spV4egFFC5nK
	8iX/6rY6ZR0GuyNkpgIV4=; b=SZ3u91ztvNpz+R1YNO7mLrhDlqdqTztThSWvnW
	Zwp/hdsMOyENPeQgmPSRjNOu/fVSkE5+kOZJsOxzQbkZL6H9YM3u0ot2y9TqwaBF
	hFKrgtdO+YyPTbIQZoWlAgnst6MeYKElq/dQrxiTtc4TN0VBVw//e63elRDd75fp
	+RXMoJEM/NsKKuElU1FHA6HNo8g8Tur2kpvwPxGg8IRZ5rfEOq4NkFyewXTXxgAl
	jeiXWPucxlvD73S8Jkm7su9hzkflGyUU/bGZDqWC6mx7dBAtVE4WZEoK+x6JM8Pv
	I9yDqOdg50unPdDLZNIG+6nz2ylfnIYMuSdlrCqB5kMisWlQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmnt0wg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 18:38:44 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-77f5e6a324fso982289b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 11:38:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758652723; x=1759257523;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PpmjLuxmp2spV4egFFC5nK8iX/6rY6ZR0GuyNkpgIV4=;
        b=tDUYjecphqHMDy/Cu/OupbYUCmbSSznQ9vAqSUFdNu2xl9GOg4rxG75vB61j3Ajl+z
         FsT0qhFjag4rU5/HD6n7PXxPQGChFJkF2lZHJCKdUhXXkYlLdcA15Mor/HetQLS4fzW7
         2DAHWHqljWYl2qibi7w2OZ3TlqPwRhuyzlEbpZiJpWKDaWPSWVHEO7sXbiXnLn58y39A
         /gWtpUOqTgX6N4d4Y5x+5xBrdDG/Cg2ORyIPi3aKou1Bc9+bosvRzXFMSfzFW1RNhGM5
         7XxNTBFC5ZxOenK2gGIKC41pO9VgIjz1hIjQe5QXW3kAQ/lyj9tgaUlMoahZ98uboWI1
         5vVg==
X-Forwarded-Encrypted: i=1; AJvYcCUSyzyzOXZOwXvwYLqQifG4VHbJ3SiBCiIly/pELm5AwDALkYkjGCOIrZy95Zvm40S8zo9WLuEBp4txQgYd@vger.kernel.org
X-Gm-Message-State: AOJu0YyFT3eBWNdvUHkQHDel6bvgVcWaLLLOI8BsHq6AHI1/cJ9XHXM7
	xl+1wRYG/89KI+GFgzK8hyn+gpEewvQ29k/J105bHCm52/9YZtzZPMT2D9n/7zCnTGTrV4aLABC
	csrU+gAekx57N7+qL9jDjRMbVPCFx41r4//lzuPrOo4FIV9q2r5wcCFrkvVrKS94js48O
X-Gm-Gg: ASbGncuFCCdmM3TY5O7UeYuh52Wg0WWojLVPxs+uDQMDI/EEFjgN9RvmYyFzRrm3dkO
	TFW+4+NWu3RPphINGQZgEYaJH4qV6gBZ77Bqo7Ncd7aiIHUNjnR8OVqyH14Gi26oMkVj1ehoF46
	9Mr6+iGtZiySQN29LGbDVb9F6UKu8b22XCNfZnvRtrr1z5EqTFl3uV3Zka92s1zYKlDrqHEJcVJ
	mwmjN1lFNrV2M6EYCcekufbcf4MLQ3fiej9uAfps0AJL1kcLRWyrogDFH1Hqp0Ud5h36+jB1gwv
	buURkoQ0pMuDpGZh5UooqpomsSDtqvbeSeG3ukonCBjUgbLGkwiZygNyxEVB+ooT
X-Received: by 2002:a05:6a21:33a0:b0:279:e1df:e62e with SMTP id adf61e73a8af0-2cfe89904fcmr5312531637.33.1758652723487;
        Tue, 23 Sep 2025 11:38:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXVKYMbhJ7Op4WfVtc3IOETl6QNgVCQ3ov1ovGOrF2/AQJsnpr3zbM9dR3JuHZMktYi88O6Q==
X-Received: by 2002:a05:6a21:33a0:b0:279:e1df:e62e with SMTP id adf61e73a8af0-2cfe89904fcmr5312505637.33.1758652723091;
        Tue, 23 Sep 2025 11:38:43 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77dbc8e7cc4sm14722384b3a.29.2025.09.23.11.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 11:38:42 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 00:08:30 +0530
Subject: [PATCH] clk: qcom: gcc-sm8750: Add a new frequency for sdcc2 clock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-sm8750_gcc_sdcc2_frequency-v1-1-541fd321125f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACXp0mgC/x3MwQqDMAwA0F+RnC10FZnuV0SKSVOXg91sUDbEf
 7d4fJd3gHIWVnhVB2TeReWTCh51BfSe0sxGQjE461rbu8bo0j1b62cir4HI+Zh53TjR3wTGGBA
 n7LCBEnwzR/nd+TCe5wWzky54bAAAAA==
X-Change-ID: 20250923-sm8750_gcc_sdcc2_frequency-debfdbbab8b3
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d2e935 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=CSdScD5nXC4I9MN_FnYA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: Pga5bV59mNiTBGKuvcfOAfr6GH7VM7Qs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfX1n9SDNQa0TOA
 du0AEd3pjFKvLyvJThSbrdlNBXS/lDEdmqEf/Bpbq9O6ZYdz0LLKSRDv7TstC8PUqNIlDVviNvn
 AupqqIZHYkGY8FLpRAppL6CsRFJdmQX+MmGPydZa3d+PWqmjj/Ks4r8ldAKsGYrOYDNOQYv65ue
 pkEZmtBOY5WL1Q5QiuEa7UR/OAP8D5URFt8/PPMc24QdnfocZF9hvtEKeMJVPY2FkiD9Wl35nHi
 iAGbgwF2bg5tk+SXtMnmPxh435yptkiYS4eXw22gFgkE3ZboNVcF2yWDZ88/X+O4cBI2NnZj42j
 VhvNE+usDEMexS6IkUSketX6HRLj/BYYqEBl7gLmgIIUQk5dOo+NnNyIQ4MkRT53XMHRRqV2CxR
 QzX5Ym1j
X-Proofpoint-GUID: Pga5bV59mNiTBGKuvcfOAfr6GH7VM7Qs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_04,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000

The SD card support requires a 37.5MHz clock; add it to the frequency
list for the storage SW driver to be able to request for the frequency.

Fixes: 3267c774f3ff ("clk: qcom: Add support for GCC on SM8750")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8750.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm8750.c b/drivers/clk/qcom/gcc-sm8750.c
index 8092dd6b37b56f4fd786e33d4f0e8aabcd6ecdfe..def86b71a3da534f07844f01ecb73b424db3bddc 100644
--- a/drivers/clk/qcom/gcc-sm8750.c
+++ b/drivers/clk/qcom/gcc-sm8750.c
@@ -1012,6 +1012,7 @@ static struct clk_rcg2 gcc_qupv3_wrap2_s7_clk_src = {
 static const struct freq_tbl ftbl_gcc_sdcc2_apps_clk_src[] = {
 	F(400000, P_BI_TCXO, 12, 1, 4),
 	F(25000000, P_GCC_GPLL0_OUT_EVEN, 12, 0, 0),
+	F(37500000, P_GCC_GPLL0_OUT_EVEN, 8, 0, 0),
 	F(50000000, P_GCC_GPLL0_OUT_EVEN, 6, 0, 0),
 	F(100000000, P_GCC_GPLL0_OUT_EVEN, 3, 0, 0),
 	F(202000000, P_GCC_GPLL9_OUT_MAIN, 4, 0, 0),

---
base-commit: ce7f1a983b074f6cf8609068088ca3182c569ee4
change-id: 20250923-sm8750_gcc_sdcc2_frequency-debfdbbab8b3

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


