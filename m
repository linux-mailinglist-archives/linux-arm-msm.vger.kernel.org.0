Return-Path: <linux-arm-msm+bounces-89141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D73C0D22D92
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 08:32:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1C5FD30A43A0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 07:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97662331209;
	Thu, 15 Jan 2026 07:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ApFqPLMn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BfTI6N0W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0052832FA22
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 07:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768462155; cv=none; b=ecXSYD0KfhspMlAkCMvbnvvqb79vIBsMc/r/fPMl2zdz85v+V4MS8Gpyro73Z/KNjDfEt4lchujDb5+qi6smtX0n5rHuthNQNjVnIKsFZ1qzVdUirgnwj33oBwv9KpkJ4k1IuC4ZNFKsx94laQtTHD6A8YCC2ICylFThDYy8OZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768462155; c=relaxed/simple;
	bh=m86ld7IhIkQDXjy3Y5weZUVJI4ZHVj+c8sLf5mumz7s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BOEGdUy5+rRP2kBoy74aK8K4Vk1nwL08Cv7GCd6auFwpxgQPa4EyRbfiALtJwL1DZqlBUvxYQYuw4ehlMQUaqh1mjqvFml3RQfWCDwIPbS/EWB+wuTwjEqeb87Ld9D55356xBhH17vJAesI3eg/aViJXO2rSEskbgpGpeWbP1EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ApFqPLMn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BfTI6N0W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6fgbe606221
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 07:29:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=h72bZwdSi+QRO6gwAB/PZa
	NU8NpDQH/mFKJvFIHBoMk=; b=ApFqPLMn4dBPDTyNTmXb9QMxAItLkKkUzkW2yL
	kmM2waxBqeFB5qLZ6Kw2JPDus/IdLKlMTR8m1ycmgr09/Q+tDLt2RHGfPvdPpTw7
	1+JzOp2ZBH2wEn62oLDwiC0I2B1jKQ4MgYwAZu9VBF86zeDMibW2FdUnRyMvggaj
	4lZbMks/DX+GmzHzKhts4eyR4L//CelWddgSut5TscvYUJGn0cMsyx8puh8pTmma
	zlOBOMFogkDTS/kpUgH1nlOPbBuX7Cj84tPefpYIFfz7dO9xyz/e0CKjTmwjf+6Q
	mJvZJ26xt5kpkxZG/2qjSanLS2Xv90TXha9hBJaENL98JxpA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bptna06s4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 07:29:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c52fd4cca2so160765485a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 23:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768462152; x=1769066952; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h72bZwdSi+QRO6gwAB/PZaNU8NpDQH/mFKJvFIHBoMk=;
        b=BfTI6N0WWhG2T841W0/o/MeoqSYGkBV9ziJFEsBiXO28d6b9NFIeFatLHEjI9+A4uX
         7X8FW68gyhuM6QCeE4F7jaJ3pU3X4Uy5n8k6cKjQiV3TDj5aKDOAesjfajDDEZnOX047
         EQQoW2meQADGGgTlUcWBrR8IlWnyHLqCfjv6cHpdU7BvY0VobRbXboRwCbwkukyHqi8b
         eU3/KnC2KIcAZF7cMTt1DDT4AfmarE0/cy5R4ZAVVxlDadp2gjI0ie9nNRPqxi6sDFeq
         2DNCAsSPNx8rBXjxUh+s0rr1Wktu0OyFPA1YlbKCSUEpBw20CsoaKWihj3SQLvkJi4f1
         MTtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768462152; x=1769066952;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h72bZwdSi+QRO6gwAB/PZaNU8NpDQH/mFKJvFIHBoMk=;
        b=kPCKfBijejX7Y3Uwmm42BeJB5qrbR23f7XqP3wp/z5lxWDIMhdLoecpRDF4/wt13z5
         /HltJI/gWPZIf7reQAYGzufjFy8LfaOY+rQBIUxKPqdgQHRsp56N2v+u5ESATvnbyfO8
         AZGU9S6Gb/5okp+Dz7XaHtO20vVI3pnFk57q0Iylkv/ksrJn53w5rbn9q6d14lmKKSGB
         psv0Se0h4Shk//5zV6ntEmKmXyLqgJsGEVVnSIlZck6A0/oXZBzVAFViB3R4Gf7GlpAG
         p5bkbjPoyAn8WuC03lLVWuSTb5HxpxoWE2b6sKfg1PQPIuA5Y6MV+FERVQyyq8KOkLFE
         UCmQ==
