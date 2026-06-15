Return-Path: <linux-arm-msm+bounces-113122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id N29/I+K6L2oBFQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 10:42:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B00684A88
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 10:42:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=RuVSpvvU;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IvcbDkUB;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113122-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113122-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 61460304E406
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 08:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A454E3D7D7D;
	Mon, 15 Jun 2026 08:36:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF8D3D88FE
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:36:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781512574; cv=none; b=j5NC2lBq+lvEirGCGBJlRxjeuohKZTcra2Nv1/8TJ5KQX27nUazr2pHGTlFvW+tk+U+ktSI4YdEQuXAxemXJACUOz7x4LRw6jAo8W/lHiX98pPbJtN57qpzgVnkQvIShnpPG56LNg2ZEWahGthEiY4EkCESFZTE5Cjd5Nh8B9lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781512574; c=relaxed/simple;
	bh=q8n8EcRVEqDx0rTIRxW16mASt8lBbsLXkx6/x0MGZYE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FD98yhqqvh5wqPQ8x0E3wOabcpdCKYlpn1AC9a+RNJWeNKXRFAOUxAPaLrv8MYMXxDcZPzfEqg8EAnte3TKyasCVwtcCft3j3N55dYkyVxkhJQ5M7yjtYTQoaN1ulM+33ulfz54KiY7opT5FfM6ImbiAqD4M0LdENqFXvdeCkvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RuVSpvvU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IvcbDkUB; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6Kf2M3710079
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:36:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E/j9QF8dbDj+/82a7BdJ5T+MI0kCyu4OX+6hRc/SsO8=; b=RuVSpvvUEMiuBjlI
	9zsEvK6ONbflYHJT9WRNWoF6qLgf68k9o+6lvEbdW5ic1vtKifJMiSi7hdFb6P7t
	6/k+O5oGOgpjTo0ymNmcd16DdydvKEQ1WpbuxPNoL5+JThzv+29jB2A4c5I672/e
	Hwxz6muxvJyz1u+uxokFwhccxeANnkiBMvvuYAIKzl7dwnCY22KkBHUuSFDdIyTh
	zKYM+Ve/oaCIYNMid0mkZR3NMVmN1YzXlqtnYRYhBxl8HwAVxDJZ1y/TQiXmUuzw
	BWDmHZD0dyR/FKr3dWLX6eCT4QdGS2Cz5mwOpOjrc44lg99/U+tnsK+nkLO/1qjq
	k4UwOQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery956emq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:36:09 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36e09ec696aso5224245a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 01:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781512568; x=1782117368; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E/j9QF8dbDj+/82a7BdJ5T+MI0kCyu4OX+6hRc/SsO8=;
        b=IvcbDkUByhuvPF4Lse6geYD36uWHMKXDckUv+SNVHkFXv+JgGxmW96K06UzVeiBFqL
         42n66R24p7sLJJnzux25fszE0Eecz8lqtAE8WmJUDRsablyP8PJDEkx3QAgqzrEq1W1m
         DbNky7jBC8hOjF9tyT4fUKZev3pieQIonwfaaks+wpbawKhgw5qUDfad2KvWi+vHskOr
         65VGNzcwUy0/BpTzLlGVG/OuREE4ngVphjgkEsaRmskE5LBmq8C5g2Ny3XgZq8OiPMba
         5v7pmJ2hu5C/W63rVLPFEq8jTN0ytvOjmNPIaA/e7hcNrdamg/9EKd/etr0513fFSFkh
         F/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781512568; x=1782117368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E/j9QF8dbDj+/82a7BdJ5T+MI0kCyu4OX+6hRc/SsO8=;
        b=n31ZzKQ62hHSkXX+xASzn7g7dEmsWOpCJQzAJS8ex0hfoxs0NlcVKTLFaRYW6eHkWd
         wE4nYXCdpJU3f5KyBZ4qoGIVJBbZCMYmJtltezYtz2/qgGrkOFL8y2ihBFdGnkOtwc/6
         CAHeOkyzF56/xqifszcWmi4i3Y9DGA/1afT8KEL36KDrFMcaAVmZYajkFaEEkk7FNwhf
         G7VAlgsQHrx5B+S6wIFennlcMYS0TDfYRx4Y1yLHzjy1/rxsrAR85eklWrroakR+fjZd
         drW85ULkGw+ksjYGsHOMYZIwlJVl7nYr/i6dNecfXIe2oOVj6wZ66RhsvLFkE2W0b7wt
         awjw==
