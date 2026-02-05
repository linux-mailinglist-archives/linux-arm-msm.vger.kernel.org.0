Return-Path: <linux-arm-msm+bounces-91959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4E84Fb/RhGk45QMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 18:22:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E607F5D6D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 18:22:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C983A300E380
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 17:17:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 722F52D8390;
	Thu,  5 Feb 2026 17:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D/CTSj3F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MrIPpdK4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CBE244675
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 17:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770311845; cv=none; b=qMvWntmvIJ+PkBSm2PpRf6kd24U2pPWWSala5mi5S0Z0z/2kzvlgprjh1BImOC3Lm0vpu/2DipbKqVq5Vf87sgbJcRwqMHRulNQJB4QaPE9o/SPp8rZVVS510/S+9bC8EpjGg6Pk0DMhXm+qWxK+ahUGuLm5FfVltuQOx1YFoJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770311845; c=relaxed/simple;
	bh=K144r1QcYaUaf6lM0Hg8pea1Gk9jEEcDfIdWTV1PaCc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=s+d+Jj06HoM51/B0JeBpO+f8xE3vazBQbCz6ScwWouTXp8ZoOxlzyLTcrBcmIEyLVay0gUf6nY/b0WvPz7nT5/jgjhi/DnpLF3HUR6YZXeTvYHlCXsMfJ07DoZJ+iineaMfmSLpGqiSjKP6Ys24eyZ6w0RE69L1w98ijrnRUefE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D/CTSj3F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MrIPpdK4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615B3voa176888
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 17:17:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rwZs5W1Dmc3JhU3Qpvqdpd
	zUsaI84HCBmwMhuhX+ceg=; b=D/CTSj3F5C1AExYpWjtoMkEUl6z5lOky7LNa4D
	RfQlL141R5ANsSmWM7oBTN4jh0pUs/y/9514+ywUSUSI2G6eRg0yItNj4i4eQOVc
	XHb7XSyDiyC755YRjBLuIZL3HR8NlZDhMt+CJGenvHjNkdg/VnIMbQKIWgPsq3d6
	rU3fVxF8/k3knrQhr+t7RJA+xwjNRxD091182VV+Awa6c+kUugKgMtLbVb4/Zcdr
	Ixro2MP+ieP/hZ7FzotpahILMkcvMMZ0EDvERHPM1z+69zUSFaJXmt+AB3/2r62S
	Sy1kjmugP2vY+Yjfk388typT4Ozj3qqGk32x3JYHUxBikcnA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4t0p15f2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 17:17:23 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a946c0e441so7834025ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 09:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770311843; x=1770916643; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rwZs5W1Dmc3JhU3QpvqdpdzUsaI84HCBmwMhuhX+ceg=;
        b=MrIPpdK4wfL3wJc61TWZ56/mpc0dleMYLx+TVCWDWZCZTvPu6oX1bRwu0zsKhcnFJg
         lBs/5UARuJKhGfL7bdV+Fxnksms3zCSovoFj2QrpNabLnbyDModV3pKNs77LTwGHSfYi
         iBf1NlFwH5ZJ9ZfwBv8SXTPxESprLNnhX3BQUmRfjX06zrq00wGxS/1aGMKpCTYyTxR4
         8RsyjDLpQchQTW2+yzyZh059SZSTpuj1BETKkCQYnYD3VhK9Fcw2k8qWXgS2PMbXYUfP
         RvDEX7uBzVOYL2hRT5pnHPvPXWSWFHs/sUElW8PnV4cuCZ3PSNX91uVyOh+H1SG9lvke
         VYng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770311843; x=1770916643;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rwZs5W1Dmc3JhU3QpvqdpdzUsaI84HCBmwMhuhX+ceg=;
        b=OwiWoUki22nMbg03Xtvv+wJatBLUil+24VtpAXJ5kztVRRHU3xHdPapP1qvx8D7ovP
         56MxldMw9wlyt1tuCmRKVIRzni+IxA8vYZ+edkW9GvHJTv0UX1FXP1MK5uIIV3rwiWCX
         Zj0bYjlqXRPxkzlI6c0qbXHkX8lP2ecrOTUjxSiDxvSDqHhjoEFB/nV+dJKkINByYZUv
         srd/LAR0m4arQsAdZwq1PTN3Ykw6u8ZlJZ51EPHDA3BcUJqxsRu+croiJPSDQTgkHU89
         2wE+BGOMcjm7+O7UtC+OPddp/F1ehXpnutSGyNtujX2N+HnkOoKAB4wH430TugLpSsj+
         rbqw==
