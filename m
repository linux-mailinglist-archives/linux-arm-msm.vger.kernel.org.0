Return-Path: <linux-arm-msm+bounces-115566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kWdjME2WRGpixQoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 06:23:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9436E9AE1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 06:23:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=i9bxJXz7;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=M7caRheI;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115566-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115566-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5383B301EC66
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 04:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D09238F94C;
	Wed,  1 Jul 2026 04:23:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8AA740D564
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 04:23:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782879805; cv=none; b=JCJtx230ra6+9Yr06vQgPasFSx2Exq9ncibFgftgdox//9wfEA5S7m19r0f7XM3BBuF0NSIta14j1grwpJGSWNyRQ4V7lo4Ru6B3begLRgf8en33+rbxTwzlmVJtzQMmmntch6Wwi9ldeCLLB8h8ERg9M6Uhu+lSjwPzz04vm6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782879805; c=relaxed/simple;
	bh=h1A3GvXZLmpU+7XtveY+WUnq/NtQJw+MBtI4CdDkxiY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Mmaps3VX3ohBhiYalAZbGY/d0n4qPTyXkh/eyWe3MbgWtguSIeqqClGlr8xwUbPigNi9LhbnIK4w/ty+yfEki2gXPsE41HcKE2E2/ZmgV8LsxyaL6eEaSv2ANmZhTEyVAkR/5Dzsn1xCUMMtN6N0P6RJUEgZN6NQiPVCyJbjTmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i9bxJXz7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M7caRheI; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6612tVJv3953039
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 04:23:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6Ts0whoWYnO66ZOrPIzcFD
	yriQ+6rFG+W5+Pb9VPGn8=; b=i9bxJXz7xsYtxlN5DuZiYpRg8dxBU+4Xpo7UIh
	yY95DfEs/Cn9/EAArBAJBRE9zUVXldcs801ul3Gw8cniI80+z9KX/WpM8m492DuQ
	t+QmzLD+QO7xJi/UBEKtO6c0EFBTD+HfulCXgcksbWtvjxOvyFE+QuOFK8g8TKMV
	3QaHaPIXt5O663BMKaiGQg052NBalPM7BMm+ZQlKfvfBepziPLa4OiDyiedM+KLn
	Uiyff40paLPUairxobZRL3zzwDJSrT2WTJm4scyG2yt19oz77diJ4fCDrEUsEQng
	dQxuLoqaDR7rq7F9JAT2N3MfdiF1omGeZcC+YR3BOYukUc4A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jkta2un-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 04:23:21 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c62861b3bso820575eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 21:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782879800; x=1783484600; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6Ts0whoWYnO66ZOrPIzcFDyriQ+6rFG+W5+Pb9VPGn8=;
        b=M7caRheIbTk3AtBKEw7raY5Hqg1WoJ13R7Hy9pXPWnzEROyyti1eLu3y9IkXtvm2Mq
         Z8l3tDeqtmL1PVEM7IfMSZDD/dAIX4Xhrw2jvP6+IMsEvJSQ1XVzlxdRzbA95LK0793M
         M+JWSDol0HrqIEhtMoFhdcNOjAU83Y/B14ZBux27bF9dKxJo9dZU8somLIds4M2/6CR8
         cY0ARDXytngCbk5BCNs7e1y+Kxhh079g1IqU3A39LbvwQ9vqZ3fdNu3CCBEYWa6/UiHt
         MZ/QQf/wLNAR5YEMc4jVY5uyjOTs9HWIR5MutpmR4o2SGvvbZUtzTEL0VcyndYB66g5q
         kx2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782879800; x=1783484600;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Ts0whoWYnO66ZOrPIzcFDyriQ+6rFG+W5+Pb9VPGn8=;
        b=DKlDu6qC/Xh7d7FcmpAXKqkFTfN9yRwyYGJ3A6LYWi9CMoJdrtU0NJzYVesTprInj/
         lrPefkwmEpewqtB58k+3iqdiH6pwXvtCxvGCuuto51ha4SXOqUgJWK+xFsAowcsUcjG/
         To/sfwf7Ck5yzYnNqV/QoM6srY6jry+/YJm6smWXI069qFOh/P0m1suWKdQrMeLMpl6V
         7DteEE6/IGvmQB8gP17BmTfI8DnRC+pB83RKjF8XTEU8wxc6lineSc0dqZ7bAkqJDQ+r
         LC3dFpIjgaBpQ2rE/vhlpIJmAVDhMVdpPmqv5AT7g0Fs7MwD1BRhKdQnyJ8zXHP1vQnp
         4uNw==
