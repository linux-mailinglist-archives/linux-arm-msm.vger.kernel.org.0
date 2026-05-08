Return-Path: <linux-arm-msm+bounces-106562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCeSA1Y2/WmoYwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 03:03:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEAA4F08E3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 03:03:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 814E9303A536
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 01:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7699C21FF2A;
	Fri,  8 May 2026 01:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pFz7uV9V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hRGRVhrR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71601FBEA8
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 01:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778202155; cv=none; b=m+oTpJNp1+vojlY5RXuUbCa7rtGo8Cr7V7AyefmyOm+XnL2s+C65EZuU+tIG8XTa4HghI/9TjlKv5vm+f/WdtRGwRJ9Cwgn1A9XjgeYFADaCMyQfGWNrKavj9JIunpeD9kChP5wYRBx5qyfj/cEIjjIPWKCfcAd91EEix2yTygU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778202155; c=relaxed/simple;
	bh=xU+Bv3tJiX0J7E/44Be6i0aRXSQ1fn8WrrGJavKwxao=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ThwhCRTjh4SRFoKB/qNqZffGKwpIzcBDanOcNhAgv7tjh/6zlyJHYjcQVDU2y7T9skX689nrut/MmWLvgcM/ZIXl2mvaZpYl1KQhRKgPZ9qpGJ/EH/cdvFU9Bue9jhYLdfO/sh9zO/VoLiqMm4v5fkp1mNRi8CDPXSup5kjsTnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pFz7uV9V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hRGRVhrR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647I6Xf32734072
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 01:02:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rvDMQNPUZcPObGUF7IML45C27ER/61yELy/gJByeJd0=; b=pFz7uV9VTfcpNWZB
	/JGvhu/I5yFeAr/z8Xm9Js6NKwYKRICqlRSJiq0cCH9r5JdCwux4f6WDbMx5xuKC
	zX2BgJSwaeQ4EOpBXYTwtGBgquSXcHOS+fU3acmR/LMaOuRwUE8ffBw0BL1sPb+7
	0SWs/obK6FXWpBx5OYXDWj9mQMqQjytzMJpYRwmAxnQCn3alHBb0j5Ag3vBSt01J
	VODPPStPYroONIODnBdTPfDBL5VrXHQYy8Tu7pm3MIwB59cTTaSz00/gtXeRfBse
	7dV/+lzBbBNjrm/mlQ6W5IOpSSA+Tg0eFdc9BPtB/tu1k14VWoJ2Zze5ycz7kFgI
	if66wQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0tbqtpgf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 01:02:32 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2bdd327d970so928509eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 18:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778202151; x=1778806951; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rvDMQNPUZcPObGUF7IML45C27ER/61yELy/gJByeJd0=;
        b=hRGRVhrRxPANHbTwgcAONYljndYHlzm9JcpimxZT7s6Y/xvTDeTkxwUZhqcFT0NqWn
         SPn8zMfuvNHH67oxVdNR14t6k4gA22rgAtqSAkq1+jG1HzMkFwNcG82BPSyDeiAxpydX
         77qtg93oeiB4mT1gTvfV5NK753d0pKaT24LFQrERf4akm96FW8/Rq9dqd/ldu7EPel0G
         yKeYXP+Uk54aKE5FdqmvjzownsqmRdOEVnbMA1fbZx6h1UpGcOaTsLyorkg1yAMMM/h7
         NimofTMVpZT+YN0IeZ3wvR4JDFfGhsGPuDHT09d8cM1Gc6es5AHFOUx5a526P+gDWVBz
         F53w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778202151; x=1778806951;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rvDMQNPUZcPObGUF7IML45C27ER/61yELy/gJByeJd0=;
        b=KeT2lt6bZm7aJ9CQ423MET6dEAbDBMJX6dtdOjAkvOa2iJ9dMFnbYP1z6W5u4k15ga
         gyLm3l2D+g9SJbtanV5CKlZXuDNdzI0wTQ16smusSvB5JdYVhN46yhZn8yuQkxPOROOP
         E5F+mWPgBZz+FpoaZs6usfbokBRnaHcxKpyGUThfmtueR9Inmj01j5FmlulYM3t+PHSU
         k4/t3ZE4jOwhcRnkjt2AGl/s0dQ1b/AGkXgM63IVhtKTL/r8wk9znQ9ZUn/Nh/i3bsD4
         dkMbAKAMUYyBrO6cXp9Tzy+cYimBH6DHfcD8bMJZQ1ITbURnnUo1+PoqPvFmKcVGAza1
         BZSg==
X-Gm-Message-State: AOJu0YzEeby5gB4WuwU4P/wB/BxK8WQG+uQGwCCmxPZUdrqYgnXaEEjz
	ABFwaPdQc6CsQisSAbD/L/6OLnHdEzpJV9nNlpQWO8Bp1+xrFNk5sY13VsaNvq/foeiLJXObTgm
	aPhALNaMB8DOypkfY/xKUSuobsdPXuLDGeCisilIoOEpciL53sdfH2u9gv8xQsnVxgc+J
