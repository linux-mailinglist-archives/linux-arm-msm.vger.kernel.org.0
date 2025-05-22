Return-Path: <linux-arm-msm+bounces-59111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8C0AC1433
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 21:06:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FCF01B67093
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 19:06:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6A5029CB5B;
	Thu, 22 May 2025 19:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ICUZxNiF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C924929B794
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 19:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940635; cv=none; b=UZHm5nd48YQiQ2/eXtOU3DTVCml5wWD4GRw+hJPpyZQ3rSJUqQe3RDNanxBcnlKcCjuIY1VydMNHfdWeIHNk28TQ8DZT4NMr3QcryownSB2iFmKL7UB6w+VyPIVmtbTAH10ey9M4OKG7J8ZObYtoyQlzXOcApyhRotzEZbfgFSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940635; c=relaxed/simple;
	bh=LvHpzkBXpQpS6a1CNyb0eHhKR06FkrHNFz2Vb8Rs+HI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HCbwuMsdUXmD59Hjlyu+G2afk29ZP48FIUA3KX+CfSJWBditnoPMcibjjlw9wWxSv2/PRTESN1f0KerlGb9idG4yDlYvDHymbAhxdlrnu9ayNXIZiryQ2GJazFkNSDihdVxHWbvZBNUhHriEcZtr45oEt3SAgCMGNztK6fCcr4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ICUZxNiF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MIFPT7015209
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 19:03:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UkdtLDWPWV86WMIXjh/84M
	WseBY4yX2yXHBPJxMZ3kk=; b=ICUZxNiFZgYqtRmX8jYmbzvBUWf4j0U1zyTYei
	Xr0unvWTNsM76pf6SWTw5P8OETXqmV2f6VS1eiwcumXNQ8F9YTKaVm2pUoLNWwFQ
	bpnvs7H7zs2hLYBOI6Xl3XIegqYBJ4t1RtSfl2i7Dlu1nffl8+qv89ebNngVpuZp
	hw+kipCWog8G2uNxBaXXYRzogqInOQ0fN5CGCQjyn+qy/q3U8Yb3ZZurRGfKoo+y
	59heevnpSqxuXUsnuARs8y9RV0ew4vurOZ45q36d7eErdciYpCRv/lzDEImUWTtG
	0hb1iyNrQeX15NAGRNC9fdBpv4oyCn2ocq/b0+vyfCecSvwQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9fb1k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 19:03:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c760637fe5so1435083685a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 12:03:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940613; x=1748545413;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UkdtLDWPWV86WMIXjh/84MWseBY4yX2yXHBPJxMZ3kk=;
        b=mdNmb6XvwFD5MXKbxstchf6HtE7qSCgm3ght3lBLHCjcgX7BFYt4X9wcYtV84p6saK
         U+64vnGewNGs9ioq2aRO0cDGLIw0ZUKXHqyGeo4n1zLnAh+NYUi7vFWY3u4bt1tYNIpo
         507f4mJXgrhseV88IprMS3JD4xC1wj+gZJGVfmc5YTrJgm8xMZscE33RK5B4pXQDYAyw
         cmX9DYBxCsH/l6AaOrFBQ8LPPM1sPyQSWHCe2xWxpU07XH92gDHmoPovu+UIfqmGKKqR
         M7BMaprvyNhUKJ/EfrUxb83ivRuhnShmNCdUDkL4y4Wz3SzgILoQ0LmTNqKZt00/+VA+
         zYVg==
X-Forwarded-Encrypted: i=1; AJvYcCWewOFc8ztnCXJa/rOWNxSzlfsG4H4+uhAT0nwy/BLGB6NqWS07H+h3BogqIWcpyjx7yQGaow/7Fj5KkQu5@vger.kernel.org
X-Gm-Message-State: AOJu0YzDJod9EutzuYX1KbbyaB52ri5WBtwT8rx4Max7TzlO/WH1B66s
	CNW8aGlCtNekCePCV760VMzFo82LXRLO9OfdiQD+RXon0BnFy3U6DUVdz9FLwbB3I225DcoifrW
	2yHv5Zlt7kJhrMLMMQEzXZHSdolLeQPQdsAikoF+QCgLieo+FOazok0FDybWTohrkb6V2
X-Gm-Gg: ASbGncsfi6I4ibateHw9I4xoZh8WDDuVRL/L6GX7AsD4NfpI3Ip5bQIUQ9xI6CrPoAK
	pIv1TgUjooGuy0wOh2Cd0L0RtVupdziFqQtqCGVv149r2xyl3FjUiDRKYLdfPqkZV5DvNhM4Txt
	odbuUkohctOEvDLZV9KBPyhgWBEAOtH1IbbrUqLq44n3pvvKBO/AjpW6m5rCNc8msfJqHp3PQG7
	fZ/lNOg1GwpwwZlkiWgTfdmY8e9GnXQ4+6DalErm4poLLg06CUR4bXrcWngNuYZ4CzPLjwW9I+F
	vVxkEg0pse/BuqkKmOrbtULQi7RzXBoU9oHCrFxnE6W7s1DVpZZ4z7T+SEQvTX2pVpXeUgAYiz7
	K9Wfr/galFvyHOz5dgnS53Uew
