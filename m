Return-Path: <linux-arm-msm+bounces-111144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mUshAnoiIWr+/QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 09:00:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A7863D6FB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 09:00:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ke3SEQaf;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Z8mGexmo;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111144-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111144-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 881F83067F15
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 06:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FD9C3D890D;
	Thu,  4 Jun 2026 06:51:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C0E3D88F2
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 06:51:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780555875; cv=none; b=Xwnaqj0HlPkpjreXFjvtPnYOB9ruH9gWOaq7wmNOM1Akgf6C06MBczWrKTCx2TXect8YWC1n4RnB0jKo8g4dH2E9KAkLcuZms5pGRE2bw4P8h0yefk4RC443DR5EBNJs5ETzCS+oEpTuIREF5f4d/U9clqhOZM65Jn4Ot46eyFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780555875; c=relaxed/simple;
	bh=W/YrZ50I3AwtE19t9pzTiT0xdnQWey3D03tHPf2lno4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NeLIJ+6hvOC6olMucMPnbQV5ESmq99Rpt0xer/PDdL60e8i5UZGEbwfQaaQnUQTjjq6A/UuNpv7uVcB+cWeFwlwkb2vzIvsMaYe8f6d6coYikovYNpB8Ku6r8Kgs1kp2+Xhbk5im4n/9VhrMHKUGVIvhgXUYBp/blJI0hFBEoQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ke3SEQaf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z8mGexmo; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653NXcWs1476538
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 06:51:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XB9Q6X09k8YWO7HfZ3onZiDHCRdqw6sxvgxO5l7nA8k=; b=ke3SEQafDKF7RYnn
	JVGnr9etkTU2DWxdrm2M+kwdDvGEJVI9FkAomUPZIZEA4Q9RBDiy1ZZ/nVfHUzZc
	/+rI5xSC18EphqQSZ3ykNU9gpAm2sic9ke/X9OIrej0X7f1LalJhwBdZfosZ0xSW
	6DOwzQAH4VoRiPqUsnGuIoYEjDpg5GMtL5mQfy5ydPCRJ5aQ9Cv7B1DIG8jRoD6N
	p6WqfBmUwOlP1wg+xE2nWGHkMah9jStpI7i41yUkICiD9lwJt3iCvXR7xnlLt3EH
	q2OsMnzafF0lcb/o05yGhm4reO5Z9BQFOa/xDKNjl4SbPUAEUbNdZ4vGT8Mr5Vdh
	l/sydw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejp6nudd1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 06:51:13 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8599ebec31so472316a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 23:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780555873; x=1781160673; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XB9Q6X09k8YWO7HfZ3onZiDHCRdqw6sxvgxO5l7nA8k=;
        b=Z8mGexmonM719btMsu8bz8mTmiZ8IWlWRjgO8NUzuQQC5hOGaq9G6likxMyhx1VZAb
         sNifCr7bxkgj606TWKvBKiz3DEM/6LDMqWugAib8E8Y8njk90RZkSOEO0rwPNTxgWYty
         /pnoDzV8zR332yXwa21F6ZwrQd1Yncfibda37CAR99u7PP8RbcdAE8NBCWrcsdslX/td
         1dEQIma19ZOzBxuGc0hd6x8q/CckbFzex/dMgvl2oPbNIeY66Zn1Oru13uPwBDCQQ5Ps
         MN0jN49wZRXspN5EoLsOiOAAPm7L3W/GGXHKV0ll67JPdC7+MXD5zEUArRah+e7IBaBL
         Jftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780555873; x=1781160673;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XB9Q6X09k8YWO7HfZ3onZiDHCRdqw6sxvgxO5l7nA8k=;
        b=cvEck4Qfgy9S50IkFRKLKR3opcCvJrgvVzYU7xShzhebAaPLIEyGVLTBJu/g6MpvWk
         SgjjQSKu2nxMNkz3GTsxt6Ow1kC92xZ5lCBSX0rvYiTot7Czt7wYy+6cPKGlHgvtu37d
         L8TxrnujOo3oavwdo6QHxDGHTbU79vXH1dn0nRs/+F4qAWak9YS6narTyUk5gnfwkT1x
         n1rCeXxU1ARPN2zpUm7r6PIm8viqGLZByWVST+zKKUwWezoP8QZ6+zm0slCS+2ovaJ9M
         zepdp5HqnW+5iC5jnW+SKlMbeg5r2NOE0i1tcaLinhsRz82ZYzPvN2NbiPPOY9IJbof6
         Hhvg==
