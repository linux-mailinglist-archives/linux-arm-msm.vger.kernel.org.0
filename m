Return-Path: <linux-arm-msm+bounces-117507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Xas5FjHrTWpdAAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 08:16:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C66247221CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 08:16:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QR5hyZKZ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WusdPgVq;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117507-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117507-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC9CB301CA61
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 06:15:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC44D384224;
	Wed,  8 Jul 2026 06:15:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C753BB695
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 06:15:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783491335; cv=none; b=JAvl/kSmLfF5Tv33XVa5LRQI4r6SWWTB5yha+i4WeUbZB0XK7lcYMY2+Uq1EsIa/UNFo+ndZfxuZO1grUEVTolkR3FvcqP6Jim7DeXiQ9qDjFbS2J2JWAT8JPJCarifdO7imj9S1Ui+Fd3yfy21pmY4bW6tQVHwxsmqqt5sVnZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783491335; c=relaxed/simple;
	bh=AJr4tXEwpWIFZ9uohJ8aIXrS0/0noMhGeGnbh8GMRTU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kLtq90tf54jokDBnLCGlFC/YboqzqlgZY+ubi1H+vlPh1v2Qk/iFIxeLkrOmyyBPMruvOAsa4M/ndY8X+eSZsK/H8d+RX/2L5Vh3Vy6PdynrHClxAs7O04kQc7hHGnzQZpIXHMI8EKgtz1ErKPeQFJP/8AS0tI7fnq0hXugYpks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QR5hyZKZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WusdPgVq; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842acW1667872
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 06:15:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6YqCzIIsJslLxIfUnnI9mEywo1c/jx/Ea+gq4LbmjlI=; b=QR5hyZKZ8l1adJQF
	k+Ge5467h2hok2o2gQV2yCBEqXlYCjXgb0aEodf7qr9mkZ4Z9zCEHzRKpo0FKQ43
	EgMz40f3nKCMjlrEAF8Znegk8OrN4r9FftWjgQwPKyIndgAH/fTVZgug73FLR2Cw
	41QX8HNtQPkqS09ctriJwTUTqxAl/7odZa3eIXiFDtguU1d4nOfWnZZNZ0SYnaWh
	bxQc70dk9o9UiUPDrm+XV2SLHm2TMhDFBq5SwYWqBiVQWMUNWdEW3l0VVwGBb6jr
	YwJihjKxYLCgWazMtKOE6wEG4bn8oOE3SNct6w8lHIyQy6WP+BhmzW+DFZJrtIuf
	E8p6vg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95e5tyfd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 06:15:31 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c354050c34so6194125ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 23:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783491330; x=1784096130; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6YqCzIIsJslLxIfUnnI9mEywo1c/jx/Ea+gq4LbmjlI=;
        b=WusdPgVqnczbtCb7nefXIYWF+DJF8tYUMzD5ew+M+k9bne+yn/PH2xgvTadnELy/3o
         tk//lXz63V5kr8dJs0rNydkKxZ0jwBZtGnK8Qo0t6Al55kAwzLISPJsGybMfAy03NRax
         YGDzwxAYQ9hub1eWFYsGZjaf6lCAR44VbrDbXBh+A609L6RclfwS2KV6A+dky1ZjFHRT
         CI8kMWafBIgtno8NPaYZ84kUbSC/Qy50YbqFFsR1w6V+Hv8ZGTqIGHEbXonUt6puqNR2
         oJOxsp7mGLDknjZSU/1+0HFex8wU+0yS2cRJmHTs8F+iFHXjWDuEodqg18VJIAKc1Wgc
         Oc9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783491330; x=1784096130;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6YqCzIIsJslLxIfUnnI9mEywo1c/jx/Ea+gq4LbmjlI=;
        b=s8W7XMSl0hRdg0lgpE9u0jE1nSfm/9PC+l3JXUfmtTJF233eLHKsm8gZmnW9aJMH5u
         eHlBkZuvCZ6jdXKnehNeIcP0ateA8GC20lgSPXeUFrn0ZoHG5vVVYlXvEnKReaw7OlOp
         9IhMT2j+kXcPPzifuD/sfrbnYX4k/kwjCNSXPmz7+DIBOu2G7DiA43hyQYyOHh0HWJq5
         GWjEN1jF3uhprSJRMNefirwgAiIB1FTBXz/FTx5IM3sj5SdY8hVHMwnChCUoJ5nnnUma
         fLMXeqf3RqPpkuJ9Gl47SsV7tBjbsvMhDsXadfcmOgeGkryZx3cZTsNT0ZilhSmozvwT
         mUfQ==