X-Gm-Message-State: AOJu0Ywfbd4PnKMuSR02xnLosM9f3geZ6FvnCixBTbmUCej+8ySFCIMH
	yTfWZmyMNrf8jkDTN4sA4tUMV/3dPCLMFlYO722qxsTSayXkSu5dD+qO0vXIVk378KjzIlwoqcP
	c6XV6mpTcJno6ZqRe0xmVnhIvB1gAcwCJ/hCXgl/CvvsKyTdDRmo3PTKuO/aUNzduVhQT
X-Gm-Gg: AfdE7cnELKB+/Cp8vLC4PnZF3z3sKb4MgJlSTHKZlAQEMCjw/hqSX8PsE/LxXDR/7Ai
	z4wQ+RyTnbFtsTngWuvwmKwgbtk0guEGkbI2644Da0HGApojDPdvMmp/35voXHjYuld7VY9IcP2
	MIFL6s6pi84hXOZ6phLACsNJvIBBMvkauW4LLxXN3eKfDOWn42UC8EHO6s5eHQoAD0NxmHwfzel
	e4bL1cqV0VKHu3aReIRwXeGvnJrboB9igETrcQqGEYXybEqmf2Rak4Zuav7DX6zeoWp5axgZMnj
	G8THGACinyWL90OqDK1kCOrx/RRASHgtttNYQFRiPYfm2l9P4FJWe5Yd3OVsVDdhzks9ZxGLo8c
	B++tZEM2TCuScw30/eLh/yUD9jvKQBTVoNRZbFgWmxtgR
X-Received: by 2002:a05:7300:691c:b0:30c:ab97:d7b3 with SMTP id 5a478bee46e88-30eff391662mr42653eec.45.1782879799911;
        Tue, 30 Jun 2026 21:23:19 -0700 (PDT)
X-Received: by 2002:a05:7300:691c:b0:30c:ab97:d7b3 with SMTP id 5a478bee46e88-30eff391662mr42605eec.45.1782879799302;
        Tue, 30 Jun 2026 21:23:19 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee3205796sm17815755eec.23.2026.06.30.21.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 21:23:18 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 09:53:10 +0530
Subject: [PATCH] serial: qcom-geni: Pre-map RX DMA buffer at probe to avoid
 sleep-in-atomic
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-fix-sleep-in-atomic-context-during-rx-dma-setup-v1-1-95c208380c65@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAC2WRGoC/yXNTQrCMBBA4auUWTuQFoziVcRFfqZ1xCYhk5RA6
 d2Nuvw27+0glJkEbsMOmTYWjqFjPA3gniYshOy7YVKTVnq84MwN5U2UkAOaEld26GIo1Ar6mjk
 smBv61aBQqQmdOmvrZ3U13kKvpkw98TveH39LtS9y5buB4/gAOCoTdpMAAAA=
X-Change-ID: 20260617-fix-sleep-in-atomic-context-during-rx-dma-setup-c056bdf08adb
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, bjorn.andersson@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        chiluka.harish@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782879794; l=5502;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=h1A3GvXZLmpU+7XtveY+WUnq/NtQJw+MBtI4CdDkxiY=;
 b=kdD8dcSXZqQ7NHyLrx1sbeV+GNrH2FJw75X8kKH3ghy1LnC4ay2ffFuLHzBqHu2LhZhPBK9bt
 JFXGOR4qaTFDcKtMtE9hZg+0+mTBOqBjugQ6teoOVFv0WAVenOdYemA
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA0MiBTYWx0ZWRfX0LXmwqeKcAJA
 fggfXqqBX6VnJuvnfm/oGObGcA80CLnOB0vdVsVXJW73uMAewTIBm510BS3Xg4Cj3ZWg3sbWmJx
 KsHJ4kulld3Eg+fQIXaIyI9M8gnvKBI=
