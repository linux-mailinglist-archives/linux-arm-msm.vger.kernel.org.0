Return-Path: <linux-arm-msm+bounces-84923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4922CB3CC5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 19:59:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 04CF6301626E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 18:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BB4C329C50;
	Wed, 10 Dec 2025 18:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qix8vXYT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KMtWz2q2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E69E321F39
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 18:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765393153; cv=none; b=BBwuLfNO1hKkW99VRjNz8+Fq4hQUh1A/Ir2qN1b+Lx9Y6Wjwvf6pHfPUAxoVh97zKHH29Vyb6076pdRYZbF/nsaynu4iZXiFzgt69pXm1dIRbcYw9D8nwvzlFBA6SdZL4B1YcIqTlsso1YZcYKMip2ZSqUZWXtYPZJLXkJVUyWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765393153; c=relaxed/simple;
	bh=H9BJ7ytikiXTF5xBn3MR+b2EMzvYYPhg73hRx3Dgvi8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ouqfTxl4zwE8lKGiTv4wCLgKtbouS5xtTv2LjP1q9FsdaV4MlBPhIDBl9EiWnCTAhjj7F2FKTi6iOVsbzzhWcpovCM1AWHJDVDG19iKb5UNvkqoG+KiG5mmZRA7cX8RbLT/nybjn/ZBU5KshYa0bhp95v3ThYQ1ekZZ+IvQ3xF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qix8vXYT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KMtWz2q2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BAIR4Pq3685117
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 18:59:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xgeoMTAbktGdoXuloFAy1F
	O6x4MccXA5ixFI31Exa3A=; b=Qix8vXYTjNVG+wBowj5gj2x7wU0S3UbyHrCKea
	Ila7VmJ4tsMh3Te2tLjjM/0mrsWD8xw2rOdmDt83wtTvnwJfgo5MH++LNs2AhcdX
	8y6XGp6RAwFdidinUX+cPXVXEAGVrvyNBeK0XPnNpFxrVaB9bl1hWpji32JN5GX1
	detC+JUWpkyBfgli48BVvMlX9gE39oG5WrjOMR1q9qaxEwDrHYUaRRFKG4ntCiVU
	84ZyywAmEJT4e/1KqmLqo838yuaO8aNwHu2MRQr/8m+s6e3vKe8Esw9lrTqXY92n
	FdKDQ/uyo47lwM9tdhO9HelvaPg5gD0klnEyfMy3nXbB+/Qw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ay7pm9ff5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 18:59:10 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34a8381c13bso32290a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 10:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765393149; x=1765997949; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xgeoMTAbktGdoXuloFAy1FO6x4MccXA5ixFI31Exa3A=;
        b=KMtWz2q2gtqv+LDZx34vsBf1eOgxYqFAMqH7c92NAhwAVss1Upo/noeu7C1qzjYVKb
         XugIrWdyhsXLXCq8djeFiN3B5rHwhS5cHGls4Q535sHwedy/WFTZsbwtzRMdtPxdSR1w
         SWp1v+pesbpVAiBSbl/QheUkRxpYuYWo7EvNO/SXterx3juuRQ4i/qmgvMJhzHNq/HRb
         WSqlsQPmplVR3eICaXwr9N9gQQ12+hr9e5bQKt0oK1AJNMCtyX9A7xLDgFaYZ5cXutRr
         aA4ZvGV4EYfrxpEIz7O+DBSwDedA9hm152gqFBDKDlEntFpAhWZED0alLBHMXK4OsyV/
         qSHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765393149; x=1765997949;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xgeoMTAbktGdoXuloFAy1FO6x4MccXA5ixFI31Exa3A=;
        b=XRP+E2x+VzekNyPOlfj4hGNv4PHISNOKMEXfDAgij/DYn8kuVEsaZY4zUONvs1aLuC
         SHBlNnbAUpG5cuzVRE9Y8MdVNDhAfZUqeIV2B3S26WtEjexNVOgqxsCU5MWVqjwOUEcW
         L10siMS6Qlts+xxpS036R4G1h2TQG1GeiXRRVI/2uw4QxqH7ovRIzonbQkTt3W/X+fvJ
         MrA7EmfaseyUvU3wB2Is+A7V4cHM9J94JyHsJn2SKMSGGi13V+ZfOovMX5vEkEq18v7Y
         VEH3OulBpw4Mi7jmwL0lzPixS459NGsbMKmB96sB4PLfgPSk/vXnDBjfAt3fRc5LME70
         Wztg==
