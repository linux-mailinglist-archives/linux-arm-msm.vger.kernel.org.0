Return-Path: <linux-arm-msm+bounces-96946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMMLGBREsWlCtAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 11:29:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D34232622F2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 11:29:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 91FFE30880DC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 10:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D66EF3CBE96;
	Wed, 11 Mar 2026 10:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DlcRurO4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SwOz0NWM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A423CF049
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 10:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773224835; cv=none; b=q+4QKssn2VW1PYWpDx5WhfIGdJFW1MaUQeWxxTAdVePNvHfSbA4r9Tp9f35VHSmJA4vibQJNNxHC65my/2/Z5oqNoopdGWNZYpy2uQFDECRpdoz1oevzSuoj/DjLkmpEDhsuRwPor/zml8R/ygy3SFxSfdX6pnUnTrcup2VZhOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773224835; c=relaxed/simple;
	bh=p9k1+/wF5h/48gQ8oI4Nz1vPnqke7I1l9Z0Jkky+eGc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DTjLfLfntN6Uv9iWNR0F9Mn5AJ9E23tjIaWoJWGqX6i6JrdeKRNkUDzE1KkG9ZFyE1TtJcHzApVxm3vcIbamHyclQPmJtkUnN2CqYumg47JerYJZD9uL5bx7qIPTnNjClZmStPj4DFmLKaMQ8XSr5Aklum07w8UOJ/hc0VCIVcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DlcRurO4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SwOz0NWM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B830xY1266072
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 10:27:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n0dWYOeGxguS+2oLFAt3NGnKQOAcHpW8zVfBpqLuOnk=; b=DlcRurO486QsnPGT
	h78PTY9h5G2h8sKgFQa7VBbU7olOipI4V1IhJ5V8DRvom9fQLrABODFNC1hipbBI
	QrTQ9XM5v+4Tg50qGo5gCkyZs9A1TD4vDrriMCYFKk88/iJXUjmOjmetjscUzmm4
	n3+wfX8Czu1+Q/2yQzeENwoIOUo00bWBPz83ckiHn4oHDP6g6uaQ1yWqaVuCsEft
	ZZiY1ivYySfRlgiSBPbs3zdHUYXlp16E+slReDOyckU5lsGHgm7jkvwjqvjcBmwN
	zRUTXPfwtO9ZR4wIBy3miPN0KDQOnW0AymX2j580SWkhIFZNhYg/xvOKpKhm7A6m
	nvGOXQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctpkfkj0r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 10:27:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae3badc00dso121120775ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773224833; x=1773829633; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n0dWYOeGxguS+2oLFAt3NGnKQOAcHpW8zVfBpqLuOnk=;
        b=SwOz0NWMm3B1x6pfB9Ka7kUQdYU1aCp6zK3kHcwYTyNtV38LfcgVn7VxoJR2H29tGU
         7Qen9u9Iu+oyTqs3fVM5wgLdk1z16jumbmZeomjKJPzR9Vowylh7tSG3DpDGwHxu1vn/
         +Ve23cLaaFWkTv0spLEwF29GxGHXtYJXFuqeB3DKS2JcJhT0/clUruxudrmOb+ffEpZX
         nulbofuS+Y6LKooGTgMat1sfBQIh7X6r8SKVLudIStoN/fVsykffM56WVQ16ow0IILxY
         EqFvi6euSxA27rO9iX9iGllLlktfgwL3dZc0Rgqczj8jVDfrrClPd2kxmjZkNA8NM2Mv
         XAMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773224833; x=1773829633;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n0dWYOeGxguS+2oLFAt3NGnKQOAcHpW8zVfBpqLuOnk=;
        b=bmg88zBHPT9PTSSV5iy2OruXp47SzVhdrXgcfwRs9quNvZvogZH1NDTns3xneiZvCk
         3FC5zP7PYiLHuca2plk+uwedmhBBqcPskcKgoloeJJD4EFWpSVSp6SAqWaxalWOynwt6
         WBUDaeam+Inar2VYQ0v2zQo6Ns/c+B9fP0p/21W+Q5r5mpv97EaUjOa8gANh1lGtMcZN
         8HsXl0JHDvr2VBULPI1o1w6HzRN2W/Yodnvi7izMyaX2S9ZAlJPRNmNCCLIXoC6vxhLD
         ffQNu5+YIgza1KFoS5dBEeQm2YkWl087CbcOrtfFuQKxp9IxFxuVWTRr1jiEwYAgGZoD
         VOqA==
