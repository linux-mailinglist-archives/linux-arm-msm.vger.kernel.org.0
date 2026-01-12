Return-Path: <linux-arm-msm+bounces-88437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 14893D10768
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 04:23:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8475930019C0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 03:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36DAB30BB94;
	Mon, 12 Jan 2026 03:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iVgeNOUY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gu++SDZW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DB523BCEE
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 03:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768188219; cv=none; b=i39/XZ4l6+QbcMd6Lxwn9K6GTgwpf5NSI9YZgd0NJ7e66dlR8okhPZtlArv35aUjYf2IcyNazODStQvWcjpoI2zF65Dt9/+scVFiYeNayZcS2xuMqtIOazDcPu0yg0lvBJ3SXOPOS4mul1kH+DbYJ1PQqVWfTiQC2Et+LMS+Eh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768188219; c=relaxed/simple;
	bh=LnjsvQIGn3pV+5KoQI6hjfodUrVTxgJONSSaUaHJE+Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=R2sOw6NSKVGxZqTxZ6BcbkySN/+SqcpHlgyCQ0yuuTCVxUSHMGl66ST304+DvNyVfnQ7P8tDhvQOQvinro4xlFaKonjC+BQYu2yIyYyR0yZ3oKsaHmTJ2egVjHANcIHkdfB6az+k3DNGlgK3bevWxmV/baUlubGjYBmWK1QCHJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iVgeNOUY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gu++SDZW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BNCWvt3057612
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 03:23:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FiU9XwWxRLhdkdf0yIUxMW
	bT3ae0qEV7s4TgZM+KArU=; b=iVgeNOUYCb3Lfh7hXkr8cvaHzNcIPoLmF5LkP7
	Kc8DRv+3gGVqQl4sN9Hu7teXjIgcnOOiIWcnr6FLzv4I/4C+NCMfvES5AAvcEySk
	DNExbajXqqGOj/NEpWkKM9nKJske9M/i4XL11pMqJY4HS2ih5OQYBa2Mg633yuhm
	EkxlvAVk4f8IcBEqvB8dsNLXu2yuskPzhzAgi0aBnjMJ62w7mpsue5rIvKLmeBvx
	LTNkYEFViWfxdUoT2C39nWeHKaHWMbEl8SDQJaqxZdWvnI7jzoGPjWFBUPcbZ2hY
	K9/tOUN5tNxeih0TjCqBJi6BE+RCGAJrsSL+3wMR+jTWC0VQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmkk40j5h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 03:23:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c1cffa1f2dso1368363885a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 19:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768188216; x=1768793016; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FiU9XwWxRLhdkdf0yIUxMWbT3ae0qEV7s4TgZM+KArU=;
        b=Gu++SDZWLdjHibYIoUvwxTVTSErsV8p5Ueje1WLN7JwJx2oBQ/lxfw4sCftgA7FVLY
         ONSI60NZycHbk9TOiZmGSiRUbK5xvPggqaZOOu+0/VxDDpSVMpv+JUIwFJiHlupPAEiL
         gE7/ERTJHkryy0OO+zyJjWrkxoGRpuk0ZQ39ifVvQM4TyAijODN8KeSDDYoERXwHrFDz
         c1LcaKXQfLoOV6HT7vqU6353S6PyUrFTo35SHsxiIrq+Y32OJ/J8aslXNrvN1lXfh0/3
         KOOOe/jUXrE6EmUzrEkqTkDsUOOh09Y1s6x0agUDu+Trj/3Rlttmdd26kb7V9T3bLugU
         8Esg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768188216; x=1768793016;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FiU9XwWxRLhdkdf0yIUxMWbT3ae0qEV7s4TgZM+KArU=;
        b=isyU/xwV4NmdgBHTRtaw+d5p3JfEhBqFSvxKJGBts+uyY+DIGJzF9E52+UnclD4k0Q
         V7ubUWyao9eeN3CuMwwI0YM1b2vMeyZtZFj+pZqcS5A064F3O6TscT8sQ0sRNiTCfelF
         uc4vElhj8ETJREFTW1Y7P3sXdIwSAWMMCOVHnvUQzALVOimmGjykfE6LFnsJqpS7m5qW
         SVtFSsI8JiVZTeT4oK0JtQ4/cAcPHIrw0XhFCBuYqXuPTIEqtechxuXmt3fOtAUl8dj4
         lVnrlzN3UVPWWKoz+CRAcpDFQx87IW2ZoygdId8KxJ1Xe/3U503llBWQs28B3Nj42Ari
         SZVQ==
