Return-Path: <linux-arm-msm+bounces-86922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7261FCE8E05
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 08:18:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ABF443025FA8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 07:18:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 854A82D978B;
	Tue, 30 Dec 2025 07:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V8ePar5P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J7mLe2/l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE7723ABA1
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 07:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767079085; cv=none; b=Ui+2husBYURA836d1T5uFSEOsrKxTUlmWDGIT2KMcDtY41UpGED1z5L4ZG/aKkKzD0FXjAL9d559s0t56Pq99uh8vrOpTqaXyIKaRILwzVVZLSlGfp6vhapJvlzBqX5sIRiprEZBA64yT2pfciPCqWYKgsg4MXkv9q41Iat+jgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767079085; c=relaxed/simple;
	bh=nloIX6bfFgnfKkBDQaQKSK9yrf/yRRaqYF/Oj4r6sFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qFcLW3XtlXl1aZ3qyRTirhuZUiTwPlk9NyhlLR/GZKjjIQKFT8Ox0I8hde4Z7gq4WV+CIIxaGhn5xGFIrxeV/ih0P9csHumZbbcFBBA7n51x3xikbob8c4fSdjSV56pul6rwegT6gFuIQ4UEGuuI24Yqv2iB87UYvY91816svWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V8ePar5P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J7mLe2/l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BU0ieoc2670708
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 07:18:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7IWCWQHb5RZkH9xPpsD5CAr5iVUdZiuMhuEQ/RcAPNY=; b=V8ePar5PZas27O0N
	XepAp/AYHkQaYpj8qJVyocRxKNWb+EsapEwSKeSVwf8KGX6vmK2+C/duGaqbD4h/
	78Hi2IzDJT2YJ6sDNIae5006SZdFGy7UoXUTV+UpHU7OzZNlm0iqKtyys41VswVJ
	zuMjqL9DUHpna0nIsafXXHKM9vqn73uIYkpLwqS/Y/8K/RVZ5v3eJAUaITb7564a
	VzoWIey6iPgoY7vCqvfgk80vSi5AEuqRGjnlY0gs1eIgUYozd9seWWktdqzm96W0
	jKnAkyq63/wT0m9ZTlCAjFj2tHVP9yfA8hHHvP56zWDJxutkMAZ6+ncaPMDeqR1C
	v4bAag==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc4fcrr1e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 07:18:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4eff973c491so242627301cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 23:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767079082; x=1767683882; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7IWCWQHb5RZkH9xPpsD5CAr5iVUdZiuMhuEQ/RcAPNY=;
        b=J7mLe2/la10DQPMV5g+9ow+2VvMM6xEDQaxJ43GCIofsWPOPtQEm4Ggkk1L2vXUGN0
         T0oQxzsdQZJ4n+gM93v3HzECTBJiBjEKKSL5buJ5Q6H1QgN9K5zLUwMQgToJCMlqL5U9
         RPXL3SG7dqVn3JMBBPBONPaAqZ1D3BQZ8iQ4SVL6/CtElqz2/sAmnjPakPLzynwkRCER
         F+6/1Kf2qIVx0gKg0L071YIDkROCbV9JV1BuuVSWvrE2Dn6aOW6Gw1kXlKo6NQRwnx0F
         /jQUjHlLDzaKAJN6q0H6+xbua5rpXNLF6SfDOrNIK/BWiIMxe0YO20IQsjaj21F7Id/p
         XwFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767079082; x=1767683882;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7IWCWQHb5RZkH9xPpsD5CAr5iVUdZiuMhuEQ/RcAPNY=;
        b=ll0VnWqZ3ynfYyIVrPMos9gc1qMPLXWem7+/bswaxh3cmayQzKScNpnTxluG2x/zaK
         MEzCNN5cTsvubMNQ4PibcoNwtHv0x3ynWIpi3sCod2aDI7/gN1x9eo/LCQTcNTtpqjbr
         BJHtRjJa8WXGMcsd/WadJ/5dXnk2SlYIjxTX7d7nBfoX2M+kJ3IGmX8vnL4kcxA1QiEz
         Xfr8Q5aWFOaDZzARuR8Mob2C/3YYiRhsp7yV4nCAmPHHdT8pbhiCF5xDcxIM/gN+Cc1f
         IR7kZSYZE/hwE9HGdGkNR3KXcooTlTXiOFU8G+ltni3dAeLrflxhjp1UUyLDXAW0d0a2
         HzKw==
