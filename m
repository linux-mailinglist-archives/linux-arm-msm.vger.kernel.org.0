Return-Path: <linux-arm-msm+bounces-82794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA19C78480
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 11:01:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A7B86346FB9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 09:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 321C134A795;
	Fri, 21 Nov 2025 09:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SNvmBtgv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L6jltmfd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8353C34A771
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 09:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763718875; cv=none; b=mkgH2vuWyxhU68jHwfFQYaw6M4T0L9BnW7dO0SjCW6FO8UD/ymb3HUoWpOJIMVotA/RtNkHzE6xEVXXzZ80zYs35gEnUkQ61+5lAqTwdR6NEJHQDS+ksfshm6KvvXOcqgN6a53kmxgSuE1+TNPXT2AR3aKXENzwhfEXdvHYfPqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763718875; c=relaxed/simple;
	bh=NF20glWWdaja2dXTOLlql3QL7KV3Nd7D+3IKiWMJdpE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KqvP8AA21ewKRghU9WtgVzS2MKe/mQBCX61qqyl52vf8XRBSh6d2b8/aNknIuLbpUxCv1LAIkmSlBN6wN6lMxLR0/5lhpPsNKUXChUicLx2kxof9z2gKSf6RDLFdPV0f6baDF/ZprPcgzRlnh//1Xm64pakvv+zIN71fW1Mfy+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SNvmBtgv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L6jltmfd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL9W4Fi3049176
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 09:54:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	48qJo3RzTcHFH36K186eJwhTlKLWxXBCY0Plt4XexxU=; b=SNvmBtgvYTKJOEzF
	gv3KGgNU5reOuqZI1uUJZ51XRfYwigAW+ez9k07vY9NVUyEWsJFSL+lZgTfUvabw
	sQ5a2pr2uY4tlB0ULd/JhKfB32prHRPLkGtypGi8kGcdOkcM/ozOjzoeptHzeg1O
	lDXmGrQTbEGbFz3yZafLzIaZXikjJHhdjsqIeGGelLMlt7frbSQkiUySSoxTN3WX
	yC93xhrrWUH1e5EgJDkRwJ1ANC0vJrd57Ptq7LwyEeRw3C097u4yRa0QrzBcjxpG
	ziQQjN+CgIpQRGBlmWmDmyOwNcG/wCotMWyt6I7Tp8U6qwcNDKTTGUwrtU7sY/AS
	9AeZXg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajnhjr2nn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 09:54:32 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3437f0760daso4475349a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 01:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763718872; x=1764323672; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=48qJo3RzTcHFH36K186eJwhTlKLWxXBCY0Plt4XexxU=;
        b=L6jltmfde1M3MC3+sJJatiSlTXhuoHRGDn0Ci6eHM4MvO0d7f0nhLLfagm4DW0LeLW
         joFl6qid9Ow+EwtQNpVPbPUBUmsCwAutwBUPUm88HzRTEGmVaqmmMvp+6pDBkE/gbiTN
         kAyoTWViMVBVbKNcfL5mEm/ouskjW1CbmT82Btl2q61H7V48oojwPza/Sv3cFgLwblAL
         W8hc5CHCF34It+2c9CHKAsTuxl6b3TKM2xk5n0zlyWDu/oJN3oZzKLidlBOf/PYHfyH1
         PKxStZEAVN+PjlnKhKv4anmM9w8Lzgqls85AsgOSkmzBNJ5BJHkUKB00ANkolr72Jqrw
         qNSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763718872; x=1764323672;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=48qJo3RzTcHFH36K186eJwhTlKLWxXBCY0Plt4XexxU=;
        b=m3v9W7TGbfzBR/Humh4hNAQq5LiPGC2uzUqjLj06WjsGAaiIwZj3gPQqArGZMgDjur
         qggMpdT0q5q4CFoJFRRcSNQvlWoJNVttUxYQXmiPyrh9YfkVwZLH08sE/1rFP4k3t4Tw
         CBvkpadb1yN3APJ4fYx2CCuXghQ14tAk9ule8LEhOPqJkst1JWYHujiCx/F2FrBkLHnW
         J3DkFTWT3pXhhuEwz8crlfJzJfl5nzWxFtPGuhlMYI1gZnjRY2xGmdsIoaVt0JI70cD9
         mYTiDm4f26NJ+C23wqIPbbohv8wSxkLN9fGRu0q2TwM2ZFifbqGpoeEkkAB4b5OIANgI
         t6Ww==
