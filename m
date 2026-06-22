Return-Path: <linux-arm-msm+bounces-113917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6WLAMsDDOGoChwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 07:10:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 252016ACA92
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 07:10:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="L/zFe7t1";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OXZI+LnE;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113917-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113917-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10C1C3032F5C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 05:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E149D342C80;
	Mon, 22 Jun 2026 05:09:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6118835674D
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 05:09:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782104972; cv=none; b=Sq7N5jxRoRYt/zPIhMWQ72k8ik45XifLZWGrDpwoQDJv70Uttdu7Cg9IAR3X4fIQz37nbLxhumszSAJxjAM0v0WSu8skY1Zz3TVXEejMCfYA1MgYooPXBlBesUsainJ+CbNvd6GLRl+fNKoNQVzx/jk+oWW/e9vUMCtGoDGpBw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782104972; c=relaxed/simple;
	bh=yx64t4XAMHE0z7lDJmlBWupNmecgou3W14tKJ6zAt7A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UFQ0A7Rvq2SLx2JRZz+i6UrX3eW+YLXv9iJTE/4qWCtPhaM4gnmAdA0gvFIzd1flMOEz49lQu7H5cKBlhd0W6cEV8tY3z001HrlNN7zXKSCVINjxDzVllJnD/cxjYTleaoiGiOe0j6DVMN5vYF1hbwdSV6tpMdPFJh/7OgTai3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L/zFe7t1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OXZI+LnE; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65LKhF3M3372191
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 05:09:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2foTe9u0+0jA2F7WQbtMiKVUOBLINMVJce7lwxJmKq8=; b=L/zFe7t1p6n6oT+R
	jNS6Vvsgq2tlYpfx+f+vkimhpSpQhZ8828uKXkQX/hlZTWMgtTGemzYVvKnKxUht
	LrUAfovoTNWDjvR/qBg2aJlqsTwMjLlTwe6zKz05leEeKb4EM+TzyyXhoyy6wTPD
	w4gLzvKzI0Ma039fvuvNeNCjNcah2BTMQP/o/ZsFdesFqHAfR50K6xkoVi2XTJIC
	lwt3X4eKYjTTnbApG8ATBPC2DMqqlrMrciujhUa92ZUJGYrigps1cQC6cVtr0+rY
	04KbiStJbYN2wjx3VQEUxkGDHQukClK5zjcub9DJ4zoJghyL0+Cp/I7sJb1TU8r6
	MCf4kg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewjxucr0k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 05:09:30 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8423f424d5bso2756312b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 22:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782104969; x=1782709769; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2foTe9u0+0jA2F7WQbtMiKVUOBLINMVJce7lwxJmKq8=;
        b=OXZI+LnEuP0hkLNs39pq4KSUMaYU6UrGle9kOQOTkGpn/tLk4RJGTGQDbPITYsmAYD
         pPSWiIxuoh8s6qTjp3/N/kXQznDpNs8SMRdJZqemXS0eAY+/7e57uW1pYPTJQT/0gnOP
         ZuEV71/6yfyQsB0OCrLpubASPnmWFbdrPD7BQVUXb+NKoID3bN4oQ90RmNeWhEPElZph
         XsTsxDdprvSHhPR4R8u24865yEhOoWpW5g3ccza/TA7KWNqopbA4F1MftY310HwMY1gz
         viSgWxhCzm445b4u3T6XXFYDaRgqcjXUkSvN2G5HztIci5/aho4PaEUgxsTs5UV5Xvt1
         C12g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782104969; x=1782709769;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2foTe9u0+0jA2F7WQbtMiKVUOBLINMVJce7lwxJmKq8=;
        b=c/eu1KwfihCK8+baL0Jp3C0rjV37G2XDaGAZOUF6ZQCq5MiakpQgMM5W9Bl26Scj71
         H4dJ0C+ooOvjC//jWrn3luSW6k/hMnIVzCCfsfQRZdIJTPLOIOI172i5s3MpB59wVdgc
         oaiY6IxP7+KI+MhJ2r1S8TjFxxsoxQ2R0beevK3jiXjgJu8q5K2A4ikMH7c0lrdM6l5e
         WKwIjHqppbNNHnB4nPiev/fOVbUUunFa2J2IVtDa9/4RZjnVA/jVUPViMDmSG5jQlH4Y
         iPAPHoYga2apyaZhFIVgi9SyfDPYYDH+Nz+c9JXR0alf6Wduxk2RMYtXuhg5ZubMsUbk
         BWCA==
