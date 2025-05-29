Return-Path: <linux-arm-msm+bounces-59832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD46AC84DE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 01:15:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 896214A3045
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 23:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C843921882B;
	Thu, 29 May 2025 23:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JlfPzSHT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1227E2D023
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 23:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748560525; cv=none; b=rmaDGEDbPCZ3BRyYXYp2C1PCxTGAkJyU/eHwQxOO/zIKtRd9bRFE3JDqHzzKDigmFcgp8VnhE31jggrK3d3PhhDMWKGC2STvvmfZAxFDjlV0GY+e1BrJme46erwze0JkJJvPd3PFr9MHWSvvKozZilEmgGaBSXAz5QIu6roDNfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748560525; c=relaxed/simple;
	bh=p+J6Yc4e0I4h3V1k9TjlmQ+K0LikpunWgUiF/f0yJis=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qVxHV1VBdsQ1NJh3NGCxVDJdBy2pVuGiH9126j8FWIg2GHS8t8rGcmpOGyjhR8L0xeikoOTcB4b98WGlW1GuS02gHFJAgsmCr5Kl+8YzcwA9h21pyJG7dxdQUMvIZixBtYfFylpGy7EqL/X8RCNaiQGvYlaqDV2KjlZB0WQ3jU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JlfPzSHT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54TC1NNP008006
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 23:15:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dM46x4cxeQsukQLX6q9Z31
	jsJ1XmgFK8Wlrcgm47nVo=; b=JlfPzSHTayY0hlkGVvikC1zRJMznzhrhGgQbiL
	V/JhhLFDoV6QvC0BhTSJuiuYk/XkA4t+a5papFCHEzJhnfpxgkrCjXNJGciS7Jos
	zeSLXstDmpLX0WZPQT61ckWisfonJ9RQDNFIAfmfLIAzNGpsZh1sNGkyBzuMnZeu
	BpDr8Vw6RFpab0R3ZWReSamMz68NIVIibEFN4GGqCT2Qzl3vEtGenq+b8V/IXVrP
	BgQluCgRpxP5RzMrDn16ed9q2ZnEuP4qcvV2vHbOGoLBiE6xJvbGl+iAJB/DPa+L
	aQ+q43PtyVO6VakuiQeKpRQ9wfZlbeXx9c19fXxENpgm2B0g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46whuf7jmf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 23:15:23 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b2c38df7ed2so1053908a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 16:15:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748560522; x=1749165322;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dM46x4cxeQsukQLX6q9Z31jsJ1XmgFK8Wlrcgm47nVo=;
        b=IP3s0k5BTTQ2J5h5vvj2Ls5i9MuK+kPLdACgBxDFDOO/Bq/WVLfK0L3f6ZNjsoFDUV
         ZS7hXM8q5Hbf+6HaL0FB8mrsu1PHmyg628LsU3z3p9mJK6wK7komBBpfEERwu2Z5Kt6q
         MZ6aGcAqy1Yfp4e7jacJgfN8ulYQg5BYmpow+4tUV8XOVVeEoRozw6blQmeWBarIqArm
         ClY8bzTVP0otXAAobuW/Ddq+ERS9pE4HgnhBJpkIUGGCMBeXFQn6tpKFxVQisUHBX/Nm
         YXcVJnuIbhL3h42/kLJs/6ei0gs9DwxBsQgl16un/BShNhGlo1LUJMvPcjnd/sCutENK
         oH0Q==
X-Gm-Message-State: AOJu0YyRbZyrVxLJDTvUW01/zoI0IFGexLq6zu23l390nyU7fdVqPfOT
	GvTqEfOSdA3xKBbFhng21o6jq5bkb9PDkNDVcpZ6VQsse8P5xKgP+JTqTXGaO3o6HFtZAj+pwuH
	fz+tMztElyQwXfn3qQi1P3MetKjR6DKRdKwj5fjWht8b6nolhVSsVGuVe4G3WgZcQaCBh
X-Gm-Gg: ASbGnctAcjk1WkD9CDToROJPBRcbaLySnY8K3LxrS94+ieIR+Mzt4+zLozVX6aDtqYc
	uFwI33fq2hfCv1Xp1HiKvDpviccq+IhLPvrAF3q/HdjzzFAN8UrX/Fa/h4RPaYkswwG8t3ccD5W
	5mNuxiVC7TSi5WvPAlVHNsti44Nt9UoHInFYLBw6ORZuqnBX2G7CUzb7hfcgyxal0Z6UCc2PuOk
	0gihODvGttsRj5xb5gi9lKRY8gLuk5gHQSF2RdGVx+pqZ2+A5/it9hgxER6eBK+bvb4hYFGp93A
	65rQnfWRg+h2fSkdybBhP+h0eJCi+gR68KscGseiX5GA+s1UVHnroTPPd+MNfFNPLHSAtrVQ
X-Received: by 2002:a17:90b:53c3:b0:312:1143:cf8c with SMTP id 98e67ed59e1d1-312417344b1mr1957989a91.16.1748560521988;
        Thu, 29 May 2025 16:15:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExYZ+leMnKPo4Ci9CLPMqPb0xaWB2oGIYcmSOSoT4uHU76LrLJmAqIKUON0iPvzODR1Vaujw==
