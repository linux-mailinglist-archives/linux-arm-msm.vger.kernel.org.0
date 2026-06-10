Return-Path: <linux-arm-msm+bounces-112289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0PXRBLn7KGrdOQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 07:52:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 02004666035
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 07:52:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=iC36aIsW;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UMTqJs84;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112289-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112289-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CE180300F795
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 05:52:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2377F34105B;
	Wed, 10 Jun 2026 05:52:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B3234B1A7
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 05:52:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781070772; cv=none; b=Qa0VdyoQsJUuv4Mvr+ME2s3/86SJdNOa6lYTtt7Sw2cNSQ7UOpcYJddjBCrhpALIl0L44mES/nPhFyplnYhPjhwAWecA4DJXlROxih4R0Zny1UKwWTP/e6T4sAaj3SqkfEOT5cwxGOSJxKywuH3SGYG2rWhMKln7lkpupyIeUak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781070772; c=relaxed/simple;
	bh=QNVGduDx0nxQ0bQDSfenGVzWTDrg2845VWNRYOROTY8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pgREsGDazz9cVjPeo1PthKfSdZMmBsM1+Vc4OCXb3EhFvi+BtZShNVkfAZH+0uKBkWiLhC7EkvqkD2nKzJhjG9+ibJOlH6KfzmOWGVMUn0ZSdsIBszsT6JEG5mdp2nDj8iX+7ZzkWbNKdNfxKkGDZ8GtcUYIzPLrzvD5dq5rtwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iC36aIsW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UMTqJs84; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A2epaD4097253
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 05:52:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VpziLNpumf5VyVaf+LUv71Prv1GwddB0rwZE31HmFFc=; b=iC36aIsWwD8i0v8g
	GCRa6n+Ltt8RVo70nPWCVfagPJp1SUok7Y+K9GgSe6dO6wzvoGF9K69X9Mcj2SaE
	vapS9AdXVAoJ72iBY48cQWV7ZKsA2d7o9bvodQ5tlJe/YPvo75/JtmFdA3fg48BT
	7e5qYKQe8pjxfAi0YQ1dLcq23cs3XMre9e0JAjH2JW3XyPzzNvHfj304YpxbPQv2
	YAjM2bJgw5K+WBXZ3CbfGkUlYPZn91X948ZdBVzB7Xf666kodXU/IJuk1msOq+HI
	rJP2cTuko0tqEg6f0JBdERkUUvCduQByyu9Fx1oweUcHJUjM1WwPDaB7LufSryGb
	KlG1sQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3jw507-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 05:52:49 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36ba98cc003so4442345a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 22:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781070769; x=1781675569; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VpziLNpumf5VyVaf+LUv71Prv1GwddB0rwZE31HmFFc=;
        b=UMTqJs84ZwPx1zHqt33I0EO4er14bb7s2D++Qbgk9Vxyp2P+Hj5yi4z3zqnOHdTUSn
         TwshNZaqQFcp4EfdBBH6tUiwHnuTBW3vq5tlcP/3ealRcQZyMca9wC6Wkdng4bJhAtII
         y4G2G2c+tAwqctn6tN7glgTPHgRC4QBYnqKbCk1bMaIPCz76efV0ynwravTi5F3uNhaI
         +o9j/U8wSh1MRQh2YxTKT3+a2eO78ymqttrZwMJR5CYrHDw19tJvW07S64YvYAO4mKdJ
         fksuJSh/Jud3fWDTplwm/ubX+fiLDtDxmjJrCBojrZARdlgNZzWGhPHZj2H/bqVAOONq
         HaDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781070769; x=1781675569;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VpziLNpumf5VyVaf+LUv71Prv1GwddB0rwZE31HmFFc=;
        b=kaTeRJ5BNn0e6l4xPw5wt+8EgCyTGqFPVKJ9uDTswvCWH7Au5k2NmWEuonA9Y63J3w
         ztYVTxpUD8rg4gts+oVBMjygmTqEs/7H5qmbsFat7pn2G/L3TgTRze538IR0obSxfRMA
         bSL0wS5h4HvPusDnU7IfDq97yENIsrs34SIuSM2PMwqGUg92h0GIvqvzBQbsrTwc74uI
         TGI5+5TQbHZgE0PECmpVElm1ghgigNSgepHuZlBRkgpWrUsc6l9v2+f7SpBQXW+IrgmX
         OQsetq7Q49yJ2e4v5/UgKxs9C8WQk5yR+vOc9YV1jlSTTsaZeSCCDXhjpBkQifU6ja5u
         Yxyw==
