Return-Path: <linux-arm-msm+bounces-81092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EA699C484F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 18:26:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D5FCE4EF561
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 17:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C3892BDC01;
	Mon, 10 Nov 2025 17:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gZDfJoVF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WKk26W3n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF86129E11B
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 17:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762795273; cv=none; b=GyxJ41qDbsUvdE2eubwT+97ubiPgV9MVKi4VuUUyl7+Bfb8qxIh+K6ZC/Bam2DN/zy9QD3AAKplR2ModP7vGv0jMzNUhw8+yOsP/zLJTPf/2q1OJqPtEx62oLPDLlbfGnuJxqsfgzzUIDD2VUhJaWtXN3qsZ9cYsWmm6AJwghtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762795273; c=relaxed/simple;
	bh=FzzoO9k4M9sQjlK8nyUnKg9cqOI8/oU0g2MJWe3xnTY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j2cPZ9n4hNVbuBbkf8//Jyzxq9A0MLEqWurKcaksOxal6oWRe+cds2Cg59RugXQIe9j1r4sVCGnu3/Wm2qo/T73YDpx3tmxKSiA5l0S0RFu3Nbqb2JD3OUOpPLm7s8UqUom07+juTYulPXd0vHKls5YqyjpHjMQBeKN4FqbI384=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gZDfJoVF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WKk26W3n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AACN38x3307000
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 17:21:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NYWtNOwI1aavZwSln38Rwrj/x9o/h5lzzgA17JpG11A=; b=gZDfJoVFV/vx9FlX
	KQ9+DHXQHu4DqjmWHLCU5Zo/hFEPReKTlwqjyc9C6Mo1EunNd8kF48WcZFWuwWhK
	RdMbbd09HJ6rlwCGYvISaoMJ6yDC1gV2GEsFFhEUwG2xDTRjIJdqZAp0F5rZMraU
	o7RgsgkhaMA6TprieJlkeWj6mjBYXA7WAWoU/9p7L483R7crqR2NzFc1YTwOig04
	hmkrizNej0eG9Mx4BNOBQ0n/2giipc5WuZ80sfj3+BplKpLQqnxXvw95v4AaXPQM
	d3cURYTS/GlxjR9KkWxfAaSLDSJj0bY4Y9OS3HrR+mIpWt+d5wIj9cpKBUHS+Rs6
	B8oE4g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abg0q8wg4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 17:21:10 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7af914bf0ffso570609b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 09:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762795270; x=1763400070; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NYWtNOwI1aavZwSln38Rwrj/x9o/h5lzzgA17JpG11A=;
        b=WKk26W3nEUasdATFzq6lNEB5XHR9/XGDmHLQpPi78ZuHT27BNWx8wQks5hIWja9S8Q
         sd9AfvnTYAMuA/p6OfY5NiooFU6P9JUdGVk2mWcHtiPmI5o3JxFjlQXeNN5uEyijGlBw
         klwblAtVBwRt+IBFcxjN0vb37jnm7rcia6mXdip+0c9rwIKBnTrtu2NudWme1WPR07zn
         Zz9mlfSfNDcgVME4kVF0moLBaM7j5Er9zoEKPasjN6LlalRE7n5TzPOp48bKcwYaD9Y/
         Zg/Fr5HNVZZYa+ZjXoccnh10/zWmx++/N/bN264edu5YFOY7DGTUzGiMFwwxB9EUsB5N
         9ROw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762795270; x=1763400070;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NYWtNOwI1aavZwSln38Rwrj/x9o/h5lzzgA17JpG11A=;
        b=ZTG2ly6rR92wOvrfbDqrfckVmVBaoLhzZRwTFqdNRhckSjRypvtKTnnf/KvE0GTeMR
         tgEiXI48rzEpNEgvlE6EOTKMv2JpU2xf18iAMbfPO9+Zvkx1vTlAHURnpL00hRY3PCvO
         i2wswFhCqWcgwKTprdX36jEiO/FDT/qzGjyocFGT6T6/IWSM2EdysZQNw3XCvPvkWK9B
         p289w3urv0dkmMHGSYFEVsDa5/VRdbOQQ65t3NpQld56Dzvr4/GM+mR7+qTMNhXVUhmC
         UxSIBeL8d/nDuF6JVpgle0vwP+0lhBev9dHSvJk9STK04IzFb5EZ/mjQom1pX4Q2JqwY
         /mIw==
X-Forwarded-Encrypted: i=1; AJvYcCWH38tSq+MWGpbdtiH1qpRpOeRNUdcW86bhuSSRZleDxByh7O0d9paNCCo972t79XzuavsehOXZsFAuVbcZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwxN/b2YcdDVMt4NHBc/pFO8kkSkUfx+hhtnMsgE5cVk/3KBK2Z
	X0ZS328uBGvq7RCv8ZO4vXN6cuun+I6G6pGwHMBgJ634+L79e2ibOuypM9cOhspkdqctDqnPnJX
	30ielFTZb6UW+DnwMmWUEHud0/5X1tRzvrKESzdPx/WOuziEmfcgUKERt8Y0huN6PnNfC
