Return-Path: <linux-arm-msm+bounces-84835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F87CB188E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 01:42:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D6D8313BF46
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 00:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8CE821765B;
	Wed, 10 Dec 2025 00:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dw7nr6vJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZyxlMXTa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6071DF26E
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 00:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765327189; cv=none; b=kbxpfyjKAhMw5ce/MPIM6fQXuiuvqQHdnmDRWzNPK20WsDyD+8hsvXCObDZhMfI8M9LI7PI7eVOgZkPPqZHjwKX0jL3+nGxka7Z66v+JwhZgAcGcrUSBYQsYXCpImT1a7xNLSe13eQlpAr1eHmq9dIbaif3I76CqNSZe8M1+QnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765327189; c=relaxed/simple;
	bh=fTkurkuNrJZkDzeoFQ0NTL4A3MjLIBcgXI+/4voJeAQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iiSDxlLdJTt7AJN+MnBCR1o155Hsw2KGpHHBFJWQ7vrpRcO7atpokThQiMx+slqJfolWPHalbcsQLzHDOlUl15Fp4yitJaeTEK6phflgZJj4LLRyuUoG41ntG7n6vhFG7od86ScXJCAnpo4JMsUcvPKPE/QfS7ylwUcPgLNG3iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dw7nr6vJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZyxlMXTa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA0OFDV507978
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 00:39:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cEcsYsit1dRgvZ0wf/p/8EfE3Mkov766qHMPRrIP/sY=; b=dw7nr6vJ59BOsW7p
	W1L8Rbkmqh6bvmxvRyILSQI7qIEl98Xd8KgUBfcjMuU2YOkdlaTcNh2CJfVk5APa
	cZPqwRMSSeQR8sAcqtzxeaWlucuYfO33mjrTjQHeSUUAP423DaY+wn50G2ZHncMt
	aUmAO+hPlo+SjYYn7W2TBXe4gQzaWnipIXWJPSkIQtwEB7OY946m+TUKkYJi2AAC
	2s2Azn83FoKTVYjxzDz5mrGMvQ3H9xnEtbzy1VJCd1Idg7ydMqhGXXKmgQJP5zRh
	ld0YyfktDHiPXY0Hm8laAhpwDCiZD7z+JKxwmBYmHVwMGZwR5W7oaPdnNuN+2wx8
	RR9puQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axp4vsnkb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 00:39:45 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29e346c988aso5386425ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 16:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765327185; x=1765931985; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cEcsYsit1dRgvZ0wf/p/8EfE3Mkov766qHMPRrIP/sY=;
        b=ZyxlMXTa+HHDM2I3/RLvWAXTeiZNTDPM+L+gOdbgzXWVGWVZH3A6R5Q29uLI83V9bb
         6JGTJLxYkgPmSGvd+ZOXwoplo4Pm0VxYjF3/XU/LNyRqrkXqpCT86yQio5LF9VdQwTQH
         yYlatgAOK5vmsm2WL+w6qR6I/GkNlNXsuHpbNz5gfM5p0GEGbWcER81E0i4myW20bDvG
         3vIT3UX1hVl9tbUM7230fbvtB/JHeh3hieuyDqMAudBaxdEslLXTBfNiZ2FaXTSRS4/s
         I/RpQsIdTqkUJmsublvDDlwLCG/qTkAf0Rlbf0LSp3oNNm110UVZt7oS6of0SntRWpTL
         5kDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765327185; x=1765931985;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cEcsYsit1dRgvZ0wf/p/8EfE3Mkov766qHMPRrIP/sY=;
        b=ajUhHFD4/vPZYIMNSL639facqRwDTjBpUtENYgoWuVZqHiC8qQyTouGhwG6sTm5FgO
         rEnRXOlbbET3dV/6jHIHzcN9bnGjSw3NQGl18sFOKyDJapgzLIQug9W5LkR4fEmnN6z6
         fPEai2WkQG0bpshXfgSQNjkWBGKybxma4ii24jriS9IT0jzOJxGxVSOshJuNV0DiAsic
         gHugDbq7omD3COipmVPLT9yw4VmJilvmC8ERMAn7fjtI3NmWu8Fsrpw8QgJfQrd0CACp
         02JPVmCaa7pnSgFC2U+3eMBMqf0brW6GWC4AKFYAlF0Ont7tiLeS95vSZuhtNHZK40F6
         K+gA==
X-Forwarded-Encrypted: i=1; AJvYcCXKROIcjGhR3kZrNIBCVmHh0b5mYXPii/TEjVpImA4nk71bs6CFdAue7kWdXdXxdKBijlp8LL2hOYWsRciA@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/89aWFVsI5sNW/G996q7eAIeT5iXYWU9pzaX/8+BzMpVhdBht
	SovRb4lEJAhVcdTHdUQsNX064dWMSrHl5Umi1LISin6q9d1ZvXUbSuM9lCWFz8lQPwdATZNaEbV
	JsblTabSN1FekBVU6XC/HKYQEmE72Jr4QNx3tcfcZk7FUvJ0TLWndfNACQjzGss+ZBtyv
