Return-Path: <linux-arm-msm+bounces-96517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPriFpTHr2nWcAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 08:26:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B457E2464D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 08:26:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 041B53170659
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 07:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C742A3E717C;
	Tue, 10 Mar 2026 07:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OSQUoMBa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aoIVQuo/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691603E717E
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 07:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773127371; cv=none; b=U8vWCVtBNnZ3Me7tOV/zFAtq5YULaloFMOK2ryuLT81scoXFFHH1qZ6qalB/TB9c5WxcfZNcgTCsNMiv/w5trD6IdGZZCab6tRzc0P7w3ce4iUQuLNyxPWxEagFfOnVHUKKwn2fs2lc52p8XnUrMBpIwESxzJdfj+mrjebLtE7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773127371; c=relaxed/simple;
	bh=PYlMjATY4SM1+jaLjbUMOn336QEIJpGFcRpjUcyzz/4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jo8WH8To+1pTei3e6VdoWsP5Cii9eb1gaVUxVW1/Mt4GmjzV10FswbEZ37kDtie0eJY06stxLAlj4CzKQtA/jLFuKIYB5mnBH4kb3eXh4SXQJAnmpScySBKdWV0LZXwU5t9OZi62GliuhSIoyj6f7cXRn7opP7EL0ZU0EoOd+Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OSQUoMBa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aoIVQuo/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2EBRU246501
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 07:22:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AhZtQR443/E19GewAj1186Zwj+uyAl6zxJPtQ9r8Toc=; b=OSQUoMBakbHD4hGg
	hdEEZESxYnrKgEiNiGZF9XYy6J7UY0NiX8arF6UUes3B04tI4z439vt9YTljux8Z
	uhRy3tfLRjLA0tZOLflDX0Rc20zO8/pYDIqD59X01yk/zY51ov6dATB6WQREYciM
	WsntOdOthV9ni3EuJyVt4J56Tkn7jUVCnjq32UDMeJXRkvgkopgC/tmJ9IWVG+Wf
	tJpi5uGyx4GjJgYSMVF8BACx48dl4pqe7ZtCtdcfZltevIiy23eXyS0pNknN7M/M
	hkxcAWT93Cdo9L7FBQjBZrZRRwnN4Lg4xeLfcK7GmWysLZy21XJo8Y4n+G/pBhM3
	aa6Shw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct8801a0m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 07:22:49 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae5031c6b1so79026035ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 00:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773127369; x=1773732169; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AhZtQR443/E19GewAj1186Zwj+uyAl6zxJPtQ9r8Toc=;
        b=aoIVQuo/NVgwsjEXYNZkTsXj5mEe7CJbtj65DoJml4ZT/UmDmDVHQGkd2Z6x23PtH4
         g3Lf2YXUeki41cjg3DT8+rR+kgPlR55IooDSNl+u0pMN6B/6at47SjgF0BKIslSBqgs8
         hL06siIzWUpAPjCLsBRMur3hfXciYajBAU7a4PcfPzgHM4C/dTg9YxzawVlXNjxeCIMO
         XOR6NTeMBQWSrpA7YGl0I69hppkEBwNz5AJSMQLxVM6IVxxdTPxtsxpUElLOqNayk50j
         kKxHzQnX58hk6hCEPrr9bPe2s0G4ePVD37BWEfyON6pAzQYo582v+iLDC0Sa86R1Dnki
         7iqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773127369; x=1773732169;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AhZtQR443/E19GewAj1186Zwj+uyAl6zxJPtQ9r8Toc=;
        b=IUgQtGy63TH8sc8Sr3d2iM+9dEabuv24KrlKrQvnmnY3ye0prPl2hSFt4ycYD4Xxid
         +JBkzS1g/WLgK0sbGnspMY99LmGyZWlD/c+39qquWMk/P0pe73YPFyYi5PID7vDI5Xdx
         zOf44/cGqzM/UF9s/RY06/wbVqg06X+XSK90ev3NrPYPyZt66tqgqHClbnNAKDjFVXRY
         ghdGJAus/8lunA3o9NNU/BR0gt7C+mdvboiddBVKmt+hdjs0HOw9nD7dYN4ovwyIp2zt
         bYCvNx7f2WsxZQ03SGSHnSLDE6d5CCGDGG26EbuLMktjCHbH5G4QZMPT6ymMQ/x5hNfB
         zM7A==