X-Gm-Gg: ASbGncuNSNDaIPiCTqjgiP6BmYWj3mvD/ndfbcgoH4+Ff70R2SHCnfccTZsbLauu2n2
	wx2CaMLc2Hr/tK3Rqa7rWI/qrUcRQRGYmocyxWEu+NLaTQnuU2dfhKPiO0PhUW/gQJ0hnO3hVGI
	pohrRT3qWqhz7PGHYOd0jY+KBnoWn4vEkjvMd3wGZG0oFiuaCKXxyZckzGdn0nuO1FRJswl/GAq
	YCXzZvMzb93bch4jUz2pRlR8QSZk9LcbYhsQkMevIaOSrXJHhlEvCcyqFDg/PcmGqCJ69e9ZinW
	Yq6Gwpvc30c6t91sX+Eg5V+ijoRw32GSNTPUPHKf9LemXEz3sA6M/trprDhkawppcwqN/REPaJM
	mmRTm8n09+gWbXo8EGxVEb1k3PJrmc7fANgj84AfUvrdowF0zhgmR+Hm+8Dw=
X-Received: by 2002:a05:6a00:80b:b0:7a2:855f:f88b with SMTP id d2e1a72fcca58-7b226f8958emr5932256b3a.3.1762795269650;
        Mon, 10 Nov 2025 09:21:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFfalZJl+7PrOP1HB1J8VtvsyRvPRVFdRXZbPHSrXAhp7Xb/qZl+WXcQBqAEyI1jsP4QM1B8g==
X-Received: by 2002:a05:6a00:80b:b0:7a2:855f:f88b with SMTP id d2e1a72fcca58-7b226f8958emr5932227b3a.3.1762795269148;
        Mon, 10 Nov 2025 09:21:09 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0cc17784bsm12643064b3a.47.2025.11.10.09.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 09:21:06 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 09:20:58 -0800
Subject: [PATCH v7 2/5] media: v4l2: Add description for V4L2_PIX_FMT_AV1
 in v4l_fill_fmtdesc()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-av1d_stateful_v3-v7-2-9913a15339ce@oss.qualcomm.com>
References: <20251110-av1d_stateful_v3-v7-0-9913a15339ce@oss.qualcomm.com>
In-Reply-To: <20251110-av1d_stateful_v3-v7-0-9913a15339ce@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762795261; l=1278;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=FzzoO9k4M9sQjlK8nyUnKg9cqOI8/oU0g2MJWe3xnTY=;
 b=heEFBbRkfI5aZvuua+6ojFiTb44eCrX8lUnsBN/929ft6haY7qQka/nM1lZlFBmLk8eFXq864
 GWU4pYvE5QLDV3Ag+1gqDl6nGwJqfWK+Ixxv1UurvIoSORRTS7DCuSj
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Authority-Analysis: v=2.4 cv=D6JK6/Rj c=1 sm=1 tr=0 ts=69121f06 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=3VFMuRvh7oFGMF0ZDtIA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=cvBusfyB2V15izCimMoJ:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE0NyBTYWx0ZWRfX1/tkG2UVQBUY
 6ARHyhUrvi+DyCczORBmvZxP8iiAux6M/6bgzmi6Z3+bxa75KFIqxebvf17eBJ+HwKVxAXwVxXu
 6QtYtKElXf0/nC4Ka8R6Ro6INrnVaHCOiV71JghZn0W4gNj1uhubuGYk/rDlSkGZz7giYVpa4Cs
 KJ+a+XJgmUtqlirq9r7SlVXIpPNdOMYa5J5qbVB95oTUKnpGs0BBUoaF/ewPZ0rku3/cKpuK2c2
 xlIEESxJtBhVSP+4RT/nsHKf+q2kg4DLR7ZIsoSwCd0nsi/rmN5EGE0dpXGC0mRtjKPWTSOmJ6I
 MQ/UqYkPpV4wH3RLuCWAFQ9C+dAFe8zfIAMD/qf9/CCsP4fyIenH5OmR3n+hcOkHPpoewZvZfKt
 SiuKSmC1txZNw3BPhlsRC8E1gzAN5g==
X-Proofpoint-GUID: u1ClCWfugBZV7F0vp5GywaKNImyqf8oB
X-Proofpoint-ORIG-GUID: u1ClCWfugBZV7F0vp5GywaKNImyqf8oB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_06,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100147

Add a descriptive string for the AV1 pixel format to v4l_fill_fmtdesc(),
enabling proper reporting of AV1 support via VIDIOC_ENUM_FMT.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 01cf52c3ea33e1a01e1b306036ba4e57ef5c95d0..4f4f341c26b0795831dc20941a4cecc223af7746 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1542,6 +1542,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 		case V4L2_PIX_FMT_QC10C:	descr = "QCOM Compressed 10-bit Format"; break;
 		case V4L2_PIX_FMT_AJPG:		descr = "Aspeed JPEG"; break;
 		case V4L2_PIX_FMT_AV1_FRAME:	descr = "AV1 Frame"; break;
+		case V4L2_PIX_FMT_AV1:		descr = "AV1 OBU Stream"; break;
 		case V4L2_PIX_FMT_MT2110T:	descr = "Mediatek 10bit Tile Mode"; break;
 		case V4L2_PIX_FMT_MT2110R:	descr = "Mediatek 10bit Raster Mode"; break;
 		case V4L2_PIX_FMT_HEXTILE:	descr = "Hextile Compressed Format"; break;

-- 
2.34.1