X-Gm-Message-State: AOJu0YwH5LHZ8yp+6mnWZOJgyRF/kgbualheEE9Srmfc1dgAPFXbdi0H
	ujYODqFKcmfd7lXlX7QwhpxqyIO4loEJEhNvg0kQdQfngXiP8wzchufbJJTJ2huK9vdVzwNwDue
	Dcr9QwWQFX2z9RQqLTK/HyYFUOganUqrt2s3zlTUL6SRheXabhVXbdSeS8BGBY76hSDrL
X-Gm-Gg: ASbGnctAx0i7WXE5e1KWVPDcf8klRYv/Oo9lMhbI+kMFn2+CrnpDfhjaUxhyEcuY0zZ
	6hvqzB6z1aFj6EnvycTZYHwGuyvRR5aNE887jFt1miuWexTphTzSnWd3ZPAF8kitMslQ5xa39tF
	BGad5PFwtSgQABiWnktkbPVJYBcE6Fl5ogX+KmzyQDoFbS+Fn49kKTJir5dNfy60QHR1OvfkRdY
	YUGrJyXse4PSaqxlgqNgBQZ3OH2J6Fk32NH+beTpLg3yQBW2LZZYrf5tEPvO2Z0ToOmdSpaGCLq
	Qx+QA7gZKK+l6OAxRfWY69PMMeIDyF1osdPw7NZZWAXxXDboceRkku3yZg66HnFjiOQOAy8OTp9
	De3JYiN12nbjXLPfLXybI/B49LVRX4aI9zWjN/6jcyUeQ+jJbcEm/7cwa4qPzOhomrpQHDImWQ4
	bOq2RkAUyVnG8GbjwcW0nzyujOhVh+MA==
X-Received: by 2002:a17:903:11d1:b0:273:ab5f:a507 with SMTP id d9443c01a7336-29b6c405de9mr20770725ad.21.1763718872088;
        Fri, 21 Nov 2025 01:54:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGEVtrGvCzUmdccOe623FLPGIZ58QK2q73rCdPCD8pjgLwT6zkCF5Ec3m6rfQPiWIsyCzoc9g==
X-Received: by 2002:a17:903:11d1:b0:273:ab5f:a507 with SMTP id d9443c01a7336-29b6c405de9mr20770485ad.21.1763718871613;
        Fri, 21 Nov 2025 01:54:31 -0800 (PST)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b13e720sm50557985ad.42.2025.11.21.01.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 01:54:31 -0800 (PST)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 15:23:54 +0530
Subject: [PATCH 3/4] soc: qcom: llcc: Fix usecase id macro alignment
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-glymur_llcc_enablement-v1-3-336b851b8dcb@oss.qualcomm.com>
References: <20251121-glymur_llcc_enablement-v1-0-336b851b8dcb@oss.qualcomm.com>
In-Reply-To: <20251121-glymur_llcc_enablement-v1-0-336b851b8dcb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        sibi.sankar@oss.qualcomm.com, rajendra.nayak@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763718858; l=5365;
 i=pankaj.patil@oss.qualcomm.com; s=20251121; h=from:subject:message-id;
 bh=NF20glWWdaja2dXTOLlql3QL7KV3Nd7D+3IKiWMJdpE=;
 b=54L5g0w/0ED/xPpxy1K05yNSlWZKeBRx9mgF3WZtQBoQ19o93+JJxzaxb+atm7ReBUs92DTzO
 fTrSSZMH9CcDa7CGBO/VxkCLKhPpz5rEJWgAwp+nmpbVEpJ1f388WrS
X-Developer-Key: i=pankaj.patil@oss.qualcomm.com; a=ed25519;
 pk=pWpEq/tlX6TaKH1UQolvxjRD+Vdib/sEkb8bH8AL6gc=
