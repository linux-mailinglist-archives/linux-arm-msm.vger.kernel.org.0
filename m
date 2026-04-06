Return-Path: <linux-arm-msm+bounces-102015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOYZEagw1GmUsAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 00:16:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FCE3A7CB0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 00:16:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 632123047429
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 22:15:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05A6C39E16C;
	Mon,  6 Apr 2026 22:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RGovGEXc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Av/7NFC6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9056539DBE0
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 22:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775513723; cv=none; b=N2bMHzor/Ek45yEBWSqRltzDdeSNxr0FISLd+cfIJl3e7swUCIsmzBDvE3tI7U91in3eeO5ozLqTgP6VlLelzSPAfZ2PcS/tJlaj57V2pwyGw/5P0nu1c+vcV2Fc/6vfupd/YwiaSvaUtKPyiPNKE3fV9j938mV+aK3RxiNnpWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775513723; c=relaxed/simple;
	bh=7by8FKHHh0QQjSP3e1hRdT4TaCixOsAvKzPTNnU3Fak=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PW9fsLKzDJyEAHpxZJgzKQU0FTE15GuYwsw5q+FFwk9cmyfVmfBqPpS0oYQ1RKBu4a1NeTFGe4+x7mPRC47M76nDXXl6e8ELBx4Plrc+xs9WewpYJWsPQU0O+jXbTJr6dvi6JHcEvtcuGPq/VApZDucn2sLU8r/7Cpiejm2lWg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RGovGEXc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Av/7NFC6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LRZa63404395
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Apr 2026 22:15:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=02dDT3p0oSM/9iWT2t0FBv
	QLm+GhMjic1M+LQuehhyw=; b=RGovGEXcfqB9Zbbz5FMV/yHgVf6kN+6epfwlsr
	RVTnZh0QgLQm6OSd05RTm9KUZ57MpjcOX9S6uWHHxnbRQQWI4Neta2rqVUOuKzGQ
	tsKDL1HyJTHczEjyX27bciGIp4bvp0PQRmlMeHG/2iFvFQMeLiwmGu4dwScEtBNv
	yCizRLV3HxhLjslxTtnowYWos5Q9Jon5fq79qa5yJmCJ9XUERez8fXfSf03bT2U2
	dErfAC/iQSGT1s8KUXe/7nroNZ+XPthu0+7kTSqkMlvKPyXiSXgALLUs6B7lpuaJ
	kn3Mmbwa3sH9HxY577KnTgMxH7uB+kZryt4XB70VtHZjKhTw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrhr3c9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 22:15:20 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35d9467e85aso3986519a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 15:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775513719; x=1776118519; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=02dDT3p0oSM/9iWT2t0FBvQLm+GhMjic1M+LQuehhyw=;
        b=Av/7NFC6rCLgzI6zcl9GsPzCuGyoUaDq3H5950XUustXGcLh+by+D9hApRLx7zFNzB
         bZ70P0LwskbfZGGL92RwYiQ/mctVh2JAN067Lb5PI9ZbeM//6FS1CI6rSYMZsmrWm5nd
         etWIiprtZRZ2DXiDsTbEfghAsmzZK2Rk8zf68S3N2ey6Hmvd1oNd0DIJxt1UwRk4c9Cr
         FDuTVaKNBhBSNHv1H2bPIYS2F6gbwGV9NQYs7vrqHzMAoT+K5zJVlwO1GHTHx3E7xY9/
         eiStTukCnFFTnXAp1yJWTPvqsLweZyWNvbO1HpEpgdUZ9t7lvutVbAjIFd3h6clPpw9n
         HR0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775513719; x=1776118519;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=02dDT3p0oSM/9iWT2t0FBvQLm+GhMjic1M+LQuehhyw=;
        b=DaAdpg3YkxmfUt93o6tFy+VD8vyoeRzLtfMMEQxdgemOqr6aAoHSMckwon+9UdxiqO
         uhD7T0jIbSBUvvtDp2kaPdthJDKLkx5hE9mDfkRbkQsIFnvleqIQCjJPjDhj6icjZZEw
         VNJIS6pNJXbFdL5vlICvdzb9Wwig0mYFEdrkUuXe7vlca09bdUYg5+ROUeFXaWflzzFT
         lRd+0zZznNdGNsczFmAWXCjRrwC4N6zm+I9wdmiUmwreApdd2DD0VIng2MxXrTYRyNON
         n2WNkVRRoA+MdOFydObDKr8FOzWqxO39nkbjRUgjYkbYAo6DD1K0FVHeP6MloyQAx/7H
         Bz7g==
X-Gm-Message-State: AOJu0Yw1E4PyEtwjgym7O7qHH+ktTzBEku3ooP5uSu+qqIkvQ64KOcdh
	RHHGoHqoSnB0naeNGbXEau3BJgvmOgca5mvBIZjQw9zKXry9FPXRA33Yn0iE1JGMyeM+Yv9DE5n
	zOzxmf15os7+bxdg77TECkeuVS1JZX2Dijey+iMzu4FXKy2/I3y6OS/5GPnN3QScevD5U