X-Gm-Message-State: AOJu0YzXSmGOrueFgeJ3c/on0HI92P81TqdKs3vM1JcQSy0nvT3VGrCU
	aNL/pfxcT5qyHpxgE9BtrVNIgqPmwFX3PPbl0Ep1gGK0b7Kk06pnjupGg1dfFmHOgDO11RgshHY
	6IhWSEjkmGY1GQqIuyrc2OTOcy/anu/5e4plNepcvCUy+OvHg/vrNQlXJhx0DYtZ/YWMg
X-Gm-Gg: Acq92OHnuptm52wuCkZz499xm9MynUtYSrzI52hF5QVbfPkuI7qC0zCWDq5z5v80wOA
	sUy+q8xpqwElp0kYLTgdlHohVAZ1NFMYU+NNatX4VSQlkBsamk+MUc5MUubfbojPsp2mtqs+Wen
	AVnPybXiARTOa5Lb5gTmCmLfsFOVKZ+BzNLlfa+M6LkaFOWxaJLFTHwQhvgQ40y57kp4epThW8k
	naf8vnkvYEjhAka7TI4f3qdXaltjYQFGz4I7Pb9woylasHuBtWJEBProXbnYjJn83HrtiNlxx8k
	kXFCosTeSB6zIwNaKH/j7pVzdlfM8bbNEKZ3DvjZV6CKF/7gFv7mTHpWqmskJqjiZbiZGafrtVi
	cWjbGIPrgfQamdrq80mWky9GiCAuYPDeREkmhpf8McLoA5ofEb0Dd0ab9ENb440Mjebthg48wKL
	+WdaFzDZbhV2j/Nq8z8k9nNP9tYtu7jJXT6/CkktYTFiXWPdH9ocJicUsx
X-Received: by 2002:a17:90a:d44e:b0:36d:b424:4f17 with SMTP id 98e67ed59e1d1-37a01847870mr13819075a91.1.1781512568270;
        Mon, 15 Jun 2026 01:36:08 -0700 (PDT)
X-Received: by 2002:a17:90a:d44e:b0:36d:b424:4f17 with SMTP id 98e67ed59e1d1-37a01847870mr13819056a91.1.1781512567813;
        Mon, 15 Jun 2026 01:36:07 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a210ad64esm9558974a91.0.2026.06.15.01.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:36:07 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 14:05:49 +0530
Subject: [PATCH v3 3/3] regulator: qcom-refgen: add support for the IPQ9650
 SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-ipq9650_refgen-v3-3-5f611623629c@oss.qualcomm.com>
References: <20260615-ipq9650_refgen-v3-0-5f611623629c@oss.qualcomm.com>
In-Reply-To: <20260615-ipq9650_refgen-v3-0-5f611623629c@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: kRJpfOKEA20chKlnQ61Q7P6EGfepl50V
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfX58HQwO9MAzg0
 NLf7iQVjElpWuRLTcOOSHbH4AAgOSqhGC5YKKH8i6clSQCfvyPQVMUWA8bEktc+gMin04NPercl
 rbV1EErqKi1qK6s50kgaFARB6Fyi+xs=