X-Forwarded-Encrypted: i=1; AJvYcCW75AbrOTD8FM9HU9srwXpbltNBukQphKiRpwbJLggYax3Nrl1L7i8y1h6zzwb0lpjKunepifqemDI3AHkF@vger.kernel.org
X-Gm-Message-State: AOJu0YyVvc+mvcyR0gG5BK7itO1483/Qo/4slLgjClXse9z5KMFcJkil
	dVzSXoQYgeZf+bXt8Q3fMAP86EsGqIN8RUM1XLcbBQmWyPExhfr8S6PmLNgn/TDAeC3KBNC6H28
	ORz/t78ChCrHSQOpGhSIz8pxUBXDDt+1Njm72trKNEJtrj9TiIQx12yekuZlnFAZEHKjz
X-Gm-Gg: AZuq6aKE/5b+pgutzLJo6Tb8GjsjChbMGQ+hx7umGyaFrAhs45A6rdfSZ6fj4eq9lAh
	oOY6AcCFiRKUGejjMS40IAoH2L4TONMcZ0C9TuTk7Vkt84B201zHPh1WQrFV5a/suH6c7vf/RKi
	qfuuh5XC2LBEkdOH/GeZEURQ5cACUIrHks4WqQKh4B0w082079YqYGn4ErDxWJB1OiX/vh92CjR
	vu3Z7lLML97c98UUyiJbhmgsYz4s/0JbCS8AWmymIPP1jNnag0MAMtWSGzPvIWeIai3H/4orihJ
	9khmoAgwbFhd6tXosIDmFCYbaw/K5cnoZtRNgc7Q4M8NEPcFqj0lYUOc1QKbSux4tV3hq4RxChe
	pgT5p18B2vNz2466Su0bzIetNTt3RegUkxvVjeZlEfS1Teg==
X-Received: by 2002:a17:902:d543:b0:2a0:d662:7285 with SMTP id d9443c01a7336-2a9510db086mr547335ad.0.1770311842786;
        Thu, 05 Feb 2026 09:17:22 -0800 (PST)
X-Received: by 2002:a17:902:d543:b0:2a0:d662:7285 with SMTP id d9443c01a7336-2a9510db086mr546965ad.0.1770311842128;
        Thu, 05 Feb 2026 09:17:22 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a933966f12sm55059415ad.76.2026.02.05.09.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 09:17:21 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Subject: [PATCH v23 0/2] reboot-mode: Expose sysfs for registered reboot
 modes
Date: Thu, 05 Feb 2026 22:47:12 +0530
Message-Id: <20260205-next-15nov_expose_sysfs-v23-0-b0c5bdcc9f94@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJjQhGkC/4XPwWrDMAwG4FcpPs/Fku3G3mnvMUpJInk1rHEXt
 yGl5N3n9JTDkl0Ev0CfpKfI3EfO4n33FD0PMcfUlYD6bSfac919sYxUGgIVWgA4yI7HmwTbpeH
 E4zVlPuVHDlm2ipo2KLKealGmrz2HOL7oz2PJ55hvqX+8Ng0wd/83B5BK6qZyTrFtjOKPlPP+5
 15/t+ly2ZciZnoAv/AQNzxfQEOabOVq8rwGolqAWq2DqAoIrnUqODSOaA1cfIxbF+L8MhpzAAP
 aBnJrIC7BagPEGSSw2mjX1OD/AKdp+gVp7Ap9CgIAAA==
X-Change-ID: 20251116-next-15nov_expose_sysfs-c0dbcf0d59da
To: Sebastian Reichel <sre@kernel.org>,
        Bartosz Golaszewski <bgolasze@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770311838; l=8101;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=K144r1QcYaUaf6lM0Hg8pea1Gk9jEEcDfIdWTV1PaCc=;
 b=aRfXNf4phz6Z2qtv8f9s8jbLg653+sty6FxciSU5B8eKTB/8daRXAETcXBCg6ubxb71nKjErH
 eDPoTBu1rGNB7sJUqT1z9VvC4uBpmfL8/zQIohbRXLAXcv2EfhXh4Ju
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=ItITsb/g c=1 sm=1 tr=0 ts=6984d0a3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=sf54k3XGZVOQZVOLxCYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: LzyA34XIkqMvDhbKnOGdJT9lxhH4C_Ta
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDEzMSBTYWx0ZWRfXxSC5J0fN9M+W
 YR8nAkzEr7wnMtFx4dxHH6mp/dK/U+kA4etF188lyJOfwpXYseq0neu7nDAvrB2AmCjiiVHF3YH
 T2++rLcxagVrey3MxGCeeKIMFnfp9/a5+mgnVPKNzoEx281j+BYp9G0AKo4QxsNe1CpvP7CLb5Q
 Omd7A1xsZ9slfZhBTBjPa1m/v41rzU9tjTMg2ZI0ma3GOrFi845AS7Ys6vv5Xy0fWO3P1uJ3DEP
 FmzxFn47veXUxY7rtkv7pScOML/b3vvBXuKVbKcSZEEEwZBc0Kla0shokYz+CeQIogU5QMwKzlq
 9Y0898wDhOUT/rU8G5qkNM3+o2v8fZopFkyAWSHn1/AH2UARs3IYR4oSyBjjb5B1kvR2mEZ0zzM
 r4Xx5Alv8e/Uaj8tj6oPF2gbbagNLeyUIyvQiXR5QJ3Djza7ijAdiU2hPmN5yzQ9+hARlx+h1/U
 30xeICI1udwZKKLI/6A==
