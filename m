Return-Path: <linux-arm-msm+bounces-105783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJsWGZ7S+GkF1gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 19:08:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C48D24C1C39
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 19:08:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5F411303ACD6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 17:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D480B3783C7;
	Mon,  4 May 2026 17:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KlqznbCl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QWIVWTa3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FAA3E1D1D
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 17:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777914451; cv=none; b=sdLrZultc6aJO9cj2+5dKZkypdh0Cd41XaFqSmIwgPlWJPVb1kXJEWuvaJYfEf974EG951Ay0UABPTQNOD7+PlTbn9Qqdon0LULFutkDHCv77ASgojMHodS29/wWsH6aS08PTN/gSSY0zifw4YRtqSuJepj0eF6iRRWSg+H+hj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777914451; c=relaxed/simple;
	bh=9HR3Xd4rmD5sUqSiHMjMhpAeSe2fKm1iaA4AmjsSxAQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YBfr//3bnDJKvyjizn/nSwwMHF3pWTKkNfnA8aZoH9xt1bxLJQGvpczQyfWOtXMJ2PZrYk9SS+Eh6NBlJPi/O/p7AVe6Zbqb63LP4HOuUKD9bfQHhuqk3soIzNLk2krIhVvEuWt0tSuJGLCRU7UIoVTUi1TptLesSY2EK3Cdpq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KlqznbCl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QWIVWTa3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644FIflf3409777
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 17:07:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=j56RPVoQs/E
	HqShchuuBXHfNfL9pTjlMbfxbxuh9Cys=; b=KlqznbClezUFLMrmZTSB/GRVxtJ
	jAtjeI+kCvUYck/SNsnN1uU7DVV4/cUXHp7UzahF76fm9qV2xZiNHfx16ohdPZHw
	6nwd+8Gfhv9IL45YcSVugbSN8HT5S1MHfvtJXWMH0RxPUqLH7fpA+hCqcxePV06Q
	GaUVntOl8pprWCJVdAs9zPLQmrR3XxrvaE2tnAbQudH5ymWbS6Fj00GjHcNvpXK3
	5jtGcU/3+UCxaohyrI4euAHSFdviwzAMtpd71cjGiawkFymXVOnKTopJRRqt0iPT
	B6gcqsMtCxVK7+OviDggsFkhtNk/ttA1giRNNMidXnqtLFyuS2MG+HZ2MFg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxx00rdeh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 17:07:29 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35fbaada0caso4065898a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 10:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777914449; x=1778519249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j56RPVoQs/EHqShchuuBXHfNfL9pTjlMbfxbxuh9Cys=;
        b=QWIVWTa31ODzAHLAlXROjyKR4DhiTNerRpQk2bsH6s0L2SCUiNAAVgwqEdvH4ZFqs5
         uHLwK9rpDE0ajX1eMMusf45WHYz/rwUU4UZ+wPgzAvzEql/cs2OdheZ4WN3qeoe/F7VI
         qDNW5HAWMHmrrPasopG19rEXK1iyHAD4K0eWLRFpdI/7hunJcocBKoEUFyraEtF5MwLC
         S908xNpzTaW97sJ+OWmWQX/IpMA6dQXpsAryyxzovEoFelq1IwDAzhZyJxSQ8NFbQA5W
         TwFAQak9bsDGSni/rA6oIyVpsHHrm3zovX1HzsRHOiFnv9XLCehqr7KPKjt+OTRXNFIT
         pn6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777914449; x=1778519249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j56RPVoQs/EHqShchuuBXHfNfL9pTjlMbfxbxuh9Cys=;
        b=R6baqU3f3l8GsipJxNnZsoTYUO1PhHS/EIjAH7WCCFqaqK4qlwam+BgkpMGR+YjvZ1
         abcy6p1wYo1J+OzSbktVJzjES4Ilvsw3m0eWKh66k0J628JzrvVVpUk4gF9u1ET32xMY
         Woy63/cVHMUGfjWN6kHvTxNkzlxrcYz5gD3dfQ7kFJ5oTthYOYOhx6c9762z3jugppSv
         aYiGVotcvg3QN6O0ZocVHb4kEJDykZFWbFgp654waNy7fIN3GTgqD9KsDG6KdfdAAwZJ
         TiXzji1Lcoj2lT+2WN0ao0YOcFyqTQSrZjwt225/VrAicShaqGqxpVq8ubSJ1+yiTRZm
         Zc9A==