X-Forwarded-Encrypted: i=1; AJvYcCVNCsscBkYbFSFJm51rFRgqxi/mfO2GyU+HEjShwoifxDTFvO4t+dE/qxpBxhg3MM6+Yknzij4DStn4lXsI@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm7eJeQLYPTDUY1pmNZ0etKtJQ9uSoqkMaffyESRlSdaWxU+Ao
	zaIEQv9zMOVc7lDOYxJ2fgcyMun6V9p21qDZaBEKLYg2kMyMWa8Jd9970wkJiRMi39ZdKc5Gv5c
	4FEinODSsonK9cN5GKKVgfSabiOieg1gopB5HUUTCY00D4LuQvxOlhWuSZz6UMK5u5t7H
X-Gm-Gg: ASbGncvO+uYH3XFrBU+zPsdz0p6bKx/fmMPellumfQYJ/VHQ3dD/EDe5S9nvASUP0IJ
	x4LNT+N0egV668Dtyswn7kAMX1R/Ab3P70UormLPObNsQuQflGlaBJJ5mmfIrKiaqOEqndedc4c
	J8WqVNh8TNvuFmfIdiPCQbQTqj6I+ru67hJuziSucgFRlkIizleTxHKBp9s4O8KA9qZ4Rp+89bN
	+hq7CynX6Q4jmuFYupjiIhsxe6+Q+aioMrcFOWXHBUT9UooGPV/cHsbvGoAZGHiDulki6q9F8/4
	UxMfCEA4h4DHl4crk306rh2coCjw5whFpNiKg6njKTYPXjnCU3j29eVebkrC6ZIgH+Q/uratYi4
	PRPp+C7lcGOWsMuddSz4GZ8A5wVF1gwNUOIElXECSVim5XgudqU3bIn90hnspL30ggEQJyQ==
X-Received: by 2002:a05:7022:517:b0:119:e56b:46ba with SMTP id a92af1059eb24-11f296c8ea2mr1327348c88.4.1765393148757;
        Wed, 10 Dec 2025 10:59:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEtmU6oI68eC4FY0W4VCu4/yUg9lY68cxY5JXxtWGGwhDnQ5BkyrjFF3us3HUNKYLvWiTxcPA==
X-Received: by 2002:a05:7022:517:b0:119:e56b:46ba with SMTP id a92af1059eb24-11f296c8ea2mr1327329c88.4.1765393148142;
        Wed, 10 Dec 2025 10:59:08 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e1bb45csm778008c88.1.2025.12.10.10.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 10:59:07 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Subject: [PATCH v10 0/5] Enable support for AV1 stateful decoder
Date: Wed, 10 Dec 2025 10:59:03 -0800
Message-Id: <20251210-av1d_stateful_v3-v10-0-cf4379a3dcff@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPfCOWkC/3XQ4WrDIBAH8Fcpfl5LztOo/bT3GKMYPddA26wxD
 Rsl775LN2hgBuTg/ujv8O4iU99SFvvNXfQ0trntLtxA9bIR4egvH7RtIwdCVlJDJd3WjxAPefA
 DpdvpMOI2NMkligA+BsHPPntK7dfDfHv/7Xu63pgenuGxzUPXfz/mjjinfxOw+j+BD6cAVkXSM
 gX12uW8u978KXTn846LmM1RPR2GCo5iBzEEIO8tJrni6KVjCo6eHQ21lo1XLsQVp146hc2NNTv
 KuyaSrfmWX3HMwoHSfgw7zgF60Igu0Ipjnw6XgmPZkckob8EYbNb27JZO6V+OHQOWsEGHqoGCM
 03TD6yk2Sp9AgAA