X-Proofpoint-GUID: b7-JPaNvywgf3ah-zBYQsofMV5x9RHFt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA0MiBTYWx0ZWRfX/2Z+5h7PW76w
 eHXwBQTqpaNjt14dzkbAqh7wjW+j6gWrqRnEopQaxkDkLGBgIUutJNkvQN1NiYRDuO+4kAYVW7X
 xeswbJFxhiXaupHiva5xZXR20is3FkxCa4vbITijwG8x3xLVrfRQZHD/kEeHaJ3+9gnE1mlCMua
 jKqZV6+VxvCT7ZCWVK5CZomTaLBbbxe93vwp1wno2MXQS2b63OZrJ5c8mAStBEhdPCPmra7tjGO
 Y/UjkX4VxgBIRksbt9iPfROdoPogSc2+mjX/voUlKy+n1fccZjTxN6om8RE1lSTLFblS9kfbFrl
 Rz/qh3H47hEI0uc8lpS/eKpMEFNtoAF3/LYdbkRHcXoMy6UOynqIsb3fWEph4BtAvSK6cdFNpRr
 vVv1aHd1Tw8gCh39wpcWoNor9V0WeF92k432xH/a2tQhiXVMEjbErV9Zc5RSnfv1vFyLoooUYAH
 ynUZbYFV3IWCFFUIIzA==
X-Authority-Analysis: v=2.4 cv=R+wz39RX c=1 sm=1 tr=0 ts=6a449639 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=iI12EKIy37xJd30OuqwA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: b7-JPaNvywgf3ah-zBYQsofMV5x9RHFt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010042
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115566-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-serial@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:chiluka.harish@oss.qualcomm.com,m:praveen.talari@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2D9436E9AE1

geni_se_rx_dma_prep() calls dma_map_single() which can trigger IOMMU
page table allocations under GFP_KERNEL. This is unsafe when called
from qcom_geni_serial_start_rx_dma(), which runs in atomic context
producing a "sleeping function called from invalid context" splat:

    __might_resched+0x15c/0x17c
    __alloc_pages_noprof+0xe4/0x4c8
    qcom_io_pgtable_alloc_page+0x100/0x250
    __arm_lpae_map+0x2d0/0x870
    geni_se_rx_dma_prep+0xd8/0x158
    qcom_geni_serial_start_rx_dma+0x84/0x16c
    qcom_geni_serial_startup+0x70/0x104

Fix this by mapping the RX DMA buffer once during probe, where sleeping
is allowed, and keeping it mapped for the lifetime of the device.

Replace the geni_se_rx_dma_prep() / geni_se_rx_dma_unprep() calls in
the runtime paths with dma_sync_single_for_device() before initiating a
transfer and dma_sync_single_for_cpu() on completion, using the persistent
mapping. The buffer is unmapped in probe's error path and in remove().

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/tty/serial/qcom_geni_serial.c | 55 +++++++++++++++++++++--------------
 1 file changed, 33 insertions(+), 22 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 7ead87b4eb65..3e460b0358eb 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -9,6 +9,7 @@
 
 #include <linux/clk.h>
 #include <linux/console.h>
+#include <linux/dma-mapping.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/irq.h>
@@ -863,37 +864,31 @@ static void qcom_geni_serial_stop_rx_dma(struct uart_port *uport)
 				uport->membase + SE_DMA_RX_IRQ_CLR);
 	}
 
