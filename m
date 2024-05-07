Return-Path: <linux-arm-msm+bounces-19411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6DE8BED27
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 21:56:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0B3F1F21133
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 19:56:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 630EB1C8FBE;
	Tue,  7 May 2024 19:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cCcHvOIX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B85716F296;
	Tue,  7 May 2024 19:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715111521; cv=none; b=owLDT7jpg1RLEHL7r3PMY9ZQrBZje48w/R79WSCl9RQg6d2wG6bi57ndDiCOvlfaiYMsm3qedpJ5BxZ85nafH70dSNWJN5akoPVE938c7a7tv1gBCIDvLqp3tpupAz/VWQs4m9CpGyX+B6V80JTdrWlzYxveOS5G7pzdEn0Z12w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715111521; c=relaxed/simple;
	bh=vTcLhZf2R8paXkJQUxSXklktGwb+rhfT7p4hKA16e8Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ty7M8uSGwHFqvwgghe81HZFWWdB0uDThuv+jc1Ag7Nh5cKczUvanHxtu9EyHvy+c0aw8SUlq6yL9R/7T02O9ariENFauUlB9Mx+3b8MFoMKw2BGmzfAPbO4saw57qyjR6LCZe6nNNxtZFoNPVv9Atk744RRkGmFHxPl2tA4EYH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cCcHvOIX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 447IK5O5001412;
	Tue, 7 May 2024 19:51:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=uyF8k4GY10EkPruZFkeC
	0IFOj0f++wkbH8Kw38rv/5Y=; b=cCcHvOIXLSADStHXDFsJzrs8UY4ObpJ01QVx
	V069xQY2bbcJPnV2KQvoTsA7UESxzCkOVBp9YLAHdTV/EQRuAx/AgihUF9DiPiqw
	VMzuqk0m6MInS2yNum3Dc8d1lJT+NqvF1IG55Lhhe+bXa3I2/4eAa5tcJsqamCqp
	cVEqoYj1nw8IiBIFNj9byJjXZqwAiBMRDQUWkXi3xIdMSOInjqOq8JukiC+aXbGq
	XuJIsNqjtMyl2B3pG2NdkV1ywXLVe72bO1+KxtpKgLM6wPbSQIrZceELRciWws+U
	jLWVigF2TNEAwwAvAM9sKWZnkXqwUyPNFo7oN7Q9fgYkEEDhHg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xysg405v0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 May 2024 19:51:32 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 447JpVXM019775
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 May 2024 19:51:31 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 7 May 2024 12:51:30 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <lgirdwood@gmail.com>, <andersson@kernel.org>, <krzk+dt@kernel.org>,
        <gregkh@linuxfoundation.org>, <Thinh.Nguyen@synopsys.com>,
        <broonie@kernel.org>, <bgoswami@quicinc.com>, <tiwai@suse.com>,
        <bagasdotme@gmail.com>, <robh@kernel.org>, <konrad.dybcio@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v21 14/39] ALSA: usb-audio: Save UAC sample size information
Date: Tue, 7 May 2024 12:50:51 -0700
Message-ID: <20240507195116.9464-15-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240507195116.9464-1-quic_wcheng@quicinc.com>
References: <20240507195116.9464-1-quic_wcheng@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6vFSVgnmZIantFQd2JoyLgDahztFJ6hp
X-Proofpoint-ORIG-GUID: 6vFSVgnmZIantFQd2JoyLgDahztFJ6hp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-07_12,2024-05-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 spamscore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405070138

Within the UAC descriptor, there is information describing the size of a
sample (bSubframeSize/bSubslotSize) and the number of relevant bits
(bBitResolution).  Currently, fmt_bits carries only the bit resolution,
however, some offloading entities may also require the overall size of the
sample.  Save this information in a separate parameter, as depending on the
UAC format type, the sample size can not easily be decoded from other
exisiting parameters.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 sound/usb/card.h   | 1 +
 sound/usb/format.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/sound/usb/card.h b/sound/usb/card.h
index 2884912adc96..02e4ea898db5 100644
--- a/sound/usb/card.h
+++ b/sound/usb/card.h
@@ -15,6 +15,7 @@ struct audioformat {
 	unsigned int channels;		/* # channels */
 	unsigned int fmt_type;		/* USB audio format type (1-3) */
 	unsigned int fmt_bits;		/* number of significant bits */
+	unsigned int fmt_sz;		/* overall audio sub frame/slot size */
 	unsigned int frame_size;	/* samples per frame for non-audio */
 	unsigned char iface;		/* interface number */
 	unsigned char altsetting;	/* corresponding alternate setting */
diff --git a/sound/usb/format.c b/sound/usb/format.c
index 3b45d0ee7693..5fde543536a8 100644
--- a/sound/usb/format.c
+++ b/sound/usb/format.c
@@ -80,6 +80,7 @@ static u64 parse_audio_format_i_type(struct snd_usb_audio *chip,
 	}
 
 	fp->fmt_bits = sample_width;
+	fp->fmt_sz = sample_bytes;
 
 	if ((pcm_formats == 0) &&
 	    (format == 0 || format == (1 << UAC_FORMAT_TYPE_I_UNDEFINED))) {

