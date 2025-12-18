Return-Path: <linux-arm-msm+bounces-85709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 600CDCCC4F3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 15:39:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3F2DB3029C14
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 14:38:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3FF2212D7C;
	Thu, 18 Dec 2025 14:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WhFXYpPT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bRQUCJfj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6587236454
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 14:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766068710; cv=none; b=LqMUWYmuqoayhNCk1BGVhfgMNEckiYmOCknZkX3iHcnPocFMy2C8IW+5aDCPOIbMdhxkzLuDmwhYNUtLVmxkWhADMszKA4dpfDsYe2xDgJQfDkh+3ltBAV2JpmiWjV8SD0zv5Dte6DRh1FsUVmd8QSgfQV7m89L5bcV6z7tiVLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766068710; c=relaxed/simple;
	bh=skgYU2ATdXa4HLO1nWx2MKL1Wt4wqHYpnzIFM5Tv+14=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=S90++I1CEAsEMoQpLdggE1fzSK99sDa6JPmMd6GBDhucUt0cJWCljLOaOd6lXq3kkf14T8X175rTl72mF5pHiWDxQ10F5JBjwGTSGFQPVHrhdMFAUNqqCUngCNFwJaKc5I3OxV+rl0zJVCgXDhvvu6v7s/vhtGCFhP1gEHdSj6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WhFXYpPT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bRQUCJfj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI8OG13527628
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 14:38:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=u0iVGQGHwdwFcGy2cbVQCM
	VTGMKGsg7pEu0VkSkasB8=; b=WhFXYpPT3IjJfOPdqq4tDbPI4p8OVCc8W5GFJH
	jlOdLUL+csieuMyLOMJcowv+q3CcZZLYzHIT/8AdbsVjFzLNULjGjdml3YBCYhAV
	F+UswbI5VuA/HSZtRKTB72B6/sEsWOGDuoF7AtLVK766thA6PmB6NHeDgk7hX2sO
	vpOBb7KiSWCF1/JfUenDWqZ6sovhKuVJqf1pVc27z759dEv05Aj8lEAhrLlSbPVG
	LztV6LdCOsb2KCieo6zVjETBzH0PuiSPkr5XbPKEv6JusyJY6KA/ePqPllytN0Mc
	5Ca73ob2c6tuA7QpI4Bj9iaQBNFwJi83IxMmib2q8bQDCJ6g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b43mb2x9e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 14:38:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed7591799eso14497741cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 06:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766068707; x=1766673507; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u0iVGQGHwdwFcGy2cbVQCMVTGMKGsg7pEu0VkSkasB8=;
        b=bRQUCJfjxzFvMOqIgHf2L6aEXgHvZ+PpgcCm5Rd+3csoH+aItSZ/QInhCYz7UFL8gg
         AJs/CwtJ9Z3kbRh31HTLKvt4VUoolCL6Xfa90FE5TTBLei1zB/ot2Qdff6VGA5jxPRJB
         cwEjDnQkoSr6OJ9HKqetVt1upwIaPaHG8xwY1GMEfBEmym7s1sZmBLn8LwwdOoszpu4K
         mSjKud3D7dsNWLfhTdWGwbKk+DuLpie5U7F/rY9qaMCY16SBzotDNmKloAu4COo5T1Ua
         rDJ7zXZIC+TzvPlGFSjjO7ujyUzAx9I8ittH2tg7p5FUiTjQyGP4g3dJNYluwDc3jcdW
         Ywsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766068707; x=1766673507;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u0iVGQGHwdwFcGy2cbVQCMVTGMKGsg7pEu0VkSkasB8=;
        b=A46VYIjYmUmpajkcX0V+MbG3H9pKCVpnIumYSsQfNyFDFrJqT4J3FKcPztRCvE/pDJ
         hKv8aK8AHwH4RIyikRYfWC7ngw6uyKGKo88+3qWX4+3DqMhPpNlvfrx9114/qmt7gO+Q
         GOqaE7eDKWjmgHNIFNQSfQ7h6Gsdaw11kg7JVowr1xMfEUL8G/7JE9+WVBy+Zs8Q9UYj
         lF01/HWcDzyu/wfDtRRttruQzq6nDUvczIGW/Wf8UiEFgsdliU6ZTbTaq511O/SCAvG0
         mVrGUQr3BikNgepD8Az5MB8DuVjQ9RwAS6Zk91fPMeaQcuNhlpFyMS3BsNQ7wyWvwGzN
         VQsg==
X-Gm-Message-State: AOJu0YyKAF9s3RjMC8W5j9sQXTNmoAnGPwWrWv0EVy7i47yHmeZIhHfn
	ODNY1Uk2eqqEgaeJpzdYIlqKaN1tvdVkU+ZhKAmAxvklZJrObL/lwNyZrTOg0gQqxELCcMZ3dJ4
	CYkiUfN9E8vR5PqPYeeGLouVzespkRTdbWwpt5SP/c6vPWnxr3MsDqWB/57JfqoTCZ278
X-Gm-Gg: AY/fxX7FLgYSJJphwz6y9rU103vZ5mE/uiMOfnjeteUc4g93oNOCsaq0QXSOH11BMLI
	1m83HtU0sLMy2/+fZ5BGNweXhWWRgNj+DnZfEy3AEi2MzxSkBP8dWHXotr4sXCcV4+H6rFaigaS
	Mk/KdjuyH/ROtX2/Ve0nT5jhIsMq5wE+neJSRCbDd0TR0ksHVte0rlUpcEUOhY/Wco/ZL0eruuJ
	UG9/2P5eMNFEc+DFqGBGVw2uDhYwrn0U+SBCqce9SDFB2p4RpI9vfyrLZGIee16/IuWvuF0mb+4
	PRIfWdeUMBu90sGvWRt3SWICt4bYm3anFW3ru1qG2Om5+aTK7nF1E2VlL9wl65zrHs/5frWOIcn
	Ae0BUyOd38ezGeO+b65yYo1DCiNaxANPt6x4WAHQNxjYs+O6SpC12mvo4f+rbWL2xWn3vK3L3NJ
	JMWS+cSyxVONITBO45RVgHSy4=
