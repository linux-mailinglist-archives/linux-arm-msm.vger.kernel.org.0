Return-Path: <linux-arm-msm+bounces-95817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mImbHzPcqmkZXwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 14:52:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8442C22223C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 14:52:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0FE0E30557CF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 13:46:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E147639F186;
	Fri,  6 Mar 2026 13:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nWwAv2HH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JlZb75/2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E2939FCD4
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 13:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772804777; cv=none; b=TovdVKLfdtZXPs7YwosVcTFTZ5S2PLIKh7C7op4I3se9syrhr8E7/Hb6NqtwYpZL/U1hm1/fUcqkya0MBpAlfTBLtiOcxBzv/Ho3UmMCQ12E2vY3E+5pw9CD0DjeUmfplgVbqhkNUgjhzQB969ydBtG6BcZ98O31EOA6Czf/oG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772804777; c=relaxed/simple;
	bh=SSDAqZ4BPyTybfxZoWobH9SrqkBDrojjcbeeILlr+HM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cujds/+xTg+cn8yT/4Ar/ZX4E9bghn6Hz9GWjZS9s5qRqMubfVoLmeZB50SuahO348IVXwT6BedeUNnqNic+jNHpEoZV6WMNg7OSon/JJovZxDugM80ggGxp24ohruXXHceksnflqImEnlvuS+7c1ebdkWZn0XNTu7Bv7RgnaKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nWwAv2HH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JlZb75/2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626BbUiY3727695
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 13:46:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8+SLyHVxBbG1mkAY054XHo
	dnmb9M/jloyrUQ/IyIBYA=; b=nWwAv2HHZSb7QW4DgaX51Rx3SPxrMuELprIUEK
	cBVI7NiI6FoFGS1ehI2Ryu1ln+q022JUG2xxTiFDa0jlNdRExE1dynfQZUUGCgTn
	axxCJXJbtaKtXUJrXRSXSzATwC5H4OIVjLOkKHunVM/mBEYjaxLjbT/ruQ+8NO7G
	CkPRnIMdCHmP3l9rEbvJw3sqYMzZm4sushNPE6egjxTQMgawEbm5ev9NEOwTScFE
	ujXQYb/K5G9B/KDl4fwaaKekubR/4bG8VOU4DLI9vVSdrxefecQb5DcGbDPG3bQs
	CjDPBk7EhbwlK+3oEDm68EwX3lv1U+3KqN/Wkm0XcM6Jl1Zg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqgp43065-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 13:46:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb706313beso1177865285a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 05:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772804768; x=1773409568; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8+SLyHVxBbG1mkAY054XHodnmb9M/jloyrUQ/IyIBYA=;
        b=JlZb75/20kXWMVcjUfMfSXs6927DYGRtB6CUHHufq7hOJZfMy2Q05vzrJ/Zacjor6b
         reVmG9PiRD4W0S07p9z1s2qY28zbgfhXMK378l3izqeCdf2TphWD00GHVA548LxhMBDL
         jzeUCZ2G7GWUcQWX71A5x4g87q+I3XVo2UtIsw4s368GM2TAkYugcZsW+rojVy4KZPvl
         K5fll/f5WjhRXJ1ubxLnEfQV5kUlUQttuC5tqKG4HWEqdZ/W/qm/PbMwOKwQrW+e4c5u
         dtQ+APytMd+OR+XV8Rc2HzulEFyfu6IEmjgy81cV6G0hrF3TtwnyeVSWqsD1d+mJhmP1
         1ujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772804768; x=1773409568;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8+SLyHVxBbG1mkAY054XHodnmb9M/jloyrUQ/IyIBYA=;
        b=uXx6pRQfmBhzdtof0z6jaDm72zbN3zm9dvYwH3qbNkam2V/Z+gtd6XEsi9CgIHf46R
         iho/TYkXFOLNHRSkcbp1OucmTbYsxVmqyjs4EY6YjSgixfVZuh1iGdhNioiib0bPnHNp
         tRiZKZ6NBinI30sa8u9Vf/lDgoiH2Hsrynufl9PuwRX+0hlR6qwVvfiDAwfp1EUSMLAk
         cO2zD3LO8ZKPKuytbk95kxXlgeAT2eR7qlEMVKaajVRo/DxZuAifAHl+gExwuJxwJMFt
         fY1xYNcE+ipXoYpWF68iXARJiL3X4w43182jHwW/dQBXIVrZhIVDLbiJSWctM4eOelw6
         aLvA==
