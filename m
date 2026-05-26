Return-Path: <linux-arm-msm+bounces-109797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JqVHuCEFWoSWQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 13:32:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CC85D4E6E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 13:32:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D87C4300405D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 11:32:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D82EC3E0734;
	Tue, 26 May 2026 11:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QnbNzXE9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X7KwX2yv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819523A7F5E
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 11:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779795162; cv=none; b=gatQLaRFb/BQaVwx2RJDgaJljWnySxitSTK/MTihv88DKhu6iN1oVUmBIKgZ5wX9PBd64P9+Xfh48K+2PcC9XSYq4C9ZX+cZeAdvdqaqQavKjXhjY9LOEjMIZ0ZBEUku3OXeO2QDhLbCge22A4NrLpUyFOPF79LJ36JshdZ+y+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779795162; c=relaxed/simple;
	bh=sL90+oFBg4fpOkodMm1L902AyGzLN79lb95zijStvqI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=B+fV3sBXfCrVAIChnhJUmAumLo4ZFzkDVzJ5/HZCj0mc5X3nyy3VZzDjezEW2/4fDJ3joBEnuArTwXza+gIuHZO977fLd6E5weV/ddiHiIdN4uRtxMo/uq3LL0yeH7IkKfmVtzB4L58LuteX+6vQfu/Wm17xds7TloaanM+UIrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QnbNzXE9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X7KwX2yv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q8x7JH2823127
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 11:32:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=iFvWnFuFpHGA5DuREJpxWS
	+xk7m8VENTxMWCnWvwfNU=; b=QnbNzXE9kdKgQpF9OSuhkm/74VAUQO857B5NVC
	lUuHrkiIKlI8Q6y9iTHn1NNFewrwO+dl1gSiFvYdYjZqyVB3dLNixoMdh3t+07Mz
	d1kQDF/JVv2qxJzdpw8depaiTk+/BdbZrCdlDSKxuoJ9QNST4lRz9k5s4dNLG/bq
	ri6aBySBdINUjAB78YNSx/twx5krjjYW1yZJO/dPrumUbVAfdN7rVnLol1vPo0a2
	SswUJp+dH5Ilurxiu2w+j7i5I0UqyXDT8ptVs7sYtD8oKFGIHYVTE8C42umOI2Gv
	uxsFCLfiVKOPAufIU0QPwX8ipz5On02rdmNGl5NhTWBI/VXw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqvwujad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 11:32:40 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ba718173d1so38775635ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 04:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779795160; x=1780399960; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iFvWnFuFpHGA5DuREJpxWS+xk7m8VENTxMWCnWvwfNU=;
        b=X7KwX2yvhkFMZcSRV+IR7T2cSNJ6d58vrR3oZlnjJavQj1nt3QBpMgJYjC61+WDlzr
         vCHiwNHrHJ+OB7s4xFg19olJ4fJl4gZ1Sw+qazzKxd0vnM+3iAgFEu9PE1QjNo7KR6WE
         HmyLxEc3kQ42qDYnvLm7s92xdTrJLXFrBHUCmJbHYorL5fU2YKehEUUH8zRiHvm5dQll
         6mZ7n9zR+Lg232FFUn6KwBJReTFWf7ekTQ1H8NpoqnDgNPu5fpN9wP0io1FxQLAvnYVO
         VVWMJbXG6BPSQVo2YRcG7UXx8uN+G1Rxs5Jd0/KS3xTDj3wxGNf94t07ES6+RzEewTro
         hvwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779795160; x=1780399960;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iFvWnFuFpHGA5DuREJpxWS+xk7m8VENTxMWCnWvwfNU=;
        b=hPcrSk5C8Iywyj8YvOLRK6fpvErQzRgrThXiBigwkByLKt7M+vRc6X4XY5KWpWJFvC
         OihAe/CxjOA9mCxX8wE0H/ZQJTZo6AmqEiVaUMieVcnAtfH8AyqsDyeuDpzstZg5UZEK
         QLrRALnZlasDqk848bNuaH7TDUNMBOY6rzLP9thjpKmc7fKz7Jvmm0kYkTCVsD/AKqlT
         F3K8gvAqrd/+gWoytHV0v7rmsMuep6sUWvV4D2GJBKYrZ6jamkt6dMpaUpeoHKIVlMzT
         pkw2gHJyKhCkm0rrctHBxgJFcGf6Nh1FTZkSmH7d+xala6jjts4lFT58DYLIjwp4tmfQ
         PNVA==
