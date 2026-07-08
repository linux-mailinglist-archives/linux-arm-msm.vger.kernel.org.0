Return-Path: <linux-arm-msm+bounces-117509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0F1fJWTrTWppAAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 08:17:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1CF7221E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 08:17:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=C+3WaYRH;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dojzAC2P;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117509-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117509-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E1B23304179F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 06:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E2A23C1406;
	Wed,  8 Jul 2026 06:15:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338CD3C063A
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 06:15:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783491344; cv=none; b=s3aQviJlssZmzs9Sl9p4aEG/neN8o3Ta5ScGVs7XrJ91cPXvMuP5MCtQ2IRZV0App4gcegJYTziwIWzuTIEQRCIXK8WaVZWp94tbC0E5wnDIQEE9S1YxXsDX+gEdDc21W5Nfkd11CXtR+OKTnYPiN+iApMu6Cl+JeYfK4yKuXnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783491344; c=relaxed/simple;
	bh=p8bexT1dnYfA28Dx6f/K9t0rSOHXSXRTJvrhxTIDEOA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ef4nNmU8K6ntiUQyxoXGdkO0Irao96HkDRYVLm/J9joFnj8edSv0AY/kR6LVBeC8hTUCTzhq3HxL91QEXdyauiLERoeeQftz2Ud6jsEGhQNNb8qyUmJ5hIHr24EC+ZCOgHP8yZgezwmC0vx5MjMJVbgYo9E5RdZzU2n8yHRb04Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C+3WaYRH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dojzAC2P; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842a8F1667899
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 06:15:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8Z9XwdwNPnvmUsig+q9KX5vhhyT/MzJuWsROOPCiqZc=; b=C+3WaYRHQmBp9taQ
	CAQjb+pOX1N06/4TubNStppSzYWBprUIKNB5Hv4bFUDm+Pv4J2EJEb/bn4e/uDYS
	pBpxf7CUlAvTRV2oLpMf54foWKxVMHeYGY4ONkEWduvmc0TKQ4c+VevLdXEyUiz7
	GXOfIkjRNn9pjON+vdrVKBJA63Cm/CMmm1XFuw8GJ/JrHt4tznjXMt/DoHkCyFib
	K7jdCnjjF4TCVp/ER9+yFuzD8fh+Cqi2Mg2jOEJCpREqWIwC0U6FoCxW430/nQ08
	rldYLVpmtZ9bLjc5lbDxFoQoQj12Dm8tgzVVrHKukKtlErXGkBD4qsmBbV2d4gHS
	VPM0Wg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95e5tyfy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 06:15:37 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ca3b314193so8631835ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 23:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783491337; x=1784096137; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Z9XwdwNPnvmUsig+q9KX5vhhyT/MzJuWsROOPCiqZc=;
        b=dojzAC2PJfBmPNNZFESjc4gB2RD2sWRD1RY4NsoNBPQO7CX8czOMsG4ldNc3yMf/UZ
         hjshOlnr7rVgHYWe2eRj7y3YUBGHqVNMjhWzXlokIMWIgRor9cv3uSQTQJpokgtUCAfO
         rs3tAqvE9TfqY9935hNrn2vRmAx7Bgl5nmbcab0ZJbNu8IyGGkyR92+dZqrSj1HZ/rxg
         XlGvg5jkaHHT8sXEsXtUm0bfFXgP4NryyEuOmaWXFT7X8PMVTB+p7y8NDfdZkM/R1zGQ
         KLN6KA7JlNtf65EQFfQATE2z0J8Nz8f7SyeEXmYlWqpAgpWPoztKMIGECQJh1UEyuKML
         qRvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783491337; x=1784096137;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Z9XwdwNPnvmUsig+q9KX5vhhyT/MzJuWsROOPCiqZc=;
        b=lWnyLMECIL+BHhAtzBZp3L1fYUWQorzTT21C0+olLgD0s7IpRFJW0f2S1JEuo4gwST
         3c/52EDPGMrmaLNBwwbmCU+kWVf/U1edQ4okoJ1+tGppjjl8ao6U+f4s8Ux7wO55YezD
         W4ovLaDtx/uulWENxZe9Qzjs9r4GIZgZ5w/q8pRhpsYBjXn2M5+yEKvSCOZV7bBdFyDA
         XafxutgTtXSbF37YRL6g1zKvmendympzjhb77VrYbtNcL1sWmWWFQm8NM44XZTuhc5kE
         bOBGNjVk3TguN17myf2rjZG1bRYI9bOcopHXcySyi6C2rp8Bz9R3Iewptxw6VUE7bf+0
         cCWw==
