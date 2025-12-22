Return-Path: <linux-arm-msm+bounces-86089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C155FCD4A1C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 04:33:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 05A603006623
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 03:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD81D72610;
	Mon, 22 Dec 2025 03:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cD5TAtC/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bJGtr3ld"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD7019992C
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 03:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766374420; cv=none; b=dFwbCe2VGE6wMi03/3ICyrk99vkdXjZNIqfykUe3pFTJj4O0ds73aIya22Gmvydv29areC2kl/Yca/Gvung/bD3G9GgvMpIu7rM5G00ssHCWiM2IBL6hfYrdW1NgI8FdrIqR/OroNipTYBDkLfFNFG7wAXA/moW1nnxqdL8WB5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766374420; c=relaxed/simple;
	bh=w1nyklB6+KcbGM+wsY9NjRmAg9I60O3hHHMML2/Mxrk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rNJhtVrhgfAuZsRPtzbpPymFsqvan8EtCXVanEEP1XvUu6DerE4A61Jdv1ntSjWRtvzXwwV4bCoZAomLxUomFYN37TQziD3UdYJ1AZFDUY5Zcc6TxKpyRLupGhQTSUwNCkM7CdKs16+02xcBlM55VHS4XXosvMMFz8nwWqgw+JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cD5TAtC/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bJGtr3ld; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BLMipsT4092202
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 03:33:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2gfQgQRtXcVAabWtZlpPWW
	0kMq93k8nvWlB88fS3LKg=; b=cD5TAtC/rBwoTPTjWF4qgG/JMr0mQARgDIMIon
	aymjACdoj+enI5aHRgXpdadPPuiwpjEOmHXwVA3dqreOCPsAk6kw7DzUrFjmMBou
	vcSrHBEKMU/0kqEGNkAYZP+cW0rNSRHTxreT9UrpGDy4dcTyfXfwztO6p5XD/YND
	gndi4MVWGvrlXex7f1zOVTdDd3sYZxGUU+Tpg6hoiD5dwSDzYK5wI46ckIgpPEXI
	JNudT6G/JlTLebDvksZmXsLucHQ6Mc7/c0kzkQJBLR51oAW3h0rFzcT/ZAC3gQpY
	SNlbKjYJcZWXlwEBT85I2ugyEhAjqXLi+DM/kxvCj4AXdPgw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mux3eyr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 03:33:37 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7c1df71b076so7133298b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Dec 2025 19:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766374417; x=1766979217; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2gfQgQRtXcVAabWtZlpPWW0kMq93k8nvWlB88fS3LKg=;
        b=bJGtr3ldoMipEdlk/BEb8GacoY2PaN9xrKvA7xJRXEpvXVXs3fMmu2ZNSUNm6/4FtO
         JILZ2DHInCLs5wJrMV0n5bsiVj8aPlZ0EAYC+O0fLoNqI7ACuXU1ORVaPCj7hh0PtXNn
         O37VhR2d2fYNI75T3lwTUYcXxnvmoc+6cgvyfxOxJm2G9fiiJwN1yVfNlDDadL/fS3SH
         z4uLn5bfFJ8yOsvAMlubWnmx8bl5CFqZKZ0+v3iTmiqimyhbsZ20/grQC7Va7Ka3oOk5
         DbVK86D6p4IwQRD5ogHQiMIZRLV09ltsBANJi3OdOMnELmXrMPMXt2EsFfkCVTgjhOpR
         Q3cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766374417; x=1766979217;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2gfQgQRtXcVAabWtZlpPWW0kMq93k8nvWlB88fS3LKg=;
        b=uVx4wvEcMZsNX7aGXNfIQpWDzJ6N6dpsA+rZsxBrNX7tjSy1kONWhId280idkNiKuX
         QbSVpjef4/SIQ1OLOgN3kkcC0MBK/ajjGLAKraV7wcAs5VuOkS2/xV7e2Lyvg4J7mUNn
         7s3nKK4fnjyKeqbeWSg8eXFQzq7rnGUu1fOmGmI31SRfBjKGV9BEAoV1+z0HK8n/WJfS
         wRqj8xKFLxhSSROt1ZhMhp24chTszAC1eYmX6FBui3GWfJEzOVwVzLmAEDetlbrqrSkG
         8LQLaA5p2dtJ2CTUBPHh3Xv7XbFnGBPyE7KYeUAi7lGPeAk+uEwGWYUlnLAcdgKl3jh+
         +7jQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6L8zRZLX8YB7kh9p7nCG/iskHqkBDhlTFKpkxI/IHxgrLQl0dh8H3UdbM2IVWpcEIPaKZ4trG+VlPIL+1@vger.kernel.org
X-Gm-Message-State: AOJu0YxOIs5J5nt+LHbEV38KKxzUyCyT1SCYq5EQkkAiNbQ2Kx8Pqqsr
	AsLvXQDbEs01NV+MfKOgyjKJHI8ptIqqg7aVpQ/5sDOAUnh86ONQAtvilW8m49qpzIe3yhLbC4K
	4XNju7FegWQqpHzmlQkAN80d/AVO+QhMfBNPtAcTly5C6NXXD1vz4HO8cdz+tPf0wFK5c
