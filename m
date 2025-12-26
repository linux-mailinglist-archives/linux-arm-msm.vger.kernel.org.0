Return-Path: <linux-arm-msm+bounces-86668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAEDCDEEC3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 19:56:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D8331300180D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 18:56:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66BA9239562;
	Fri, 26 Dec 2025 18:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eKb70SvS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WPVcwJmf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B243A1E7E
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 18:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766775403; cv=none; b=eovU89OPc7P1l4bcAiEFz+ORkZ1h97hR/BjLo9uC17buNzfcpFlm7v12KoNRMN+lQzOkhHrGBb0rqZfkTSc9TQ58uez15RRVtir1dx/4t5k0edQtzKObQ43GStN++h2M+p7f018Zqo4uDqOimY76yvBVYDghtHsbnj+HDgj490I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766775403; c=relaxed/simple;
	bh=5XvvIjt0D+dddx9812MNw489cJDTO5rmJ22gWkniKlk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iMtQPdybe7j8qZrmvRh0kPEzJxguPjPQf4fr4pQyqgB/51MvCfdmWe4w1GfMzZlHvKWl0VddbdrTpC1wWFVBa2ble0fbA3U0Y/HiQM+frB1aX70JmNoLf1HZDuI0oFHeHV1s3j2x2W8fUpsA0r0TW2qNcDJG6iE3IXb9m3Ojy4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eKb70SvS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WPVcwJmf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BQ8c7j1756033
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 18:56:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BPwV9anYzgmN2iXiMbvYfF
	iFpY7ydF3Kd4Fw6EsFLcQ=; b=eKb70SvSl1ZBh3pL9xljD40BVj5o4g+/y6H8ml
	3gcJbp02NmYAsWJ70FcMgn9vw4DfzVqeO/mQdF5Lhw8KcoEXSuss5RZq/u03II2A
	c260EZnHIkSyB0qmMPD6o8eHj6Vl5v0bdunOxZicYAIJUUs4iF8Db0jwe1irq7V1
	21MXKugpfXno27aowwLAaaBsAd8A+B7Z+WomsX3y+f0V7oAvrXvlh9GNjmcvgzAA
	y6RquT4BPMlPppJBpkAF9X+h9peK/nguNRtK/6sXR8ziiGIs1gFm6zf0nNqGSqs8
	bin3jzV1k1KrG9i+0yWMbnlWP62Edx1esJxFG9owanYuxdtA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8kbuvjb3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 18:56:39 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7ba9c366057so18615126b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 10:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766775399; x=1767380199; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BPwV9anYzgmN2iXiMbvYfFiFpY7ydF3Kd4Fw6EsFLcQ=;
        b=WPVcwJmf7uJWRxPwF2wkm6v5Kv/QAp2h7qPLrtEx3RXF85+m+TjVBp/kJYUssT+B1F
         Z6Y0LMvTkXiJr4Snrm+Nbg69rg1NnmWaas4PhPzumsVxCREpEquS99DlsRg+oisfqmNL
         Yc3QWc9Cd6pUfq+yrEAGCz1eW/VhdDEybfmMWkGQBzGGML5pGkb39dF8ced9Qfmbm/Wl
         jP68nZuwaCQl7/Nu4mlVLXPmOBQQ2OMCDbI29tTge9beDPeN/53pUPccEX8fjEWCVKBG
         gBPTnrIeCHJa6KeyTN/V8v63srsiNPuHJ9BhzjGBO2nFPrILmheZRBfp53tgoc3j2so4
         6h3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766775399; x=1767380199;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BPwV9anYzgmN2iXiMbvYfFiFpY7ydF3Kd4Fw6EsFLcQ=;
        b=nbN8RY28SZudHBYHXLBX8r7L0Y4ht1IuvDkGkGal/X5aGe3wEX1PlbGaUfVyL8XWDt
         XJfeYFi8FdGldzLJB0QbwZPifgwaiCc5hF/pT6IqH7MDYSDsgJ4ZsH6Yb4IyomtTVouG
         Tke5HvDfrWR6b9Nxrlkn8TUVsyb9vGHOGJOTsUIIdVg+EDJwDwkdB5xUar50NiukSyVR
         kJWuCuCWBPVLunaTd0XxCF3Brp1Jo6XIasIiAFYtkVvTnuuUkp9QdZgu14QrX6VGQOi9
         z3w0vCzOh2s8SjwHB1kFSA4OaZqGbh753LDpWFDLdl0/kchfBLKtHfJNY+9jNdiVPb0A
         6smQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBrAQNNlqHPl2PmciQ9g9JriQ6qX75hcrCc8hvAoe8utDoJCNdvpGbXhDREmemaUZDlBk3lmlENza9a3VK@vger.kernel.org
X-Gm-Message-State: AOJu0YwFGZSAQnHY++CT4xLv5DMRZRQsXpTnZXtaI8NUFdVc/yaT8/3G
	gr9+EhngqWyi1ER7pGoaAp/XGn2Dvj77f4bPR+xas8LbvQYWYOZI30gJPbJfJmdt6qM21svAZCI
	U/dl4Tt1NT7CD2y3CThuFVbuTigTgeiTPAkHkYkKmWgmSC5uYhpcbE0Fmrd7UYAI/nVZ7