X-Gm-Message-State: AOJu0Yy0vGQflME8xI6P2+cYkPezKiymnaGZapkVs61G3mMrzPU9rCOl
	ENRVIXIp9G0n2q7QrRD4AlyRl+jecoHWQLbwiXEOJ/l2NViqyndpWchJhdBC2Ln+gtw59grwxW6
	tDlEeEYjKyp9btoNFMY/UP6sIW6jy/INDwO8Q4XbYOO/PZV4rwpp1AMc7vhHcvyXS+GLl
X-Gm-Gg: AeBDiev6QTReVqLLD0Q48sYc3hepod/hyGhuUiLZ+zrs6EtSQVI06PFwDlrD3gn/fKW
	6lghxVfjY5ohsr3tDl/AMAdVe5gp2R3tqcNi5TyMJcGZUYO+oQDMTOi/sSOTOix+m471+l3geah
	N/5kgFTYIf3IsZfBWv1rFqjiw7wA2voVO9r+CjoMivOuitkV9WAUD2+eUseZJoNcQIMsNGnO5z1
	fdYqbl8TFACTr5KoSfT8uGypQyNK1iqFnRMU9zRqtckVvmgHR6Qub24YkzAWgiGYqR6N3hitjql
	G14CbXtUUmhIxYGthzRtPxW0FAr695xIbLZncxPaDCuLWCwvnIcJMAoNqYsCmrcRjtLeg/qTc2j
	dofoWzuCa2PK2y7gdjmppaG8l60eEJQ+L6eFDL7+NtVkvm7R7vzSmZz8QEo390n6uqLeeZR88Tm
	ygIaik1iyfdMQf43tJen0p1gNLGQ==
X-Received: by 2002:a17:90b:35d1:b0:35e:d012:5a39 with SMTP id 98e67ed59e1d1-3650ce4b8eamr9749045a91.14.1777914448370;
        Mon, 04 May 2026 10:07:28 -0700 (PDT)
X-Received: by 2002:a17:90b:35d1:b0:35e:d012:5a39 with SMTP id 98e67ed59e1d1-3650ce4b8eamr9749013a91.14.1777914447850;
        Mon, 04 May 2026 10:07:27 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36528ad3154sm6256847a91.2.2026.05.04.10.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 10:07:27 -0700 (PDT)
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
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v2 3/4] phy: qcom-qusb2: Add support for Shikra
Date: Mon,  4 May 2026 22:36:58 +0530
Message-Id: <20260504170659.282532-4-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260504170659.282532-1-krishna.kurapati@oss.qualcomm.com>
References: <20260504170659.282532-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=APflyhIR c=1 sm=1 tr=0 ts=69f8d251 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=Fn7aRh_OGbpVAvsfffcA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE1NiBTYWx0ZWRfX6DKsKIBCQdG7
 kzy/KotdRszH7gxuq3oPPYseDvS/lHIdcNSJ9KwH8TL/XmVjZtr3z37ILQFMUxj5MoqWO9NVTlu
 Yp6iMeGmq3V8XnY03ck1dnyykjwKw2+xTZwDLjA1bVe0Pbz2c3+IyjhhU8mvVGskzsaZ9/hHquh
 +MuoR2gFPHTV6zWptvQJ5Mmz48+dvZw0a4mhNFYAxsXqWXbH7lVhtWzWzNyL5xPvsW+yHuQATJd
 6UUD1P8mZwyQp3I35QzJZWUH1JzdtPqpb1K873MHKQFpAg6drba7SmhvpzunW6HP9blOAdr80JN
 VY7EMozEai16v/5LcmzCczcZhNes09z4C29Z5tBKQt6r6GvSvO5q3uJR2ppDgHty74tr8nd/BVr
 Qd33bafFTOq1ugcDMErwRSMLoEaoA24/tixfJLoiT38jEAMwt3IrT4vKjR+7nlGsQ001B2dgxgK
 7LMWCzUQFz6Bb2lLnJg==
X-Proofpoint-GUID: sIa7NuTxj9zafgVqswGE1QtUll-yO2yP
X-Proofpoint-ORIG-GUID: sIa7NuTxj9zafgVqswGE1QtUll-yO2yP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040156
X-Rspamd-Queue-Id: C48D24C1C39
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105783-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

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


