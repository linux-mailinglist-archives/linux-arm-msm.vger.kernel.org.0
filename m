Return-Path: <linux-arm-msm+bounces-97581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHlkDx85tGl3jAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 17:19:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B08286DCC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 17:19:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3396D3015D91
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 16:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8037C34B69C;
	Fri, 13 Mar 2026 16:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MwH9xahX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XMj7XXgW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A6035CB60
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 16:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773418760; cv=none; b=D/dhq5b7sdq6KyIhV4GM4uzUyBrQVcmXbvjLvhqhpA6uMerka36ZRrfwprKIxLO7xZHcRlAjrBzsveO/0p2qhxIPLwSH/wxM9rcNOfllOH0mbKCCZLnlVR9yYy6yUPIPuy3qNrSFj671uGEHqLeeHD/ijcqhIzt3DcdaojeN/d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773418760; c=relaxed/simple;
	bh=47dVlxcqtLyHWfjuM4XOj6jJY+YvtTXdu4uPiubzmSE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bjZ6PlM7zIj8xLYO9LV+D8t9STffX7iRwLzClwt2EYYOkAA+E71bQG99gNJzHme9yzackzTVJcrnDAYYh5ijehUG5BOOsyUQSc4sd5fc7HlgmG7NEUCq2g0ZfaciuChL8E4Nn7mkfNVKJxRkTmU06c4IznVHbOZUzloJi1OMohE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MwH9xahX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XMj7XXgW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DFXGOD437740
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 16:19:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5QzXE/QwB1q8MqfPpLuXHy
	MNlb9zflPOyxcAX6ojgLM=; b=MwH9xahXxYUUTYTz49XjkYKxta96GhHAsf7+iN
	cOaQ5S+nRRLJOTP5g1WVS+cpclPLZ+Jf8PfaG8w65S/S/8tXvmK6HYFgoy/GsuFX
	/ldA71DpQDEbvmVKvCADwz4TG9zxyWO9kmpsaizfEFcWC+f6K1XZa3QWvJtKjVc4
	wZ66Mt1jH1OsvTXXixX48vwg/j3eUYOqAJuUrSRucjbvzkm7j5/8Vim8wuynRZeH
	zz38YuXCzjhCCGKRWqwP5lPEHSPw1o0ldQHMVIyIvypk70oe7RRF+qYeU9SHff2M
	Vg9dHC9QTyJ4xO7mEdglSl1Oaq4GjWdLM1O4tp1kUL66acDQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvnax857v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 16:19:16 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82a106b687cso718532b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 09:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773418755; x=1774023555; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5QzXE/QwB1q8MqfPpLuXHyMNlb9zflPOyxcAX6ojgLM=;
        b=XMj7XXgWwymGURNkYcsstTNEWlK4pphoujfkcadRxE48u8kkhQbxNkQF0TMrIXQf3Y
         AA6dI5q+bNPzgRzH9nQHF67I8eNF0LNL19JbXI8pCYha/raJ6vLTUwOBe/Z3sLWtV23l
         Ba8DuB90i/UyPAWpB5bZIgbgIT01IPC0BGxCj87lHFCV4qa8AP21n4fsU4lHPENRlkmO
         9PJbLAWO0+Kefk/Zli2AcyUKSiK5r2Nj0hCLV4Ch6o/aLOHHYQAleal/H43/BQC5PBXR
         LgR9B/ytmjnqh73MYeSmkPs4HSTAQlbuYqa6UskkAqybrAvXjM0VHbuv99ohi+wLAKni
         rbPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773418755; x=1774023555;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5QzXE/QwB1q8MqfPpLuXHyMNlb9zflPOyxcAX6ojgLM=;
        b=oWaTeCScKLv7YCTSigex3ll5E2ZMdFDtuxN317ckET9p14dO2vIJz7aSr/Q+Cpf6FN
         +V2aS0i6risHZt3Gd60/JY0zCFpv2nPP9HRYEZzdHP472MyE1QdK1LJNN8OWiDI+jn9B
         w74HrR/0GcgyIBvwV7f+4e9k9HYHawT9ZfdGcyCzGJfANk2XjUFOcafvE2wG86cAFCEE
         gFaUy4GAhh5/a20g67geDU5/TvAYUIrDqDDtu+btnZXr2JTg9HAB8w+JIP3Gz1cpsES3
         qtCAK9jcg9foSK4pocxz6//dIIOI+Y9kQnibQqU0Z7zmxR/tAGNDcrmjYMNVXM4hgFjL
         aFKQ==
