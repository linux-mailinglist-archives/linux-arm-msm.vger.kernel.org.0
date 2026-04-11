Return-Path: <linux-arm-msm+bounces-102772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kB7xAMwD2mlJxwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 10:18:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A043DEF0F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 10:18:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F3D4301ECE5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 08:12:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A89E1B6CE9;
	Sat, 11 Apr 2026 08:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KFQUNfiu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WxO/OCYV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4B9337BB8
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 08:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775895165; cv=none; b=hSpwgoKcea5Qwxu9mDUXTOyUBIB5TNoGBOGoAAdBJNv3AXJa0MMDWBQ3+feHceTBXNeAQZFmodJGsI4N2tZE9O1Cs6R7ryCpR4ZBkpnNBrWeNIFE5xlbE7h2KDrIuPrNWvIv6mBSfCr9JQCisiwm6wJ7ARwnobgjrrZJtVkURcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775895165; c=relaxed/simple;
	bh=WTOpGNSakWLnY7/rssUwc8HdaaWGcsUkvgZSigTXMlc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SznrWmrYoVh7dPuGbCoch5v/qcXoh2OoLghPyaxT1OApm3Ysz8J/pA8Xnje3xh04uyaOPjmskp/chKRWqL8qH/GhyntjOaj/z6tOJRlhSH0lMOVZVEEFkwxpO1JbCp2bHAxQzSkg5vOBvZ4uuezGcQK3UccoQwQkyk+cdTdEq5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KFQUNfiu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WxO/OCYV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B43RA02737038
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 08:12:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8b6HO3ggclHZpR5ppJWzUvR3f+GA2tkUsg6Og04Fo40=; b=KFQUNfiuCFXfzvzO
	6Q3mHUuawfICBpqBEdA4cTQIQhYBpBsAl8ai69df35N09OoZsiImMbpCafdJZVQ4
	4ESNE2OZbcO0zkrfG1io3NJiHx8D9EvvB2peLOwzD10dRlZ/94jQmUJi8+a09RAl
	48i5JokDag9YyVN/OquPy8jfiyd7ziPB7SU2e24JCCWFymnhOs79Ux0ZuxolQV5E
	RJINKHfn8JkhjfYGzBQQ6OaFhYuZO9gi/0JfULDEyTSaSn/dpWfIYB6J9Tl+dRJb
	htO1+dnk3ExiZ1F2aKmJDeX0CPb+KtU64HfZrr4U7EUQug2o13jYIRUAu7ht6Gof
	Vpp5bA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfexcrbuj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 08:12:31 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f07cc6590so1244853b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 01:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775895150; x=1776499950; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8b6HO3ggclHZpR5ppJWzUvR3f+GA2tkUsg6Og04Fo40=;
        b=WxO/OCYVNZG3dAYDrKz3JxP72ocHe6P3yILSmE8w6MlQHgVUCElH634rbxsMZq0Nur
         RPPqeyyJ2TIvQ0cLVPsu2sqzWGRXz9MNCsFoYYn9EMFxR4p2MxSnaEK1jctbSof53spR
         f7AHKcL3ybNlzhZtodPl2KMbqefjzZIFNfeYRt3jhvzRVcMvHNWB3I1Bu7g/o+e9zq3o
         xnFina0XQGxFSjy/avSKn3hrZo4rwU1b3eg1QuSoDfeSquxfsYyvyN85bjJY6IFA0ZVj
         YGIx08JjRcaGy3ez7Ry+6W4QdR0psjgRr6FEwkve2A+lsXgQxKXgBMYXEYCaeA59Pazt
         iE5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775895150; x=1776499950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8b6HO3ggclHZpR5ppJWzUvR3f+GA2tkUsg6Og04Fo40=;
        b=sPQo6+hw8h7DPpjrkQSoHdkos5PbSB4l/oC2h/8WiFQGLrn3+hkGzGQdSp/UcmklwS
         /qeSGVljCvJ1ZYnnYwegSV3tJtU4JvBPyLc1bulD/74A8AxcgV6lfrSLG28DFO1TWfnc
         WPlnPWnuZMmefsTlxC64sVpek0HgcqaeiPV08p+8szfHPhtmJMSvtRRLPgCndy8uqvOq
         tA0717Is/d8uPzEw+B+BtqWzr2h6IXIYesUeabHIi0g+xy4Mxci6OaVmairCofedbd1S
         sSu4ckofoXA3OWdU9EzH7yqFWGmKye59QrAbe3VYsSouQlb3RqusTDSr1gtd/hKacCSD
         8AHA==
