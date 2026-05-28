Return-Path: <linux-arm-msm+bounces-110087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Mw6HqsbGGoBdQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 12:40:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8FA5F0B83
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 12:40:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 84D1E30202B7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 10:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F12313BB680;
	Thu, 28 May 2026 10:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gnHir+rh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bQyWcZ6V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E2D3BAD95
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 10:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779964840; cv=none; b=clrFe/SsQPwuuQgFikrOmfJkfwbrWPFdEAtbyIbV1NSAfkh0JX/2Y5CyfZ32/X6gsPeNVtLhQK/8If5DbJFyLFZCDVms65ZeXjipHBkGcwtNAqA4C6sg4fdRSuFkgv5ZhsllZdLFGVsY6qVMqRt4a0X32YDxxFP8S+6jF+tyjXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779964840; c=relaxed/simple;
	bh=xuue7tlOaj84hkqTXFUwbQubbONow4b2zdH/SbNbEeM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KO/NDp6/pWcC1sFYsnr7TyM11GfwDjoSbEKO5A026EDQTsGy9auv/UzLl8ICMg2x2Yy0LLZEnS/f9wwANo1A1T4cIOjPXcvyKkCgbwA4OGPcZ07i4CO6gkWFN1mRL7W79rnezpkVlsPkBu/OfwJMyufOUuTJ2SMQzizStrl6hVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gnHir+rh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bQyWcZ6V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8wN3Z382552
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 10:40:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sQdpnw/ZbgoRCLUhyqQ1bw
	11r+G57tZO2IszqpbV4fg=; b=gnHir+rhh+83ORN3nT7P5ptdJ6U3q7mUQhXUwV
	wJvNF4bXLvR6FCC/GUejS7oAAdWBv7wdYLoKCa6awTFfPMtZzP7NEJUL+hwgTlQc
	69XhPQYzDEowSUj9DgMGWiafKCZKtjQulRPQN9INuVd5eegpjWwhudBaIU8V4Ix2
	PyppQk40IeztfbLEY7QFtI1gVSrGLuO8z4VEpZsSLHnZhjKLoEEiYBjmSqhm5zY/
	+FkqnjPa+7QbHCy/UWp7DGKb8qRXU3o/umP/NWY4oxI/xkRhL5vrnNKABz8jmH3a
	A4mGzrJKO6COexFU2mOi8lOLttmezLm5nnex9xE2KDPyU2uA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7yrje47-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 10:40:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-911cf6eb48cso151089185a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 03:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779964837; x=1780569637; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sQdpnw/ZbgoRCLUhyqQ1bw11r+G57tZO2IszqpbV4fg=;
        b=bQyWcZ6VOy4O6dMHa3AOZ641rvNAR+xkVxNJRolk7IbkKMS8DpwOoPgLtOCgMHJlzy
         gnlEwdcb2pv/zjGoEdJUSrdV5H6It0xyo5tGkdiVI2X7+4wNpzA2S+vzd25191eIhYzQ
         yFxwoofuX/Py7dtqHw8ZZ2Nq81fPXwdhhpWX4NqV56PmMwwV0UfojjzZM5gbpTl8u8bE
         YrzA+5jT1WKCEzVatdHJsKODHXXhvR/ranhM0pKaC22cadOQtTfDABG+O6fk0474BKQc
         Cg7DVmuEf4upshNanmQyRdKcCCgqzIRn5SZNCWl41QD/YgU1zGtr03TG23yp5iF+lfZk
         XJHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779964837; x=1780569637;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sQdpnw/ZbgoRCLUhyqQ1bw11r+G57tZO2IszqpbV4fg=;
        b=T1J36xoJmIH1mfr6k1DiIq0vH0ZavB93A6bcDusriiqM02k9ifNRpxWnyoJ0MzE40e
         kjFvGBpjMJVn0lgxGlg0oqvUPbZeJxmSxotWcJCI5eWBjl7W0eCfmkM6koKQVJv3LwFY
         926LqEeaI8OvJa8eVOLB2ZaFo9eJq18ctfLO3UwKGfy9sdPpLiX7dfnPgV71+4jRvK+7
         C4ewcDyG/iAndaBGUHJrunH0OuyxeUu8/42FL0/lMrROQER1ZtLFjV+6AtbziOuEHGzA
         FTtyaWBKVn/xIc/M3OPA37ynHXf4hysb+Y7yLumuqQkuGfleE4ug2O68F+ka/Ov8tn6L
         psuA==
X-Gm-Message-State: AOJu0Yy+bj7frhE8WqDrByvm8uneCYSb9OK4XaSYJfggA+SNQhWrjrOv
	MBUHxKIt/P0oO2IFxaRWj6LMeItkE9n+qq7j4VZTDpIuXPh/6cmoyCudbEduI+dem3OPY6FaowG
	FX7ruNw3ThpxI98nq3L1LZ9INIvhgq+fGqpxWIwhlFpssER9nk1oLfa8oC5a8c/n6wzhr