-	if (port->rx_dma_addr) {
-		geni_se_rx_dma_unprep(&port->se, port->rx_dma_addr,
-				      DMA_RX_BUF_SIZE);
-		port->rx_dma_addr = 0;
-	}
 }
 
 static void qcom_geni_serial_start_rx_dma(struct uart_port *uport)
 {
 	struct qcom_geni_serial_port *port = to_dev_port(uport);
-	int ret;
 
 	if (qcom_geni_serial_secondary_active(uport))
 		qcom_geni_serial_stop_rx_dma(uport);
 
 	geni_se_setup_s_cmd(&port->se, UART_START_READ, UART_PARAM_RFR_OPEN);
 
-	ret = geni_se_rx_dma_prep(&port->se, port->rx_buf,
-				  DMA_RX_BUF_SIZE,
-				  &port->rx_dma_addr);
-	if (ret) {
-		dev_err(uport->dev, "unable to start RX SE DMA: %d\n", ret);
-		qcom_geni_serial_stop_rx_dma(uport);
+	if (!port->rx_dma_addr) {
+		dev_err(uport->dev, "RX DMA buffer not mapped\n");
+		return;
 	}
+
+	dma_sync_single_for_device(uport->dev->parent, port->rx_dma_addr,
+				   DMA_RX_BUF_SIZE, DMA_FROM_DEVICE);
+	geni_se_rx_init_dma(&port->se, port->rx_dma_addr, DMA_RX_BUF_SIZE);
 }
 
 static void qcom_geni_serial_handle_rx_dma(struct uart_port *uport, bool drop)
 {
 	struct qcom_geni_serial_port *port = to_dev_port(uport);
 	u32 rx_in;
-	int ret;
 
 	if (!qcom_geni_serial_secondary_active(uport))
 		return;
@@ -901,8 +896,8 @@ static void qcom_geni_serial_handle_rx_dma(struct uart_port *uport, bool drop)
 	if (!port->rx_dma_addr)
 		return;
 
-	geni_se_rx_dma_unprep(&port->se, port->rx_dma_addr, DMA_RX_BUF_SIZE);
-	port->rx_dma_addr = 0;
+	dma_sync_single_for_cpu(uport->dev->parent, port->rx_dma_addr,
+				DMA_RX_BUF_SIZE, DMA_FROM_DEVICE);
 
 	rx_in = readl(uport->membase + SE_DMA_RX_LEN_IN);
 	if (!rx_in)
@@ -910,13 +905,9 @@ static void qcom_geni_serial_handle_rx_dma(struct uart_port *uport, bool drop)
 	else if (!drop)
 		handle_rx_uart(uport, rx_in);
 
-	ret = geni_se_rx_dma_prep(&port->se, port->rx_buf,
-				  DMA_RX_BUF_SIZE,
-				  &port->rx_dma_addr);
-	if (ret) {
-		dev_err(uport->dev, "unable to start RX SE DMA: %d\n", ret);
-		qcom_geni_serial_stop_rx_dma(uport);
-	}
+	dma_sync_single_for_device(uport->dev->parent, port->rx_dma_addr,
+				   DMA_RX_BUF_SIZE, DMA_FROM_DEVICE);
+	geni_se_rx_init_dma(&port->se, port->rx_dma_addr, DMA_RX_BUF_SIZE);
 }
 
 static void qcom_geni_serial_start_rx(struct uart_port *uport)
@@ -1864,6 +1855,14 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 			ret = -ENOMEM;
 			goto error;
 		}
+
+		port->rx_dma_addr = dma_map_single(pdev->dev.parent, port->rx_buf,
+						   DMA_RX_BUF_SIZE, DMA_FROM_DEVICE);
+		if (dma_mapping_error(pdev->dev.parent, port->rx_dma_addr)) {
+			ret = -EIO;
+			dev_err(&pdev->dev, "Failed to map RX DMA buffer: %d\n", ret);
+			goto error;
+		}
 	}
 
 	port->name = devm_kasprintf(uport->dev, GFP_KERNEL,
@@ -1928,6 +1927,11 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 	return 0;
 
 error:
+	if (port->rx_dma_addr) {
+		dma_unmap_single(pdev->dev.parent, port->rx_dma_addr,
+				 DMA_RX_BUF_SIZE, DMA_FROM_DEVICE);
+		port->rx_dma_addr = 0;
+	}
 	dev_pm_domain_detach_list(port->pd_list);
 	return ret;
 }
@@ -1942,6 +1946,13 @@ static void qcom_geni_serial_remove(struct platform_device *pdev)
 	device_init_wakeup(&pdev->dev, false);
 	ida_free(&port_ida, uport->line);
 	uart_remove_one_port(drv, &port->uport);
+
+	if (port->rx_dma_addr) {
+		dma_unmap_single(pdev->dev.parent, port->rx_dma_addr,
+				 DMA_RX_BUF_SIZE, DMA_FROM_DEVICE);
+		port->rx_dma_addr = 0;
+	}
+
 	dev_pm_domain_detach_list(port->pd_list);
 }
 

---
base-commit: 4fa3f5fabb30bf00d7475d5a33459ea83d639bf9
change-id: 20260617-fix-sleep-in-atomic-context-during-rx-dma-setup-c056bdf08adb

Best regards,
--  
Praveen Talari <praveen.talari@oss.qualcomm.com>