X-Gm-Message-State: AOJu0YyDGu2UDZjL1G5xRpOxkKMpeQ4NDWyPcaErsEzRYcpZSKs0PlNi
	IIUrQ+lPFU7WsK7yhMw4HmL/Ez2NrXtJt4Z53EQURIQwN6A0dMe27Aj4V7n5QhsyKuN13ztihGt
	Z8OUHl9M1/sQpZi+hYPayJ8K36zbdBMEd9SQ0DTf39a8vc++FuaG0bMAFKGSrzrb8HO5h
X-Gm-Gg: AY/fxX4aztIrig8bl7RMBo0gSQ5cXSaQYssXFrNLjMiQcsMwuep7djMIzsrqGOsSLy0
	tPCyWzcPqW60PCn00wmIsyngWZq+ZGcOweFcmJdNAxXDuYKK0H7yI23B3XkJg8GsTmzYjqiCHJZ
	hN5n3mQ90d+7aIQJ0DwkCZ2sGsWtqJcSsROTxUNU/hDrhsJs4YjrErPjl9hhoavNanOQB0bXhyI
	n+n75CNSOo6mf14FnS8RtvQTegKFvOjQ/a4NIJ3qaPLmqBtCpPy8R5PuZaA6HuVQ72Mok9Q8qBb
	PeB7BGreH1sGxMyiU24SRKYA6jXoZD5vwjg8EupmlaoWbN7Y56IagkznpS9Pz2XPJDwRwplhRUx
	GLErMcBqHhSKoJCZspuKqrtfC1eEORd/SSPSxknmsOppGEfy4q4PyfjX5hTv9raAJBKdoo5cGXV
	JJL1pn3s3XEmS8GQWOCH/NqCw=
X-Received: by 2002:ac8:5acf:0:b0:4f1:b1f5:277b with SMTP id d75a77b69052e-4f4abcf1700mr411938091cf.23.1767079081969;
        Mon, 29 Dec 2025 23:18:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG324K85m7yDjEZXYmsG5fS9ySOTai8im//gka+9/vEjIqBTgdbRhgCp3G1/uyWeNikKwr0YA==
X-Received: by 2002:ac8:5acf:0:b0:4f1:b1f5:277b with SMTP id d75a77b69052e-4f4abcf1700mr411937941cf.23.1767079081510;
        Mon, 29 Dec 2025 23:18:01 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185ea2d8sm9924615e87.45.2025.12.29.23.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 23:18:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 09:17:56 +0200
Subject: [PATCH v6 1/2] drm/msm/dpu: Set vsync source irrespective of mdp
 top support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251230-intf-fix-wd-v6-1-98203d150611@oss.qualcomm.com>
