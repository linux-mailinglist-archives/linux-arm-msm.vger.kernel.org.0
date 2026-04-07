Return-Path: <linux-arm-msm+bounces-102049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id rx/UFICL1GmjvAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 06:43:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2733A9B8F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 06:43:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1FFA73017046
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 04:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2AD633507D;
	Tue,  7 Apr 2026 04:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cMQ3Qxm6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D5PxvU0+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C692F12A5
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 04:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775537020; cv=none; b=EFMuG12fp7J1LdullmzX/SfJ/5iubNM9OnJ3kwIqX0p50SCrE8nXAKM7fKL0OJ0BIawY0rBUiyVhDyIVWoxPwSIZK0g8cUqEUGQtaeffupcKrhxQAUDYJc1kN1pT7bsBU6+J7AZ1PfJdxwFActi/Df8wnfF9gN4STHjnVIm2X20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775537020; c=relaxed/simple;
	bh=WTiQ9Z3avkzTiRzbxvwruwnaNWqtE/zo4RKVBY6bqRQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pxtU75VvByuLUGm1pW2fcPEn3fb3XD9lNNGYTgjPItXE+qpF1eXgq6B6iX12xsYiTpNxrIzRD87zX3HKm7RMTjXoic3Dn+qr8sDOU/8HmRR8GNbNb5Qr2OjYUWMGSWJFgXlQVjcBqRBqvnV2mWuvwiu0h7RK8WA60yOV/g98bKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cMQ3Qxm6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D5PxvU0+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LQHjD493201
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 04:43:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hc1Mmtt3ZSr+RrnNSRhRAD
	6dnE9SizpA8scQB6p461U=; b=cMQ3Qxm6puDuFampLeU6fRsu28Pr52h4li/ZX5
	XmPc0BoxU//fxdOk08Lbcw2yRS2O72V/diog8dfm7IHcH7jbhRylJuU7EkDIKrJH
	IXZhjEAwPD/FnN3kF79AJNGmqVNk8+b/QH5/8I2MWDYjpbXPrfiVrWpCz6KU5GDt
	dsREWHngDKDDJ0mgJJ5bhz7sEMVITatWB1Qp3PBxhnDQSvRrcZWrygYLGPMhY46c
	6f1MVk6B5geRanJIR+ezF2+BD5d0nFzxMGaPjY5xt4mprGuxVdItS07Qkij/RCM1
	QCZXB/rMR43JDuv9mPikrKuGoMoKhCZtNW01oulRfCQ+DKUg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr8s1dn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 04:43:38 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35d9467e85aso4233062a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 21:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775537018; x=1776141818; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hc1Mmtt3ZSr+RrnNSRhRAD6dnE9SizpA8scQB6p461U=;
        b=D5PxvU0+vTnVxy1tR+QJSSoJ20NGOPXT4Hgc54MzpLQnujA5SI/TvhVR6aWZ/ZP1Ze
         wRIa3qBFTZKxbOumyHefQLMFfliCjrC2SqSiyQh76Yb9AfkkBrz5NoL0TJ3M+bWRrzUC
         gzWNZH7UZUq81OkKkAocRU8RPgobxGxR2Xmdd3XTr6GGpPOlWVzzEFuuZ9c7heGuq7tn
         FPnKOCNh4u5bbTAhNHCFoEE9aEhQ3uiT5WJW4HXw78G9hk/xApSfR8R9+55jVT5+S4lb
         Tu2wCY00dh7vtyGBH+7ex79VF8DnUkpIVEFJwDPVWDpw3vqA63iXlLCnVZPSDw4NQJzy
         SScg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775537018; x=1776141818;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hc1Mmtt3ZSr+RrnNSRhRAD6dnE9SizpA8scQB6p461U=;
        b=bq2D7zOjfrOuQFF7nfdU0jbamecC7Pw+EfElsTQommYz31OOFF5e/cmzmaZWMtBL7v
         rRniDCm7lGMomrJzosiWlGhIppEJxwvl0QsUmBlwhDiXXEREUNI638YMg9OKmKS3JQ0O
         qNBqtLuIEiKy0F4Wu4/pV7BLvdQKrVQuCuFBSmSlW0JAxEuBUZfaRdZmv/Flt/KZ2fl+
         yu4eG83Fj+mUlIo5OJyGny1BwR1y4rSW47h+vVSSKVLeNs3TYDsqDzOWJqktJL0hTYiM
         WH2lcX28Z2gVEhbj6qgN/f5O3JPCuCs4jNWHoQC1yp+AV7Zwi6Jv6fdrDiaecpmMZ4fe
         ptDg==
X-Gm-Message-State: AOJu0YyF9qYhDOSGBNkgPHgXE38rFeev48FEZsn9ktp5hTBR1WiIIDfa
	HPw4+NaQtNxcuKLFnKgd6H5Pdeq+UrdSOyXpqir1ZE9yAqbkDtEMQ25he7BRsh51rUOVrDsTm/0
	c5aJlK4X7WK5BCSigyreiBf378Le68x6KjRsLDM+UlaSngKoGoa5q+8C5KUZf6VhIcahe