X-Gm-Message-State: AOJu0Yx73C3ZSt3HkY3U8ovRtTdLOfRUdVfLY0O2Dvf7AcGxkY+Nr5Rk
	CxLXSAsmurxFdTF9/KxeX7tm7vzj9OLWgiUdzR69UxDfba7aaqhlexl28sjYsR5VUC6Fm3fDHIl
	Sdzra18G9+rjii17w9m1UcqmQG2P1omqTUklCpl7xaQur7patfTqSB1ehvWryRe3IZl4b
X-Gm-Gg: AY/fxX7gcWL5iUedtIoPVzdINkCZGAsaH3BhfIlRPiFw3Rp9mpzqNBLhUPxWs6CeSg2
	0H0XkRka62VI4zzY84fkBtG/U6xQgGeeNxQStiWOxo5TMUZT/pjlOcwzTP3fcs1HGG5KVwItM+a
	mxoLuDkuAk2AWvsSOJdJ8wPVNjGWb93LTaxhi/7jCPh3L1ME05orQh8njAiZKBkAhQwkAkC/aMI
	loLua8BZ1GHIRWt4GvF53DmAP8XkoaWIBnVD4fvLN8RvcxWZJTAh58GLdhxFc+K64WzyLAQ2/GK
	iVYJfxV0Wd/K5mjm7IiThIxw+/Ep0OTXXJUViPlR8aM2OgjyVqLu+eWwdjmrNbX3Ahq+ochtRug
	zljtoHeA4VlJJur+GK9YtiCc0LvzodR2KrKByRUF29kxtj6nXVGbuksRXnZLZAXrX/b2PgqxIjQ
	zMWuJ91CM+WJSxX3J7PY8dj3k=
X-Received: by 2002:a05:620a:2808:b0:8b2:6bdf:3d15 with SMTP id af79cd13be357-8c52fb236dcmr733253385a.8.1768462152301;
        Wed, 14 Jan 2026 23:29:12 -0800 (PST)
X-Received: by 2002:a05:620a:2808:b0:8b2:6bdf:3d15 with SMTP id af79cd13be357-8c52fb236dcmr733251685a.8.1768462151808;
        Wed, 14 Jan 2026 23:29:11 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb7b1a4dsm58078801fa.17.2026.01.14.23.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 23:29:09 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 0/8] drm/msm/dp: Drop the HPD state machine
Date: Thu, 15 Jan 2026 09:29:05 +0200
Message-Id: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEGXaGkC/23MwQ7CIAwG4FdZOMsCBWTx5HsYD4x1jsS5CUo0y
 97dbh6MxkuTv3/7TSxhDJjYrphYxBxSGC4U1KZgvnOXE/LQUGYgwAgDindjwyO2zt+GyK1GMLU
 xWxCO0ctITXis3OFIuQuJzp6rnuWyfUNWym8oSy64Ur52vgLVKr0fUiqvd3f2Q9+XNNjiZfgYl
 ah+DCDDtholWi2dU3+MeZ5fq8r3g/MAAAA=