X-Change-ID: 20251029-av1d_stateful_v3-cbf9fed11adc
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765393147; l=9347;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=H9BJ7ytikiXTF5xBn3MR+b2EMzvYYPhg73hRx3Dgvi8=;
 b=lEqVRjkgKgDWdk82lLcvwrLgghk30mMDqmDZWPA/qr5Xxu7b0/Fj7dBFRPTGuqZDmD3ssGL6i
 GfPAbFne0aNAGfYlUsKKuhiRmih7Y0vnxQtMPb5nSIYhEZGF/8IEmIh
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Authority-Analysis: v=2.4 cv=A7Jh/qWG c=1 sm=1 tr=0 ts=6939c2fe cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8
 a=e5mUnYsNAAAA:8 a=PEzcy14RovJRRecV5VgA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: pr5MCT36gVLdXOHcl9WSzbaMNqMSndB9
X-Proofpoint-ORIG-GUID: pr5MCT36gVLdXOHcl9WSzbaMNqMSndB9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDE1NSBTYWx0ZWRfX5iRUlbWjhmXK
 cLMwGlxc6OyHym5BZTPg21r9x4tRmvz0xUVRcAuX4qpaSB65wXWC5iEsXLZk1HWLapZhM/hMOK0
 LyZr1EiExP4tvfbhUh9aeD2pkI+sLqkf0P0Osfpi4G8LyjbX5UOgkoc7VCx2qCA2CfgW4NYu/bv
 ShNlPCKNY6lSc1hziXaFLdD6O/GIBMiV0jADo3XwYm8tJpF5hszJ7dGSsDzNzjg8ypKJwnOAJps
 it3uh+2RPrxnu1ZmelUIir5v33IzgMv0r/PLwqTu/KJsXBcdtT201gDpzpthxTHEgGLenaTvYHe
 T2z0e/pMhV+DlJHG5wG+R4GVWMACyyEdJw6g2U03RNOOrWiT0IpsuphxcmZNDJa8hQy5qPrBizZ
 l4/PhXC8fjYIFegvTuxDwlMg2Fz8ug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_02,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 suspectscore=0 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100155

Hi all,

This patch series adds initial support for the AV1 stateful decoder
codecs in iris decoder. Also it adds support for AV1 stateful decoder
in V4l2. The objective of this work is to extend the Iris decoder's
capabilities to handle AV1 format codec streams, including necessary
format handling and buffer management.

These patches also address the comments and feedback received from the
patches previously sent. I have made the necessary improvements
based on the community's suggestions.

Changes in v10:
- Add inst_iris_fmts to all the platforms in gen1 
- Link to v9: https://lore.kernel.org/r/20251209-av1d_stateful_v3-v9-0-718e3b3934b1@oss.qualcomm.com

Changes in v9:
- Add inst_iris_fmts to all the platforms in gen2 (Wangao)
- Spaces to tabs (Bryan)
- Link to v8: https://lore.kernel.org/r/20251202-av1d_stateful_v3-v8-0-2f74a81773b4@oss.qualcomm.com

Changes in v8:
- Rebase to latest
- Link to v7: https://lore.kernel.org/r/20251110-av1d_stateful_v3-v7-0-9913a15339ce@oss.qualcomm.com

Changes in v7:
- Updated Documentation (Nicolas)
- Link to v6:
  https://lore.kernel.org/r/20251109-av1d_stateful_v3-v6-0-4a9bde86025a@oss.qualcomm.com

Changes in v6:
- Fix for kernel test robot failure
- Link to v5:
  https://lore.kernel.org/r/20251107-av1d_stateful_v3-v5-0-351652ba49cd@oss.qualcomm.com

Changes in v5:
- Updated Documentation (Hans, Nicolas)
- Link to v4:
  https://lore.kernel.org/r/20251103-av1d_stateful_v3-v4-0-33cc1eaa83f2@oss.qualcomm.com

Changes in v4:
- Reuse sm8550_vdec_output_config_params (Dikshita)
- Add definition for 256 (Bryan)
- Fix identation (Bryan)
- Link to v3:
  https://lore.kernel.org/r/20251030-av1d_stateful_v3-v3-0-a1184de52fc4@oss.qualcomm.com