X-Gm-Gg: AeBDiesb4IX4V85VubQudfjolkllQd+rXL7zRLVCRxDXs8+p6iPbZh/RJa1G1Yknapo
	iI/icZzz/56pqSuaymSI1f/CmFJ82sOF0/U1DHzXvqSiHyWkV9LoqTAqBRQQw2bZfC540wqbfFI
	2X5M8Gi5DLOq6g5mwNbWFoKOILt3FKLwuXJLt1pMWzMfXgOM4gnYj9P3BE/v+VpgSG1n2NrYyV9
	yjkRLHPQ/UceJvKqJjwCbbpPnV+lmmJC0D/cpcSaYuOtbLtTYzQLG3rEMOf9GnAhSALfuI/NbW/
	guy6z7AqO1KedKk8uIGgVJnwjHMlMdhPpZcuesv8jHaZdJrHyJKJPTpZCGjBgsCU/g0Qc2AsVoY
	Kjig2ofZrpok9sSukqTRl6kevEPGB9BttVTFJFtRZSrVLXZLO02g=
X-Received: by 2002:a05:6a20:7493:b0:398:9ae9:710f with SMTP id adf61e73a8af0-39f2ef7e3admr15616453637.13.1775537017759;
        Mon, 06 Apr 2026 21:43:37 -0700 (PDT)
X-Received: by 2002:a05:6a20:7493:b0:398:9ae9:710f with SMTP id adf61e73a8af0-39f2ef7e3admr15616418637.13.1775537017169;
        Mon, 06 Apr 2026 21:43:37 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c6ba2fsm16123299b3a.45.2026.04.06.21.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 21:43:36 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Subject: [PATCH v3 0/4] regulator: qcom-rpmh: Support RPMH address reads
 and use it for rpmh-regulators
Date: Tue, 07 Apr 2026 10:13:28 +0530
Message-Id: <20260407-read-rpmh-v3-v3-0-34079f92691c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHCL1GkC/x3MMQqAMAxA0atIZgOxFS1eRRyKjZpBLSkUQXp3i
 +Mb/n8hsQonmJoXlLMkua8K2zawHv7aGSVUgyEzUE8jKvuAGs8Ds0Vnus459kyWoCZReZPn381
 LKR8pZriTXgAAAA==
X-Change-ID: 20260407-read-rpmh-v3-821188eae030
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775537013; l=5242;
 i=kamal.wadhwa@oss.qualcomm.com; s=20260406; h=from:subject:message-id;
 bh=WTiQ9Z3avkzTiRzbxvwruwnaNWqtE/zo4RKVBY6bqRQ=;
 b=ImTdB19AsOLxivhh298PAZeWrPHFHlB49MFB+PirRIKv5sydntDs3ukCW3D3bZxLs24QIhquu
 ggkKUf2T2OLDIvUel8nLfxJYDyDJQK3sRAqB7WRroK7KElPR/Nyopqe
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=ylH1NxUZkBpYsmww89g6zVxpS0q8qthtzcORkYxn/Ag=
X-Proofpoint-GUID: iqC1NZlytlBGuAguxbPQ6cGqG8BNZFzt
X-Proofpoint-ORIG-GUID: iqC1NZlytlBGuAguxbPQ6cGqG8BNZFzt
X-Authority-Analysis: v=2.4 cv=c9abhx9l c=1 sm=1 tr=0 ts=69d48b7a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SNdnmcxNzcEaFLWHHzMA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA0MSBTYWx0ZWRfX+ylPyDseLFEA
 S2ImkQs6p1rHER89lS/x7sABXN5iWscR21hbSYkzRy8fALl0Z0eWXLP/F2MmoxQQea535D/pscO
 gBhJiN2H5wxSzWUWvq/5vy5XjswlNwu0kuS3J1Rb6DtdB3bFOLdQZZq++imx1sd8GprorjkQMAj
 i28eT/BxRkTUX9eI+kkGjM3i03SgL2m0COOnRKwyzL3C1k2xZpckHYCjfop6tMHJwPXIYg114DG
 3xwC0hGffgvvEHSe5UuWIDi+meo9rgKmhwqR9sKRC1gFdSTN2XSw9jG0J/5X2V4NaHZUA4WOX0Q
 2zmE5/e02khdBmtWJuIkHODdpD1DN6oHkSODs5tDqbOETx29f49+8P59D2IcFV7yKhFhjso/W8h
 XdR6+owwfkE5se3tbl91f9VoiCYJlQDruZ//CxHzJP8hC4/4kWzoIZ7EQVzDOiNotHhR50g/v2y
 u/bwpf7DBVO7bXjO7yw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070041
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-102049-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kamal.wadhwa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AB2733A9B8F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch series adds a new `rpmh_read()` API to allow reading RPMH
addresses. Using this API enhances the RPMH regulator driver by adding
new `get_status()` callback to reflect the regulator status and also
readback the voltage/bypass/mode settings as they have been applied by
APPS during the bootloader stage, so regulator framework can get them
via `get_mode`, `get_bypass` & `get_voltage_selector` callbacks during
regulator registration.

