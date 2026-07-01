Return-Path: <linux-arm-msm+bounces-115656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fVaROlLuRGrB3QoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 12:39:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8129D6EC41B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 12:39:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=aEs6ogGG;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=czPhsKRu;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115656-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115656-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9B8CC3013BBE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 10:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D98642883E;
	Wed,  1 Jul 2026 10:38:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B62423173
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 10:38:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782902302; cv=none; b=TroSX8T7khwc3S2ard7cQJ7uZvqG7Zzuwf0evbJ8KW9OM+ohQykp0GZrO34GwICLiiAKwnF3W1QkUihOyFbGTJJtsFRn9x3mqa2YUblGOLWTmKBR/vdgLUcALGwU3RX8cMXR4YVV4dk6QgeSfljiEDq+4vhVnoK5MSm95qMKWYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782902302; c=relaxed/simple;
	bh=Jan+rO3lHREsYWShXbf2aFwmvonRIbh7Bu+veXE/AIU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f7RqQXwDse7leDk5zu9pIurs2+LRFsCfaU/NV5Bvu85U9nvWJhalFT6Z5zaLOe2Fi1Ks0nN2Wj+lX6KBJfDZyRzc00rkmRU9mflRiYhD7vSiSHZuOlSGP8uvcBfVCQgWiDAPvk63ccp7O82e3Ph0bczNEre2UmYc2a/cM6959sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aEs6ogGG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=czPhsKRu; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8u6H673903
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 10:38:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ok+6fNf56WQpIHo1nYgzH/b5G92QcDwfXWueRnDPmYA=; b=aEs6ogGGQDI74RO/
	lRblGrlJ+2OeazJFLlUe+c44as9KDJvck6imiu0lQHDBWfm2IQyJosWij8m2Mizo
	GE9DvpzYy5FdSuPaYc9UaaV6dh9CWfjTJwRkpz4bVhHIqwTleNU3wSvVzmCVGd8l
	pupHFbqm3H9fGUE9EzjwK160C0hiRWLiuFzGQQ9Rw6ilImQgPfjY6vAfpzzwyPyA
	fAD531S9z3di9k3RX+keHKw5am3xfo1kf9MRqfMfDDn7/dOkve1mkA2D8omnuVoS
	hoxA9OH5EI/hbC4nvfbQJjTTK0cUUujvbG4jfjyZ5veoz7Nb+sza9Va9oFdO6Bt1
	Dtu9jQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f502urbq6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 10:38:19 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37fccad2b01so852858a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 03:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782902299; x=1783507099; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ok+6fNf56WQpIHo1nYgzH/b5G92QcDwfXWueRnDPmYA=;
        b=czPhsKRu4mw1jLz4t4q2lXOoBvZWNRwAWHBWP70HadnTi6r9c28lXM48NqM/ntdXvW
         Bq30lD1tjkusitIG/0Lay2XHqNjTXQ+ILJD7HM5ZuEVap2Gwmlm859MvRMTj4enbsktR
         3osKp3u4bRXsJdIVtgE3ppP9et0AFI/6BUIbuLwS3yHOYQ4Apll6M1y3H9Ky1wCFf7pA
         gudugqR95dGdCbXeZC7v4cSHTUBjX8VZTaUE434R07P6EW0FKrKcSBOt/kUvhSGO0+an
         A3/2F95lgbj3RTQn+Q0BsW6BrDPzp8ykUDP9rZ/fhMD02WSyvELE6ZdUNYCkf4mEG+VG
         vo6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782902299; x=1783507099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ok+6fNf56WQpIHo1nYgzH/b5G92QcDwfXWueRnDPmYA=;
        b=aZu1ZY+ykp0yt+TNkJeXH5GwVvMcKPc6eYA6m+29zGRNS35X+mZ401tlvYaEs5/oXw
         Ahkntw+7D9we8Qqryy82411Gc3Fl6pV15tXaEY3Rv/7ZONpqJEeKD3yqe9TFwkMuzODG
         n21zhlqe8yRDJMWwVQJaHqb0HUyPw1Myb38OsJMwtbH8nQop71dS/jTgL11g8g1RwxEC
         AmzMtfnAC8VS3dz+zeCJ79fRwBBydhHf4w83TPyJrDS5B46VtdmME0d3Mos91p5YhZ+L
         rLRMvzVbrwvNOp4o/LppSI0rbHKlSRwi7+w2XXOmPhopb6oFXvzL/+eWKucS4HQ3+n0Y
         ZhPQ==
