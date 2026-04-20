Return-Path: <linux-arm-msm+bounces-103801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAfxEthc5mmtvAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 19:05:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AC79A43084F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 19:05:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 949D1336DE3E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 15:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A808336885;
	Mon, 20 Apr 2026 15:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l16zQjzO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uw6CfgUk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B2F26F29B
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 15:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776699830; cv=none; b=cpPvTXXE0WTNRGSjWmuRpuPvunRzfjXfAq790aSemEFsvTADAO8oQmQFOHZx8fMvcBW+wBvcJGhqID53oQLFndM7mZYEwmR1VDOdBvZyXi6AHCc97PTifqh3oUMlql2P1rlit7drA695UJJ56+B1GSVx7kPZ2XX8BIZvoDbSApE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776699830; c=relaxed/simple;
	bh=4AuxDlWlgcWrLJXuQ3OvZHkxAChm44K+7KqbZEZ/a6Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=asvyt40tk0fi7hxrPpLnVAEYUHSUqKRtHBQwrLunoGolmuYdtBwklH7VWY+3KM9rPyg9u/Y8gfYpp3wCvKM8J0YO76AjGcb1Ab40/ueBv2SMK34VZgb+9fPCv0v3sdlbv11Spsa9YdjDSnQNEK0bkBITDCoZ/fAnYErLpyeTObc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l16zQjzO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uw6CfgUk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K9JHVd785847
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 15:43:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9s8IZR8x8iIwRMFWSbVbIE
	BtmUdF9dsrLvPfvjsP6zc=; b=l16zQjzOW+kgAes6im50BAJ15PBTKUQgMoKUsM
	0zmyqh94HqUGj44Oy5lyFngOnMlc6rmDHY09TiHamEOT9BulerEgbjDBI7QV9cyb
	MVpuQ9lo3GxXqewOuRbVuv9DYJKbbPB4ZnJFwBWIkjg8ibvg4JJKYgHY9ahzDFGD
	GAtrvGteLh8Q6FJrPeXuP3VJ7gV3jd8gIdyn+q3Jdven6iVoYcVCUuwln7jZLbu9
	LCED6EWtPeghyNZZR9/TlFpa3qla4w8vl3xWSL7eW6iNMRD+TlW4wDPs61QT1laK
	AOsbjJRXHcPzOfCbLTUMMWFa+Igwq/ZzBAH8y6ziBkWKtShQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnhdhhc8e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 15:43:47 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f9429f49cso3337508b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 08:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776699827; x=1777304627; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9s8IZR8x8iIwRMFWSbVbIEBtmUdF9dsrLvPfvjsP6zc=;
        b=Uw6CfgUkLrQy3DPG6nHYJwCZWC7A0NXm/HrXpRF/VyT4XklBxF6VCUPZUzajUyGHEf
         gdkhkPAsIVA4JrE/ncYU9LVj4pn6QsnF77FeDbE8JnZK1rRvQCjx9YWC8gZdF51t2su2
         Pv7eu7BJLFj9FTSUjyZa1WS+FszoDp3PnUQVfs1dP8aJ1aLtLCv8ROpOfdq8qZN4BmtG
         5uUlTudxhv+pbYnXReAbrDFrij5jIKrprIO3Hx+TRQ+Jk4nIP5ygkO3tfgfslNy7ZXTC
         v9InTOCDxT4U9xlEgG0tVL2G7/5oyfTgeiri2Er6kD/AR5jWqOpOkP8/h0y3+UINjah5
         vDJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776699827; x=1777304627;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9s8IZR8x8iIwRMFWSbVbIEBtmUdF9dsrLvPfvjsP6zc=;
        b=X5HAAgoKv3MRwNwJHg72l5ctmHLaU9o1sGIlmsbBveK1RjKFXDPrUnX5Cffx1dDRXx
         JlOQK+eEm2gH0WiFrb4F3+PkkaXFUtsaxPOZytuSmo6B7FmnKkpP6C/6tPjQE0SWyo8z
         LRfsaUSJ4nN3wtxvEphSsKWoXi70IKoDnFoSyQfN5mOw+puB+eI96G4mULREacZ9vAtO
         w9dmsiK9MDkkCmY5yNLiORtosoN6xJ9fFUaIP+uitj2Ph1bZKUUBQzpqlhKgitM5gAZf
         Ab+pcAhiIu8IZSDfjvh5OasrSZRKggcBiZ4u4s4djDy8EPSqzbv9a/dEQHA+uSMEyM2i
         kKog==
X-Gm-Message-State: AOJu0Yy4J33V6eyNLj11K6LGpIVeWNsDX09EGyYLF9ij5KI6l0zHQ73M
	dQMSBqvOvdxXOzY7/3zm3Cew+36SYup2DC3oYCyDZ6sz9EVxUQHYiZets23Z4Sm7JJo0EIJyVBn
	Db94hwR7qu68M5IHPRQufTH+B75F2ky5ecE+nHYsC4dGA5WfZj4Nz4H4NqAFAMr94ER3K
