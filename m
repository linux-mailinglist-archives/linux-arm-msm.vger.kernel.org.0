Return-Path: <linux-arm-msm+bounces-98640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNaoF1mYu2nwlgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 07:31:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B60B42C6C5F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 07:31:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2599530512A3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 06:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C071E3451CF;
	Thu, 19 Mar 2026 06:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="firpyqFS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hFaD4vTh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E702882C5
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 06:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773901910; cv=none; b=IHcxrPIaeslIP6puQm8kP9QBW4Yi9J7xdyW+Uoj5FoIfuZ/axRkIN6xQjdvBOBpPbe1IMzU4a4/mttWIa0iDzcQ3GgwGRuS6T1HB2+HI4C3Puu04oz5DFLCsoBxNSSpFUS3dXx/JmcpCoCToJANV0vNSunenF2JhXZoZubAjQrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773901910; c=relaxed/simple;
	bh=eYzkZ3XRoWualdOLvHSF4ej1vq1IaANvIq+gf8oCGpw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=e0S1dOn7Iu8/T+u/EQvHbbSt2biivr5gqTFvXR3VbiUvA1KjAlx4hoGHHECG0HtmeFHsh/rjWuIn/UCtoRVqW6ZIQ060Vj5Zz3oDJD2+LYIHrKNehwofJYXJFBo6zod9rcatpQ/2u5U8KV34kUp3yrAFwV29S7d51sjUBTvhlDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=firpyqFS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hFaD4vTh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J5Xf0m1370051
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 06:31:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4gHVFKmZF26QFBdmoRuyj1
	Gtmi6IBytdod9bWmmIVOM=; b=firpyqFS/aujfGShxzNEgMg4KFaL59ToVcaAwh
	7C9Oa9z7pyx1aUeSGEVyCJZlX6rxgjnx5TQNaN7zLVCpHep2bIEGpxvvpKr38iZM
	47ppjhomVGsIXUnir9w0vv1/chBUztEWSfjb7ODsjbPA4jEx3acXtIjCPF8aGdVv
	0giRNjFxfAoYOFOnjWBGsl6T1CiGrnQBrDEtiyCWSzQ/JW0CV/C4W8Ciq+pVo+zY
	OQgvRZGDUC5hWvqL2uQ87b/33AqEQZVMMu8g8AYcSFyZ8umP/mp/AGFPa1Flak4b
	3t8znMFPMwxvZjc2c03Q42hfQ8LdIjzAHkLTFyLcsPk3nGrQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0akxg8xs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 06:31:48 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b064884a7cso31172675ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 23:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773901907; x=1774506707; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4gHVFKmZF26QFBdmoRuyj1Gtmi6IBytdod9bWmmIVOM=;
        b=hFaD4vThwD9NwOu2J9+aJ5Hj6q+3EX+kc+SWUljPP/tdGxJdk3CbVaDGG/Ib0avE6P
         WG1tOQSRvgw88Kqm8+5A7jSZ9RlqLewoWfHIoi34METtmIxJeCS2HGdIHSChTbexbmGA
         0nRcrsvaXns8tGOa1je+jukVNXOqBi9UMrq590gsZRzOE+aD2/GFXcm5UqsIkgLMvd0h
         IUMPvylLm09juaw/jEG1STCch2X/O+/ddjocQFDCgwoPVlI8Z58dVToLK9ELPDpUYjgx
         RhhWt6Hil5nyES3TYL2DnjBpl3jfpg+SDP8cA+5qJWJtoJ5Ofuqy9vEpk6jdQDiKd+ZX
         /Cng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773901907; x=1774506707;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4gHVFKmZF26QFBdmoRuyj1Gtmi6IBytdod9bWmmIVOM=;
        b=sKSTj4TnZWSH5GIV/2jdEHyhTAP5yPbdUZRpDh1mYC+icdLlppWeMNUSIMkYmgQCxc
         xx4FcgQukk8fq6GyUiP9IduTBtysL3B9yeF+OMgHyJOivK/dEJyUCMTc217sVUDOmxOe
         2xA60E/MoTtRRUdta7nWua87JEjEKsqEzkuuxMSRYx4WOFYy1qyBAqExfJg5ce0zK5iy
         rG1AbxkzslOeUnxIKFsAoMdR7wA/ahhCtQ2BB4Yo+CTOauw3uDYVfGq/AdaHZSzuiDkH
         n7GUfkczZxMiDjG47Dp8LBQjIwfL5hjIbUulbZ5U07XZcGVYYb8Kfyc0Wt6sXkU0H0uo
         +l4w==
X-Forwarded-Encrypted: i=1; AJvYcCWyvFnbb7IlVzwYwgCoeS5Rbt5+ulm/auYhWp6BEgfBYW0q1LvWUQqFefYV06OhLsDK4Ypomv6mHILh+SGW@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ27SBo3gJY8Qd/c5YlbUEVkMwLKuytspNwj2An55OmkUEg3b0
	HUjkVsbxTKH0B9adELdOZ9Ogmw8JgLM8HzpizY9mo87ahtZypmaD6k/JgOMkx9OVM98Y/APej23
	xQBm4lOcXrFLK2eEsIQU9DISLfF/QWp9yqfdRHqXxH5YOk7XXU4w24AkS7nAdgVvL2mulEowcPb
	93