X-Received: by 2002:a05:620a:2549:b0:7c7:93ae:fe56 with SMTP id af79cd13be357-7cd467a9b62mr3939271785a.51.1747940612577;
        Thu, 22 May 2025 12:03:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEy/n5ztww6OKTyWk1l8kEgne9HO2Dpgd6If8J3vYhRa+Ry7rHzuHnJj7UGH+LV1945QHf4sw==
X-Received: by 2002:a05:620a:2549:b0:7c7:93ae:fe56 with SMTP id af79cd13be357-7cd467a9b62mr3939266585a.51.1747940612101;
        Thu, 22 May 2025 12:03:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703c2f3sm3482506e87.214.2025.05.22.12.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:03:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 00/30] drm/msm/dpu: rework HW block feature handling
Date: Thu, 22 May 2025 22:03:19 +0300
Message-Id: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPd0L2gC/4XNwY7CIBCA4VcxnKUBBijdk++x2cMIUyXR0gXb7
 Mb03UWN2Us3Xib5J5lvrqxQjlTYx+bKMs2xxDTUMNsN80ccDsRjqM2UUFoqCTyMEw85jbwnvEy
 ZCm+tgOCBSLqO1bsxUx9/HubnV+1jLJeUfx8vZnnfvjS9os2SC9451wtrld+3tDvFAXNqUj6wO
 zerF2GEVquEqoTADq3Fdg+odqmU5nvCk0/nc1PHE4K3EFTIB/ToZABj+38g/QcZ2a1BukLWG3K
 OQIKDFWhZlhteW8P/jgEAAA==
X-Change-ID: 20241213-dpu-drop-features-7603dc3ee189
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6762;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=LvHpzkBXpQpS6a1CNyb0eHhKR06FkrHNFz2Vb8Rs+HI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoL3T790+sMC1fTh8sf4v2cPnQ2YpE/MKGy7u7q
 8uc9hDMus6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaC90+wAKCRCLPIo+Aiko
 1VgACAChGrC/R4NUQTnzHLFYbc0EkGkOD2LbpA7jOehjTtJ7O3jaWmQDFKiz4BMfqlRCptcBXb2
 0R6QpdXB3PZNG7SloFQYzZn0OI85ze6TBTQRMIprq2yFPCJWQdKHrJp/onLTwNl5IApkIo7jQRV
 clcOz1/TFLuKKdHSn5LueLfFfHggD+c3U1Z5rhE6bZfIkomtBL/MUA1LKV4xdK8nDwunfeZPeNs
 I1J4eWleTcXgDJZyPOCl1wir9p1ANy26kogPbIzCMCVR4noqttb1ZUTJUQaJnSUnatePYSE3mpE
 r71VPk96fq/WR6b8YyJVzyS5aRhGd+coYI+KmO55iJ7LqWB0
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: B1v4YHrIYEE7MlxWComvyJq_h86E6kR_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MiBTYWx0ZWRfX3Kg544mZivSe
 c0vhrwqZcGjXVFtjtLbE9y+MOFhm35dI5LqT5eI8sDvNghnfxzJ/WOpIjYS9GXkxtGwpaNqLXB/
 rNsY3o0WWyA7hlJkRe+9MqmXfGBdx4VWIPNRdHQlGIBCPhrrA6jG4P/7WrSgy1jl4bfsl0JGa4O
 paax5GrkjyJFpQA22WpBQAoaqy7srsKVYBITgWRNrRAITTbDIweHO9s8agcV8X/xU7r2oYHoNG7
 N/26Go2B+j6OGTgp+y+92gD5hQ93kwdjaCH63PWB1NKoN9jNBDagJI6vAWD1SCGnbB5YPPgABJf
 4M4GZCyGJ5ncZU2KbZdwhlMLRSEq9IFiVp1772+FvCpGzhEwoiqxxn29qAnQ7uJXlEaYbUAl/Bx
 nEmT64GjFsjR0TaRs2avPWGhCtsQHLUY9Q3AKNe5+Pjetob1I0A7yywCw/i00Fw8l/li7M9A
X-Authority-Analysis: v=2.4 cv=GawXnRXL c=1 sm=1 tr=0 ts=682f7517 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=t8tNeZB39Io7CcBQPAcA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: B1v4YHrIYEE7MlxWComvyJq_h86E6kR_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220192

