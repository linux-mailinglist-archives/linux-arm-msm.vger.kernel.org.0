Return-Path: <linux-arm-msm+bounces-108329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MOiAIP5C2qCSwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 07:47:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F025778AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 07:47:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0DEBA3022B9F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 05:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEDBB35CBD6;
	Tue, 19 May 2026 05:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d5/CphwL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CJ4jqyuB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453B3357739
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 05:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779169652; cv=none; b=BvBF7Ddk7gyUE9a4PeXZJsaZVlNEbmkOUiPMOJqPELybSujnLlJCKqJAF917HSP7cDct0zu/Wyl6ZTEQUW9A6LelwJNAb9xNZibKhM8sxUZDuLKbuH/J41J1CXbf8zapExSa9xxjVUwvUSsQGKOEpbbYOgxSIRBuh1+mMrakthE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779169652; c=relaxed/simple;
	bh=vvLE/XhynCZJFbiPcGP3BjnA7ZMMjJOYuddxQHOZH5Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VgLj4Kjk5drxfMLJislaDsLOug7B0wRQJCqd3YOnec/3U5k3MhbBbAxBZuRywYjYm3YSft8BMRMZxAIO8IEv06FinHd4TL5ET+iLOU7yxF/LSLQ0IqTZYs2jZkBayTChR9/mn00SHr+3Ai2CvNnnnMhQ8uVH3lxJYrol0gJF6nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d5/CphwL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CJ4jqyuB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64ILVX5T2892697
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 05:47:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	45o0IW2ZWWFrwHOSmMY+tw+i50QrMnrRfwUfFW1n9HE=; b=d5/CphwL2QJdQUjg
	eTdNECiW1Pa1gWPGG0IeK/gM7UBZik3r4kLKzSKFW0wbkZRaQmfolW5QPe/jTy0G
	rAaZQKfkWZ19rhOYB6PL5+ve3ikxHE5UlSLLOdF25pu9NJy74Hd94oPm89r0is7T
	+MEFeiYqxkcGeUwdkERlDB9yUouillInAzBwAlMpjBK6Wr6srapxFfvYxRmhcZnJ
	r7109AIsmCv22mfG4/AcbeigQeeAJCntVc2FLjyXGPnPVH2I4zxlelAOzZKWCYAG
	cSCApMq/LTu1BpXU7r7Q1q/oWcru2/rOw+DAWKyyIeSiyFWD5YQuIp5rUxhobppL
	3KVp7w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7xk1ckwg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 05:47:29 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30230e64087so3728453eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 22:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779169648; x=1779774448; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=45o0IW2ZWWFrwHOSmMY+tw+i50QrMnrRfwUfFW1n9HE=;
        b=CJ4jqyuBRZ5oBu47OxxA5oCag4ECoLHPN90ZYdZWC/eP2PXxTFvAompwiLAnaqAzYM
         vV+d4zM2Ry2L0+aR1UqORnreiH9TuT7sn4/24DdPlgGTRHfUj+TSt3ybKeNk8DFCivPv
         gqaVenjx4v8sr32u6RQSxdEOCYYgARN9IUGL694ojoo3FsHvuBHi0GHGx8u4zCJzHSSM
         Bng3BQK3bEY4pHPa5PRImIsC/mRcVNrIhbvaARmbEDYuMQNGNFeeGZT9W8raAMHTJBuy
         vED89iN8XYBGLP3Ifa5HLEQdX+lORGcC00R6kajcFRy7UBvVDdb04iL1tg94WA3PTT6g
         OrRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779169648; x=1779774448;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=45o0IW2ZWWFrwHOSmMY+tw+i50QrMnrRfwUfFW1n9HE=;
        b=oAF/arJ0skbmRTQD8fiB22s9M4uUtCDU8UsE1ACdPYrUZW8VgWtZZTbmkGX/cgaqdV
         0Ph4+WTtZu/RH6xECoHP02j3yS5vdu/2rcAQ7R777FLq1ibgbP2o3OueaAb6bdZ1kqbT
         gdHp7Z9iNS0yCIXO8+GQXd0koTsrxmIZokC2WDl2WRuUJ8HxSHsf+NJDEDA3bm1TNfjc
         HZXHCp/CQC/sw4sP4VSVwY215GzWFu1Ao0mSd091MibDr90MbkFF5bBiM+k5G+n5G397
         jgCF1O+o0AyrKV2o6sx4Z0736rK6drlV4k7wPl74tcmlqX0Era+WdKTyEx8DPFSepVd+
         SyBQ==