X-Gm-Message-State: AOJu0Yy4qpZn+KXnCrzIEcWXULCJCTd0holbLAwPQvrqrpk9GHrUWprW
	44rb7NSnDwoZbO/ByrKezBhmGcHt03VGyhwlQ0q9RxPyfDZEyTdYLE4pXWr3jJLcw1jxKTUshaE
	qHK3qG+VTQcWmTUvA6WeJSzT2dTIg99msqaptNcp5VXWkwsSgjiP1BVeMEGJMavTbotUyBooof4
	Yf
X-Gm-Gg: Acq92OH3ANnKAPSQAPT74cZ8dnYqY1oY6ANApbOwE+66NjE3qAikrBvEYRY7epV1KSA
	vot6DoNiZCbomVVlx0U+Oludj8A8XZBTJOQ0bO+EjBSjjN/g8YPeOuo7ghNuYX2GHDzkEnBDCjK
	UpJxwWtewTVdCevNbsspcLAmwMk2GSuDwr0PteVKdGdJmjVrsVG9vz7vCuWwmazYbxh6bNySGMi
	LYqpJw1574HucEskE//LtjnZLyCQkkIA46LomNV7d7BXcjGLnpXP0yjdDEuhWtxiztark0M+Yb5
	UyuX3WMFOMO7a6GT6s0e49e8LvaWMEA6hTmoMkdMwY8YlznA+uvz7Nxjyg+7ymtx/XrsM6AztTs
	++JPIcoVCBiQgAQ9+uzhKhrHCOnJ+61uwnQOBykzxGMChIrBYZWjs4+NTcCEO77ie/w==
X-Received: by 2002:a05:6a00:218c:b0:842:65c1:468c with SMTP id d2e1a72fcca58-84284dcf4dbmr6811671b3a.7.1780555872853;
        Wed, 03 Jun 2026 23:51:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:218c:b0:842:65c1:468c with SMTP id d2e1a72fcca58-84284dcf4dbmr6811635b3a.7.1780555872344;
        Wed, 03 Jun 2026 23:51:12 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842823512b0sm5365894b3a.15.2026.06.03.23.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 23:51:11 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 12:20:36 +0530
Subject: [PATCH v3 2/4] spi: qcom-geni: Use geni_se_resources_init() for
 resource initialization
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-enable-spi-on-sa8255p-v3-2-43984eac4c67@oss.qualcomm.com>
References: <20260604-enable-spi-on-sa8255p-v3-0-43984eac4c67@oss.qualcomm.com>
In-Reply-To: <20260604-enable-spi-on-sa8255p-v3-0-43984eac4c67@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        bjorn.andersson@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        chiluka.harish@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780555855; l=2636;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=W/YrZ50I3AwtE19t9pzTiT0xdnQWey3D03tHPf2lno4=;
 b=ewjUJ9QKdBe0LIdL7sEmglT5sWBrEP+JxB6TfNuTourwIG1xcImR8fe/gNJJSHDiomNV2fY6M
 k1xT8JFyf7mCsZ4+n/5sW0Kx/rTi0usWiNKlEGlXXva5LFU8mlecYpP
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-GUID: fwI4n5v_fH1L2laADY1pHMto7OsGdn7B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA2NSBTYWx0ZWRfX7Oh6GA2UwfLS
 D+x7fRY8C+kcOKokuykcM5zQjXOYS3k3PwIr5RlnEGAUjzNNyGvr2ONRZ0+oJTqx+1nqbeK6KUu
 E0lda/nO2ClGPZ3eBV00BgpD6/PkwPr4ld4U2ttoMh4JMaXnfLkMRuhxTqlHCVesiciJ2AkjDpc
 Jdw280vSdXdznmWFZujOrfJVDlV7pWgbOc1URTOw6Bzt1YiiQ7X097fbsNIsR5nHcBNiBDcCMuD
 puOD9Kb305Elc2Yh9Jdn42HzDrZxZjRdRx6KgPKIOcVjvKHZYvECHVMouFyHBdhcYdV24JC099k
 XZxaNMGnt1ghf6zjuSSQA6WP/sOIeHY0uUlbU2clIW9H9iryeSpTA0t1ds9AMbowrLJu7acaEwL
 mVLo1+dAqUqw4jAV2VPqS8EF9UCb10yIjee0ay/PboDMAdFNgJLCrmtsr0tTui2YseIM1clajrJ
 oXSd+zvMUX7Mm+dojiA==