This is needed because currently regulator framework does a unnecessary
write with `min-microvolt` DT setting for all the RPMH regulators during
regulator registration, because the first time after boot the value is
seen as -ENOTRECOVERABLE, as there is no option to read these regulator
settings.

With this change this unnecessary write can be avoided and regulator
framework gets a sense of the initial state set during the bootloader
stage for all regulator settings.

NOTE - During discussion on the v2 series - PATCH 3/4, reviewer had
inquired about possible need for the use of the sync_state() to handle the
"multiple" client case - for maintaining the regulator settings till all
the clients are probed.

This case was not covered in my previous series and had originally planned
to do that series separately. But after the discussion decided to merge
the 2 series as it seemed this would be a better approach. But after
working on sync_state change. I realized a basic issue with using
sync_state() for regulators - that its per-driver and not per-regulator
resource. But we needed a sync_state callback for each regulator separately.

I had been experimenting with few ideas but seems its going to need more
time for me to close on the equivalent solution that has per-regulator
sync_state or something to that effect. So I thought to close on this 
series and attend to that separately.

Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
---
Changes in v3:
- Removed "bypass_supported" as that is not needed for regulators
  that don't have set_bypass implemented, as pointed by Dmitry.
- Handled the corner case where the mode/bypass setting is read 0, but
  its unclear if the register has been set to 0 or its un-accessed.
- Dropped `convert_mode_to_status()` and use the `regulator_mode_to_status()`
  instead.
- Refactored some code to simplify the `status` update after every
  enable/mode/bypass setting change.
- Corrected subject line of all patches to have `regulator: qcom-rpmh:`
  for all the `qcom-rpmh-regulator.c` file changes, as pointed by Bjorn.
- Re-ordered the series to have the `rpmh.c` driver patches first and
  than `qcom-rpmh-regulator.c` driver patches as asked by Bjorn.
- In the BOB5 bypass fix patch (PATCH 1/4 in previous series), added
  the fixes commit#, as it was missed earlier.
- In the rpmh driver change(PATCH 2/4 in previous series), modified
  commit wording and removed linked as suggested by reviewer.
- Fixed kernel test robot issues and other formatting issues in
  PATCH 3/4 of last series.
- Corrected the checkpatch error fix PATCH 4/4 to keep to only
  one error in comment section which existed prior to this
  series.
- Modified the subject line a little and added proper tags
- Link to v2: https://lore.kernel.org/all/20251022-add-rpmh-read-support-v2-0-5c7a8e4df601@oss.qualcomm.com/

Changes in v2:
- Fixed the BOB bypass mode handling (existing issue in current driver).
  This was needed for `get_status()` implementation.
- Implemented `get_status()` callback.
- Callbacks for `is_enabled()` & `get_mode()` will now be used as-is
  ie. v1 changes reverted.
- Bootstrapped the read values for `mode` and `status` in probe, based on
  comments received from reviewer.
- Callback for `get_voltage_sel()` has been modified to handle cases
  where read voltage is out-of-range defined in the regulator DT settings,
  this is needed to ensure backward compatibilty. Regulator probes may
  fail otherwise for some older targets.
- This patch is rebased & tested on:
  https://lore.kernel.org/all/176070318151.57631.15443673679580823321.b4-ty@kernel.org/
  to avoid any merge issues.
- Fixed code style issues reported by checkpatch.pl script.
- Link to v1: https://lore.kernel.org/r/20250623-add-rpmh-read-support-v1-0-ae583d260195@oss.qualcomm.com

Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>

---
Kamal Wadhwa (3):
      regulator: qcom-rpmh: Fix PMIC5 BOB bypass mode handling
      regulator: qcom-rpmh: readback voltage/bypass/mode/status set during bootup
      regulator: qcom-rpmh: Fix coding style issues

Maulik Shah (1):
      soc: qcom: rpmh: Add support to read back resource settings

 drivers/regulator/qcom-rpmh-regulator.c | 186 +++++++++++++++++++++++++++++++-
 drivers/soc/qcom/rpmh-rsc.c             |  13 ++-
 drivers/soc/qcom/rpmh.c                 |  47 +++++++-
 include/soc/qcom/rpmh.h                 |   5 +
 include/soc/qcom/tcs.h                  |   2 +
 5 files changed, 245 insertions(+), 8 deletions(-)
---
base-commit: bd0f139e5fc11182777b81cefc3893ea508544ec
change-id: 20260407-read-rpmh-v3-821188eae030

Best regards,
-- 
Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>


