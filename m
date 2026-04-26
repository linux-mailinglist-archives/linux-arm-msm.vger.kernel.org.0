Return-Path: <linux-arm-msm+bounces-104551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OByPIafe7WkzoQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Apr 2026 11:45:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 223574694E2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Apr 2026 11:45:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A6303011855
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Apr 2026 09:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AA09344DAA;
	Sun, 26 Apr 2026 09:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lRMESk1f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gSnPxNx7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EFB31F9B8
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 09:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777196704; cv=none; b=ZFljd0tya0QuboxBk9xhC5Z4+Lrv/6PIYZ5urXbuhc1oqvKz8GW22WR7wBmg00pDC0xhU73Xs0sVNzXW/9T4a8S1xZevh6F10qGCH2f/kcbwTXPFHh02jwcw5ri+nr6JgYKDIy+uPFuOmB3Gs/WoSgzNk5A1+iB2GGzKK9KgKqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777196704; c=relaxed/simple;
	bh=LN6QvXIfvlOgF3WeZb3Zw7L625TymMXRS8Ovh3/G4F4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dzPCCSvzDoWzqly4tzKMrGMY2hGBSK2YIHtIpACgpIT41EK3qLaK9JwIer5jxQ7Unk5f9sQ6xEyolYXCaeTArhdz/ulVtozvKFnEvcy8wokF83twsA39yV+s0d/6pBi149vi9iexPiJRpPvWRGKjSJWxPcXo+/m219Y1EEfIPdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lRMESk1f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gSnPxNx7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63PNNOjE795924
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 09:45:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=G7b/uBqzuEMI+mgDq4jUHq
	r7P2xYSFrOTGRJ9hQrPFg=; b=lRMESk1f7Ww0HSI50a3aCLGVSAzJxl7SQPVAiQ
	te6QhHuoyGJ4xJsFWyAaX72MizRC+TVOw5Tm5NaF9T8Z4ypGFzKaLQy2rLED0MkG
	f1uDUei2o9UtC7QkNQjqYe8eeSXawLc/tnseXVU/lGchG2wt+b58DARzxB8WZQiY
	PCSkCOF8i2hCOFFiFnLDpTj1Kj3ENCejn/rJPNzxfua6SgAr/0rjV6C/B98u93LH
	VjZLaCff8OPTjsnsLWR04tvBP+QM661ZqZ47Q5xCrFPr1WHsmNkOmshw8sgy1AYu
	rPJMFSpoE03sMFL/x/r2ks+hmPrXtWkl6xLSpolsgzkUraxA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drpcdjhw1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 09:45:00 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b461b36990so98367185ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 02:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777196700; x=1777801500; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G7b/uBqzuEMI+mgDq4jUHqr7P2xYSFrOTGRJ9hQrPFg=;
        b=gSnPxNx7lmxVXNnS0SaDFrftSASX0HSBKT624+oYM3xrwyT6jvIPTazqZ6E0o5P1WU
         RZtEVkne8vWyY78wk4zarqRe1KZlPgc0rD47gVRc+LhiWewbHuowIEgLHiMDLB4vSeZj
         T83oLQtajU4p8RRRcM1qRGtBaZr34pAW38rQpz8zc6jqK4J4ZFGcI6zMeM0mAmyeCwjQ
         hUQJJ/NybwvYOHFFr+yDpdwjQ6JnHPQxSiQiLTEvASC3ICUL94eCY+wxOvDizClsXo9o
         /ggPoTv21JAOaF8NWOzjOSCeX7Xn0hiAIZJSImBH2PIzSe6F9xufP1SBeSKRZUvYOZtb
         i1jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777196700; x=1777801500;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G7b/uBqzuEMI+mgDq4jUHqr7P2xYSFrOTGRJ9hQrPFg=;
        b=NUGdtFhK4ZxEw6DTRp4G5dL0u3/Kuuyeh0xbhzEk3sHWZCUnsEgZ1nh1BW1N2bKMCc
         7wYQbkDaR1RFTcej5NyKYPj3hy7TJNH7X0vmkJB5FdsDCrQi19oO9kuNED5n+VWLjGK0
         +Vilrj1RZcEgCv58948X+nES66bjhl89ieAImojNtHUfX9vsBL78se723ovnh5co6wka
         D7faDdhvLYIBr8QfvVu6m0k+ydG+952ToOLofBcChLtnpZItbKdCpHqFnqJgBwrovUyL
         5MNT0Mzb4K3KynP933XegdktMX+r8ILPGHKBZlC4gbPmnDc2nA1Kb9jDsGiV5XKOW0xH
         +ePw==
X-Forwarded-Encrypted: i=1; AFNElJ/DLpPvvVqSLVLhR5aZfEks3pB8AAHwjCCj/jom7RfK9vTNgHucOGVTTAH58BO0bpXx3e7upomOHG7T0Fz+@vger.kernel.org
X-Gm-Message-State: AOJu0YzpY6Tppx9nJisoI5RHXmhh5le36bsHXOqzoxKBMT2Da5tNi6hJ
	1BNtEQFE7vmP/qX0O8H6rbTwq22ms5TkEmjzYEgwMu8WOyF4HL2zjlyTjE2OokPcA4GJ1SfTVcS
	gwhQSMAe2f7cXx7dQyRXJMqCb2EPhPgoo6bcfHoAR0ORtOXejZqzFq6Xtwez/ZNKmgJnN
