Return-Path: <linux-arm-msm+bounces-97681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DDmJkbvtGm/uQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 06:16:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C4128BC18
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 06:16:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7EC8630BBEBA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 05:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FF7034EEE8;
	Sat, 14 Mar 2026 05:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oUKq/TBh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LRIC7gpW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C1134F24A
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 05:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773465279; cv=none; b=JouDp4Ez1ZbMm4a1rqwzMK490sgqofMR1YLPw5eNzAp/NN7X8/+k2qTlOyl9UMLBAVVHYEaSed7r9QMU3wgpBvRT6QnI7kP0jnDZv3o7bhLE9xAuquLqZ01dMSC2n+Hf6++/5O+SELiXukCQWc6HX+n9TmAvCsOi8DzRsPhd6uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773465279; c=relaxed/simple;
	bh=R5pBNcEPa4QwUC9qHRuUBfaydPXuwi+4YjH+F5br9qw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DPhju7M5xhukpeRQEOcx/J0w5AsuMzDzSntm3Otj518tAn2Teg+JCDOL+e4FJnVWaz7AfuEqYXb38+S74rtaNUMdTwDm5sOn8eUoVKDOCqe6cSYabfy10tfQ7Q+lcedxzNqF1Wv4R+ckuJp66Yx/V33zpn1uJ98V2avMTzelwrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oUKq/TBh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LRIC7gpW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62E3n9FE2537641
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 05:14:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=W+O9wnUc0BV
	uNOqySW59HE3hd1+OnCD6FN9BarAEYVk=; b=oUKq/TBhLPLk85a4QdvGAwgNHwa
	EbJ/yzPRBPplSuT2brKkWzD1DEzhvGVDT7Su9G0iJdjQOtYK/aRQInSmiOa9vuBj
	dJTfE+LdOLoYAm2+J2Je7OhFDh0vrdit5//mAIx40BpT9XHELLQTTJOPBzS3Kpeo
	FijodJFHsGZPmGCGv0j8M7k400xqlqLJ1nl/L6S/wrKTZ4tNOV63vG3Q+7wSR/X8
	CEjZNt6Bx36D8NuQRpTJ4h9sBjtJ93eZxXORFR4ol1+ofTZEoB7CH3NY4JNsu0mm
	vlpcG0TftkEgUXBhXSfqBmlVVOcQ5bRBenGtvsqz6AvpLTEMm63+KRiKrLQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw03qg46n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 05:14:34 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2bea8c63e78so1134962eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 22:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773465273; x=1774070073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W+O9wnUc0BVuNOqySW59HE3hd1+OnCD6FN9BarAEYVk=;
        b=LRIC7gpWSOWnAskY0JiB7HrdyWPycZD+8uWX0/WMcMntPXTOL1UPexA6tuJwNtENnO
         TXs9dGRm/gW8czgFCFupPpt2XCRKv6R2T45++HIerbb/5or9/omp/pMIjYlzJ9xFpivT
         I2eK9HoNcirHReflLYur//fYy22PmCO5NDcPQHfyRczh1mMVNxNzNNLIsLbbncguJVNd
         3wgIPnPchEY5zcT63pmdZwPgz2nzxlas+eqhz4LoM2FkIS7bn7JWmFTFogZVaaImAHOq
         xgnMg287OqdCjPOkU6wqOI999V5+tc65lKGecKUVLe49nOTzpyDk6/FGxv76tlgemmGi
         jYeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773465273; x=1774070073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W+O9wnUc0BVuNOqySW59HE3hd1+OnCD6FN9BarAEYVk=;
        b=V29JsMOMuaKWi88IHkwRz1KrzIWSRXHNO5dYsDh7R4WgfeycO8H75Mscjz/rB6FNTQ
         1KVArMZiUXjLs8rjNceBGAiMo+VQgsOrqUnQXNgtpo3p4O0p0nyfNQZBRc4PrLCsTLZT
         LZuvctyhP5WqpBCJ8E/+68qQNcOHu1yYqjEdHpiQSbs7kaIqDVJL0niP/Qf5ZcB9pfgs
         R6YRN/H1WZ59wDXDW782BANhmjE4ODiGvw5g6Mi7juhSAMQM18ly/dmtXYjJFIfUl6Lb
         abW6XUsSfpfr2B0VdCWxNLrcH/aXkNqKn5b4CxC12p4kw4QRp64kpWoJCMctuN4tsdH8
         VnYw==