X-Forwarded-Encrypted: i=1; AHgh+RpC4xUgk6DM2nD6N7K72McgQrOnPFkOJc89CoCpeOs6jFot8d7TpNoRTy+ToW8nPpTfh76y6WfGd9D+S3o7@vger.kernel.org
X-Gm-Message-State: AOJu0YwtvNZpPM3LDg/NOUhL/KhnlB8YwLwwlwd9pgT47hm37EPjPCqI
	DAVd2yDiXJQHV8M8k4p7XY+uualvFGlEKoASzO493qsqXVr1rvnj0gJe4Scll6Ze5KJnIQH66zS
	4dtXDVIKf29sfSgaOKB6vl0T31hzfJ25VQoeUTWya86OsgB21Kjf0rp7mllzEqLmjs9rJ
X-Gm-Gg: AfdE7cmVEj95f7WznQk2uUjfFkHdE0nYGV5YzZcdDJwK/11NZSeock2RAaWND0YOVNI
	5lLeXASv/OOmEgczQvj/6Nlpg3LU2u2oOwwF4lLG9YCLz/jJAyYmNelQdfqh4tUuA1QHSH6Od2Q
	i/quVQvAuKv3fagkhuf/wjZmyv5dxvnVVOOCiSJ0Aezj5JXERTIG4kxRPVlo13NnPNvksc3oi4x
	EKOmeKaIdDjttVDIaxmLhmUqsnyxcfhEbH++o53FxXgBnGdA0Be3MczglUoDBZ1M1M5A938vq82
	7d1lA1DHa9qrhfiJiBmB6JhdNW6V7JL3oIC+K8j2mosuaos7cRLYsaPkqZwsu1evIeWDLDTBinO
	KOjgoY73VBj5/WDy1zl39p99ge3t2fSJn2N9MFr8S
X-Received: by 2002:a17:90b:17cd:b0:36b:9c4a:e05d with SMTP id 98e67ed59e1d1-380ba9455b4mr221618a91.17.1782902298747;
        Wed, 01 Jul 2026 03:38:18 -0700 (PDT)
X-Received: by 2002:a17:90b:17cd:b0:36b:9c4a:e05d with SMTP id 98e67ed59e1d1-380ba9455b4mr221594a91.17.1782902298250;
        Wed, 01 Jul 2026 03:38:18 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38095bc8a2asm765251a91.0.2026.07.01.03.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:38:17 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 16:07:41 +0530
Subject: [PATCH v6 7/7] bus: mhi: Expose DDR training data via controller
 sysfs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-sahara_protocol_new_v2-v6-7-3a78362c4741@oss.qualcomm.com>
References: <20260701-sahara_protocol_new_v2-v6-0-3a78362c4741@oss.qualcomm.com>
In-Reply-To: <20260701-sahara_protocol_new_v2-v6-0-3a78362c4741@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782902263; l=5210;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=Jan+rO3lHREsYWShXbf2aFwmvonRIbh7Bu+veXE/AIU=;
 b=1aIjX2/TG/4sjfrA0UmBKYhS7juF931y5uK7Gq7FUFa9jfohXouXcnQFh9yaSzTv8NA4fWyk3
 +pWLVc+XgmyD6NA7Aks92EyaC86mt609EWMML0n5d2hWDNfOuI52pJL
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExMSBTYWx0ZWRfX/+KlOdoT2VTG
 1gUlycVkjnsvJRuIpk1NUw+80AC5T3ZrnVbBDnZR0OJeAgVmDn8kvXyZ60BCuJJjpJtHTyDLgak
 FFuhytwCfHR/RU1YYKkkEIxmXJmxRTE=
X-Proofpoint-GUID: hokONJTON256Zoxn4VaScVx7wJFV2Hpi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExMSBTYWx0ZWRfX3JCeJWBj5v1x
 TPJ9LxhPxWGWseeUBeJGcJO9Du2EQHBhmZMtMcMgNz6JrjI+eWvjlvD8t0D6Wo8VEWXZ8+V+dPl
 /dRWAKFhbhc70o552Wk2zorexozgSK/VG0rtNBcvMoLRxzpiRAHLBBaqTQibiCuilsuYCcwTacp
 Ux8/g6TDW6UGuDhJjfVP/nw4A6gpmjlZUNh7UgSgSH9WCiDCNVLmIXwW5y1LBDLTfWH2IdHKXTJ
 bRXVBIKBOQfuOJ8j5yFRfSdriSaB4JZ8ITJvWd6/seebSWCWZaXkvktQVdzpEuQuRpvVKoesJ98
 tRPmqiHAD3LO6m7cYJhXNktBAITUBMh6A6EwsYM+IgNn08G5suL3fR6svkaKDHOxPu25KQ2jvWP
 d969ZyyOJaDqeoDCA5xkNowwc6gW0KL4PptL6j8MALeMzVqWeLNuwtW2KidHbkyKUqm+VhHqI57
 s9JrCGX5MHaXIIhxUlA==
