Return-Path: <linux-arm-msm+bounces-113809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0DHNJb1qNGphXgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 00:01:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FFB6A2D9F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 00:01:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZfWCmvg8;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FQUs1u+m;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113809-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113809-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A61EA305EF2F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 22:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10594325491;
	Thu, 18 Jun 2026 22:00:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E13828641E
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 22:00:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781820046; cv=none; b=VH1Qjyj5iyUOPgYuQlyy27aoFyxPFWNMXOazt4/sTzqhiSI8xXtLxQ03QGlPFy3vJvib7uWr3d2OEGtxdix/sA3D0g/OXKYo2bgK+WIZg2SV/rLjdkxOyBJcslOot9+UDSzezxzOlXHk1SzaPhful8LH2wOF7GSyzUwIR729hdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781820046; c=relaxed/simple;
	bh=g/vNPd8VALc/K45pOjMR098nGh6TjliGmsMVyh6ua4k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QB3mxvPQ8CRFg7fAtNE08ofsJPkgamDlzvjFxjPCF7rwdRkkhtoB0kMQ35bIGjW30J/dCOpHoxQ1lotp7ox0tij4Hq8EROqcLRT6YniuCZc+ro6TzPArSm3uHklF4V8wXt3usqe7jkuziDRrZTSBc7rxtJB9DWaMsEpZf0lZjPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZfWCmvg8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FQUs1u+m; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ILsHwj2785458
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 22:00:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6QseTlbfAn880N8txRVuUBddykUypUNSw2k1D7pjirE=; b=ZfWCmvg8jkBdBYAF
	TJ6wQ0vCqkfsWQN6TQ9/AQ2dEHQP18zIs63hywJjQ/8c/4G+uLH19a7DwNjf1vYq
	vXcslKmoFIb2cILWMZy4Wr/v1pULOFX2S1jW6FQSc63ZIYJd7Dv7dJxlqGHHAVRP
	t5/o5YO8u4qalBuhUJhr28D7u2EheGMHmMash/rvoSeEM2DCv7Wtv39sPzyP+9yJ
	RGZSN8BKfTqYlxE4OxUB35n9gpvd27VggWYIXffdq8tZHLNd7va5x20868daH07U
	4F7qb70HxJNh2AHXdGksnFZwLsDPwIoLnINlFf98qStfoAdwLbN5gL83Aka231KA
	/LWbcA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evpyurk19-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 22:00:43 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-304f1820babso1894815eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 15:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781820043; x=1782424843; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6QseTlbfAn880N8txRVuUBddykUypUNSw2k1D7pjirE=;
        b=FQUs1u+m92VJlyQmPZBkcGIFI0QReIYRcTzbhwv1ixWPw+sd6fJTkfD+xFDXWkAytJ
         i55boBKnstuECm+9CsrpS4NuqxH8FifZQSfdBZOOnSz2OpOQG1JdVF0CHj6foSidG+Ix
         ebCexlpV7sNq8Cggr/ZaLf93DNDSBfHBeHWZzHmx15xENOlt5uH1vU7WY/QHTT/IH23z
         VpNMnrU9nMUt4eUcmMrbtOeYc5tWFN8fw9JaKC/2DekAfaMPw4ij8lef3TPXyuwiqrxv
         vbDImP8ICL8Vb+nNCTryhCWe1YgGpIeB+MbR6YbM71BJz16wtAhRBnb9QseDn/Pp5ZWx
         tAyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781820043; x=1782424843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6QseTlbfAn880N8txRVuUBddykUypUNSw2k1D7pjirE=;
        b=eB7Z4oyung+jGmZLaj1mk5wgVlWY8eadtwlf4mfys9qHECSvZ5AFAAeq0qb8FC+7eK
         sUo+IPfMWZl3avjoHichaO0+Bn24ytovVYAuYvTsotakigE+OGdljB1Mt8pEAl9xK9/M
         C5sx0uqRPkxGWrUkmAZRx6FqXkv2eIeGYfK69hNBkzxngwrtz3TBdDX5+Ln2R3ju0sPz
         q/42n/Y+Upxj1GRu+daqU/20ACrRUppGNvJge/QN26aTJKq6jcJ4bbqZgMswiQcn2od6
         Yh8ZM0GruwWi9V+F5HLaMSAAHylSssZ5vNQqgejRTi9PkEy2e/ZmrQRQag7i7h1g79gm
         cbxw==
X-Gm-Message-State: AOJu0Yyvh5G7G0BLpoHw+BeWlBH7ixOPjVfN2/FqgPGb1KH4YZy+fgRY
	xDRVvIt4UfGNRZxV0aC/6EozMwMIXUZsgsR2NRx1glU+vlnAlA26A+RsIxUBQnJjVdxbg1GjBk3
	38h0gXPEo5c2Jek4+Mg9XfBIhzHb2mMvBXvNVLuYav70aOJ0Zm/ehX4rJZERb/0F9sG7x