X-Forwarded-Encrypted: i=1; AFNElJ/A9PrTBbpkgEDUK2t3vKe58cvEToKvBQNAKZM9alDvdduyaYfLFXfyMhIjRgi4pbVVQUxXTpiE19Owbv6g@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7pqhMJwSwF/hMBZBmFmHZ7DG1ZOCTl/6R7xNztsSWAOTzPHIG
	UPfGjxhwJKq2POAMiQ8uHJQy5CuHALVneWkT/Q25ZfyhtmUvnJRt1F0GZpo0KVipdla9gkKLA9b
	mtCHzT2U1W2kSznhr8yCsWbej1St7iv7Bm078gq5r+3JIfzO1A0+3qG0ittsGaJZNQreX
X-Gm-Gg: Acq92OEHe1uyqU0h1P8s8ky4uR9YqtQxlmLr4X3okQAYDYg6UceBYMN3YgKVyWzd/tC
	nC9EnoV+LfHXTJ3JufTdisk2Y7XMVNl39/fTjjAUs8DQ+R4g2jPEuVVPlqmlZQiTqtxMo+nv5kV
	ZpcedkT9CCFr9UvLS0LGkzF6RU1XVXluCbOWGz67QNqVHS1P061NLFrZ25ItTm4WcLxwtu4lUtN
	YrRkZHCnBbfyw97l0Pg5STs1YRv67Ar5YJx4zAbF+h+PeWS3Ilsg5nIP+whUoN42wgdCqfDPhWh
	2kYHXKcLO2lCUblJdVYs5KWFSWxjycT+wg/gr4+n9LhFC3sNn8aSgm4p6b2zOP8Jp+tf5YhL9Ur
	SRRKPqOXlZzX7alaYJER5SQUtyTXn8AMNtf+AVIwL8kMJj18Wlos1h2rLxWxubMx5kRyVzLX/Gd
	X/Op3x8KbXiA+4xV8E+3SxbLOlp3fzCXuiVxO/nQn99RoLoi33tyhfouGb
X-Received: by 2002:a17:903:24f:b0:2ba:4e84:966 with SMTP id d9443c01a7336-2beb06dc34dmr208466785ad.36.1779795160181;
        Tue, 26 May 2026 04:32:40 -0700 (PDT)
X-Received: by 2002:a17:903:24f:b0:2ba:4e84:966 with SMTP id d9443c01a7336-2beb06dc34dmr208466435ad.36.1779795159593;
        Tue, 26 May 2026 04:32:39 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b386esm128432695ad.44.2026.05.26.04.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 04:32:39 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 26 May 2026 17:02:30 +0530
Subject: [PATCH] PCI: qcom: avoid duplicate PERST# GPIO acquisition in
 legacy path
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-fix_perst_gpio_handling-v1-1-9170507bb4e9@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAM2EFWoC/yWMUQrCMBAFr1L220BdjKhXEQm1eYkrkoZsFaH07
 q76OTAzCymaQOnULdTwEpWpGGw3HY23oWQ4icbEPe97z94leYeKpnPIVaZgTnxIyc4PuwQcmQ8
 pktW1wdTf+Xz5sz6vd4zzd0fr+gGaaopKewAAAA==
X-Change-ID: 20260525-fix_perst_gpio_handling-5a4fee9228fd
To: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: 6tYJn0jQbfrX-_7mDmYuJzaGhMpFcGSQ
X-Proofpoint-GUID: 6tYJn0jQbfrX-_7mDmYuJzaGhMpFcGSQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDEwMCBTYWx0ZWRfXz+3jM3JnZtyQ
 F0Uns0xAWny8xq0hjcp7dlHePAz6x+t8udFtpLFwq2ecfRXVGptxvBOxWkfRi6rxI3CiTn52nlV
 p9kNI8TF3aDWnrGuRhlqzRjLB1fWHblPT4JCWh4Hd6Y05QHhqZv6LV8Ji8gzs7lW2jJaTgGepaU
 bqzJGnuzDZMaafqiU4AJJUk8UEznGf9U3kDsHukoNWi7mvw08+RfNowQvXqM57B7MOJbnKYf5aG
 bX8GEtaYVeVcFh/c/1jOpHgKbZnMunBtmYTc9SxUQ96mwhMOhGt84NEhrCerbpsbRTWhTv/e8z2
 GpUwdvV1ZKLS5x8HhZBvs3AUHyCstTxHnnCcbeBT36tRPfjBjZKX8NkAa+PFVbiYlGd4bkGToQs
 0uFfyl4GVPLwc37Gv69sShb/JjHa590E3wTd5nQaa7lKFW4PQxhYuzsTFHuPGUhU5F6+iJnBHK8
 HOFGfIf7nek+NZyyhwA==