X-Gm-Gg: AY/fxX6ONw5YGlnpCIthlA32QRSICefJKRNdUQXcvC35EYKtAtJ65QcljtL6REkEQcL
	JL4XsM/mQPcF3H9pJLujY2KGCYexfW0Bud5G22xOSV9qbpnD8QMxICIAaQRN2PjqfVtNSANSDua
	8Ps5+gcKHwwOAd9vMSbrHnBCtvq1KnoUrxspbktztGHaiwbnutUkRkMwLti9s6f2Skvnj4O18hU
	vVhodarFxM2AXJJQ3H0tS5M5zIK8F0barPObzljjo1qFt/y+UyfUgTTsIkycddqKRWSWs0NYjZR
	BfURdpwKtdLiE36NharBUTtHpE/jo1ptaMbUJG7mBe2xdjdzdElQZXIl23SpE+/aGREtqlaNnMS
	Xx77mb3pfRrZz+jd2REA5a57C6tqGJzcLIjaiBJhpCkMHhA==
X-Received: by 2002:a05:6a00:885:b0:7ff:9b98:b115 with SMTP id d2e1a72fcca58-7ff9b98b17emr8188719b3a.0.1766374416785;
        Sun, 21 Dec 2025 19:33:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGgOEVDlO48yfSUYBeKOJA1VilWyYqduQ0kZL/HixeCq8KJCKYOMVkhh8uszq5gDPKf7kY//Q==
X-Received: by 2002:a05:6a00:885:b0:7ff:9b98:b115 with SMTP id d2e1a72fcca58-7ff9b98b17emr8188703b3a.0.1766374416322;
        Sun, 21 Dec 2025 19:33:36 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e48f30bsm8633837b3a.48.2025.12.21.19.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 19:33:35 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Subject: [PATCH v21 0/2] reboot-mode: Expose sysfs for registered reboot
 modes
Date: Mon, 22 Dec 2025 09:03:21 +0530
Message-Id: <20251222-next-15nov_expose_sysfs-v21-0-244614135fd8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAG8SGkC/4XNTQrCMBAF4KtI1kZm0kZTV95DRNrMVAPaaEdDR
 Xp3oysX/mwG3oP3zV0J94FFLSd31XMKEmKXg8HpRPl93e1YB8qFMmAsIs51x8NFo+1i2vJwisJ
 buUkr2gM1vgWyFdUqr089t2F40etNzvsgl9jfXp8SPtv/ZkINumgWzgHbpgReRZHZ+VoffDweZ
 /moJ52wevOM+eFVGSypILtwNVX8DTTwBhbwHTSQQXTeQetM6Yg+gOM4PgBB1gRFaAEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766374413; l=6627;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=w1nyklB6+KcbGM+wsY9NjRmAg9I60O3hHHMML2/Mxrk=;
 b=39LjI+7uuA9ixRmtJMDNhcvfi5gVwf1qJCblKDsvSl+ChgUyKd4rW1axD6CgBV3Ro1V9NdeS3
 C0ZrwM/a3SMCb9I9hMMAwX0YbMW4/Dexa413nVn0Yu2QtawavUuRC/t
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: 4ujZL2JeWmSEo0PqgVAkKSDStsINTQP2
X-Authority-Analysis: v=2.4 cv=EvnfbCcA c=1 sm=1 tr=0 ts=6948bc11 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=llssp8xSOA91VqyF9U4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: 4ujZL2JeWmSEo0PqgVAkKSDStsINTQP2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDAyOSBTYWx0ZWRfXxTzIlyQB4Z8W
 qxW1C1Qt5NMJ9l8MbsdU2b+kRLqOZ+4IoK9H2S5BCjLitSBhLb2jsTcRjOgDWxpib1O4Y5fpAsT
 GEQO9rPkId9K4Uxc7goCWwCzCaujcO8wprncdWvjFKlbcm+3Kpz+eDdrdtGCh0iZK7CiMolybNU
 1DDf2TBbUB+x4iVe9gUEPzeOxWvJEnd2HGH2xd/NZceH+/ihxsZoj0Fv2z6XAvi5WZyAhNtqlyP
 CjLaM4BClOKunnxOPdTWj+ABbDYxl+rZufOT/aaoxFWL/bqREmRQIkGqNX+eXDJ5ilAOhWf0AYO
 IV7R3ZYuNuEmJaQB10WkQBo6Edql1GfXW/QvSPkgz8kHUnHoMx1G2hMkWXp2cCkk62Vw5h8DMxi
 JBZd5TmUn6Ay0vWamcShpyP1jR42DErz4pnu5Y8UsbnA3OCe1PCjq+cwPAI7YlSuKVpC71w8hQP
 1fzR/jlDTuEjvGgvYtw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220029

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

 .../testing/sysfs-class-reboot-mode-reboot_modes   | 36 +++++++++++
 drivers/power/reset/reboot-mode.c                  | 75 ++++++++++++++++++++--
 include/linux/reboot-mode.h                        |  6 ++
 3 files changed, 111 insertions(+), 6 deletions(-)
---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251116-next-15nov_expose_sysfs-c0dbcf0d59da

Best regards,
-- 
Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>