X-Gm-Message-State: AOJu0YyHVzzpkgM376fe1GlcKml39j3fYWs0O2ZQwwTIEDtPYYb+/UeZ
	BcJA+gBc1Ta53iOkte9sMpXS/MxnjdOMucTAhPxxmNdAqRaCGx/oNAARQnJn/TiPFB78HMUgq6I
	/PInhDCC2w9xksUXuYfpRwzbFttp5F2YiInGIu9zrhobfsS3w/+Qp1mj5CMANSFVadwAY
X-Gm-Gg: AY/fxX58Pptme4ZaMu+MMHmHO8Gi14fbBRmIiYSktDy8GHl5kqJDK5wyVSEiRtVyXCh
	jIMxJAC/5MZYYp3T1ttDmvOvBj/+OowA6Sfdrf7brMjyndP3Vj8D+JESaHfBz+hVyOCmNN+7QFs
	Pq+mZzeDFtAIhfUWEg6IH5kMYtoKBlUhaylJg8Z6Ze2bCYKQ8WG3DtZC67n9j9ITK/TlFucTf7s
	Y4U3+g6jHgU6onX8ZFRnJ1G/LfXD9iD3Lv3N6aPqXbhYNXUBsKAdwwqRT5U7rpGgSJL78D7z9Gr
	pEShQhLPyRQ7Iuuy4iNi0IayiivYrfaEuK6xTA+Pp8xAUrC6N7Pj8ylRd32oMjG0dAxmLNo4IrV
	TY/J3J4RuqOZGNGamrQktvYSXi5uNLvw5z3J54gXwoqClHIBp5gwh+Sbyq8OWJDtMu2k/Wr80nM
	WrfqSnb/PCjPap5WvQM2H8VWs=
X-Received: by 2002:a05:620a:280b:b0:89d:b1e7:29e5 with SMTP id af79cd13be357-8c37f4c2b9cmr2919243685a.5.1768188216045;
        Sun, 11 Jan 2026 19:23:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF0lAFkmNxCyY5pUMAw7EePAR7rMwAsrFyo9fUkPtaIhfiEmuEj8hq5S8OvM5/UtaSZaIVLlw==
X-Received: by 2002:a05:620a:280b:b0:89d:b1e7:29e5 with SMTP id af79cd13be357-8c37f4c2b9cmr2919242485a.5.1768188215615;
        Sun, 11 Jan 2026 19:23:35 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b7c2dd9e2sm2373045e87.5.2026.01.11.19.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 19:23:33 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 0/2] drm/msm/dpu: use full scale alpha in generic code
Date: Mon, 12 Jan 2026 05:23:29 +0200
Message-Id: <20260112-dpu-rework-alpha-v2-0-d168785911d5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADFpZGkC/32NQQ6CMBBFr0Jm7ZCWUEJceQ/DYoAZaQSKrVQN4
 e5WDuDmJ+8n//0NAnvLAc7ZBp6jDdbNCYpTBt1A843R9omhUIVRtS6xX1b0/HL+jjQuA6GqlEj
 VitG1gTRbPIt9H8prk3iw4en853iI+tf+kUWNCtuyJSpFqBa+uBDyx0pj56YpTwHNvu9fOnLXw
 LcAAAA=