X-Forwarded-Encrypted: i=1; AJvYcCUofP4ZYM74NLdP3t2pK4vC371G0Qx03wjmU1GpkZCA4VMGdEU4UXh47LqSuX58bWgMi79E2KI67mGgex1A@vger.kernel.org
X-Gm-Message-State: AOJu0YzsrifQ+GR1SDCT6d9iGRe1z3oR9UGiiNxOIr2sWItn+U99wctq
	jFCIAGpMCVW58/Nq+vd3PgACu/YneDyPCi/1TKwOmEpnyKTBOAG6mFkXwOzOMysFmq0SGZEOCDw
	SosLfYfTqyg3OjfZAj2zLU4RkLwel1TGe7Z0Hihe6llhJw1sANAhhRdH2+K1aYgZYJHCn
X-Gm-Gg: ATEYQzyOEdGCZjCHR6/SLg46ySF1Iovfzr3C9sTcDL80sZnZaK4QxcBVqLmzoVIqHLQ
	GP2fAq9/s+CJzAVqmr4slJLf2XbFbIRtIToA9NRJov1kX+zs7R7taXgobEzhDWacEXpJS3ZfqER
	AhXjZv3zV/YTMh6bd8jX0rmU1uaLjK8CNlDp/bLZUXdQEBxVUEhTbFp+1rqd1XTBHeQy4V6oHUi
	/wlStEHlebZtx8rJnPjA7zanvaFLNSj7imSk5vcd581YX32vhju4ANZ+gWrLoOtFE4igf6ItMbL
	1z75pPT00RWXToCgfYJstdZME0nEijdtR18BTc4uTYQVdUon8aLD2hP18+uXdesgKJcSBjagCej
	wVc/enLyDXwFYQPMKwUBB1M4Xo/r+wBw5+f4s7cCzXX/ljVeTWEtiziGMQMIYOi8LyuFNJCzjQ+
	Ei5ALTaQ==
X-Received: by 2002:a05:7300:bc19:b0:2b7:fdb6:ccc2 with SMTP id 5a478bee46e88-2bea545498fmr2542586eec.16.1773465273336;
        Fri, 13 Mar 2026 22:14:33 -0700 (PDT)
X-Received: by 2002:a05:7300:bc19:b0:2b7:fdb6:ccc2 with SMTP id 5a478bee46e88-2bea545498fmr2542581eec.16.1773465272819;
        Fri, 13 Mar 2026 22:14:32 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c098cbd4dasm1784045eec.0.2026.03.13.22.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 22:14:32 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 4/6] phy: qcom-qmp-usbc: Rename QCS615 DP PHY variables and functions
Date: Sat, 14 Mar 2026 13:13:23 +0800
Message-ID: <20260314051325.198137-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260314051325.198137-1-shengchao.guo@oss.qualcomm.com>
References: <20260314051325.198137-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: wzYvmjcNIOGTDWxT4URdRK-brMkwiTvt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE0MDAzOCBTYWx0ZWRfX57EuS2Vc1y8J
 EmPsfU6/2Dv3W105u9g/f9PftS16RM9GpD8X7zQQnhUxhdF28LkG7AHQJm2/RfFnxVtGqPlLCvL
 hMF8c+PLayHUTUd3eTkJLanIZCBF9AP5lE1CF+sNa6OtaTCtRzabLwg9DkOBBobc4psiJoqMdkI
 X/0zEyWl5E8SVHiUPoo8CfdMrVNvGrcmeUwH2K1H6zUkl4tUvSyfsQ/ocUiQ/kWx8D7M5s672Q6
 RGUmnUTAMWBmOJkcP9RIt7fse8OBst8Py6l2E/v4SU1NSJW0pJ9XWr2YUu0PzZmcQdUV0oh/4dG
 lTIIqbAS+H5PQGN3CETIxVRmecMFcEvSOs+ldInbaaIzEtfYJWUiQBVzEegc1MkFRE0qnX0tmtJ
 iB7+QkD0CP/UKj7RBCxiggAbuuQ2vRcOs1+fWhlEbSYE0xXmoAU/NsO/CAtF2QceG4050H3sqeP
 HSXYGrvjwCkReVu7wpg==