X-Forwarded-Encrypted: i=1; AFNElJ+alPEwzv9VNbn3ZbNj9M6FQIT1138YG9VmBrqt2MWHV+L1eEVBOZmF3oJaNnw8Z2HNh2cjTuPmL55wlv2P@vger.kernel.org
X-Gm-Message-State: AOJu0YyVwX6cLtd4hurpU7DnyhUFL/yZomUcCIZnwR5UbWn0LmJ9j3G9
	69YffimcdK8fBTAFonbHzORWv3d5FpU/bJzb6H4LhVL9phItBRtFcNdG3/YLwK1jTfVTnmASpML
	yfM2OR2RPbOEGozl7Ix8j2e/iLSeIJj68Eoc6gdVX0KvfltRPp989gyoJ9x/3wgkBvBhu
X-Gm-Gg: AfdE7ckXuiI2tMbWgpSjpIa/RvDEj1l5FmeLYgjiQBKImjOiaZZZfeULABeBJyho7cE
	UJaSekWSSUlY2wHoEKKevjBNBh5P5DC18jSyTxoIKCIrzJqUXm/f+KPDV/pvbEywbx7KTMkRNTP
	Nn2ShZ1Asqu8ZkW4aht0vSIPLL2tSfq9OmvAU0+uW8Ng2okMONvVanf4v+EV822/iL5eoMpHQQ+
	AFSdProBSgz0fFSUxHq4oFIo5/Xe+JtMSNt7MF4AruGRZD0219oLfoBD4w8stBl8Hq33ntK05il
	mfkCLKINtQZ+pziXS/AfhOIdvh4zw1kPN5n4OVt+HFcoklzbLIVT5756OeXyQnafZb3Lnk41vjy
	50S+Ue3FK3VifkrA6l2JC6+djLruvTO1AtE6s
X-Received: by 2002:a05:6a00:94f6:b0:82f:2b0:2809 with SMTP id d2e1a72fcca58-8455077cc5fmr14048556b3a.1.1782104969174;
        Sun, 21 Jun 2026 22:09:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:94f6:b0:82f:2b0:2809 with SMTP id d2e1a72fcca58-8455077cc5fmr14048532b3a.1.1782104968497;
        Sun, 21 Jun 2026 22:09:28 -0700 (PDT)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564d6c5dbsm5905996b3a.12.2026.06.21.22.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 22:09:28 -0700 (PDT)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 10:39:17 +0530
Subject: [PATCH v4 3/3] bus: mhi: ep: clients: Add loopback driver for data
 path testing
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-loopback_mhi-v4-3-782b3a0f2eef@oss.qualcomm.com>
References: <20260622-loopback_mhi-v4-0-782b3a0f2eef@oss.qualcomm.com>
In-Reply-To: <20260622-loopback_mhi-v4-0-782b3a0f2eef@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782104957; l=7123;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=yx64t4XAMHE0z7lDJmlBWupNmecgou3W14tKJ6zAt7A=;
 b=gNhPY9LtEd/nPhg9yrSsepZfRkA6bDOBQOhFmG4SoIbgCwU7NJtVL1FUO7Ju0LBLLP7qsWCUA
 EBEWynyk9OaCYvUmMiFC+j0jpicmloeik9UeQbdJgeaG5Ab5jwTtqEI
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA0NyBTYWx0ZWRfX3uC9KlpNrMJy
 bzPs51wcBmpRnvyFYwWfQH14S/zCoBndXhuacFH7D9PhCZKF/a2yoIvQPHXCcSpWv/F/v/Fx8PR
 tgwO1bbcFLHa8BDJJutzeApK6EC6ksQ=
X-Authority-Analysis: v=2.4 cv=G/ws1dk5 c=1 sm=1 tr=0 ts=6a38c38a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=F9PWhn0UeK7EsyOwsFYA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: uJtZSSnsyQJt8hu4o6hknqobgNVeCoJH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA0NyBTYWx0ZWRfX1kzycBgukpsS
 1RrUbfqfoV0/+4NlAex4Gk1n0cpF5GwWuDeMo2ikBdjiQTd0rsQRyGQZDfREVCUQUmtSjfw0cT3
 dIgVJML5d3XTEtNmxFfRJ9a7uPe7wz6E/2ArSB74XPjMFXMyFJV8kNe13gYe8DELOU4tL+/fMh1
 2RF+Z+JgJt2kP6FKJSkkWOfpcVinujk5vxVWlU5Au6Doaka6IPRKeETHybOe/y2XMfFildRDahk
 XzozD1d8qAXRNZaK6FSQdHMixvTXBPxD0tamPxLYqUa1J6rvtDOMrhmEEAoxtAl0vDviLaY3eAn
 /3kobmaS1+FZqa1zcS6zAq04cQXr+IX4eG1KIttKEdEK3DJzntXA9n++xBLLIheqoIUDX58Q5nq
 a8Sfb45jXoMFEM4dip1vrawwQO5OqqY+I60ioMulVycFVESVN5JXqpcb7VpDAjWTA6wtB5Fql+S
 w5o5EOMt9tuHfT+BM9w==