X-Gm-Gg: AfdE7cm4x7UPXqlnwQr9luUb8C38EzorY7opgCh3QoLiZpLWsj/hSrKdLC8p8k7vf4R
	945qmT/yIInfFtpgU1/ouSTRz5rZkmpxV8xtaiwCMEhLC1alHhl9p9X67frxcwf+X6rGOiE3CDj
	sALV0ISKM3Jb5cRMB67TBzjniARibQfAq7UcrvnfvaygpNfVTSJrY57nQxkcl0WmFxtgGzGqlpb
	6x2ZpaYn6YyAA4A7RWNit6g43v+nNZ1PG/M1DSLtNwtKij61g7U4BlZwxkh+OcEIC99n19U8iPJ
	OipxBOXsYnSkZWMsY2qTwMCPO7CYTKAeypwEhf/ZmFwJlqysmxGHi/8F9EnkMQ882AbjbZ7ZL0P
	SbUQ4mPdACXePNBYsFq5O50+O8prGcyEksCfv55hrM7FOXCh4
X-Received: by 2002:a05:7301:3d17:b0:30b:c83b:f56b with SMTP id 5a478bee46e88-30c06d86996mr991569eec.14.1781820042465;
        Thu, 18 Jun 2026 15:00:42 -0700 (PDT)
X-Received: by 2002:a05:7301:3d17:b0:30b:c83b:f56b with SMTP id 5a478bee46e88-30c06d86996mr991553eec.14.1781820041913;
        Thu, 18 Jun 2026 15:00:41 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c0670a1b4sm628436eec.8.2026.06.18.15.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 15:00:40 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 22:00:33 +0000
Subject: [PATCH v3 2/2] PCI: qcom: Add support for Hawi
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-hawi-pcie-v3-2-f31880bfb3ec@oss.qualcomm.com>
References: <20260618-hawi-pcie-v3-0-f31880bfb3ec@oss.qualcomm.com>
In-Reply-To: <20260618-hawi-pcie-v3-0-f31880bfb3ec@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781820038; l=919;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=g/vNPd8VALc/K45pOjMR098nGh6TjliGmsMVyh6ua4k=;
 b=QFphUkJzgyhApyoxYKg6ULID+IFcA3qYKhhuBq05YxGe+7cpgO56OE5WjVqHGu7U4O1BTGY8C
 VnBRywNLNRXAFyjVLN1pkdW3gHcXMCUcwiHb7ANmeQeMFUz2FTgAXcI
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDIwMCBTYWx0ZWRfX3uUUysRGepc6
 VmD8XNjdyDB5nJSjdEIdD6b7EQrFugwgR4duRLybouOgF5Hn8qEZk/YDvk1y140I5Z+MpMgJhDX
 uDHSP4aKik7dA9i2dT546RCVf19uFNM=
X-Proofpoint-GUID: ajC0i66_-sLX0f5Ha6RsLVtPyariQ-pU
X-Proofpoint-ORIG-GUID: ajC0i66_-sLX0f5Ha6RsLVtPyariQ-pU
X-Authority-Analysis: v=2.4 cv=cY3iaHDM c=1 sm=1 tr=0 ts=6a346a8b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=KdxOZhL9OB_EpBcCT-QA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDIwMCBTYWx0ZWRfX0fabl6gtR2E+
 +8Jjcfl1HC9l3JY0r5+7YGFJx2UCHW7zEP/B5VCJsN2JhvIVCo9Z/i3ozRJ9l1EqL3uxpD9du+I
 FCDR50NV0mO4M9HXw3asX3tSjL5kR4w/xIGS02vOIRoeIq0Y8fRWIV16DervQC1/i2+3x6rZMiL
 8OyHfZEIGwbVVu6Ee5a+d2UilHXem0eKe+mWU7X2EtP323g/RZz9Um5BdBfpmQT1zlFG0WFJo+K
 8d9EhhRLzn5ok3ZBBuKsvPC83OC8RFpO27Z+NZ5Xq/XglG3TxSaK7sxVN14ugVE1eIETkWnKkxh
 ux6DEvP6WjENYhJh7yu6osrOsOkKAZlKkXZi2vX4hxfD24QUmOrzNlMpcw15cmTcchpZok9MeT5
 gdXmNoXhJF6VcG15NAm2GzDYs84OmFfvGw0B1ygyKnGIcQP6CEYuJVIqZKew9a/+gNjHR1xT+Ve
 On/x+CPwQGvaUk3Aivw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_04,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180200
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113809-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:bhelgaas@google.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:matthew.leung@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E4FFB6A2D9F

Add support for the Hawi platform which has two PCIe controllers: one
capable of Gen3 x2 operation and one capable of Gen4 x1 operation.

Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index d8eb52857f69..89ae006fb6c3 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -2282,6 +2282,7 @@ static int qcom_pcie_resume_noirq(struct device *dev)
 }
 
 static const struct of_device_id qcom_pcie_match[] = {
+	{ .compatible = "qcom,hawi-pcie", .data = &cfg_1_9_0 },
 	{ .compatible = "qcom,pcie-apq8064", .data = &cfg_2_1_0 },
 	{ .compatible = "qcom,pcie-apq8084", .data = &cfg_1_0_0 },
 	{ .compatible = "qcom,pcie-ipq4019", .data = &cfg_2_4_0 },

-- 
2.34.1