X-Proofpoint-GUID: kRJpfOKEA20chKlnQ61Q7P6EGfepl50V
X-Authority-Analysis: v=2.4 cv=EbP4hvmC c=1 sm=1 tr=0 ts=6a2fb979 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Z5Z_lLKGqtEyjnyCENkA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfX5QIk6I8WbZQq
 sLWt45lfATPqgoNU+L4nf4hmy/bHLp8bTu8iav7NWLv6mmUCsK0L91Wvjcao586uJIY2jMec6bw
 LIqnudFDHIlX9i2jcSTe3C5NZC0gLmSJf9L1Jlc95UpCsw1IWqFAN2wFMhsADM28GAMwPTNtA/I
 dLsNr9Tt4hzscHZ2k4TZQarHmqoPvixgO94gO+jj9CtKweYIjzCdqA/KYm/PzGjkZgfP8/VrXg1
 +N4H7lNNBb7wSrTH4S6Kj8fstBh0JvLx1Rsg0qnaMfgD9foulLDgaPzXAO7TizqjVvTmad289qL
 IENueAFzBhFKtdCCYY7+P1aLNqsIGDtl/v1dZIfoOyqbQ9I9O2kz1KQ11Yh8+CAgpRJgOK/1cnH
 Y/gUY32o+DaApIyZtiuA3sHRlgicp9J6jRdyQpwEPVTsgx5hBqiBShxtrfQovMTEvSa2v+JzgtN
 jOT+Mhaor9P8l/ufoIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150089
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113122-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F0B00684A88

IPQ9650 SoC has 2 REFGEN blocks providing the reference current to the
PCIe and USB, UNIPHY PHYs. For the other SoCs, clock for this block is
enabled on power up but that's not the case for IPQ9650 and we have to
enable those clocks explicitly to bring up the PHYs properly.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/regulator/qcom-refgen-regulator.c | 89 +++++++++++++++++++++++++++++--
 1 file changed, 85 insertions(+), 4 deletions(-)

diff --git a/drivers/regulator/qcom-refgen-regulator.c b/drivers/regulator/qcom-refgen-regulator.c
index 6a3795469927..4b8aa40d7efe 100644
--- a/drivers/regulator/qcom-refgen-regulator.c
+++ b/drivers/regulator/qcom-refgen-regulator.c
@@ -3,6 +3,7 @@
 // Copyright (c) 2023, Linaro Limited
 
 #include <linux/bitfield.h>
+#include <linux/clk.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -16,6 +17,10 @@
  #define REFGEN_BIAS_EN_ENABLE		0x7
  #define REFGEN_BIAS_EN_DISABLE		0x6
 
+#define REFGEN_REG_REFGEN_STATUS	0xc
+#define REFGEN_STATUS_OUT_MASK		BIT(3)
+ #define REFGEN_STATUS_OUT_ENABLE	0x8
+
 #define REFGEN_REG_BG_CTRL		0x14
 #define REFGEN_BG_CTRL_MASK		GENMASK(2, 1)
  #define REFGEN_BG_CTRL_ENABLE		0x3
@@ -25,6 +30,16 @@
 #define REFGEN_PWRDWN_CTRL5_MASK	BIT(0)
  #define REFGEN_PWRDWN_CTRL5_ENABLE	0x1
 