X-Authority-Analysis: v=2.4 cv=DbcnbPtW c=1 sm=1 tr=0 ts=6a212061 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=TXo2QnZ9t29hVJcr6pMA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: fwI4n5v_fH1L2laADY1pHMto7OsGdn7B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040065
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111144-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:praveen.talari@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:bjorn.andersson@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-spi@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:jyothi.seerapu@oss.qualcomm.com,m:chiluka.harish@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 73A7863D6FB

Replace resources initialization such as clocks, ICC path and OPP with the
common geni_se_resources_init() function to avoid code duplication across
all drivers.

The geni_se_resources_init() function handles all these resources
internally, reducing code duplication and ensuring consistent resource
management across GENI SE drivers.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/spi/spi-geni-qcom.c | 26 +-------------------------
 1 file changed, 1 insertion(+), 25 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index a04cdc1e5ad4..333216df922e 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -1034,7 +1034,6 @@ static int spi_geni_probe(struct platform_device *pdev)
 	struct spi_controller *spi;
 	struct spi_geni_master *mas;
 	void __iomem *base;
-	struct clk *clk;
 	struct device *dev = &pdev->dev;
 
 	irq = platform_get_irq(pdev, 0);
@@ -1049,10 +1048,6 @@ static int spi_geni_probe(struct platform_device *pdev)
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-	clk = devm_clk_get(dev, "se");
-	if (IS_ERR(clk))
-		return PTR_ERR(clk);
-
 	if (device_property_read_bool(dev, "spi-slave"))
 		spi = devm_spi_alloc_target(dev, sizeof(*mas));
 	else
@@ -1068,17 +1063,10 @@ static int spi_geni_probe(struct platform_device *pdev)
 	mas->se.dev = dev;
 	mas->se.wrapper = dev_get_drvdata(dev->parent);
 	mas->se.base = base;
-	mas->se.clk = clk;
 
-	ret = devm_pm_opp_set_clkname(&pdev->dev, "se");
+	ret = geni_se_resources_init(&mas->se);
 	if (ret)
 		return ret;
-	/* OPP table is optional */
-	ret = devm_pm_opp_of_add_table(&pdev->dev);
-	if (ret && ret != -ENODEV) {
-		dev_err(&pdev->dev, "invalid OPP table in device tree\n");
-		return ret;
-	}
 
 	spi->bus_num = -1;
 	spi->mode_bits = SPI_CPOL | SPI_CPHA | SPI_LOOP | SPI_CS_HIGH;
@@ -1104,24 +1092,12 @@ static int spi_geni_probe(struct platform_device *pdev)
 	if (spi->target)
 		spi->target_abort = spi_geni_target_abort;
 
-	ret = geni_icc_get(&mas->se, NULL);
-	if (ret)
-		return ret;
-
 	pm_runtime_use_autosuspend(&pdev->dev);
 	pm_runtime_set_autosuspend_delay(&pdev->dev, 250);
 	ret = devm_pm_runtime_enable(dev);
 	if (ret)
 		return ret;
 
-	/* Set the bus quota to a reasonable value for register access */
-	mas->se.icc_paths[GENI_TO_CORE].avg_bw = Bps_to_icc(CORE_2X_50_MHZ);
-	mas->se.icc_paths[CPU_TO_GENI].avg_bw = GENI_DEFAULT_BW;
-
-	ret = geni_icc_set_bw(&mas->se);
-	if (ret)
-		return ret;
-
 	ret = spi_geni_init(mas);
 	if (ret)
 		return ret;

-- 
2.34.1


