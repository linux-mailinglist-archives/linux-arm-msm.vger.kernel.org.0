Return-Path: <linux-arm-msm+bounces-81079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A19C482C2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 18:03:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C55474F779F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 16:47:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F21EE32D42A;
	Mon, 10 Nov 2025 16:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SyeuIyz6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Li051QzG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8909632AABF
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 16:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762792790; cv=none; b=hBXOphbvuZx0LaHKB8fYpUBBsbC8iizyVBZY/OK1enZoXmcTxM0L4fqbz/HIhsYaUIVhtmche/zmIKhhkDPBTh7xchAdj8jQyzzwxW6yVXfA+gXusFfWFwvAJ94iKofFbtjdQ6FTffh7MEoPMgpnUQ5bsFkvKR8vXQd0ij1NUgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762792790; c=relaxed/simple;
	bh=fzcOZoDy4nq3d1scAOabdvRSkEECFucdbBehDf9L/KI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DnYhgerE0/Lq4JgE+7jHfHi8HPeNHj+PO/FfSCbyonPx1cAGIq6AuCz0LlYutr8xk17L1GYjiGErQ0f9xId6hafRp4I6pqgGg/Q7pMh/n5fGsIEt5KbXwzDXP4b/OtY0Pfbl3yf/XnXDhfGk2L1Gx4DoueFkBJqaKJIW9xbE1Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SyeuIyz6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Li051QzG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AAGYMUf4070676
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 16:39:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jVLv/uuU3JLI+2HIhCPmdUPs+Ebzue4D+35QDRwfYvo=; b=SyeuIyz6FatLdy85
	2+R2RrYS/LZQlPTNKhjelJkKMXoqwAE+ll8dntF4uoosoiZYfd0yzzIXRdHNd42h
	H0o1CV0SeN7So+TAQfEufvTlaX2BqQHhdT7MJXAGhXuV/Q76jkXTkQWcWiw0qdIl
	jlhDw0lEANwP02sulVTYTJOkQdTwcp9sHOJlz2Hrg5vEivBArOZhBjAw0eCQRHHV
	svzQ2FQfZENUbur/QwDwRHnhhWcB+5vcteZn+DQm+VsJRTExcuxfk86qvkoV+jLk
	2CcvL48hUC7rwW48X5VRokkli5psjR4iAj0UXdRrQ8WLMuB+apK+TFegXrz6GRlB
	fkrelw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abkpj80qt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 16:39:47 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-340bb1bf12aso7920909a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 08:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762792787; x=1763397587; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jVLv/uuU3JLI+2HIhCPmdUPs+Ebzue4D+35QDRwfYvo=;
        b=Li051QzGPaML7WGlHCrhjo+LGFD9xLmNZEyQ8VRJ/5sDPaoBUs/fMBWX9Gk1HV0dOV
         4DQjXQ0wU06E5/dzCmN6DhMysvNEDiHRwjneqkYjLRu9eNeHp3Ny1fQgKx4X6+q+3bPM
         RQcq4qe7xPxf/YYQAkPDK6sPM7ZOH/Zi9uKm0S87aeZDMtnCTPMC9kWzo1Kd/Gf0B+mc
         DqjSJNSQ9qAJRGL1NHI35W7A0HTc72X7loP1xKCsoT50Okw6vurNYLTJy1bj+NFzGs/S
         0/zyOgDaQ/miYsrgxf9qof4dyNva6RxPT+1i8KBfu7dQK54cv1q4yrRvI9JfHxbd36lS
         Hbqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762792787; x=1763397587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jVLv/uuU3JLI+2HIhCPmdUPs+Ebzue4D+35QDRwfYvo=;
        b=ppzMLAk+TQSY2eH1z2KZIz2k7KpIODuJDrnzUGmBYHN9eW1vUzXHeKxauFRYHAzY6z
         Bu40YUDOUQeuRRess7BAOrzp4x7LqLIEyu9S1Nr5TRvlA+TIgvSGQ+UY95TBzOZK0P42
         8l9QYIWByHpRzs6Ac5Hf3Geedwi+36XKsONUUPOHf2AIJ+jAZUZ4ub2WGnS1rHU8BJ4y
         fwCBqBx7k+Pz862TFNGakQaT3N88HxMCTJrvCrV86EgedKK0Zja0f+jftThsuOwmtyTG
         eObCGSoPSofhx4z1C9ko7nw8XeGBU+Y2rsRsfI4/WvJCanrbWW+eKIN48JCjaQgfzobf
         6q3A==