X-Gm-Gg: AY/fxX5mPVs+lDvWxcCJD3lsizpnumbdGzTlZBME1Vu1PwIJxetCkVAzMlrEZZgnOXe
	EGebLLq2qcXOJUAKcXmLton4bvyDaE9KoC+TgG4dY3xM3qKBY1ihzqHEkkRFpuaD7av5lV3RbAT
	qlHAXvPLRbOYW2qQeC5V2GHG+0x8KuH5PXzag+kza3UHOlXbkrCUI7u59Gcla9NSnz1ahSY39Jz
	vvOpcNMN3ON22y6KPi2PneQi2OT8lXoh604K6Rg3LHZ1XdO7XdAD3gIcOn+1Q/dvwuC3PhihirZ
	92tu9rvB7vrWG/58L4xUkihqAgiVjDlRecW32K641ADjdjRxG8Th56Ykj9cAKpS5eCb7Jbds6Ie
	Z27kLK06qSWlAPrKX5La6MxsD+ybw91Amnx/WvbRA7NavjQ==
X-Received: by 2002:a05:6a00:600e:b0:7ad:9470:27a1 with SMTP id d2e1a72fcca58-7ff64fce571mr23477724b3a.28.1766775399140;
        Fri, 26 Dec 2025 10:56:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkEQyRqs4f0Ogkvtw6gpX9EnVKswgkzNyKhkUPApSXlxSbgOc7X636XmD7hh3Rih9uSaYd+Q==
X-Received: by 2002:a05:6a00:600e:b0:7ad:9470:27a1 with SMTP id d2e1a72fcca58-7ff64fce571mr23477712b3a.28.1766775398671;
        Fri, 26 Dec 2025 10:56:38 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e88cd71sm22638187b3a.64.2025.12.26.10.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 10:56:38 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Subject: [PATCH v22 0/2] reboot-mode: Expose sysfs for registered reboot
 modes
Date: Sat, 27 Dec 2025 00:26:32 +0530
Message-Id: <20251227-next-15nov_expose_sysfs-v22-0-2d153438ba19@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAGHaTmkC/4XPwW7CMAwG4FdBOS/IdhNId9p7TAi1iTMijYbVU
 BWhvvtSTj2s7GLpt+TP9kMJ94lFvW8equchScpdCURvG+VPTffFOoXSUARkEXGnOx6vGm2XhyO
 Plyx8lLtE0R5C6yMEW4dGlelLzzGNT/rzUPIpyTX39+emAefu/+aAGnTV7p0Dtq0B/sgi259b8
 +3z+bwtRc30gPXCI3rh1QU0oQp275pQ8xpIsAArWAcJCojOO4iOjAthDVx8TK8upPllMmaHBis
 bg/sDnKbpF304cuG5AQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766775395; l=7255;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=5XvvIjt0D+dddx9812MNw489cJDTO5rmJ22gWkniKlk=;
 b=hx2fjZ1pGKAHKx1j4BLtOJIPB3aonirhZAuE3nkgsana2nH1oqonCEsen74hy5TDJ3dbP+VKh
 Ovum0QHnzvUCDI2lDr+1uxgz5CxDBQB/Worw/1WOna4xdVWB/+FdX69
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI2MDE3NyBTYWx0ZWRfXwgkK6vpsKe2t
 Jzln3E/wFHFj4fioIj123yMFiqDGgccKBmpSqwyCvWvCKOnD/RQ6B0aIaVmoYBmj5oE1B1ulA2S
 Zy8aY00I41wnvVMLB97iidoznT/232ZLzuP3sRwtyfpvBzI2olkz7KY8bspZbdCJ5BexkpclBei
 +NrGC3rWSshAfvoLSOK7V/PZrEtknYR+T+2RjFWMuurzTrS5pzbCYzg+40hfLdT73UNt2eS0aXB
 89fqItQpFAW4N1j3wpzepHb5pSiRnKDq6wWCz5DnhZYtZCK4krXyCER2z3cumPClGq72uiSiQva
 VJC/yuRcEKpLNk8rBoywMLbEqK2reqWmet1djWRoJQeIa9DTVGCZjYWGGVL75ofNmnhoq757xBq
 eYO859SurXqHLhTILOs/XKzv1sHkGutcIP94tuHYnSLGVbu96QePWS5aufvPa4FzG5OCk6p+gW8
 ZPxcQ2PXKHFBFscTvgw==
X-Authority-Analysis: v=2.4 cv=Vtguwu2n c=1 sm=1 tr=0 ts=694eda67 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=sf54k3XGZVOQZVOLxCYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: QDpRpac70nfwzGNSzjOojMvr3OkM6EMJ
X-Proofpoint-GUID: QDpRpac70nfwzGNSzjOojMvr3OkM6EMJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-26_05,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 spamscore=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512260177

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

 .../testing/sysfs-class-reboot-mode-reboot_modes   |  36 ++++++
 drivers/power/reset/reboot-mode.c                  | 139 ++++++++++++++++++++-
 include/linux/reboot-mode.h                        |   1 +
 3 files changed, 173 insertions(+), 3 deletions(-)
---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251116-next-15nov_expose_sysfs-c0dbcf0d59da

Best regards,
-- 
Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>