X-Gm-Message-State: AOJu0YzV7zZMYYhOUiuQYMkcrXTafK1mJMJnMPAudZ4WaCpm3rshpKI9
	sSuZ38sDaCBGtf/YREhtE5KjBo9az2YKUUGSHpENjfQb7P1ftG2sIUazGnitwX4O8fcK9a7hNRW
	Jo41XftbQStwk9O4N+cjzayPKmM67fwSguJ7YtC0J8Pq5oRF5h2QtTxBb6g+9cB8Iw6BO
X-Gm-Gg: ATEYQzygbENVkd7p/RISgWsAlnNus7Z1QHOLMwQFWU395zk1O/LHF09NhU0Z84GPKKE
	0iVbp4fSUDYEkQoE5CPXaTYwqbgtkV0zeD2VzTaiFfyFA1Ipi2pLjuuD5y6yG/uBspv8p5Zwjj4
	mIJJzayls4+LYTcIdw12AlJhKwghRMfgJiFwfRKB3Lb2xhILMh/Ty+WXMC3qow3E5ZRe+j7kJ2q
	I/Wqc43DPXNA8bbuCtv3Fs+Q3BuC2/MR7uPXuJQwxkit8f0t9LHCs7rJ0SjBCWHUdqrDixmXlb4
	/agSY7riHzLtO0RyirsYE1+D4GypxkyY/RgZSDcriGfft1KgyQ07YSS4qpo5w3npZD/8YJFDdfg
	X8c+gQudXbpaBc3hvAdoDkI3f1MTYNVIddZ9IjPQjqqJF3xkcIVIOTes=
X-Received: by 2002:a05:6a00:7441:b0:820:2f9b:fe31 with SMTP id d2e1a72fcca58-82a198ac2ddmr2729553b3a.30.1773418755145;
        Fri, 13 Mar 2026 09:19:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:7441:b0:820:2f9b:fe31 with SMTP id d2e1a72fcca58-82a198ac2ddmr2729525b3a.30.1773418754606;
        Fri, 13 Mar 2026 09:19:14 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a07370353sm7854248b3a.51.2026.03.13.09.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 09:19:14 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 21:49:01 +0530
Subject: [PATCH v1] spi: geni-qcom: Check DMA interrupts early in ISR
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-spi-geni-qcom-fix-dma-irq-handling-v1-1-0bd122589e02@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPQ4tGkC/x2NwQqDMBAFf0X27IJRU0t/RXoIySY+qFETkIL47
 116HBhmLqpSIJVezUVFTlRsWcG0DfnF5SSMoEx91z+6wQxcd3CSDD78tnLEl8PqGOVg1cMHObG
 NTzdN1vroRtLQXkS9/2Sm09D7vn/C+F5ueAAAAA==