X-Gm-Message-State: AOJu0YyMqduIqnjz8qjhKJp2OAIgxxFn2h6qWDDEfwFEnfrfGo3FCA/V
	zBmuIwkmwWHORUU5VqRAJGuOIABsaH4nsaVsrLhLuKiXhV1YjuC1nQ3ij7zpCmTzKPuJ37ZKR0G
	mrIJsO60KeIt9FdETv4SyoO0nJqO+Dz3nM+zhUHYyWWYHY/c7SeHOGsSbO4xDtbMGnEns
X-Gm-Gg: ASbGncsZuq1BmS+M286a89dgS+ejrMwn6Ngw9Ez8ycLDUZx6/fPYtQe32m5OiYuDgs4
	Fy86ybpYOgEkBGTWQUWn2Qeq0AruZoAaxC94VvQ0zq3t+nVWIrahDdr1RLEC70q3iuG4kzMBZe6
	xB+TPBDTcb0R7657aDVnYG/H4V++giD2sCHV9cmqqINDlyUe5qRF/WlxZyRsRvXd5zysBdfF8VA
	XenKxA7VBXxi+nHUdWbvFGolUmR7NOIPq2gRcBBTCdChI0TuX2TCvc3CpLouz9zcsn5KcGFWULc
	xP6/EXCh1lCRX+m9j9Vq9btcm3ltfYzCLZc+Ih8l4YZcaMBzH3SxMbAP7z4/hIdVAVhj2AVvFll
	em6ZURj8PYXJlN4U7vNH0slQ=
X-Received: by 2002:a17:90b:4a4d:b0:340:dd2c:a3d9 with SMTP id 98e67ed59e1d1-3436cb29cafmr13753916a91.12.1762792786336;
        Mon, 10 Nov 2025 08:39:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEIvIbTFe8vuD1Bz6N5pB1xeotjvWHsTfTNEQm7fcGL0bvPFEvHnVFmeK5opyNFF8Eu0di/Wg==
X-Received: by 2002:a17:90b:4a4d:b0:340:dd2c:a3d9 with SMTP id 98e67ed59e1d1-3436cb29cafmr13753847a91.12.1762792785680;
        Mon, 10 Nov 2025 08:39:45 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3434c337b20sm11468922a91.13.2025.11.10.08.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 08:39:45 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 22:07:18 +0530
Subject: [PATCH v2 12/21] drm/msm/a6xx: Share dependency vote table with
 GMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-kaana-gpu-support-v2-12-bef18acd5e94@oss.qualcomm.com>
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762792679; l=6454;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=fzcOZoDy4nq3d1scAOabdvRSkEECFucdbBehDf9L/KI=;
 b=VcSuVp5pUILjkNbbAkvSmqBrk4aayo/fsTUBVzwaNTz3CHX2AlKGXQ5LaBwdFwJi1nzrR73j/
 q9575BU+fqzCv6CY6sZocpNExlHPL3t9jvx/n4wB/kI2MbotaH6lCK9
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: fyj9rdOlArXEcOFJu-aAE65k-7yWV-th
X-Authority-Analysis: v=2.4 cv=GZoaXAXL c=1 sm=1 tr=0 ts=69121553 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=jvJuTtenM57zLa_9FEIA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: fyj9rdOlArXEcOFJu-aAE65k-7yWV-th
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDEzOSBTYWx0ZWRfX/Ccu2BCu1v6/
 XJjH3xG+iHK2xNbGqXJjMI16Mxp3Apz26hRrDpR7cvlxTPTcqcLaWFW2LYh2pHR1lo8ilS70+Gy
 4WkY1Po1Zi0wLnm/HUAEhG4n6oJ7I/LWFdtuo9gxVzIAPAizPebrj0ZJoO6kHK5hK3FrGLs9Qkk
 m0WHafeXUrWp7BOIXMJNI0r+T3fqODVzDMOAys7BfmOBDSCTS/hR1HrmsTfIOHqDx6y4HARnhTX
 DEHfXrVAnxIN9KjZ20wHKWv3BHBhFMwSeIVxFjq9e7hBrGDbtg7s4LF6M1cNGR3OhAG5Cxntyva
 s21f8fRItFLaYfJjMOvKAIT0zWp88Y1rXXzL2lDlGrhufMVAznpQ/buDPGyMxdOAGo8UTpf5Clz
 xG3rWeLEawnp5HQ2fC9E0/enWgodCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_06,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100139

