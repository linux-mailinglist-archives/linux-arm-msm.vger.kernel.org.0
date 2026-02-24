Return-Path: <linux-arm-msm+bounces-93905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BKSIGVInWk7OQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 07:42:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEBE18280B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 07:42:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CBD6C3038FC5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 06:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FF1B3043CE;
	Tue, 24 Feb 2026 06:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lxTfATH1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G39ex8b2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21244303C87
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 06:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771915357; cv=none; b=TVwBnHRAr32xd79l6J/B/jgPUIa/6wPqw4gzshrW8QZDFipGuF7HvWtfAQZ82bq6j5l6Xt262Vd19CgSfN0Vk1qGsQXdQ5Czd1uXGVLxDr7sk4SOH+ODdC7bUNqcbikWF9vwKzpstvtkWxgQFtbelxQyIilrCJmTBeCkQGKuASE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771915357; c=relaxed/simple;
	bh=Jw70nQ2pWx78DAehwwjLkd9U4Fxq6Hvk/KBxbO3i8Nw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=o9+WtwaWgKqrBh/Xx6IDMBEN2A+K2yYbyV725x89VSofZy+xzS1xbfEvDZp9GKklKWMkpyqfcHcw5J6aKBEP8eeiaQbVcsPN3vrLquQx+8of+9JG3rqdyr5B+H9oXmvnC3cYRAZT11RtNdAp3e6qTjVn+LMUG7Z5kW9U+W78Zi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lxTfATH1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G39ex8b2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O4LlIY1523910
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 06:42:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xZAAuabXO+ebpI/L06kpcq
	moLw3HeoZEcOes+R118mQ=; b=lxTfATH1QO4rioQbj1OWqotJAiQ0bmgM7aXNLA
	FIdCol1kd8PECxBRmaPLudrNFRBzinwUoqrfIQV5N97xTtubCzVmvdaBi3SM6Jeu
	t709ck6wEO8XWmjaeyT9Xu2Lppg97scSlXDs6tOeXaiT78tTzoqxq7vZ/6LHdrfA
	wRD7sSDJnoYKecvk6vYIhs/FnazbMKO4j282n5Ll8zJqEaUoXVDayor+YakyDcEN
	VO1SU05EbaA2+TyVAPswIXEicYLTL9u/dfdqlrZxC7u6gJqtasbKtPfJiO2Hgt3G
	1RQeU2JiFhg3MNDVb349y0q9UwodsHnOuL3X5TzGSseLk02Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgtx0a1rg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 06:42:34 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-824ae2c9ff4so17862634b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 22:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771915354; x=1772520154; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xZAAuabXO+ebpI/L06kpcqmoLw3HeoZEcOes+R118mQ=;
        b=G39ex8b2AWRUKYbiZzVIwtHVwivMKKbNU7RCSwlCdTwQ3MFD/p2DmOVDF49jrqvI4f
         OCrwkE0MHW6UVNsC9SMe/URPWzcSqha+3pqrf9D8+GvJh4VgAVxMiA53dbcHvmyR/M4M
         WiUzetDQQe4YaaQov7Sg4mj06zcG9m1lD2bQP+VRYRoWttcSNL/8LhN1J/M1yus1cRUP
         tyiNC3L6FzZEqJfax4eBpP1Ti3frd5r1tvwELEi8/M2+giZ+c6jgw7ELhtRGiVLa3pil
         IgOPiJeQqXRgW50XoGFB/quQwjo5fXFs1kOq5VcoCmJ8UitpvfGrA8Po39Xdr8mboSVV
         EJ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771915354; x=1772520154;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xZAAuabXO+ebpI/L06kpcqmoLw3HeoZEcOes+R118mQ=;
        b=TzSv0uHZxe5zJrlnCcofzXoLuoNAtuxOwIsbgoP4chJvfd8WeDw3s+ZBQwgC4d+aHD
         bdxkSAjoXmpMchJO+xRH3jCjPcSDr1daMq6fZOtB3OROZfaTB8HvVgKji5qAvusSGQ1N
         ZnHAw8A/WUkdQ6ngnjfIlilTnXArjtA+9ZNgabZ2VSCEFvFy2S9A8wzPc16vbwUdSv/v
         GGX2T1lyG80FQmwONueo3+L20OTHf+oFstdGa7x3dS+g9MwbOLPFDnLzpVMpxDBReKgd
         TWkfcjnvtxEftChp7EUKeJxIE6/R8V5GU+74e4BsbWYAyZQA5b9aUakvz8LW/kw/Z/wm
         2ZiQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4dIiCZSquR/a3tcN3/H4TVx6S1OojCrO64gY48oxxThEEXoZ1o7CUEx6PWGPnSHusAsCoquJkoludj/5R@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmaq7/sLpDPn3b1d2hvrc1flPhJjwriqBUAt12f0x7dOTY0j+8
	VSITUU+QSv57DsJaX43/E0eB/IolGuYwHh6tvMf537zC2aJLEk1U3hhUm3Odpm9lal5yvpydPhc
	Jl1+iZX7Yto+cHouZeIKOEvQFwLzMrU+F2pexYrCoCyuvmuH66cK0ToylYmy1IJPFn3m5