X-Proofpoint-ORIG-GUID: hokONJTON256Zoxn4VaScVx7wJFV2Hpi
X-Authority-Analysis: v=2.4 cv=PbLPQChd c=1 sm=1 tr=0 ts=6a44ee1b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=6t33SRJ6vQwVIDTtI9kA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011 impostorscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010111
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115656-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:jeff.hugo@oss.qualcomm.com,m:carl.vanderlip@oss.qualcomm.com,m:ogabbay@kernel.org,m:mani@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:mhi@lists.linux.dev,m:kishore.batta@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8129D6EC41B

DDR training data captured during Sahara command mode needs to be
accessible to userspace so it can be persisted and reused on subsequent
boots. Currently, the training data is stored internally in the driver
but has no external visibility once the Sahara channel is torn down.

Expose the captured DDR training data via a read-only binary sysfs
attribute on the MHI controller device:

/sys/bus/mhi/devices/<mhi_cntrl>/ddr_training_data

The sysfs read callback serves data directly from controller scoped storage
and protects access with the controller training data lock. The attribute
lifetime is tied to the controller device via devres, allowing the data to
remain readable after Sahara channel teardown and ensuring automatic
cleanup when controller device is removed.

Userspace flow:
1. For each controller device, userspace reads the ddr_training_data sysfs
   attribute.
2. If the read returns non-zero data, userspace persists it using a
   serial specific filename (for example, mdmddr_0x<serial_no>.mbn).
3. On subsequent boots, the Sahara driver attempts to load this serial
   specific DDR training image before falling back to the default
   training image, restoring DDR calibration data and avoiding retraining.

Add ABI documentation for the DDR training data sysfs attribute exposed by
Sahara MHI driver.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-mhi-ddr_training_data    | 19 +++++++
 drivers/bus/mhi/host/clients/sahara/sahara.c       | 62 ++++++++++++++++++++++
 2 files changed, 81 insertions(+)

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
diff --git a/drivers/bus/mhi/host/clients/sahara/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
index 07bc743aa061dd2fa85638067d494562152474e3..72ac751c302a98448b5756c9feb438647bd0ce4b 100644
--- a/drivers/bus/mhi/host/clients/sahara/sahara.c
+++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
@@ -273,6 +273,66 @@ static struct sahara_cntrl_training_data *sahara_cntrl_training_get(struct devic
 	return ct;
 }
 
+static ssize_t ddr_training_data_read(struct file *filp, struct kobject *kobj,
+				      const struct bin_attribute *attr, char *buf,
+				      loff_t offset, size_t count)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct sahara_cntrl_training_data *ct;
+	size_t available;
+
+	ct = sahara_cntrl_training_get(dev);
+	if (!ct)
+		return -ENODEV;
+
+	mutex_lock(&ct->lock);
+
+	/* No data yet or offset past end */
+	if (!ct->data || offset >= ct->size) {
+		mutex_unlock(&ct->lock);
+		return 0;
+	}
+
+	available = ct->size - offset;
+	count = min(count, available);
+	memcpy(buf, (u8 *)ct->data + offset, count);
+
+	mutex_unlock(&ct->lock);
+
+	return count;
+}
+static BIN_ATTR_RO(ddr_training_data, 0);
+
+static void sahara_sysfs_devres_release(struct device *dev, void *res)
+{
+	device_remove_bin_file(dev, &bin_attr_ddr_training_data);
+}
+
+static void sahara_sysfs_create(struct mhi_device *mhi_dev)
+{
+	struct device *dev = &mhi_dev->mhi_cntrl->mhi_dev->dev;
+	void *cookie;
+	int ret;
+
+	if (devres_find(dev, sahara_sysfs_devres_release, NULL, NULL))
+		return;
+
+	ret = device_create_bin_file(dev, &bin_attr_ddr_training_data);
+	if (ret) {
+		dev_warn(&mhi_dev->dev,
+			 "Failed to create DDR training sysfs node (%d)\n", ret);
+		return;
+	}
+
+	cookie = devres_alloc(sahara_sysfs_devres_release, 1, GFP_KERNEL);
+	if (!cookie) {
+		device_remove_bin_file(dev, &bin_attr_ddr_training_data);
+		return;
+	}
+
+	devres_add(dev, cookie);
+}
+
 static int sahara_find_image(struct sahara_context *context, u32 image_id)
 {
 	char *fw_path;
@@ -1131,6 +1191,8 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
 		return ret;
 	}
 
+	sahara_sysfs_create(mhi_dev);
+
 	return 0;
 }
 

-- 
2.34.1