Changes in v3:
- Updated fourcc could be to match the ISO specification (Nicolas)
- Addressed comments and rebased changes to resolve potential merge
  conflicts (Dikshita)
- Updated GST MR
- Link to v2:
  https://lore.kernel.org/r/20251017-av1_irisdecoder-v2-0-964a5478139e@oss.qualcomm.com

Changes in v2:
- Updated documentation to target AV1 codec, not just AV1 decoder
  (Nicolas)
- Updated description for V4L2_PIX_FMT_AV1 (Nicolas)
- Simplified buffer calculations and replaced numbers with relevant
  enums (Bryan, Nicolas)
- Improved commit text for patch 5/5
- Fix for kernel test robot failure
  Reported-by: kernel test robot <lkp@intel.com>
  Closes:
  https://lore.kernel.org/oe-kbuild-all/202510021620.4BVCZwgf-lkp@intel.com/
- Link to v1:
  https://lore.kernel.org/r/20251001-av1_irisdecoder-v1-0-9fb08f3b96a0@oss.qualcomm.com

Changes since RFC:
- Addressed CRC issues seen during fluster testing which
  are fixed with firmware fix [1]
- Added Documentation for AV1 stateful uapi [Nicholas]
- Resolved issues reported by static tool analyzers
- RFC:
  https://lore.kernel.org/linux-media/20250902-rfc_split-v1-0-47307a70c061@oss.qualcomm.com/

[1]:
https://lore.kernel.org/linux-firmware/ff27f712-a96e-4fa6-7572-a0091537d8ac@oss.qualcomm.com/

These patches are tested on SM8550 for AV1 decoder while
ensuring other codecs are not affected.

Gstreamer testing:
Gstreamer MR for enabling AV1 stateful decoder:
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/9892

Fluster testing:
Test suite: AV1-TEST-VECTORS
The result of fluster test on SM8550:
135/242 testcases passed while testing AV1-TEST-VECTORS with
GStreamer-AV1-V4L2-Gst1.0

failing tests:
unsupported content with bitdepth 10 (66 tests)
Iris decoder supports only 8bit NV12
av1-1-b10-00-quantizer-*

Unsupported resolution (36 tests).
Iris hardware decoder supports min resolution of 96x96
av1-1-b8-01-size-*

Unsupported colorformat (1 test)
av1-1-b8-24-monochrome

Unsupported SVC tests (2tests)
av1-1-b8-22-svc-L2T1
av1-1-b8-22-svc-L2T2

Bitstream corruption issue: (2tests)
av1-1-b8-03-sizeup
av1-1-b8-03-sizedown

Testsuite: CHROMIUM-8bit-AV1-TEST-VECTORS
13/13 testcases passed while testing CHROMIUM-8bit-AV1-TEST-VECTORS with
GStreamer-AV1-V4L2-Gst1.0

Following the RFC feedback, focused on only IVF/MKV content
as AV1 parser lacks support for below content
AV1-ARGON-PROFILE0-CORE-ANNEX-B
AV1-ARGON-PROFILE0-NON-ANNEX-B
AV1-ARGON-PROFILE0-NON-ANNEX-B

Unsupported test suites:
Iris Decoder supports only PROFILE0/V4L2_MPEG_VIDEO_AV1_PROFILE_MAIN
and 8 bit, 420 only
AV1-ARGON-PROFILE1-CORE-ANNEX-B
AV1-ARGON-PROFILE1-NON-ANNEX-B
AV1-ARGON-PROFILE1-STRESS-ANNEX-B
AV1-ARGON-PROFILE2-CORE-ANNEX-B
AV1-ARGON-PROFILE2-NON-ANNEX-B
AV1-ARGON-PROFILE2-STRESS-ANNEX-B
CHROMIUM-10bit-AV1-TEST-VECTORS

Compliance test for iris_driver device /dev/video0:

Driver Info:
		Driver name      : iris_driver
		Card type        : Iris Decoder
		Bus info         : platform:aa00000.video-codec
		Driver version   : 6.17.0
		Capabilities     : 0x84204000
				Video Memory-to-Memory Multiplanar
				Streaming
				Extended Pix Format
				Device Capabilities
		Device Caps      : 0x04204000
				Video Memory-to-Memory Multiplanar
				Streaming
				Extended Pix Format
		Detected Stateful Decoder

Required ioctls:
		test VIDIOC_QUERYCAP: OK
		test invalid ioctls: OK

Allow for multiple opens:
		test second /dev/video0 open: OK
		test VIDIOC_QUERYCAP: OK
		test VIDIOC_G/S_PRIORITY: OK
		test for unlimited opens: OK

Debug ioctls:
		test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
		test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
		test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not
Supported)
		test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
		test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
		test VIDIOC_ENUMAUDIO: OK (Not Supported)
		test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
		test VIDIOC_G/S_AUDIO: OK (Not Supported)
		Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
		test VIDIOC_G/S_MODULATOR: OK (Not Supported)
		test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
		test VIDIOC_ENUMAUDOUT: OK (Not Supported)
		test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
		test VIDIOC_G/S_AUDOUT: OK (Not Supported)
		Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
		test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
		test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not
Supported)
		test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
		test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
		test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
		test VIDIOC_QUERYCTRL: OK
		test VIDIOC_G/S_CTRL: OK
		test VIDIOC_G/S/TRY_EXT_CTRLS: OK
		test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
		test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
		Standard Controls: 12 Private Controls: 0

Format ioctls:
		test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
		test VIDIOC_G/S_PARM: OK (Not Supported)
		test VIDIOC_G_FBUF: OK (Not Supported)
		test VIDIOC_G_FMT: OK
		test VIDIOC_TRY_FMT: OK
		test VIDIOC_S_FMT: OK
		test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
		test Cropping: OK
		test Composing: OK
		test Scaling: OK (Not Supported)

Codec ioctls:
		test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
		test VIDIOC_G_ENC_INDEX: OK (Not Supported)
		test VIDIOC_(TRY_)DECODER_CMD: OK

Buffer ioctls:
		test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
		test CREATE_BUFS maximum buffers: OK
		test VIDIOC_REMOVE_BUFS: OK
		test VIDIOC_EXPBUF: OK
		test Requests: OK (Not Supported)
		test blocking wait: OK

Total for iris_driver device /dev/video0: 48, Succeeded: 48, Failed: 0,
Warnings: 0

Thanks,
Deepa

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
Deepa Guthyappa Madivalara (5):
      media: uapi: videodev2: Add support for AV1 stateful decoder
      media: v4l2: Add description for V4L2_PIX_FMT_AV1 in v4l_fill_fmtdesc()
      media: iris: Add support for AV1 format in iris decoder
      media: iris: Define AV1-specific platform capabilities and properties
      media: iris: Add internal buffer calculation for AV1 decoder

 .../userspace-api/media/v4l/pixfmt-compressed.rst  |   8 +
 drivers/media/platform/qcom/iris/iris_buffer.h     |   2 +
 drivers/media/platform/qcom/iris/iris_ctrls.c      |   8 +
 drivers/media/platform/qcom/iris/iris_hfi_common.h |   3 +
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |  85 +++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   9 +
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  22 ++
 drivers/media/platform/qcom/iris/iris_instance.h   |   1 +
 .../platform/qcom/iris/iris_platform_common.h      |  13 +
 .../media/platform/qcom/iris/iris_platform_gen1.c  |  22 +-
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 159 +++++++++++
 drivers/media/platform/qcom/iris/iris_vdec.c       |  23 +-
 drivers/media/platform/qcom/iris/iris_vidc.c       |   1 +
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 299 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h | 116 ++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c               |   1 +
 include/uapi/linux/videodev2.h                     |   1 +
 17 files changed, 747 insertions(+), 26 deletions(-)
---
base-commit: 1f2353f5a1af995efbf7bea44341aa0d03460b28
change-id: 20251029-av1d_stateful_v3-cbf9fed11adc

Best regards,
-- 
Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>


