Return-Path: <linux-arm-msm+bounces-110149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Ev5ISN6GGo8kQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 19:23:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE0B5F5975
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 19:23:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC06F306BA96
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 17:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AB0828727D;
	Thu, 28 May 2026 17:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IKsDATQg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WNAiXosX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBEF3B4E8A
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 17:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779988707; cv=none; b=XPLMpYloupUjHlyi/fsNCBJOQgRakJMcd0qy5CTqmXl/mx3fEORtI6yX9VBscEd5WFae4NjQZ0mk6J8qVrcgF186GzbWrXA1Cf7HYCn2pWJ38K19pP7vKfDnIMat/ueRw26gw0dC3n9iGHMKDqfQpqa4Xmf2yce611MjmL9LsoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779988707; c=relaxed/simple;
	bh=KYjKvckY/VAl6XCtEiN8jjSXIWwmJfrlKKhhzB3/mOk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=m5FSqUV9yWMyuNeM5XIUNzbC3tOC6mRp9JK+7rEdz8qWcdymQOOAyxBNrjEK8sHNjDQpGrSHZ01GX+7Z1aSRpqrwVh/dok+m8GNXz8Olgwlh5Y4eJcTyvqrA+MxrdKWm8Vyw3cRDrGsofJTFjo9BPCwqL2yXcr0Ec2gmNupqwEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IKsDATQg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WNAiXosX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vRiu2793722
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 17:18:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=861lfeuRlAbmY/H78CLEEr
	qRlCIH8BpNiqVeOaDNe7w=; b=IKsDATQgdKfOLF2p64CxsNb6cCr6SLakMEWPKP
	pTdtcdmevPWwHUyO9/VbXbF3wV03MpVMEa3KZmTlFTgM5yQMgZ248p4QtABfaXcg
	RNLMM7qNBRSL2Im9f/ds+qON6xLNyZxzK0+FKS6PtFgi/bTqLV6AMGsFhSAtZNaK
	ugwfdW/9K3iuK8UCLEZbfJDRP1XeUfOJNmD0L+qPDjrTYORSYPz1rUuM4OAf3qH2
	VZsygK7S4v2DBfnXw2ODHwJltO0YtMCHYwqSkWF3vh57zm3nYCV09WPp0zU/Vfar
	VJlodIDbycF1wQJLmayDQpObLnNr/nrHVVLZgvVhElS7Em6g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7y1uw1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 17:18:25 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-369467ab5bfso11192877a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 10:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779988704; x=1780593504; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=861lfeuRlAbmY/H78CLEErqRlCIH8BpNiqVeOaDNe7w=;
        b=WNAiXosXnSVx5XpdnPEOy+hjfrWogNYPPEzfQq0AkPuYweldn0qRWgH99vtULOTZ67
         TON/oH3e6mDV9OZ8yDAYO14hNYv0fdUpsLk+FIVzpe8jtW7nFwJf36KvU5RHfmw6RwuD
         qkaLgFAdldmexVOhwgjMJiQ2+I1YJQ89Tps3pu187ko3EWpme7hthhLJcPVRewfi6y/3
         JnnVbDu9h9u1zlRbMnjOhmt4r3rFjO6VzXULHeX0MyUPbVf/dwXjm92C7DTNmH6LJuWu
         C10tIZSWTe7IqGDMxM5M6s8y1aNuVPMhaTSWcYSD3NASGxUSxsgMHEP4WSS7kgBtnCIu
         hfJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779988704; x=1780593504;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=861lfeuRlAbmY/H78CLEErqRlCIH8BpNiqVeOaDNe7w=;
        b=APVFZa+uaf2QJ/CrQHe6UxLkeVwfhf+tW9LPNVnWMaN94zqG11vbDXi/FcKmpbMXmj
         vOwz1yEUxiY5op5+T+NYfu21rkiqxhFAk+8szoXDFYombjfjZAruOI5WqHRn5Fng7Ngi
         kjRNlCNypxDNpAsB8WKDyfStS0MNuAFBcXNjJ56zrb7SaCgxpotXZ4RPEeCBv1e8LzAI
         z1QT5t2ZvQN2ppB3bN1OXHmiKdO3dMuqVs4K0ejzGKvp+s6kUkILhJAeaAijbNMe9FjB
         noRUdpOEsW/kym0XJ/h76ElSBZFY3fxw6NVrWj/Vu3KEssvnibx7ihFRUzAxFEHZAKUa
         NSmA==