X-Forwarded-Encrypted: i=1; AFNElJ/bTw9awW1aMYcTLPHXAUqm0K7PntwNoiQSu1JDQWmNubfsfwjSzlzmv9kVCwvU6n5YUXd0OszyDAdx16sE@vger.kernel.org
X-Gm-Message-State: AOJu0YzznYLAWtQ1fFYW6VatSW+omHf9Iq+v6DwRNcaF9t46RorEzT9p
	oZIyMPN1wDOjHuFOq9MxzHE62fzvMKfyzBlK2IDPz3m9Vri9ZYPPknJl5TADVyZvnOus2T8PZFD
	tDX1wg+S5smGpEPJ12Aby6SSf8BXLgj6Xpc/SgCAt/FfHx/CXMdZQiIZT4vsphIprbiphi1+JCe
	V8
X-Gm-Gg: Acq92OH8YsNxLzHFRkz1ZcXO6Ykn3w4UNzMBRgGl/gKNufgLHmJ3kOmMf/tpez+Mdw7
	ZxpdA577NQzHlkswYnM3+aivDhAvX1JrR9oAMP/rW9flnsLbqdQ5WoE/MoVQ3Js7qzseXd6Uxon
	llX9Ya7qYwsor+3wR7hwm4O1AKpjseyPYHJ8EEYXe/t3XPvACLR9Jx2dT0K3NdLJ0JhChh6oKzf
	SeSh0wRyniVTv00ug63inVRGMds808vsB4wNK1LdxJy7N1f8L+BXlafd90BAeN+hGmMLnBnpq7C
	aQprevCchNnOvLatZ47KQh9k2w2XZw1kGEsqKPlYhVDWA5zWBvtympnq/oLUMLFqAdp3mWWqG/d
	SzEIFU6jUvuuzVZnnI4HxyXg8IWihA4wSnjGp/xT1mzEu0SGROgvPco+Mdw==
X-Received: by 2002:a17:90b:54c3:b0:36a:d6dd:9fee with SMTP id 98e67ed59e1d1-37520dc57d2mr7068747a91.12.1781070768468;
        Tue, 09 Jun 2026 22:52:48 -0700 (PDT)
X-Received: by 2002:a17:90b:54c3:b0:36a:d6dd:9fee with SMTP id 98e67ed59e1d1-37520dc57d2mr7068713a91.12.1781070767801;
        Tue, 09 Jun 2026 22:52:47 -0700 (PDT)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c24edc8acasm108601105ad.45.2026.06.09.22.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 22:52:47 -0700 (PDT)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:22:25 +0530