X-Forwarded-Encrypted: i=1; AFNElJ8VggEQ0jUd000cUhOJ3UkMKrvibCwIJZjt7/cNuZKQ5e6RXxalMXnh3MzVUE6KX9IgiyFfT96p1qvP+h8v@vger.kernel.org
X-Gm-Message-State: AOJu0YxvWtanrsJN9VqEvTDjgV+qv3GhJgdm7ug9avC6Fe6xub1LLEut
	Wd/5UJ6utMoE7AZX1TMeaesvZMufDnrYGeOcFNTs4kYXKjFwp5+wQXWfzrMkHCOV4SVm5bhsZjW
	kopWu7NzlbZyf1BOLnVkQm+YXmR2fMC4kLSn/nSZPoDv3tsMHUsl/RQIxCq8YHjK/2t+z
X-Gm-Gg: Acq92OHbJsJM5qycvgesiakmwLASDVYJdGFXIeYDH8R9oXH+D9kgrNKf2M0cGKBuwsr
	PrN8+pQg1u18uOL5CMTeA6657qaOUR0CWa4BUjnpRgRjgjzxGBDgJ81KGvBEyaxIYNJd54F8cFU
	0VMOzGajTo7++/r5pNoKuyuIgqG4QBItgnevB+xJurvecg063eUoZhh07pv14yyfKv4OiFNglac
	wrXUl83BWfaylmAcDVo54Ajmj44vjfy3et0GpmfS726p/bikg9aStft/m1aFqbE4GlnHGvVao9r
	B/X7KtsX/D1s96MYTbYwM8PxQn+syfeSpDZ1z0OtcmIUSNh1/eiY/rQPK9ntOcGVnlYGY2iejl3
	tC4aCMe8rM5/FPhKEAH+DKBIqgEUyOl3Jc9jjbfNS7KzS+oy2sjbfIZ4DwekVjKu9xXil
X-Received: by 2002:a05:693c:20c4:10b0:303:f26f:df30 with SMTP id 5a478bee46e88-303f26ffa15mr1123777eec.23.1779169648359;
        Mon, 18 May 2026 22:47:28 -0700 (PDT)
X-Received: by 2002:a05:693c:20c4:10b0:303:f26f:df30 with SMTP id 5a478bee46e88-303f26ffa15mr1123767eec.23.1779169647779;
        Mon, 18 May 2026 22:47:27 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302944ffdf0sm16288683eec.8.2026.05.18.22.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 22:47:27 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Mon, 18 May 2026 22:47:18 -0700
Subject: [PATCH RFC v4 7/9] phy: qcom: qmp-pcie: Add link-mode multi-PHY
 probe infrastructure
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-link_mode_0519-v4-7-269cd73cc5d1@oss.qualcomm.com>
References: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
In-Reply-To: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779169640; l=13426;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=vvLE/XhynCZJFbiPcGP3BjnA7ZMMjJOYuddxQHOZH5Q=;
 b=/KJcR0PA7sjQCRfjoE4U1lYQ/PGkehpHN0m1t/Ui6fzkn5ylKL5VgzojWprlaWAfFw14EzrP3
 /CkPizDX4A7ARt75s9oJUdgoQ7/8f3PAWX2jrGQ/nx09MqwU09SRPkZ
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: fGnDOCGdg8uvWajue3JDZl2FvRdKct5W
X-Proofpoint-ORIG-GUID: fGnDOCGdg8uvWajue3JDZl2FvRdKct5W
X-Authority-Analysis: v=2.4 cv=BICDalQG c=1 sm=1 tr=0 ts=6a0bf971 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=qYxDVQDxpuus1MYIwLEA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA1MyBTYWx0ZWRfX3+nvfrOT+2Hj
 7kz7ObjzktN0E/77BRGGgeHxp9WrlYnX/R9wMCjIS2kebJh1camEJB7ePf9bVn0qjdWtfwzrjew
 T9Tbpwi4bxCDPvkyR7ddV8SEE9gNooyslqESiVQWOcMLjnkR41txnIw8FagevYrE9MRF/pI1BCo
 7DRdbobK6WAWnQExEIACmMfmXLqA0bdP9wBOFsx5Wg1j3yqng5VvSOh7e7iirCV4mRB0IRjsRbk
 FZVHSOWK406gZU5XOyJYKk2UgVDhP+eQotKrQUP+Pi1GRZWThxuxQeHb1zzgjfERQrjyr3gs3MS
 qL/CG4wrGMAwNtRNKHSD5FO183bcPdEs8OY+KNxblhkkBagOyFCSfZx5Y/n1lT5japEyFoseFZX
 JUnfgCHRllZwOnqfRM+MnOWJRFuAnG/dhk56kOysMHj6ua1i498cIv2LQWcH65ZYW/c5zx+sOfm
 JaPfjn0QkK0vcAhzD4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190053
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108329-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C7F025778AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some QMP PCIe PHY hardware blocks support multiple link topologies (e.g.
x8 or x4+x4) selected via a TCSR register. The existing probe path has
no way to model this: it assumes a single cfg per DT node and instantiates
exactly one PHY.