X-Gm-Gg: Acq92OH9hitJLl4u/ZOM8yaWJOtWMNnRJOl2upNPHop2VVJAcqDjyZPHZs3R3zz4oGV
	OfCzn6BjeBRsoz5xsFJQ6BGaWKkIIabJ19bnVcqthBrXRb1l7a78KcwtCBpoZ5N2f0s/TBFu5hC
	aNRM1UtSPoAEdFfmtve4sYOByVID/jcrvRRZgHZDUTL4LX2KkCQGtGtbrxLmp2DW8FiwWVBOlSN
	a1HcLFbI9FCnSVfUv33GfzEXQuNstiDFnrFA1L9TZ02tQsnadcBMt+fM3rm/VgITTOrsZnmE0vE
	Uc9GcdPmx+mkSnciApFkbnxmwBXNl5Vlx+tuXYj6cCz+fiIpXezwHlp+1jh/6eCN3I9nD+pQ8eE
	vsHrgwsC/4vEKziQoYwAvIyiQ3SW/bTWTBA5QGrp2FsZOtPcwfMs7/05CZMIDagii6WSsSg==
X-Received: by 2002:a05:7300:fd04:b0:2ef:e4:c912 with SMTP id 5a478bee46e88-2f6e29fc666mr2109250eec.9.1778202151215;
        Thu, 07 May 2026 18:02:31 -0700 (PDT)
X-Received: by 2002:a05:7300:fd04:b0:2ef:e4:c912 with SMTP id 5a478bee46e88-2f6e29fc666mr2109228eec.9.1778202150397;
        Thu, 07 May 2026 18:02:30 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888c469b6sm149809eec.24.2026.05.07.18.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 18:02:29 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Date: Fri, 08 May 2026 01:02:15 +0000
Subject: [PATCH 2/2] PCI: qcom: Add support for Hawi
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-hawi-pcie-v1-2-0c910906f7e5@oss.qualcomm.com>
References: <20260508-hawi-pcie-v1-0-0c910906f7e5@oss.qualcomm.com>
In-Reply-To: <20260508-hawi-pcie-v1-0-0c910906f7e5@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthew Leung <matthew.leung@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778202147; l=919;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=xU+Bv3tJiX0J7E/44Be6i0aRXSQ1fn8WrrGJavKwxao=;
 b=2Q7cIW449GSWVep8TbtvAQ51wF7b/ZmcjaY0HGYWRMjCD/uSEISkOzeSpBD4yrPEAzyFAucLH
 9QDDL6yYFQRDQRlnHWz3U//B8IuBxCdG9msOX8952CES54cFUMTzz9s
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Proofpoint-ORIG-GUID: ODCi67X145VX5azuJrApGNJYFDHZB0p9
X-Authority-Analysis: v=2.4 cv=SJVykuvH c=1 sm=1 tr=0 ts=69fd3628 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=KdxOZhL9OB_EpBcCT-QA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: ODCi67X145VX5azuJrApGNJYFDHZB0p9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDAwNyBTYWx0ZWRfX2vY6ebkD6esE
 6Umdr/qZbDYqMMzGEN5+5xzl8yRL0z9Oy0KAV+/3668yeoQ/L+Vjb/PLvA+TtrKa05Yx0f4SsE8
 3h+2REcsqkl4yqun2CqEy+4QQ8gokuxFEIjMzu020EgYQSsfI//UH+FU27Xo3v7sjM9aPrAnFdf
 Pl9K6Won+5v6/M7Oi3bkkTh8sMPhAMfjNZreh+O/306uuZGqXVpkfhDuwV5++uiqWXvPE8fjHoJ
 J+5Vz9I+EA5EhTJ7fuwkNc67QJV0aWDWvPdSqa+DDIfD1/s/lnNzoiJMX7urkMPcZttyVIHnvHs
 CVxc0Cwat1MUiE0AXamoGftPF4jbMCAt9hXszRr77CUH/KerFSEsbDyO1Xw0usaMUQc684mTEhU
 xTYcFLAt9dIBxYypPCDOj2xWD7NngTyw3M/eQmXSk68Bkp/egviRZvX1CY9hxjqvH9aE2zQTUps
 vHaZh8tYAI2S25RkglQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080007
X-Rspamd-Queue-Id: 6DEAA4F08E3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106562-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add support for the Hawi platform which has two PCIe controllers: one
capable of Gen3 x2 operation and one capable of Gen4 x1 operation.

Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index af6bf5cce65b..80a238aa26b6 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -2121,6 +2121,7 @@ static int qcom_pcie_resume_noirq(struct device *dev)
 }
 
 static const struct of_device_id qcom_pcie_match[] = {
+	{ .compatible = "qcom,hawi-pcie", .data = &cfg_1_9_0 },
 	{ .compatible = "qcom,pcie-apq8064", .data = &cfg_2_1_0 },
 	{ .compatible = "qcom,pcie-apq8084", .data = &cfg_1_0_0 },
 	{ .compatible = "qcom,pcie-ipq4019", .data = &cfg_2_4_0 },

-- 
2.34.1


