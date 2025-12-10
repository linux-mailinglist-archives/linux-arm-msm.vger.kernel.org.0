Return-Path: <linux-arm-msm+bounces-84924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC11CB3CD1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 19:59:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C5B1306AE25
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 18:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91ADC329C5B;
	Wed, 10 Dec 2025 18:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="he2I8Sv0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kDc+Q/pP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D121F3254B8
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 18:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765393153; cv=none; b=AYMQCLjVvZ8PZNjvt0BfSrUnhmLZbZ0N07Qk/zomT/9mWk9z4BlP+EV/H6p3s2UwTvU296ioe3HN1XelWsii5sIKb8Kh1sqGj18F02DSgys+cfzRjcTiGSZ+PhORWW2eYYbBOqGYjDKRCUClCj0oz5XlHkxPxbYB0ZkT+PX+VgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765393153; c=relaxed/simple;
	bh=ShXSwBiBFlrxCS8qy3BkVJmHbLDT1NGKrhctV5UO0Ns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=twTPGcyh4bOu8u36n0AKblgnJraqBHrfEX45BekvNJyIbZq/tKUnQTdM+oIy65HmcZs3q/8evPniO+GnEuB/zPv4amlr1Sdxfdy+MpUAhdnLjHHwHY3RFSE9/RtTV31QYm69WpjGsSRWh3Z91kcWBU57n521q/2e44tFT7dnD68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=he2I8Sv0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kDc+Q/pP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BAIRTkE3192575
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 18:59:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m5XieH/3awDfs/tFlFkM5r9w59nwt/TmWB9woGSGWLc=; b=he2I8Sv020anQ1xj
	EAXH4UC9qOQbFPoDHg1foM8g4hHclcQcrarF94OrSmYw5Utkp88zo6eJZsr02LpN
	At0q8JRl8IZsjQgH/eCeUD1DKUN/yYzblQL0P2cy4vURMkyO3OGFeMeMlMIsfUX9
	WUXUhjldT0DKgQnigoeJaM56MrqLX4BTHdIVbFRxH4NQn+oIvRuLJO9ku3ZsvUiP
	gxOEE8eSlBNhVPhWtmJt+zL2pln6ybCHq/fvjYvikajl8VYEPUWEk0RDxHZnoH4I
	fPW+bCaIOwGzs3V8hXytPJqpw+5hWoWaxMkYpHh5+ItO328I94BQmSCenReRjfy9
	AApugQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ay505j5gh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 18:59:11 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-bf0981c5973so22171a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 10:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765393150; x=1765997950; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m5XieH/3awDfs/tFlFkM5r9w59nwt/TmWB9woGSGWLc=;
        b=kDc+Q/pPNvlon6WK00Whk4SUj4pY9IrrPMIbnUBiOveRBOoP2a2r1XrRROx1C/8zQJ
         oZzcSMRIzVvur+PwIu0xkN5WwsvhBe0wFT/HT+t0QVBD8u0zIvURCd6MooM4i7XG/r5Y
         Zhn7dQSyTCaTZbReAGohUH4abOkv3n/pp0SLVMjdv2jzbzgw8KbpWa7vW7y4UF/PX8jy
         wl2ceefeehXal4OaDpflFE7G3uyqQXjNS++Z4JQJ4tsy3hZ9igJg6+yUHw5UVzzL9WFu
         ys/lH39Uk6SpNbnj+yTHbsEo8LtfCEz0IwgSd0dlEHH+Yt6ipkGPhnBAQgacFDZlSAZJ
         vMEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765393150; x=1765997950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m5XieH/3awDfs/tFlFkM5r9w59nwt/TmWB9woGSGWLc=;
        b=r2mmNpV0Nh4ysLrK1RPV2lT52m+7lBtERLZtgyZtICaEb+RmFDtIb0UgzKMQKjo7DW
         4kNOOFjj+aso3l/2RoKZNxqSHZgqGYQhwg1ezBdY/kMyvAslL7RmyEDds1s8bvgUjnL0
         MwyXCEkWAL2syWQ8yC+xCLkv+vyll89tY8bcxWseVvcZnRyZ1gTVm43EChoIFWTPlFTg
         dBjW/WoHPitJOYN/3beLCzAGnFp+3wQQzIXl74s2cF34YdPo0FrVdMY6LC+FAsR7hk7t
         q17kNWuCxhigJ7nI/m/qHHK9llxcGVf9s6k2JRmEhvmBpgeuV69VoeblfnwLkjtGYbwe
         N9xw==
X-Forwarded-Encrypted: i=1; AJvYcCUuITtDuBjUXAVvO1OgMACZH7TSVfMArM3HGYtVZR4ztVoxXUbQ8CEwwNgnEV7B26pvsa2JUxWZIZK8FVmI@vger.kernel.org
X-Gm-Message-State: AOJu0YwmE3Hfy6OgObJ2Fit7/AdU204mgteMHNhyqbtn4+/WUvGv16ca
	AVzZVVe8V6U72oamAiEsI2WojvOdCetuLC3WJaedZwVDjWUdBSFCahwLbRbqk9jWa0CeLh1dnZx
	HaMieCJp503pvJU19ckLaQ9NjCMnZotsh67Ur6F56PKRXTlT0km2WVDthsbYSOzytMhCb