+struct qcom_refgen_regulator_data {
+	const struct regulator_desc *rdesc;
+	bool has_clocks;
+};
+
+struct qcom_refgen_drvdata {
+	struct clk_bulk_data *clks;
+	int num_clks;
+};
+
 static int qcom_sdm845_refgen_enable(struct regulator_dev *rdev)
 {
 	regmap_update_bits(rdev->regmap, REFGEN_REG_BG_CTRL, REFGEN_BG_CTRL_MASK,
@@ -62,6 +77,42 @@ static int qcom_sdm845_refgen_is_enabled(struct regulator_dev *rdev)
 	return 1;
 }
 
+static int qcom_ipq9650_refgen_enable(struct regulator_dev *rdev)
+{
+	struct qcom_refgen_drvdata *drvdata = rdev_get_drvdata(rdev);
+	int ret;
+
+	ret = clk_bulk_prepare_enable(drvdata->num_clks, drvdata->clks);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int qcom_ipq9650_refgen_disable(struct regulator_dev *rdev)
+{
+	struct qcom_refgen_drvdata *drvdata = rdev_get_drvdata(rdev);
+
+	clk_bulk_disable_unprepare(drvdata->num_clks, drvdata->clks);
+
+	return 0;
+}
+
+static const struct regulator_desc ipq9650_refgen_desc = {
+	.enable_reg = REFGEN_REG_REFGEN_STATUS,
+	.enable_mask = REFGEN_STATUS_OUT_MASK,
+	.enable_val = REFGEN_STATUS_OUT_ENABLE,
+	.enable_time = 5,
+	.name = "refgen",
+	.owner = THIS_MODULE,
+	.type = REGULATOR_CURRENT,
+	.ops = &(const struct regulator_ops) {
+		.enable		= qcom_ipq9650_refgen_enable,
+		.disable	= qcom_ipq9650_refgen_disable,
+		.is_enabled	= regulator_is_enabled_regmap,
+	},
+};
+
 static const struct regulator_desc sdm845_refgen_desc = {
 	.enable_time = 5,
 	.name = "refgen",
@@ -90,6 +141,19 @@ static const struct regulator_desc sm8250_refgen_desc = {
 	},
 };
 
+static const struct qcom_refgen_regulator_data ipq9650_data = {
+	.rdesc = &ipq9650_refgen_desc,
+	.has_clocks = true,
+};
+
+static const struct qcom_refgen_regulator_data sdm845_data = {
+	.rdesc = &sdm845_refgen_desc,
+};
+
+static const struct qcom_refgen_regulator_data sm8250_data = {
+	.rdesc = &sm8250_refgen_desc,
+};
+
 static const struct regmap_config qcom_refgen_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
@@ -98,6 +162,8 @@ static const struct regmap_config qcom_refgen_regmap_config = {
 
 static int qcom_refgen_probe(struct platform_device *pdev)
 {
+	const struct qcom_refgen_regulator_data *data;
+	struct qcom_refgen_drvdata *drvdata = NULL;
 	struct regulator_init_data *init_data;
 	struct regulator_config config = {};
 	const struct regulator_desc *rdesc;
@@ -106,10 +172,23 @@ static int qcom_refgen_probe(struct platform_device *pdev)
 	struct regmap *regmap;
 	void __iomem *base;
 
-	rdesc = of_device_get_match_data(dev);
-	if (!rdesc)
+	data = of_device_get_match_data(dev);
+	if (!data)
 		return -ENODATA;
 
+	if (data->has_clocks) {
+		drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
+		if (!drvdata)
+			return -ENOMEM;
+
+		drvdata->num_clks = devm_clk_bulk_get_all(dev, &drvdata->clks);
+		if (drvdata->num_clks < 0)
+			return dev_err_probe(dev, drvdata->num_clks,
+					     "failed to get clocks\n");
+	}
+
+	rdesc = data->rdesc;
+
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
@@ -126,6 +205,7 @@ static int qcom_refgen_probe(struct platform_device *pdev)
 	config.init_data = init_data;
 	config.of_node = dev->of_node;
 	config.regmap = regmap;
+	config.driver_data = drvdata;
 
 	rdev = devm_regulator_register(dev, rdesc, &config);
 	if (IS_ERR(rdev))
@@ -135,8 +215,9 @@ static int qcom_refgen_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id qcom_refgen_match_table[] = {
-	{ .compatible = "qcom,sdm845-refgen-regulator", .data = &sdm845_refgen_desc },
-	{ .compatible = "qcom,sm8250-refgen-regulator", .data = &sm8250_refgen_desc },
+	{ .compatible = "qcom,ipq9650-refgen-regulator", .data = &ipq9650_data },
+	{ .compatible = "qcom,sdm845-refgen-regulator", .data = &sdm845_data },
+	{ .compatible = "qcom,sm8250-refgen-regulator", .data = &sm8250_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qcom_refgen_match_table);

-- 
2.34.1


