Return-Path: <linux-arm-msm+bounces-95973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uMm7ISIQrGlIjgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 12:46:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0391322B8E3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 12:46:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 94B18308D740
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Mar 2026 11:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB1663644D4;
	Sat,  7 Mar 2026 11:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MMLBSZCE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eyGgpbJR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAD7357727
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Mar 2026 11:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772883760; cv=none; b=svGvi9UX0WY1xiosKP5eutbFAYgNJ2D9v5TQOa13ehdBvwvYrz/hdwMB4in7rMVF8DzD/gieHJmFzeVr+qBZ9G8GMRFQ+x+JigjfrT5Z3qHFfaNIsj3xlMTbM1tm3HpKv0AtsRmHvZ1tW2k1NvqtY7QMxVznWqXWmZ5Iz26XCCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772883760; c=relaxed/simple;
	bh=PYlMjATY4SM1+jaLjbUMOn336QEIJpGFcRpjUcyzz/4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Iit8oEr2JFhExaicJMwwGbQQXKYYzY8y3iXPK/Lu1Qi7mzEeJb+ZqqGosRkrsKEu5Bw1yBVI91TFObwxIoJkswk+ogr0C5uIWu4sIjnTr7xHZZqMQfUstIubSG0izCAvs6PSvYYjXR3X9APVT7bIyaHdKGhJgmnyjO1Krutw5Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MMLBSZCE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eyGgpbJR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 627BGibs2177864
	for <linux-arm-msm@vger.kernel.org>; Sat, 7 Mar 2026 11:42:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AhZtQR443/E19GewAj1186Zwj+uyAl6zxJPtQ9r8Toc=; b=MMLBSZCEODmf65KM
	WTGAu6cSZXV8zO7KcZdu1QYppchEuMAjFw9PsZaPDSObGoHSV298OjX4rRlxS31a
	ShLIjSX4e/Il5ULFHLHHdpiOO+0YTvtxszMTTF1v2IotkKKKuueLpqbJcE9pbAHW
	q0N93E2L1djGKr7yNLzYkdDgPwJYxGhSmlWn5sn9PVfOxXZFxK5bSrYiEd1sxYy4
	DvO8k2StvOjyipliFk/crY/2v/2jFHO/RTy3khQm23o8EdGHwQR5hMVfo7SoQ5vx
	+KAs/2nqUXTLOUyCE9CoL8u0YM91zUF3WkeOZi14dDXrqs8XwuLS1HFM2utOrtN/
	N7KKvA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr9cph1sg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 07 Mar 2026 11:42:37 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae47b3adacso63908615ad.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Mar 2026 03:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772883756; x=1773488556; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AhZtQR443/E19GewAj1186Zwj+uyAl6zxJPtQ9r8Toc=;
        b=eyGgpbJRMN0YyZHmmhVq2edKK1PvfrGXZ1cw81wOijSv/chc8/X/QUh/O6PyQRAGlc
         WKK/8HSynN9BxHImaQtW+AjZjNdYtazUriEkFutJOeYH2VBLe1KAtTisndzOwfGweWNn
         kkxEKz2JmAqfWrP1QVzzI1k46SsSb36Of+ONwxCq2U8/QeUXt63/iyi8B7cU441JoY4M
         izi/efQPWlBxfZBraCs3Yl739Xv6sJ4CTIVk1cPNUZFf9t+WUYgdjUOZm2GrqvhwEu5u
         h0WPXtXgNLFpEr7QJ1OHgoBHN57KPk5cVaLLWwb+4KFs+4BOl/MgZ459Nblj1/zIb5z0
         BhdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772883756; x=1773488556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AhZtQR443/E19GewAj1186Zwj+uyAl6zxJPtQ9r8Toc=;
        b=I+LY99zJ1Ic6q7qrP2IXw4X8Fu+kdMiqLZYukkhzKYvg1x5dYJjlNM9g1aQxzi45EH
         ao1E4tX9l7IGrZrxmvY/qnq8UEyI+MhVbWaLanbrv4AaUc0qJv37c6Hl657W0JvP9Pir
         xns6hYKgFVIaRlQzmcEIgwABTBScENZ7QIsdGwJlK73K5yYqrYNkZxSWRaznLGJGGlfV
         r4gcivaxO78Nj0x+bqayHUZEpxGD1jOUpwQ8nMW/bG2tcSb69iZyY2NscACCA3kAqfJK
         v2kpSqu8f/O7CM2uOtbY07Bi9ZC8N1ctQzxjKlk8cB9Caz/byymf+uc6lo0HdI1ittPa
         Dduw==