X-Change-ID: 20260313-spi-geni-qcom-fix-dma-irq-handling-5f8a7755cfa4
To: Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com, mukesh.savaliya@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com, praveen.talari@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773418751; l=2030;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=47dVlxcqtLyHWfjuM4XOj6jJY+YvtTXdu4uPiubzmSE=;
 b=WornenIXypo7nC34kmpHV0xuWJ8PaBPCNY3NNcJp1BTYz33OAc+a/O+QCSZfSlM8ZDYxWk820
 HlSa1/JG8mTCwLKq4gD9uRrJ/DjjLbJNUT2wl8iMIkXGc7cEM7Zm9P0
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-GUID: UXSLCwMtYg8uG1zqys4oE41tEKI8H2VD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEzMCBTYWx0ZWRfX/pq7wsubquSt
 Df8lIJOORQmx3vdcE+8IN4XSTkXwvF4WWI9HvqeRo6MEm/MUqM0KK/DTSUTtn97pkJOVSNURIt6
 MFAt433oPdfvL9LVPrGOuoc0byzfIksi0Ei/7lWyKyKXSjAaz+6QAWFXh3kPKTzVSagvk46kw2O
 1vfWvwoOMfRHnxmvxB6AOuNkrX2XbMQzDMqU94hGd/1T+K3vFnIYA2317iLI1A7Y7zmdcxBa87x
 KJsLvSZ2N0eyRaRdXhgFzAzTIxHouHwHGG08siaF/6coFgG3zjtqfoIQPxdnpDbWawFBbncRMdi
 aGEBWtvf3uM7nBvWKYJheix9MofpF63PFQcY0wH3txjSiafgilmNm/ucpZDfw0m7mPRSIvgLWWo
 QfQFIqTeN3IHA5Ff8ebTPV4Wul2yXUmkasVwQJ7qpwSP1BhrAFTpAeUxNTaLC6v2EAp3I7+cK+V
 r+b/KXb8esJWZ87XdkA==
X-Authority-Analysis: v=2.4 cv=X5Ff6WTe c=1 sm=1 tr=0 ts=69b43904 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=MfWLccd_HkCxO6W5No8A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: UXSLCwMtYg8uG1zqys4oE41tEKI8H2VD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130130
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97581-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B7B08286DCC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The current interrupt handler only checks the GENI main IRQ status
(m_irq) before deciding to return IRQ_NONE. This can lead to spurious
IRQ_NONE returns when DMA interrupts are pending but m_irq is zero.

Move the DMA TX/RX status register reads to the beginning of the ISR,
right after reading m_irq. Update the early return condition to check
all three status registers (m_irq, dma_tx_status, dma_rx_status) before
returning IRQ_NONE.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/spi/spi-geni-qcom.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 43ce47f2454c..69d26e23628c 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -906,10 +906,13 @@ static irqreturn_t geni_spi_isr(int irq, void *data)
 	struct spi_controller *spi = data;
 	struct spi_geni_master *mas = spi_controller_get_devdata(spi);
 	struct geni_se *se = &mas->se;
-	u32 m_irq;
+	u32 m_irq, dma_tx_status, dma_rx_status;
 
 	m_irq = readl(se->base + SE_GENI_M_IRQ_STATUS);
-	if (!m_irq)
+	dma_tx_status = readl_relaxed(se->base + SE_DMA_TX_IRQ_STAT);
+	dma_rx_status = readl_relaxed(se->base + SE_DMA_RX_IRQ_STAT);
+
+	if (!m_irq && !dma_tx_status && !dma_rx_status)
 		return IRQ_NONE;
 
 	if (m_irq & (M_CMD_OVERRUN_EN | M_ILLEGAL_CMD_EN | M_CMD_FAILURE_EN |
@@ -957,8 +960,6 @@ static irqreturn_t geni_spi_isr(int irq, void *data)
 		}
 	} else if (mas->cur_xfer_mode == GENI_SE_DMA) {
 		const struct spi_transfer *xfer = mas->cur_xfer;
-		u32 dma_tx_status = readl_relaxed(se->base + SE_DMA_TX_IRQ_STAT);
-		u32 dma_rx_status = readl_relaxed(se->base + SE_DMA_RX_IRQ_STAT);
 
 		if (dma_tx_status)
 			writel(dma_tx_status, se->base + SE_DMA_TX_IRQ_CLR);

---
base-commit: 5c9e55fecf9365890c64f14761a80f9413a3b1d1
change-id: 20260313-spi-geni-qcom-fix-dma-irq-handling-5f8a7755cfa4

Best regards,
-- 
Praveen Talari <praveen.talari@oss.qualcomm.com>