X-Proofpoint-ORIG-GUID: U2CIaNYLHV7g5kU_EeQW2IMt7Lus319V
X-Authority-Analysis: v=2.4 cv=SPlPlevH c=1 sm=1 tr=0 ts=692036d8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=LbEivujOKq5tWBeTMgMA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA3NCBTYWx0ZWRfX4MKIHaTNdIAS
 FeMYMo2ytOqaBUsqiXwLTHaL/W1RnsrfEkibGZDDU1cR73RG+V6+pznsiSrUrKVSgfZxAn/+vue
 FALWDto/4dOjSSbc9l8JZL+xbsYslK3BFLOEBCFkeE73ICuJjZ+nvzT+zSZngRUMAutOzk15EDo
 En33HBUVn1KWnuYLxpgjMRYV4+LSDrSGC0/FFH7nA7RIYc0YycgflktiV6MdCE8OgvDEdKyAkrN
 3TCleWjvZf1rTqOGeEyQt9HGrOB5rUoaMWmRwN7ZWizFK/yEiWQvZXDCa0SL+LrGeYVWpo4gt2T
 Ih2iHI+orf7vf4uy+8/qGCzA7yf62MoVDT/Z9ujGCmXPX8Cv2u7hBAk0jkxpmyNf/bmk8J/v/Fj
 RBC/F4g9O2N9EMUG83flXubaYQAQSw==
X-Proofpoint-GUID: U2CIaNYLHV7g5kU_EeQW2IMt7Lus319V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511210074

Fixed spacing for usecase id macro along the
column length

Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 include/linux/soc/qcom/llcc-qcom.h | 156 ++++++++++++++++++-------------------
 1 file changed, 78 insertions(+), 78 deletions(-)

diff --git a/include/linux/soc/qcom/llcc-qcom.h b/include/linux/soc/qcom/llcc-qcom.h
index 8243ab3a12a8..30b436d0140a 100644
--- a/include/linux/soc/qcom/llcc-qcom.h
+++ b/include/linux/soc/qcom/llcc-qcom.h
@@ -8,84 +8,84 @@
 #ifndef __LLCC_QCOM__
 #define __LLCC_QCOM__
 