X-Gm-Gg: AeBDietFqO15PXTcCPNwl/cm5DP8cgaI6enp/DVse0158U9gPKcDId94X5lLHDq3qFz
	ceJoWxNfXVzUGcPkvnLWTWrLZD3PDmU1qbU36z8/Y9AmzWFZyOBJADZSF9DlEPE6zh9dozEjN6y
	Ved84qOQttADPeOuKR4oXeDbpY8mYN3jkFBnYB+jdh6zGWgAdbHVvNq8XDP/MF3qNkDAsWxhS0u
	QLw/UaL9r7u5xNZLPqE/jPkjSdoED8sI1YsXZz+cs33ZKfQfyfakXuruqDctuhtyNhmqei6uMD6
	bDct+Vu9m++rPO0GQGSJE6Su08CgOm6utHDERhyPAcl0HQK8xwYhRgohrdVuLplYoIBuY9f/Cn8
	9xXv2+vGltmjQXV7CDTw3/Hl/1J3eHVng2CqL59x4CtZVjApydEk=
X-Received: by 2002:a17:90a:e7c1:b0:35b:928e:ae67 with SMTP id 98e67ed59e1d1-35de697ecc7mr13665458a91.26.1775513719240;
        Mon, 06 Apr 2026 15:15:19 -0700 (PDT)
X-Received: by 2002:a17:90a:e7c1:b0:35b:928e:ae67 with SMTP id 98e67ed59e1d1-35de697ecc7mr13665417a91.26.1775513718559;
        Mon, 06 Apr 2026 15:15:18 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dd35e34f9sm14447519a91.1.2026.04.06.15.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 15:15:17 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Subject: [PATCH 0/4] regulator: qcom-rpmh: Support RPMH address reads and
 use it for rpmh-regulators
Date: Tue, 07 Apr 2026 03:44:57 +0530
Message-Id: <20260407-read-rpmh-v3-v1-0-27db2a56b13e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGEw1GkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEwNz3aLUxBTdooLcDN0yY10LI0NDC4vUxFQDYwMloJaCotS0zAqwcdG
 xtbUA/xZ0IV4AAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775513714; l=5181;
 i=kamal.wadhwa@oss.qualcomm.com; s=20260406; h=from:subject:message-id;
 bh=7by8FKHHh0QQjSP3e1hRdT4TaCixOsAvKzPTNnU3Fak=;
 b=wW70wufEWhDAnl0T4lzdWausrnYE+qzJU6UUtOQ5SkXUmipAh8D8F5feD95WoAh1ID3jjuXvB
 D42ImB7B+UfDW/4LZw/YWyY3wBBQlSCVNrfN9HsT87qva+84u41D7Rj
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=ylH1NxUZkBpYsmww89g6zVxpS0q8qthtzcORkYxn/Ag=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDIxOSBTYWx0ZWRfX+fb7o1sQMefN
 46cx9cmNgMiQafm3/Gfm9WYY0INJyYcH8KUbjH95iIU3m0eSPCYPDGU3gzt3DsBrYScM8q614dy
 9AEd8CRTtLhabAQD90FiGBDHUrQ6TbVd1VCmem7msmvxXAP7jL9OyG0sC3evNIBx2iMLxW5zhoM
 BzctAIHt9A3iJ1PL3SWJY64xFuUgCmvlnCnM/WjimQUEAVjyhBp8YLf4i6s4Vnq5sx+2rYHXB2i
 05mdjCTrZBom6CqJcKOzb16QfTxtQ5SK9SD7qLkJMInRzot7sZFReBe1J2GAkVl9uufNz3X+AVC
 vbXV483nP5S8c4TbLVXNcr9ZSPPpMLjYDSMcByJltp1LbdCzWbJL1uSFmtywVZ7vLxoRbmBXCNF
 1tBleocRQyx9JNZjkxKv7GS4sl6NcIuQpkfZxP6/nmZh8hz4vp5VLemkqmTN4yEejor4RpiLUmX
 +YX6Q/oAx4rybMKdrUw==
X-Proofpoint-GUID: WRJcKSU3pozmxPA5hPFk6lcYkfAo99KY
X-Authority-Analysis: v=2.4 cv=XPUAjwhE c=1 sm=1 tr=0 ts=69d43078 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SNdnmcxNzcEaFLWHHzMA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: WRJcKSU3pozmxPA5hPFk6lcYkfAo99KY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604060219
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102015-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kamal.wadhwa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 95FCE3A7CB0
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
to do that series seperately. But after the discussion decided to merge
the 2 series as it seemed this would be a better approach. But after
working on sync_state change. I realized a basic issue with using
sync_state() for regulators - that its per-driver and not per-regulator
resource. But we needed a sync_state callback for each regulator seperately.

I had been experimenting with few ideas but seems its going to need more
time for me to close on the eqvivalent solution that has per-regulator
sync_state or something to that effect. So I thought to close on this 
series and attend to that seperately.

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
- Link to v2: https://lore.kernel.org/all/20251022-add-rpmh-read-support-v2-0-5c7a8e4df601@oss.qualcomm.com/

Changes in v2:
- Fixed the BOB bypass mode handling (existing issue in current driver).
  This was needed for `get_status()` implementation.
- Implemented `get_status()` callback.
- Callbacks for `is_enabled()` & `get_mode()` will now be used as-is
  ie. v1 changes reverted.
- Bootstapped the read values for `mode` and `status` in probe, based on
  comments recieved from reviewer.
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