X-Proofpoint-GUID: uJtZSSnsyQJt8hu4o6hknqobgNVeCoJH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-21_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220047
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113917-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[sumit.kumar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:mhi@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sumit.kumar@oss.qualcomm.com,m:krishna.chundru@oss.qualcomm.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sumit.kumar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 252016ACA92

When an MHI endpoint device runs Linux, there is no firmware to implement
the LOOPBACK channel echo that real modem firmware provides. Without an
endpoint-side driver, the host loopback test has no software echo partner
and cannot exercise the full end-to-end MHI data path.

Add an endpoint-side loopback driver that binds to the LOOPBACK channel and
echoes received data back to the host. An ordered workqueue is used for
asynchronous processing to preserve packet ordering. Together with the
host-side loopback driver, this enables complete MHI data path validation
for Linux-based endpoint devices.

Co-developed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
 drivers/bus/mhi/ep/Kconfig            |   2 +
 drivers/bus/mhi/ep/Makefile           |   1 +
 drivers/bus/mhi/ep/clients/Kconfig    |  16 +++++
 drivers/bus/mhi/ep/clients/Makefile   |   2 +
 drivers/bus/mhi/ep/clients/loopback.c | 128 ++++++++++++++++++++++++++++++++++
 5 files changed, 149 insertions(+)

diff --git a/drivers/bus/mhi/ep/Kconfig b/drivers/bus/mhi/ep/Kconfig
index 90ab3b040672e0f04181d4802e3062afcc7cf782..9edb81b39890e093a51138465a4d7705767eafa5 100644
--- a/drivers/bus/mhi/ep/Kconfig
+++ b/drivers/bus/mhi/ep/Kconfig
@@ -8,3 +8,5 @@ config MHI_BUS_EP
 
 	  MHI_BUS_EP implements the MHI protocol for the endpoint devices,
 	  such as SDX55 modem connected to the host machine over PCIe.
+
+source "drivers/bus/mhi/ep/clients/Kconfig"
diff --git a/drivers/bus/mhi/ep/Makefile b/drivers/bus/mhi/ep/Makefile
index aad85f180b707fb997fcb541837eda9bbbb67437..ab36ef2a40ab8174e5ddae44a3e6ccb8eb31168d 100644
--- a/drivers/bus/mhi/ep/Makefile
+++ b/drivers/bus/mhi/ep/Makefile
@@ -1,2 +1,3 @@
 obj-$(CONFIG_MHI_BUS_EP) += mhi_ep.o
 mhi_ep-y := main.o mmio.o ring.o sm.o
+obj-y += clients/
diff --git a/drivers/bus/mhi/ep/clients/Kconfig b/drivers/bus/mhi/ep/clients/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..4cf27184058ca2be020885b6f57b4cc44b5054b6
--- /dev/null
+++ b/drivers/bus/mhi/ep/clients/Kconfig
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0
+
+config MHI_BUS_EP_LOOPBACK
+	tristate "MHI Endpoint LOOPBACK client driver"
+	depends on MHI_BUS_EP
+	help
+	  MHI Endpoint LOOPBACK client driver that binds to the MHI LOOPBACK
+	  channel as defined in the MHI specification. The LOOPBACK channel is
+	  implemented by MHI-based endpoint devices (modems, WLAN) in the field,
+	  where the endpoint firmware echoes back whatever the host sends.
+
+	  This driver receives data on the uplink channel and echoes it back on
+	  the downlink channel for testing the MHI endpoint data path.
+
+	  To compile this driver as a module, choose M here. The module
+	  will be called mhi_ep_loopback.
diff --git a/drivers/bus/mhi/ep/clients/Makefile b/drivers/bus/mhi/ep/clients/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..71dc91cc63b02592b177cf66db6090748c0653a6
--- /dev/null
+++ b/drivers/bus/mhi/ep/clients/Makefile
@@ -0,0 +1,2 @@
+obj-$(CONFIG_MHI_BUS_EP_LOOPBACK) += mhi_ep_loopback.o
+mhi_ep_loopback-y += loopback.o
diff --git a/drivers/bus/mhi/ep/clients/loopback.c b/drivers/bus/mhi/ep/clients/loopback.c
new file mode 100644
index 0000000000000000000000000000000000000000..05db91be6ffc5afe5a2022962410c96a7ec19962
--- /dev/null
+++ b/drivers/bus/mhi/ep/clients/loopback.c
@@ -0,0 +1,128 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/mhi_ep.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/string.h>
+
+struct mhi_ep_loopback {
+	struct workqueue_struct *loopback_wq;
+	struct mhi_ep_device *mdev;
+};
+
+struct mhi_ep_loopback_work {
+	struct mhi_ep_device *mdev;
+	struct work_struct work;
+	void *buf;
+	size_t len;
+};
+
+static void mhi_ep_loopback_work_handler(struct work_struct *work)
+{
+	struct mhi_ep_loopback_work *mhi_ep_lb_work = container_of(work,
+								struct mhi_ep_loopback_work, work);
+	int ret;
+
+	ret = mhi_ep_queue_buf(mhi_ep_lb_work->mdev, mhi_ep_lb_work->buf,
+			       mhi_ep_lb_work->len);
+	if (ret) {
+		dev_err(&mhi_ep_lb_work->mdev->dev, "Failed to send the packet\n");
+		kfree(mhi_ep_lb_work->buf);
+	}
+
+	kfree(mhi_ep_lb_work);
+}
+
+static void mhi_ep_loopback_ul_callback(struct mhi_ep_device *mhi_dev,
+					struct mhi_result *mhi_res)
+{
+	struct mhi_ep_loopback *mhi_ep_lb = dev_get_drvdata(&mhi_dev->dev);
+	struct mhi_ep_loopback_work *mhi_ep_lb_work;
+	void *buf;
+
+	if (!mhi_ep_lb)
+		return;
+
+	if (!mhi_res->transaction_status) {
+		if (!mhi_res->bytes_xferd)
+			return;
+
+		buf = kmemdup(mhi_res->buf_addr, mhi_res->bytes_xferd, GFP_KERNEL);
+		if (!buf)
+			return;
+
+		mhi_ep_lb_work = kmalloc(sizeof(*mhi_ep_lb_work), GFP_KERNEL);
+		if (!mhi_ep_lb_work) {
+			kfree(buf);
+			return;
+		}
+
+		INIT_WORK(&mhi_ep_lb_work->work, mhi_ep_loopback_work_handler);
+		mhi_ep_lb_work->mdev = mhi_dev;
+		mhi_ep_lb_work->buf = buf;
+		mhi_ep_lb_work->len = mhi_res->bytes_xferd;
+
+		queue_work(mhi_ep_lb->loopback_wq, &mhi_ep_lb_work->work);
+	}
+}
+
+static void mhi_ep_loopback_dl_callback(struct mhi_ep_device *mhi_dev,
+					struct mhi_result *mhi_res)
+{
+	kfree(mhi_res->buf_addr);
+}
+
+static int mhi_ep_loopback_probe(struct mhi_ep_device *mhi_dev, const struct mhi_device_id *id)
+{
+	struct mhi_ep_loopback *mhi_ep_lb;
+
+	mhi_ep_lb = devm_kzalloc(&mhi_dev->dev, sizeof(*mhi_ep_lb), GFP_KERNEL);
+	if (!mhi_ep_lb)
+		return -ENOMEM;
+
+	mhi_ep_lb->loopback_wq = alloc_ordered_workqueue("mhi_ep_loopback", WQ_MEM_RECLAIM);
+	if (!mhi_ep_lb->loopback_wq) {
+		dev_err(&mhi_dev->dev, "Failed to create workqueue.\n");
+		return -ENOMEM;
+	}
+
+	mhi_ep_lb->mdev = mhi_dev;
+	dev_set_drvdata(&mhi_dev->dev, mhi_ep_lb);
+
+	return 0;
+}
+
+static void mhi_ep_loopback_remove(struct mhi_ep_device *mhi_dev)
+{
+	struct mhi_ep_loopback *mhi_ep_lb = dev_get_drvdata(&mhi_dev->dev);
+
+	destroy_workqueue(mhi_ep_lb->loopback_wq);
+	dev_set_drvdata(&mhi_dev->dev, NULL);
+}
+
+static const struct mhi_device_id mhi_ep_loopback_id_table[] = {
+	{ .chan = "LOOPBACK"},
+	{}
+};
+MODULE_DEVICE_TABLE(mhi, mhi_ep_loopback_id_table);
+
+static struct mhi_ep_driver mhi_ep_loopback_driver = {
+	.probe = mhi_ep_loopback_probe,
+	.remove = mhi_ep_loopback_remove,
+	.dl_xfer_cb = mhi_ep_loopback_dl_callback,
+	.ul_xfer_cb = mhi_ep_loopback_ul_callback,
+	.id_table = mhi_ep_loopback_id_table,
+	.driver = {
+		.name = "mhi_ep_loopback",
+	},
+};
+
+module_mhi_ep_driver(mhi_ep_loopback_driver);
+
+MODULE_AUTHOR("Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>");
+MODULE_AUTHOR("Sumit Kumar <sumit.kumar@oss.qualcomm.com>");
+MODULE_DESCRIPTION("MHI Endpoint Loopback driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