X-Gm-Gg: AY/fxX4bljOrCKyHhMdZfN2oMhZEvxHrPTGwOFRNCMOATmnvMZhSVwKBe8i1PlPDugi
	J9qdMq7uuWClpmsj0D1EfETUKYXLtklbMpSunGDwoqfY1mJP5V2Z3vxm08faZDc4fdzw7wtrZxE
	l/Rkr8kywplhpBDcxz3Jg37IpbG/FtzFgjWzM/0D3jQow1CpcQbQQxY/ENp2QxbzYV7O8YJuI5U
	O8qblVNQe1+rtp73gMzQGYcnD9wF3hTZpILtkvrKYwede3oIqMTsrcL16ExtEbwGVWIYFSk3JlJ
	Sc29Nheihc6R4FgWKg2FPL88+bMykx6qG0Vdk8/ymdfTlkqR+B+sxHjfQ/PYm2Vc8XpJbHwM5La
	kSYLHAtidrSx4E/me8cUeuFa4ZCSHtFGP0oL046boU92CkU7puvF64cSYF4LrdbCy+Ymx3g==
X-Received: by 2002:a05:693c:2b0a:b0:2ab:ca55:893f with SMTP id 5a478bee46e88-2ac05567dffmr402396eec.6.1765327184096;
        Tue, 09 Dec 2025 16:39:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHiyg3z4a2jk0vVF/GdNMX0JOr9zqwPNK+Lik7iYGQVoFZ4duik5x0/j0nFkF9xAq8fwcBhEg==
X-Received: by 2002:a05:693c:2b0a:b0:2ab:ca55:893f with SMTP id 5a478bee46e88-2ac05567dffmr402385eec.6.1765327183411;
        Tue, 09 Dec 2025 16:39:43 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2aba822b615sm46666784eec.0.2025.12.09.16.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 16:39:43 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Tue, 09 Dec 2025 16:39:38 -0800
Subject: [PATCH v9 5/5] media: iris: Add internal buffer calculation for
 AV1 decoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251209-av1d_stateful_v3-v9-5-718e3b3934b1@oss.qualcomm.com>
References: <20251209-av1d_stateful_v3-v9-0-718e3b3934b1@oss.qualcomm.com>
In-Reply-To: <20251209-av1d_stateful_v3-v9-0-718e3b3934b1@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765327177; l=23772;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=fTkurkuNrJZkDzeoFQ0NTL4A3MjLIBcgXI+/4voJeAQ=;
 b=TU1SJpWmOZXzZuVwpMy22LrMEC57jc1mFuCvphoQeSZeVvmQ9aZLignfS+yC3etVJ+I+II8Zo
 BLgR7TnVP0TAlCp0PAI8egO1isLeF3LcQblJza1k9vS5QLgKdbsNCOt
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-GUID: EIcFZJRzcrbZxtGHGtf2afoHdjb-amWd
X-Proofpoint-ORIG-GUID: EIcFZJRzcrbZxtGHGtf2afoHdjb-amWd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDAwMyBTYWx0ZWRfXyQmSEXT9aYck
 6ls+CYxYABcPEgPPT/0EOxl8KAmk98BvaFm51sVFPdtftP6NY3ch9Rl96cxRUJ7jsgfV4FdcNBd
 GLvgt8gJQ7TaDw0T0Oscl0xH+zBx+YSM09wcMcQTDBgLIdaNwQwM5V2cCeEZtl6YBEx0Mw/GWU2
 3WFPzxhE+sPkHpZjf6ulUpPHS6+UYVPpXPURouL9NcMzBCS3MHCu4EFEpBr7QH/8BcQo0GTIzob
 7msiOih3EtgauT0SuyHdfUKNlLbWW2R1osX9gCRSL0fgpN8o0t0q5bhS7/XyajxVahm1Z2jBNDX
 Lrca/iteZPkMrIk/bcyyVqpabkFXToMetxwrd62zrqWrThzJ7eegUvsapstikuKhEUX3lGwtoCE
 G7HSf/5zyfvdvDL+i7CzVyWOQ6hwPg==
X-Authority-Analysis: v=2.4 cv=IoYTsb/g c=1 sm=1 tr=0 ts=6938c151 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=3eCS73FKbHPN4UNaIXEA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512100003

Implement internal buffer count and size calculations for AV1 decoder
for all the buffer types required by the AV1 decoder, including BIN,
COMV, PERSIST, LINE, and PARTIAL.

This ensures the hardware decoder has properly allocated memory for AV1
decoding operations, enabling correct AV1 video playback.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.h     |   1 +
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 299 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h | 116 ++++++++
 3 files changed, 412 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.h b/drivers/media/platform/qcom/iris/iris_buffer.h
index 5ef365d9236c7cbdee24a4614789b3191881968b..75bb767761824c4c02e0df9b765896cc093be333 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.h
+++ b/drivers/media/platform/qcom/iris/iris_buffer.h
@@ -27,6 +27,7 @@ struct iris_inst;
  * @BUF_SCRATCH_1: buffer to store decoding/encoding context data for HW
  * @BUF_SCRATCH_2: buffer to store encoding context data for HW
  * @BUF_VPSS: buffer to store VPSS context data for HW