X-Gm-Message-State: AOJu0Yxxan5bXOQwqQhtc8wqpXKB03UScSoQmqD1uiEXkN8y9OeVdfzS
	XS1yJCT6rnDEp892pCWJ+hugXPgADZClLFNVvrm8t2muWXdytCRgbvxc5ZKDBycX7oQPWmR4z1c
	GH4+JfVIF8azOokUEc6Da244nrD8cauuMP9mHAMhyTHGmouTcZrYjLJN10paB2UAAyToTOsYQEm
	zO
X-Gm-Gg: ATEYQzyXdvJpGZ6kF5JTy0BBoj+cPPPuWCPunt3FOWMizryIE4k0Ad+zL3zr8xKEVIl
	p8aH8EhxbMaT5OkOqGBV72NBPpJ4Ly5vgBy3hrqaRydgZlcxAEzy546+E3g999ovNQC9POCmj1G
	kmrYflcYzIKDqZQwuoFRlTeWTemhJO8MS+h4urlwpVbEXERY3+efZpYzDYmODEzbFhCOYEBkAyi
	PxNi4rvF/AnuvovEJRy9bFhaN2vfQiajvFqzMboegNGNLWoxv3sydaW9KbXB185RjwsU2ifi5I5
	4ZFwt2spyx+JAdca/hhSobVUHG1mZ8gSJhasTNvpTSQvAUCSTFxdR1Qucna6kRDINgC49yxOqX5
	87JhYGVN1Kh0GuunMPGxXzuH01SQSELp1nsi0k+33b5T/dHZv2lX1
X-Received: by 2002:a05:620a:4588:b0:8cb:5176:ee7 with SMTP id af79cd13be357-8cd6d4285efmr243152685a.39.1772804767935;
        Fri, 06 Mar 2026 05:46:07 -0800 (PST)
X-Received: by 2002:a05:620a:4588:b0:8cb:5176:ee7 with SMTP id af79cd13be357-8cd6d4285efmr243148885a.39.1772804767347;
        Fri, 06 Mar 2026 05:46:07 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:6d2b:ebde:c946:11eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8d95dsm4388457f8f.7.2026.03.06.05.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 05:46:06 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 14:45:56 +0100
Subject: [PATCH RFT] driver core: faux: allow to set the firmware node for
 a faux device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-faux-dev-with-fwnode-v1-1-792a86a62530@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJPaqmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYwMz3bTE0grdlNQy3fLMkgzdtPK8/JRUXdNEM7NkQ3NjC0NTCyWg1oK
 i1LTMCrCx0UpBbiFKsbW1AI9FL8ZrAAAA
X-Change-ID: 20260306-faux-dev-with-fwnode-5a66c1738158
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6743;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=SSDAqZ4BPyTybfxZoWobH9SrqkBDrojjcbeeILlr+HM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpqtqW+NF+cKZ8SyDiGqJGeWNHF6q91nx3U1mmh
 EswCcCFcLmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaralgAKCRAFnS7L/zaE
 wwrUD/4+ltDlHiQUvuipukMXmzcVbLIIGeeTCl0o+ab+Y2s/ZdqqKJMeZP7t6o6y5snlKgA8XyD
 eOFWgmQHNOaeJVb7qIPumSn0T69Q9rUVM9pjzcHCSsOuQ2bPspRt4FrybTiLOUp8YV/rlxVywe1
 Vp3TeM0oQk/B/2qXKfBocqreISKTB9tKhL6N9Hwr1shPpzgjmRPMnckPgpXdRlLvhGn0cPjJAqO
 zEHAHtnnHJllOw8Zl0BZPSxFX8QosBTC0JpUHItSx6IR+HlK3wMdCgTD7QZ3jeBpnjQO/sHO5yE
 3frrkzqeNRjguXPHFX3sYTED1j76x/OH5ZekGl8JYFDyY1szLVzUXaPqgqCZ6eJHdWwTk2I2S38
 k1zbkCbNAWdXQBw/R3AaDgcTzIt913fPFiK7ZGyuYKrot5CMUMsgBHZF6UzoKt7o/z+C+MqaQhs
 1tRnXaO1u9oT1pYHWSUUHqzszh63mTb/m2qdqN6iEaBihOU5we5llYAeYgqYal9WhOSx/kTS712
 m9bcY81vauA02CyA38gI9Msz6uXEzJSCkO7oFKAXCi6ykuXwCliPpoO6UHurnZD5K+bOx4OxrjZ
 APeW8+DNcou1JQFs/ptMbTPEG+MtmVa5zchy3LqxMnUqcwNDO35n32YK37opBT9I+w3vVaSPH7C
 578AncK92qu0y9Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: NORWouHFv7OYh13o5F1-DYO8dzVfcy9T