A8x GMU firmwares expect a separate vote table which describes the
relationship between the Gx rail and MxA rail (and possibly Cx rail).
Create this new vote table and implement the new HFI message which
allows passing vote tables to send this data to GMU.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 54 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 53 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_hfi.h | 17 +++++++++++
 4 files changed, 125 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 8597d7adf2f7..396da035cbe8 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1591,6 +1591,57 @@ static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
 	return 0;
 }
 
+static int a6xx_gmu_rpmh_dep_votes_init(struct device *dev, u32 *votes,
+		unsigned long *freqs, int freqs_count)
+{
+	const u16 *mx;
+	size_t count;
+
+	mx = cmd_db_read_aux_data("mx.lvl", &count);
+	if (IS_ERR(mx))
+		return PTR_ERR(mx);
+	/*
+	 * The data comes back as an array of unsigned shorts so adjust the
+	 * count accordingly
+	 */
+	count >>= 1;
+	if (!count)
+		return -EINVAL;
+
+	/* Fix the vote for zero frequency */
+	votes[0] = 0xffffffff;
+
+	/* Construct a vote for rest of the corners */
+	for (int i = 1; i < freqs_count; i++) {
+		u8 j, index = 0;
+		unsigned int level = a6xx_gmu_get_arc_level(dev, freqs[i]);
+
+		/* Get the primary index that matches the arc level */
+		for (j = 0; j < count; j++) {
+			if (mx[j] >= level) {
+				index = j;
+				break;
+			}
+		}
+
+		if (j == count) {
+			DRM_DEV_ERROR(dev,
+				      "Mx Level %u not found in the RPMh list\n",
+				      level);
+			DRM_DEV_ERROR(dev, "Available levels:\n");
+			for (j = 0; j < count; j++)
+				DRM_DEV_ERROR(dev, "  %u\n", mx[j]);
+
+			return -EINVAL;
+		}
+
+		/* Construct the vote */
+		votes[i] = (0x3fff << 14) | (index << 8) | (0xff);
+	}
+
+	return 0;
+}
+
 /*
  * The GMU votes with the RPMh for itself and on behalf of the GPU but we need
  * to construct the list of votes on the CPU and send it over. Query the RPMh
@@ -1624,6 +1675,9 @@ static int a6xx_gmu_rpmh_votes_init(struct a6xx_gmu *gmu)
 	ret |= a6xx_gmu_rpmh_arc_votes_init(gmu->dev, gmu->cx_arc_votes,
 		gmu->gmu_freqs, gmu->nr_gmu_freqs, "cx.lvl", "mx.lvl");
 
+	ret |= a6xx_gmu_rpmh_dep_votes_init(gmu->dev, gmu->dep_arc_votes,
+		gmu->gpu_freqs, gmu->nr_gpu_freqs);
+
 	/* Build the interconnect votes */
 	if (info->bcms && gmu->nr_gpu_bws > 1)
 		ret |= a6xx_gmu_rpmh_bw_votes_init(adreno_gpu, info, gmu);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index edf6c282cd76..2af074c8e8cf 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -97,6 +97,7 @@ struct a6xx_gmu {
 	int nr_gpu_freqs;
 	unsigned long gpu_freqs[GMU_MAX_GX_FREQS];
 	u32 gx_arc_votes[GMU_MAX_GX_FREQS];
+	u32 dep_arc_votes[GMU_MAX_GX_FREQS];
 	struct a6xx_hfi_acd_table acd_table;
 
 	int nr_gpu_bws;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
index 550de6ad68ef..64618fd69305 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
@@ -23,6 +23,7 @@ static const char * const a6xx_hfi_msg_id[] = {
 	HFI_MSG_ID(HFI_H2F_MSG_START),
 	HFI_MSG_ID(HFI_H2F_FEATURE_CTRL),
 	HFI_MSG_ID(HFI_H2F_MSG_CORE_FW_START),
+	HFI_MSG_ID(HFI_H2F_MSG_TABLE),
 	HFI_MSG_ID(HFI_H2F_MSG_GX_BW_PERF_VOTE),
 	HFI_MSG_ID(HFI_H2F_MSG_PREPARE_SLUMBER),
 };
@@ -255,11 +256,63 @@ static int a6xx_hfi_send_perf_table_v1(struct a6xx_gmu *gmu)
 		NULL, 0);
 }
 
