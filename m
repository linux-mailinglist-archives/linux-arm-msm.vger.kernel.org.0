Return-Path: <linux-arm-msm+bounces-106855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Fk6EsqXAWqXfAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 10:48:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDBE50A4F0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 10:48:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9013732056CC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 08:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42D783CD8B8;
	Mon, 11 May 2026 08:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pPRnR3co";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BeRodaxe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F683BADA2
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 08:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778488582; cv=none; b=hF37gzG7CBaSL+9KZs9qXEyoxE5oZ0x6eMQiVBJXaiBIUyaEcVejo3wa4ECP1Rp98v9qmf9Zoq6qen0+G+DupXP0rmY+uOjbIUUah9OqR7GDsB2DB0QV7V6hKX8Z2E+P43Q5s+5qgJapHMKsbPNzk4c5HepSuMeYikQ7MXwhr38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778488582; c=relaxed/simple;
	bh=G95APcyEFp0/5bJXcgSBrF6MgJZerwq0+fxABSPj5n4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lcKX19XhWapQxRvJR6bXhSdxOjefQ0Lbi+GMar7iA/KetIaZzlfahXrDO6nWcuDaYPI917oU2ENtrLEEkosbEHqMjpY3393ErGVm/58MKMC6kiilJD5bNuqzIXenaulsadEwvMzXuVM+TekU43Wiuj7Hr7cwBgJO5yeuISsjY7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pPRnR3co; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BeRodaxe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B5NjGh2793068
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 08:36:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8CFeAPjvnNUNUQRjkTC0u2
	CkdRKw65Q2AJD3I3iWzcw=; b=pPRnR3co7WesETzFc/iUoJbLRSfNmPQs8aIxOG
	86kZKoj6UKlt8LS5V4EXK0VHcbLdPJBNPTaJzeke2pZFe/kO+08xrCRLeO3bWbyC
	S5tt9wdyDMFpfdMao4dHrklmSC2c1Dn0Jf7FrxWVo1Nhkm/8e6YVkWmmDtG2fr9g
	8KIMhmqGGPhG46vNbTku9lJVh44OwaYGJN2hO3nTF2m+yxbt5mo5DcopNMsmq3zZ
	zJyVsoySbiklgR0w7g88UPvxgBOcdLcP1o1Ih8/CqsL6mnjloyFWjtBYzcINA00X
	Nc1KQfX6LuECsREyPGgid1THSe8vejawRZIWm1CEcd9jxoiQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e240h4cq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 08:36:14 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-514b673c8f1so35144201cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 01:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778488573; x=1779093373; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8CFeAPjvnNUNUQRjkTC0u2CkdRKw65Q2AJD3I3iWzcw=;
        b=BeRodaxeFuGUoGRqXeT8TS5kPyueQ9TzNQDb2pFqFBBwmq4P3l5oUrkQMpi4kxluU1
         SbT1VxiILWIc6I6leTXGBVyNBhI6TAOQXINE94KIwuuUg1efn1sqdO91NqLVJ1EkZGGn
         HthH5ZyDVfDajq2NtQypmtYAncHBPTbjDYW6NxKeoDDbSuOxZnZzwZUyINSGbqFRxRkT
         5CGjfUekbmH7ATSi06SPaO6AKDZOqPif1nhzynv/Pd86oCQf45wExAYqGAxVUXmxuP4I
         UOqV1qsHwQRiM6c0rK0NM2vgIg+rUzcbBwzoLbbWG18ACGme/5FcDr4nsZWY9L9AVNNG
         QhQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778488573; x=1779093373;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8CFeAPjvnNUNUQRjkTC0u2CkdRKw65Q2AJD3I3iWzcw=;
        b=spEQ4KDLE5wTb3Ko8N6Rucvc3nBKHPnhupCDJpQ7bqnxDSYx+na4Ep9bFiX9OfBXEr
         C0B6lyRRa/OHX/gd/rlQHXMHXyAeNROJC12y96hOwb0sht5dLfzZO0ErO1M3AL38S3Ob
         KEf7Rrhmev70fO7iT/aboCrLjPZmidKP5U+wYDSofq8oRh6XfhO67K3r5+2Q1tGEZtF2
         5CKqOnTfbqiDPvIXI2Oxb4b9GwMo8er1BVNzp8OFGKgQq+DAxHzQ0AFkd9d7CUF3dBNf
         DprAShZmOEQdibGqFhARttGDbatPpyQBnzVsxpiHv+Ml9kezcrkd75XhmckVCOiENVRS
         wZYw==
X-Gm-Message-State: AOJu0YwA34bc0hOMCnS/bX+kFEueNq3wV34Ul179J7Vf27+JQ9IfmiHX
	rPTXLiBcp1UacXQP+4tKDqfvjmqpTe9BJEql9OBVhwT7xF/0Ek/DAKZFRLTJqc9NTdow632Axri
	Io4uGccJqwQRhGh+cLkNAhvQIOjb+bfUWBIiP+KbPBcaxYTdwBWaIZiETVgW8eHF9E3FZ