X-Gm-Gg: AeBDievjny8lmeCuzg4fhhlSR3ehdPYgcJTtP6FhBGYJxyGUftyEc8WqG+4IOaZfQLu
	oIeSqhvCohIDX/QNcjY5GltkdX3AulC6iatmkmh5/R9miH2jQN2gtFZb3yaBw6UXM2CNwsvaMbZ
	vdWdHgH2U6dm/m2lNykLYRPG/P0UEfyTQA28tqVTBdGJ+z7fb0C+hvx4IGfPUXBInJNmDgpU7Hd
	DgQgxmzWPRh12MGTAa7VA42R9HLTWrxOarOF4la7qvPqu7S2F3BWrjCGfi01L+Me4D6J+YMfptn
	Zh+64xsUkgMZynWzPkzef809bgePYLqeaXH0cU7bkaaW7lovWL1EofSovYZS74leoKsSiYxA31m
	ER0DEBq8qQ+t9MJCcWrbzgNFOQpI+mT/512j1ogkofToMc8UqeGDu7LsE7lNAeDXR9RgFDZ7avX
	FeSbSTPrkWg1MsfePu/yFClXVs
X-Received: by 2002:a17:902:ce0a:b0:2b0:af2f:b27a with SMTP id d9443c01a7336-2b5f9ec3590mr377638585ad.11.1777196699631;
        Sun, 26 Apr 2026 02:44:59 -0700 (PDT)
X-Received: by 2002:a17:902:ce0a:b0:2b0:af2f:b27a with SMTP id d9443c01a7336-2b5f9ec3590mr377638395ad.11.1777196699121;
        Sun, 26 Apr 2026 02:44:59 -0700 (PDT)
Received: from jinlmao-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab208d4sm294960905ad.55.2026.04.26.02.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 02:44:58 -0700 (PDT)
From: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Subject: [PATCH v8 0/4] Add Qualcomm extended CTI support
Date: Sun, 26 Apr 2026 17:44:37 +0800
Message-Id: <20260426-extended-cti-v8-0-23b900a4902f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIXe7WkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyLHQUlJIzE
 vPSU3UzU4B8JSMDIzMDEyMz3dSKktS8lNQU3eSSTF1jozRzI4s0S+PkpEQloJaCotS0zAqwcdG
 xtbUAjYp5RF4AAAA=
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_yingdeng@quicinc.com, Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Yingchao Deng <yingchao.deng@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777196695; l=4590;
 i=yingchao.deng@oss.qualcomm.com; s=20260426; h=from:subject:message-id;
 bh=LN6QvXIfvlOgF3WeZb3Zw7L625TymMXRS8Ovh3/G4F4=;
 b=U/EqHGBz5VvyOajPDJxSXuOSybQ5pe4QqkMyjVAKzteU1fjyXJHIcOZNVEe4TWj0oOBWKIGIZ
 YAQhD4VLlDUCqKtlzEchAPPnwMAF8SGAzQqh0AGKsP48BPyRIsEE88m
X-Developer-Key: i=yingchao.deng@oss.qualcomm.com; a=ed25519;
 pk=aufKZC4I8k2lqi+B/z87rB5kPPybOn8C3mLosbtw+no=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI2MDEwMyBTYWx0ZWRfX7BkACxzk5e8J
 TSarajiZjoo9GEn9LLaho5/ghgZBNFPVQ10yhKOYkAGRo+XsydjxHQxUI0jjrmKFOS4ctcJi8sF
 qrfdY2ueVnlJ+6Ve+E9jEXSxRMoOmOOkkF9r7HOkZvPii9giRdGFiI5I9MLxLcJ7V/TkTXm+zrW
 EO5WeYK+FmsCSMqSKQVTFWui++sbI1yTKQYRsCQH2O0EFk4ac4mGdhIs8q9JgQuFsGTyU+g9B25
 BMw8tOfKBJpzHg/GkeA8mvUBLXgrrP1qk46XTj/UQtWKSb7beRnnEFZAHpGoBRTThpcpXmYtCje
 ZAxzQVGJWky4E7o+fLrG3Xbe1K6hWHLy1ugTii5ygruHRdKfCTFoYXY2WMCnG9C0m4L3+DM8nfR
 5tvVq7ygJTN/7EfjTRAWpa2h1GYkxwFiE84zTmX7gkcbAH75RiFeG2FIhmXs+w4yYag/W+2AxGO
 wTvrDG5aanEI1fhSatQ==
X-Authority-Analysis: v=2.4 cv=N5IZ0W9B c=1 sm=1 tr=0 ts=69edde9c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=ivfPcWm90DfOTC_Zvf4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: wGs2u8p-w6OXpIqElwkrHokqk7edDRgg
X-Proofpoint-GUID: wGs2u8p-w6OXpIqElwkrHokqk7edDRgg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604260103
X-Rspamd-Queue-Id: 223574694E2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-104551-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yingchao.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