X-Forwarded-Encrypted: i=1; AJvYcCXaG08kMdtRsS42odglYWvRaRW2F3WJSNOBfl0oPtHz3i+jV8A2kHvp02lx+FPoe8fz1Pzl9Ph+0+dGvbJq@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl23N51WYN1sYDp7vCOzDFbB8IqasUgADlbippEFdXW9zKeL26
	kuEXrKxflZEQufqCVZsDXOxPVEuNRRPjYr3iWLfFvMFhtlTivGW3aITy8ZjRosLXxYBD96grJz7
	/GYZYWGi1Y9IcbpTuSqNLP+jzjDF/5zBJs7lf4iFeQiwX6eoWYTJBX8bxbu+/O/6/LEmf
X-Gm-Gg: ATEYQzy1IwjCw6Z2rnSQX2/DeQXKVgtCp+lCdJhtYUvFAbeACwSVwpsRs3o7KLjUIbC
	Y+y/XjCt+/QE+yfmEaJPrLvYbkadZLpwIVwqJYvAt4UcLs9LKiVd46D0QVf42Kwb0emjuByE1uG
	5+dHQxo6DMzUdrHdfRfFwYIA/r2S5dWK2jo+nCJOzT5gmlgOj0xkTZjzXjPMmar+YueW131+RYJ
	W3P1yNgHvTeHH9GZihRKk7Xq/k6o0dLLAkCZxcdPn3vV2fBKiChfuUTc2EWL5JrfpVXPD2vApgu
	PH3sQxAek9zDDaL25SZaOmjIZJlL7NlXyVOR6lpIpYKZwmpI4yy69XE6mj5qsVAGq17mTuTiKey
	akM5j5I7I+phMLpd2u0oVaMSET93NJmWKw5jFoO0sAvgJZuAKUzG4LiKX
X-Received: by 2002:a17:903:2b0c:b0:2ae:3b36:23e7 with SMTP id d9443c01a7336-2aeae7cfd6amr22264735ad.16.1773224833106;
        Wed, 11 Mar 2026 03:27:13 -0700 (PDT)
X-Received: by 2002:a17:903:2b0c:b0:2ae:3b36:23e7 with SMTP id d9443c01a7336-2aeae7cfd6amr22264455ad.16.1773224832553;
        Wed, 11 Mar 2026 03:27:12 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae222872sm19575245ad.18.2026.03.11.03.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 03:27:12 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 15:56:49 +0530
Subject: [PATCH v3 4/5] PCI: qcom: Power down PHY via PARF_PHY_CTRL before
 disabling rails/clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-d3cold-v3-4-4d85dc7c2695@oss.qualcomm.com>