-#define LLCC_CPUSS       1
-#define LLCC_VIDSC0      2
-#define LLCC_VIDSC1      3
-#define LLCC_ROTATOR     4
-#define LLCC_VOICE       5
-#define LLCC_AUDIO       6
-#define LLCC_MDMHPGRW    7
-#define LLCC_MDM         8
-#define LLCC_MODHW       9
-#define LLCC_CMPT        10
-#define LLCC_GPUHTW      11
-#define LLCC_GPU         12
-#define LLCC_MMUHWT      13
-#define LLCC_CMPTDMA     15
-#define LLCC_DISP        16
-#define LLCC_VIDFW       17
-#define LLCC_CAMFW       18
-#define LLCC_MDMHPFX     20
-#define LLCC_MDMPNG      21
-#define LLCC_AUDHW       22
-#define LLCC_NPU         23
-#define LLCC_WLHW        24
-#define LLCC_PIMEM       25
-#define LLCC_ECC         26
-#define LLCC_CVP         28
-#define LLCC_MODPE       29
-#define LLCC_APTCM       30
-#define LLCC_WRCACHE     31
-#define LLCC_CVPFW       32
-#define LLCC_CPUSS1      33
-#define LLCC_CAMEXP0     34
-#define LLCC_CPUMTE      35
-#define LLCC_CPUHWT      36
-#define LLCC_MDMCLAD2    37
-#define LLCC_CAMEXP1     38
-#define LLCC_CMPTHCP     39
-#define LLCC_LCPDARE     40
-#define LLCC_AENPU       45
-#define LLCC_ISLAND1     46
-#define LLCC_ISLAND2     47
-#define LLCC_ISLAND3     48
-#define LLCC_ISLAND4     49
-#define LLCC_CAMEXP2	 50
-#define LLCC_CAMEXP3	 51
-#define LLCC_CAMEXP4	 52
-#define LLCC_DISP_WB	 53
-#define LLCC_DISP_1	 54
-#define LLCC_VIEYE	 57
-#define LLCC_VIDPTH	 58
-#define LLCC_GPUMV	 59
-#define LLCC_EVA_LEFT	 60
-#define LLCC_EVA_RIGHT	 61
-#define LLCC_EVAGAIN	 62
-#define LLCC_VIPTH	 63
-#define LLCC_VIDVSP	 64
-#define LLCC_DISP_LEFT	 65
-#define LLCC_DISP_RIGHT	 66
-#define LLCC_EVCS_LEFT	 67
-#define LLCC_EVCS_RIGHT	 68
-#define LLCC_SPAD	 69
-#define LLCC_VIDDEC	 70
-#define LLCC_CAMOFE	 71
-#define LLCC_CAMRTIP	 72
-#define LLCC_CAMSRTIP	 73
-#define LLCC_CAMRTRF	 74
-#define LLCC_CAMSRTRF	 75
-#define LLCC_OOBM_NS	 81
-#define LLCC_OOBM_S	 82
-#define LLCC_VIDEO_APV	 83
-#define LLCC_COMPUTE1	 87
-#define LLCC_CPUSS_OPP	 88
-#define LLCC_CPUSSMPAM	 89
-#define LLCC_VIDSC_VSP1	 91
-#define LLCC_CAM_IPE_STROV	 92
-#define LLCC_CAM_OFE_STROV	 93
-#define LLCC_CPUSS_HEU	 94
-#define LLCC_PCIE_TCU	 97
-#define LLCC_MDM_PNG_FIXED	 100
+#define LLCC_CPUSS         1
+#define LLCC_VIDSC0        2
+#define LLCC_VIDSC1        3
+#define LLCC_ROTATOR       4
+#define LLCC_VOICE         5
+#define LLCC_AUDIO         6
+#define LLCC_MDMHPGRW      7
+#define LLCC_MDM           8
+#define LLCC_MODHW         9
+#define LLCC_CMPT          10
+#define LLCC_GPUHTW        11
+#define LLCC_GPU           12
+#define LLCC_MMUHWT        13
+#define LLCC_CMPTDMA       15
+#define LLCC_DISP          16
+#define LLCC_VIDFW         17
+#define LLCC_CAMFW         18
+#define LLCC_MDMHPFX       20
+#define LLCC_MDMPNG        21
+#define LLCC_AUDHW         22
+#define LLCC_NPU           23
+#define LLCC_WLHW          24
+#define LLCC_PIMEM         25
+#define LLCC_ECC           26
+#define LLCC_CVP           28
+#define LLCC_MODPE         29
+#define LLCC_APTCM         30
+#define LLCC_WRCACHE       31
+#define LLCC_CVPFW         32
+#define LLCC_CPUSS1        33
+#define LLCC_CAMEXP0       34
+#define LLCC_CPUMTE        35
+#define LLCC_CPUHWT        36
+#define LLCC_MDMCLAD2      37
+#define LLCC_CAMEXP1       38
+#define LLCC_CMPTHCP       39
+#define LLCC_LCPDARE       40
+#define LLCC_AENPU         45
+#define LLCC_ISLAND1       46
+#define LLCC_ISLAND2       47
+#define LLCC_ISLAND3       48
+#define LLCC_ISLAND4       49
+#define LLCC_CAMEXP2       50
+#define LLCC_CAMEXP3       51
+#define LLCC_CAMEXP4       52
+#define LLCC_DISP_WB       53
+#define LLCC_DISP_1        54
+#define LLCC_VIEYE         57
+#define LLCC_VIDPTH        58
+#define LLCC_GPUMV         59
+#define LLCC_EVA_LEFT      60
+#define LLCC_EVA_RIGHT     61
+#define LLCC_EVAGAIN       62
+#define LLCC_VIPTH         63
+#define LLCC_VIDVSP        64
+#define LLCC_DISP_LEFT     65
+#define LLCC_DISP_RIGHT    66
+#define LLCC_EVCS_LEFT     67
+#define LLCC_EVCS_RIGHT    68
+#define LLCC_SPAD          69
+#define LLCC_VIDDEC        70
+#define LLCC_CAMOFE        71
+#define LLCC_CAMRTIP       72
+#define LLCC_CAMSRTIP      73
+#define LLCC_CAMRTRF       74
+#define LLCC_CAMSRTRF      75
+#define LLCC_OOBM_NS       81
+#define LLCC_OOBM_S        82
+#define LLCC_VIDEO_APV     83
+#define LLCC_COMPUTE1      87
+#define LLCC_CPUSS_OPP     88
+#define LLCC_CPUSSMPAM     89
+#define LLCC_VIDSC_VSP1    91
+#define LLCC_CAM_IPE_STROV 92
+#define LLCC_CAM_OFE_STROV 93
+#define LLCC_CPUSS_HEU     94
+#define LLCC_PCIE_TCU      97
+#define LLCC_MDM_PNG_FIXED 100
 
 /**
  * struct llcc_slice_desc - Cache slice descriptor

-- 
2.34.1