X-Proofpoint-ORIG-GUID: wzYvmjcNIOGTDWxT4URdRK-brMkwiTvt
X-Authority-Analysis: v=2.4 cv=ZbQQ98VA c=1 sm=1 tr=0 ts=69b4eeba cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=BQofoxfB7IYdQntn66wA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-14_01,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603140038
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-97681-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 14C4128BC18
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Commit 81791c45c8e0 ("phy: qcom: qmp-usbc: Add QCS615 USB/DP PHY config
and DP mode support") chose to name  QCS615 DP PHY variables/functions
with qmp_v2 prefix, by assuming that QMP PHY registers are versioned
as a whole.  However, the reality is that the registers are versioned
in sub-modules like QSERDES COM and QSERDES TXRX respectively, e.g.
QCS615 DP PHY has registers of QSERDES COM v2 and QSERDES TXRX v3.
Thus it may cause confusion that qmp_v2_xxx table and functions access
QSERDES TXRX v3 registers.

Rename QCS615 DP PHY variables and functions to be prefixed by qcs615
instead of qmp_v2.  This better aligns with how the driver names USB3 PHY
variables for QCM2290 etc.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 66 ++++++++++++------------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 3f8c4280b933..edfc1ae68f49 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -290,7 +290,7 @@ static const struct qmp_phy_init_tbl qcm2290_usb3_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RX_SIGDET_LVL, 0x88),
 };
 
-static const struct qmp_phy_init_tbl qmp_v2_dp_serdes_tbl[] = {
+static const struct qmp_phy_init_tbl qcs615_dp_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V2_COM_SVS_MODE_CLK_SEL, 0x01),
 	QMP_PHY_INIT_CFG(QSERDES_V2_COM_SYSCLK_EN_SEL, 0x37),
 	QMP_PHY_INIT_CFG(QSERDES_V2_COM_CLK_SELECT, 0x00),
@@ -317,7 +317,7 @@ static const struct qmp_phy_init_tbl qmp_v2_dp_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V2_COM_CMN_CONFIG, 0x02),
 };
 
-static const struct qmp_phy_init_tbl qmp_v2_dp_serdes_tbl_rbr[] = {
+static const struct qmp_phy_init_tbl qcs615_dp_serdes_tbl_rbr[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V2_COM_HSCLK_SEL, 0x2c),
 	QMP_PHY_INIT_CFG(QSERDES_V2_COM_DEC_START_MODE0, 0x69),
 	QMP_PHY_INIT_CFG(QSERDES_V2_COM_DIV_FRAC_START1_MODE0, 0x00),
@@ -328,7 +328,7 @@ static const struct qmp_phy_init_tbl qmp_v2_dp_serdes_tbl_rbr[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V2_COM_LOCK_CMP3_MODE0, 0x00),
 };
 
-static const struct qmp_phy_init_tbl qmp_v2_dp_serdes_tbl_hbr[] = {
+static const struct qmp_phy_init_tbl qcs615_dp_serdes_tbl_hbr[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V2_COM_HSCLK_SEL, 0x24),
 	QMP_PHY_INIT_CFG(QSERDES_V2_COM_DEC_START_MODE0, 0x69),
 	QMP_PHY_INIT_CFG(QSERDES_V2_COM_DIV_FRAC_START1_MODE0, 0x00),
@@ -339,7 +339,7 @@ static const struct qmp_phy_init_tbl qmp_v2_dp_serdes_tbl_hbr[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V2_COM_LOCK_CMP3_MODE0, 0x00),
 };
 
-static const struct qmp_phy_init_tbl qmp_v2_dp_serdes_tbl_hbr2[] = {
+static const struct qmp_phy_init_tbl qcs615_dp_serdes_tbl_hbr2[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V2_COM_HSCLK_SEL, 0x20),
 	QMP_PHY_INIT_CFG(QSERDES_V2_COM_DEC_START_MODE0, 0x8c),
 	QMP_PHY_INIT_CFG(QSERDES_V2_COM_DIV_FRAC_START1_MODE0, 0x00),
@@ -350,7 +350,7 @@ static const struct qmp_phy_init_tbl qmp_v2_dp_serdes_tbl_hbr2[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V2_COM_LOCK_CMP3_MODE0, 0x00),
 };
 