X-Gm-Gg: Acq92OEbijOERXDOFnXez8rA9tgWvkGfqWnHPMLQ+9+2Y/vQ87cIFCXJ/rfqDpP2Vc/
	EAbeUqXJAcAxnBjYIux5KsxfqlLqoSLO8E+eZ4iQFoMvJIjcCHWJNCioxQuW+rhq5NuWL5aVO8G
	pqAhDO+xPrlqKKWCC/tkl5UJd6dyxJi6rrepIOnL9/MdmxGZo0j4v6qZFSKY0MviOYeadNV+HT3
	2J5v06E2bus44Y4EGAqhz2YH+Uv21Om4uAHHRz8QWBUCpbNHpYB+RBiNhR6skc0R3ff+4tL32Yl
	x26afM5Jz4YE5HucwNhL+t7lopxuQOqeIdn2Wswuf3a/pLM1cHAn6FrCZHl4lJeEHZL3fL8uZ0v
	eZIZ7yNiwQXPqkrneDSE/rcMsh5OThUo32Je3V/RXFMCIxF8YhykKFqJpkEd7cPLyREZ44tk+4K
	7ie5yv7ac=
X-Received: by 2002:a05:620a:414e:b0:8cd:d872:c2c9 with SMTP id af79cd13be357-904d6cd5d09mr3515026285a.50.1778488573455;
        Mon, 11 May 2026 01:36:13 -0700 (PDT)
X-Received: by 2002:a05:620a:414e:b0:8cd:d872:c2c9 with SMTP id af79cd13be357-904d6cd5d09mr3515023785a.50.1778488572998;
        Mon, 11 May 2026 01:36:12 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b8f96cfdsm1033134485a.15.2026.05.11.01.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 01:36:12 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 11 May 2026 16:36:03 +0800
Subject: [PATCH] drm/msm/dp: Skip push_idle in atomic_disable if display is
 not powered on
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-edp_suspend-v1-1-128555968d7c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPKUAWoC/yXMywqDMBCF4VeRWTcwk9RUfZUixWQmbRZemmgpi
 O/eUJffgfPvkCVFydBVOyT5xBznqYAuFfjXMD1FRS4GjdpiTaSEl0fe8iITK5RrzUiE1hgojyV
 JiN9/7d6fTvLeSnQ9R3BDFuXncYxrV0nbsCZPN3RIzBKMtQG1cS74YJ2hGtswNAb64/gBnKnkP
 qkAAAA=
X-Change-ID: 20260511-edp_suspend-0e45d0110633
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        Douglas Anderson <dianders@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778488568; l=1630;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=G95APcyEFp0/5bJXcgSBrF6MgJZerwq0+fxABSPj5n4=;
 b=0PsT5i264kqig8JC8UFwbXDdRx0p/GuaCxwrgySL2KQGz4npCalLRT7tI+3sx5kk4QEDumKJR
 9OygBOxD7DiBSW8ZwnBqWAMom/GJAP1EcCI0NFPQoyrAFG1QVS4N0MU
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDA5NCBTYWx0ZWRfX9kYhwcB2pPhB
 Dar91UogUBjWOJossdQP2N+ZUyBH62AKdwcz1/SIjas98qU1420u1zaQk3EwCvzs82sq/rcWzYX
 Upl1sb0kRXk5SgmtNFW6PnQUOCVcPUEJqSLVEBXuyITtb9KFdQtQZ3MYoP5+LxwwRCHhG+m5i+3
 WztailYhmJrwVSEVIemoiR/Lv03+4tyDVkt0SFvVIrdQMx0bF+amjzW2g/tudQsxh/wnK1jqck9
 K9ieU1CkkN3vp4fRa0d8nSQGVzCfzMLwzUInXyTEqCa8CRcG2BHabqZG4gX7RDekOH8wrddHQtv
 xkze5j3ubwtBW2HB40Dof1ow9Id2BGSWQ0QtlK5qhq3a3cVIE+l3f1C1YRCmXuvUUfc8f5k9Z02
 elKR0vdDvbzC9sFrEiU5vLSKQbn0IKZQFYAEazoycafDmpe2UO+1JEZ5WwyIlkuHc5QunSkmrPU
 EDUn1Sh688wmuJw1C0Q==
X-Proofpoint-GUID: ok6KUMB6nHcouPLUgJ72NOQLeVS1chXU
X-Authority-Analysis: v=2.4 cv=X5Bi7mTe c=1 sm=1 tr=0 ts=6a0194fe cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=aJ8XEeGOS4McOtPK9YYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: ok6KUMB6nHcouPLUgJ72NOQLeVS1chXU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110094
X-Rspamd-Queue-Id: 9FDBE50A4F0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106855-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com,chromium.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On eDP interfaces with no panel connected, panel-simple-dp-aux fails to
read DPCD over AUX during probe, leaving hpd_state at ST_DISCONNECTED.
msm_dp_bridge_atomic_enable() exits early as a result, so
msm_dp_display_enable() is never called and power_on remains false with
link clocks never enabled.

During system suspend, drm_atomic_helper_suspend() still invokes
atomic_disable() for all registered bridges. The resulting write to
REG_DP_STATE_CTRL against an unpowered controller triggers a NoC slave
error, causing a fatal crash.

Guard push_idle with a power_on check to skip the register access when the
display was never enabled.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 1b3cbf4016ef..51b60eb9c2df 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1660,6 +1660,13 @@ void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
+	/*
+	 * push_idle accesses link registers which require link clocks to be on.
+	 * Skip if the display was never powered on (e.g. eDP with no panel).
+	 */
+	if (!dp->power_on)
+		return;
+
 	msm_dp_ctrl_push_idle(msm_dp_display->ctrl);
 }
 

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260511-edp_suspend-0e45d0110633

Best regards,
-- 
Yongxing Mou <yongxing.mou@oss.qualcomm.com>


