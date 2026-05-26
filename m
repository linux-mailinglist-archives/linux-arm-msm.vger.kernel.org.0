Return-Path: <linux-arm-msm+bounces-109918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JluKNTrFWogfAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 20:52:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F145DB93F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 20:52:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D5BB8309F249
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 18:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3F1838C42D;
	Tue, 26 May 2026 18:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bsq1qyYX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NWEJNWf0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AED34219EB
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 18:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779821077; cv=none; b=fdXfrguYilxru9rmMY5gXkpOny1QSENHXFF6GExzjGZLpbN4H3PyuqOssOEfvJ4l5nZb2pZNP5Gmt0guQJUeNtC22MzdLbX2wMHMULnNVqmMhZkFn1dg/3nWkKN7jqe3WduJB2c0xOQdTdnKBmGNB17ff9H8uFdunFY/LF26Sbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779821077; c=relaxed/simple;
	bh=jeAKj0RWs2bn/MG2dIU3ko03hpgyCE248uGV4oULRcA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QEofkKvBWdhKJu4Nk08Ppse1kbY4+mSE4NzTsuvBIwOKECQal6CaZ5uVuOHZaloY/00zZGc0Dn27by5GYys0CFSidG2Ruh+cfgfhIP58cVUoYvlWPpxoSSwgQ3GRHn7A3I3Z8QbOzW+Jt54Ur+0y7miXYhoKatJo0fPm9Z/wnqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bsq1qyYX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NWEJNWf0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QH1dj1069510
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 18:44:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OjYc9twIj7K
	xaKaSOCBEljXetjS6PpryUwHzkWxhVKo=; b=Bsq1qyYX+xFzR1iy3WfMF/sfaiz
	P+kn0W7vuOrvWy7U9r/C/IcUG9kE/wjaVXdxyt3zUC1vKDGk46Q053NXHPzdK5kd
	GZL1ms7zA+IO3CKu+vHvFxEDLl+3m2yKWalnOCkJ0ND5te0hXgI+KqwiKHFwpayx
	jfMwOUMA7Z/ujAcwgtTZA4ten9IgkVmucTetDpyeQ8JKDihxPeS8iQwRogJmeyTB
	YpjXM7DBbsWv1HtODGQdzQWC5xhaik7eULonOK02ahybIf0iXGGEbDuYymqFoA3T
	uyChMBlMcfATCpi75lU0+iI3j9K8oYVk4EX9LwQ71P/Lt2zQ8W1J37JYXvQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edc2yhpac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 18:44:35 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-365d8e0efaeso2430439a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 11:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779821075; x=1780425875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OjYc9twIj7KxaKaSOCBEljXetjS6PpryUwHzkWxhVKo=;
        b=NWEJNWf0pRHaphQWXQOVG1XtybZlNlHOycqBmJGDcDUFJjO5o/kLLF2kSOJbYZyVEo
         svY5eE1cxD0PfT5//riqh0PyC994VH7CNQLqLj8jS49RY4oO0FMIXCvFW2plPvBWru5E
         dkPZ4AJbqq3FcuNxi5YnbWEMNAUvYoNLw2ombgPklCoZKO/WDpgbDpPUvLX459i74jDZ
         iNqJtHFPzQXeuYQGp2Ng4/tlPtofdLwB2lrIPmPoEGne+Umj28HRnxtPazQLZt7B63tP
         /O0rLB5gSbVRb+Uq7yQKydoJMan5cmwuWcLzRTFy5php4KP4uvod0gaCmrH1gU5ZM6mb
         W7AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779821075; x=1780425875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OjYc9twIj7KxaKaSOCBEljXetjS6PpryUwHzkWxhVKo=;
        b=Pph7RO4073ZPuWRdrsRmYsXXHIOIO01d23d9CdW7Cbf0tmwGWxg2RvvVad+jFEr93n
         CULRPUoZOpZIk0kFIhwv+54izyipkCuuBsVphGDihI1PAx1QC87pB1eKnq+FtQ5SSJOS
         1k51yQXmcELkvIBJzut+SuGX6ux0KsE0K81lZbnfBzdaG5v7PnFjvOZPthABsg8nxbQA
         RcU32+wy2CDYccEhn+FnOqVmyad5o8onm7dRcVD2d0WfkMJep9uQpJ5cl36fYxSEZ5Zj
         8CDDmIaFMD0zMWRXd8TWKLERvzsD8kIcPZPZxiuIvXakS1L7IN9CuSnczotqZqZr2i83
         mwCg==
X-Gm-Message-State: AOJu0YwcRy69W9o6SlkYBjz6quF8pWeYAIq2owVojFcl8jGxhjpAyCOp
	8du71kRpiviNZgW0n5qjXnzrK2xyZdAJwCo50XhaYiZ0xRy+PLxbxKRcheRI5J9wRf5wbqTiGJW
	fJZtZXR1q8qsvOFkBeoIz9pVJQK7TBiXh98D9kWwhlAKK2C4jxeVuCEtjxNOM7s6GksY=