X-Forwarded-Encrypted: i=1; AJvYcCXJZhcpZjzcLKLT/9Z2T14IcU8RnPbJ8tVYBhgMVyt8CU62Sxnob8LU/Mo+17qUttpoEtDb9qk3MU+3sQc9@vger.kernel.org
X-Gm-Message-State: AOJu0YzJKzC7U8DpS/4wkoJzNfubPEjpdlMfqq+OJpRtwXCEbP0E9Lzg
	5qrSMgMIWlbS6GhrpI1aeOKHlRsj7kAnSWmafR0U2EA7DIa6VuIzJxDy6hsc0JXMkrrdMEwvkKi
	/42JdlJLrnPly27qk0e+dgVk2zCg1pKI5qRzeDwohCuCHHHzOoNO9QYzw1pZo9UG9lNwW
X-Gm-Gg: ATEYQzyr5mT4OOZHPZEn3RRjUNMONxMCdpZ9Ps7266oWyM2VZhoNh84pF5Jk96Ozfmw
	Kl0RA7msShDHVecsugAtUAvZt3mty+G+YUxExne83Uw1RdUJOTILkV1daUXLvTkEhBG4DJZ2rlK
	6pPEyD6ARxVN/+pQYifwiwYoVp+TIirGrbO02ra78IlRDh1y+VbC5o4B/k4v/1f2kmzCnEFu0yZ
	sFwtlyIHCCETWitfVTmKv/eXNiNXdqwqPU5KjLX5qnEdnlI9M7F4TVYUs5R0GK+kiZkFRkwAheI
	K7W6JFHEBJ3vr0EsC+AO7X+uGkqiIuc1CGX7sKFwXW2ih3BTpyAJQ3/HCo16gLUyu3nVPtuIn3I
	UAwc4ntEU4KayRhzN0KGCP8LsOA30GZ+RetSPfYBrcZhn2mBqkfM=
X-Received: by 2002:a17:902:e549:b0:2ae:5848:baf0 with SMTP id d9443c01a7336-2ae8241685bmr59503435ad.2.1772883756454;
        Sat, 07 Mar 2026 03:42:36 -0800 (PST)
X-Received: by 2002:a17:902:e549:b0:2ae:5848:baf0 with SMTP id d9443c01a7336-2ae8241685bmr59503205ad.2.1772883755994;
        Sat, 07 Mar 2026 03:42:35 -0800 (PST)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f8c713sm47996145ad.66.2026.03.07.03.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 03:42:35 -0800 (PST)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Sat, 07 Mar 2026 17:11:30 +0530
Subject: [PATCH v2 9/9] Documentation: ABI: Add sysfs ABI documentation for
 DDR training data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260307-sahara_protocol_new_v2-v2-9-29dc748b5e9c@oss.qualcomm.com>
References: <20260307-sahara_protocol_new_v2-v2-0-29dc748b5e9c@oss.qualcomm.com>
In-Reply-To: <20260307-sahara_protocol_new_v2-v2-0-29dc748b5e9c@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772883713; l=1903;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=PYlMjATY4SM1+jaLjbUMOn336QEIJpGFcRpjUcyzz/4=;
 b=w+aHsVXwaMyLhL8Goe7uM28s40e002IzrEGaReObHvVofLk2hwgKkxUc87dYK5Uy5uT4SJ0v/
 IsfocM9Rc+BB12kavhO74NwlBai980rYUSUPMwBcVaAgD/rMcxEMAB+
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA3MDEwNiBTYWx0ZWRfX9mxV4+/Zjqf2
 bl9Wci0DPWVoRydIgxQEXz6tCKIsQRtG5obrKGlOxQ/Q8JLyquLYHkQROVnU0mAZyfb3qU3ff5G
 LFwSYCmv8ZG7AQ2P+AIHSUw2aOo5wol7XzHmoGiqq6z6tS8be7kpaPDBSXup4bsScHhArwDFJfp
 tGc8TyQGdPL/455iU/JfVO8DgJ+z3f1AxruSpJbv04oCJUxnHLEacmwKqW5hOht+as2fGdS4EjY
 yIR1jW5RCIFGeJ2vBhhfOKNZKCmd2zFRwmNePUSIpEf1dbR9emWIOmB8u7yzjRHk85KMZ8iiKdF
 a/nxEmgTdlgYvHzZISvkbwpIXBfrOwxwv18QnwEm1wbSbDC6JVWCYbV1pt2UAQ/1/W64KrW5jv2
 M39Cq13bZDz65unBJHQ5y5fHZbrDw8aPw9UtQklxNkZtq1Oxg2jsMB69t9fQb9GazI+KYsMMCKG
 Ui4TwL6PD6izuvmzA8w==
X-Proofpoint-ORIG-GUID: xAqS9bjlQBDDv2Ht3lbMC42z6biA-zrB
X-Proofpoint-GUID: xAqS9bjlQBDDv2Ht3lbMC42z6biA-zrB
X-Authority-Analysis: v=2.4 cv=e7sLiKp/ c=1 sm=1 tr=0 ts=69ac0f2d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=dkV1H7vRkoxx0F9zaYgA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-07_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603070106
X-Rspamd-Queue-Id: 0391322B8E3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-95973-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.959];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

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