+static int a8xx_hfi_send_perf_table(struct a6xx_gmu *gmu)
+{
+	unsigned int num_gx_votes = 3, num_cx_votes = 2;
+	struct a6xx_hfi_table_entry *entry;
+	struct a6xx_hfi_table *tbl;
+	int ret, i;
+	u32 size;
+
+	size = sizeof(*tbl) +  (2 * sizeof(tbl->entry[0])) +
+		(gmu->nr_gpu_freqs * num_gx_votes * sizeof(gmu->gx_arc_votes[0])) +
+		(gmu->nr_gmu_freqs * num_cx_votes * sizeof(gmu->cx_arc_votes[0]));
+	tbl = devm_kzalloc(gmu->dev, size, GFP_KERNEL);
+	tbl->type = HFI_TABLE_GPU_PERF;
+
+	/* First fill GX votes */
+	entry = &tbl->entry[0];
+	entry->count = gmu->nr_gpu_freqs;
+	entry->stride = num_gx_votes;
+
+	for (i = 0; i < gmu->nr_gpu_freqs; i++) {
+		unsigned int base = i * entry->stride;
+
+		entry->data[base+0] = gmu->gx_arc_votes[i];
+		entry->data[base+1] = gmu->dep_arc_votes[i];
+		entry->data[base+2] = gmu->gpu_freqs[i] / 1000;
+	}
+
+	/* Then fill CX votes */
+	entry = (struct a6xx_hfi_table_entry *)
+		&tbl->entry[0].data[gmu->nr_gpu_freqs * num_gx_votes];
+
+	entry->count = gmu->nr_gmu_freqs;
+	entry->stride = num_cx_votes;
+
+	for (i = 0; i < gmu->nr_gmu_freqs; i++) {
+		unsigned int base = i * entry->stride;
+
+		entry->data[base] = gmu->cx_arc_votes[i];
+		entry->data[base+1] = gmu->gmu_freqs[i] / 1000;
+	}
+
+	ret = a6xx_hfi_send_msg(gmu, HFI_H2F_MSG_TABLE, tbl, size, NULL, 0);
+
+	devm_kfree(gmu->dev, tbl);
+	return ret;
+}
+
 static int a6xx_hfi_send_perf_table(struct a6xx_gmu *gmu)
 {
+	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
+	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	struct a6xx_hfi_msg_perf_table msg = { 0 };
 	int i;
 
+	if (adreno_is_a8xx(adreno_gpu))
+		return a8xx_hfi_send_perf_table(gmu);
+
 	msg.num_gpu_levels = gmu->nr_gpu_freqs;
 	msg.num_gmu_levels = gmu->nr_gmu_freqs;
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
index 653ef720e2da..e12866110cb8 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
@@ -185,6 +185,23 @@ struct a6xx_hfi_msg_core_fw_start {
 	u32 handle;
 };
 
+#define HFI_H2F_MSG_TABLE 15
+
+struct a6xx_hfi_table_entry {
+	u32 count;
+	u32 stride;
+	u32 data[];
+};
+
+struct a6xx_hfi_table {
+	u32 header;
+	u32 version;
+#define HFI_TABLE_BW_VOTE 0
+#define HFI_TABLE_GPU_PERF 1
+	u32 type;
+	struct a6xx_hfi_table_entry entry[];
+};
+
 #define HFI_H2F_MSG_GX_BW_PERF_VOTE 30
 
 struct a6xx_hfi_gx_bw_perf_vote_cmd {

-- 
2.51.0