Some time ago we started the process of converting HW blocks to use
revision-based checks instead of having feature bits (which are easy to
miss or to set incorrectly). Then the process of such a conversion was
postponed. (Mostly) finish the conversion. The only blocks which still
have feature bits are SSPP, WB and VBIF. In the rare cases where
behaviour actually differs from platform to platform (or from block to
block) use unsigned long bitfields, they have simpler syntax to be
checked and don't involve test_bit() invocation.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v5:
- Added version check in _dpu_encoder_phys_cmd_update_intf_cfg() (Neil)
  Technically it's not necessary, but it makes it easier to follow the
  code.
- Fixed commit message for the DPU_MDP_AUDIO_SELECT patch (Neil)
- Link to v4: https://lore.kernel.org/r/20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com

Changes in v4:
- Rebased on top of linux-next
- Dropped three controversial patches, will be submitted separately
- Folded MIXER_SDM845_MASK into MIXER_MSM8998_MASK as they are equal
  now.
- Link to v3: https://lore.kernel.org/r/20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com

Changes in v3:
- Repost, fixing email/author issues caused by b4 / mailmap interaction
- Link to v2: https://lore.kernel.org/r/20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com

Changes in v2:
- Rebased on top of the current msm-next
- Link to v1: https://lore.kernel.org/r/20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org

---
Dmitry Baryshkov (30):
      drm/msm/dpu: stop passing mdss_ver to setup_timing_gen()
      drm/msm/dpu: drop INTF_SC7280_MASK
      drm/msm/dpu: inline _setup_ctl_ops()
      drm/msm/dpu: inline _setup_dsc_ops()
      drm/msm/dpu: inline _setup_dspp_ops()
      drm/msm/dpu: inline _setup_mixer_ops()
      drm/msm/dpu: remove DSPP_SC7180_MASK
      drm/msm/dpu: get rid of DPU_CTL_HAS_LAYER_EXT4
      drm/msm/dpu: get rid of DPU_CTL_ACTIVE_CFG
      drm/msm/dpu: get rid of DPU_CTL_FETCH_ACTIVE
      drm/msm/dpu: get rid of DPU_CTL_DSPP_SUB_BLOCK_FLUSH
      drm/msm/dpu: get rid of DPU_CTL_VM_CFG
      drm/msm/dpu: get rid of DPU_DATA_HCTL_EN
      drm/msm/dpu: get rid of DPU_INTF_STATUS_SUPPORTED
      drm/msm/dpu: get rid of DPU_INTF_INPUT_CTRL
      drm/msm/dpu: get rid of DPU_PINGPONG_DSC
      drm/msm/dpu: get rid of DPU_PINGPONG_DITHER
      drm/msm/dpu: get rid of DPU_MDP_VSYNC_SEL
      drm/msm/dpu: get rid of DPU_MDP_PERIPH_0_REMOVED
      drm/msm/dpu: get rid of DPU_MDP_AUDIO_SELECT
      drm/msm/dpu: get rid of DPU_MIXER_COMBINED_ALPHA
      drm/msm/dpu: get rid of DPU_DIM_LAYER
      drm/msm/dpu: get rid of DPU_DSC_HW_REV_1_2
      drm/msm/dpu: get rid of DPU_DSC_OUTPUT_CTRL
      drm/msm/dpu: get rid of DPU_WB_INPUT_CTRL
      drm/msm/dpu: get rid of DPU_SSPP_QOS_8LVL
      drm/msm/dpu: drop unused MDP TOP features
      drm/msm/dpu: drop ununused PINGPONG features
      drm/msm/dpu: drop ununused MIXER features
      drm/msm/dpu: move features out of the DPU_HW_BLK_INFO

 .../drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    |  49 +++-------
 .../drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h   |   2 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h   |   2 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h   |   2 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h    |   7 --
 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |   7 --
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h |   7 --
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h |   4 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |  17 +---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h |  11 +--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |  39 ++------
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |  43 ++-------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h |  29 +-----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h |  19 +---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h |  16 +---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |  38 ++------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |  14 +--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |   5 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h |  16 +---
 .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |   5 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h |   6 --
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |  40 ++------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |  22 +----
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |  46 ++-------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |  43 ++-------
 .../drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    |  49 ++--------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |  43 ++-------
 .../drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h   |  43 ++-------
 .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   |  48 ++--------
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |   3 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   5 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |   7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  42 +--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     | 102 ++------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         | 105 ++++++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |   4 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c         |  21 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h         |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c     |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c        |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |  14 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c          |  28 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h          |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c     |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c         |  11 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |   8 +-
 52 files changed, 257 insertions(+), 813 deletions(-)
---
base-commit: de63bbeb5af60172f1dd4d45bdc897816753fa69
change-id: 20241213-dpu-drop-features-7603dc3ee189

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