X-Forwarded-Encrypted: i=1; AJvYcCVxKpluhmqDHS8m2PyRP2Q7POoYol+dvdZIK/fuhmOp6rrFedudcCyra1Q8WoJj1x5FJ1Wfit9eIrR6xpEe@vger.kernel.org
X-Gm-Message-State: AOJu0YxYrESX8SfsUBV8mwQ2BcTl84XKnmXw5d8OSaf5Szfo0AKLmpjq
	T65CtsDuGvGGoTBT3yClCHhhK2bHN8/ZHdjkfZsnUiA/yWisZtOrifIJbza2oLdhlD15IfDxBfo
	NEm3ESZTNVUnwv21hvQuTdWE/aVsLstkPgh6FZWsMY76H8ubDnO1QZ0xMZ++Llga+cwvYtVD6Kh
	V9
X-Gm-Gg: AeBDiev0jY6pwCzlHcTzk7Y32xolZ8kBUvuJw/wh0UCYSIq6t3jjpIJBGXscw4Et+T0
	r8oV1uIwKPsk5tluYsZmTbQos+OO1my1o3TOF9/xkf7Ol6CEVTCoplG8nolI1zfTjcUKIqmnZ2j
	dgHemt5738Y3/XJKMlmKgaQHJidWVjLh6ido5CxItmFZ7Vt9AonZfMBuyv+9q0ePeJb13N/Y7nM
	hgYglG9XUZGxSTzmJXpIp+6o2f3BTHHiVnjgGMt9H9mv3Xk4xmsHMlROxXUjN6IkADE3CZ8kLyg
	ClcL7mbb5cWhEXsPShl/B468qTj7Me2y9iLw0/+qnQROmGVP9yvP/BsFA3viY+Bs+GwGmofUexm
	4pebbPwhTsNTgHmNk4fD69dNJ7y+c3GdLfrlTzhAcNrsXUXWacsdjVKn8
X-Received: by 2002:a05:6a00:3987:b0:82c:249d:d84f with SMTP id d2e1a72fcca58-82f0c38a1demr6898362b3a.37.1775895150006;
        Sat, 11 Apr 2026 01:12:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:3987:b0:82c:249d:d84f with SMTP id d2e1a72fcca58-82f0c38a1demr6898341b3a.37.1775895149473;
        Sat, 11 Apr 2026 01:12:29 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c30ee4bsm5410996b3a.2.2026.04.11.01.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 01:12:29 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 11 Apr 2026 13:42:06 +0530
Subject: [PATCH v2 6/6] bus: mhi: host: mhi_phc: Add support for PHC over
 MHI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-tsc_timesync-v2-6-6f25f72987b3@oss.qualcomm.com>
References: <20260411-tsc_timesync-v2-0-6f25f72987b3@oss.qualcomm.com>
In-Reply-To: <20260411-tsc_timesync-v2-0-6f25f72987b3@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775895126; l=10454;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=LhDoMll/wWIlDNwH8IZy4kOgBI5XQJ/yC8ie5fx0RPE=;
 b=bAtw4e0HvRbXp1CYX9AgBteiOgmuA0OHY2qaLoAv6d3MPNFR09XH9VwqjKU1tjMXRZmz7zWTj
 /C39h4hxuCYBOFVa9Kfvt1bCRjTpyXl7gpAWf3x2sRmXzoYCL/ttCXv
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDA2MiBTYWx0ZWRfX7QIIzLSMgLhj
 o3TUyEopBhEsIMJmzY75fWznKtTGTEeKpK+zGiGYgkdvuuiccp4HIUsyl+cJUBeiNrkb7NUYe9j
 EXtH5Xxv7jgw077PefWaUi9876OaAGn352UZI8A/DSyOOOEMhiX+ftoLom+SSZkWBIMdSe4caxw
 kOrrP9dWY5NBa2JwI6x+MT+KMSfdPz4lV/pvBtSzkw6luxwpzQNeKevmwpiU92J/SV7UCcgTMkG
 ZnIkflYoic5UG4YNP7KmbXJAvdYpNlp7BLQbPVOGZZdEXzI9Qj+gicnbL+lr/EBuAPuLKcM/Bj5
 0QX3XrU8RSQ2wgH24yekGtuVxN2KY13ODjD6DCaaxA0wCvRny5WJmpwrRdwfoDGjjfMMDLpJ3e9
 9wrq5sm+YKlJwbX3e9UfcWY1d/wsB6/6eLs5OGttriou4tqQjmPGImKIFgn/TLAHyYi45GO/QAy
 5ZTEVFnryASYfFZRaZA==
