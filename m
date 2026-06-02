Return-Path: <linux-arm-msm+bounces-110775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHVkAp+gHmobGwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 11:21:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7440162B57E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 11:21:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7588B3126D1B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 09:13:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB8553CB916;
	Tue,  2 Jun 2026 09:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bPWi6W7B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YmykLzm0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7163CB8FD
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 09:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780391484; cv=none; b=YSE++aGiUlSx28tHWcshVGW6vZbimM/zqz8ahQvrhN0StGYfwFq6dOje/xVDQEXdtWbfTENA9gVNiwBtKjntv2Vwe/63tulUUADv9mJZgwXdHFnJGBbHmPE8p49t/bnhx7E+jYtslt+0I0iuX0Na7+XvWhOKg+usOpVv4O+N5HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780391484; c=relaxed/simple;
	bh=MvPTm+UIjOY/okBZfSTmYHFCIp4/Opc3YSafdUHz3a4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gH8+4V3bAobbtE6dyQWQi9OAlJTXyuGLbeaUmI8MNZ0vN/+2jZ22oanTSS/LNHyPV1aPPib9jRx+YpUh6ulmFIOrn8M1qq8oR+O9qpOUm2ZegjmMf/w723ggvofDH9kAjkym35yQd4Mwabwd9G2oPrBUjesJnVjEA2mDlKK0qDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bPWi6W7B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YmykLzm0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6528RCDb3430076
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 09:11:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=awHtfwv62FDYoJPHVP74JH
	igRujnG/cfDkq7vi9nyXA=; b=bPWi6W7Bcm9gqlft8aFY0OLMxyXLSp70l4Fm7d
	74G39AIzU7tRJezbt8TTn2PiH/89mxXnIZrwrgCEY7+mIuDqrF+t7d38Uxgd5Kdb
	c2T03WfXIMaBspyGwYyrJkCZPqyyCEdYXVljsdhXg8MwxF7GwlXOzF2yXIUGgpaM
	ntveG5ZLF8qRfbKJfLAANdCCkRtZu/HsKtD4WyMIhGmUMTqtH5xR9HrqIcKOpCwR
	n+vOv+IqP6TV8ymLOf/zHEkHQdYmmPDalryZ1GchGjGMqtyPlHQEnFft4uQTDdyw
	3+AIvlCbmN2JQj9SgoDzQyqiMlXqanEfq50qUzo7u/A0/w0g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehn8mhq10-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 09:11:22 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5175bb9d47fso33388771cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 02:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780391481; x=1780996281; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=awHtfwv62FDYoJPHVP74JHigRujnG/cfDkq7vi9nyXA=;
        b=YmykLzm0m5H3nWSCJMsEKLX+mSxMuGZBjlJn5DVNHkOEEtWxEY1z5DoLcrojwJObc0
         XcuwsmkMR+8d5ssVtRNDIfYF/NpUpmw9dnLwzoZKyBfQVWmZePq9T1Rx+uR5lhuWneNg
         4MswI2di40OZdU/GFsp3u/Dxoomw91O5yF/e5TZmX0NIgP4CdDNxZNaynpMohoS0d+Ow
         p9sKc7xeGkURSdtWfBAbKcGqDESmuFa5DmfuOz2PkmNGa0A/vV++h2C43Pd+Nlgg5X/j
         0zFVbGPfIGiuVrJz4m2bfyhmCaS05k8KKZY4pT7SaYVBKANb/+yqiXX2dFFQqGr6BdZ9
         sQbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780391481; x=1780996281;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=awHtfwv62FDYoJPHVP74JHigRujnG/cfDkq7vi9nyXA=;
        b=PsBW0C+F05xnBtKR7Qs10sjvuPQ3LLiopxddUV4J+x5iS+HUpCc19UQfF5+9zV/DXX
         niR8/yyrsGwhxCZHs/adwP/3dgv0l+GlJHomIg8Av4yWxpsrOoF0IxEc1iOZeyiqCijl
         WF5wY2ziV5F30KNaQ9bvANN2r2DaqgISUMSjl01DqRozK/49Gvn9oYnL4bIqC829FlBj
         vE/Kk+IRx3eN6Z7F7742hIjYrv9kT4KyBKRImWcGmiHmsQV9CMHY0V1VSZIX0m9eLb0o
         T7kM9tXre0Epjd/QXtwy17krPstTUtICeduDt1in1QbJSkr4uzY45opSTCs8isgdXk5j
         L26Q==
