Return-Path: <linux-arm-msm+bounces-112665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fLlMIj17KmqdqgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:09:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FB26703D5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:09:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=f7NP4hdB;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ON8YVeDV;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112665-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112665-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5702932B839A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 09:04:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E60B3A16B6;
	Thu, 11 Jun 2026 09:03:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD06E3BCD10
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:03:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781168617; cv=none; b=EP1BtkLOgKHsxWE9ztlGOiUpfT76vHg8f4SpqLmW0jrIa3YNNKKgd9MUeUo9V09pS/pqdTgWHUs3cfUvk52PPhgkQDMluVmPhi7dsGHnEiQ7vpCMjacIQUAzXF4ePqACiyu61xUcbEB5EDF2Bpbi7UbNoydL2iHVfC/4Q10Ett4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781168617; c=relaxed/simple;
	bh=zibcBFPg9JLek+JrVlGq+zace6I2ePqJsyptJEv/VQQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m+Tn/vPlig69R9q93uaaQOtxabSzO4BLWF50/1Jq3hWxPiZkb4IKhaW4SV7hJncRDJht9HHJpxcw/fR5dsecuf88WFHvgvNOaPMRrOG08iEGRLCh9Olmr35YqRNRdCR4IcLgxBx375iD/9ZW4/lhitWoYlisbd4rtSU1TI+BdwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f7NP4hdB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ON8YVeDV; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GQAo3817120
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:03:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tC2t88rZPwlziJiJ1EpkCi7wbDjd/xXCSkiYjS6C3SQ=; b=f7NP4hdBK7TIxKEQ
	4F96aIf3qp6S4rsc4coXzze54GWm0WcvyDzcdxkOu+Zwp7smyJQKftTPdl/TtRei
	E2qUNxUzN3vIFhvhsZuhFyGgai7MiaKvg1Y8zD5i/YoMJdEJ5O3QHwcPiJ4MgSVL
	f9WAr9JBnt+sGvUrFjPI3db2DIcK+n9+3YInDidCO/icen74d31w3pgoeLDsEunU
	DPosBsKk4Ctc/ZyW6i9UxPF7DhUxbLSnt7v9h28cDWFPv4EFBrYbdnNJyI/xYNea
	4JzVjjn66bWmT2ZiPeSzHNLHb9Aw+R/N1vMOWRZCsBg5mOERNv3sa5h09IWyc4J9
	snBiNA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6utk6h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:03:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0a81c1738so44791805ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 02:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781168614; x=1781773414; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tC2t88rZPwlziJiJ1EpkCi7wbDjd/xXCSkiYjS6C3SQ=;
        b=ON8YVeDVYOgOw7mmnpNvD2jDgZL97DqAdbAbiOq5+nrIJG1VB7oUQWnsMnbnd2E5Cs
         5Dw5eK4JGqFziovH7KCZkXLRq9EeMgSxWahUO4qSSXcVlObRoXftEO3nDonIixguZaRe
         h5VfpwnRZM39W4Z6eVRCxWWYIpK854ryAj68R4sgtkFNCj8RxnZnlT+rNuYqZH7HRMPl
         BopcxNeDbcpPBediqGYhj2T1iFdBonNOGwlKm4DHLjifpOxfLh8SOHrDGFbTWijlQvf5
         +gG47QUsb/hOHcmxUKwhQgFskdP7X6UZgQN8hPLksIXcSwiMFV5JgK0H7dsq0aCt6JcY
         hgoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781168614; x=1781773414;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tC2t88rZPwlziJiJ1EpkCi7wbDjd/xXCSkiYjS6C3SQ=;
        b=j3UdnbF2NBPKFhD3uq4w5XJdWypDOR9ZqAMej4tEj1lSRdbToBzud7ieeXH4SDwGHl
         AXMnPTN/th2OQOI6YIGeKAvbf0Jjs5m0y5wjXk58TfuDa9Kv/eXhtdGTP2OMIXVv4rV6
         NPvpDqWK1cMkEFmgDaUsTeKn2uyTYYfu11Uv8VcGFFiTgHnS+qo6DfY1HeQXNRHjzI5m
         1eUM7sdHP9eaZK92xk86ly6K90CQX6O+xoJLvLfhncxak1hbvMmQBI9xU9rgEsfAdhP/
         gbaopoFHNBzwAyWEo6e8qUZvr6LH5KW/byWiMorzETSJBy/bvTmhfQx5Q6y9OSzHSrn9
         ljlA==
X-Gm-Message-State: AOJu0Yz4hxPWasPcGWdSlu2himL4Tp80BIbSJDJFX5pamiM/G2qJMRuO
	0zD6vdiI7DWMfe7Lm3dAvLIPYRyQDM8bKunTzlSLacVFlbSsflYTPgB8aAJantB5Brff5EdQEPB
	969w+gbBZnx9rn/UL2WM9hfX7hE9ZhG+KOFzFwK3F6US5oPcPt5ZBBM+R7ubGIiAgg3vv