X-Proofpoint-GUID: 9zAWqhQLORUIhIl8l2lru-_daACZZVLo
X-Authority-Analysis: v=2.4 cv=MqliLWae c=1 sm=1 tr=0 ts=69da026f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=iHv4hXetqTYKAj42_78A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 9zAWqhQLORUIhIl8l2lru-_daACZZVLo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110062
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-102772-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 57A043DEF0F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Imran Shaik <imran.shaik@oss.qualcomm.com>

This patch introduces the MHI PHC (PTP Hardware Clock) driver, which
registers a PTP (Precision Time Protocol) clock and communicates with
the MHI core to get the device side timestamps. These timestamps are
then exposed to the PTP subsystem, enabling precise time synchronization
between the host and the device.

The following diagram illustrates the architecture and data flow:

 +-------------+    +--------------------+    +--------------+
 |Userspace App|<-->|Kernel PTP framework|<-->|MHI PHC Driver|
 +-------------+    +--------------------+    +--------------+
                                                     |
                                                     v
 +-------------------------------+         +-----------------+
 | MHI Device (Timestamp source) |<------->| MHI Core Driver |
 +-------------------------------+         +-----------------+

- User space applications use the standard Linux PTP interface.
- The PTP subsystem routes IOCTLs to the MHI PHC driver.
- The MHI PHC driver communicates with the MHI core to fetch timestamps.
- The MHI core interacts with the device to retrieve accurate time data.

Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/bus/mhi/host/Kconfig       |   8 ++
 drivers/bus/mhi/host/Makefile      |   1 +
 drivers/bus/mhi/host/mhi_phc.c     | 150 +++++++++++++++++++++++++++++++++++++
 drivers/bus/mhi/host/mhi_phc.h     |  28 +++++++
 drivers/bus/mhi/host/pci_generic.c |  23 ++++++
 5 files changed, 210 insertions(+)

diff --git a/drivers/bus/mhi/host/Kconfig b/drivers/bus/mhi/host/Kconfig
index da5cd0c9fc620ab595e742c422f1a22a2a84c7b9..b4eabf3e5c56907de93232f02962040e979c3110 100644
--- a/drivers/bus/mhi/host/Kconfig
+++ b/drivers/bus/mhi/host/Kconfig
@@ -29,3 +29,11 @@ config MHI_BUS_PCI_GENERIC
 	  This driver provides MHI PCI controller driver for devices such as
 	  Qualcomm SDX55 based PCIe modems.
 
+config MHI_BUS_PHC
+	bool "MHI PHC driver"
+	depends on MHI_BUS_PCI_GENERIC
+	help
+	  This driver provides Precision Time Protocol (PTP) clock and
+	  communicates with MHI PCI driver to get the device side timestamp,
+	  which enables precise time synchronization between the host and
+	  the device.
diff --git a/drivers/bus/mhi/host/Makefile b/drivers/bus/mhi/host/Makefile
index 859c2f38451c669b3d3014c374b2b957c99a1cfe..5ba244fe7d596834ea535797efd3428963ba0ed0 100644
--- a/drivers/bus/mhi/host/Makefile
+++ b/drivers/bus/mhi/host/Makefile
@@ -4,3 +4,4 @@ mhi-$(CONFIG_MHI_BUS_DEBUG) += debugfs.o
 
 obj-$(CONFIG_MHI_BUS_PCI_GENERIC) += mhi_pci_generic.o
 mhi_pci_generic-y += pci_generic.o