The Qualcomm extended CTI is a heavily parameterized version of ARM’s
CSCTI. It allows a debugger to send to trigger events to a processor or to
send a trigger event to one or more processors when a trigger event occurs
on another processor on the same SoC, or even between SoCs.

Qualcomm extended CTI supports up to 128 triggers. And some of the register
offsets are changed.

The commands to configure CTI triggers are the same as ARM's CTI.

Prerequisites:
   This series depends on the following CoreSight fix:
   [PATCH v2 1/1] coresight: fix issue where coresight component has no claimtags
Link: https://lore.kernel.org/all/20251027223545.2801-2-mike.leach@linaro.org/

Changes in v8:
1. Rebased on top of linux-next-20260424.
2. patch 1: Use devm_bitmap_zalloc() with nr_trig_max instead of per-connection
   signal counts; add bitmap_zalloc() for filter trigger group.
3. patch 2: Add #include <linux/bitfield.h>; move CTIINOUTEN_MAX expansion
   to patch3.
4. patch 3: wrap CLAIMSET clear with CS_UNLOCK/CS_LOCK; move CTIINOUTEN_MAX
   to 128 here with comment; fix macro alignment in qcom-cti.h.
5. patch 4: Make qcom_suffix_registers[] static.

Changes in v7:
1. Split the extended CTI support into smaller, logically independent
   patches to improve reviewability.
2. Removed the dual offset-array based register access used in v6 for
   standard and Qualcomm CTIs. Register addressing is now unified through
   a single code path by encoding the register index together with the base
   offset and applying variant-specific translation at the final MMIO
   access point. 
3. Removed ext_reg_sel, extend the CTI sysfs interface to expose banked 
   register instances on Qualcomm CTIs only. Numbered sysfs nodes are
   hidden on standard ARM CTIs, and on Qualcomm CTIs their visibility is
   derived from nr_trig_max (32 triggers per bank), ensuring that only
   registers backed by hardware are exposed.
Link to v6 - https://lore.kernel.org/all/20251202-extended_cti-v6-0-ab68bb15c4f5@oss.qualcomm.com/

Changes in v6:
1. Rename regs_idx to ext_reg_sel and add information in documentation
   file.
2. Reset CLAIMSET to zero for qcom-cti during probe.
3. Retrieve idx value under spinlock.
4. Use yearless copyright for qcom-cti.h.
Link to v5 - https://lore.kernel.org/all/20251020-extended_cti-v5-0-6f193da2d467@oss.qualcomm.com/

Changes in v5:
1. Move common part in qcom-cti.h to coresight-cti.h.
2. Convert trigger usage fields to dynamic bitmaps and arrays.
3. Fix holes in struct cti_config to save some space.
4. Revert the previous changes related to the claim tag in
   cti_enable/disable_hw.
Link to v4 - https://lore.kernel.org/linux-arm-msm/20250902-extended_cti-v4-1-7677de04b416@oss.qualcomm.com/

Changes in v4:
1. Read the DEVARCH registers to identify Qualcomm CTI.
2. Add a reg_idx node, and refactor the coresight_cti_reg_show() and
coresight_cti_reg_store() functions accordingly.
3. The register offsets specific to Qualcomm CTI are moved to qcom_cti.h.
Link to v3 - https://lore.kernel.org/linux-arm-msm/20250722081405.2947294-1-quic_jinlmao@quicinc.com/

Changes in v3:
1. Rename is_extended_cti() to of_is_extended_cti().
2. Add the missing 'i' when write the CTI trigger registers.
3. Convert the multi-line output in sysfs to single line.
4. Initialize offset arrays using designated initializer.
Link to V2 - https://lore.kernel.org/all/20250429071841.1158315-3-quic_jinlmao@quicinc.com/

Changes in V2:
1. Add enum for compatible items.
2. Move offset arrays to coresight-cti-core

Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
---
Yingchao Deng (4):
      coresight: cti: Convert trigger usage fields to dynamic bitmaps and arrays
      coresight: cti: encode trigger register index in register offsets
      coresight: cti: add Qualcomm extended CTI identification and quirks
      coresight: cti: expose banked sysfs registers for Qualcomm extended CTI

 drivers/hwtracing/coresight/coresight-cti-core.c   | 118 ++++++++++++++++-----
 .../hwtracing/coresight/coresight-cti-platform.c   |  26 +++--
 drivers/hwtracing/coresight/coresight-cti-sysfs.c  |  76 +++++++++++--
 drivers/hwtracing/coresight/coresight-cti.h        |  32 ++++--
 drivers/hwtracing/coresight/qcom-cti.h             |  65 ++++++++++++
 5 files changed, 265 insertions(+), 52 deletions(-)
---
base-commit: 8594d92c94a3624acf07acf634a5e73a8c8f63e2
change-id: 20260426-extended-cti-32f728f93cba

Best regards,
-- 
Yingchao Deng <yingchao.deng@oss.qualcomm.com>


