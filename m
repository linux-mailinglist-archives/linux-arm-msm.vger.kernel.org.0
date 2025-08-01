Return-Path: <linux-arm-msm+bounces-67424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25375B1870F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 20:01:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD48A54434A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 18:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25D2D28F520;
	Fri,  1 Aug 2025 18:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GmOizVTF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A188F28EBE5
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Aug 2025 18:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754071228; cv=none; b=pGB1Uf3Vr2CAGWwET8njWRXF0Oysq0O4n6gzcCOuGCeQ001vUwR6u8HurtHoK7TlKWh2TzxWEgh9Bqe3Ji3wWnfXb+eC4kxN6K9GgpGlIIyb0Lj2hMMx9kcKEkZumnpdvIuZCh4wN28Z+CnPdOKzt3JquAG1lYJwcCQdlM5kGfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754071228; c=relaxed/simple;
	bh=L/zCN5DqVWoqFJzonuWzb53I2szPlr/4Jcv/Fb8vfd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QH+czqQVm5wv2GXBVuqYSxSqvjSEiM1v3zwaubAs2+yG/oTSaOeKK1MVv/m2MacIHJlfVBqyK+/kAu5xoxtWHqmF0W4uQ32ARK4uRCHwZZ4SejO0PTEiW9zE8t8mFvSHyM4n0iBlJxkwQG9cIzS7i8Cdn6nRv9x8sRudfdJy37I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GmOizVTF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 571HfKse030573
	for <linux-arm-msm@vger.kernel.org>; Fri, 1 Aug 2025 18:00:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3TY7JajUGvg
	SQAFX3ZoHDjZ0l2tg+rnsIJNFhfiXB5I=; b=GmOizVTFpFkXh8LhaF8YLtKApVo
	4TfIABwqGfxA73oKsdDx699Dvb1VgoTq9XgleS0+7GOMI88g7klEjKW8R6oBwWDT
	55jd3WJDZZusaPyam3JgmK3W31YzkcVQgUwk/SIF2moOs3CGyMlLWioiMpWK23EU
	7WveXX9E6ihf+CijRH9+Lm6F4c6ox9piNFH+QY37X5XcVLNjpfRaNGmel4+JLlaO
	pD66DNl5cMAFZCqmWGexPnyG8v4MFfYKuyclH1U1lazq002YjO7neXWwmrCufRN0
	kuAkunvG9fZjnRVa8SR/dxub3UFl9blVg97QGG/eDd4RPFgjKakAesguVVw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484nyudfn3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 18:00:25 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-31edd69d754so1175528a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 11:00:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754071225; x=1754676025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3TY7JajUGvgSQAFX3ZoHDjZ0l2tg+rnsIJNFhfiXB5I=;
        b=D1WEF7UQwm//0uFzai/iMiqh6B7ohmTECigf9ojdwu8UDpq3MiBI3VC4RrzKABnxvn
         NcD+JXjMn1cRhETQ/FTqn3+jsZFvrHgeJda6+klUQxOp0dAhpHVQpzhqj6cQzDPvVM0u
         RXEu2JDOHbhRxcqsAILWPAzhL7D4BD18WACtLuajm0r9lI5zRO3O7ebMJ7z+nIT/DSWS
         VafNQNJ2Jbd8A1NYVs3eeRAxN6MHbTlL8xIfD9TWsnuoX8b33KvuTAgK5zoZ6yY6mCut
         KRTydtojGczCSww0gzwKQ7UStLa5NujrMbwmzGdKAT6EdbTqeAyrSkchiM/x36Q77pIo
         UHOA==
X-Gm-Message-State: AOJu0Yz6vbmL6ocsKfgKvNxqHo5+wdpGy9y4c3iYjzcyh3PLALlt+jUB
	qY1jbF6Ubl+2CANrbLqXjB6FA0p3YjMy0dH4PTX46Dp1CntI/TQFdf8XLXQDI/JkBnucgPmJTVY
	q0n41OJ9+dtXhnvqUbIzrb2ltds253QenJEyodOveSGxveyDwyQAjDDR+3NVmS/7xtSXB
