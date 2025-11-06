Return-Path: <linux-arm-msm+bounces-80509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D04EC38FE9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 04:36:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C311B4FCEE1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 03:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4BE12C21F4;
	Thu,  6 Nov 2025 03:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nzpdbmpw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JLul8xQP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4252D73A4
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 03:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762399863; cv=none; b=TjZ4LhFW+7Ok4ka3qjieUMJw0JcnCPS8Swy9qR+gEAYwtcKA+Oen6IC8QSYzwDBM0G6Gbn1TcpXlWrgsc1b392MYxYxIhd5V7+QdBrqDARO78FAC/SzcYYDJll7c6nEJ+yI17rY9V06g570ZzWOsLa+q33LYrJNXq3lY2ySG/gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762399863; c=relaxed/simple;
	bh=fJoAPc83wR1LgHrDfr408IQ1A/7ZxGfeFvE/M2rCaic=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D10REHjp8md515n4VQ1hrGFQl9f2zy8SVsQS6IOsdL/A3vsLGOThDCW0t3Hi2yOdQniHnFf/j9sCNEBLRvQyUPDY5tWKmPcn2MOsnTWqT/ii+zuD95DFu4TiUQYSUrNgGXOHsWjeAFcatq075PDt3t+orGjouE3cDGGXI/O3iC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nzpdbmpw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JLul8xQP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A60b6cK2388980
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Nov 2025 03:31:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ovGBUB15DEWLk0DVrQSRCkCYrN6zQfyDDY5aUsiUaHo=; b=nzpdbmpwTf6c8P/z
	yy6nAF2sbpyZKDRQKw2Pj8+sebU3Mr1YaCcIh037GtKKR+imUPjWbHHVSjJm6Unm
	zicAzNp1TEyEpGMO3pwtdYSo6eQkfYOJ5IJXtfPu/DPVTHqaq/dYgkM5tmXeIejY
	onHuFHVFcwr/0ewss3EkK/+aw/AVTEizqYeff11UJ8jZB/CpMzfgLRx58xsTYWsK
	K7ptFWYcBhhm0VUlhqpw4d7p1QwtJuVXJ/XMxsmxD1OvOSO6LXr4jffYPXX7QJh4
	/T1wVcYMHn2aL3+evBD+8fcRARC+DeyJhXuXku3wSzo7DqRxKZyukhBf8w3kNdYz
	ttbMnw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8h9urdau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 03:31:00 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-294a938fa37so11968665ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 19:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762399859; x=1763004659; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ovGBUB15DEWLk0DVrQSRCkCYrN6zQfyDDY5aUsiUaHo=;
        b=JLul8xQPhyhrTZ4BezLV7nLLMXxJRPyyzqHqHqpOrnANePnmRCVSZ4Nqc7dNRh/yNt
         f9JQ0HVs7U4l8xS+3oQvwAJ3kgpESCVyQ02L9+nhX94lq7knw2Bj9cbmkhZrAMWDz+qX
         hfu9h034OKJSxf1OqlrdwKjMab1OLbGfcNwVXFfn15TVq9PASaRcj76JxM3cD7GwVcqf
         0XCyi1vpjMpRJpn8d4QuP6jzlY8V2WaAfxMuGosSQAOPp7zrfGS910OY11On9oIUYs2a
         Actik5KCr6XOpp95GVyIqE2h4fGNWNdlfY8JqZxrZ6UCo4sJ43gKjejuP2RmzCg677Bm
         R6cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762399859; x=1763004659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ovGBUB15DEWLk0DVrQSRCkCYrN6zQfyDDY5aUsiUaHo=;
        b=gx+p/vnVgCRyCBnQzl1Gs7TvnR3FzbIWI+vrzMkA1naaNxKOM3ZXSV89Rf4TSsdphu
         4g4vEdZ+PkhgiqqSTQa9GseGbPzRyaHHvFo5h2K8z5yshuWvFWTicBqE8KM2vujfR+OO
         95eu1ZB3cFmBesWVdYMokW9EjlDX4Axs8Fo4D4nZA6BHLKUY+u0bd1pTVWa1c3c55i+x
         u1ksVNdKlJKHWwNIWHgLXoeSpYX76qSYU9c3K9zswLNmliyBQcqj96dHpYVEkDydF0tM
         ut1ZKQE2Sw3HyivlZj8nlB68ba7GLzxHizQv+pl/DU6Zy/CElWlHLOVnRgqSvCQXS/Oz
         iZ+g==