X-Gm-Gg: ATEYQzxca7ZJNf4sHbZOO9d1WYycKhKre6okwu9yLIFZuANLaMg/sst8xEwPoov1AK2
	w25yG77DIzrTWp0HeXGQ2G8UszUoExvN8KBzN+hP/rwuxNeGd0/LvbYSAkZ8SP/iI42LamwIA+o
	QWQWzL0EN7efY+H53J2JZ9BZvBFhHI4F1JdI3r9FhnqN8nXxfEq0U9wu7IgVnqBluTXM8Qe4Psy
	NsTwmpeObBekZsXp/yi00qHEnM7T8PlXOyl9E16gpEG0Kei1eAHeHVAFb/bTwtIAhJXIr2GdQrN
	EvAK1Wmy4IQORHx6g1ruFU5rEdXFKd08JtodVjwWt4v/4ZMXuauKdx/9noZETJ7uvSX4f9PEdPK
	kCNRb/lnfAbXPcK1atbGoYVar9Ic3Dfe5u/B0bGHg1WODLjk32K8=
X-Received: by 2002:a17:903:11c7:b0:2ae:483f:b23c with SMTP id d9443c01a7336-2b06e40408emr60424055ad.36.1773901907011;
        Wed, 18 Mar 2026 23:31:47 -0700 (PDT)
X-Received: by 2002:a17:903:11c7:b0:2ae:483f:b23c with SMTP id d9443c01a7336-2b06e40408emr60423875ad.36.1773901906445;
        Wed, 18 Mar 2026 23:31:46 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e603937sm48572485ad.57.2026.03.18.23.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 23:31:46 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Subject: [PATCH v4 0/9] Qualcomm Sahara protocol enhancements.
Date: Thu, 19 Mar 2026 12:01:40 +0530
Message-Id: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEyYu2kC/33O22rDMAwG4Fcpvp6DrfgQ96rvUUpQHHUxa+PWz
 rKWknefUxjsYh0IwS/QJz1YphQos+3mwRLNIYc4lqDeNswPOL4TD33JDAQYUQvLMw6YsL2kOEU
 fT+1IX+0M3BhotLK29kfLyvIl0THcnvD+UPIQ8hTT/Xlnlut0JbVoQEshHZgKpBFaKy75R8hDT
 FR1OE24izlX1088+Xg+V6WxlZvhh/j3q1KCg+u9VU2nyfkXWv1Lk+KlVhfNOUWoOtFr7P/QlmX
 5Bkk7gVtUAQAA
X-Change-ID: 20260307-sahara_protocol_new_v2-662854773cf7
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, andersson@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773901902; l=5830;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=eYzkZ3XRoWualdOLvHSF4ej1vq1IaANvIq+gf8oCGpw=;
 b=PWgBBhIxmBKr9lbh/++fnvWRXX8OMtVafmqbTE8ToPCX3FklnIt8Bnn3E/DHUl97pB/l9RKhu
 B8C1X35ATdtDVHW7b+M1L16M1gcwnXGNwslJvZGBkEJGxaA4XUwvRuG
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA0OSBTYWx0ZWRfXxScdD9V/otjA
 TJFu4WfhPK4bUdFOSeZOLetMUVZlSBlXg6Bq1sB84KuFa62OluXsgaKCUkn+k2NgPCe5/RJ6tA1
 Ld0rYVwsj0jf7mXA0bnLY76O96gYNqBFKcb/IilZyESClEidGNlTadJNCH7WEiopnvmv9npG+jM
 O4vi3We1GET//PMZD3Lnyp7tKuDCAI/CHW6HgXoUOTW8ZGTMSN560QVahj904bLBnMhFJWgN0qN
 T712e1iAIY3htA1GMKtdxuIf1e0nYydyurcBnkx6//t/BQljXJfWgc4fzqO/1aa1vwk3M3/98FC
 8lyHBoAkStB4lhouM2uW+0B/X49rJpWN40oJiwwha4SB4rheF9bKs6R4/JcLYsP6Bxep6NhQnrs
 g46YxhE0IpwlnaR7m2gpOVPC5pLKlO7ZOmjCxR/YHlXqW9CwuPYC8Pr+TcgFwmR18pHEPYQ8Lwk
 GM9TSEfgyxjH2X47FCA==
X-Proofpoint-GUID: sJPM6T-lsdaNL9BJ5dB51pXWFF3Oz0Hm
X-Authority-Analysis: v=2.4 cv=ZeMQ98VA c=1 sm=1 tr=0 ts=69bb9854 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lG-yCPvlEGbsawO-O7cA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: sJPM6T-lsdaNL9BJ5dB51pXWFF3Oz0Hm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190049
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-98640-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B60B42C6C5F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi All,

This series reworks the Sahara protocol driver to make it reusable for
multiple MHI based devices and adds support for capturing, restoring and
exposing DDR training data using the Sahara command mode.