X-Received: by 2002:a17:90b:53c3:b0:312:1143:cf8c with SMTP id 98e67ed59e1d1-312417344b1mr1957948a91.16.1748560521574;
        Thu, 29 May 2025 16:15:21 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e1f3f22sm73581a91.0.2025.05.29.16.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 16:15:21 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Subject: [PATCH 0/4] drm/msm/dp: ST_DISPLAY_OFF hpd cleanup
Date: Thu, 29 May 2025 16:13:42 -0700
Message-Id: <20250529-hpd_display_off-v1-0-ce33bac2987c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACfqOGgC/x2MQQqAIBAAvyJ7TlDLDn0lQiTXXAgVhSikvyddB
 uYw06BiIaywsAYFL6qUYhc5MNiDjQdyct1BCTXJDh6yM45qPu1jkvd8Flpaq6XwaoRe5YKe7v+
 4bu/7AT/3Ta9hAAAA
X-Change-ID: 20241202-hpd_display_off-6051aa510f23
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>, Johan Hovold <johan@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Yongxing Mou <quic_yongmou@quicinc.com>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.15-dev-64971
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748560520; l=2255;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=p+J6Yc4e0I4h3V1k9TjlmQ+K0LikpunWgUiF/f0yJis=;
 b=BQctw8V9YspdOLDHmfw7iXSaWQZ1w9E4/q0xe1yRnX23EYhwTtLhe6DxjYXOftuqvNwA+PAvW
 MxRu6oV+V4jCscPknjbJbJ36h3zcyKIpYY0Dam4hI7cPCbMZ9U3ZrEa
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Authority-Analysis: v=2.4 cv=OslPyz/t c=1 sm=1 tr=0 ts=6838ea8b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=BGtpjrQ8lv99lgvwEK8A:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: xPFruR2gAR5BJwOY4HqY0WuttunfaXIY
X-Proofpoint-GUID: xPFruR2gAR5BJwOY4HqY0WuttunfaXIY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDIyNyBTYWx0ZWRfX2EtxrX67/qFy
 YKc3lldSMp1Xwu0IhdPuNk7gGf4SO5su3Q//mqEnT1FK3XRV4eFzVk02HQ19aUg2etgBrSzFEE3
 wg+iGlmdPBaGmgWri5RCATin7AFlueCBD16zNg7ZAtnrUx1w8natNscK8b44/M2bfeSc+G1Lk9A
 dNjYUrel71RfsqXsu6Wa/O72kj1elVaXKZgaeJlT8ybld87+nd4UxrnafJZVh3vOtUe+rdONSkH
 pT5UlhC6Kr99OKNUMiHPRf9XvCL5k4tc4mitEjFxHXJkjxB0LqXh/U5OjoElrfTyz+EwWQt2MAk
 Nlgq7FIJI6BPk/TGC8WmT+CFpd1O3rqEptaU70iO+GMC7jFUHO639dgrYW1w4lBX4hmE0hd3DKw
 R951Xi87fc1747BAOqGdr8ORCGhMIq0J6NOCNabBWqQUV3JrDVrqcxbhAGD4k4fQPUWf6j5q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_10,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505290227

HPD state machine in msm dp display driver manages the state transitions
between various HPD events and the expected state of driver to make sure
both match up.

Although originally done with the intent of managing userspace interactions
and interactions with compliance equipment, over period of time,
changes to this piece of code has become quite difficult to manage.

Although, unwinding this logic will take some time and will be spread over
various changes, to start things, this series tries to get rid of the
ST_DISPLAY_OFF state as firstly, its really not an hpd state but a state
of the display overall. Coupled with this, there are quite a few checks
in the current code, the origins of which need to be re-visited OR are unclear
which seem unlikely or redundant. With DP controller on newer chipsets supporting
multiple streams, this has become increasingly difficult to work with.

This series removes the redundant state checks and simplifies the logic as an
attempt to get rid of this ST_DISPLAY_OFF state.

Note: This series has been tested with sa8775p and sc7180 devices with multiple
monitors and also multiple dongles with no noticeable regressions.
Both of these devices use native DP PHY though. Hence, if this series can
be verified on some devices with USBC-DP combo PHY with the help of the other
developers, that will be great.

---
Changes in v2:
- Rebased on top of next-20250523
- Change atomic_enable() to return early if ST_DISCONENCT_PENDING
  instead of completely dropping the
  if (state != ST_DISPLAY_OFF && state != ST_MAINLINK_READY) check (Dmitry)

---
Abhinav Kumar (4):
      drm/msm/dp: remove redundant checks related to ST_DISPLAY_OFF in plug/irq_ipd handlers
      drm/msm/dp: Return early from atomic_enable() if ST_DISCONNECT_PENDING
      drm/msm/dp: replace ST_DISPLAY_OFF with power_on in msm_dp_hpd_unplug_handle()
      drm/msm/dp: remove ST_DISPLAY_OFF as a hpd_state

 drivers/gpu/drm/msm/dp/dp_display.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)
---
base-commit: daf70030586cf0279a57b58a94c32cfe901df23d
change-id: 20241202-hpd_display_off-6051aa510f23

Best regards,
-- 
Jessica Zhang <jessica.zhang@oss.qualcomm.com>