X-Forwarded-Encrypted: i=1; AJvYcCWeQNK24KbK2zjYIr35wzZw9m39KkxVyAfoJoN7CXEsYNNCehZKKJhOjf4MglA6qkvwag0r52e9alwlAY27@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9K7y6+LgFHYlhccmkDohAnIot439ng4Z/NNFSPSWqc2Rtm/hw
	G+7nCJL2dHatOALB2nTBWi54r6MM+LTW3RzttSzh5+qx7wJDS3u9XboM/vLyC9zadMLf52DIyEy
	9ujdJg/vW8P72gQTe0oMay4/073MKNMpoUD04euXb0wQFBu2v5Dg7l3pD/Qb7cfo619GP
X-Gm-Gg: ASbGnct244Jtz3hoEYwHoZENL1TgDbaU6erRyy7acbXArc9BSYR9sQlTrXrTGz62jlf
	Xa7m5KW8euitLC9VSL0lD2snTaE29bBXKCtgwbPOlNea+L01C4zp55JwxNuRkUbGMk3xyoLHwqJ
	huPJct2xBq03Um8/NZBNWta1N5AYQQindJF0mAoyr9yUvcpYXX7j8Z1PeoWe62hP4cc4pH/Ms9N
	oKb4Gyu4YadBoHyoSl2rEB07/dohH6JYW67up/CgxV6eJdrZ/vLG6lzpPFEPTGPGahQv/AMySaG
	ZY3YbU7G9nUhO4RBqdqE6hLKBBNBtG4UtSJZNVzOSMptrOgh/Zru0AJefisvVnK3p7UBknnN5+X
	/HZBTZnU9sstanA3rxpG6PIq4e0aKYC5lv8kxPWHlhPv1lqSxF52byFIXV0Q0Gl/BzOf4STK+AA
	==
X-Received: by 2002:a17:902:e891:b0:295:4d50:aab6 with SMTP id d9443c01a7336-2962ad1ef3cmr74204235ad.18.1762399859500;
        Wed, 05 Nov 2025 19:30:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFa9wqU0TEXAeU7IUAuOLwc/rJpAYfELsDgUBzHCnlItiBEGyzp64/a6VsoXvnuBLzhXYS++Q==
X-Received: by 2002:a17:902:e891:b0:295:4d50:aab6 with SMTP id d9443c01a7336-2962ad1ef3cmr74203685ad.18.1762399858916;
        Wed, 05 Nov 2025 19:30:58 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651cd0060sm10361925ad.108.2025.11.05.19.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 19:30:58 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Thu, 06 Nov 2025 11:30:37 +0800
Subject: [PATCH v4 5/6] media: qcom: iris: Add flip support for encoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-iris_encoder_enhancements-v4-5-5d6cff963f1b@oss.qualcomm.com>
References: <20251106-iris_encoder_enhancements-v4-0-5d6cff963f1b@oss.qualcomm.com>
In-Reply-To: <20251106-iris_encoder_enhancements-v4-0-5d6cff963f1b@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>, quic_qiweil@quicinc.com,
        quic_renjiang@quicinc.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762399836; l=5542;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=fJoAPc83wR1LgHrDfr408IQ1A/7ZxGfeFvE/M2rCaic=;
 b=T0GaOjzE+e+efKO46QAWj0k4JjnTIovXMlV2adDExK0q8K/lsFCkWy7s7fyB4syllQBISVwyd
 BNwjxE4UVpMD6tTD+4YDr/ONSzzQVlJFMevJjtod9siLmuCxvvpIH0B
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=R5UO2NRX c=1 sm=1 tr=0 ts=690c1674 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=uxdc-9wEpbf47THqrzgA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: vgmbswBajOy2hgbW78uIw-_n0Fkp5rAl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDAyNiBTYWx0ZWRfX7/eSjXi9cjE0
 lKUl1L+sHmiVi6VbfzT7ToqtCzzuJXk+sTLPPYU00hm3+NpxGB+SfdENs08X5lBed3+XUnO9gqX
 RPhhcK8qFDaXQcDlY1sZkg6Tbzzpv+x9Vgmg8AX4G1PGZXTH4siWn+XIMw6KJgeybwbSQClTTd2
 wegLfpscNaBlL2mZupQ26JpUQNDrBr9VmajbwUyBtVCi9/wO04FTEF0ul0ZsMfhOYRdBjS/3Ro7
 wLYwDZFKJLpC9nCfGA56vpnrl2YgbQ9HAyJMFTWF24OBuGx6KShc+SDmu5C5UNrePNbbYTqI7xg
 4UJ9vvNJdsBErkF617vx12txE+JxtTpAZPvJlDr2gZxRMMVUNhSuRPynhuWsS9Qjx81OWw6LjZM
 hClV7yvsFXrwy3J6+OI4XntPnHBHPQ==