X-Gm-Gg: ASbGncsOs7h7WYomYVCNh0QzbN0sDHwQLh7VYHuBPCGt/dcst5RJD6+8v/5rA5p6LfP
	o6mZG3mEzplWaJEhfqhHr5HrbsXCzdiUF8xhAFibRAdaHTSHP7TQ8OvSE6Ryy2qiGT2VLRzOGFz
	mrlX07Bw+IO5ZOZIjSYQC3qkrNDZUeNFmeQjTJA+2oy7/mF3etBIMWZsYtdjZXzdIsOnkT/sVa1
	kffnBJJaiGsV24ng0TdyXzL2ulbkD0+0ZgAVjyGylXZ35XFWq4rvDAB3PoSRqauIjhDXIYIXw7v
	XPeUNQcYgIH2DFEYGzO6uRBlLbauXfzCfQCUVyRkQiYdk1///VS41SraV887pYZso8IQhqUiSf0
	/OPDsV137Zipmc462bfXFTxGGVxy6aS9ox0hfutJ8ryL5zVscGPjBo90ELgCW+mTQRc6CRg==
X-Received: by 2002:a05:7022:6199:b0:11b:862d:8031 with SMTP id a92af1059eb24-11f295a78e1mr1412504c88.0.1765393150290;
        Wed, 10 Dec 2025 10:59:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDUVy4v2ck8fG4ASyXLL0u5NGQmJAA4GYlMhKQutxRxjlpvz+rDslvPmHmqJUAPRUaIyhO/A==
X-Received: by 2002:a05:7022:6199:b0:11b:862d:8031 with SMTP id a92af1059eb24-11f295a78e1mr1412486c88.0.1765393149703;
        Wed, 10 Dec 2025 10:59:09 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e1bb45csm778008c88.1.2025.12.10.10.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 10:59:09 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Wed, 10 Dec 2025 10:59:05 -0800
Subject: [PATCH v10 2/5] media: v4l2: Add description for V4L2_PIX_FMT_AV1
 in v4l_fill_fmtdesc()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251210-av1d_stateful_v3-v10-2-cf4379a3dcff@oss.qualcomm.com>
References: <20251210-av1d_stateful_v3-v10-0-cf4379a3dcff@oss.qualcomm.com>
In-Reply-To: <20251210-av1d_stateful_v3-v10-0-cf4379a3dcff@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765393147; l=1333;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=ShXSwBiBFlrxCS8qy3BkVJmHbLDT1NGKrhctV5UO0Ns=;
 b=cWZGZ5dfpD+JXutJnSGEF7+dwjGHRCJ/eKBewagAakBh5FrzhTJEpxaCKUDKLboQPSYjvo0N2
 R5fbyrWTiDVDCRzmpNAEBDbcWdA/kXSG1wfd/ZzShjYblSI0QDB03NW
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-ORIG-GUID: utKPinggGeyu8-QVtjC4VIHFqT8ZaCFM
X-Authority-Analysis: v=2.4 cv=Bu2QAIX5 c=1 sm=1 tr=0 ts=6939c2ff cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=QX4gbG5DAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=3VFMuRvh7oFGMF0ZDtIA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: utKPinggGeyu8-QVtjC4VIHFqT8ZaCFM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDE1NSBTYWx0ZWRfX8Yf8lfG/VxYu
 PB7PMw6rQLnfoE5/mIV268eMdwxzWLTbiYo9qAaCXIO+cz0xEw2jacK27Kz5OccEsH6Uc6r4SSZ
 BaK3SaWr+iotL5jVnpAOqU+JRUUwMLxc2TZcye/VbFR1XKxsK8Izz1VeryeFH8rDMXPvHtu6y/B
 TntOWzNHQY6BVX99iFJ8vhA5lc3I8pXFIcb5ZvtzDfTbtzv5m0it/XCeSnv6i4qRssx+A6KzrJR
 IngAN1GIIeK2p8pTg62PakfVk+G1boj8jR4PaM+sbxLf7Qj0419RleQBAH1ht6PPAlP53uSi5L2
 Mz39/P+tdjxauIirHedLcKkxnE5ZlDOY870bYPDzNC+lYaoYBHCRPekN5Gzn6W5Ln9vzNFGAz19
 zYW7Xe+GfdN1+buWhp3LFRaEF5smzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_02,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512100155

Add a descriptive string for the AV1 pixel format to v4l_fill_fmtdesc(),
enabling proper reporting of AV1 support via VIDIOC_ENUM_FMT.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Reviewed-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 98512ea4cc5b9d725e1851af2ed38df85bb4fa8c..37d33d4a363d7eb02119b84bf368dac8e7a8bd8e 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1544,6 +1544,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 		case V4L2_PIX_FMT_QC10C:	descr = "QCOM Compressed 10-bit Format"; break;
 		case V4L2_PIX_FMT_AJPG:		descr = "Aspeed JPEG"; break;
 		case V4L2_PIX_FMT_AV1_FRAME:	descr = "AV1 Frame"; break;
+		case V4L2_PIX_FMT_AV1:		descr = "AV1 OBU Stream"; break;
 		case V4L2_PIX_FMT_MT2110T:	descr = "Mediatek 10bit Tile Mode"; break;
 		case V4L2_PIX_FMT_MT2110R:	descr = "Mediatek 10bit Raster Mode"; break;
 		case V4L2_PIX_FMT_HEXTILE:	descr = "Hextile Compressed Format"; break;

-- 
2.34.1


