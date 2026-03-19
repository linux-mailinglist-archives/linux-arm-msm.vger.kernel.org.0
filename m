Return-Path: <linux-arm-msm+bounces-98649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6D9yFW6Zu2nwlgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 07:36:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B03BB2C6D8F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 07:36:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E598321FB8F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 06:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08A0634E743;
	Thu, 19 Mar 2026 06:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XjdYOj6Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jZeqoXra"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEADC34F484
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 06:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773901949; cv=none; b=CyqU3BIGitHUv6OasE3GYWzU0SnJYFFCL1h7YKDYiv2SJAk2I0bM/CL6LjU2niaQ7COuh7a/awhlC39HrJLR9aGqqjRUwEqiXWm/C1Plwo0DgysFTWg06hHJCWcl1Y8lobWZ/yFG++xMSOKMXaq9JkaL+JNxAbUvNhhRAJ/1t+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773901949; c=relaxed/simple;
	bh=PYlMjATY4SM1+jaLjbUMOn336QEIJpGFcRpjUcyzz/4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hI4YSmlOq5iSNRYu0Sw0uTc93e0A3kDBoRETRZYYukeFAlIIGGsZleVfPoX9+Mh8atpgv5/pT4NJXoT9ZkVTw2B+ctIhhay/vB9MHx1SG2f9/d6rCOE2qgU2ybB1mTBWetzUIt3vm3kFQdpsijLl+OMfmrPs5Qz4lvclgYFgAgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XjdYOj6Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jZeqoXra; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J5Xn9v2470005
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 06:32:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AhZtQR443/E19GewAj1186Zwj+uyAl6zxJPtQ9r8Toc=; b=XjdYOj6ZySs+ffOQ
	nIXhwt5OeOeWVukqAGGFaWFnkYi1qnr565OZs+NKGzUFqDEEMmFMAPrgo4nld+DW
	Ip9FlKU2r1dwY1+JHnFUeDSH1RF9RnqLCKQfLnhYNSfW7F79oYWtJ5S/GvurHkRQ
	Br9J39bODzuBspngARD1uc53SXDHWMGl7sEGOeX7vRsccZs9uYSQva52f6XysenQ
	Of6izH1A8FoqhEg1sFg39oPMc9xKwg4JVW6eU5OWbqGpP7AMcMGgculpSra5MXcY
	3JRWd30EVQF3SI4d/t9bsIwgr830exrO5qD65OmraYUqzUgeO1N1rC8L915SIl4G
	RwUmsQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytj53msc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 06:32:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b079b4a8c3so40050135ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 23:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773901946; x=1774506746; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AhZtQR443/E19GewAj1186Zwj+uyAl6zxJPtQ9r8Toc=;
        b=jZeqoXraWgrM9ufxqtsTdrn4GKpEiqTI/MbLwQ1hsTbeHPCq3fQrHW9rpz7M6eiNtY
         L/ddgf3MmNWrYSFp004HMEh/V4nZRuoo+2C3+iYlNGDJw/u4JE9jHpBZbFyeFY7EOJ4s
         yOk+Z1QQ2LDcDuaKfLIhsofWrjQLmbe+RgQGurgIolcfqXFgsebwYoRDQTV481/VN8XW
         FtgN00i46CDNRoBuKvX1wpGFX4wNfpy9dKw5Y3defk0BUFmpR5LdI3nORLzZKcgWVsuy
         mtowrgFc+wxA1//ORPh/1/TaFfd0zpXPivMSfFU2tNUq3kLk9hIi+CMM4CitlTswkPi2
         3hYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773901946; x=1774506746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AhZtQR443/E19GewAj1186Zwj+uyAl6zxJPtQ9r8Toc=;
        b=piJ6yjOK4sfaFxlT3xutlZFHY4zE7IK+kc95hgV84caJf71w577IJiseaFhXpNEw22
         oZwLuFCukZj4bf68ElNg40K8dRrwaNDnHdwScDYaED1qSbnjL+bxENCw1JJ46WGCGue3
         aBWCmq1FIdeLGSj5aJd4pSohLZf6ummVZ/z9ckcoUVyJNa5n6YWz6922fBNQdfrqk65A
         0dkmsKDHUh97bZGrdjpkUAzw6iGxava9z1CwYbwOZ1fgK4n1FrPrsM6eBOXe03+kxqZH
         xfLmAXN5VBJz7k/XRDXiT9PX1WgSg2sgKzNZ+3I3GNiGZHNuWzqu+8wxAzgXhhXyTn5G
         iF/A==
X-Forwarded-Encrypted: i=1; AJvYcCXK7nTwC7w8YIOQsn6rbBHL3Jc8imo02gDj6mciufDeTl3EpkLsYjJNw7/fXEMdIC8SE8kGUz/n9X5jGigo@vger.kernel.org
X-Gm-Message-State: AOJu0YzFFptwH2IPccP42Wbqvf77SSVwe8IGS21fBO87aADgnnXrwEBb
	Fr7JKa41e9Wqyvjvlc0LWQeI16L8PHLwLNE4Aci9o4hYajsvShsszGpfIOZdxtcacYgCMsjtVGB
	yspabMZ9dMC9RSDGFsqlEa9GbOJndCzAU2dTZjrGxZyux0wgFBoLmwkqLoZAwBXcz6SIQNJ6Xrx
	qT