Introduce a link-mode probe path where match data carries a per-mode cfg
table. At probe time the driver reads the DT-selected mode, looks up the
corresponding cfg array, and instantiates only the sub-PHYs required by
that mode. A #phy-cells = <1> provider is registered so consumers can
address individual sub-PHYs by index.

Three new data structures support this: qmp_pcie_data holds per-provider
state including the phy array, active mode, and regmap for the mode
register; qmp_pcie_link_mode_cfg maps a mode index to its per-PHY cfg
array; qmp_pcie_match_data is the top-level match data for link-mode
platforms.

On the probe side, qmp_pcie_probe() is reworked to instantiate one
qmp_pcie per active sub-PHY and register the appropriate clock and phy
providers. Per-instance DT parsing and phy object creation are factored
into helpers to keep the probe path clean. The active link mode is written
to the TCSR register at power-on to handle re-initialisation after
low-power transitions.

Platforms without a "link-mode" property continue to use the existing
single-cfg path and of_phy_simple_xlate unchanged.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 351 +++++++++++++++++++++++++++----
 1 file changed, 311 insertions(+), 40 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index b100302be12a..d78d57fb64d6 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -12,6 +12,7 @@
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/phy/pcie.h>
@@ -3342,6 +3343,28 @@ struct qmp_pcie {
 	struct clk_fixed_rate aux_clk_fixed;
 };
 
+struct qmp_pcie_data {
+	struct phy **phys;
+	u32 active_link_mode;
+	int num_phys;
+	struct regmap *link_mode_map;
+	u32 link_mode_offset;
+	struct mutex link_mode_lock;
+
+	int num_pipe_outputs;
+	struct clk_fixed_rate *pipe_out_clks;
+};
+
+struct qmp_pcie_link_mode_cfg {
+	const struct qmp_phy_cfg *cfgs[QMP_PHY_SELECTOR_1 + 1];
+	u32 num_phys;
+};
+
+struct qmp_pcie_match_data {
+	const struct qmp_pcie_link_mode_cfg *mode_cfgs;
+	u32 num_modes;
+};
+
 static bool qphy_checkbits(const void __iomem *base, u32 offset, u32 val)
 {
 	u32 reg;
@@ -4897,6 +4920,27 @@ static int qmp_pcie_exit(struct phy *phy)
 	return 0;
 }
 