References: <20251230-intf-fix-wd-v6-0-98203d150611@oss.qualcomm.com>
In-Reply-To: <20251230-intf-fix-wd-v6-0-98203d150611@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Teguh Sobirin <teguh@sobir.in>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2331;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=s/p//pRO52a+gehzMR/sFVop1oTXxVfxhzjK9LP7fJQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpU3ynsSsMlMuwtytXfGI1rhjTQi+MYEO3VVZBX
 HlRlgx3voGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVN8pwAKCRCLPIo+Aiko
 1ee6CACq3OfuJrvP77XQZe6UwVZrm/81YzJyAC5ty6b8U4ZvOX4WVCvZoCQCkfFSYJipc7NEHeB
 T+IrEw2xOsyFblk+ID3LPSXBsxP0M6CS8I0AoL9/tj+L12IctyNKZKRvVZ9qVM4RGBnBWmQA9er
 oXAS//or68Ynx772Qbso4w10bnJiUGFbBz/bFb4Z+zueUoZ58QLva4F+k2/nFbKY064kq2KZmgV
 3F31T3CQW4kjPkah3zNI7qgJhzE0Vq5kGLaAxLvnQf2WzCghGWQkgcWGHyMEpcATjfKp73RZMqz
 Pdjn72VrfqsKm8Q1MSi7ZeUsZhcs1kJn29z5G6VYaaFpvZ04
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: aQHm0oceVa4toUga9GueBn55NBp24KcJ
X-Proofpoint-ORIG-GUID: aQHm0oceVa4toUga9GueBn55NBp24KcJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDA2NSBTYWx0ZWRfX8oiPb665Dy0c
 j3u5GQVfjYUNPJR7wwo6nt29lNaSaZKCbRMxMBmfymGeYvBI4EHpdbje6jqjz7N/1plkRi7/a2E
 lS64m2fIa/5r0b5HP6poNRCyFG+Qp6KYyy6Ee8QjMUlLsTe3iyFJr2l0DG6QlVTmGJLKUR9VkdT
 M0mg+fxeRMdVKGfKZ1wbOxhVRna2Eot+e5XMTfnDCUysMpOxGS0CXQlwfueVmGTJSs6Pi9+q2Ch
 HhFFwTQaaQmFKVIXeOI5e8jB+e7QRND1O6M1nKPkn+y6kFzAp7iHHeb8w79EVbOW7ksJ+NfLaoq
 EyBBFEhHHLFoUFjM/jEtZAjYNzb96lSd6NJv7EZJg5duw2GecH6BlMxe1K76n6YcK1znR2VfuN/
 p17nhFSp6Bh1BGq5ULWK6NAEMCbTFOSg/tRKS5ZK7Qs6PVYTdceATD8sgEPFL0PvIyTuIGKjN6S
 Uc9bI7/oTtwDrm1nExA==
X-Authority-Analysis: v=2.4 cv=foHRpV4f c=1 sm=1 tr=0 ts=69537caa cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=tVI0ZWmoAAAA:8 a=EUspDBNiAAAA:8 a=JyrEbUn3yN3s6GbRLFEA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=-BPWgnxRz2uhmvdm1NTO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_07,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300065

From: Teguh Sobirin <teguh@sobir.in>

Since DPU 5.x the vsync source TE setup is split between MDP TOP and
INTF blocks. Currently all code to setup vsync_source is only executed
if MDP TOP implements the setup_vsync_source() callback. However on
DPU >= 8.x this callback is not implemented, making DPU driver skip all
vsync setup. Move the INTF part out of this condition, letting DPU
driver to setup TE vsync selection on all new DPU devices.

Signed-off-by: Teguh Sobirin <teguh@sobir.in>
Fixes: 2f69e5458447 ("drm/msm/dpu: skip watchdog timer programming through TOP on >= SM8450")
[DB: restored top->ops.setup_vsync_source call]
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index d1cfe81a3373..3921c15aee98 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -774,6 +774,8 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
 		return;
 	}
 
+	vsync_cfg.vsync_source = disp_info->vsync_source;
+
 	if (hw_mdptop->ops.setup_vsync_source) {
 		for (i = 0; i < dpu_enc->num_phys_encs; i++)
 			vsync_cfg.ppnumber[i] = dpu_enc->hw_pp[i]->idx;
@@ -781,17 +783,15 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
 		vsync_cfg.pp_count = dpu_enc->num_phys_encs;
 		vsync_cfg.frame_rate = drm_mode_vrefresh(&dpu_enc->base.crtc->state->adjusted_mode);
 
-		vsync_cfg.vsync_source = disp_info->vsync_source;
-
 		hw_mdptop->ops.setup_vsync_source(hw_mdptop, &vsync_cfg);
+	}
 
-		for (i = 0; i < dpu_enc->num_phys_encs; i++) {
-			phys_enc = dpu_enc->phys_encs[i];
+	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
+		phys_enc = dpu_enc->phys_encs[i];
 
-			if (phys_enc->has_intf_te && phys_enc->hw_intf->ops.vsync_sel)
-				phys_enc->hw_intf->ops.vsync_sel(phys_enc->hw_intf,
-						vsync_cfg.vsync_source);
-		}
+		if (phys_enc->has_intf_te && phys_enc->hw_intf->ops.vsync_sel)
+			phys_enc->hw_intf->ops.vsync_sel(phys_enc->hw_intf,
+							 vsync_cfg.vsync_source);
 	}
 }
 

-- 
2.47.3


