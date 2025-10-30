Return-Path: <linux-arm-msm+bounces-79574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7577EC1EA88
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 08:00:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8884F1884642
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 07:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25FFE334368;
	Thu, 30 Oct 2025 07:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IoYtH0iX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cPkjOQMg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448EB2FFDD6
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 07:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761807637; cv=none; b=uLUTsg5MpnCa38jokLLL7+hWQU7Aq+udfOwZ28Hlo8+Le+rMb5ygny9+HjgnkJH1P2veyBtpn4UCsk8gnXRW5MD8tDLJDWsCCs6Ib7JSSAUCsUBbhoWFzDyVa4wT4kVpyaDryiHxol910QpM2OQUVKdeuk8oFntjuV7YIIZmQl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761807637; c=relaxed/simple;
	bh=DSP0RYR4BmXibqx7IUSmnSQ47NHXteY7yJtMQO88UP0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qfyJmBjDsvyO6cjWrAl/CEd9j03hNwtwCFkdTIz0QkU2xPnd+mYH4MyGngWuarV6EAkO4POiADby2atjxK+YvAMbqMLbbZrzobWLDqM4/huvoe2UQoDXHVD6Il04eUky+COv1zlKAzUPLOF2sraX0FMITNIQnRqAXwKVkzn6kZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IoYtH0iX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cPkjOQMg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U2g4md4135357
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 07:00:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HUBZezXctNZUTvhj4jU3CP7PPArzUZna/FMnzKRKs/c=; b=IoYtH0iXSHh6k9PP
	EdiWqkrc6lk8aPI/Ew6u52eIh/upcZkR5MDYbIN0UeQGCGl1Jtgb3UTD3ElTv/8U
	ebx0jzubXzkB9992kGMRGu/+nSYySo//YMy5kItGHa61kq4yZSVSEWUVYd87rCB6
	tiYYqF+WFC0F2j1aUzKMmP6qM2ImMT1TK1uh8TBvnsrPc+mfOl0yn6GbQSomYvxi
	7c016+prILa117s09r1RxZQ87vUxMpkqigJXcTA4K9YDodyCftiIppI8PgI56S0y
	TevF6V6kfZI5WRpTORw4bJfGnPam86jnE+ITRtpui/OqIDo1YgpeYkPqkB2SBIa8
	cXp3Hg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3ff9unq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 07:00:27 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2728a359f2aso2411275ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 00:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761807627; x=1762412427; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HUBZezXctNZUTvhj4jU3CP7PPArzUZna/FMnzKRKs/c=;
        b=cPkjOQMgyvp1zYoWmBwCmNZpS+Kyf7MN/zCQ773azG+K/5QN4LQgQ7CMLjX76Unp9r
         NbDaOTgPmIN0yhVCCZ9ePIuMbMP9i9C8eopX1S+wjdfmFzVjqN8luqG+7/4q+b1zdPe0
         66Zv2ukYdBpYrebo8hjLMHIYYSIVggVzlImpwPxo3CY1XGcGJ569a2gt72z9rOeGjiV3
         igqCVNzsoi2m//75bFv9LD2CPLSvpyA2I7vlIFU2ZRcCAGQ9G1rmVvwp2ugelje0TKDI
         8i2XPO/WMb+zGhkI121vaqhYL5WCffU+Mmr8tKzwpB5g6D883CsuP/RB01XcY4uSDIWG
         R5MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761807627; x=1762412427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HUBZezXctNZUTvhj4jU3CP7PPArzUZna/FMnzKRKs/c=;
        b=Hp4FeVaimSnDwGonSZgiCBAkGdM8rJjysrGeZsYucLKYKUeAa9FBeydswbEVClHgR0
         LkWxxN9WiXQD8WfDd+3CHhbKp/0lkTBHtQRVINR5c0AXcUj4bDo4qcEgJaKtpQZffKZK
         +QYlPjNZMB5vdsDSv8viRPWZKR5MH4/nwr84JSm4IjQoxYFWcXzwLXdrDQXgJfHeTbSn
         lvokIwakYuZT1BD1OCxSA3ucnB+5pawBzK35lcAmHpbJyt6GQTs6c2kgsU/miD0J/QPB
         WjOpdrIfMBAc0tKCTRy/9RnaU4QKWGjtwBrLJ9srADyY71pCvJ4EM/WV7svnFZHKfXGo
         UCUg==
X-Forwarded-Encrypted: i=1; AJvYcCUVnxRBOQrnyBo+dLARNSr4L2IViWXCIc+tpTREsKA2yWVcblo0FQGTVpsdaouFm1ndXRG6IHr0pYwCd9DV@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1DCzYANSkPPg4o48vEpd1nkl6nfEDHLpvcdRBs449eJH3nAzh
	1tQkmeP3S/mKCwrmFKoCM4pkVrWdlNrwcJEUGZq6/sXRqWXtHx/5p8QYbM7nQYuN6Ovmc6uDyhV
	sRNLLlg9aR3TLSCQknXie/1JGycSmReGT2GdAVEVgfvviaP4d2+lDDxl2G0j9djHnsTzTpd9hov
	J+T60=