+mhi_pci_generic-$(CONFIG_MHI_BUS_PHC) += mhi_phc.o
diff --git a/drivers/bus/mhi/host/mhi_phc.c b/drivers/bus/mhi/host/mhi_phc.c
new file mode 100644
index 0000000000000000000000000000000000000000..fa04eb7f6025fa281d86c0a45b5f7d3e61f5ce12
--- /dev/null
+++ b/drivers/bus/mhi/host/mhi_phc.c
@@ -0,0 +1,150 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025, Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mhi.h>
+#include <linux/ptp_clock_kernel.h>
+#include "mhi_phc.h"
+
+#define NSEC 1000000000ULL
+
+/**
+ * struct mhi_phc_dev - MHI PHC device
+ * @ptp_clock: associated PTP clock
+ * @ptp_clock_info: PTP clock information
+ * @mhi_dev: associated mhi device object
+ * @lock: spinlock
+ * @enabled: Flag to track the state of the MHI device
+ */
+struct mhi_phc_dev {
+	struct ptp_clock *ptp_clock;
+	struct ptp_clock_info  ptp_clock_info;
+	struct mhi_device *mhi_dev;
+	spinlock_t lock;
+	bool enabled;
+};
+
+static int qcom_ptp_gettimex64(struct ptp_clock_info *ptp, struct timespec64 *ts,
+			       struct ptp_system_timestamp *sts)
+{
+	struct mhi_phc_dev *phc_dev = container_of(ptp, struct mhi_phc_dev, ptp_clock_info);
+	struct mhi_timesync_info time;
+	ktime_t ktime_cur;
+	unsigned long flags;
+	int ret;
+
+	spin_lock_irqsave(&phc_dev->lock, flags);
+	if (!phc_dev->enabled) {
+		ret = -ENODEV;
+		goto err;
+	}
+
+	ret = mhi_get_remote_tsc_time_sync(phc_dev->mhi_dev, &time);
+	if (ret)
+		goto err;
+
+	ktime_cur = time.t_dev_hi * NSEC + time.t_dev_lo;
+	*ts = ktime_to_timespec64(ktime_cur);
+
+	dev_dbg(&phc_dev->mhi_dev->dev, "TSC time stamps sec:%u nsec:%u current:%lld\n",
+		time.t_dev_hi, time.t_dev_lo, ktime_cur);
+
+	/* Update pre and post timestamps for PTP_SYS_OFFSET_EXTENDED*/
+	if (sts != NULL) {
+		sts->pre_ts = ktime_to_timespec64(time.t_host_pre);
+		sts->post_ts = ktime_to_timespec64(time.t_host_post);
+		dev_dbg(&phc_dev->mhi_dev->dev, "pre:%lld post:%lld\n",
+			time.t_host_pre, time.t_host_post);
+	}
+
+err:
+	spin_unlock_irqrestore(&phc_dev->lock, flags);
+
+	return ret;
+}
+
+int mhi_phc_start(struct mhi_controller *mhi_cntrl)
+{
+	struct mhi_phc_dev *phc_dev = dev_get_drvdata(&mhi_cntrl->mhi_dev->dev);
+	unsigned long flags;
+
+	if (!phc_dev) {
+		dev_err(&mhi_cntrl->mhi_dev->dev, "Driver data is NULL\n");
+		return -ENODEV;
+	}
+
+	spin_lock_irqsave(&phc_dev->lock, flags);
+	phc_dev->enabled = true;
+	spin_unlock_irqrestore(&phc_dev->lock, flags);
+
+	return 0;
+}
+
+int mhi_phc_stop(struct mhi_controller *mhi_cntrl)
+{
+	struct mhi_phc_dev *phc_dev = dev_get_drvdata(&mhi_cntrl->mhi_dev->dev);
+	unsigned long flags;
+
+	if (!phc_dev) {
+		dev_err(&mhi_cntrl->mhi_dev->dev, "Driver data is NULL\n");
+		return -ENODEV;
+	}
+
+	spin_lock_irqsave(&phc_dev->lock, flags);
+	phc_dev->enabled = false;
+	spin_unlock_irqrestore(&phc_dev->lock, flags);
+
+	return 0;
+}
+
+static struct ptp_clock_info qcom_ptp_clock_info = {
+	.owner    = THIS_MODULE,
+	.gettimex64 =  qcom_ptp_gettimex64,
+};
+
+int mhi_phc_init(struct mhi_controller *mhi_cntrl)
+{
+	struct mhi_device *mhi_dev = mhi_cntrl->mhi_dev;
+	struct mhi_phc_dev *phc_dev;
+	int ret;
+
+	phc_dev = devm_kzalloc(&mhi_dev->dev, sizeof(*phc_dev), GFP_KERNEL);
+	if (!phc_dev)
+		return -ENOMEM;
+
+	phc_dev->mhi_dev = mhi_dev;
+
+	phc_dev->ptp_clock_info = qcom_ptp_clock_info;
+	strscpy(phc_dev->ptp_clock_info.name, mhi_dev->name, PTP_CLOCK_NAME_LEN);
+
+	spin_lock_init(&phc_dev->lock);
+
+	phc_dev->ptp_clock = ptp_clock_register(&phc_dev->ptp_clock_info, &mhi_dev->dev);
+	if (IS_ERR(phc_dev->ptp_clock)) {
+		ret = PTR_ERR(phc_dev->ptp_clock);
+		dev_err(&mhi_dev->dev, "Failed to register PTP clock\n");
+		phc_dev->ptp_clock = NULL;
+		return ret;
+	}
+
+	dev_set_drvdata(&mhi_dev->dev, phc_dev);
+
+	dev_dbg(&mhi_dev->dev, "probed MHI PHC dev: %s\n", mhi_dev->name);
+	return 0;
+};
+
+void mhi_phc_exit(struct mhi_controller *mhi_cntrl)
+{
+	struct mhi_phc_dev *phc_dev = dev_get_drvdata(&mhi_cntrl->mhi_dev->dev);
+
+	if (!phc_dev)
+		return;
+
+	/* disable the node */
+	ptp_clock_unregister(phc_dev->ptp_clock);
+	phc_dev->enabled = false;
+}
diff --git a/drivers/bus/mhi/host/mhi_phc.h b/drivers/bus/mhi/host/mhi_phc.h
new file mode 100644
index 0000000000000000000000000000000000000000..e6b0866bc768ba5a8ac3e4c40a99aa2050db1389
--- /dev/null
+++ b/drivers/bus/mhi/host/mhi_phc.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2025, Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifdef CONFIG_MHI_BUS_PHC
+int mhi_phc_init(struct mhi_controller *mhi_cntrl);
+int mhi_phc_start(struct mhi_controller *mhi_cntrl);
+int mhi_phc_stop(struct mhi_controller *mhi_cntrl);
+void mhi_phc_exit(struct mhi_controller *mhi_cntrl);
+#else
+static inline int mhi_phc_init(struct mhi_controller *mhi_cntrl)
+{
+	return 0;
+}
+
+static inline int mhi_phc_start(struct mhi_controller *mhi_cntrl)
+{
+	return 0;
+}
+
+static inline int mhi_phc_stop(struct mhi_controller *mhi_cntrl)
+{
+	return 0;
+}
+
+static inline void mhi_phc_exit(struct mhi_controller *mhi_cntrl) {}
+#endif
diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index b1122c7224bdd469406d96af6d3df342040e1002..6cba5cecd1adb40396bba30c9b2a551898dce871 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -16,6 +16,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/timer.h>
 #include <linux/workqueue.h>