X-Gm-Message-State: AOJu0YzM9MPcwlZda1TyVEOINE2dsjVMdw/XEGsXl78q/2QSZmaYSYjm
	98BqVjL7lq0WZdfbsHpQB+fXQkZwO4UApAwp8aYfbKHe1n0bStzpiybbbW8a5kzTu5H39rkZ2Nf
	40z8XJr4j9bc2nXb9w4Xr5mjumZbRmfl1kQaExQkUBdhmKFUsOi91xywy9gAzMJ0/u//rb/3N9V
	hk
X-Gm-Gg: AfdE7cknzWEqjwtf8s6ByiXQnmDZRiyzPW/XtVYK7flugy39Uxfg6fv35IBoupUV+H8
	9xhWyRGcjx2FzGxTlLeRjgaZa94M8Ym6I44bxgMkoDKE0EtQmLFXzEqSbICCUPaeyb5h2mm3vni
	m8CwpJ1JfKvzPMxFwiT7SJgeWdrjXnBvZdYJDfHUlnFJpNqVEncmvcbjWXEEPk+w3AmI66rytxp
	xvjtdPrmz2QFUqcFmDqVQl+CF7KN/JZJBz/iNb1QxWdVVFK5JsmtqkEkdyBluZzOiZMkE/0GJeg
	+4HBKJtYmbYYM017baD1TQ8pGXRatl2Z3bmm0TdpzJN73GRf/PEapEdxKdBGMk5JAzLNhZ9AwsF
	6nwsKcJYE4wGHc+C7pUHwSSY8r/Wh/2UHGjALiRrFzRdV
X-Received: by 2002:a17:902:ec90:b0:2ca:bad4:33a2 with SMTP id d9443c01a7336-2ccea3a28dbmr12187875ad.11.1783491336882;
        Tue, 07 Jul 2026 23:15:36 -0700 (PDT)
X-Received: by 2002:a17:902:ec90:b0:2ca:bad4:33a2 with SMTP id d9443c01a7336-2ccea3a28dbmr12187485ad.11.1783491336206;
        Tue, 07 Jul 2026 23:15:36 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb9bbsm23011555ad.4.2026.07.07.23.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 23:15:35 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:45:23 +0530
Subject: [PATCH 3/3] i2c: qcom-geni: Avoid unnecessary transfer cancel on
 address NACK
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-fix_cancel_sequence_on_failure_for_i2c-v1-3-dd8f841f36a2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783491323; l=3863;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=p8bexT1dnYfA28Dx6f/K9t0rSOHXSXRTJvrhxTIDEOA=;
 b=+FpuMKkxvy4k7ZJowgcdrGDby/96nq59laWEXTUYTugA8Jz0pGVc/3Mrjs9p/oOotvSKHuWl1
 Eoe74ThWQiNCm8pWHDJ6yIchRun3j+2PYkv2TQtqyFPVAkZtt7kIlDm
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-GUID: aLZH25YLCvkEqE0jOJUZzdNTQyQUKnMJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1NyBTYWx0ZWRfX7AQugA8f7eOA
 gU7debBe3V7K0FJ5iA5Iq4SUC/kTuivuCstqM6QPxJuAXQsKC/skvwUdl0dTg57TvDTjyeTRjFb
 IxdcbjY8gfOJqqbbWp+51+ocBUUm2Mw=
X-Authority-Analysis: v=2.4 cv=CNoamxrD c=1 sm=1 tr=0 ts=6a4deb09 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=9WHUdGnV1KnJ8Vak2loA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: aLZH25YLCvkEqE0jOJUZzdNTQyQUKnMJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1NyBTYWx0ZWRfX0Ruxbrj2zUbo
 AJjSymAc1OLXPmkh8UC09jNQwFuESt2ZV+KWOJZby0qbC16Uvme3Eh9ArNNktxE995rc7gM1Gdq
 LnJP94C1LyOxwfQQMcmpbqtwEr0t4VHD2ayZynowlVYh4Niq3b8ATI3OelVPXnmgfNDvgJF+m7C
 DtBh8S0WRX9QUdhpfGHzDcY8IrizWuNmsool4TssdpVfkggT7hp+uqSsoMv4b328a9dahqqZtl5
 D3AUmwnQdU7iRkEthrtCKfg5set9vO8FCJDUlB9k4T0E9KWkdOgYQEI3TGG9cXjWhXg8wPCAX/P
 AaJ4dmPR1ku2XwhZTZufwYCiGRUHdTTha/A8ZxS8KVU4Xk/h7ys/8B4upog2mF8pTv6FZwAj8mX
 GgKCesa2zNexQzgvrEN60PA3D+s7s/Ge/SIDu6dV4wcZNopQm2BbWi2ocxYn9bMCWqpBWl9Sy31
 s9Svf+mkY4wSYESofhg==
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117509-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mukesh.savaliya@oss.qualcomm.com,m:viken.dadhaniya@oss.qualcomm.com,m:andi.shyti@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:praveen.talari@oss.qualcomm.com,m:naresh.maramaina@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EC1CF7221E9