X-Forwarded-Encrypted: i=1; AJvYcCVvOsfmY5R3WHnglo4gMLnGWs1qqOg8xxFhSL528QGyxM8bVezDpxNo3Dy/T0Ozyq4kxehPj0rtO25tf5rJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwzjoofNGbkBx9NrVe6DxQ9IeoFiqoYgnwK6o6f/JNqk4aRrP7y
	HK4epiyRGbd4Hf+OLwXcTq5resD/OKUhQFrfISwqY56ocgF7YpITJTZ8rj1xJi2C4LwVdUG1u50
	u3t00jFDUOtomhmkLGw6+dxlSXRhelSjohkD1PNazgYqBBBauuZDT1uKfYoBUL1dg3KhV
X-Gm-Gg: ATEYQzww9V+P+V8RG1T9Uo9ESP8+OJfLygFULjpt2CXJe8XY4R0zlNmVRN5LY1LgRXI
	iZbpgLOPzBEZ7V1F8pVCeGo5aXx2a68B/rGxNU8HljgDee1YPTXow6upZl8x6aPVJXcuKM9x3te
	nS1m6tZxoL0CEc7gGlL3u5ao+SzjgU2FRhg0Rk3U2hrvgsjAbtBGUM4NRXf9tb0RXNQIqaGDy9o
	23a9gQ3OdvSdS6xO3LZoC/CCBSxwxUDIU0LgvqMDQOKUnWXHk8a5Dj+x5BYo5i8OxgpvkuxnqTD
	zM1IXZCG3/4jyqKSQiTQX2klgYz9WInNe8zYybC2HzriemafF1getWn/ZyrkTkjQdEiuqx8Dd3m
	k4c+JYC3JpZ9zMqkfGm03ZL4AQDogErLK7smt4JXeXss3W1BtlZI=
X-Received: by 2002:a17:902:cf05:b0:2ae:829d:3c33 with SMTP id d9443c01a7336-2ae829d3f2emr149862895ad.8.1773127369014;
        Tue, 10 Mar 2026 00:22:49 -0700 (PDT)
X-Received: by 2002:a17:902:cf05:b0:2ae:829d:3c33 with SMTP id d9443c01a7336-2ae829d3f2emr149862565ad.8.1773127368570;
        Tue, 10 Mar 2026 00:22:48 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840b2e9dsm185200325ad.85.2026.03.10.00.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 00:22:48 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 12:52:06 +0530
Subject: [PATCH v3 9/9] Documentation: ABI: Add sysfs ABI documentation for
 DDR training data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-sahara_protocol_new_v2-v3-9-994ea4b0d5ad@oss.qualcomm.com>
References: <20260310-sahara_protocol_new_v2-v3-0-994ea4b0d5ad@oss.qualcomm.com>
In-Reply-To: <20260310-sahara_protocol_new_v2-v3-0-994ea4b0d5ad@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773127328; l=1903;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=PYlMjATY4SM1+jaLjbUMOn336QEIJpGFcRpjUcyzz/4=;
 b=A2ngy+Vh6mGbywAacQ1WhpnAXl4OfWSksXvxmtXi88x0yTGDf+9jd2T6SE6lkrsx9nv4dwTSR
 O/grnwx19PsAypGENZxaAsrKGNdaoKkokxmqVFwm6mmcVFtenk5b9bW
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA2MSBTYWx0ZWRfX8Uufot43fzYw
 vxPo/ETnvAkx/U8HA5TTljeWk+PscIXx0ySxCzcIB6f71j+OFKTKHXd7m/C5rXSWA9lEo9/0KbZ
 BeGhZhrflgSdc54ztwSo8iBd7l9c/Xa0hZ9jfwEAO0tReEsceNRdqubv+wjFElcsJgpmIKFB9oP
 C05xg131yu5rL3sbQiu3lgwcxfrNY9j3cFmpA1ZJJ8pTNqTKOIiW9OFoMmgSLZBsT5Qj+kkjvKQ
 roisZYco7PzgNN8LedSIJMYmMk/bwtO8c/7CyUQNjO2JoCPsFiU/1BrfiY3G6rTpgpgpyy+kOUD
 VwXqlitCkbwE0+3P+au8AsiSuJ6R//Vvp2idnd8pU22NMfZXDYyLOF0gEZaquWNtxsOLrDZqYr6
 +6OQrGrQxcYlYMaPs3XQnc2XBS6/GR6E1MKNDFOBkAFQ9f4QaQ3+nCzMHDP7+ch1bYZKUP7+9is
 CLD2aIs6gSQF5JaRaRA==
X-Proofpoint-GUID: xekcWOrXebBoTryfQYwUUw9Bl8Lutt8d
X-Authority-Analysis: v=2.4 cv=Jtf8bc4C c=1 sm=1 tr=0 ts=69afc6c9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=dkV1H7vRkoxx0F9zaYgA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: xekcWOrXebBoTryfQYwUUw9Bl8Lutt8d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100061
X-Rspamd-Queue-Id: B457E2464D7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-96517-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
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