X-Authority-Analysis: v=2.4 cv=LegxKzfi c=1 sm=1 tr=0 ts=69aadaa0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=_FzdcIj27RP5URbXEIgA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDEzMiBTYWx0ZWRfXz7mgKtw8fPj0
 z2Cm+mQVq+NxX3HUz2r/6aqbVuoQUI7j9pAeIZXmUHf0Fi/Q/IBM0HzUdCj83sZ4wGeVRz+3yDh
 fFExbyd+ahkDdKuCnoyfHxz6OUmZIniqNQPQobOe2IF0OqPieCzpbgvzYjcB2L8Pjxglr4Zjw23
 VPeOTyKIbytxBWXB2zTxJ4U77BwqGEAKK7So2ymryrrZ0X5/5DyQq5PEqdBmduOiF1JU1OSa+g5
 jtD9TABCH4weKbYfN/WINUvAx5iIWHqeYB+jzgtBeIrS63STOA7vOP36xBsxczXNM6muLtr1zbt
 4tqV2xyHXOjiQ4pB84/WmKog1FXIYOKgUNhFx8lbK8wQt4e0nYAwhY9kfrXI7vpGpir0iR0CYym
 vMM9eMLwxAjPEd7M1tRvJ2kdDCzfZt31lfMqnEQUObGibQ8iLprxeF4A1yY7PDzKzN+VbMG01vQ
 GsZAbUeK7WpBpe3Kw+Q==
X-Proofpoint-GUID: NORWouHFv7OYh13o5F1-DYO8dzVfcy9T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060132
X-Rspamd-Queue-Id: 8442C22223C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95817-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add a new variant of faux_device_create() taking a firmware node handle
as argument and attaching it to the created faux device. This allows
users to define and read device properties using the standard property
accessors.

While at it: order includes in faux.c alphabetically for easier
maintenance.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Hi Shivendra et al!

This patch is related to my response to your reboot-mode patch[1].

You should be able to use the new function like:

  faux_device_create_full("psci-reboot-mode", NULL, NULL, NULL, of_fwnode_handle(np));

If it works for you and driver core maintainers accept it, please
integrate it into your series.

[1] https://lore.kernel.org/all/20260304-arm-psci-system_reset2-vendor-reboots-v20-6-cf7d346b8372@oss.qualcomm.com/
---
 drivers/base/faux.c         | 64 ++++++++++++++++++++++++++++++++++++++-------
 include/linux/device/faux.h |  5 ++++
 2 files changed, 60 insertions(+), 9 deletions(-)

diff --git a/drivers/base/faux.c b/drivers/base/faux.c
index fb3e42f213624ac8854764f58e81b9c2bc58cc86..27b3923b461df14bccc07eab701c6e8070de631a 100644
--- a/drivers/base/faux.c
+++ b/drivers/base/faux.c
@@ -10,12 +10,15 @@
  * intended to be very simple, with only a create and a destroy function
  * available.
  */
+
+#include <linux/container_of.h>
+#include <linux/device/faux.h>
 #include <linux/err.h>
+#include <linux/fwnode.h>
 #include <linux/init.h>
 #include <linux/slab.h>
 #include <linux/string.h>
-#include <linux/container_of.h>
-#include <linux/device/faux.h>
+
 #include "base.h"
 
 /*
@@ -95,9 +98,10 @@ static void faux_device_release(struct device *dev)
 }
 
 /**
- * faux_device_create_with_groups - Create and register with the driver
- *		core a faux device and populate the device with an initial
- *		set of sysfs attributes.
+ * faux_device_create_full - Create and register with the driver
+ *		core a faux device described by the properties of the firmware
+ *		node and populate the device with an initial set of sysfs
+ *		attributes.
  * @name:	The name of the device we are adding, must be unique for
  *		all faux devices.
  * @parent:	Pointer to a potential parent struct device.  If set to
@@ -107,6 +111,7 @@ static void faux_device_release(struct device *dev)
  *		into, can be NULL.
  * @groups:	The set of sysfs attributes that will be created for this
  *		device when it is registered with the driver core.
+ * @fwnode:	Firmware node describing this device.
  *
  * Create a new faux device and register it in the driver core properly.
  * If present, callbacks in @faux_ops will be called with the device that
@@ -123,10 +128,11 @@ static void faux_device_release(struct device *dev)
  * * NULL if an error happened with creating the device
  * * pointer to a valid struct faux_device that is registered with sysfs
  */