X-Gm-Message-State: AOJu0YzMGUq6LuZamPxql8Ejo/0Ntd2w8qyoJ9bzzA1n8TTdEuGEygyN
	MOREDKgN9RoJysYCTZ38DAOVJ7pKEiHGTkoHMsxoXbleWS5RCht6vq4If+Hnav0pGXBi4v/WRTn
	Su86LRgC+iZ+JoYciGq8/GSxjbkfXRNCBd0L5MM/cdg6K3Ed8fKwdrmM7o/FwD7SYmk2adfyGAE
	UQ
X-Gm-Gg: AfdE7cmTqtv4bxcxRMZXvEB8mKsXOUPtbF5idJqqXNrYxj60WMFk87wDfCKimM8Vsrk
	X3nCjD6RrwIqfXFCOynfcLTmUprlN9CQZd4Y4WJzj0o0bmDkQjN3boOSaQFa+MRQUffV1czCF9X
	rE5YdzeJjQBbxdVbjAyvGeEXV0G99Z/tOo+yI6BO70oYfa4+J2HbLUW+0BXO8Rk4iw1BqARs54E
	FU0sJWoZ7nK2PxpJSTDSmJ9wzTY5SJKNgPU56n9istT7ei/jync6Xtvm5v3diBqUPswFGCb+rhy
	netEGynwN0A7VgUyypBQhQokjbrm0ZC2L6dHxyP9GEZzJKZ4hgFzNGAn68drY/EXghf4NOX2RMC
	Dnv7ynuK8p+mp1wtUwkhT7L1gGuwiEfUbE+EavpSnzhq4
X-Received: by 2002:a17:902:d481:b0:2ca:d818:61e5 with SMTP id d9443c01a7336-2ccea4646f0mr12450615ad.26.1783491330261;
        Tue, 07 Jul 2026 23:15:30 -0700 (PDT)
X-Received: by 2002:a17:902:d481:b0:2ca:d818:61e5 with SMTP id d9443c01a7336-2ccea4646f0mr12450275ad.26.1783491329644;
        Tue, 07 Jul 2026 23:15:29 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb9bbsm23011555ad.4.2026.07.07.23.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 23:15:29 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:45:21 +0530
Subject: [PATCH 1/3] i2c: qcom-geni: use cancel command before abort on
 transfer timeout
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-fix_cancel_sequence_on_failure_for_i2c-v1-1-dd8f841f36a2@oss.qualcomm.com>
References: <20260708-fix_cancel_sequence_on_failure_for_i2c-v1-0-dd8f841f36a2@oss.qualcomm.com>
In-Reply-To: <20260708-fix_cancel_sequence_on_failure_for_i2c-v1-0-dd8f841f36a2@oss.qualcomm.com>
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783491323; l=3536;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=AJr4tXEwpWIFZ9uohJ8aIXrS0/0noMhGeGnbh8GMRTU=;
 b=kmFGJ4UFjcSZh/hDd84DbNqU7F2gcgsrHTRsNxHsY0Q1xI+2EUbi2wxOM/lcuCTYfCMIcxlrk
 9NTkSciBF//BSaB7hLGQanrOuyBANI63gnY+TPMNawQSi2IKAm7ikZ9
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-GUID: thOVozARIKRUzLdyuhChpjkGBvEfGZAv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1NyBTYWx0ZWRfX7eV/56GR71wi
 k3VasZ3oW4Jdw7rbUR+5vjP3RloZnQ+UhyEpD+1j38NBzSIBTPydALkL6NBuQRVvcjyLF+GAmdT
 NNr0KMyerTVbZD6r7QzJCUUcbSrOyt0=
X-Authority-Analysis: v=2.4 cv=CNoamxrD c=1 sm=1 tr=0 ts=6a4deb03 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=HIFZfxgX9pW5VpyTZ0YA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: thOVozARIKRUzLdyuhChpjkGBvEfGZAv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1NyBTYWx0ZWRfX965/gYLgReI2
 a6ZkWsJZELLKOU5NupqC2MZRpRsq0Rz40ieblhr5ShOHTzmco4z9DfQ5zz/tj3TA9/ECqGwPtj2
 LvIWNXwLBRGumopOHGWlIEGd5MD+WrunvWN2Zrn4WxDvD+vkCQeQ+B+sqC53xy0couk7UU9rSD+
 W3Rzc01W7zSmj6uk5/H2adWDm8RFD9dgvh92TjX3dRHOGaMoSr2BqfPgJRxRJPHAG0ZlVXYhKuJ
 GLXuWMsO19zIkeuFV8irru4xWi06DsDoW3Qjr1MuFTX63VL20MGkT87tHLwEiYU0CIlDOLiJwbK
 AvU8tefXz4MEQKZ+QB7ii+luj0VFSE3RW8nA13Pt6aqTwiDYZILBz9T2H3FDfmMWc3/U1r1JfZW
 sQxi7Pirt8n7cVnwjhzZPn7QwWIW3sFvbRKD7a0dHRgUMiD+JZ57L8M6Isa8Lj9azEKxRYWYN2V
 AORRII6a+DXIrWN0Rdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080057
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117507-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mukesh.savaliya@oss.qualcomm.com,m:viken.dadhaniya@oss.qualcomm.com,m:andi.shyti@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:praveen.talari@oss.qualcomm.com,m:naresh.maramaina@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C66247221CB

