Return-Path: <linux-arm-msm+bounces-115769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4LslHhNHRWrN9woAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 18:57:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BA76F00FC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 18:57:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=giOXUSKa;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SK9COP82;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115769-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115769-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 972E4306E51A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 16:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4549C3803F1;
	Wed,  1 Jul 2026 16:51:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A1C372EE9
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 16:51:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782924690; cv=none; b=oQeiIZXqQMz//7MiWAO42ne2zwmHj6nJ7Mu3LvTmN6CjaGnsX3gLjn2KFfMreBZIijTdMeRLwNIkUGxWuBG6Npq3p7HQdV7ST6Ww3bdBcWtjw4ckNw08uZxvgcKXOOWP/d8Ar7s/Uq07WWtAW7lDF3ANacUfB95EuG3cAzcdr28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782924690; c=relaxed/simple;
	bh=9HR3Xd4rmD5sUqSiHMjMhpAeSe2fKm1iaA4AmjsSxAQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=a7S/GZZaMZof5+qG2Hwu8Jcl4TYpii3n0iNl0JVhIBEaej6odZ998vJ+mGAXmCQVznPPbHTFI843zo5qmSTqeHaV/PzmQI5PerXl3LS4a/N6H5bXlVwGz1ieMh164bOaKraWvO6WA4cM6BJiVXyKeTa3T3/84V9glJpZhc5kqPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=giOXUSKa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SK9COP82; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661GmXAH1630420
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 16:51:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=j56RPVoQs/E
	HqShchuuBXHfNfL9pTjlMbfxbxuh9Cys=; b=giOXUSKaJro+n24ejMoiOwvUF88
	DNqr+xgBKL0TYNnOoAO6RsB8hOBjGdZlCw8yjaOKD4OTSb35jfqnvpAYgVSgiTlZ
	5aoq3Fj42nrXd9sG1utSkYurlV1td1ymzgujUDp9eJcniq5liWTBZV3O2+CoGxnD
	dMW3eHzm1A/kabH0j4UDTEz7Pf4zHrO8lWM2qtPhJICbB4CuYxrV5Zy8s6yytk29
	r1/CQuZzhmtv8hlNacxlNLruOaiDqGGIkoX1aa7Pak+gZRCk4zCXE9IZgNavhPiT
	ibRjmhrfERv7qLu5966WIQUOggCBFIhhSI/dIv0l1fmzKchgOfcD/soD+sw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f563mg6hn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 16:51:28 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37ca4367860so1613953a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 09:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782924688; x=1783529488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j56RPVoQs/EHqShchuuBXHfNfL9pTjlMbfxbxuh9Cys=;
        b=SK9COP824rIQePZAQlaxmsx9SVrCzjYISUJLGSNLU2e6+oHzwxhbYA/s7IO96G8+I+
         ydWu7ORebhHJw3Nd7ASn0t/HhYt7y9dwT85sQzXn3tzA92enk7t4f/M4RTcfivNegBmf
         4VaFOH1rPQIEZCj8drSN5U4vHy5637QiEN81LdoFinjDwUvMl0nGvLi2T0Bgyu+OKzx1
         7fFjRJLE/6FNXPLF57oNRzdtyQmQ6hMSzP+VMiP6ylJes5FMJI13L0EfbH3OEZG1gLmV
         u69ORzJOVykL4f0p3qE284C3QFn/D+rwWm8n/zznBJvXM61Ku/ntLfxaFS0cf37RCDyA
         JA5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782924688; x=1783529488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j56RPVoQs/EHqShchuuBXHfNfL9pTjlMbfxbxuh9Cys=;
        b=ae7CBxIlay9Mk5BKQ4jfWJclQs7ZhMCfQiz3KGAh7FJYIHmsSEevcnEPBkwf9s69QI
         dhGuF+QDRuZZfTG21pyfUYGUja3wEfWds+qeIv0yYHK9Hwp6VNAR2EYAu4qsaXYL0a8j
         eQ4gsPGbq5b0BV41ldN7TOdVWgSBNvHKi2hY9VrqosM6qHbBEC1RAYlMONNlBmQ/jegS
         uakmCTZgt7vMEUeXenWOE3feUHvWOQzCagd0fTUh0baInXQowehZjoQWxqfz9g30KIlr
         wN79axAV5BfuinJNivfULE+6mEiL0jNTs4TFfJBMUWiATQJ2FwhsWerfTB+zTkrddDYY
         ANDQ==