-struct faux_device *faux_device_create_with_groups(const char *name,
-						   struct device *parent,
-						   const struct faux_device_ops *faux_ops,
-						   const struct attribute_group **groups)
+struct faux_device *faux_device_create_full(const char *name,
+					    struct device *parent,
+					    const struct faux_device_ops *faux_ops,
+					    const struct attribute_group **groups,
+					    struct fwnode_handle *fwnode)
 {
 	struct faux_object *faux_obj;
 	struct faux_device *faux_dev;
@@ -153,6 +159,8 @@ struct faux_device *faux_device_create_with_groups(const char *name,
 		dev->parent = faux_bus_root;
 	dev->bus = &faux_bus_type;
 	dev_set_name(dev, "%s", name);
+	if (fwnode)
+		device_set_node(dev, fwnode);
 	device_set_pm_not_required(dev);
 
 	ret = device_add(dev);
@@ -176,6 +184,44 @@ struct faux_device *faux_device_create_with_groups(const char *name,
 
 	return faux_dev;
 }
+EXPORT_SYMBOL_GPL(faux_device_create_full);
+
+/**
+ * faux_device_create_with_groups - Create and register with the driver
+ *		core a faux device and populate the device with an initial
+ *		set of sysfs attributes.
+ * @name:	The name of the device we are adding, must be unique for
+ *		all faux devices.
+ * @parent:	Pointer to a potential parent struct device.  If set to
+ *		NULL, the device will be created in the "root" of the faux
+ *		device tree in sysfs.
+ * @faux_ops:	struct faux_device_ops that the new device will call back
+ *		into, can be NULL.
+ * @groups:	The set of sysfs attributes that will be created for this
+ *		device when it is registered with the driver core.
+ *
+ * Create a new faux device and register it in the driver core properly.
+ * If present, callbacks in @faux_ops will be called with the device that
+ * for the caller to do something with at the proper time given the
+ * device's lifecycle.
+ *
+ * Note, when this function is called, the functions specified in struct
+ * faux_ops can be called before the function returns, so be prepared for
+ * everything to be properly initialized before that point in time.  If the
+ * probe callback (if one is present) does NOT succeed, the creation of the
+ * device will fail and NULL will be returned.
+ *
+ * Return:
+ * * NULL if an error happened with creating the device
+ * * pointer to a valid struct faux_device that is registered with sysfs
+ */
+struct faux_device *faux_device_create_with_groups(const char *name,
+						   struct device *parent,
+						   const struct faux_device_ops *faux_ops,
+						   const struct attribute_group **groups)
+{
+	return faux_device_create_full(name, parent, faux_ops, groups, NULL);
+}
 EXPORT_SYMBOL_GPL(faux_device_create_with_groups);
 
 /**
diff --git a/include/linux/device/faux.h b/include/linux/device/faux.h
index 9f43c0e46aa45bf492788adcdc081df5cc0c5fc0..ecad00221590e10e63d13698db9234b3c138a492 100644
--- a/include/linux/device/faux.h
+++ b/include/linux/device/faux.h
@@ -54,6 +54,11 @@ struct faux_device *faux_device_create_with_groups(const char *name,
 						   struct device *parent,
 						   const struct faux_device_ops *faux_ops,
 						   const struct attribute_group **groups);
+struct faux_device *faux_device_create_full(const char *name,
+					    struct device *parent,
+					    const struct faux_device_ops *faux_ops,
+					    const struct attribute_group **groups,
+					    struct fwnode_handle *fwnode);
 void faux_device_destroy(struct faux_device *faux_dev);
 
 static inline void *faux_device_get_drvdata(const struct faux_device *faux_dev)

---
base-commit: fc7b1a72c6cd5cbbd989c6c32a6486e3e4e3594d
change-id: 20260306-faux-dev-with-fwnode-5a66c1738158

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