X-Gm-Gg: ASbGncuLV2kqW15v0vk+wTB0uszTDIRwZLVZQBz0pOXBwlTP3ZcLI8u7mW55EIdQA6O
	+mdONTQg0eObAiAo+fbziVSdDEh4e2EUYqpy4wGsVH0APTa0FRlBgZkWzSQFtNy9nwwS1x0jH26
	TKzlWmN8Pfqvd5bzJSoz2QIEELKruV3442RQMj4pKHzoQAmhOP/Va2nZ8NRoBXL/hj3HirdFu2K
	gDawT5aP8pZqvj/6iRmZfgXPWXtj3XQGcxtrT+9+QAc7d8+nvqyrcLmmYWdRC+5VntvAydnsxCc
	BfUL0BE02ao/sDiggnkn199Lnmcv5GXN3GUY/ivq15MG4wOXFZZPl7f2ojjCpTOoqSMwlhwMBlX
	NTG0gz6koQCbjLEfcbOQQ/jp1hSwIg/IXEpHkvF0ygNT65gUfWCz8opJ2LQg=
X-Received: by 2002:a17:902:f101:b0:266:914a:2e7a with SMTP id d9443c01a7336-294deec3018mr26279925ad.6.1761807626718;
        Thu, 30 Oct 2025 00:00:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdslsaWsoG4zsyjqgYfwt6Z3rdZ1U+hkfdV+J7do69K7rWHlvoTT+46HkH4s2Yl9Fp2Cxvig==
X-Received: by 2002:a17:902:f101:b0:266:914a:2e7a with SMTP id d9443c01a7336-294deec3018mr26279535ad.6.1761807626037;
        Thu, 30 Oct 2025 00:00:26 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d40a73sm177671325ad.74.2025.10.30.00.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 00:00:25 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 00:00:07 -0700
Subject: [PATCH v3 2/5] media: v4l2: Add description for V4L2_PIX_FMT_AV1
 in v4l_fill_fmtdesc()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-av1d_stateful_v3-v3-2-a1184de52fc4@oss.qualcomm.com>
References: <20251030-av1d_stateful_v3-v3-0-a1184de52fc4@oss.qualcomm.com>
In-Reply-To: <20251030-av1d_stateful_v3-v3-0-a1184de52fc4@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761807623; l=1154;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=DSP0RYR4BmXibqx7IUSmnSQ47NHXteY7yJtMQO88UP0=;
 b=0WMtZEe/tBnXp3+5xyjVoKFhYzyXZg5HwdMYCozn8Yt5hskJhnmYMQpWrNMGItNuJZCIaHz9n
 7tn/p0l2T0zCvNAOd+pF604B/fGhmhJft1XzwEO3bOPsdTVMLXqQDCf
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-ORIG-GUID: XX_ZgtN_G60UiTtIZiAgUjpJMUKNYHjJ
X-Proofpoint-GUID: XX_ZgtN_G60UiTtIZiAgUjpJMUKNYHjJ
X-Authority-Analysis: v=2.4 cv=Cf4FJbrl c=1 sm=1 tr=0 ts=69030d0b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=3VFMuRvh7oFGMF0ZDtIA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA1NSBTYWx0ZWRfXzxssVsve8SYf
 E8J8kdI2pM68ittpAs9uLMw9j1HUb47jEs6I59nH4NAnfaxkEeUbTM1q1V9ccDvSJZNoRvNfslf
 uBrPD9EPf4tLC/mOybJVNCjhnP8Z0rI7ybQmnP1Z7D768UiFkju4ZNC+nHyELqidbxcrsl90dtm
 5uAkli75eqZI2bA6dLebwM/DEbin9CmQsCi4PBhA7Z0svOwFY9mwbrpW1v1cuZ3058r9XLYHLjF
 /fos6LibOqOJ8lzXE3ymdTQp4eWD3mq/k83374NLIwN3CVTwppgdWUwjuacbqcxCXHHTr/JdsTs
 RQmvqgXXSIGQmieBQww/3bCHNN4GPwdgXkn5KzEnMihMVLqO/NdWGI7QAC8DwHpvVRRafNGg/6n
 u4ScboSjMdF0/Irckfw9dOOZsNMMaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300055

Add a descriptive string for the AV1 pixel format to v4l_fill_fmtdesc(),
enabling proper reporting of AV1 support via VIDIOC_ENUM_FMT.

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 01cf52c3ea33e1a01e1b306036ba4e57ef5c95d0..bdfdf45c5de2f2ce885f219007718a54b5c86251 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1542,6 +1542,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 		case V4L2_PIX_FMT_QC10C:	descr = "QCOM Compressed 10-bit Format"; break;
 		case V4L2_PIX_FMT_AJPG:		descr = "Aspeed JPEG"; break;
 		case V4L2_PIX_FMT_AV1_FRAME:	descr = "AV1 Frame"; break;
+		case V4L2_PIX_FMT_AV1:		descr = "AV1 OBU stream"; break;
 		case V4L2_PIX_FMT_MT2110T:	descr = "Mediatek 10bit Tile Mode"; break;
 		case V4L2_PIX_FMT_MT2110R:	descr = "Mediatek 10bit Raster Mode"; break;
 		case V4L2_PIX_FMT_HEXTILE:	descr = "Hextile Compressed Format"; break;

-- 
2.34.1