When a target does not acknowledge its address phase, the GENI hardware
raises a NACK interrupt. In this case, SE_GENI_M_GP_LENGTH remains zero,
indicating that no data phase has started and the transfer was aborted at
the address stage.

The driver currently treats all transfer errors similarly and always
issues geni_i2c_cancel_xfer() followed by TX/RX FSM resets for DMA
transfers. For address NACKs, the transfer has already terminated in
hardware and issuing an additional cancel/reset sequence is unnecessary.

Track address NACKs separately by checking the transfer progress length
when a NACK interrupt is reported. Skip the transfer cancel operation and
DMA FSM reset paths when the NACK occurred during the address phase.

This avoids redundant cancel/reset operations for a normal address NACK
condition while preserving the existing error recovery flow for all other
transfer failures.

Co-developed-by: Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>
Signed-off-by: Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 9490aee4928c..0448654f2678 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -130,6 +130,7 @@ struct geni_i2c_dev {
 	struct dma_chan *rx_c;
 	bool no_dma;
 	bool gpi_mode;
+	bool addr_nack;
 	bool is_tx_multi_desc_xfer;
 	u32 num_msgs;
 	struct geni_i2c_gpi_multi_desc_xfer i2c_multi_desc_config;
@@ -293,8 +294,12 @@ static irqreturn_t geni_i2c_irq(int irq, void *dev)
 	if (!cur ||
 	    m_stat & (M_CMD_FAILURE_EN | M_CMD_ABORT_EN) ||
 	    dm_rx_st & (DM_I2C_CB_ERR)) {
-		if (m_stat & M_GP_IRQ_1_EN)
+		if (m_stat & M_GP_IRQ_1_EN) {
 			geni_i2c_err(gi2c, NACK);
+			val = readl_relaxed(base + SE_GENI_M_GP_LENGTH);
+			if (!val)
+				gi2c->addr_nack = true;
+		}
 		if (m_stat & M_GP_IRQ_3_EN)
 			geni_i2c_err(gi2c, BUS_PROTO);
 		if (m_stat & M_GP_IRQ_4_EN)
@@ -443,7 +448,7 @@ static void geni_i2c_rx_msg_cleanup(struct geni_i2c_dev *gi2c,
 {
 	gi2c->cur_rd = 0;
 	if (gi2c->dma_buf) {
-		if (gi2c->err)
+		if (gi2c->err && !gi2c->addr_nack)
 			geni_i2c_rx_fsm_rst(gi2c);
 		geni_se_rx_dma_unprep(&gi2c->se, gi2c->dma_addr, gi2c->xfer_len);
 		i2c_put_dma_safe_msg_buf(gi2c->dma_buf, cur, !gi2c->err);
@@ -455,7 +460,7 @@ static void geni_i2c_tx_msg_cleanup(struct geni_i2c_dev *gi2c,
 {
 	gi2c->cur_wr = 0;
 	if (gi2c->dma_buf) {
-		if (gi2c->err)
+		if (gi2c->err && !gi2c->addr_nack)
 			geni_i2c_tx_fsm_rst(gi2c);
 		geni_se_tx_dma_unprep(&gi2c->se, gi2c->dma_addr, gi2c->xfer_len);
 		i2c_put_dma_safe_msg_buf(gi2c->dma_buf, cur, !gi2c->err);
@@ -493,7 +498,7 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 
 	cur = gi2c->cur;
 	time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
-	if (!time_left)
+	if (!time_left || (gi2c->err && !gi2c->addr_nack))
 		geni_i2c_cancel_xfer(gi2c);
 
 	geni_i2c_rx_msg_cleanup(gi2c, cur);
@@ -535,7 +540,7 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 
 	cur = gi2c->cur;
 	time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
-	if (!time_left)
+	if (!time_left || (gi2c->err && !gi2c->addr_nack))
 		geni_i2c_cancel_xfer(gi2c);
 
 	geni_i2c_tx_msg_cleanup(gi2c, cur);
@@ -917,6 +922,7 @@ static int geni_i2c_fifo_xfer(struct geni_i2c_dev *gi2c,
 		m_param |= ((msgs[i].addr << SLV_ADDR_SHFT) & SLV_ADDR_MSK);
 
 		gi2c->cur = &msgs[i];
+		gi2c->addr_nack = false;
 		gi2c->err = 0;
 		reinit_completion(&gi2c->done);
 		if (msgs[i].flags & I2C_M_RD)

-- 
2.34.1