X-Proofpoint-GUID: LzyA34XIkqMvDhbKnOGdJT9lxhH4C_Ta
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_04,2026-02-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050131
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91959-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8E607F5D6D
X-Rspamd-Action: no action

The reboot-mode framework provides infrastructure for drivers that want
to implement a userspace reboot command interface. However, there is
currently no standardized way for userspace to discover the list of
supported commands at runtime. This series introduces a sysfs interface
in the reboot-mode framework to expose the list of supported reboot-mode
commands to userspace. This will enable userspace tools to query
available reboot modes using the sysfs interface.

Example:
  cat /sys/class/reboot-mode/<driver-name>/reboot_modes

The series consists of two patches:
  1. power: reset: reboot-mode: Expose sysfs for registered reboot_modes
  2. Documentation: ABI: Add sysfs-class-reboot-mode-reboot_modes

These patches were previously being reviewed as part of “vendor resets
for PSCI SYSTEM_RESET2”, until v17. Following the suggestions from
Bjorn, the reboot-mode sysfs patches have been split into a separate
series here, for focused discussions and better alignment.

Previous discussion on these patches:
https://lore.kernel.org/all/20251109-arm-psci-system_reset2-vendor-reboots-v17-5-46e085bca4cc@oss.qualcomm.com/
https://lore.kernel.org/all/20251109-arm-psci-system_reset2-vendor-reboots-v17-4-46e085bca4cc@oss.qualcomm.com/

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

Changes in v23:
By Bart:
- Renamed struct sysfs_data -> struct reboot_mode_sysfs_data.
- Moved definition of reboot_mode_driver from reboot_mode into
  reboot_mode_sysfs_data, making reboot_mode_driver a private member of
  the reboot-mode framework.
- Updated driver data handling to create an instance of
  reboot_mode_sysfs_data and store it as the driver data instead storing
  list->head as driver data.
- Introduced a common inline function to release the list, consolidating
  repeated cleanup logic.
- Modified cleanup path to use class_find_device to locate the instance of
  reboot_mode_driver for teardown.
For Alignment:
- Update commit text for reboot-mode.
- Update dates as TBD in ABI documentation.
- Use kzalloc_obj instead of kzalloc as per new kernel version.
- Link to v22: https://lore.kernel.org/r/20251227-next-15nov_expose_sysfs-v22-0-2d153438ba19@oss.qualcomm.com

Changes in v22:
By Bart:
 - Maintain separate struct for sysfs data which should be private to
   reboot-mode.
 - No need to have driver_name in reboot struct.

For Alignment:
 - Add a new function to store sysfs data and create device.
 - Move reboot-mode device creation call after parsing of modes in
   complete.
 - Free stored sysfs driver_data and device in unregister call.
 - Remove mutex lock as sysfs is created after modes are stored and
   device is unregistered before freeing the sysfs data.
- Link to v21: https://lore.kernel.org/r/20251222-next-15nov_expose_sysfs-v21-0-244614135fd8@oss.qualcomm.com

Changes in v21:
By Bart/ Bjorn:
 - Convert “reboot_mode_device” to a pointer and use device_create
   instead of register_device.
 - Return an error from reboot_mode_register, if device creation fails.

By Bart:
 - Use dev_get_drvdata to retrieve mode strings in reboot_modes_show.
 - Add mutex lock on list_add_tail in reboot_mode_register. This will
   synchronize addition of modes with sysfs access. This was omitted in
   previous patch as list additions was completed before sysfs creation.