X-Gm-Message-State: AOJu0Yzs4ldghgEGNxBhEfWl66SxyhroByA4IcXCNPlXxdhyJQnRXSMH
	Urnoq35ou2fcGFqxufMr/qknUjT7e11Lv6jtBy4G53N9uKsbBJDbn/h7tdNojQ7WKtlnAUpw5k7
	nUWyAsu7awg5QFXAtgdVSytpGZpPRuVvj6lGFxLLGw6r2SdpJ4MImbnz7VRsUll5CxkOB
X-Gm-Gg: Acq92OHjS3V7CKqh6037RryEGPztq833gfUOnMuUIE8N9N7rsiqpbGyF64Q+H6A3y6c
	NavuUiOC8LaJut+4oSsMEh4C3SAYdnpQzecY6ooGbZy4ZB3GiYjvOvcCw4xhoK7Qa+8H4x/1zlV
	P3flYDyAxECfsKKh8hDJx+obgsjnVwpincfcf/WLQS1Sg4e8zhuSU0HezRtq7X+q4/oEVaEAUm1
	8IFFtnouXUPcJV6Q67Vq6BVgpEinxRXEhakp3jJDWEwuy+f/wf4NsBe9FVD/V3SJn/2VQCmZe7I
	1mwxSyHRo0D5kYlh5Ua08vnR2Lp/+L23k5tpuH8R5vUY8ugRt9M55B+QgF6IYanFrmhdFzQ5b/t
	gqXGIWD7oRVreNIl0NY6R2bOOX9I0a+TZp1d/9DIzWF+vJFmAdnMP4QdRzbKijyNnM0SjaG2Ac8
	InWZs81gdYRWAlCK/TSw==
X-Received: by 2002:a05:622a:989:b0:516:ce43:f4ee with SMTP id d75a77b69052e-5173a73a8c7mr201325001cf.20.1780391481552;
        Tue, 02 Jun 2026 02:11:21 -0700 (PDT)
X-Received: by 2002:a05:622a:989:b0:516:ce43:f4ee with SMTP id d75a77b69052e-5173a73a8c7mr201324751cf.20.1780391481138;
        Tue, 02 Jun 2026 02:11:21 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51768c76e53sm12480851cf.4.2026.06.02.02.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 02:11:20 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: [PATCH v6 00/15] drm/msm/dp: Prerequisite cleanup for upcoming MST
 support
Date: Tue, 02 Jun 2026 17:11:12 +0800
Message-Id: <20260602-dp_mstclean-v6-0-2c17ff40a9b2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADCeHmoC/22Oyw6CMBBFf4XM2po+oA9X/ocxppSpNBGQFojG8
 O9W2Lq5ybnJnLkfSBgDJjgVH4i4hBSGPoM8FOBa29+RhCYzcMolrbgmzfPWpck90PbEU1M6tNp
 ZXkK+eEb04bXZLtedI45zlk57CbVNSNzQdWE6FagaRSmy0ogSpfZaCqFdJRl1nltUUhldSyng5
 2pDmob43oYu1Sb7u2mpCCXWcM4c88yL+jykdBxn+/i9PeaA67quX4ItB4T5AAAA
X-Change-ID: 20260528-dp_mstclean-f094cea8ca24
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780391476; l=3278;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=MvPTm+UIjOY/okBZfSTmYHFCIp4/Opc3YSafdUHz3a4=;
 b=EKTp8h2GS4NyoMMz35w3D43Rb65ZX5PCIiKJ0pdIRdFqY+m+I/GdUEGRzbcup8zxWixmVRcaH
 i2uNDWIvpNvAipnF+j5y0z6ez+C4qAJnm5kKUiL8PKbFRHrQqaIlQaY
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA4NiBTYWx0ZWRfXzwgu2eC0XEVo
 Y9ZkcCoqBcDIzJyfnqlSeshxvfIdz+s+KsEdWuguFU7fsD3TFs+3b/8hCJjse21iE8Jtk9NRQsy
 CQHp71fmZmROH8uDURRSm/DYS7iX0/W7cPfaU3ru8TGZBCStpxncPHwgQnySAtVoHwYxdtVg4s9
 KymWYppMxOyEc63KO/VnQQsuMTpVky6kgnBffsv6py9chETYg/5BNpNkMm03E0Z7uXPmP4pdcHD
 zDLYSG/SA6vKvEM/LzO+FBE+FqYbt7PQ8peN/pPycJx62fML+FYAhigB0CpVJCoGSIwNcrWYWAI
 ZojtKeABKeF0mtl2P1RHEtuhr3jvYrnaZjPcLcgt+ePrJrKSKt84fhKqN92Q9ndZD9lJ+UUxlGR
 hdoNRpRWqiFvXg0TGBMHeITFKIavr44k2bb4VGc3WU+rZ7soPSXys6ghcE07TbS+Ja8m/bwNmcZ
 mU8kFccWSpwp3BEYgEw==
