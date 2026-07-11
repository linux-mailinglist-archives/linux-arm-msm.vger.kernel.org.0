Return-Path: <linux-arm-msm+bounces-118485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WMmpIw55UmojQQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 19:10:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 199197425BA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 19:10:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Q/KSUBx2";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FlzYWMea;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118485-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118485-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 29F03301C930
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 17:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FDBE3CCA15;
	Sat, 11 Jul 2026 17:10:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D303A3CBE8F
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 17:10:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783789818; cv=none; b=iTLR6Bkl+8ClcIdmHu7IPphd6SS1tEhiClgvuL+vZ6iKZbYCQ75SnZMug9KlRUxLfLH55w46vWRF+/Zltp1ZvSs8mIpTZayt8glNe+9so8KEI+qc8fturso0XCQyza8W6vqcHiVXQI0ayOw89lO1t0S0ii0FqfYhkYLbCdFg6aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783789818; c=relaxed/simple;
	bh=0JjcHpd3tBWmzeCMsgQ5q643CdTH4KrATd9X0tP8+O0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VtTBnRX1FMhRvfXV81NIrjQVOIpPOqr+K+jo0LhBxF2r54jiRZ8P5p6zScMkQwuHbXZ/qzARDLOzUeXBvTl3fHh6mL5nr0Dpv2mISx6JLbPsDYsbG2ZhELjZoHa9C6N667yFfg1WogErPV7944dx74aE0zghFbR3eBvopzvlTAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q/KSUBx2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FlzYWMea; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66BEOKsR4051875
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 17:10:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oTuwjf5CXOV5Mp7IMwVje8lzbuGa56lO9NPJ07Ckymg=; b=Q/KSUBx2sV3llwiV
	6cVNAj/Qlq1eTrfyCyn17+gt6zYi9AjBCRxwDSEYm0b7Y1tVtBAWv+4kJmtpAIFh
	dS76Rz+8rs65GYvvKFtyjWFh6X0WuetJqQxwIl1eQ00vFCuKmPgAmHXd6f5CXJ8M
	DjrxYOIcSG+sUxF47EDZyvedi8Tgww1nG9a16q8F5rwnfn4aFB7Sl7Vbm7HCuGov
	jscRx4QDO8x/+ATwoQ5Kcn6F+MQ7cswonflc2O4iAFS2KXvnl/VHVx2b+akGchhY
	ynHSU2+pN8nd/NwUiGSZgLY9Yimg6B6HHZVd8lqeTc47RX2jRWVS3YJ/C1TApesD
	xSXVVQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbeams97b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 17:10:12 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-ca7c1e22995so3240212a12.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 10:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783789812; x=1784394612; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oTuwjf5CXOV5Mp7IMwVje8lzbuGa56lO9NPJ07Ckymg=;
        b=FlzYWMeaY08Ga8qEsRg0bD5DlE5Zjf3N1Txrkt41LJIisNAM5cgeorpcV8KJAo/TVt
         wTvKMoFd5Ua2GAq1zi+09SqUaEeYimpB3JRu08SFvo2bCptjgqafBSMHBMkYSw1niiXe
         otSX7TRqIM9Q+C5+s6h0dYk5aAi7UZ+2Ph/wqlzwZGwtazC/myhGKkaTw0sbj0GEFpp6
         FUkuvWNzoSo7TwounXwEZDDQFtzS+l7DSh5NqOBn0YiXpRXQjcnNDHmnu5plxPh3efmO
         ltQ+z2mUtChZudCrrvJTkN+FwTDXwe228CA9FKLWhfX+BoqkEIynQ/sMFbD7MaoAwbPO
         7rng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783789812; x=1784394612;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oTuwjf5CXOV5Mp7IMwVje8lzbuGa56lO9NPJ07Ckymg=;
        b=g8Wntx6zUP/YUI4Sg49UbnGaPfCSPWppV8uXbWE0l5mbnQYxF92DyPmaSBMuy7YROc
         m0sXaLWO5TXAM22L+n9re34TxUiUXv7XwQCUxhodqqPJsg3EDhC6pM7jKmN6iGcO1ea6
         F9wHQyOFHgIrSlGm+JGnu/AJmIwSNbhKuIchPeoCT1dUHLe/x53LiSrjG0KQeuS4sIME
         VF5RpRImZHf90dnms6OYbQycsca0i6gO6aHPL9Mw+75pRUINnRxtj0sN3NrsWdaYSW/t
         UKmKeyZN2vkAG3AnmSeAur7pmSg9tL6sMu8h+P6uOX2cDHWsDZQZZoB3DbomkVEumJxU
         hsNA==
X-Gm-Message-State: AOJu0Yzu5ZiiE8WMZAIdfDN3rGm7A2RuQHx2eHvrpQIyasJmHs/xtIDr
	rYB1V+UkNxqAPW+JcO5S39sVm0ROdqGbj6Q0yLN99IdBDMuPnfULHj+augjUnRVXHETJaLNXfJO
	qTQ7JnK1FSojo5BOXweBR+KWigbo4r/QePnpeWh9nQPAAbgOPjnLfqPZbUhRQ0uy6NTbe