References: <20260311-d3cold-v3-0-4d85dc7c2695@oss.qualcomm.com>
In-Reply-To: <20260311-d3cold-v3-0-4d85dc7c2695@oss.qualcomm.com>
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Will Deacon <will@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        jonathanh@nvidia.com, bjorn.andersson@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773224811; l=4739;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=p9k1+/wF5h/48gQ8oI4Nz1vPnqke7I1l9Z0Jkky+eGc=;
 b=z1UX2znW0tNQnXQikEHUVz+yoSQwhJ/CfsyzJwxDof3560WJyIXchPHVP9PSe7GbW4/Fkm/sH
 wyPufFOw5duDoya2OYCwIK8uUeNk7eCIVU28b7Kz+WNeSKoelULm+KV
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: h69XgT9en2U_O-J8iHK5C1lb1hdu8F15
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA4NyBTYWx0ZWRfX96QCnc+WXy3R
 3oKeONUu+pQ7fsiQPvHp+WTQHBB9u9snMjFj9KDGP9BKH00stbiJFYVcgSPh1Q6zd7apK533G62
 YwtttRCNA2F9ajELcmt7NPpC8HIvTTUEV2yXXHE2mD+6GS7PExprq6cNpDeDeqKUKyzeooMLZb/
 0abIV/UVJ2vUIZEvqrtt0/JC/u4XqQ+t46RUcey4p3301UkuJ76IV2oAmUGiH86KV/sqkqZEp+G
 uXpi7DhW4SJKy9Fa6hiMIdZDn8NPSqTMmHn58qiP20GrzwV/o66rqoMUJVUz68kEzdhoY/hw8/e
 oPxw9Ej1zrZ+a29i8MxxMFVS2z6otv7qTJ+YnfrzIBkgWRmp04FJumWI50TxczP3n5dgZhRdKcj
 u9UvC+phHPtCLi4plZE9hMUB867YdYQ2kkZWuxYQMwJSqqa+mts2d3ozuSEqQg87CFGdNqtRWF6
 6/SMlou7Rxw5BQrJENw==
X-Proofpoint-ORIG-GUID: h69XgT9en2U_O-J8iHK5C1lb1hdu8F15
X-Authority-Analysis: v=2.4 cv=Gq5PO01C c=1 sm=1 tr=0 ts=69b14381 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=S-wDCh2AgS0RhsWIeBgA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110087
X-Rspamd-Queue-Id: D34232622F2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96946-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Some Qcom PCIe controller variants bring the PHY out of test power-down
(PHY_TEST_PWR_DOWN) during init. When the link is later transitioned
towards D3cold and the driver disables PCIe clocks and/or regulators
without explicitly re-asserting PHY_TEST_PWR_DOWN, the PHY can remain
partially powered, leading to avoidable power leakage.

Update the init-path comments to reflect that PARF_PHY_CTRL is used to
power the PHY on. Also, for controller revisions that enable PHY power
in init (2.3.2, 2.3.3, 2.7.0 and 2.9.0), explicitly power the PHY down
via PARF_PHY_CTRL in the deinit path before disabling clocks/regulators.

This ensures the PHY is put into a defined low-power state prior to
removing its supplies, preventing leakage when entering D3cold.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 32 +++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index b00bf46637a5ff803a845719c5b0b5b82739244b..c14c3eb70f356b6ad8a2ffe48b107327d2babf77 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -513,7 +513,7 @@ static int qcom_pcie_post_init_2_1_0(struct qcom_pcie *pcie)
 	u32 val;
 	int ret;
 
-	/* enable PCIe clocks and resets */
+	/* Force PHY out of lowest power state */
 	val = readl(pcie->parf + PARF_PHY_CTRL);
 	val &= ~PHY_TEST_PWR_DOWN;
 	writel(val, pcie->parf + PARF_PHY_CTRL);