X-Gm-Gg: ATEYQzx8r5mj0qw/MMu1WAmFswUkjnkzi0eTcNtJVYnlX/n9UmVn5xKNwTO3MUKGrQd
	srWu1mdJ6vZ31I25mP37G0H7Q79p67nodgfc4nreSwGcZwnWToPp0nE9DjEw4PJiUeMMHfoc4Vf
	7vSxrwM/Dog2mTD2dEHxpHtYMyv7qE9mfKHTjVGD0OEUileqyCmofAHW5W6nA64es9CKRvQXORZ
	IYpPz5ZzAOKXAg7UAREbmVNIKz5MjLvrZz1tEo5HxjF5OiY7bcig06XHNWsYyI5grtdkIQFIuZ3
	7EGwXKIbPvw4cakjdigUzz8ncJiG7poi3sXAthPPVoxG6qk4+/FL6LgFRWQBUyd4S/S4t6a60aU
	yE3ifFOJeYrmETfMUeNXvff1IEwg3iCT10DmOYSFn/rAMysFX0VE=
X-Received: by 2002:a17:903:2a8b:b0:2ae:5776:45f8 with SMTP id d9443c01a7336-2b06e3236d0mr66217225ad.3.1773901946580;
        Wed, 18 Mar 2026 23:32:26 -0700 (PDT)
X-Received: by 2002:a17:903:2a8b:b0:2ae:5776:45f8 with SMTP id d9443c01a7336-2b06e3236d0mr66216985ad.3.1773901946126;
        Wed, 18 Mar 2026 23:32:26 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e603937sm48572485ad.57.2026.03.18.23.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 23:32:25 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 12:01:49 +0530
Subject: [PATCH v4 9/9] Documentation: ABI: Add sysfs ABI documentation for
 DDR training data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-sahara_protocol_new_v2-v4-9-47ad79308762@oss.qualcomm.com>
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
In-Reply-To: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, andersson@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773901902; l=1903;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=PYlMjATY4SM1+jaLjbUMOn336QEIJpGFcRpjUcyzz/4=;
 b=oDJdabj+nevZsLKRAXC74rtzAHVO/YwH4bO6LZREstgcBsTlP0qNzP0ID0HAYGXuCGebsRFDN
 Qk9A9oeSuz4B1G+ilAYFW3ypjpCNAaWqO0Yl/9a3wvCY/fV+jBI0yuO
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA0OSBTYWx0ZWRfX7Xbr4gfVs4RG
 fPrD6YQVmeiYV2poJF57pxa6as5JSXft2mZkD87MQwEOFcUfzUDDopcmZGIRvvZcdkS6gm8f7p8
 M0t2D3uh6wZV5PT8cuksExQ58yQipY1bAufojjZFFyAWAPe13kWqT+pFyU9egidtdsCVG/FFo75
 EbZQ2fuh+t8eWxSsWm+ApV/3RVtCFWP9f5HkMzE98KPIJjoIdXePxJXPN3+KJ0m0M0ege56pUM/
 uyTuQAfGlcOHGmg3vTStaq/vazDxIJNM5/k9yJg3M63U1FM0Dfu8tdz8xfs1C1yxdifLqK7c7gw
 Ip4iBKvfC3VblKTldA1Owt5uPCTdOsunLD+kvM9MQa7H/2/O6SEkyvBVqWE8vpAj6D4vFgknuC7
 AMJ+jtxgu0w7oc9HQWFHzGMDBbwwa2jwvCzlZRJto0ar/mBo9VNzHK+v8PpD+au0yV+CIItk0vY
 oMFELOYtdI9JNI9THcw==
X-Proofpoint-ORIG-GUID: ek3pIyAEo991wItRBRaTLXBqfoqVKY3H
X-Proofpoint-GUID: ek3pIyAEo991wItRBRaTLXBqfoqVKY3H
X-Authority-Analysis: v=2.4 cv=dM+rWeZb c=1 sm=1 tr=0 ts=69bb987b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=dkV1H7vRkoxx0F9zaYgA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190049
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-98649-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B03BB2C6D8F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add ABI documentation for the DDR training data sysfs attribute exposed by
the sahara MHI driver.

The documented sysfs node provides read-only access to the DDR training
data captured during sahara command mode and exposed via the MHI
controller device. This allows userspace to read the training data and
manage it as needed outside the kernel.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-mhi-ddr_training_data       | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data b/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data
new file mode 100644
index 0000000000000000000000000000000000000000..810b487b5a5fdba133d81255f9879844e3938a10
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data
@@ -0,0 +1,19 @@
+What:                   /sys/bus/mhi/devices/<mhi-cntrl>/ddr_training_data
+
+Date:                   March 2026
+
+Contact:                Kishore Batta <kishore.batta@oss.qualcomm.com>
+
+Description:            Contains the DDR training data for the Qualcomm device
+                        connected. MHI driver populates different controller
+                        nodes for each device. The DDR training data is exposed
+                        to userspace to read and save the training data file to
+                        the filesystem. In the subsequent boot up of the device,
+                        the training data is restored from host to device
+                        optimizing the boot up time of the device.
+
+Usage:                  Example for reading DDR training data:
+                        cat /sys/bus/mhi/devices/mhi0/ddr_training_data
+
+Permissions:            The file permissions are set to 0444 allowing read
+                        access.

-- 
2.34.1