X-Authority-Analysis: v=2.4 cv=d5nFDxjE c=1 sm=1 tr=0 ts=6a1e9e3a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vykuwZLdp5Yjkddl-pAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: HT1UXtMRbk3JKKhQ2xlv-9KtvqBT9wOL
X-Proofpoint-GUID: HT1UXtMRbk3JKKhQ2xlv-9KtvqBT9wOL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020086
X-Rspamd-Queue-Id: 7440162B57E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110775-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

This series is the SST-only prerequisite portion of the MSM DP MST
work. It refactors the existing DP code paths so that MST can
plug in cleanly in a follow-up series, without bundling the cleanup
with MST functionality in the same submission.

SST behaviour is preserved end-to-end; no new functionality is added
here. The intent is to land these refactors first to keep the
follow-up MST series focused, smaller, and easier to review.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
Changes in v6:
- patch 4: fixed the RMW comments. [Dmitry]
- patch 10: do not rename the existing struct. [Dmitry]
- Link to v5: https://lore.kernel.org/r/20260528-dp_mstclean-v5-0-a9221c1f1f3b@oss.qualcomm.com

Changes in v5:
- Split out from v4: only the SST prerequisite cleanup (patches 1-15)
  is sent here; the MST implementation will follow on top.
- Rebased onto linux-next-20260527; adapted bridge callbacks to the
  new drm_atomic_commit* API.
- patch 3: added Suggested-by: Dmitry Baryshkov.
- patch 4: fixed "splite" typo, reworded body, added RMW comment
  covering both SST and MST paths. [Dmitry]
- patch 10: drop cached panel from msm_dp_ctrl_private; pass panel
  explicitly to all stream-related dp_ctrl APIs. [Dmitry]
- patch 13/14: introduce bridge wrappers and atomic_prepare with
  drm_atomic_commit* from the start to preserve bisectability.
- patch 15: fixed pass panel inside the func. [Dmitry]
- Link to v4: https://lore.kernel.org/all/20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com/

---
Abhinav Kumar (6):
      drm/msm/dp: break up dp_display_enable into two parts
      drm/msm/dp: re-arrange dp_display_disable() into functional parts
      drm/msm/dp: allow dp_ctrl stream APIs to use any panel passed to it
      drm/msm/dp: split dp_ctrl_off() into stream and link parts
      drm/msm/dp: make bridge helpers use dp_display to allow re-use
      drm/msm/dp: separate dp_display_prepare() into its own API

Yongxing Mou (9):
      drm/msm/dp: remove cached drm_edid from panel
      drm/msm/dp: drop deprecated .mode_set() and use .atomic_enable
      drm/msm/dp: move mode setup into msm_dp_panel_init_panel_info()
      drm/msm/dp: split msm_dp_ctrl_config_ctrl() into link parts and stream parts
      drm/msm/dp: extract MISC1_MISC0 configuration into a separate function
      drm/msm/dp: split link setup from source params
      drm/msm/dp: move the pixel clock control to its own API
      drm/msm/dp: simplify link and clock disable sequence
      drm/msm/dp: pass panel to display enable/disable helpers

 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 383 ++++++++++++++++++++----------------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  30 ++-
 drivers/gpu/drm/msm/dp/dp_display.c | 273 ++++++++++++-------------
 drivers/gpu/drm/msm/dp/dp_display.h |   8 +
 drivers/gpu/drm/msm/dp/dp_drm.c     |  43 +++-
 drivers/gpu/drm/msm/dp/dp_drm.h     |  12 --
 drivers/gpu/drm/msm/dp/dp_panel.c   |  75 ++-----
 drivers/gpu/drm/msm/dp/dp_panel.h   |  17 +-
 8 files changed, 452 insertions(+), 389 deletions(-)
---
base-commit: e7d700e14934e68f86338c5610cf2ae76798b663
change-id: 20260528-dp_mstclean-f094cea8ca24

Best regards,
-- 
Yongxing Mou <yongxing.mou@oss.qualcomm.com>