X-Authority-Analysis: v=2.4 cv=M4l97Sws c=1 sm=1 tr=0 ts=6a1584d8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=mtmqCDNuwk6juwfAGToA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260100
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-109797-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 78CC85D4E6E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Commit deed8aec62dc ("PCI: qcom: Handle mixed PERST#/PHY DT
configuration") handles the case where the PHY is moved to the Root
Port node while PERST# remains in the RC node by acquiring the PERST#
GPIO during Root Port parsing.

However, on platforms such as IPQ5424, both PERST# and PHY are
described under the RC node and are intended to be handled via the
legacy binding path. Since PERST# is already acquired during Root Port
parsing, attempting to acquire it again in the legacy path fails,
resulting in probe failures as shown below:

[    1.571859] qcom-pcie 18000000.pcie: probe with driver qcom-pcie failed with error -16
[    1.571909] qcom-pcie 10000000.pcie: probe with driver qcom-pcie failed with error -16
[    1.571973] qcom-pcie 20000000.pcie: probe with driver qcom-pcie failed with error -16

Fix this by removing the redundant GPIO acquisition from
qcom_pcie_parse_legacy_binding() and reusing the PERST# descriptor
obtained in qcom_pcie_parse_ports().

While at it, move the warning message to qcom_pcie_parse_perst() to
avoid polluting dmesg when the legacy binding is used.

Fixes: deed8aec62dc ("PCI: qcom: Handle mixed PERST#/PHY DT configuration")
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 11fc60489892..77cbd204ac5c 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1824,6 +1824,7 @@ static int qcom_pcie_parse_perst(struct qcom_pcie *pcie,
 	int ret;
 
 	if (pcie->reset) {
+		dev_warn(dev, "Reusing PERST# from Root Complex node. DT needs to be fixed!\n");
 		reset = pcie->reset;
 		goto skip_perst_parsing;
 	}
@@ -1912,8 +1913,6 @@ static int qcom_pcie_parse_ports(struct qcom_pcie *pcie)
 						      GPIOD_OUT_HIGH);
 		if (IS_ERR(pcie->reset))
 			return PTR_ERR(pcie->reset);
-
-		dev_warn(dev, "Reusing PERST# from Root Complex node. DT needs to be fixed!\n");
 	}
 
 	for_each_available_child_of_node_scoped(dev->of_node, of_port) {
@@ -1942,7 +1941,6 @@ static int qcom_pcie_parse_legacy_binding(struct qcom_pcie *pcie)
 	struct device *dev = pcie->pci->dev;
 	struct qcom_pcie_perst *perst;
 	struct qcom_pcie_port *port;
-	struct gpio_desc *reset;
 	struct phy *phy;
 	int ret;
 
@@ -1950,10 +1948,6 @@ static int qcom_pcie_parse_legacy_binding(struct qcom_pcie *pcie)
 	if (IS_ERR(phy))
 		return PTR_ERR(phy);
 
-	reset = devm_gpiod_get_optional(dev, "perst", GPIOD_OUT_HIGH);
-	if (IS_ERR(reset))
-		return PTR_ERR(reset);
-
 	ret = phy_init(phy);
 	if (ret)
 		return ret;
@@ -1970,7 +1964,7 @@ static int qcom_pcie_parse_legacy_binding(struct qcom_pcie *pcie)
 	INIT_LIST_HEAD(&port->list);
 	list_add_tail(&port->list, &pcie->ports);
 
-	perst->desc = reset;
+	perst->desc = pcie->reset;
 	INIT_LIST_HEAD(&port->perst);
 	INIT_LIST_HEAD(&perst->list);
 	list_add_tail(&perst->list, &port->perst);

---
base-commit: d387b06f7c15b4639244ad66b4b0900c6a02b430
change-id: 20260525-fix_perst_gpio_handling-5a4fee9228fd

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