The Sahara protocol is transported over the MHI bus and is used by multiple
flashless devices to transfer firmware images, retrieve memory dumps and
exchange command mode data during early boot. However, the current
implementation lives under the QAIC accelerator driver and contains
device-specific assumptions that limit reuse.

Some MHI devices (for example, QDU100) expose the sahara protocol directly
on a "SAHARA" MHI channel and rely on command mode to exchange DDR training
data with the host. The existing driver does not bind to such devices and
ignores Sahara command mode packets, causing training data to be dropped.

This series addresses these issues by relocating the Sahara driver to the
MHI subsystem, centralizing device specific configuration and adding command
mode handling for DDR training data.

Overview of the changes in this series -
1. Move Sahara under the MHI subsystem:
   a. Relocate the sahara protocol driver from QAIC accelerator tree to
      drivers/bus/mhi.
   b. Register Sahara as an independent MHI protocol driver.

2. Generalize device matching and configuration
   a. Allow the driver to bind to devices exposing the protocol on a
      SAHARA MHI channel.
   b. Centralize firmware image table selection at probe time using a variant
      table, instead of scattered conditionals.
   c. Preserve existing behavior on AIC devices.

3. Add QDU100 firmware image table support
   a. Add a QDU100 image table and select it based on the matched MHI channel.
   b. No separate client driver or registration mechanism is required.

4. Add Sahara command mode support for DDR training.
   a. Handle command mode packets(CMD_READY, EXECUTE, EXECUTE_DATA).
   b. Query supported commands and retrieve DDR training data from the device.
   c. Allocate receive buffers based on the reported payload size and copy
      raw data from the MHI DL.
   d. Store training data in controller-scoped memory using devres so it
      survives sahara channel teardown.

5. Expose DDR training data to userspace
   a. Add a read-only binary sysfs attribute under the MHI controller device.
   b. The attribute reads directly from controller-scoped storage and remains
      available after the Sahara channel device is removed.
   c. Cleanup is handled automatically via device-managed resources.

6. Document the sysfs ABI
   a. Add ABI documentation describing the DDR training data sysfs node.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
Changes in v4:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v3: https://lore.kernel.org/r/20260310-sahara_protocol_new_v2-v3-0-994ea4b0d5ad@oss.qualcomm.com

Changes in v3:
- Dropped the explicit image table entry for the boot critical image ID and
  added a generic image ID based firmware lookup fallback.
- Link to v2: https://lore.kernel.org/r/20260307-sahara_protocol_new_v2-v2-0-29dc748b5e9c@oss.qualcomm.com

Changes in v2:
- Rebased onto latest linux-next tip.
- Reworked commit messages to clearly start with the problem being solved and
  end with a technical description of the change.
- Moved the Sahara driver to drivers/bus/mhi instead of drivers/soc/qcom,
  reflecting that its an MHI protocol driver rather than a SoC specific driver.
- Removed client side image table registration and consolidated firmware
  selection directly in the sahara driver using a probe-time variant
  mechanism.
- Ensured each patch is self-contained and does not break the build or runtime
  behavior at any intermediate point.
- Simplified state handling and lifetime management to avoid duplicated state
  tracking and ad-hoc cleanup.
- Updated sysfs handling to use controller-scoped devres and avoid one-shot
  reads or manual teardown.
- Link to v1: https://lore.kernel.org/r/20250825101926.2160554-1-kishore.batta@oss.qualcomm.com

---
Kishore Batta (9):
      Add documentation for Sahara protocol.
      bus: mhi: Move sahara protocol driver under drivers/bus/mhi
      bus: mhi: Match devices exposing the protocol on the SAHARA channel
      bus: mhi: Centralize firmware image table selection at probe time
      bus: mhi: Add QDU100 variant and image_id firmware fallback
      bus: mhi: Load DDR training data using per-device serial number
      bus: mhi: Capture DDR training data using command mode
      bus: mhi: Expose DDR training data via controller sysfs
      Documentation: ABI: Add sysfs ABI documentation for DDR training data

 .../ABI/testing/sysfs-bus-mhi-ddr_training_data    |   19 +
 Documentation/sahara/index.rst                     |   14 +
 Documentation/sahara/sahara_protocol.rst           | 1241 ++++++++++++++++++++
 drivers/accel/qaic/Kconfig                         |    1 +
 drivers/accel/qaic/Makefile                        |    3 +-
 drivers/accel/qaic/qaic_drv.c                      |   11 +-
 drivers/bus/mhi/Kconfig                            |    1 +
 drivers/bus/mhi/Makefile                           |    3 +
 drivers/bus/mhi/sahara/Kconfig                     |   18 +
 drivers/bus/mhi/sahara/Makefile                    |    2 +
 drivers/{accel/qaic => bus/mhi/sahara}/sahara.c    |  601 +++++++++-
 {drivers/accel/qaic => include/linux}/sahara.h     |    0
 12 files changed, 1869 insertions(+), 45 deletions(-)
---
base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
change-id: 20260307-sahara_protocol_new_v2-662854773cf7

Best regards,
-- 
Kishore Batta <kishore.batta@oss.qualcomm.com>