X-Change-ID: 20250523-hpd-refactor-74e25b55620a
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2608;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=m86ld7IhIkQDXjy3Y5weZUVJI4ZHVj+c8sLf5mumz7s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpaJdCjtkDFa+i+6psenegKh3OkYiHeRBG1uY8b
 PGr671WMd2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWiXQgAKCRCLPIo+Aiko
 1VQLB/95pAha7y+54mAYSqmZqac8WgGav2PRQ47+7Zke6AgWGNysjTJVTTjqoBnn66z8mDHpyJ8
 Y+iPRFFzDJKxHcn3zEeU10ufB+ompE3/bJwIs0i6V30hoQUaR+BfJMkHWGdPwlinMfQZkMkinwA
 efV1tdiHaXjpT1iPPPTfwPZloBosQtNMYEogflSKtLPS/x8LZqdEKpVrhRiExI+OQb8R8+4B3pO
 HTPsIeIsMUU2OtGYHdSG0k9L8JNAO0mKHnCFGYgrZzIGNotfwSQzTL3LAAUMEhV7NLzwy1gR/qb
 3UQugs9NDQ45L6Q7U7EzqccbSuxoMzLK3ocCuhyOVRqyn6fB
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: xyyGbiKxOUzpGNrOey0pXXd6EehVpmBu
X-Proofpoint-ORIG-GUID: xyyGbiKxOUzpGNrOey0pXXd6EehVpmBu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA0OSBTYWx0ZWRfX1/TQS0KCLWdz
 tP/Tt1Mg5y0F26tf3Re+RhZbR0WMNkk7d/gZ4xC+/12hie9/vGTlobscSEVJzF2RYJmo2pED+4X
 Mp6I/u0Mk6rnTaEqhaSG+ENE0wOzkVElewMROG6kIxYfJSGiV7W3iKUVRrCoFS+mUljt+OqMfci
 ag7WrWGO2yDC4Om1yoiOC+I1d95Ue6qaNTDQ/RD2YPvlQdr/E/MPWwHRxyBeK6NFuzK7o7VEAT0
 CbYiK5xio0Ne3X8EuBvqH9XRRfDv/d1dpEvDpEc5YysKGGzP27TKkTYyVJXUsoJVCcaJ+pzP7Ww
 nCaebbGfu/68miOZ1DKJViITAHZoF7QTXgHuBoY151RmbnsR7ie04MNPD2G2uevBfjpHYLRM9Kh
 kNbokD964wv/2snsXVf5LFfPRljqgdrysK1D4eDofIaimqJd1qNrJco9xA7xT2KMGPnU8Jc5LWM
 inzDsZdZ2EeTmr9NzJw==
X-Authority-Analysis: v=2.4 cv=fsHRpV4f c=1 sm=1 tr=0 ts=69689748 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Q-giyGzHwlFVuBBPpRIA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150049

Currently, all HPD interrupt handling must go through the HPD state
machine.

This has caused many issues where the DRM framework assumes that DP is
in one state while the state machine is stuck in another state.

As discussed here [1], this series:

- Removes the state machine
- Moves link training to atomic_enable()
- Changes the detect() behavior to return true if a display is physically
  plugged in (as opposed to if the DP link is ready).
- Remove event queue and move internal HPD handling to hpd_notify()

I'm not completely satisfied with the PM runtime handling, I might want
to review it at the next iterations or with the another series.

Note: eDP is mostly untested.

[1] https://patchwork.freedesktop.org/patch/656312/?series=142010&rev=2#comment_1201738

---
Changes in v3:
- Take over the series (thanks, Jessica, for the previous work!)
- Major rework of the series, squashed the set of patches touching the
  HPD states and handling, it is easier to do it this way rather than
  pulling the strings one by one.
- Link to v2: https://lore.kernel.org/r/20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com

Changes in v2:
- Dropped event queue (Dmitry)
- Moved internal HPD handling to use hpd_notify() (Dmitry)
- Reworked bridge detect() to read DPCP and sink count (Dmitry)
- Moved setting of link_trained to plug/unplugged handling
- Dropped msm_dp::connected (Dmitry)
- Squashed all hpd state related patches (Dmitry)
- Link to v1: https://lore.kernel.org/r/20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com

---
Dmitry Baryshkov (1):
      drm/msm/dp: drop event data

Jessica Zhang (7):
      drm/msm/dp: fix HPD state status bit shift value
      drm/msm/dp: Fix the ISR_* enum values
      drm/msm/dp: Read DPCD and sink count in bridge detect()
      drm/msm/dp: Move link training to atomic_enable()
      drm/msm/dp: Drop EV_USER_NOTIFICATION
      drm/msm/dp: rework HPD handling
      drm/msm/dp: Add sink_count and link_ready to debug logs

 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  22 --
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |   1 -
 drivers/gpu/drm/msm/dp/dp_display.c | 673 +++++++++++-------------------------
 drivers/gpu/drm/msm/dp/dp_display.h |   2 +-
 drivers/gpu/drm/msm/dp/dp_drm.c     |  22 +-
 drivers/gpu/drm/msm/dp/dp_drm.h     |   2 +
 drivers/gpu/drm/msm/dp/dp_reg.h     |   4 +-
 7 files changed, 208 insertions(+), 518 deletions(-)
---
base-commit: b775e489bec70895b7ef6b66927886bbac79598f
change-id: 20250523-hpd-refactor-74e25b55620a

Best regards,
-- 
With best wishes
Dmitry