+ * @BUF_PARTIAL: buffer for AV1 IBC data
  * @BUF_TYPE_MAX: max buffer types
  */
 enum iris_buffer_type {
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index 4463be05ce165adef6b152eb0c155d2e6a7b3c36..f4985790bae4104ec5769e2de16a56727af462ba 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -9,6 +9,17 @@
 #include "iris_hfi_gen2_defines.h"
 
 #define HFI_MAX_COL_FRAME 6
+#define HFI_COLOR_FORMAT_YUV420_NV12_UBWC_Y_TILE_HEIGHT (8)
+#define HFI_COLOR_FORMAT_YUV420_NV12_UBWC_Y_TILE_WIDTH (32)
+#define HFI_COLOR_FORMAT_YUV420_NV12_UBWC_UV_TILE_HEIGHT (8)
+#define HFI_COLOR_FORMAT_YUV420_NV12_UBWC_UV_TILE_WIDTH (16)
+#define HFI_COLOR_FORMAT_YUV420_TP10_UBWC_Y_TILE_HEIGHT (4)
+#define HFI_COLOR_FORMAT_YUV420_TP10_UBWC_Y_TILE_WIDTH (48)
+#define HFI_COLOR_FORMAT_YUV420_TP10_UBWC_UV_TILE_HEIGHT (4)
+#define HFI_COLOR_FORMAT_YUV420_TP10_UBWC_UV_TILE_WIDTH (24)
+#define AV1D_SIZE_BSE_COL_MV_64x64 512
+#define AV1D_SIZE_BSE_COL_MV_128x128 2816
+#define UBWC_TILE_SIZE 256
 
 #ifndef SYSTEM_LAL_TILE10
 #define SYSTEM_LAL_TILE10 192
@@ -39,6 +50,31 @@ static u32 hfi_buffer_bin_h264d(u32 frame_width, u32 frame_height, u32 num_vpp_p
 	return size_h264d_hw_bin_buffer(n_aligned_w, n_aligned_h, num_vpp_pipes);
 }
 
+static u32 size_av1d_hw_bin_buffer(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
+{
+	u32 size_yuv, size_bin_hdr, size_bin_res;
+
+	size_yuv = ((frame_width * frame_height) <= BIN_BUFFER_THRESHOLD) ?
+		((BIN_BUFFER_THRESHOLD * 3) >> 1) :
+		((frame_width * frame_height * 3) >> 1);
+	size_bin_hdr = size_yuv * AV1_CABAC_HDR_RATIO_HD_TOT;
+	size_bin_res = size_yuv * AV1_CABAC_RES_RATIO_HD_TOT;
+	size_bin_hdr = ALIGN(size_bin_hdr / num_vpp_pipes,
+			     DMA_ALIGNMENT) * num_vpp_pipes;
+	size_bin_res = ALIGN(size_bin_res / num_vpp_pipes,
+			     DMA_ALIGNMENT) * num_vpp_pipes;
+
+	return size_bin_hdr + size_bin_res;
+}
+
+static u32 hfi_buffer_bin_av1d(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
+{
+	u32 n_aligned_h = ALIGN(frame_height, 16);
+	u32 n_aligned_w = ALIGN(frame_width, 16);
+
+	return size_av1d_hw_bin_buffer(n_aligned_w, n_aligned_h, num_vpp_pipes);
+}
+
 static u32 size_h265d_hw_bin_buffer(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
 {
 	u32 product = frame_width * frame_height;
@@ -110,6 +146,26 @@ static u32 hfi_buffer_comv_h265d(u32 frame_width, u32 frame_height, u32 _comv_bu
 	return (_size * (_comv_bufcount)) + 512;
 }
 
+static u32 num_lcu(u32 frame_width, u32 frame_height, u32 lcu_size)
+{
+	return ((frame_width + lcu_size - 1) / lcu_size) *
+		((frame_height + lcu_size - 1) / lcu_size);
+}
+
+static u32 hfi_buffer_comv_av1d(u32 frame_width, u32 frame_height, u32 comv_bufcount)
+{
+	u32 size;
+
+	size =  2 * ALIGN(max(num_lcu(frame_width, frame_height, 64) *
+			  AV1D_SIZE_BSE_COL_MV_64x64,
+			  num_lcu(frame_width, frame_height, 128) *
+			  AV1D_SIZE_BSE_COL_MV_128x128),
+			  DMA_ALIGNMENT);
+	size *= comv_bufcount;
+
+	return size;
+}
+
 static u32 size_h264d_bse_cmd_buf(u32 frame_height)
 {
 	u32 height = ALIGN(frame_height, 32);
@@ -122,7 +178,7 @@ static u32 size_h265d_bse_cmd_buf(u32 frame_width, u32 frame_height)
 {
 	u32 _size = ALIGN(((ALIGN(frame_width, LCU_MAX_SIZE_PELS) / LCU_MIN_SIZE_PELS) *
 			   (ALIGN(frame_height, LCU_MAX_SIZE_PELS) / LCU_MIN_SIZE_PELS)) *
-			  NUM_HW_PIC_BUF, DMA_ALIGNMENT);
+			    NUM_HW_PIC_BUF, DMA_ALIGNMENT);
 	_size = min_t(u32, _size, H265D_MAX_SLICE + 1);
 	_size = 2 * _size * SIZE_H265D_BSE_CMD_PER_BUF;
 
@@ -174,6 +230,20 @@ static u32 hfi_buffer_persist_h264d(void)
 		    DMA_ALIGNMENT);
 }
 
+static u32 hfi_buffer_persist_av1d(u32 max_width, u32 max_height, u32 total_ref_count)
+{
+	u32 comv_size, size;
+
+	comv_size =  hfi_buffer_comv_av1d(max_width, max_height, total_ref_count);
+	size = ALIGN((SIZE_AV1D_SEQUENCE_HEADER * 2 + SIZE_AV1D_METADATA +
+	AV1D_NUM_HW_PIC_BUF * (SIZE_AV1D_TILE_OFFSET + SIZE_AV1D_QM) +
+	AV1D_NUM_FRAME_HEADERS * (SIZE_AV1D_FRAME_HEADER +
+	2 * SIZE_AV1D_PROB_TABLE) + comv_size + HDR10_HIST_EXTRADATA_SIZE +
+	SIZE_AV1D_METADATA * AV1D_NUM_HW_PIC_BUF), DMA_ALIGNMENT);
+
+	return ALIGN(size, DMA_ALIGNMENT);
+}
+
 static u32 hfi_buffer_non_comv_h264d(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
 {
 	u32 size_bse = size_h264d_bse_cmd_buf(frame_height);
@@ -459,6 +529,182 @@ static u32 hfi_buffer_line_h264d(u32 frame_width, u32 frame_height,
 	return ALIGN((size + vpss_lb_size), DMA_ALIGNMENT);
 }
 
+static u32 size_av1d_lb_opb_wr1_nv12_ubwc(u32 frame_width, u32 frame_height)
+{
+	u32 size, y_width, y_width_a = 128;
+
+	y_width = ALIGN(frame_width, y_width_a);
+
+	size = ((y_width + HFI_COLOR_FORMAT_YUV420_NV12_UBWC_Y_TILE_WIDTH - 1) /
+		 HFI_COLOR_FORMAT_YUV420_NV12_UBWC_Y_TILE_WIDTH  +
+		 (AV1D_MAX_TILE_COLS - 1));
+	return size * UBWC_TILE_SIZE;
+}
+
+static u32 size_av1d_lb_opb_wr1_tp10_ubwc(u32 frame_width, u32 frame_height)
+{
+	u32 size, y_width, y_width_a = 256;
+
+	y_width = ALIGN(frame_width, y_width_a);
+
+	size = ((y_width + HFI_COLOR_FORMAT_YUV420_TP10_UBWC_Y_TILE_WIDTH - 1) /
+		 HFI_COLOR_FORMAT_YUV420_TP10_UBWC_Y_TILE_WIDTH +
+		 (AV1D_MAX_TILE_COLS - 1));
+
+	return size * UBWC_TILE_SIZE;
+}
+
+static u32 hfi_buffer_line_av1d(u32 frame_width, u32 frame_height,
+				bool is_opb, u32 num_vpp_pipes)
+{
+	u32 size, vpss_lb_size, opbwrbufsize, opbwr8, opbwr10;
+
+	size = ALIGN(size_av1d_lb_fe_top_data(frame_width, frame_height),
+		     DMA_ALIGNMENT) +
+		ALIGN(size_av1d_lb_fe_top_ctrl(frame_width, frame_height),
+		      DMA_ALIGNMENT) +
+		ALIGN(size_av1d_lb_fe_left_data(frame_width, frame_height),
+		      DMA_ALIGNMENT) * num_vpp_pipes +
+		ALIGN(size_av1d_lb_fe_left_ctrl(frame_width, frame_height),
+		      DMA_ALIGNMENT) * num_vpp_pipes +
+		ALIGN(size_av1d_lb_se_left_ctrl(frame_width, frame_height),
+		      DMA_ALIGNMENT) * num_vpp_pipes +
+		ALIGN(size_av1d_lb_se_top_ctrl(frame_width, frame_height),
+		      DMA_ALIGNMENT) +
+		ALIGN(size_av1d_lb_pe_top_data(frame_width, frame_height),
+		      DMA_ALIGNMENT) +
+		ALIGN(size_av1d_lb_vsp_top(frame_width, frame_height),
+		      DMA_ALIGNMENT) +
+		ALIGN(size_av1d_lb_recon_dma_metadata_wr
+		      (frame_width, frame_height), DMA_ALIGNMENT) * 2 +
+		ALIGN(size_av1d_qp(frame_width, frame_height), DMA_ALIGNMENT);
+	opbwr8 = size_av1d_lb_opb_wr1_nv12_ubwc(frame_width, frame_height);
+	opbwr10 = size_av1d_lb_opb_wr1_tp10_ubwc(frame_width, frame_height);
+	opbwrbufsize = opbwr8 >= opbwr10 ? opbwr8 : opbwr10;
+	size = ALIGN((size + opbwrbufsize), DMA_ALIGNMENT);
+	if (is_opb) {
+		vpss_lb_size = size_vpss_lb(frame_width, frame_height);
+		size = ALIGN((size + vpss_lb_size) * 2, DMA_ALIGNMENT);
+	}
+
+	return size;
+}
+
+static u32 size_av1d_ibc_nv12_ubwc(u32 frame_width, u32 frame_height)
+{
+	u32 size;
+	u32 y_width_a = 128, y_height_a = 32;
+	u32 uv_width_a = 128, uv_height_a = 32;
+	u32 ybufsize, uvbufsize, y_width, y_height, uv_width, uv_height;
+	u32 y_meta_width_a = 64, y_meta_height_a = 16;
+	u32 uv_meta_width_a = 64, uv_meta_height_a = 16;
+	u32 meta_height, meta_stride, meta_size;
+	u32 tile_width_y = HFI_COLOR_FORMAT_YUV420_NV12_UBWC_Y_TILE_WIDTH;
+	u32 tile_height_y = HFI_COLOR_FORMAT_YUV420_NV12_UBWC_Y_TILE_HEIGHT;
+	u32 tile_width_uv = HFI_COLOR_FORMAT_YUV420_NV12_UBWC_UV_TILE_WIDTH;
+	u32 tile_height_uv = HFI_COLOR_FORMAT_YUV420_NV12_UBWC_UV_TILE_HEIGHT;
+
+	y_width = ALIGN(frame_width, y_width_a);
+	y_height = ALIGN(frame_height, y_height_a);
+	uv_width = ALIGN(frame_width, uv_width_a);
+	uv_height = ALIGN(((frame_height + 1) >> 1), uv_height_a);
+	ybufsize = ALIGN((y_width * y_height), HFI_ALIGNMENT_4096);
+	uvbufsize = ALIGN(uv_width * uv_height, HFI_ALIGNMENT_4096);
+	size = ybufsize + uvbufsize;
+	meta_stride = ALIGN(((frame_width + (tile_width_y - 1)) / tile_width_y),
+			    y_meta_width_a);
+	meta_height = ALIGN(((frame_height + (tile_height_y - 1)) / tile_height_y),
+			    y_meta_height_a);
+	meta_size = ALIGN(meta_stride * meta_height, HFI_ALIGNMENT_4096);
+	size += meta_size;
+	meta_stride = ALIGN(((((frame_width + 1) >> 1) + (tile_width_uv - 1)) /
+				tile_width_uv),	uv_meta_width_a);
+	meta_height = ALIGN(((((frame_height + 1) >> 1) + (tile_height_uv - 1)) /
+				tile_height_uv), uv_meta_height_a);
+	meta_size = ALIGN(meta_stride * meta_height, HFI_ALIGNMENT_4096);
+	size += meta_size;
+
+	return size;
+}
+
+static u32 hfi_yuv420_tp10_calc_y_stride(u32 frame_width, u32 stride_multiple)
+{
+	u32 stride;
+
+	stride = ALIGN(frame_width, 192);
+	stride = ALIGN(stride * 4 / 3, stride_multiple);
+
+	return stride;
+}
+
+static u32 hfi_yuv420_tp10_calc_y_bufheight(u32 frame_height, u32 min_buf_height_multiple)
+{
+	return ALIGN(frame_height, min_buf_height_multiple);
+}
+
+static u32 hfi_yuv420_tp10_calc_uv_stride(u32 frame_width, u32 stride_multiple)
+{
+	u32 stride;
+
+	stride = ALIGN(frame_width, 192);
+	stride = ALIGN(stride * 4 / 3, stride_multiple);
+
+	return stride;
+}
+
+static u32 hfi_yuv420_tp10_calc_uv_bufheight(u32 frame_height, u32 min_buf_height_multiple)
+{
+	return ALIGN(((frame_height + 1) >> 1),	min_buf_height_multiple);
+}
+
+static u32 size_av1d_ibc_tp10_ubwc(u32 frame_width, u32 frame_height)
+{
+	u32 size;
+	u32 y_width_a = 256, y_height_a = 16,
+		uv_width_a = 256, uv_height_a = 16;
+	u32 ybufsize, uvbufsize, y_width, y_height, uv_width, uv_height;
+	u32 y_meta_width_a = 64, y_meta_height_a = 16,
+		uv_meta_width_a = 64, uv_meta_height_a = 16;
+	u32 meta_height, meta_stride, meta_size;
+	u32 tile_width_y = HFI_COLOR_FORMAT_YUV420_TP10_UBWC_Y_TILE_WIDTH;
+	u32 tile_height_y = HFI_COLOR_FORMAT_YUV420_TP10_UBWC_Y_TILE_HEIGHT;
+	u32 tile_width_uv = HFI_COLOR_FORMAT_YUV420_TP10_UBWC_UV_TILE_WIDTH;
+	u32 tile_height_uv = HFI_COLOR_FORMAT_YUV420_TP10_UBWC_UV_TILE_HEIGHT;
+
+	y_width = hfi_yuv420_tp10_calc_y_stride(frame_width, y_width_a);
+	y_height = hfi_yuv420_tp10_calc_y_bufheight(frame_height, y_height_a);
+	uv_width = hfi_yuv420_tp10_calc_uv_stride(frame_width, uv_width_a);
+	uv_height = hfi_yuv420_tp10_calc_uv_bufheight(frame_height, uv_height_a);
+	ybufsize = ALIGN(y_width * y_height, HFI_ALIGNMENT_4096);
+	uvbufsize = ALIGN(uv_width * uv_height, HFI_ALIGNMENT_4096);
+	size = ybufsize + uvbufsize;
+	meta_stride = ALIGN(((frame_width + (tile_width_y - 1)) / tile_width_y),
+			    y_meta_width_a);
+	meta_height = ALIGN(((frame_height + (tile_height_y - 1)) / tile_height_y),
+			    y_meta_height_a);
+	meta_size = ALIGN(meta_stride * meta_height, HFI_ALIGNMENT_4096);
+	size += meta_size;
+	meta_stride = ALIGN(((((frame_width + 1) >> 1) + (tile_width_uv - 1)) /
+				tile_width_uv), uv_meta_width_a);
+	meta_height = ALIGN(((((frame_height + 1) >> 1) + (tile_height_uv - 1)) /
+				tile_height_uv), uv_meta_height_a);
+	meta_size = ALIGN(meta_stride * meta_height, HFI_ALIGNMENT_4096);
+	size += meta_size;
+
+	return size;
+}
+
+static u32 hfi_buffer_ibc_av1d(u32 frame_width, u32 frame_height)
+{
+	u32 size, ibc8, ibc10;
+
+	ibc8 = size_av1d_ibc_nv12_ubwc(frame_width, frame_height);
+	ibc10 = size_av1d_ibc_tp10_ubwc(frame_width, frame_height);
+	size = ibc8 >= ibc10 ? ibc8 : ibc10;
+
+	return ALIGN(size, DMA_ALIGNMENT);
+}
+
 static u32 iris_vpu_dec_bin_size(struct iris_inst *inst)
 {
 	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
@@ -472,6 +718,8 @@ static u32 iris_vpu_dec_bin_size(struct iris_inst *inst)
 		return hfi_buffer_bin_h265d(width, height, num_vpp_pipes);
 	else if (inst->codec == V4L2_PIX_FMT_VP9)
 		return hfi_buffer_bin_vp9d(width, height, num_vpp_pipes);
+	else if (inst->codec == V4L2_PIX_FMT_AV1)
+		return hfi_buffer_bin_av1d(width, height, num_vpp_pipes);
 
 	return 0;
 }
@@ -487,18 +735,34 @@ static u32 iris_vpu_dec_comv_size(struct iris_inst *inst)
 		return hfi_buffer_comv_h264d(width, height, num_comv);
 	else if (inst->codec == V4L2_PIX_FMT_HEVC)
 		return hfi_buffer_comv_h265d(width, height, num_comv);
+	else if (inst->codec == V4L2_PIX_FMT_AV1) {
+		if (inst->fw_caps[DRAP].value)
+			return 0;
+		else
+			return hfi_buffer_comv_av1d(width, height, num_comv);
+	}
 
 	return 0;
 }
 
 static u32 iris_vpu_dec_persist_size(struct iris_inst *inst)
 {
+	struct platform_inst_caps *caps;
+
 	if (inst->codec == V4L2_PIX_FMT_H264)
 		return hfi_buffer_persist_h264d();
 	else if (inst->codec == V4L2_PIX_FMT_HEVC)
 		return hfi_buffer_persist_h265d(0);
 	else if (inst->codec == V4L2_PIX_FMT_VP9)
 		return hfi_buffer_persist_vp9d();
+	else if (inst->codec == V4L2_PIX_FMT_AV1) {
+		caps = inst->core->iris_platform_data->inst_caps;
+		if (inst->fw_caps[DRAP].value)
+			return hfi_buffer_persist_av1d(caps->max_frame_width,
+			caps->max_frame_height, 16);
+		else
+			return hfi_buffer_persist_av1d(0, 0, 0);
+	}
 
 	return 0;
 }
@@ -545,6 +809,8 @@ static u32 iris_vpu_dec_line_size(struct iris_inst *inst)
 	else if (inst->codec == V4L2_PIX_FMT_VP9)
 		return hfi_buffer_line_vp9d(width, height, out_min_count, is_opb,
 			num_vpp_pipes);
+	else if (inst->codec == V4L2_PIX_FMT_AV1)
+		return hfi_buffer_line_av1d(width, height, is_opb, num_vpp_pipes);
 
 	return 0;
 }
@@ -653,6 +919,15 @@ static u32 iris_vpu_enc_bin_size(struct iris_inst *inst)
 				  num_vpp_pipes, inst->hfi_rc_type);
 }
 
+static u32 iris_vpu_dec_partial_size(struct iris_inst *inst)
+{
+	struct v4l2_format *f = inst->fmt_src;
+	u32 height = f->fmt.pix_mp.height;
+	u32 width = f->fmt.pix_mp.width;
+
+	return hfi_buffer_ibc_av1d(width, height);
+}
+
 static inline
 u32 hfi_buffer_comv_enc(u32 frame_width, u32 frame_height, u32 lcu_size,
 			u32 num_recon, u32 standard)
@@ -1414,7 +1689,9 @@ static int output_min_count(struct iris_inst *inst)
 
 	/* fw_min_count > 0 indicates reconfig event has already arrived */
 	if (inst->fw_min_count) {
-		if (iris_split_mode_enabled(inst) && inst->codec == V4L2_PIX_FMT_VP9)
+		if (iris_split_mode_enabled(inst) &&
+		    (inst->codec == V4L2_PIX_FMT_VP9 ||
+		     inst->codec == V4L2_PIX_FMT_AV1))
 			return min_t(u32, 4, inst->fw_min_count);
 		else
 			return inst->fw_min_count;
@@ -1422,6 +1699,8 @@ static int output_min_count(struct iris_inst *inst)
 
 	if (inst->codec == V4L2_PIX_FMT_VP9)
 		output_min_count = 9;
+	else if (inst->codec == V4L2_PIX_FMT_AV1)
+		output_min_count = 11;
 
 	return output_min_count;
 }
@@ -1444,6 +1723,7 @@ u32 iris_vpu_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type)
 		{BUF_PERSIST,     iris_vpu_dec_persist_size         },
 		{BUF_DPB,         iris_vpu_dec_dpb_size             },
 		{BUF_SCRATCH_1,   iris_vpu_dec_scratch1_size        },
+		{BUF_PARTIAL,     iris_vpu_dec_partial_size         },
 	};
 
 	static const struct iris_vpu_buf_type_handle enc_internal_buf_type_handle[] = {
@@ -1510,14 +1790,20 @@ static u32 internal_buffer_count(struct iris_inst *inst,
 	    buffer_type == BUF_PERSIST) {
 		return 1;
 	} else if (buffer_type == BUF_COMV || buffer_type == BUF_NON_COMV) {
-		if (inst->codec == V4L2_PIX_FMT_H264 || inst->codec == V4L2_PIX_FMT_HEVC)
+		if (inst->codec == V4L2_PIX_FMT_H264 ||
+		    inst->codec == V4L2_PIX_FMT_HEVC ||
+		    inst->codec == V4L2_PIX_FMT_AV1)
 			return 1;
 	}
+
 	return 0;
 }
 
 static inline int iris_vpu_dpb_count(struct iris_inst *inst)
 {
+	if (inst->codec == V4L2_PIX_FMT_AV1)
+		return 11;
+
 	if (iris_split_mode_enabled(inst)) {
 		return inst->fw_min_count ?
 			inst->fw_min_count : inst->buffers[BUF_OUTPUT].min_count;
@@ -1536,9 +1822,13 @@ int iris_vpu_buf_count(struct iris_inst *inst, enum iris_buffer_type buffer_type
 			return MIN_BUFFERS;
 		else
 			return output_min_count(inst);
+	case BUF_NON_COMV:
+		if (inst->codec == V4L2_PIX_FMT_AV1)
+			return 0;
+		else
+			return 1;
 	case BUF_BIN:
 	case BUF_COMV:
-	case BUF_NON_COMV:
 	case BUF_LINE:
 	case BUF_PERSIST:
 		return internal_buffer_count(inst, buffer_type);
@@ -1546,6 +1836,7 @@ int iris_vpu_buf_count(struct iris_inst *inst, enum iris_buffer_type buffer_type
 	case BUF_SCRATCH_2:
 	case BUF_VPSS:
 	case BUF_ARP:
+	case BUF_PARTIAL:
 		return 1; /* internal buffer count needed by firmware is 1 */
 	case BUF_DPB:
 		return iris_vpu_dpb_count(inst);
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
index 04f0b7400a1e4e1d274d690a2761b9e57778e8b7..13c7199fcf351cac5f01c0d1ca20c093b1e62234 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
@@ -11,6 +11,7 @@ struct iris_inst;
 #define MIN_BUFFERS			4
 
 #define DMA_ALIGNMENT			256
+#define HFI_ALIGNMENT_4096      4096
 
 #define NUM_HW_PIC_BUF			32
 #define LCU_MAX_SIZE_PELS 64
@@ -81,6 +82,22 @@ struct iris_inst;
 #define MAX_PE_NBR_DATA_LCU64_LINE_BUFFER_SIZE	384
 #define MAX_FE_NBR_DATA_LUMA_LINE_BUFFER_SIZE	640
 
+#define AV1_CABAC_HDR_RATIO_HD_TOT 2
+#define AV1_CABAC_RES_RATIO_HD_TOT 2
+#define AV1D_LCU_MAX_SIZE_PELS 128
+#define AV1D_LCU_MIN_SIZE_PELS 64
+#define AV1D_MAX_TILE_COLS     64
+#define MAX_PE_NBR_DATA_LCU32_LINE_BUFFER_SIZE 192
+#define MAX_PE_NBR_DATA_LCU16_LINE_BUFFER_SIZE 96
+#define AV1D_NUM_HW_PIC_BUF    16
+#define AV1D_NUM_FRAME_HEADERS 16
+#define SIZE_AV1D_SEQUENCE_HEADER 768
+#define SIZE_AV1D_METADATA        512
+#define SIZE_AV1D_FRAME_HEADER    1280
+#define SIZE_AV1D_TILE_OFFSET     65536
+#define SIZE_AV1D_QM              3328
+#define SIZE_AV1D_PROB_TABLE      22784
+
 #define SIZE_SLICE_CMD_BUFFER (ALIGN(20480, 256))
 #define SIZE_SPS_PPS_SLICE_HDR (2048 + 4096)
 #define SIZE_BSE_SLICE_CMD_BUF ((((8192 << 2) + 7) & (~7)) * 3)
@@ -101,6 +118,15 @@ struct iris_inst;
 #define NUM_MBS_4K (DIV_ROUND_UP(MAX_WIDTH, 16) * DIV_ROUND_UP(MAX_HEIGHT, 16))
 #define NUM_MBS_720P	(((ALIGN(1280, 16)) >> 4) * ((ALIGN(736, 16)) >> 4))
 
+#define BITS_PER_PIX                   16
+#define NUM_LINES_LUMA                 10
+#define NUM_LINES_CHROMA               6
+#define AV1D_LCU_MAX_SIZE_PELS         128
+#define AV1D_LCU_MIN_SIZE_PELS         64
+#define AV1D_MAX_TILE_COLS             64
+#define BITS_PER_CTRL_PACK             128
+#define NUM_CTRL_PACK_LCU              10
+
 static inline u32 size_h264d_lb_fe_top_data(u32 frame_width)
 {
 	return MAX_FE_NBR_DATA_LUMA_LINE_BUFFER_SIZE * ALIGN(frame_width, 16) * 3;
@@ -146,6 +172,96 @@ static inline u32 size_h264d_qp(u32 frame_width, u32 frame_height)
 	return DIV_ROUND_UP(frame_width, 64) * DIV_ROUND_UP(frame_height, 64) * 128;
 }
 
+static inline u32 size_av1d_lb_fe_top_data(u32 frame_width, u32 frame_height)
+{
+	return (ALIGN(frame_width, AV1D_LCU_MAX_SIZE_PELS) *
+		((BITS_PER_PIX * NUM_LINES_LUMA) >> 3) +
+		  ALIGN(frame_width, AV1D_LCU_MAX_SIZE_PELS) / 2 *
+		((BITS_PER_PIX * NUM_LINES_CHROMA) >> 3) * 2);
+}
+
+static inline u32 size_av1d_lb_fe_left_data(u32 frame_width, u32 frame_height)
+{
+	return (32 * (ALIGN(frame_height, AV1D_LCU_MAX_SIZE_PELS) +
+			  ALIGN(frame_height, AV1D_LCU_MAX_SIZE_PELS) /
+			  AV1D_LCU_MIN_SIZE_PELS * 16) +
+		16 * (ALIGN(frame_height, AV1D_LCU_MAX_SIZE_PELS) / 2 +
+			  ALIGN(frame_height, AV1D_LCU_MAX_SIZE_PELS) /
+			  AV1D_LCU_MIN_SIZE_PELS * 8) * 2 +
+		24 * (ALIGN(frame_height, AV1D_LCU_MAX_SIZE_PELS) +
+			  ALIGN(frame_height, AV1D_LCU_MAX_SIZE_PELS) /
+			  AV1D_LCU_MIN_SIZE_PELS * 16) +
+		24 * (ALIGN(frame_height, AV1D_LCU_MAX_SIZE_PELS) / 2 +
+			  ALIGN(frame_height, AV1D_LCU_MAX_SIZE_PELS) /
+			  AV1D_LCU_MIN_SIZE_PELS * 12) * 2 +
+		24 * (ALIGN(frame_height, AV1D_LCU_MAX_SIZE_PELS) +
+			  ALIGN(frame_height, AV1D_LCU_MAX_SIZE_PELS) /
+			  AV1D_LCU_MIN_SIZE_PELS * 16) +
+		16 * (ALIGN(frame_height, AV1D_LCU_MAX_SIZE_PELS) +
+			  ALIGN(frame_height, AV1D_LCU_MAX_SIZE_PELS) /
+			  AV1D_LCU_MIN_SIZE_PELS * 16) +
+		16 * (ALIGN(frame_height, AV1D_LCU_MAX_SIZE_PELS) / 2 +
+			  ALIGN(frame_height, AV1D_LCU_MAX_SIZE_PELS) /
+			  AV1D_LCU_MIN_SIZE_PELS * 12) * 2);
+}
+
+static inline u32 size_av1d_lb_fe_top_ctrl(u32 frame_width, u32 frame_height)
+{
+	return (NUM_CTRL_PACK_LCU * ((frame_width + AV1D_LCU_MIN_SIZE_PELS - 1) /
+		AV1D_LCU_MIN_SIZE_PELS) * BITS_PER_CTRL_PACK / 8);
+}
+
+static inline u32 size_av1d_lb_fe_left_ctrl(u32 frame_width, u32 frame_height)
+{
+	return (16 * ((ALIGN(frame_height, AV1D_LCU_MAX_SIZE_PELS) / 16) +
+		(ALIGN(frame_height, AV1D_LCU_MAX_SIZE_PELS) /
+		 AV1D_LCU_MIN_SIZE_PELS)) +
+		 3 * 16 * (ALIGN(frame_height, AV1D_LCU_MAX_SIZE_PELS) /
+		 AV1D_LCU_MIN_SIZE_PELS));
+}
+
+static inline u32 size_av1d_lb_se_top_ctrl(u32 frame_width, u32 frame_height)
+{
+	return (((frame_width + 7) / 8) * MAX_SE_NBR_CTRL_LCU16_LINE_BUFFER_SIZE);
+}
+
+static inline u32 size_av1d_lb_se_left_ctrl(u32 frame_width, u32 frame_height)
+{
+	return (max(((frame_height + 15) / 16) *
+		MAX_SE_NBR_CTRL_LCU16_LINE_BUFFER_SIZE,
+		max(((frame_height + 31) / 32) *
+		MAX_SE_NBR_CTRL_LCU32_LINE_BUFFER_SIZE,
+		((frame_height + 63) / 64) *
+		MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE)));
+}
+
+static inline u32 size_av1d_lb_pe_top_data(u32 frame_width, u32 frame_height)
+{
+	return (max(((frame_width + 15) / 16) *
+		MAX_PE_NBR_DATA_LCU16_LINE_BUFFER_SIZE,
+		max(((frame_width + 31) / 32) *
+		MAX_PE_NBR_DATA_LCU32_LINE_BUFFER_SIZE,
+		((frame_width + 63) / 64) *
+		MAX_PE_NBR_DATA_LCU64_LINE_BUFFER_SIZE)));
+}
+
+static inline u32 size_av1d_lb_vsp_top(u32 frame_width, u32 frame_height)
+{
+	return (max(((frame_width + 63) / 64) * 1280,
+		    ((frame_width + 127) / 128) * MAX_HEIGHT));
+}
+
+static inline u32 size_av1d_lb_recon_dma_metadata_wr(u32 frame_width,
+						     u32 frame_height)
+{
+	return ((ALIGN(frame_height, 8) / (4 / 2)) * 64);
+}
+
+static inline u32 size_av1d_qp(u32 frame_width, u32 frame_height)
+{
+	return size_h264d_qp(frame_width, frame_height);
+}
+
 u32 iris_vpu_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 u32 iris_vpu33_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 int iris_vpu_buf_count(struct iris_inst *inst, enum iris_buffer_type buffer_type);

-- 
2.34.1