Subject: [PATCH v3 1/3] bus: mhi: host: clients: Add loopback driver with
 sysfs interface
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-loopback_mhi-v3-1-a733c0cef61a@oss.qualcomm.com>
References: <20260610-loopback_mhi-v3-0-a733c0cef61a@oss.qualcomm.com>
In-Reply-To: <20260610-loopback_mhi-v3-0-a733c0cef61a@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781070762; l=15221;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=QNVGduDx0nxQ0bQDSfenGVzWTDrg2845VWNRYOROTY8=;
 b=mdS3QPhtrDbai2LMCBAd7QP4hXjQ5XzeZeR4F1cMbpwa3vcrCqj1a/fPA6cdUbcNkQRtxw+OP
 LK/yrKbkC9WBLOeWVDFWrVAsgvP5A9/H3KyNpAiDu0dUDfuF3EVdbL1
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-GUID: MEsKzRJ6TjsTxgSdiQHQJauPQjzHrmIi
X-Authority-Analysis: v=2.4 cv=aa9RWxot c=1 sm=1 tr=0 ts=6a28fbb1 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=fr5qSj5IhElrMRFVs5kA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA1MiBTYWx0ZWRfX2e4MhPW6Ppbg
 fmFd5e7sT09+DDich3mcZFEC03JknToJGCRDdxuGaR8ZKX0vrijdlQGoXhOeysP7iRaQyiv9Kok
 kn9u+OHTMFRM/drM56Rt29bqLN5MKkOzSklFyVedId3ucvVtF1me22tW/Ai/pr40P410MjUsT5H
 ggKfAoGPKBuOO1zQI9+CwoTJ1SyCw/+6I0ZewE2BkzCRxuQGFRgMbFPsWx7g6l/a5cAz9Umr26J
 +oOHF842uXM8DLTTvFWqHlI8eoOl5p5prX77ER4CfLEMrLOU7ukF3HUfJRA8Wk4Hu64woBqh1bQ
 KzpX6Nh91cHvgDG2qRun8bzk8KA43VpoprpfQFrbuo60gbbMsM8roHQsQ5FyvmrVvWGG3RpcoYA
 vohmJsQ+iWa5A7Ga06b+ORgQFtx72H59q6H8yokb8WG5CNsxuQoJ578xWnziHElVgonQLQTG3An
 6dDPDM3oSVFaUYNZFEw==
X-Proofpoint-ORIG-GUID: MEsKzRJ6TjsTxgSdiQHQJauPQjzHrmIi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100052
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112289-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:mhi@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sumit.kumar@oss.qualcomm.com,m:krishna.chundru@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sumit.kumar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,linux.dev:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sumit.kumar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 02004666035

The MHI specification defines a LOOPBACK channel. The endpoint firmware
echoes back whatever the host sends on this channel. Without a host-side
driver, there is no way to exercise this channel to validate MHI data path
integrity between host and endpoint.

Add a host-side loopback driver that binds to the LOOPBACK channel and
expose a sysfs interface for data path testing. The sysfs interface allows
users to configure TRE buffer size and count, trigger a loopback test, and
read the result.

Co-developed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-mhi-devices-loopback     |  51 ++++
 MAINTAINERS                                        |   1 +
 drivers/bus/mhi/host/Kconfig                       |   1 +
 drivers/bus/mhi/host/Makefile                      |   1 +
 drivers/bus/mhi/host/clients/Kconfig               |  17 ++
 drivers/bus/mhi/host/clients/Makefile              |   2 +
 drivers/bus/mhi/host/clients/loopback.c            | 316 +++++++++++++++++++++
 7 files changed, 389 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback b/Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback
new file mode 100644
index 0000000000000000000000000000000000000000..3bd770747799a3341a23903cc1a108e650e915b8
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback
@@ -0,0 +1,51 @@
+What:		/sys/bus/mhi/devices/mhi<N>_LOOPBACK/tre_size
+Date:		April 2026
+KernelVersion:	7.1
+Contact:	mhi@lists.linux.dev
+Description:
+		(RW) Size of each Transfer Ring Element (TRE) buffer in bytes
+		used for the loopback test. Valid range is 1 to the value
+		reported by max_tre_size. Default value is 32 bytes.
+
+What:		/sys/bus/mhi/devices/mhi<N>_LOOPBACK/max_tre_size
+Date:		April 2026
+KernelVersion:	7.1
+Contact:	mhi@lists.linux.dev
+Description:
+		(RO) Maximum allowed TRE size in bytes. Reading this file
+		returns the upper bound for the tre_size attribute.
+
+What:		/sys/bus/mhi/devices/mhi<N>_LOOPBACK/num_tre
+Date:		April 2026
+KernelVersion:	7.1
+Contact:	mhi@lists.linux.dev
+Description:
+		(RW) Number of Transfer Ring Elements (TREs) to use per
+		loopback test. Must be greater than zero and must not exceed
+		the channel ring capacity. Default value is 1.
+
+What:		/sys/bus/mhi/devices/mhi<N>_LOOPBACK/start
+Date:		April 2026
+KernelVersion:	7.1
+Contact:	mhi@lists.linux.dev
+Description:
+		(WO) Write any value to trigger a loopback test. The driver
+		sends random data to the endpoint using the configured tre_size
+		and num_tre parameters, waits for the endpoint to echo it back,
+		and verifies the received data matches what was sent.
+
+		This is a blocking write that returns when the test completes
+		or times out after 5 seconds.
+
+What:		/sys/bus/mhi/devices/mhi<N>_LOOPBACK/status
+Date:		April 2026
+KernelVersion:	7.1
+Contact:	mhi@lists.linux.dev
+Description:
+		(RO) Result of the last loopback test. Returns one of:
+		  "pass"        - last test completed successfully
+		  "fail"        - last test failed
+		  "not started" - no test has been run yet
+
+		Reading this file while a test is in progress will block
+		until the test completes.
diff --git a/MAINTAINERS b/MAINTAINERS
index 6dcfbd11efef87927041f5cf58d70633dbb4b18d..ff12a6da48947ac853bc638359a7046fea85fc21 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16441,6 +16441,7 @@ L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git
 F:	Documentation/ABI/stable/sysfs-bus-mhi
+F:	Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback
 F:	Documentation/mhi/
 F:	drivers/bus/mhi/
 F:	drivers/pci/endpoint/functions/pci-epf-mhi.c
diff --git a/drivers/bus/mhi/host/Kconfig b/drivers/bus/mhi/host/Kconfig
index da5cd0c9fc620ab595e742c422f1a22a2a84c7b9..627c57948235aa52348179ae8b2d0826ebaed01e 100644
--- a/drivers/bus/mhi/host/Kconfig
+++ b/drivers/bus/mhi/host/Kconfig
@@ -29,3 +29,4 @@ config MHI_BUS_PCI_GENERIC
 	  This driver provides MHI PCI controller driver for devices such as
 	  Qualcomm SDX55 based PCIe modems.
 
+source "drivers/bus/mhi/host/clients/Kconfig"
diff --git a/drivers/bus/mhi/host/Makefile b/drivers/bus/mhi/host/Makefile
index 859c2f38451c669b3d3014c374b2b957c99a1cfe..2a16008aeb38127494782bbff4e1656428d2b776 100644
--- a/drivers/bus/mhi/host/Makefile
+++ b/drivers/bus/mhi/host/Makefile
@@ -4,3 +4,4 @@ mhi-$(CONFIG_MHI_BUS_DEBUG) += debugfs.o
 
 obj-$(CONFIG_MHI_BUS_PCI_GENERIC) += mhi_pci_generic.o
 mhi_pci_generic-y += pci_generic.o