X-Gm-Gg: AeBDietFonMVg7bIDeqxRVmle8hPJujSc+IHWz6f54GCICRyPVg+pyvn37X19cU+QZa
	fx3Zzu5iopHS2zsjJUTsNTzuT8bU2AXYfFxOLtr3IrYn0GIdzFpG7pY/EXkrSq9zIDhiypyoRNi
	lOLScqfc6zfvoUCQzmDDfhkTi8BhDWXwZbbPHYT1a8lT93XELvkbKiQPSyD11vW3ArU5Dzwycnq
	FGNICOJX2bo9UFUBQSJNpdAMJ8Jbt0eRrK1XhivqZaMoT6WTxGR0W5VAsfnCukw0dy2Gd++W1tk
	w8EazWEnee2SZ6LgqVoTov6iFbDzE3HCJPDtQgedTxBBDBi6E2g/RKrJPk/6bwV05uJVKUnVsA9
	f99Ts0LZkDIe4xIBVVIm2Mu+wPf5FUfADDZtlXm2vvsABvH5m+QZoosvTyo3Oww==
X-Received: by 2002:a05:6a00:4b54:b0:82f:6e39:d90f with SMTP id d2e1a72fcca58-82f8c93d102mr13982324b3a.39.1776699826854;
        Mon, 20 Apr 2026 08:43:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b54:b0:82f:6e39:d90f with SMTP id d2e1a72fcca58-82f8c93d102mr13982284b3a.39.1776699826102;
        Mon, 20 Apr 2026 08:43:46 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9cbb28sm10533230b3a.13.2026.04.20.08.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 08:43:45 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Subject: [PATCH v4 0/4] regulator: qcom-rpmh: Support RPMH address reads
 and use it for rpmh-regulators
Date: Mon, 20 Apr 2026 21:13:37 +0530
Message-Id: <20260420-read-rpmh-v3-v4-0-70c152e6c958@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKlJ5mkC/x3MMQqAMAxA0atIZgNpK1q8ijgUjZrBWlIQQXp3i
 +Mb/n8hswpnGJsXlG/JcsWKrm1gOULcGWWtBku2p44GVA4rajoPvB16a4z3HJgcQU2S8ibPv5v
 mUj55yfvGXgAAAA==
X-Change-ID: 20260407-read-rpmh-v3-821188eae030
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776699822; l=5609;
 i=kamal.wadhwa@oss.qualcomm.com; s=20260406; h=from:subject:message-id;
 bh=4AuxDlWlgcWrLJXuQ3OvZHkxAChm44K+7KqbZEZ/a6Y=;
 b=bM4KyQ9fG3P0Bwl+cAL+X7R2EV1iI8ErxqKRxO5HY74b8G9VDP5Wl55H2fOfCXih/ldQCnpgU
 wRwcy4Ip3o1BzkZaF0twpLTZy324Ki1XmBnAg6vpxK4/UlOs49iyQnX
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=ylH1NxUZkBpYsmww89g6zVxpS0q8qthtzcORkYxn/Ag=
X-Proofpoint-ORIG-GUID: gM3u7BMslwSP7ynKgQClYLvdk8VopwXk
X-Authority-Analysis: v=2.4 cv=IMgyzAvG c=1 sm=1 tr=0 ts=69e649b3 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SNdnmcxNzcEaFLWHHzMA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: gM3u7BMslwSP7ynKgQClYLvdk8VopwXk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE1MiBTYWx0ZWRfX8XFC/P1H/pwU
 wAK4k2Sw7E6HG0qBBzpz/DmXCNrDJy+iKNS3zCLzOEPEzq8IXcyjZPVDmQn9vClEHIl8GDcp6cp
 8OtKX0/qQSXZ85pIGK4HnzmvlOzqRYiJESkNA8Up12t5rjEayY1lGpkDNdWLkg6vOFwUi3JBiZv
 0hZnBscZvUgnqmb63M1dJ0+khVsYQW8FqTwMyNGII0ZC4TeWj0364FSN3a/DxlbUxruMjP0deJW
 J1DrWSJE5I1kQkBuKbCgIYKlTCLReS7REjke7U+YIen24Z7h8sC927sHJCtTYKQLzDeos9OUgcW
 47Nb86g/KsZ7YXWWWebZgqZpMM+josuTLAK8DjTZZyWkrR7Hd6ihm4BQjgVRHl5x5LhXqoTE1TH
 +EZFVtc9htP+dLQ6l5gCTjy8Kl4/mxHEF2RkwDN/QjZf3yBfta4RPQynXQQm/94gwMlinYB5/cL
 FW81x+ge7c90M4KSnPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200152
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-103801-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,checkpatch.pl:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AC79A43084F
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
Changes in v4:
- Modified the register mask macros to use  GENMASK()/BIT() instead of
  numbers as suggested by reviewer.
- Removed the unreachable code in the determine_initial_status() for XOB
  type regulators status update logic as suggested by reviewer.
- Link to v3: https://lore.kernel.org/all/20260407-read-rpmh-v3-v3-0-34079f92691c@oss.qualcomm.com/

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

 drivers/regulator/qcom-rpmh-regulator.c | 187 +++++++++++++++++++++++++++++++-
 drivers/soc/qcom/rpmh-rsc.c             |  13 ++-
 drivers/soc/qcom/rpmh.c                 |  47 +++++++-
 include/soc/qcom/rpmh.h                 |   5 +
 include/soc/qcom/tcs.h                  |   2 +
 5 files changed, 246 insertions(+), 8 deletions(-)
---
base-commit: bd0f139e5fc11182777b81cefc3893ea508544ec
change-id: 20260407-read-rpmh-v3-821188eae030

Best regards,
-- 
Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>