X-Gm-Gg: ATEYQzxV3XcpbD+jX900iVU5dTYq6wbpvGJjvlIdUEenL9WH6ifFz9IfFV6A6CtjqtL
	6ECZ6xwZZLaAssgoceAlisYESWH8fFSysOuUg+YENmQQrEW5URp9z1zurO2pn5XAmPUbY6h9Sv6
	7bk5F8rHqmV5dWu5H6fxeFB3lQPsK8pXzFPogUFtuOPZwbWIDxryLPDPZjkH2fmorynDP3BCLrC
	sOyUJPZSoyUR/2VkTOc2TUrmbSrPhIoYTcPY47G5hcd0gbWGZouMMKxsZOCnbNkaoyWPxDwAbQm
	gLHrXPUoyL1d+Dx5tBxVZiMDnfzc7ecrLRg16YE9oQ/2WvTCn9uwMg2EKGUwR93uFoOYLEZn97Q
	4ZM21/JD2jQBpBbUJAn9citkU01pkRTuAIgeUvmbLpE9iZsZ9QT5Pus6lRg==
X-Received: by 2002:a05:6a00:92a5:b0:824:9362:30bb with SMTP id d2e1a72fcca58-826da8c0d80mr8742708b3a.9.1771915353573;
        Mon, 23 Feb 2026 22:42:33 -0800 (PST)
X-Received: by 2002:a05:6a00:92a5:b0:824:9362:30bb with SMTP id d2e1a72fcca58-826da8c0d80mr8742686b3a.9.1771915353012;
        Mon, 23 Feb 2026 22:42:33 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd8c7535sm11857732b3a.56.2026.02.23.22.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 22:42:32 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Subject: [PATCH v24 0/2] reboot-mode: Expose sysfs for registered reboot
 modes
Date: Tue, 24 Feb 2026 12:12:25 +0530
Message-Id: <20260224-next-15nov_expose_sysfs-v24-0-4ee5b49d5a06@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAFFInWkC/4XPwWrDMAwG4FcpPs9Flu3U7mnvMUaJLXs1rHEXd
 yGl5N3nFAY5LNlF8Av0SXqwEvoUCjvuHqwPQyopdzWgetkxf267j8AT1QZDQC2EaHgXxhsXusv
 DKYzXXMKp3Ess3AM5H4G0pZbV6WsfYhqf9Nt7zedUbrm/PzcNYu7+bw6CA5fuYAwE7RSE11zK/
 uu7/fT5ctnXwmZ6EHbhIW54toKKJOmDacmGNRBhAUpYBxEqKIw3EA0qQ7QGLj7GrQtxfhmVaoQ
 SUkcyayAuwcMGiDNIQksljWuFXQPlL9gAgt4AZQUdeO3Iexut+gOcpukHRPwxuVsCAAA=
X-Change-ID: 20251116-next-15nov_expose_sysfs-c0dbcf0d59da
To: Sebastian Reichel <sre@kernel.org>,
        Bartosz Golaszewski <bgolasze@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771915349; l=8439;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=Jw70nQ2pWx78DAehwwjLkd9U4Fxq6Hvk/KBxbO3i8Nw=;
 b=d52gzTgOnN2ppeKMr3DTlPAM82FSa0pn8081HiWOqmETLUNQ7QHb91QSsC/LyL/UecO/48pBl
 DXQ2pkAh+T6BjAMw7ySoib6EyiM2yz5u9yff4Fr5biVI8wl7XzzflKA
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: 8wzHrK_p8_OO1WEvLv57JkoXSV6oUTWN
X-Authority-Analysis: v=2.4 cv=euvSD4pX c=1 sm=1 tr=0 ts=699d485a cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=T0ZemuJZxWBMMyWWAwMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: 8wzHrK_p8_OO1WEvLv57JkoXSV6oUTWN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA1NiBTYWx0ZWRfX2mZOoHwupp06
 TmDWmLWuckoXUxupijylC9Sr7UNFz+Mh+axA5L4WT8Ws7HMJojTC81hvSWN1zkBsNskL8JYUDWI
 kM9+OIMBm09GVPsvIExdqfi74AEgEBWYWztwo+l3ginaOB0rRduKfMUmK9vUetJ87gsaHtd/gyY
 niYevsB62S+6ijpyzcENAFYcwok2kyTJRZcKn2VehnfvYA/gxV/HbHYMO08TDMFvZWEA9yPaWjW
 1JAmbAcXC9Ol6fLoIaQUk91CxEgiCg8UfOk0PcNN8FTbi6H3Lh40wwJ1UDKuGCl090vpBGaDPyS
 P4QnyUaJLrld5snsxT2b4TMwW2QqfBm5lzs81tH/tXffhnnCuQqAOyu6Hs2WnvxDykaTtAyDrhn
 nRCDQCzDA00QhNvxO60QmM2bLaQdS1xphKy5ModSoEeKCNsUDxiMBg2k0nZIZlTSz+0MMzkIzHx
 eNgsiT2vE62XepMsmrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602240056
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93905-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ECEBE18280B
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

Changes in v24:
By Bart:
 - Update reboot_mode_release_list parameter list to use priv instead of
   list_head. 
 - Remove extra newlines in reboot_mode_create_device.
- Carrying <RB> feedback from Bart on [PATCH 2/2].
- Link to v23: https://lore.kernel.org/r/20260205-next-15nov_expose_sysfs-v23-0-b0c5bdcc9f94@oss.qualcomm.com

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
 drivers/power/reset/reboot-mode.c                  | 150 ++++++++++++++++++++-
 2 files changed, 183 insertions(+), 3 deletions(-)
---
base-commit: 7ee58508f45cd0acb3ef1e5504d402f280ba57b5
change-id: 20251116-next-15nov_expose_sysfs-c0dbcf0d59da

Best regards,
-- 
Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>