X-Gm-Gg: Acq92OE4KIRj2AxQX2xB6MHvBP4mbeJsQ8kycPCk0Mvj8MdY62JtvrqF4E0y84umhFO
	Fx1d9fg6Oe+xPPA4Gn2b/BQ13Zh6++RCfpqBLD2BYcqdNW/mq2Clj9u5Cca+aIUd5He32X+V3UC
	Vt7dz28WKp0idQ8pr1JBAhhYMCP1xgbn3RdGqVUQqeRHgduaq0cD3sANfvB+3+L6Sa7NaldFv+i
	2/sJr3vKtEp+2Y8TYOq+SCbCNc3m8n+yw4NNSyawRiAS7sN7+W3OsqOjSRGhEhJGXO/EwjnvQVa
	xThVSpYhLrGpz0/2Sxu/hoIOHvGhdskvkD+qY9+wxCmjX0IVCLvk5cMulK1+tzFLzou0IDQcTih
	kIy1neZvsZLK6cOFK7jw9DQVHAP/SxZwO36/0LCs14twHx8PegdBtFA==
X-Received: by 2002:a17:90b:4b91:b0:36a:5b60:553b with SMTP id 98e67ed59e1d1-36a678c789amr10254039a91.7.1779821075259;
        Tue, 26 May 2026 11:44:35 -0700 (PDT)
X-Received: by 2002:a17:90b:4b91:b0:36a:5b60:553b with SMTP id 98e67ed59e1d1-36a678c789amr10254018a91.7.1779821074763;
        Tue, 26 May 2026 11:44:34 -0700 (PDT)
Received: from hu-ppratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a721c7baasm16866628a91.9.2026.05.26.11.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 11:44:34 -0700 (PDT)
From: Pratham Pratap <pratham.pratap@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>
Subject: [PATCH v3 3/4] phy: qcom-qusb2: Add support for Shikra
Date: Wed, 27 May 2026 00:14:00 +0530
Message-Id: <20260526184401.3959717-4-pratham.pratap@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260526184401.3959717-1-pratham.pratap@oss.qualcomm.com>
References: <20260526184401.3959717-1-pratham.pratap@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: YNsq2wkUc_oSs7TmaahEgbs9D1euiLAu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE2NCBTYWx0ZWRfX72/PPVf4Qv2Y
 C9KibykDOrmWgzmkVw1kU0PYd+e0yQYRvd2jLgagqKSCwedYytPGhd53q3cJKwCCeLPpqWwyWDS
 s2EjPgmt4DxuIyNXaHKBGKSWy4KbZRn8RoUuVrq/O0zejhJ8lUijWj+hXM9kqS/8DkYL7hgyUYP
 5jJpf0Leax67L1cFGUNtNAOu29NqPhVyzEoU8dEA9fXZV879dt8p17Sa+S+C8JTB6cOqO0Pk2Pp
 eoACNnRxygg9ySY7E9Ha+5Q5/k2VruOfHo4s3H1PRfNynrdKflw1pViM2MVoMLSDlaEYouls1lg
 9dyJmlMsPpEhQf8kNdKp1THSbVnnLEV+gEBZyUNuICJKpakJAZt+NVgf6Ro43xKzqgSW3b6HZ6B
 YiZd4SoKZsJn60j+NClRATjrxGGYiHCwr9KfJncMvDcho5LRjPs1YSZD3FnFVK6KQS1USRAufWS
 CF1CDQCZ7L2tV/Yy8UQ==
X-Authority-Analysis: v=2.4 cv=CYg4Irrl c=1 sm=1 tr=0 ts=6a15ea13 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=2jleMYo8EjVMK2M3yooA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: YNsq2wkUc_oSs7TmaahEgbs9D1euiLAu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260164
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109918-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pratham.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E8F145DB93F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Add init sequence and phy configuration for Shikra.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Signed-off-by: Pratham Pratap <pratham.pratap@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index eb93015be841..ab7437e7b751 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -381,6 +381,19 @@ static const struct qusb2_phy_cfg sdm660_phy_cfg = {
 	.autoresume_en	 = BIT(3),
 };
 
+static const struct qusb2_phy_cfg shikra_phy_cfg = {
+	.tbl            = qcs615_init_tbl,
+	.tbl_num        = ARRAY_SIZE(qcs615_init_tbl),
+	.regs           = ipq6018_regs_layout,
+
+	.has_pll_test	= true,
+	.se_clk_scheme_default = true,
+	.disable_ctrl   = CLAMP_N_EN | FREEZIO_N | POWER_DOWN,
+	.mask_core_ready = PLL_LOCKED,
+	.autoresume_en   = BIT(3),
+	.update_tune1_with_efuse = false,
+};
+
 static const struct qusb2_phy_cfg sm6115_phy_cfg = {
 	.tbl		= sm6115_init_tbl,
 	.tbl_num	= ARRAY_SIZE(sm6115_init_tbl),
@@ -958,6 +971,9 @@ static const struct of_device_id qusb2_phy_of_match_table[] = {
 	}, {
 		.compatible	= "qcom,sdm660-qusb2-phy",
 		.data		= &sdm660_phy_cfg,
+	}, {
+		.compatible	= "qcom,shikra-qusb2-phy",
+		.data		= &shikra_phy_cfg,
 	}, {
 		.compatible	= "qcom,sm4250-qusb2-phy",
 		.data		= &sm6115_phy_cfg,
-- 
2.34.1