+static int qmp_pcie_config_link_mode(struct qmp_pcie *qmp)
+{
+	struct qmp_pcie_data *qmp_data = dev_get_drvdata(qmp->dev);
+	int ret;
+
+	if (!qmp_data)
+		return 0;
+
+	mutex_lock(&qmp_data->link_mode_lock);
+
+	ret = regmap_write(qmp_data->link_mode_map, qmp_data->link_mode_offset,
+			   qmp_data->active_link_mode);
+	if (ret)
+		goto out_unlock;
+
+out_unlock:
+	mutex_unlock(&qmp_data->link_mode_lock);
+
+	return ret;
+}
+
 static int qmp_pcie_power_on(struct phy *phy)
 {
 	struct qmp_pcie *qmp = phy_get_drvdata(phy);
@@ -4907,6 +4951,10 @@ static int qmp_pcie_power_on(struct phy *phy)
 	unsigned int mask, val;
 	int ret;
 
+	ret = qmp_pcie_config_link_mode(qmp);
+	if (ret)
+		return ret;
+
 	/*
 	 * Write CSR register for PHY that doesn't support no_csr reset or has not
 	 * been initialized.
@@ -5229,6 +5277,20 @@ static struct clk_hw *qmp_pcie_clk_hw_get(struct of_phandle_args *clkspec, void
 	return ERR_PTR(-EINVAL);
 }
 
+static struct clk_hw *qmp_pcie_clk_hw_get_link_mode(struct of_phandle_args *clkspec, void *data)
+{
+	struct qmp_pcie_data *qmp_data = data;
+	unsigned int idx = 0;
+
+	if (clkspec->args_count)
+		idx = clkspec->args[0];
+
+	if (idx < (unsigned int)qmp_data->num_pipe_outputs)
+		return &qmp_data->pipe_out_clks[idx].hw;
+
+	return ERR_PTR(-EINVAL);
+}
+
 static int qmp_pcie_register_clocks(struct qmp_pcie *qmp, struct device_node *np)
 {
 	int ret;
@@ -5258,6 +5320,37 @@ static int qmp_pcie_register_clocks(struct qmp_pcie *qmp, struct device_node *np
 	return devm_add_action_or_reset(qmp->dev, phy_clk_release_provider, np);
 }
 
+static int qmp_pcie_register_clocks_link_mode(struct device *dev,
+					      struct device_node *np,
+					      struct qmp_pcie_data *qmp_data)
+{
+	int num_pipe_outputs;
+	int i;
+	int ret;
+
+	num_pipe_outputs = of_property_count_strings(np, "clock-output-names");
+	if (num_pipe_outputs < 0)
+		num_pipe_outputs = 1;
+
+	qmp_data->num_pipe_outputs = num_pipe_outputs;
+	qmp_data->pipe_out_clks = devm_kcalloc(dev, num_pipe_outputs,
+					       sizeof(*qmp_data->pipe_out_clks), GFP_KERNEL);
+	if (!qmp_data->pipe_out_clks)
+		return -ENOMEM;
+
+	for (i = 0; i < num_pipe_outputs; i++) {
+		ret = __phy_pipe_clk_register(dev, np, i, &qmp_data->pipe_out_clks[i]);
+		if (ret)
+			return ret;
+	}
+
+	ret = of_clk_add_hw_provider(np, qmp_pcie_clk_hw_get_link_mode, qmp_data);
+	if (ret)
+		return ret;
+
+	return devm_add_action_or_reset(dev, phy_clk_release_provider, np);
+}
+
 static int qmp_pcie_parse_dt_legacy(struct qmp_pcie *qmp, struct device_node *np)
 {
 	struct platform_device *pdev = to_platform_device(qmp->dev);
@@ -5437,36 +5530,102 @@ static int qmp_pcie_parse_dt(struct qmp_pcie *qmp)
 	return 0;
 }
 
-static int qmp_pcie_probe(struct platform_device *pdev)
+static int qmp_pcie_read_link_mode(struct device *dev, struct regmap **mode_map,
+				   u32 *mode_offset,
+				   u32 *active_link_mode,
+				   u32 *hw_link_mode)
 {
-	struct dev_pm_domain_list *pd_list;
-	struct device *dev = &pdev->dev;
-	struct phy_provider *phy_provider;
-	struct device_node *np;
-	struct qmp_pcie *qmp;
-	struct phy *phy;
+	struct regmap *map;
+	unsigned int args[2];
+	unsigned int mode;
 	int ret;
 
-	qmp = devm_kzalloc(dev, sizeof(*qmp), GFP_KERNEL);
-	if (!qmp)
+	map = syscon_regmap_lookup_by_phandle_args(dev->of_node, "qcom,link-mode",
+						   ARRAY_SIZE(args), args);
+	if (IS_ERR(map))
+		return PTR_ERR(map);
+
+	ret = regmap_read(map, args[0], &mode);
+	if (ret)
+		return ret;
+
+	*mode_map = map;
+	*mode_offset = args[0];
+	*active_link_mode = args[1];
+	*hw_link_mode = mode;
+
+	return 0;
+}
+
+static int qmp_pcie_validate_link_mode(struct device *dev,
+				       const struct qmp_pcie_link_mode_cfg *mode_cfg,
+				       u32 active_link_mode, u32 hw_link_mode)
+{
+	int i;
+
+	if (active_link_mode == hw_link_mode)
+		return 0;
+
+	for (i = 0; i < mode_cfg->num_phys; i++) {
+		const struct qmp_phy_cfg *cfg = mode_cfg->cfgs[i];
+
+		if (!cfg || !cfg->tbls.serdes_num) {
+			dev_err(dev,
+				"missing phy settings for link-mode %u, logical-phy %d (hw=%u)\n",
+				active_link_mode, i, hw_link_mode);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static int qmp_pcie_parse_dt_non_primary(struct qmp_pcie *qmp)
+{
+	struct platform_device *pdev = to_platform_device(qmp->dev);
+	struct device *dev = qmp->dev;
+	char *pipe_clk_name;
+	char *pipediv2_clk_name;
+	void __iomem *base;
+
+	base = devm_platform_ioremap_resource(pdev, qmp->id);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	pipe_clk_name = devm_kasprintf(dev, GFP_KERNEL, "pipe_%c", 'a' + qmp->id);
+	pipediv2_clk_name = devm_kasprintf(dev, GFP_KERNEL, "pipediv2_%c", 'a' + qmp->id);
+	if (!pipe_clk_name || !pipediv2_clk_name)
 		return -ENOMEM;
 
-	qmp->dev = dev;
+	return qmp_pcie_parse_dt_common(qmp, base, pipe_clk_name, pipediv2_clk_name);
+}
+
+static int qmp_pcie_probe_phy(struct qmp_pcie *qmp, struct device_node *np,
+			      struct phy **out_phy)
+{
+	struct device *dev = qmp->dev;
+	struct device_node *phy_np;
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	int ret;
 
-	qmp->cfg = of_device_get_match_data(dev);
-	if (!qmp->cfg)
+	if (!cfg)
 		return -EINVAL;
 
-	WARN_ON_ONCE(!qmp->cfg->pwrdn_ctrl);
-	WARN_ON_ONCE(!qmp->cfg->phy_status);
+	WARN_ON_ONCE(!cfg->pwrdn_ctrl);
+	WARN_ON_ONCE(!cfg->phy_status);
 
-	ret = devm_pm_domain_attach_list(dev, NULL, &pd_list);
-	if (ret < 0 && ret != -EEXIST) {
-		dev_err(dev, "Failed to attach power domain\n");
-		return ret;
-	}
+	qmp->mode = PHY_MODE_PCIE_RC;
 
-	ret = devm_pm_runtime_enable(dev);
+	if (qmp->id == QMP_PHY_SELECTOR_0) {
+		phy_np = np;
+		if (np != dev->of_node)
+			ret = qmp_pcie_parse_dt_legacy(qmp, np);
+		else
+			ret = qmp_pcie_parse_dt(qmp);
+	} else {
+		phy_np = dev->of_node;
+		ret = qmp_pcie_parse_dt_non_primary(qmp);
+	}
 	if (ret)
 		return ret;
 
@@ -5482,35 +5641,147 @@ static int qmp_pcie_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	/* Check for legacy binding with child node. */
-	np = of_get_next_available_child(dev->of_node, NULL);
-	if (np) {
-		ret = qmp_pcie_parse_dt_legacy(qmp, np);
-	} else {
-		np = of_node_get(dev->of_node);
-		ret = qmp_pcie_parse_dt(qmp);
+	*out_phy = devm_phy_create(dev, phy_np, &qmp_pcie_phy_ops);
+	if (IS_ERR(*out_phy)) {
+		ret = PTR_ERR(*out_phy);
+		return ret;
 	}
-	if (ret)
-		goto err_node_put;
 
-	ret = qmp_pcie_register_clocks(qmp, np);
+	phy_set_drvdata(*out_phy, qmp);
+
+	return 0;
+}
+
+static struct phy *qmp_pcie_link_mode_xlate(struct device *dev,
+					    const struct of_phandle_args *args)
+{
+	struct qmp_pcie_data *qmp_data = dev_get_drvdata(dev);
+	unsigned int idx;
+
+	if (!qmp_data)
+		return ERR_PTR(-EINVAL);
+
+	if (args->args_count < 1)
+		return ERR_PTR(-EINVAL);
+
+	idx = args->args[0];
+
+	if (idx < (unsigned int)qmp_data->num_phys)
+		return qmp_data->phys[idx] ?: ERR_PTR(-EINVAL);
+
+	return ERR_PTR(-EINVAL);
+}
+
+static int qmp_pcie_probe(struct platform_device *pdev)
+{
+	struct dev_pm_domain_list *pd_list;
+	struct device *dev = &pdev->dev;
+	struct device_node *np = NULL;
+	struct phy_provider *phy_provider;
+	const struct qmp_phy_cfg *cfg = NULL;
+	const struct qmp_pcie_match_data *mode_data;
+	const struct qmp_pcie_link_mode_cfg *mode_cfg;
+	const void *match_data;
+	struct qmp_pcie_data *qmp_data = NULL;
+	struct regmap *link_mode_map = NULL;
+	struct qmp_pcie *qmp;
+	struct phy **phys;
+	u32 link_mode_offset = 0;
+	u32 hw_link_mode = 0;
+	u32 link_mode = 0;
+	bool use_link_mode = false;
+	int i;
+	int num_phys = 1;
+	int ret;
+
+	ret = devm_pm_domain_attach_list(dev, NULL, &pd_list);
+	if (ret < 0 && ret != -EEXIST) {
+		dev_err(dev, "Failed to attach power domain\n");
+		return ret;
+	}
+
+	ret = devm_pm_runtime_enable(dev);
 	if (ret)
-		goto err_node_put;
+		return ret;
 
-	qmp->mode = PHY_MODE_PCIE_RC;
+	match_data = of_device_get_match_data(dev);
+	if (!match_data)
+		return -EINVAL;
+
+	ret = qmp_pcie_read_link_mode(dev, &link_mode_map, &link_mode_offset,
+				      &link_mode, &hw_link_mode);
+	if (ret == -ENOENT)
+		cfg = match_data;
+	else if (ret)
+		return dev_err_probe(dev, ret, "failed to read qcom,link-mode\n");
+
+	if (!ret) {
+		use_link_mode = true;
+		mode_data = match_data;
+		if (link_mode >= mode_data->num_modes) {
+			dev_err(dev, "invalid qcom,link-mode: %u\n", link_mode);
+			return -EINVAL;
+		}
 
-	phy = devm_phy_create(dev, np, &qmp_pcie_phy_ops);
-	if (IS_ERR(phy)) {
-		ret = PTR_ERR(phy);
-		dev_err(dev, "failed to create PHY: %d\n", ret);
-		goto err_node_put;
+		mode_cfg = &mode_data->mode_cfgs[link_mode];
+		num_phys = mode_cfg->num_phys;
+
+		ret = qmp_pcie_validate_link_mode(dev, mode_cfg, link_mode, hw_link_mode);
+		if (ret)
+			return ret;
 	}
 
-	phy_set_drvdata(phy, qmp);
+	qmp = devm_kcalloc(dev, num_phys, sizeof(*qmp), GFP_KERNEL);
+	if (!qmp)
+		return -ENOMEM;
 
-	of_node_put(np);
+	phys = devm_kcalloc(dev, num_phys, sizeof(*phys), GFP_KERNEL);
+	if (!phys)
+		return -ENOMEM;
+
+	if (use_link_mode) {
+		qmp_data = devm_kzalloc(dev, sizeof(*qmp_data), GFP_KERNEL);
+		if (!qmp_data)
+			return -ENOMEM;
+		qmp_data->phys = phys;
+		qmp_data->active_link_mode = link_mode;
+		qmp_data->link_mode_map = link_mode_map;
+		qmp_data->link_mode_offset = link_mode_offset;
+		qmp_data->num_phys = num_phys;
+		mutex_init(&qmp_data->link_mode_lock);
+	}
+
+	np = of_get_next_available_child(dev->of_node, NULL);
+	if (!np)
+		np = of_node_get(dev->of_node);
+
+	for (i = 0; i < num_phys; i++) {
+		const struct qmp_phy_cfg *phy_cfg = use_link_mode ? mode_cfg->cfgs[i] : cfg;
 
-	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+		qmp[i].dev = dev;
+		qmp[i].id = i;
+		qmp[i].cfg = phy_cfg;
+		ret = qmp_pcie_probe_phy(&qmp[i], np, &phys[i]);
+		if (ret)
+			goto err_node_put;
+	}
+
+	if (use_link_mode) {
+		ret = qmp_pcie_register_clocks_link_mode(dev, np, qmp_data);
+		if (ret)
+			goto err_node_put;
+
+		dev_set_drvdata(dev, qmp_data);
+		phy_provider = devm_of_phy_provider_register(dev, qmp_pcie_link_mode_xlate);
+	} else {
+		ret = qmp_pcie_register_clocks(qmp, np);
+		if (ret)
+			goto err_node_put;
+
+		phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	}
+
+	of_node_put(np);
 
 	return PTR_ERR_OR_ZERO(phy_provider);
 

-- 
2.34.1