X-Change-ID: 20250814-dpu-rework-alpha-060ff6bf5185
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1128;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=LnjsvQIGn3pV+5KoQI6hjfodUrVTxgJONSSaUaHJE+Q=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2ZKprGlB8eMRI6J/0Wv+nAvOSh75gCDovE2AR0XLWv26
 As27QmdjMYsDIxcDLJiiiw+BS1TYzYlh33YMbUeZhArE8gUBi5OAZhI/DsOhnVcOWvm7Ni06JHY
 4lWmL0o0tnOomwWUfcy7/eS6URjLlrhJq5YdPXQj/7i2w6UgUXGhgkzF0yU73KzfvFpZftL5E8c
 /WY/LW/rCsm4sUxBW8a3Syu2O+iznfcP5/E4mQT+/WK+DAk0WoRNFVis6LM/6VGcexb6jSkzBs+
 Lnld2/ivNcXHM73Xd3/Uuocr67oWdDg9OE6PBrVZtFdzwy+DH7/uzn+i/9E0+k/Gvtr33XuHHPm
 QOfNFnenf7CFhA/k9G53uzq5OCGO8Wpv9k39x21aL1hZJokbelsU5u+QvDdNvVHhmeXF0TmhKoI
 31MTiTIx6O+/lNtw9vepbxOTE6fH7xW22eB3dceiYwJhAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: vTRbSbLjG5F8tTz1mlkfAOZwwOQjtYuI
X-Proofpoint-ORIG-GUID: vTRbSbLjG5F8tTz1mlkfAOZwwOQjtYuI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDAyNiBTYWx0ZWRfX9Nqur87eF96O
 xv+zauisYCGbM22sMWE7SlVc8UceuP/5yKbn1S1w9f5Cxo96jTvdExBZIvCkpYxtFLztAa/xxhu
 5qOK/MrnhVf6+9c6iPu7DrUvPZi74ULRlRt8iNKYhoGHwGIdYwVao5SHBPHdMGwjDohxkfZ32N3
 s+mjmvTvpXk4GoJU4aT/fmkn4E+CeJfaotdpiSdL9TidDgd0OLojGLX2qt8/EJvBIawmO+AGtTW
 UlWCPyZy7PfvQ6OH9XOhe1dl1xmzHnKaipUCot8BFED9jFuUK9Mgrb+hIs6AIX6w/wDej3G2q25
 6WGpS5a6RW9PckhRGkWXrEE4i5B1fqT+CLRsx2DMmri2zjT882nuGUcRHgqiJnPUMeDRwcb8MZC
 elIrzt4eBA4O5BaW/QGp+IPkcX+B39Z5sPWKLx3QO2wiNh7eOwqfaM7+rLWQEY80DJLyq0Cd5ro
 re9F0YD/i+EUIFgSo5g==
X-Authority-Analysis: v=2.4 cv=cs2WUl4i c=1 sm=1 tr=0 ts=69646938 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KRYFDIPkQpTtuCs3C_AA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_09,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120026

Both _dpu_crtc_setup_blend_cfg() and setup_blend_config_alpha()
callbacks embed knowledge about platform's alpha range (8-bit or
10-bit). Make _dpu_crtc_setup_blend_cfg() use full 16-bit values for
alpha and reduce alpha only in DPU-specific callbacks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Changed fg/bg alpha args to use u16.
- Simplified combined alpha calculation by dropping useless bitmasks
  (Konrad)
- Link to v1: https://lore.kernel.org/r/20250814-dpu-rework-alpha-v1-0-b4baa4ffa8fe@oss.qualcomm.com

---
Dmitry Baryshkov (2):
      drm/msm/dpu: simplify bg_alpha selection
      drm/msm/dpu: use full scale alpha in _dpu_crtc_setup_blend_cfg()

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 18 +++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 21 +++++++++++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h |  2 +-
 3 files changed, 21 insertions(+), 20 deletions(-)
---
base-commit: 66691e272e40c91305f1704695e0cb340cd162ff
change-id: 20250814-dpu-rework-alpha-060ff6bf5185

Best regards,
-- 
With best wishes
Dmitry