X-Gm-Message-State: AOJu0Yw71NWBPsY0+do89tbodRPz2nWRvgXlOeVzg8jLfx1YUXm8RmOY
	w6ndO+eb1dSrHTBvp+RhC0wZ5W8Fyx0eCuXez6cKkXvCdXncITsWSWEgnl1mqyvwpaOaLJoIj+U
	Tn7az/on3yMfWwlsVVCFv9Ye6cXet1LqUlCmX5KMqSrwxqfpfJMMbk37zBHFL149DGadg
X-Gm-Gg: AfdE7cm+kYbWcpS+Ojkze1j9x5Q15G6+rKAjvsj6mMX7j45z6LdLlu2yMElxH+N9h9a
	tVMrTzh5kORGnnkqLHQCNYHRH2QoO4NAq9YO7o0tMqydo/j4mk0T4O186YKKPUqxPaqSSO3rDjg
	Ks3VOJglKs07gdOmwLQTbgFMHQJntVkCcW5/QW1P95zXo9q9clHuUGTyJYfVcvGPnyn5OHhvJg5
	DaYF/84a2BuhaPsZT14KMktFLUrDD6Khy60cd1IuBF7qQtAhexofgiNT0dVHf9OcM8tF5tn5jNa
	GEexEv4inxdh8CqamMjMIM1SPVLWQXcKOTX1OrX4sBY5PELGZjtBJlXHNhiP4dJLSjELosHg001
	kZXeNY/mfjoGyWEmRQ6F1CSi30l3B7XZ0lfkBkCiqndjmf4jGvKOR5TCJlDJObuv56Vu0y1p4RN
	m+PoBl
X-Received: by 2002:a17:90b:2d85:b0:36d:b12b:f57d with SMTP id 98e67ed59e1d1-380695869c3mr5471912a91.12.1782924687659;
        Wed, 01 Jul 2026 09:51:27 -0700 (PDT)
X-Received: by 2002:a17:90b:2d85:b0:36d:b12b:f57d with SMTP id 98e67ed59e1d1-380695869c3mr5471863a91.12.1782924687216;
        Wed, 01 Jul 2026 09:51:27 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee317095dsm33038935eec.15.2026.07.01.09.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:51:26 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v4 3/4] phy: qcom-qusb2: Add support for Shikra
Date: Wed,  1 Jul 2026 22:20:50 +0530
Message-Id: <20260701165051.4122259-4-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260701165051.4122259-1-krishna.kurapati@oss.qualcomm.com>
References: <20260701165051.4122259-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: gwBIJJn-TyVShqX6VQOY98MZDGmLKY31
X-Proofpoint-ORIG-GUID: gwBIJJn-TyVShqX6VQOY98MZDGmLKY31
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE3OCBTYWx0ZWRfXxrEB1eGubcPN
 0SPcVHM0G60GUhpdMSfYD4Xkr/MDHk5zJ27EIcP80yUTywWXFH8M5v4gfH/Uhw8TBLD1RNLubS8
 Xkbe/0+KfeU3tw/LgWcWXO/uoTuk9n8VqgMLJ84DdlLkIp4B7+2QHmaGoKZRu7JgwFAtaQYb9+/
 4k9ns8Z9ObsEhSd2h/qfojDGqpLXfi0u5CrC2i6WQgv6lQfwRHFMEzw7jY7fbJsycSUK9oy1hkB
 eh9ZfJYEZJHpLieFrPEIVLIeNkf/xVL7fw0uJWcutlckLRaQCbyPJrTivJiPiJp2P4MvYDQdXQh
 S5YfIY3/WNGxCaeFvy1HGdyt3GZs838U8Xu29cx2ht/udaYxnGaJYi1jnOe11hOcRT/dBKMikHp
 gmzaEKMVO87HmndMz2oB58mh+Jm/ttA/j9jx2ql/qlzvE46/83swNyQ3COL9w17vhG3BeGMEUe0
 u+a7FJs9f3Hbs41LrWw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE3OCBTYWx0ZWRfX6ISIOQqx3BwT
 i6Tx4S3DZ7RfwBWN4sz99/W7aTpzRWi+XExw2Q1Xi/tWeob00YPq+2FmHL7Egsu9SKskKsDbff1
 cd3bQ4gFFVHaffHjDosFf6CEC64+t5w=
X-Authority-Analysis: v=2.4 cv=UopT8ewB c=1 sm=1 tr=0 ts=6a454590 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=Fn7aRh_OGbpVAvsfffcA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010178
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115769-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:vkoul@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:xiangxu.yin@oss.qualcomm.com,m:johan+linaro@kernel.org,m:loic.poulain@oss.qualcomm.com,m:shengchao.guo@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:wesley.cheng@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.kurapati@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:johan@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 25BA76F00FC

Add init sequence and phy configuration for Shikra.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
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