+obj-y += clients/
diff --git a/drivers/bus/mhi/host/clients/Kconfig b/drivers/bus/mhi/host/clients/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..d1463c3e0df0da461c815afaec623ba349b51dda
--- /dev/null
+++ b/drivers/bus/mhi/host/clients/Kconfig
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0
+
+config MHI_BUS_LOOPBACK
+	tristate "MHI LOOPBACK client driver"
+	depends on MHI_BUS
+	help
+	  MHI LOOPBACK client driver that binds to the MHI LOOPBACK channel
+	  as defined in the MHI specification. The LOOPBACK channel is
+	  implemented by MHI-based devices (modems, WLAN) in the field, where
+	  the endpoint firmware echoes back whatever the host sends.
+
+	  This driver exposes a sysfs interface for testing MHI data path
+	  integrity between host and endpoint. Users can configure the TRE
+	  size and count, trigger a loopback test, and read the result.
+
+	  To compile this driver as a module, choose M here. The module
+	  will be called mhi_loopback.
diff --git a/drivers/bus/mhi/host/clients/Makefile b/drivers/bus/mhi/host/clients/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..3811b6928f42b38f94b1167941cf3b0fe512d32b
--- /dev/null
+++ b/drivers/bus/mhi/host/clients/Makefile
@@ -0,0 +1,2 @@
+obj-$(CONFIG_MHI_BUS_LOOPBACK) += mhi_loopback.o
+mhi_loopback-y += loopback.o
diff --git a/drivers/bus/mhi/host/clients/loopback.c b/drivers/bus/mhi/host/clients/loopback.c
new file mode 100644
index 0000000000000000000000000000000000000000..3ae4d94dbc6b291006bb206ec40a634ae9561f5d
--- /dev/null
+++ b/drivers/bus/mhi/host/clients/loopback.c
@@ -0,0 +1,316 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/*
+ * The MHI LOOPBACK channel is defined in the MHI specification and is
+ * implemented by MHI-based devices (modems, WLAN) already deployed in the
+ * field. The endpoint firmware echoes back whatever the host sends on this
+ * channel. This driver binds to the LOOPBACK channel and exposes a sysfs
+ * interface for testing MHI data path integrity between host and endpoint.
+ * The sysfs interface is stable ABI because the wire protocol is fixed by
+ * the endpoint firmware and cannot be changed.
+ */
+
+#include <linux/atomic.h>
+#include <linux/completion.h>
+#include <linux/errno.h>
+#include <linux/mhi.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/random.h>
+#include <linux/sizes.h>
+#include <linux/string.h>
+#include <linux/sysfs.h>
+#include <linux/types.h>
+
+#define MHI_LOOPBACK_DEFAULT_TRE_SIZE	32
+#define MHI_LOOPBACK_DEFAULT_NUM_TRE	1
+#define MHI_LOOPBACK_TIMEOUT_MS		5000
+#define MHI_LOOPBACK_MAX_TRE_SIZE	SZ_64K
+
+struct mhi_loopback {
+	struct mhi_device *mdev;
+	struct mutex lb_mutex; /* serializes concurrent test operations */
+	struct completion comp;
+	atomic_t tres_pending; /* DL callbacks still outstanding */
+	const char *result;
+	u32 num_tre;
+	u32 tre_size;
+};
+
+static ssize_t tre_size_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
+{
+	struct mhi_loopback *loopback = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%u\n", loopback->tre_size);
+}
+
+static ssize_t tre_size_store(struct device *dev,
+			      struct device_attribute *attr,
+			      const char *buf, size_t count)
+{
+	struct mhi_loopback *loopback = dev_get_drvdata(dev);
+	u32 val;
+
+	if (kstrtou32(buf, 0, &val))
+		return -EINVAL;
+
+	if (val == 0 || val > MHI_LOOPBACK_MAX_TRE_SIZE)
+		return -EINVAL;
+
+	guard(mutex)(&loopback->lb_mutex);
+	loopback->tre_size = val;
+
+	return count;
+}
+static DEVICE_ATTR_RW(tre_size);
+
+static ssize_t max_tre_size_show(struct device *dev,
+				 struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%u\n", MHI_LOOPBACK_MAX_TRE_SIZE);
+}
+static DEVICE_ATTR_RO(max_tre_size);
+
+static ssize_t num_tre_show(struct device *dev,
+			    struct device_attribute *attr, char *buf)
+{
+	struct mhi_loopback *loopback = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%u\n", loopback->num_tre);
+}
+
+static ssize_t num_tre_store(struct device *dev,
+			     struct device_attribute *attr,
+			     const char *buf, size_t count)
+{
+	struct mhi_loopback *loopback = dev_get_drvdata(dev);
+	u32 val;
+	int el_num;
+
+	if (kstrtou32(buf, 0, &val))
+		return -EINVAL;
+
+	if (val == 0)
+		return -EINVAL;
+
+	guard(mutex)(&loopback->lb_mutex);
+
+	el_num = mhi_get_free_desc_count(loopback->mdev, DMA_TO_DEVICE);
+	if (val > el_num) {
+		dev_err(dev, "num_tre (%u) exceeds ring capacity (%d)\n", val, el_num);
+		return -EINVAL;
+	}
+
+	loopback->num_tre = val;
+
+	return count;
+}
+static DEVICE_ATTR_RW(num_tre);
+
+static ssize_t start_store(struct device *dev,
+			   struct device_attribute *attr,
+			   const char *buf, size_t count)
+{
+	struct mhi_loopback *loopback = dev_get_drvdata(dev);
+	void *send_buf = NULL, *recv_buf = NULL;
+	u32 total_size, tre_count, tre_size;
+	ssize_t ret;
+	int i;
+
+	guard(mutex)(&loopback->lb_mutex);
+
+	tre_size = loopback->tre_size;
+	tre_count = loopback->num_tre;
+	total_size = size_mul(tre_count, tre_size);
+
+	recv_buf = kzalloc(total_size, GFP_KERNEL);
+	if (!recv_buf)
+		return -ENOMEM;
+
+	send_buf = kzalloc(total_size, GFP_KERNEL);
+	if (!send_buf) {
+		ret = -ENOMEM;
+		goto free_buf;
+	}
+
+	ret = mhi_prepare_for_transfer(loopback->mdev);
+	if (ret) {
+		dev_err(dev, "failed to prepare for transfers: %zd\n", ret);
+		goto free_buf;
+	}
+
+	get_random_bytes(send_buf, total_size);
+
+	/* Arm completion before queuing recv TREs to avoid losing an early callback */
+	atomic_set(&loopback->tres_pending, tre_count);
+	reinit_completion(&loopback->comp);
+
+	for (i = 0; i < tre_count; i++) {
+		ret = mhi_queue_buf(loopback->mdev, DMA_FROM_DEVICE,
+				    recv_buf + (i * tre_size), tre_size, MHI_EOT);
+		if (ret) {
+			dev_err(dev, "Unable to queue read TRE %d: %zd\n", i, ret);
+			loopback->result = "fail";
+			if (atomic_sub_and_test(tre_count - i, &loopback->tres_pending))
+				complete(&loopback->comp);
+			goto out;
+		}
+	}
+
+	for (i = 0; i < tre_count - 1; i++) {
+		ret = mhi_queue_buf(loopback->mdev, DMA_TO_DEVICE,
+				    send_buf + (i * tre_size), tre_size, MHI_CHAIN);
+		if (ret) {
+			dev_err(dev, "Unable to queue send TRE %d: %zd\n", i, ret);
+			loopback->result = "fail";
+			goto out;
+		}
+	}
+
+	ret = mhi_queue_buf(loopback->mdev, DMA_TO_DEVICE,
+			    send_buf + (i * tre_size), tre_size, MHI_EOT);
+	if (ret) {
+		dev_err(dev, "Unable to queue final TRE: %zd\n", ret);
+		loopback->result = "fail";
+		goto out;
+	}
+
+	if (!wait_for_completion_timeout(&loopback->comp,
+					 msecs_to_jiffies(MHI_LOOPBACK_TIMEOUT_MS))) {
+		dev_err(dev, "Loopback test timed out\n");
+		loopback->result = "fail";
+		ret = -ETIMEDOUT;
+		goto out;
+	}
+
+	if (memcmp(send_buf, recv_buf, total_size)) {
+		dev_err(dev, "Loopback data mismatch\n");
+		loopback->result = "fail";
+		ret = -EIO;
+		goto out;
+	}
+
+	loopback->result = "pass";
+	ret = count;
+
+out:
+	mhi_unprepare_from_transfer(loopback->mdev);
+free_buf:
+	kfree(send_buf);
+	kfree(recv_buf);
+	return ret;
+}
+static DEVICE_ATTR_WO(start);
+
+static ssize_t status_show(struct device *dev,
+			   struct device_attribute *attr, char *buf)
+{
+	struct mhi_loopback *loopback = dev_get_drvdata(dev);
+
+	guard(mutex)(&loopback->lb_mutex);
+
+	return sysfs_emit(buf, "%s\n", loopback->result);
+}
+static DEVICE_ATTR_RO(status);
+
+static void mhi_loopback_dl_callback(struct mhi_device *mhi_dev,
+				     struct mhi_result *mhi_res)
+{
+	struct mhi_loopback *loopback = dev_get_drvdata(&mhi_dev->dev);
+
+	if (!loopback)
+		return;
+
+	if (mhi_res->transaction_status && mhi_res->transaction_status != -ENOTCONN)
+		dev_err(&mhi_dev->dev, "DL callback error: status %d\n",
+			mhi_res->transaction_status);
+
+	if (atomic_dec_and_test(&loopback->tres_pending))
+		complete(&loopback->comp);
+}
+
+static void mhi_loopback_ul_callback(struct mhi_device *mhi_dev,
+				     struct mhi_result *mhi_res)
+{
+}
+
+static struct attribute *mhi_loopback_attrs[] = {
+	&dev_attr_tre_size.attr,
+	&dev_attr_max_tre_size.attr,
+	&dev_attr_num_tre.attr,
+	&dev_attr_start.attr,
+	&dev_attr_status.attr,
+	NULL,
+};
+
+static const struct attribute_group mhi_loopback_group = {
+	.attrs = mhi_loopback_attrs,
+};
+
+static int mhi_loopback_probe(struct mhi_device *mhi_dev,
+			      const struct mhi_device_id *id)
+{
+	struct mhi_loopback *loopback;
+	int rc;
+
+	loopback = devm_kzalloc(&mhi_dev->dev, sizeof(*loopback), GFP_KERNEL);
+	if (!loopback)
+		return -ENOMEM;
+
+	loopback->mdev = mhi_dev;
+	loopback->tre_size = MHI_LOOPBACK_DEFAULT_TRE_SIZE;
+	loopback->num_tre = MHI_LOOPBACK_DEFAULT_NUM_TRE;
+	loopback->result = "not started";
+
+	mutex_init(&loopback->lb_mutex);
+	init_completion(&loopback->comp);
+
+	dev_set_drvdata(&mhi_dev->dev, loopback);
+
+	rc = devm_device_add_group(&mhi_dev->dev, &mhi_loopback_group);
+	if (rc)
+		dev_err(&mhi_dev->dev, "failed to create sysfs attributes\n");
+
+	return rc;
+}
+
+static void mhi_loopback_remove(struct mhi_device *mhi_dev)
+{
+	struct mhi_loopback *loopback = dev_get_drvdata(&mhi_dev->dev);
+
+	complete(&loopback->comp);
+
+	mutex_lock(&loopback->lb_mutex);
+	mutex_unlock(&loopback->lb_mutex);
+
+	dev_set_drvdata(&mhi_dev->dev, NULL);
+}
+
+static const struct mhi_device_id mhi_loopback_id_table[] = {
+	{ .chan = "LOOPBACK"},
+	{}
+};
+MODULE_DEVICE_TABLE(mhi, mhi_loopback_id_table);
+
+static struct mhi_driver mhi_loopback_driver = {
+	.probe = mhi_loopback_probe,
+	.remove = mhi_loopback_remove,
+	.dl_xfer_cb = mhi_loopback_dl_callback,
+	.ul_xfer_cb = mhi_loopback_ul_callback,
+	.id_table = mhi_loopback_id_table,
+	.driver = {
+		.name = "mhi_loopback",
+	},
+};
+
+module_mhi_driver(mhi_loopback_driver);
+
+MODULE_AUTHOR("Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>");
+MODULE_AUTHOR("Sumit Kumar <sumit.kumar@oss.qualcomm.com>");
+MODULE_DESCRIPTION("MHI Host Loopback Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