X-Proofpoint-GUID: vgmbswBajOy2hgbW78uIw-_n0Fkp5rAl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_09,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511060026

Add support for V4L2_CID_HFLIP and V4L2_CID_VFLIP controls in encoder.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 27 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  8 +++++++
 .../platform/qcom/iris/iris_platform_common.h      |  2 ++
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 22 ++++++++++++++++++
 5 files changed, 60 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 00949c207ddb0203e51df359214bf23c3d8265d0..8f74c12f2f41f23d75424819c707aff61ea61b33 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -100,6 +100,10 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 		return B_FRAME_QP_HEVC;
 	case V4L2_CID_ROTATE:
 		return ROTATION;
+	case V4L2_CID_HFLIP:
+		return HFLIP;
+	case V4L2_CID_VFLIP:
+		return VFLIP;
 	default:
 		return INST_FW_CAP_MAX;
 	}
@@ -189,6 +193,10 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP;
 	case ROTATION:
 		return V4L2_CID_ROTATE;
+	case HFLIP:
+		return V4L2_CID_HFLIP;
+	case VFLIP:
+		return V4L2_CID_VFLIP;
 	default:
 		return 0;
 	}
@@ -917,6 +925,25 @@ int iris_set_rotation(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
 					     &hfi_val, sizeof(u32));
 }
 
+int iris_set_flip(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	u32 hfi_val = HFI_DISABLE_FLIP;
+
+	if (inst->fw_caps[HFLIP].value)
+		hfi_val |= HFI_HORIZONTAL_FLIP;
+
+	if (inst->fw_caps[VFLIP].value)
+		hfi_val |= HFI_VERTICAL_FLIP;
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_U32_ENUM,
+					     &hfi_val, sizeof(u32));
+}
+
 int iris_set_properties(struct iris_inst *inst, u32 plane)
 {
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
index 3ea0a00c7587a516f19bb7307a0eb9a60c856ab0..355a592049f3fcc715a1b9df44b4d1398b052653 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.h
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
@@ -33,6 +33,7 @@ int iris_set_max_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_i
 int iris_set_frame_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_qp_range(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_rotation(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_flip(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_properties(struct iris_inst *inst, u32 plane);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index 4edcce7faf5e2f74bfecfdbf574391d5b1c9cca5..0f92468dca91cbb2ca9b451ebce255180066b3a4 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -92,6 +92,14 @@ enum hfi_rotation {
 };
 
 #define HFI_PROP_ROTATION			0x0300014b
+
+enum hfi_flip {
+	HFI_DISABLE_FLIP    = 0x00000000,
+	HFI_HORIZONTAL_FLIP = 0x00000001,
+	HFI_VERTICAL_FLIP   = 0x00000002,
+};
+
+#define HFI_PROP_FLIP				0x0300014c
 #define HFI_PROP_SIGNAL_COLOR_INFO		0x03000155
 #define HFI_PROP_PICTURE_TYPE			0x03000162
 #define HFI_PROP_DEC_DEFAULT_HEADER		0x03000168
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 9a4232b1c64eea6ce909e1e311769dd958b84c6e..284d6bde6d6bcdf70016646d1c92e6ae7f067efc 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -141,6 +141,8 @@ enum platform_inst_fw_cap_type {
 	B_FRAME_QP_H264,
 	B_FRAME_QP_HEVC,
 	ROTATION,
+	HFLIP,
+	VFLIP,
 	INST_FW_CAP_MAX,
 };
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index c1f83e179d441c45df8d6487dc87e137e482fb63..e74bdd00a4bb2f457ec9352e0acaebc820dae235 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -598,6 +598,28 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.flags = CAP_FLAG_OUTPUT_PORT,
 		.set = iris_set_rotation,
 	},
+	{
+		.cap_id = HFLIP,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROP_FLIP,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_flip,
+	},
+	{
+		.cap_id = VFLIP,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROP_FLIP,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_flip,
+	},
 };
 
 static struct platform_inst_caps platform_inst_cap_sm8550 = {

-- 
2.43.0