X-Gm-Gg: ASbGncuCmxc8/+DgDp1qll0yWbgBUAqUadFmJQV65D3KkEGqT+5rJpoherlNtZs94jE
	hXcsiir2BXidN1n6gysGZWyQIS9PdoJAn0qQuU9Tjh8Dun+OQBB6RqdXtVyZdsR0Di+kxfp/xm9
	Fr+ue3bz3Pbsp3D0Dg1csJnDjhFM9Mk3cC1sfjxNwNeSZcKEkYP7/GA/Cqa8Jatn9uIatpgaQPA
	EL/DgSM01Gau2E/8MkePwfOIh57HCL7f6PKBzOcbExNdTMR9eERSuuAFLhZS363hV3UtjuAsL08
	t5jhFylUMtq2VMCKSMdmYjK/+zE07ihkp+OzVmFB1PmXvobGoM0=
X-Received: by 2002:a17:90b:2246:b0:320:fe6d:860a with SMTP id 98e67ed59e1d1-3211629d087mr935837a91.18.1754071224692;
        Fri, 01 Aug 2025 11:00:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEX5MtZHVrDtRtNwnDqwNS5CiFJn1C83bZxhXU0qOaY2Ye0o4TdoGfd9YmU32DzzAJKMfk9aQ==
X-Received: by 2002:a17:90b:2246:b0:320:fe6d:860a with SMTP id 98e67ed59e1d1-3211629d087mr935769a91.18.1754071224045;
        Fri, 01 Aug 2025 11:00:24 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31f63c25f0dsm8105815a91.0.2025.08.01.11.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 11:00:23 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 6/7] drm/msm: Fix debugbus snapshot
Date: Fri,  1 Aug 2025 11:00:03 -0700
Message-ID: <20250801180009.345662-7-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250801180009.345662-1-robin.clark@oss.qualcomm.com>
References: <20250801180009.345662-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: TJS62enR6nuJCes95tnKGQxMW2HDZT5u
X-Proofpoint-ORIG-GUID: TJS62enR6nuJCes95tnKGQxMW2HDZT5u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEzOCBTYWx0ZWRfX/29zTgxJ67K+
 fZZwjeJ18fpa7ZzqquID6koJAqmDJhhfqpftm8SdwJSHd49u4xrqCwznmlqFpM/0E5ewnQo6S5m
 8tHir/1ZT/vxaylVey68c2btmRTO+IELQvUlNJsh2vHPIDvDcEFU2WtyG/QuqVXy7Af/RKk6CK2
 csURff/HcIShH6bGE5b27sCFy/oS18FC8k0PIPzzq3nbBX2+2tZuwR8xQfkiqcetOqLv0MgcDFW
 NVp30lHu6ehpByaA0wqDuxqh2q4nHt975kwf4tgfxMASfJfYdfOODz7oIPp3Mt6m9gh4HFVgd1V
 HaMAzU2zfNxLhs6rGd6mmieaeABvGO6zIxGojHcSm8+VXOjF3l6d3c/utytaVZ+IL1ueyIn4q/U
 JVKd7i2OB6TeaUvuZQrjjP4OmZ/WQNXFspoHJ9znk8xpJo0bEqeQK6tQ1S+n2e3AzBXAbEGX
X-Authority-Analysis: v=2.4 cv=CLoqXQrD c=1 sm=1 tr=0 ts=688d00b9 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=Q8ed3UK4sgpFGPsrdooA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_06,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010138

We weren't setting the # of captured debugbus blocks.

Reported-by: Connor Abbott <cwabbott0@gmail.com>
Suggested-by: Connor Abbott <cwabbott0@gmail.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 2c7a52fb0b9b..4c7f3c642f6a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -438,8 +438,9 @@ static void a7xx_get_debugbus_blocks(struct msm_gpu *gpu,
 				a6xx_state, &a7xx_debugbus_blocks[gbif_debugbus_blocks[i]],
 				&a6xx_state->debugbus[i + debugbus_blocks_count]);
 		}
-	}
 
+		a6xx_state->nr_debugbus = total_debugbus_blocks;
+	}
 }
 
 static void a6xx_get_debugbus(struct msm_gpu *gpu,
-- 
2.50.1