X-Gm-Message-State: AOJu0YxDt+KNRTZUQ6UjTnSnh44tyxJOztfFQ+zYHoQEXDLTzGq0+WUQ
	C45WXOIgk+Gxd4uL+FSL9kemR54tdFo47Eyfvt2+S1RtuNWqsf51ex3n5ZNZToD8rZnlgdeliO+
	s4bTTO8HdBftJfYX0U3ZeM+4Q8Sbj27zW1hNgQqK3YvED0M9VMNKpUJuN1zXPupX9WrzeAuuJWW
	mH
X-Gm-Gg: Acq92OHbkAdKjhe6/rLVu1cIx2eK+WoCE6N7BR3KldxpHeeUFkWuw9Qq+lIfS0LF7Nd
	6g/3rtPZvw1JtUGGOgFl0bfR0lhk8PadaCpZyGnZoGi91E15GQlC+Ou5Sipl6E6BigM4LdB6qZh
	/UQ/PoMkLLBlcnLjPtdJ9GApo1YlUw9NRN/pyB1Uz2om0OoLtmdOnLaBwzKvzxxxLa+xx/s/4Er
	iLI/fHLIwBiHgc3LsRddthBfflOSwXFByGPVBVNsbe8qx9oVt9MAb9QV6si2beBdmnHiBbmiVAf
	4aASTBbxOyNr/PYTQrhL+fMGpn1r9AQfYyWAKOmxUWOMQ48o+n/Dpw6OB9TETlUwHXmgNsN4r6+
	M0Dumjj9YkAh+eGgHmpjaREWY/0C9yfg/LEcmucIFtzFsFAGN3ao8BZsVUHOfVtQRhmCG
X-Received: by 2002:a17:90b:5343:b0:368:a27f:9083 with SMTP id 98e67ed59e1d1-36a67761c51mr25386493a91.7.1779988704066;
        Thu, 28 May 2026 10:18:24 -0700 (PDT)
X-Received: by 2002:a17:90b:5343:b0:368:a27f:9083 with SMTP id 98e67ed59e1d1-36a67761c51mr25386462a91.7.1779988703499;
        Thu, 28 May 2026 10:18:23 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36b90c03314sm2500410a91.14.2026.05.28.10.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 10:18:22 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Thu, 28 May 2026 22:48:07 +0530
Subject: [PATCH v2] serial: qcom_geni: Fix RX DMA stall when
 SE_DMA_RX_LEN_IN is zero
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-serial-rx-0-byte-fix-v2-1-b4195cfe342f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAM94GGoC/4WNQQ6CMBBFr0K6dkipCpWV9zAsYBikBqh2gEAId
 7fFA7iZ5E3e/38TTM4QizzahKPZsLGDB3WKBLbl8CQwtWehpErlVWkIftmBW0BCtY4EjVmA8FZ
 LjQ1lmoSPvh3591H7KH7MU/UiHENXMFrDo3XrsTsnwfszMSeQQI0X0lmK2TnVd8scf6ayQ9v3s
 T+i2Pf9C1vJtkzRAAAA