X-Gm-Gg: AfdE7cl1VzjPdImylYQrfw3ytDedzmeTcgEvswQNgxZOE0koJ9JEMJLHZhwEAqVESdQ
	y/NT1NCSUXefsCVlEuDO+CJRiFvxmm2/V60OJFY0pEHQDofxRxBoXLRIb8BM7N1ernl/MJwz2pY
	Na+EyQSCSealtVxfLgoZKmrnj7If+YEQGSBB98iXMo5Kh2X4n1dmf9zf3fiRqyQnBjvKpozTB+2
	xFlqRYupz3/n4pipfVax+QtRwiXRLYGzdxMhN8akcNaD+lpNs2sU6Hxfj68DfWuQUXglwV3ijyd
	JTCHYDLNU5CHuzM5a03E/bQogbwVl4k79SLrS4tS3oA2oB99vq56srMsPvdx3njHJN0sic0SEt/
	PnC6tvcA04NZ0wXFLioIykjx4WPvZoFbOuoaIJYQmpLAI0nsBnidhAZ9vBRyQVkOLQwaf7zX848
	+tK0+X
X-Received: by 2002:a17:90b:3812:b0:387:e0db:3d88 with SMTP id 98e67ed59e1d1-38dc77a68e0mr3408677a91.35.1783789811979;
        Sat, 11 Jul 2026 10:10:11 -0700 (PDT)
X-Received: by 2002:a17:90b:3812:b0:387:e0db:3d88 with SMTP id 98e67ed59e1d1-38dc77a68e0mr3408658a91.35.1783789811517;
        Sat, 11 Jul 2026 10:10:11 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b9ca880fsm12943635eec.23.2026.07.11.10.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 10:10:11 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Sat, 11 Jul 2026 22:39:52 +0530
Subject: [PATCH v5 3/4] phy: qcom-qusb2: Add support for Shikra
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-shikra-usbphy-v5-v5-3-229ba3602737@oss.qualcomm.com>
References: <20260711-shikra-usbphy-v5-v5-0-229ba3602737@oss.qualcomm.com>
In-Reply-To: <20260711-shikra-usbphy-v5-v5-0-229ba3602737@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783789793; l=1476;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=0JjcHpd3tBWmzeCMsgQ5q643CdTH4KrATd9X0tP8+O0=;
 b=AF5Do0U1rcLOiS4zCyjeri7q6YiZ1C/0pXPovuLK2Y54e3nMIXSVJfpltrcXR3o9byO4DOrww
 UYKyG623xWDDwVeROLnG0qvRdSDIEu9w4Cungaf06aLox0nvY8e/U9k
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDE3MyBTYWx0ZWRfX4+ck0H6zpYNl
 C8K6JTWd15R2M59NRkzY16/QJhW1A0gMP9am4IkJcUFo3a8knXpB0R66B/lB8DU/yxQBBumw4E8
 CeQN9QWQ6dUgcZtEMri9oYaX9nQbyCw=
X-Proofpoint-GUID: A283WJpoAVRssZ5tj4P2autVyyQBfrsi
X-Proofpoint-ORIG-GUID: A283WJpoAVRssZ5tj4P2autVyyQBfrsi
X-Authority-Analysis: v=2.4 cv=dJSWXuZb c=1 sm=1 tr=0 ts=6a5278f4 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Pub0nXbp0FV3ozl__XAA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDE3MyBTYWx0ZWRfX6qPo3wGaAg8x
 +B07wXKq0d2MdgJqZvnVZ42E2x6BCVdaQZWI83P0NWI1rLCGbkrv+hfFTZHsTgcHcQ1irWfsVI1
 q7X0Er9es0LsocryDcQ+DUMzL4HaG9/3Dfv+9zaZnbuMrI4O4745HBprj7dc1O/eSqFWpKh2CBJ
 wW7W1CKKfVHQJFeOtEKlJNzs+KaPqpSFRSjwiHPV3IAVEDL9ZWH3+ajlZH08Clf+eXdtoVKBXZV
 SYbnCuESuxIGD9/7/0EyVcVfpXoHQ8/Pw9Zsvfw8QeyilNNRKf0O6V1wPN+nflC3k6PK5AdxFrK
 4GJb8fw08tfX5x4gtQnFAVVdLmpVsTISm1mOpmd2UHb0TCh7gjliMakF4BbXqNVzrtq7KbDHiRc
 Wv4OhChWKOLnApU6QjIuQplq1IcPln5pXU7WulOCpnutZ+jJaRXZccGmaXvTmJldLwWvDJOyMJR
 P7SClCZ6AkZEwXbMAkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110173
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118485-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:xiangxu.yin@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.kurapati@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 199197425BA

Add init sequence and phy configuration for Shikra. Since the init
sequence is same as that of QCS615, reuse the existing init table in
Shikra.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index b22b3c6adfd3..101c0820023d 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -377,6 +377,17 @@ static const struct qusb2_phy_cfg sdm660_phy_cfg = {
 	.mask_core_ready = PLL_LOCKED,
 };
 
+static const struct qusb2_phy_cfg shikra_phy_cfg = {
+	.tbl            = qcs615_init_tbl,
+	.tbl_num        = ARRAY_SIZE(qcs615_init_tbl),
+	.regs           = msm8996_regs_layout,
+
+	.has_pll_test	= true,
+	.se_clk_scheme_default = true,
+	.disable_ctrl   = CLAMP_N_EN | FREEZIO_N | POWER_DOWN,
+	.mask_core_ready = PLL_LOCKED,
+};
+
 static const struct qusb2_phy_cfg sm6115_phy_cfg = {
 	.tbl		= sm6115_init_tbl,
 	.tbl_num	= ARRAY_SIZE(sm6115_init_tbl),
@@ -953,6 +964,9 @@ static const struct of_device_id qusb2_phy_of_match_table[] = {
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