-static const struct qmp_phy_init_tbl qmp_v2_dp_tx_tbl[] = {
+static const struct qmp_phy_init_tbl qcs615_dp_tx_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V3_TX_TRANSCEIVER_BIAS_EN, 0x1a),
 	QMP_PHY_INIT_CFG(QSERDES_V3_TX_VMODE_CTRL1, 0x40),
 	QMP_PHY_INIT_CFG(QSERDES_V3_TX_PRE_STALL_LDO_BOOST_EN, 0x30),
@@ -555,14 +555,14 @@ static const struct qmp_usbc_offsets qmp_usbc_usb3dp_offsets_qcs615 = {
 	.dp_dp_phy	= 0x1000,
 };
 
-static const u8 qmp_v2_dp_pre_emphasis_hbr2_rbr[4][4] = {
+static const u8 qcs615_dp_pre_emphasis_hbr2_rbr[4][4] = {
 	{0x00, 0x0b, 0x12, 0xff},
 	{0x00, 0x0a, 0x12, 0xff},
 	{0x00, 0x0c, 0xff, 0xff},
 	{0xff, 0xff, 0xff, 0xff}
 };
 
-static const u8 qmp_v2_dp_voltage_swing_hbr2_rbr[4][4] = {
+static const u8 qcs615_dp_voltage_swing_hbr2_rbr[4][4] = {
 	{0x07, 0x0f, 0x14, 0xff},
 	{0x11, 0x1d, 0x1f, 0xff},
 	{0x18, 0x1f, 0xff, 0xff},
@@ -641,10 +641,10 @@ static const struct qmp_phy_cfg qcs615_usb3phy_cfg = {
 	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
 };
 
-static void qmp_v2_dp_aux_init(struct qmp_usbc *qmp);
-static void qmp_v2_configure_dp_tx(struct qmp_usbc *qmp);
-static int qmp_v2_configure_dp_phy(struct qmp_usbc *qmp);
-static int qmp_v2_calibrate_dp_phy(struct qmp_usbc *qmp);
+static void qcs615_qmp_dp_aux_init(struct qmp_usbc *qmp);
+static void qcs615_qmp_configure_dp_tx(struct qmp_usbc *qmp);
+static int qcs615_qmp_configure_dp_phy(struct qmp_usbc *qmp);
+static int qcs615_qmp_calibrate_dp_phy(struct qmp_usbc *qmp);
 
 static const struct qmp_phy_cfg qcs615_usb3dp_phy_cfg = {
 	.offsets		= &qmp_usbc_usb3dp_offsets_qcs615,
@@ -660,25 +660,25 @@ static const struct qmp_phy_cfg qcs615_usb3dp_phy_cfg = {
 
 	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
 
-	.dp_serdes_tbl		= qmp_v2_dp_serdes_tbl,
-	.dp_serdes_tbl_num	= ARRAY_SIZE(qmp_v2_dp_serdes_tbl),
-	.dp_tx_tbl		= qmp_v2_dp_tx_tbl,
-	.dp_tx_tbl_num		= ARRAY_SIZE(qmp_v2_dp_tx_tbl),
+	.dp_serdes_tbl		= qcs615_dp_serdes_tbl,
+	.dp_serdes_tbl_num	= ARRAY_SIZE(qcs615_dp_serdes_tbl),
+	.dp_tx_tbl		= qcs615_dp_tx_tbl,
+	.dp_tx_tbl_num		= ARRAY_SIZE(qcs615_dp_tx_tbl),
 
-	.serdes_tbl_rbr		= qmp_v2_dp_serdes_tbl_rbr,
-	.serdes_tbl_rbr_num	= ARRAY_SIZE(qmp_v2_dp_serdes_tbl_rbr),
-	.serdes_tbl_hbr		= qmp_v2_dp_serdes_tbl_hbr,
-	.serdes_tbl_hbr_num	= ARRAY_SIZE(qmp_v2_dp_serdes_tbl_hbr),
-	.serdes_tbl_hbr2	= qmp_v2_dp_serdes_tbl_hbr2,
-	.serdes_tbl_hbr2_num	= ARRAY_SIZE(qmp_v2_dp_serdes_tbl_hbr2),
+	.serdes_tbl_rbr		= qcs615_dp_serdes_tbl_rbr,
+	.serdes_tbl_rbr_num	= ARRAY_SIZE(qcs615_dp_serdes_tbl_rbr),
+	.serdes_tbl_hbr		= qcs615_dp_serdes_tbl_hbr,
+	.serdes_tbl_hbr_num	= ARRAY_SIZE(qcs615_dp_serdes_tbl_hbr),
+	.serdes_tbl_hbr2	= qcs615_dp_serdes_tbl_hbr2,
+	.serdes_tbl_hbr2_num	= ARRAY_SIZE(qcs615_dp_serdes_tbl_hbr2),
 
-	.swing_tbl		= &qmp_v2_dp_voltage_swing_hbr2_rbr,
-	.pre_emphasis_tbl	= &qmp_v2_dp_pre_emphasis_hbr2_rbr,
+	.swing_tbl		= &qcs615_dp_voltage_swing_hbr2_rbr,
+	.pre_emphasis_tbl	= &qcs615_dp_pre_emphasis_hbr2_rbr,
 
-	.dp_aux_init		= qmp_v2_dp_aux_init,
-	.configure_dp_tx	= qmp_v2_configure_dp_tx,
-	.configure_dp_phy	= qmp_v2_configure_dp_phy,
-	.calibrate_dp_phy	= qmp_v2_calibrate_dp_phy,
+	.dp_aux_init		= qcs615_qmp_dp_aux_init,
+	.configure_dp_tx	= qcs615_qmp_configure_dp_tx,
+	.configure_dp_phy	= qcs615_qmp_configure_dp_phy,
+	.calibrate_dp_phy	= qcs615_qmp_calibrate_dp_phy,
 
 	.reset_list		= usb3dpphy_reset_l,
 	.num_resets		= ARRAY_SIZE(usb3dpphy_reset_l),
@@ -744,7 +744,7 @@ static int qmp_usbc_com_exit(struct phy *phy)
 	return 0;
 }
 
-static void qmp_v2_dp_aux_init(struct qmp_usbc *qmp)
+static void qcs615_qmp_dp_aux_init(struct qmp_usbc *qmp)
 {
 	writel(DP_PHY_PD_CTL_AUX_PWRDN |
 	       DP_PHY_PD_CTL_LANE_0_1_PWRDN | DP_PHY_PD_CTL_LANE_2_3_PWRDN |
@@ -774,7 +774,7 @@ static void qmp_v2_dp_aux_init(struct qmp_usbc *qmp)
 	       qmp->dp_dp_phy + QSERDES_V2_DP_PHY_AUX_INTERRUPT_MASK);
 }
 
-static int qmp_v2_configure_dp_swing(struct qmp_usbc *qmp)
+static int qcs615_qmp_configure_dp_swing(struct qmp_usbc *qmp)
 {
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
@@ -864,7 +864,7 @@ static int qmp_usbc_configure_dp_clocks(struct qmp_usbc *qmp)
 	return 0;
 }
 
-static void qmp_v2_configure_dp_tx(struct qmp_usbc *qmp)
+static void qcs615_qmp_configure_dp_tx(struct qmp_usbc *qmp)
 {
 	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
 	void __iomem *tx = qmp->dp_tx;
@@ -884,10 +884,10 @@ static void qmp_v2_configure_dp_tx(struct qmp_usbc *qmp)
 		writel(0xc6, tx2 + QSERDES_V3_TX_LANE_MODE_1);
 	}
 
-	qmp_v2_configure_dp_swing(qmp);
+	qcs615_qmp_configure_dp_swing(qmp);
 }
 
-static int qmp_v2_configure_dp_phy(struct qmp_usbc *qmp)
+static int qcs615_qmp_configure_dp_phy(struct qmp_usbc *qmp)
 {
 	u32 status;
 	int ret;
@@ -977,7 +977,7 @@ static int qmp_v2_configure_dp_phy(struct qmp_usbc *qmp)
 	return 0;
 }
 
-static int qmp_v2_calibrate_dp_phy(struct qmp_usbc *qmp)
+static int qcs615_qmp_calibrate_dp_phy(struct qmp_usbc *qmp)
 {
 	static const u8 cfg1_settings[] = {0x13, 0x23, 0x1d};
 	u8 val;
-- 
2.43.0