X-Received: by 2002:a05:622a:1650:b0:4f1:c66a:f36d with SMTP id d75a77b69052e-4f1d059c8cemr280931791cf.42.1766068706881;
        Thu, 18 Dec 2025 06:38:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGMddQCMG9BtpvkMgSK06ak6LcdGd49TxzsRUXmdS7e3Yvtv9k6Fp2kJTz4/n9I4p5vK3azOQ==
X-Received: by 2002:a05:622a:1650:b0:4f1:c66a:f36d with SMTP id d75a77b69052e-4f1d059c8cemr280931281cf.42.1766068706333;
        Thu, 18 Dec 2025 06:38:26 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a132d3c3dsm1160214e87.33.2025.12.18.06.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 06:38:25 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 0/3] drm/msm: drop DPU 3.x support from the MDP5 driver
Date: Thu, 18 Dec 2025 16:38:22 +0200
Message-Id: <20251218-mdp5-drop-dpu3-v2-0-11299f1999d2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN8RRGkC/13MTQ7CIBCG4as0s3Yahpb+rbyH6aICWhJbECzRN
 Nxd7NLNJO8k37ND0N7oAEOxg9fRBGPXHPxUgJyn9a7RqNzAGRes5w0uyglU3jpUbquw6q6S1aq
 uiVWQR87rm3kf4GXMPZvwsv5z+JF+34MiTvRPRUJCNjHqGtXzVrRnG0L53KaHtMtS5gNjSukLG
 v8/o7MAAAA=
X-Change-ID: 20250926-mdp5-drop-dpu3-38bc04d44103
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1198;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=skgYU2ATdXa4HLO1nWx2MKL1Wt4wqHYpnzIFM5Tv+14=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpRBHgi1WjyxtMhrF1cFwCRRGOsBYLWC+6uYzk2
 0WfDDJf68CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaUQR4AAKCRCLPIo+Aiko
 1djnB/9s/IC/n4w+7mYJoqD8XnCWjgi4bh9GChLiphIU7QMq4+1OZClsx7gVpkvw+UOxr9wGkvq
 wo4c7CdG81AZfZ0xFCumgnF5UjKTtj2v8M6yTYfLp9yQrkf+eOz1S4UTXcCCV6ebZ1c2BbataOk
 I+lPnouEYTT9eAU+ctbrb+e7viSnUWlJKl++/VLaICaEwjgSFQj1ofvZHsA/NcQ8P36cVb457WL
 Ge27UfahbyLoctQYXAsRu75tEBM3I4/TL1Ajs6/qVCz8FWiEoCUfuXKgF4UBIyMRQoN1eZwCo3Y
 en8BQcGNpVmkb9Y6P80d8cV4zoqoqGBF8mNZFH3t9n1tapbx
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: PG_CEzN3KMr0-DdlZoBFoR9p_zb4Xd7Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDEyMSBTYWx0ZWRfX2F8LQbGwSxnD
 9rLqCrlrsXIihqxGRPjWpRfg9ZShPwVoASwgWWHqv31JyYw6jNgCjLpOHrzqwL5ywu//U5WQotF
 QSqad++TirqYRmqqB6+5Eu4TustoEhqLZC0HyOK+/etvfmslXZ6mdxVzAkk3sRgSk+3ZEtu+gWz
 RLm2fVp8MOSJdl0a/nA/teMvCkIU5xkfX2zCYvEPmXfgdpBrlOEeDu9YNcghXGz+WepOo1ppj/C
 XC7HAhrRLjh9Vh2TmD2C1Be3NJhYXTXjK14+IYJ18K76x3TbdT4JnxoN1wtPGXZA2YT59ldDVic
 egrvT9Z7UEM9ft2odQ6RPRpf1PbpK3szZUrE0IjCl++6KhCz+KW73kEgcp4yG/nHfw2ypKtBbtX
 exnRzuAGdeg644HccQeLzS8YwQukbw==
X-Authority-Analysis: v=2.4 cv=NPHYOk6g c=1 sm=1 tr=0 ts=694411e3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=YAzajJBEG-g-3Vxjg9QA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: PG_CEzN3KMr0-DdlZoBFoR9p_zb4Xd7Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180121

Fix commands pannels support on DPU 3.x platforms and drop support for
those platforms (MSM8998, SDM660 / SDM636, SDM630) from the MDP5 driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Fixed CTL_START interrupt handling on DPU 3.x
- Link to v1: https://lore.kernel.org/r/20251211-mdp5-drop-dpu3-v1-1-0a0186d92757@oss.qualcomm.com

---
Dmitry Baryshkov (3):
      drm/msm/dpu: drop intr_start from DPU 3.x catalog files
      drm/msm/dpu: fix CMD panels on DPU 1.x - 3.x
      drm/msm/mdp5: drop support for MSM8998, SDM630 and SDM660

 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |   5 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h |   5 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h |   5 -
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |   3 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c           | 314 ---------------------
 drivers/gpu/drm/msm/msm_drv.c                      |  16 +-
 6 files changed, 15 insertions(+), 333 deletions(-)
---
base-commit: f2d03d96ebe8f6948cea9a47d11728f42d62d0f9
change-id: 20250926-mdp5-drop-dpu3-38bc04d44103

Best regards,
-- 
With best wishes
Dmitry