For Alignment:
 - Remove: "#define pr_fmt(fmt)" – not needed.
 - Remove: Functions reboot_mode_register_device and reboot_mode_device_release.
   - device_create being a single call now, moved inline.
   - device_create handles device_release internally.
 - Directly call reboot_mode_unregister in “error” path of reboot_mode_register.
 - In reboot_mode_unregister:
   - Add a NULL check for "reboot_mode_device" pointer.
   - Move device_unregister towards end of function call and explicitly set
     reboot_mode_device as NULL.
- Link to v20: https://lore.kernel.org/r/20251130-next-15nov_expose_sysfs-v20-0-18c80f8248dd@oss.qualcomm.com

Changes in v20:
By Bart
 - Use device_is_registered() instead of maintaining an explicit variable
   for status of device_register.
 - class_unregister already maintains an internal check; remove explicit
   check on status of class_register.
 - Protect the reboot_mode_list with mutex lock in reboot_modes_show.
 - Remove explicit "#ifdef MODULE"; subsys_initcall is just fine.

For Alignment
 - Move reboot_mode_register_device after the reboot_mode list additions
   are completed in reboot_mode_register. This also avoids explicit
   device_unregister in error paths and need for a lock in addition.
 - reboot-mode list protected in reboot_mode_unregister against a lock
   in reboot_modes_show.
 - Unregister reboot_mode_device before deleting the list in
   reboot_mode_unregister.
 - Although, we want to continue irrespective of the status of reboot_mode
   device_register, add a check and pr_debug to avoid compiler warning.
- Link to v19: https://lore.kernel.org/r/20251122-next-15nov_expose_sysfs-v19-0-4d3d578ad9ee@oss.qualcomm.com

Changes in v19:
By Bart
 - Added subsys_initcall and moved class_register to initcall.

By Bjorn
 - Remove example of reboot SYSCALL from ABI documentation and mention
  about this being standard interface.

For Alignment
 - Added module_init/module_exit, in case reboot-mode is compiled as module.
 - Call class_unregister on module_exit.
 - Remove mutex lock on class_register as its not needed now.
 - Added a static bool reboot_mode_class_registered, to save the status of
   class registration.
 - Rename reboot_mode_create_device to reboot_mode_register_device.
    - Removed class_register as its moved to initcall.
 - Version correction for split series: Previous changed to v18.
 - Corrected Typo in Bjorn's Name in last change history.
- Link to v18: https://lore.kernel.org/r/20251116-next-15nov_expose_sysfs-v1-0-3b7880e5b40e@oss.qualcomm.com
  - *v18 was sent as v1 in last post.

Changes in v18:
By Bjorn
 - class is made static const and moved on the stack and registered
   using class_register.
 - Renamed name of class variable from rb_class to reboot_mode_class –
   Bart/ Bjorn
 - Renamed function name to prefix reboot_mode* to better align naming
   convention in reboot-mode.
 - Changed reboot_mode_device as static in reboot struct and registered
   using device_register.
 - Used dev_groups, instead of creating the sysfs attr file manually.
 - Continued the reboot-mode registration even if the sysfs creation
   fails at reboot_mode_create_device.
 - Used container of dev in show_reboot_modes to get the structure
   pointer of reboot.

By Bart
 -Synchronize class registration, as there may be race in this lazy
class_register.
 -Remove inversion kind of logic and align the return path of
show_reboot_modes

Other changes
 - reboot_dev is renamed to reboot_mode_device to align the naming
   conventions.
 - Keep a check on status of device_register with bool flag as
   device_unregister should be called only if the registration was
  successful.
 - Add a dummy function reboot_mode_device_release to avoid warn in
   driver unload path.
 - Date and version change in ABI documentation.
Link to v17:
https://lore.kernel.org/all/20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com

---
To: Sebastian Reichel <sre@kernel.org>
Cc: linux-kernel@vger.kernel.org
Cc: linux-pm@vger.kernel.org

---
Shivendra Pratap (2):
      Documentation: ABI: Add sysfs-class-reboot-mode-reboot_modes
      power: reset: reboot-mode: Expose sysfs for registered reboot_modes

 .../testing/sysfs-class-reboot-mode-reboot_modes   |  36 +++++
 drivers/power/reset/reboot-mode.c                  | 151 ++++++++++++++++++++-
 2 files changed, 184 insertions(+), 3 deletions(-)
---
base-commit: 9845cf73f7db6094c0d8419d6adb848028f4a921
change-id: 20251116-next-15nov_expose_sysfs-c0dbcf0d59da

Best regards,
-- 
Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>