The GENI I2C driver currently invokes geni_se_abort_m_cmd() directly when
a transfer times out. However, the GENI hardware command cancellation
flow requires a cancel command to be issued first. An abort should only
be used as a fallback when the cancel operation itself fails to complete.

Introduce a dedicated cancel_done completion that is signalled on
M_CMD_CANCEL_EN. The timeout recovery path waits for cancel completion
and escalates to geni_i2c_abort_xfer() only if the cancel command does
not complete within the expected time.

Co-developed-by: Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>
Signed-off-by: Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 96dbf04138be..15403edb355a 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -74,6 +74,7 @@ enum geni_i2c_err_code {
 #define PACKING_BYTES_PW	4
 
 #define ABORT_TIMEOUT		HZ
+#define CANCEL_TIMEOUT		HZ
 #define XFER_TIMEOUT		HZ
 #define RST_TIMEOUT		HZ
 
@@ -112,6 +113,7 @@ struct geni_i2c_dev {
 	int err;
 	struct i2c_adapter adap;
 	struct completion done;
+	struct completion cancel_done;
 	struct i2c_msg *cur;
 	int cur_wr;
 	int cur_rd;
@@ -361,6 +363,8 @@ static irqreturn_t geni_i2c_irq(int irq, void *dev)
 	    dm_tx_st & TX_DMA_DONE || dm_tx_st & TX_RESET_DONE ||
 	    dm_rx_st & RX_DMA_DONE || dm_rx_st & RX_RESET_DONE)
 		complete(&gi2c->done);
+	if (m_stat & M_CMD_CANCEL_EN)
+		complete(&gi2c->cancel_done);
 
 	spin_unlock(&gi2c->lock);
 
@@ -387,6 +391,27 @@ static void geni_i2c_abort_xfer(struct geni_i2c_dev *gi2c)
 		dev_err(gi2c->se.dev, "Timeout abort_m_cmd\n");
 }
 
+static void geni_i2c_cancel_xfer(struct geni_i2c_dev *gi2c)
+{
+	unsigned long time_left = msecs_to_jiffies(CANCEL_TIMEOUT);
+	unsigned long flags;
+
+	reinit_completion(&gi2c->cancel_done);
+
+	spin_lock_irqsave(&gi2c->lock, flags);
+	if (!gi2c->err)
+		geni_i2c_err(gi2c, GENI_TIMEOUT);
+	gi2c->cur = NULL;
+	geni_se_cancel_m_cmd(&gi2c->se);
+	spin_unlock_irqrestore(&gi2c->lock, flags);
+
+	time_left = wait_for_completion_timeout(&gi2c->cancel_done, time_left);
+	if (!time_left) {
+		dev_err(gi2c->se.dev, "Timeout cancel_m_cmd\n");
+		geni_i2c_abort_xfer(gi2c);
+	}
+}
+
 static void geni_i2c_rx_fsm_rst(struct geni_i2c_dev *gi2c)
 {
 	u32 val;
@@ -473,7 +498,7 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 	cur = gi2c->cur;
 	time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
 	if (!time_left)
-		geni_i2c_abort_xfer(gi2c);
+		geni_i2c_cancel_xfer(gi2c);
 
 	geni_i2c_rx_msg_cleanup(gi2c, cur);
 
@@ -515,7 +540,7 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 	cur = gi2c->cur;
 	time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
 	if (!time_left)
-		geni_i2c_abort_xfer(gi2c);
+		geni_i2c_cancel_xfer(gi2c);
 
 	geni_i2c_tx_msg_cleanup(gi2c, cur);
 
@@ -1107,6 +1132,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
 
 	gi2c->adap.algo = &geni_i2c_algo;
 	init_completion(&gi2c->done);
+	init_completion(&gi2c->cancel_done);
 	spin_lock_init(&gi2c->lock);
 	platform_set_drvdata(pdev, gi2c);
 

-- 
2.34.1