X-Gm-Gg: Acq92OHZ1RiXJ0rqEFYo2qJe1QxXg6JhrzJnaIOBbqLJVtgP1qUMhkq/XgXwfhxN8FR
	OfOwHZEGV69BTru3rj4qjaxJnojWISXHMXPQSptVd9GhzKci1FgC3p8nSsjyd3jw/8Y+seMbkhI
	bQ+Zpk0NrRakFVZ/7Q5Dvi9rnPqUDTS15XWHZFjtduM+CxOEZD4g5cj1SakERCQcPRniF5W2Bfv
	82qncaBxCaka2c8q79bnHZLtRm1ceCzoduPlo+uGxuxGopAxs3cmDZC5Qe790VB4t3HJiQ/SK0P
	omyoUVwTE234hkxU9JnGrB7+NV/N+zaT9WMRY6wdBTGr28OHD8/eJPrcP5VjjX1Iq7idPA3C21r
	rL9qBGcM4j3jRgHlXePxVre9vAOIkHDHb+Ove4CnHg7xyIL/n/C78MygRtWJoVphNBbvs7GJgAD
	P9tvd+0DZ5ALsVfsU9mg==
X-Received: by 2002:a05:620a:1d0d:b0:911:449d:98c0 with SMTP id af79cd13be357-914b46b6157mr3793353485a.7.1779964836741;
        Thu, 28 May 2026 03:40:36 -0700 (PDT)
X-Received: by 2002:a05:620a:1d0d:b0:911:449d:98c0 with SMTP id af79cd13be357-914b46b6157mr3793349785a.7.1779964836297;
        Thu, 28 May 2026 03:40:36 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-914f86fffddsm755148485a.12.2026.05.28.03.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 03:40:35 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: [PATCH v5 00/15] drm/msm/dp: Prerequisite cleanup for upcoming MST
 support
Date: Thu, 28 May 2026 18:40:21 +0800
Message-Id: <20260528-dp_mstclean-v5-0-a9221c1f1f3b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJYbGGoC/yXMWwrDIBCF4a2Eea5g1IwmWymhmMnYCs2lmpZCy
 N4rzeN34Pw7ZE6RM3TVDok/McdlLmguFdDDz3cWcSwGJRXKRjkxrrcpb/RkP4sgW0PsHXlloDz
 WxCF+/7Vrfzrx612i2znC4DMLWqYpbl3FdrRScm1abRhdcKi1owZrSUF5tmhbNyBq6I/jB8ORl
 tepAAAA
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
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779964831; l=3056;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=xuue7tlOaj84hkqTXFUwbQubbONow4b2zdH/SbNbEeM=;
 b=6AiqXsyN5m/pRFuE6vEOjwSl9kyRI5HWtBsC2kxqIl+6AhBydbz8qrD5s+3//lYJ60EHHGIs8
 ENBqHg++ChIAoq6GcqIHHCzKaveamV6dH498RDeNsvY4oOWsGXgw7jQ
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEwNiBTYWx0ZWRfXw9+goDNz5jdF
 GGzB/pKnhzzlkvTWvYhBJLZBThTDx92ofaGekfoZcgNZx1VLqFC5r4Q/L6fCiKWefL2Dv3NI5+l
 cSlmwtTb/9jqoxvztQSrBFODpVhLm6PMmxFKjb5SsoqdFfhWFpf7hBB7F+W9AUvkhrIGFKLszMh
 9KkrptLLNEb1cKMW+Uj20U/Qu9Z+wcho8MDLuygRL6AmNGwCXizTYCnT6DDDzIAkX5U8lltTTll
 GraP9dsWG5bkIZNeu9Hr0Cq4mxdWISXRd9Jt3fVZ9WN3iQJoN9ZGOlT40EQvPGZwaK5FYoCu6ME
 UGG3ZnCQw7mxmpBezxmZwb1NkM1kVS4uFMdOlCBuJPmxZ2KDNdVj90qWj8K4rKAW9bGrag5Llqb
 I05Zs6n+P3b+3sE1J4wKfH0j5JCIGOz+QcYVcaT4O5luYJCd9VVDmfVlvdtPVmWc/jcKfQVnslB
 Fa7iu8oF+iVVGMa1htw==
X-Authority-Analysis: v=2.4 cv=PLo/P/qC c=1 sm=1 tr=0 ts=6a181ba5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=IAIk9fEXjUNtIRNVmKEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: asW41cm1a-ZIM-4HwMHVriyCM_fFo75n
X-Proofpoint-ORIG-GUID: asW41cm1a-ZIM-4HwMHVriyCM_fFo75n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605280106
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110087-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1B8FA5F0B83
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series is the SST-only prerequisite portion of the MSM DP MST
work. It refactors the existing DP code paths so that MST can
plug in cleanly in a follow-up series, without bundling the cleanup
with MST functionality in the same submission.

SST behaviour is preserved end-to-end; no new functionality is added
here. The intent is to land these refactors first to keep the
follow-up MST series focused, smaller, and easier to review.

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

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
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

 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 384 ++++++++++++++++++++----------------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  30 ++-
 drivers/gpu/drm/msm/dp/dp_display.c | 273 ++++++++++++-------------
 drivers/gpu/drm/msm/dp/dp_display.h |   8 +
 drivers/gpu/drm/msm/dp/dp_drm.c     |  43 +++-
 drivers/gpu/drm/msm/dp/dp_drm.h     |  12 --
 drivers/gpu/drm/msm/dp/dp_panel.c   |  75 ++-----
 drivers/gpu/drm/msm/dp/dp_panel.h   |  17 +-
 8 files changed, 453 insertions(+), 389 deletions(-)
---
base-commit: e7d700e14934e68f86338c5610cf2ae76798b663
change-id: 20260528-dp_mstclean-f094cea8ca24

Best regards,
-- 
Yongxing Mou <yongxing.mou@oss.qualcomm.com>