X-Change-ID: 20260528-serial-rx-0-byte-fix-ec9d08cfe78e
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, stable@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779988699; l=2081;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=KYjKvckY/VAl6XCtEiN8jjSXIWwmJfrlKKhhzB3/mOk=;
 b=aTPBsPo1CPjLI0wCQbsFX1lYscFAfml4I823i+RA/CpTzZFoKJFg+kGzqK2JqJGlkDA2VYfix
 Eqa75SLa32SCdSfwiik59LX3RqL/iCTpYVeJoBymFfdHiMRRPq3rvIj
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Authority-Analysis: v=2.4 cv=DsNmPm/+ c=1 sm=1 tr=0 ts=6a1878e1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=tI4oF7B6g8YmWx8mlzIA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: JTDSK7JFRjR9b41ZNLWxRaMEY7ltEXp9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDE3NCBTYWx0ZWRfX4TDUkJcdoBq3
 PqHTBvScbUleQN1wkRHi5XeilQXq3nywitxr7DDS2Uyk+h7TZ+7gn1YHo9MshBRprmBnkC8VT39
 DUp7hPg1BQts6XCaTK6O2NQ0tJt8XheyQXMg5CJpw99K0EmYcQQAaPtGRLvIDQRV60wvzNXuP+K
 7/6aR75KrXCkotoRuIzEMoy+h0CLLT51hUIbgW06I8PfdWfqWtM+98+yT/Vw5SLyZSidLj9mQSt
 EXVb6SpXq69FzJ/t8t1G8bQ15JwemegRR4W2EYSGIdyD1BRWxbv0sgtCKp34FFc5JLx8+AJnT78
 HBpKyBBDMo8CZfUtjIwifLSSWtHed5PBCASXA6/Uw/S3kXmGf64qn7jtYqNT16ndZAithgAqrVM
 e4Tlav3enlzxjTQWbrnQN4iBjlXgGpdjIhxtugJXzm/qmHbucrZnWdkmoTBG8Gy1bGuAOoyOg0V
 bCtS7fgbmBkf4SQ7+aw==
X-Proofpoint-GUID: JTDSK7JFRjR9b41ZNLWxRaMEY7ltEXp9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605280174
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-110149-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0DE0B5F5975
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In qcom_geni_serial_handle_rx_dma(), geni_se_rx_dma_unprep() clears
port->rx_dma_addr before SE_DMA_RX_LEN_IN is read. If the register is zero,
for example when the RX stale counter fires on an idle line, the handler
returns without calling geni_se_rx_dma_prep().

The next RX DMA interrupt then hits the !port->rx_dma_addr guard and
returns immediately, so the RX DMA buffer is never rearmed and later input
is lost.

Keep the handler on the rearm path when rx_in is zero. Warn about the
unexpected zero-length DMA completion, skip received-data handling, and
always call geni_se_rx_dma_prep().

Fixes: 2aaa43c70778 ("tty: serial: qcom-geni-serial: add support for serial engine DMA")
Cc: stable@vger.kernel.org
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
Changes in v2:
- Add Cc: stable@vger.kernel.org tag (missed in v1) 
- Link to v1: https://patch.msgid.link/20260528-serial-rx-0-byte-fix-v1-1-dc4e876c7368@oss.qualcomm.com
---
 drivers/tty/serial/qcom_geni_serial.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index d81b539cff7f..7ead87b4eb65 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -905,12 +905,9 @@ static void qcom_geni_serial_handle_rx_dma(struct uart_port *uport, bool drop)
 	port->rx_dma_addr = 0;
 
 	rx_in = readl(uport->membase + SE_DMA_RX_LEN_IN);
-	if (!rx_in) {
-		dev_warn(uport->dev, "serial engine reports 0 RX bytes in!\n");
-		return;
-	}
-
-	if (!drop)
+	if (!rx_in)
+		dev_warn_ratelimited(uport->dev, "serial engine reports 0 RX bytes in!\n");
+	else if (!drop)
 		handle_rx_uart(uport, rx_in);
 
 	ret = geni_se_rx_dma_prep(&port->se, port->rx_buf,

---
base-commit: e7d700e14934e68f86338c5610cf2ae76798b663
change-id: 20260528-serial-rx-0-byte-fix-ec9d08cfe78e

Best regards,
--  
Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>