+#include "mhi_phc.h"
 
 #define MHI_PCI_DEFAULT_BAR_NUM 0
 
@@ -1044,6 +1045,7 @@ struct mhi_pci_device {
 	struct timer_list health_check_timer;
 	unsigned long status;
 	bool reset_on_remove;
+	bool mhi_phc_init_done;
 };
 
 #ifdef readq
@@ -1084,6 +1086,7 @@ static void mhi_pci_status_cb(struct mhi_controller *mhi_cntrl,
 			      enum mhi_callback cb)
 {
 	struct pci_dev *pdev = to_pci_dev(mhi_cntrl->cntrl_dev);
+	struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
 
 	/* Nothing to do for now */
 	switch (cb) {
@@ -1091,9 +1094,21 @@ static void mhi_pci_status_cb(struct mhi_controller *mhi_cntrl,
 	case MHI_CB_SYS_ERROR:
 		dev_warn(&pdev->dev, "firmware crashed (%u)\n", cb);
 		pm_runtime_forbid(&pdev->dev);
+		/* Stop PHC */
+		if (mhi_cntrl->tsc_timesync)
+			mhi_phc_stop(mhi_cntrl);
 		break;
 	case MHI_CB_EE_MISSION_MODE:
 		pm_runtime_allow(&pdev->dev);
+		/* Start PHC */
+		if (mhi_cntrl->tsc_timesync) {
+			if (!mhi_pdev->mhi_phc_init_done) {
+				mhi_phc_init(mhi_cntrl);
+				mhi_pdev->mhi_phc_init_done = true;
+			}
+
+			mhi_phc_start(mhi_cntrl);
+		}
 		break;
 	default:
 		break;
@@ -1236,6 +1251,10 @@ static void mhi_pci_recovery_work(struct work_struct *work)
 
 	pm_runtime_forbid(&pdev->dev);
 
+	/* Stop PHC */
+	if (mhi_cntrl->tsc_timesync)
+		mhi_phc_stop(mhi_cntrl);
+
 	/* Clean up MHI state */
 	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
 		mhi_power_down(mhi_cntrl, false);
@@ -1457,6 +1476,10 @@ static void mhi_pci_remove(struct pci_dev *pdev)
 		timer_delete_sync(&mhi_pdev->health_check_timer);
 	cancel_work_sync(&mhi_pdev->recovery_work);
 
+	/* Remove PHC */
+	if (mhi_cntrl->tsc_timesync)
+		mhi_phc_exit(mhi_cntrl);
+
 	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
 		mhi_power_down(mhi_cntrl, true);
 		mhi_unprepare_after_power_down(mhi_cntrl);

-- 
2.34.1