@@ -680,6 +680,12 @@ static int qcom_pcie_get_resources_2_3_2(struct qcom_pcie *pcie)
 static void qcom_pcie_deinit_2_3_2(struct qcom_pcie *pcie)
 {
 	struct qcom_pcie_resources_2_3_2 *res = &pcie->res.v2_3_2;
+	u32 val;
+
+	/* Force PHY to lowest power state*/
+	val = readl(pcie->parf + PARF_PHY_CTRL);
+	val |= PHY_TEST_PWR_DOWN;
+	writel(val, pcie->parf + PARF_PHY_CTRL);
 
 	clk_bulk_disable_unprepare(res->num_clks, res->clks);
 	regulator_bulk_disable(ARRAY_SIZE(res->supplies), res->supplies);
@@ -712,7 +718,7 @@ static int qcom_pcie_post_init_2_3_2(struct qcom_pcie *pcie)
 {
 	u32 val;
 
-	/* enable PCIe clocks and resets */
+	/* Force PHY out of lowest power state */
 	val = readl(pcie->parf + PARF_PHY_CTRL);
 	val &= ~PHY_TEST_PWR_DOWN;
 	writel(val, pcie->parf + PARF_PHY_CTRL);
@@ -844,6 +850,12 @@ static int qcom_pcie_get_resources_2_3_3(struct qcom_pcie *pcie)
 static void qcom_pcie_deinit_2_3_3(struct qcom_pcie *pcie)
 {
 	struct qcom_pcie_resources_2_3_3 *res = &pcie->res.v2_3_3;
+	u32 val;
+
+	/* Force PHY to lowest power state */
+	val = readl(pcie->parf + PARF_PHY_CTRL);
+	val |= PHY_TEST_PWR_DOWN;
+	writel(val, pcie->parf + PARF_PHY_CTRL);
 
 	clk_bulk_disable_unprepare(res->num_clks, res->clks);
 }
@@ -899,6 +911,7 @@ static int qcom_pcie_post_init_2_3_3(struct qcom_pcie *pcie)
 	u16 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
 	u32 val;
 
+	/* Force PHY out of lowest power state */
 	val = readl(pcie->parf + PARF_PHY_CTRL);
 	val &= ~PHY_TEST_PWR_DOWN;
 	writel(val, pcie->parf + PARF_PHY_CTRL);
@@ -994,7 +1007,7 @@ static int qcom_pcie_init_2_7_0(struct qcom_pcie *pcie)
 	/* configure PCIe to RC mode */
 	writel(DEVICE_TYPE_RC, pcie->parf + PARF_DEVICE_TYPE);
 
-	/* enable PCIe clocks and resets */
+	/* Force PHY out of lowest power state */
 	val = readl(pcie->parf + PARF_PHY_CTRL);
 	val &= ~PHY_TEST_PWR_DOWN;
 	writel(val, pcie->parf + PARF_PHY_CTRL);
@@ -1065,6 +1078,12 @@ static void qcom_pcie_host_post_init_2_7_0(struct qcom_pcie *pcie)
 static void qcom_pcie_deinit_2_7_0(struct qcom_pcie *pcie)
 {
 	struct qcom_pcie_resources_2_7_0 *res = &pcie->res.v2_7_0;
+	u32 val;
+
+	/* Force PHY to lowest power state */
+	val = readl(pcie->parf + PARF_PHY_CTRL);
+	val |= PHY_TEST_PWR_DOWN;
+	writel(val, pcie->parf + PARF_PHY_CTRL);
 
 	clk_bulk_disable_unprepare(res->num_clks, res->clks);
 
@@ -1169,6 +1188,12 @@ static int qcom_pcie_get_resources_2_9_0(struct qcom_pcie *pcie)
 static void qcom_pcie_deinit_2_9_0(struct qcom_pcie *pcie)
 {
 	struct qcom_pcie_resources_2_9_0 *res = &pcie->res.v2_9_0;
+	u32 val;
+
+	/* Force PHY to lowest power state */
+	val = readl(pcie->parf + PARF_PHY_CTRL);
+	val |= PHY_TEST_PWR_DOWN;
+	writel(val, pcie->parf + PARF_PHY_CTRL);
 
 	clk_bulk_disable_unprepare(res->num_clks, res->clks);
 }
@@ -1209,6 +1234,7 @@ static int qcom_pcie_post_init_2_9_0(struct qcom_pcie *pcie)
 	u32 val;
 	int i;
 
+	/* Force PHY out of lowest power state */
 	val = readl(pcie->parf + PARF_PHY_CTRL);
 	val &= ~PHY_TEST_PWR_DOWN;
 	writel(val, pcie->parf + PARF_PHY_CTRL);

-- 
2.34.1