X-Gm-Gg: Acq92OHuYk30yuJhrWwtGGFxXhoFEV4Iin6CVkfoUUEyJGRD1Zdb8bGGjKQCd+seOdn
	B4Ol0WWHn+q1bxwtuvFqeQzITFAUcS8T7cCAPjOSTIJR4VP4kSy7ZcSJVUL1fOb9uObNt9CpK9v
	60K9pksz2JH6/6aJzeJ5qmS0dkS+7nF+PbN/LR8la5IC1XNPiftDYnq9WBg/zYb7WGopCZANKDK
	I/8IMw28g1MkjBt4cKpO3h562E7JUdG089+uLxzrBtu8By2fTmEA9yCgxvfq4oDUN1E/dW7Ubeb
	zmtYb3lRtnjMZk3Thz6BD/iU2sLA9HGBybIGQN+6y16VqSYcsP06uMcHBKYntitKbh4eRFx5d7k
	QQmKyfHIbhth/dKAeD7OxuQY7cGph3Zt32FhQhKZCG/HbdiqqknhKMF5vzTQ2wZGqh1CohJGF1S
	ptr28hDV11mvjiMWkojkM5W8ONnTYUepFLaHqdUEWtoNhKpi8ikkwf3idkgXLUzex2Sww=
X-Received: by 2002:a17:903:234a:b0:2bf:160f:7038 with SMTP id d9443c01a7336-2c2f07330aamr21474845ad.12.1781168614343;
        Thu, 11 Jun 2026 02:03:34 -0700 (PDT)
X-Received: by 2002:a17:903:234a:b0:2bf:160f:7038 with SMTP id d9443c01a7336-2c2f07330aamr21474395ad.12.1781168613801;
        Thu, 11 Jun 2026 02:03:33 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c24edbb49bsm140980535ad.38.2026.06.11.02.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 02:03:33 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 14:33:18 +0530
Subject: [PATCH v2 3/3] regulator: qcom-refgen: add support for the IPQ9650
 SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-ipq9650_refgen-v2-3-d96a91d5b99e@oss.qualcomm.com>
References: <20260611-ipq9650_refgen-v2-0-d96a91d5b99e@oss.qualcomm.com>
In-Reply-To: <20260611-ipq9650_refgen-v2-0-d96a91d5b99e@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=FJ8rAeos c=1 sm=1 tr=0 ts=6a2a79e7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Z5Z_lLKGqtEyjnyCENkA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA4OSBTYWx0ZWRfX3iNeYvysgtWZ
 hlqsepYvMBI5u/Ysh7fEbskq3nBwN+961VM3zy2MPZv88PwWA5o6+tj4QCfJkgijTX3rgm0rgqK
 QS9WKyEw/yujJrD8obMnRR82yyvw9xs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA4OSBTYWx0ZWRfX3f0XjO8BK19k
 D0SBhuJz8jiefrhVzZdT7mNDA37+7rzu9MAFOuV3X4MponZuoHea8uQm4ozWxkH3qIfnwBjcE3o
 dtG61p2Sw4xMu2wbNqc7iYINSVwZy1o2leSyZaBWu1dfcagBKXK3RlWB3HE4DF5gFpjJoGXihH3
 TiQDahCfiu0gOmpKOTjcSu+c0ShknXTRbRsNgp40hSf4kQP6Zi1MyHzbDyRdy1tBPVgMW70YR5C
 8UTSAIIGf4WhM2Dm0rNCVxpZQDI7zs0UoeFjx4g3IzWz0SvdxsIUCTNRGqJyzfA/OupeSamY2E2
 Vgczoe+MMxYJXkmRqf/gBG65e9HKp2O1QS73TCtQBeankA3Cs+peTGhwBOEdvRWnBlJp+rXryWt
 8Kb+K4HWrvyFOkp57FiOubHwgFN/N9rmllvKk1RHqaZM99IYYU/0Ku6zK8quaSS5N3584NczL/P
 vkRsOmS4ma80+VUCEsQ==
X-Proofpoint-GUID: qoRYb9Jj9s8xdYErw6iGrN6MqnuFxlr-
X-Proofpoint-ORIG-GUID: qoRYb9Jj9s8xdYErw6iGrN6MqnuFxlr-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110089
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
	TAGGED_FROM(0.00)[bounces-112665-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D0FB26703D5

IPQ9650 SoC has 2 REFGEN blocks providing the reference current to the
PCIe and USB, UNIPHY PHYs. For the other SoCs, clocks for this block is
enabled on power up but that's not the case for IPQ9650 and we have to
enable those clocks explicitly to bring up the PHYs properly.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/regulator/qcom-refgen-regulator.c | 89 +++++++++++++++++++++++++++++--
 1 file changed, 85 insertions(+), 4 deletions(-)

diff --git a/drivers/regulator/qcom-refgen-regulator.c b/drivers/regulator/qcom-refgen-regulator.c
index 6a3795469927..e8821f159ff1 100644
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
 
+#define REFGEN_REG_REFGEN_STATUS	0xC
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


