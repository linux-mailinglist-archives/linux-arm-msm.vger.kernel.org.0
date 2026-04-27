Return-Path: <linux-arm-msm+bounces-104608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CKZHBUE72kj3wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 08:37:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A36246DA21
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 08:37:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0A1BC3010243
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 06:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F605374E4E;
	Mon, 27 Apr 2026 06:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nWHbYaTY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GUBHb/fq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E3B3909A7
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 06:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777271751; cv=none; b=Xwo6tqLu88WQ0qOlSBcwWqSSdn1IcxbBiDTBzCsl+3yjzDN38QkiLQXEnuRrvTAJ5WMM9q33o3a4qPZxGmXE0hCxqr7rzSJDaPpYle70dvWFfx1q+ORdMFh+u7AlytK1OJbMk4Eer4ED3TjKFJfSL7YmppNtVH2AxXoAFXTNKqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777271751; c=relaxed/simple;
	bh=UJfJbat0WxxGDDgc1J6mpbWkCUWZwu5kiHe5HC0OQjI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NbRrVQsTU+SfGxYNOXDqWdWkWhgMhC/DdBHbz7td7vQ5gYqTnv083Y/xZwkgqI5dmk0IN88TLPqV2an2GVTf52FCPxXNqBJe9hmKtikJPDTQRUjKGq639mGPUjaLcq3P0+OR29QM7MCYELWOOSDQ24Ovp54YjjDGo7TTg+2tNm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nWHbYaTY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GUBHb/fq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QMwnn44085862
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 06:35:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F/ivyNBjCAffYDhazIIzpEgKd96rMA5tlEiyp0VgCXE=; b=nWHbYaTYsPIiL0Lj
	GMbIfoYOYOqWVxTl1lRylN3VIhIpG88pFYMWYBA9isyU7fSAN1UWFZLTfC6/uarK
	xbxdxtvjUGJUAvo0Ys3aB1g6nOpbivqOQuesWmAAN8kTW3NuwuxfigrlntXeHzO6
	sOI4+ve6FKcLCUYGDLsg+oKrimjhPIwWsUW8H1XCz4oRcdwFV0C+LFzfhy1iphTe
	SX13vIa18nquLulqmHUKZ6rQkWRQmLh3UW3H181l7Q88VgUA4wOF+PWUSnMhwya0
	hdCoSpjD84CRRXxnG9OvR5jetgZh98FqKIQELtH0/fMDYeFaMl93EjTsCIEJFutq
	epQZIw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnqtcsga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 06:35:48 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8aca4660827so295929126d6.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 23:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777271748; x=1777876548; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F/ivyNBjCAffYDhazIIzpEgKd96rMA5tlEiyp0VgCXE=;
        b=GUBHb/fqYOkOw4eg25NazuNL0Xw2BMrbXcMPbmYje9jrSjOIPsaTrDvvDNm40fJpcv
         AHUDxQwxu7FKZ0AaZ/04JCX45HvwWgCnQcHsatMHxdBqpl/9Ieiw7y27mNAjqV8uSdri
         FUjFNYiTmHxqdofV2Lc59kiDlwo1Q9XvhlNNWs8+iERp0iCfjGuNdJ4rmQxrhwqRYIrJ
         xGPuVBtAKpCALO9PIkC60tW8fFb2GFFDBEYHylYQTdkJSis34omZ+vFigdq0LIqNp3W/
         l0FkCK8crqkgOeIMMxb8Dc+85Bm+0cZ++1M98oWmJlWgV1KAnh1VStTOI7hXzA/4mUXQ
         T4sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777271748; x=1777876548;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F/ivyNBjCAffYDhazIIzpEgKd96rMA5tlEiyp0VgCXE=;
        b=KPs7LvgoOl78zh4YB9T5ZAuWwYw7Byo67iKnA0W9ZCYm9xPC3xIpLLW3k/l34rb74a
         kQCKdtVJpmPl6cyyH+pKWVKnrw/Ogv5MNgzZEe1Kr17KQVBR46ICB/DAV9ZMPd5HUDKk
         h9+FPsiL/SqFZpHE40tSxAutiiCCpzBCSHVPsSEWIvnsYHZFvXI6x0R09ecKpvsng+Hl
         SL4paaSu0pR0ne8nY+Aij8NegBEsM34aKzlz0NiL03duh06bv0XzeBcmbqlTRMk6PkTY
         9+da01wSuIFbLY9h/QkDlzp3tUGRXOKfTFHg4TzhjCjtslBE1H+16kEy8Kn5Wl9Qo6FC
         DEQQ==
X-Gm-Message-State: AOJu0Ywrqxh0KkrXDI/lTnSFKVp7gvU3z7plbhFAMxJhKkybQZ6ktskU
	rGvHzuN7zglV0t64XXPjBCPi6h//6YnKM6QwIVzy3YMdi+OY8ukqbaTXSIMFjqbib4s0B1O5FEG
	gyur7SPyynsEj3y959t9w4zS8uFMzPH7UBoipv02TErkVC425isjfN/VEPrNGoqe2udTp
X-Gm-Gg: AeBDiesbeX2F5HGM2Kt/egV8VcWoLuSgPQmb0QvVvI3AXOKCReZa8zWjCVyIfOmZhkd
	uk2WT2AuNTK7s6unjXSYNgmA05LbzIHIP9vyJpXICYjzHhCCu3u3tK0hBZuP36dxyVyXLAzulR+
	FQTUv4LrPqHlMIDUscFI09FjA2U4b2nVZwHSDIZakLuCw2gc6csyIAhEi/LgqFNePG/x9hhQRhv
	i2ZdB4UVJJ30mLt5DcELqAmEYgFMP8LOW9elCU1ThEycKTiwbdQ6DXJOqPpk6tDKPKxy4czwafe
	aRxlxHOCnYn0VvNV8fexurg1tV2aBdoCHydQOtyHYhvoV3m4PSis24Sp21ySS85OglN1q/J7zk7
	ZwNm7Q3BNFqeSshdt5Rd2oqyyCDyxeXgylcRpkaScT5utf63sotdjJMg3fVHao5qORui+CkUSrA
	qyKcX9pDL8Xty7xR/G1Q==
X-Received: by 2002:a05:6214:21ca:b0:8ac:b1ad:3a24 with SMTP id 6a1803df08f44-8b0280f1d8amr670800816d6.27.1777271747808;
        Sun, 26 Apr 2026 23:35:47 -0700 (PDT)
X-Received: by 2002:a05:6214:21ca:b0:8ac:b1ad:3a24 with SMTP id 6a1803df08f44-8b0280f1d8amr670800476d6.27.1777271747362;
        Sun, 26 Apr 2026 23:35:47 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ac7d4e6sm251899256d6.20.2026.04.26.23.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 23:35:46 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 14:35:23 +0800
Subject: [PATCH v5 5/5] phy: qcom: edp: Add PHY-specific LDO config for eDP
 low vdiff
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-edp_phy-v5-5-3bb876824475@oss.qualcomm.com>
References: <20260427-edp_phy-v5-0-3bb876824475@oss.qualcomm.com>
In-Reply-To: <20260427-edp_phy-v5-0-3bb876824475@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>, stable@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777271722; l=7072;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=UJfJbat0WxxGDDgc1J6mpbWkCUWZwu5kiHe5HC0OQjI=;
 b=yjUQR8Ti5SxHbjVW1hz6/RIkc1NgYL5wNokw2H+Is6pSidV1e9W2MzProOxrvWxN1W5R80J8D
 sDkp3K7Xz/ODozi+SKBIC2QAhnKraGBkVbjXMrQ7xNy/vB1or/J9Ghy
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=J42aKgnS c=1 sm=1 tr=0 ts=69ef03c4 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Wstf64DO4dhji1mrokQA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: hjQWg0Qk65niel3Vzhe2-KsV3mrMe6Kp
X-Proofpoint-GUID: hjQWg0Qk65niel3Vzhe2-KsV3mrMe6Kp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA2OCBTYWx0ZWRfX995GU3JzF5MQ
 PxJGnBUzdEi2UoQnleJIpW7Yux/k4U5HisAZYVhjefSA9mHurfDnNf9FSgLA3EccslnPeLN5km9
 RBkKMk7rQzE1UKBXhUtvlTJAGB5BfSDIcroYbnH2HHgcj2a6Q9iUQnZc7GOCJ5RYeCez3gigbxz
 8PSfViNspZPhFo7FxzuUhzco8lQebak9iwqThZwO385jhcck3oTfbXFD3Fk+GKVBHVC5JKHa9uK
 HqNaQEkP/SzRZwhzYho8ajPsI7kQ6WhwpAVIPYcRY9yfUdF5znS8aDPUg8Z5N7TBIwz4E1pdsRd
 2thmgXLGVSPzyL7FV273RKL6MCfWVu5ZmQaSxaYK/w4wraKp4c94BJ9RiYOWvOzPKLSeX6eL2K/
 rf9qErmB2DMvfTzZKR5ZZIlGYNjrf+05ZFehLmu+tsA8C2msgeu9doy/nbrjwarhEGDLfkZPYPB
 OLP5vd3XLFe6dBnvSsA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270068
X-Rspamd-Queue-Id: 3A36246DA21
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104608-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]

For eDP low vdiff, the LDO setting depends on the PHY version rather
than being a simple 0x0 or 0x1 value. Introduce a PHY callback to program
the correct LDO setting according to the HPG.

Since SC7280/SC8180X uses different LDO settings from SA8775P/SC8280XP,
introduce qcom_edp_phy_ops_v3 to keep the LDO setting correct.

Cc: stable@vger.kernel.org
Fixes: f199223cb490 ("phy: qcom: Introduce new eDP PHY driver")
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> # SC8280XP X13s
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 88 ++++++++++++++++++++++++++++++++-----
 1 file changed, 77 insertions(+), 11 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index 3a848f18a8d6..a3c893f72908 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -81,6 +81,7 @@ struct phy_ver_ops {
 	int (*com_clk_fwd_cfg)(const struct qcom_edp *edp);
 	int (*com_configure_pll)(const struct qcom_edp *edp);
 	int (*com_configure_ssc)(const struct qcom_edp *edp);
+	int (*com_ldo_config)(const struct qcom_edp *edp);
 };
 
 struct qcom_edp_phy_cfg {
@@ -352,7 +353,7 @@ static int qcom_edp_set_voltages(struct qcom_edp *edp, const struct phy_configur
 	const struct qcom_edp_swing_pre_emph_cfg *cfg;
 	unsigned int v_level = 0;
 	unsigned int p_level = 0;
-	u8 ldo_config;
+	int ret;
 	u8 swing;
 	u8 emph;
 	int i;
@@ -378,13 +379,13 @@ static int qcom_edp_set_voltages(struct qcom_edp *edp, const struct phy_configur
 	if (swing == 0xff || emph == 0xff)
 		return -EINVAL;
 
-	ldo_config = edp->is_edp ? 0x0 : 0x1;
+	ret = edp->cfg->ver_ops->com_ldo_config(edp);
+	if (ret)
+		return ret;
 
-	writel(ldo_config, edp->tx0 + TXn_LDO_CONFIG);
 	writel(swing, edp->tx0 + TXn_TX_DRV_LVL);
 	writel(emph, edp->tx0 + TXn_TX_EMP_POST1_LVL);
 
-	writel(ldo_config, edp->tx1 + TXn_LDO_CONFIG);
 	writel(swing, edp->tx1 + TXn_TX_DRV_LVL);
 	writel(emph, edp->tx1 + TXn_TX_EMP_POST1_LVL);
 
@@ -608,6 +609,52 @@ static int qcom_edp_com_configure_pll_v4(const struct qcom_edp *edp)
 	return 0;
 }
 
+static int qcom_edp_ldo_config_v3(const struct qcom_edp *edp)
+{
+	const struct phy_configure_opts_dp *dp_opts = &edp->dp_opts;
+	u32 ldo_config;
+
+	if (!edp->is_edp)
+		ldo_config = 0x0;
+	else if (dp_opts->link_rate <= 2700)
+		ldo_config = 0x81;
+	else
+		ldo_config = 0x41;
+
+	writel(ldo_config, edp->tx0 + TXn_LDO_CONFIG);
+	writel(dp_opts->lanes > 2 ? ldo_config : 0x00, edp->tx1 + TXn_LDO_CONFIG);
+
+	return 0;
+}
+
+static int qcom_edp_ldo_config_v4(const struct qcom_edp *edp)
+{
+	const struct phy_configure_opts_dp *dp_opts = &edp->dp_opts;
+	u32 ldo_config;
+
+	if (!edp->is_edp)
+		ldo_config = 0x0;
+	else if (dp_opts->link_rate <= 2700)
+		ldo_config = 0xc1;
+	else
+		ldo_config = 0x81;
+
+	writel(ldo_config, edp->tx0 + TXn_LDO_CONFIG);
+	writel(dp_opts->lanes > 2 ? ldo_config : 0x00, edp->tx1 + TXn_LDO_CONFIG);
+
+	return 0;
+}
+
+static const struct phy_ver_ops qcom_edp_phy_ops_v3 = {
+	.com_power_on		= qcom_edp_phy_power_on_v4,
+	.com_resetsm_cntrl	= qcom_edp_phy_com_resetsm_cntrl_v4,
+	.com_bias_en_clkbuflr	= qcom_edp_com_bias_en_clkbuflr_v4,
+	.com_clk_fwd_cfg	= qcom_edp_com_clk_fwd_cfg_v4,
+	.com_configure_pll	= qcom_edp_com_configure_pll_v4,
+	.com_configure_ssc	= qcom_edp_com_configure_ssc_v4,
+	.com_ldo_config		= qcom_edp_ldo_config_v3,
+};
+
 static const struct phy_ver_ops qcom_edp_phy_ops_v4 = {
 	.com_power_on		= qcom_edp_phy_power_on_v4,
 	.com_resetsm_cntrl	= qcom_edp_phy_com_resetsm_cntrl_v4,
@@ -615,6 +662,7 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v4 = {
 	.com_clk_fwd_cfg	= qcom_edp_com_clk_fwd_cfg_v4,
 	.com_configure_pll	= qcom_edp_com_configure_pll_v4,
 	.com_configure_ssc	= qcom_edp_com_configure_ssc_v4,
+	.com_ldo_config		= qcom_edp_ldo_config_v4,
 };
 
 static const struct qcom_edp_phy_cfg sa8775p_dp_phy_cfg = {
@@ -631,7 +679,7 @@ static const struct qcom_edp_phy_cfg sc7280_dp_phy_cfg = {
 	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
 	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
 	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg_v3,
-	.ver_ops = &qcom_edp_phy_ops_v4,
+	.ver_ops = &qcom_edp_phy_ops_v3,
 };
 
 static const struct qcom_edp_phy_cfg sc8180x_dp_phy_cfg = {
@@ -639,7 +687,7 @@ static const struct qcom_edp_phy_cfg sc8180x_dp_phy_cfg = {
 	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
 	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg_v2,
 	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg_v2,
-	.ver_ops = &qcom_edp_phy_ops_v4,
+	.ver_ops = &qcom_edp_phy_ops_v3,
 };
 
 static const struct qcom_edp_phy_cfg sc8280xp_dp_phy_cfg = {
@@ -824,6 +872,24 @@ static int qcom_edp_com_configure_pll_v6(const struct qcom_edp *edp)
 	return 0;
 }
 
+static int qcom_edp_ldo_config_v6(const struct qcom_edp *edp)
+{
+	const struct phy_configure_opts_dp *dp_opts = &edp->dp_opts;
+	u32 ldo_config;
+
+	if (!edp->is_edp)
+		ldo_config = 0x0;
+	else if (dp_opts->link_rate <= 2700)
+		ldo_config = 0x51;
+	else
+		ldo_config = 0x91;
+
+	writel(ldo_config, edp->tx0 + TXn_LDO_CONFIG);
+	writel(dp_opts->lanes > 2 ? ldo_config : 0x00, edp->tx1 + TXn_LDO_CONFIG);
+
+	return 0;
+}
+
 static const struct phy_ver_ops qcom_edp_phy_ops_v6 = {
 	.com_power_on		= qcom_edp_phy_power_on_v6,
 	.com_resetsm_cntrl	= qcom_edp_phy_com_resetsm_cntrl_v6,
@@ -831,6 +897,7 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v6 = {
 	.com_clk_fwd_cfg	= qcom_edp_com_clk_fwd_cfg_v4,
 	.com_configure_pll	= qcom_edp_com_configure_pll_v6,
 	.com_configure_ssc	= qcom_edp_com_configure_ssc_v6,
+	.com_ldo_config		= qcom_edp_ldo_config_v6,
 };
 
 static struct qcom_edp_phy_cfg x1e80100_phy_cfg = {
@@ -1011,6 +1078,7 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v8 = {
 	.com_clk_fwd_cfg	= qcom_edp_com_clk_fwd_cfg_v8,
 	.com_configure_pll	= qcom_edp_com_configure_pll_v8,
 	.com_configure_ssc	= qcom_edp_com_configure_ssc_v8,
+	.com_ldo_config		= qcom_edp_ldo_config_v6,
 };
 
 static struct qcom_edp_phy_cfg glymur_phy_cfg = {
@@ -1026,7 +1094,6 @@ static int qcom_edp_phy_power_on(struct phy *phy)
 	const struct qcom_edp *edp = phy_get_drvdata(phy);
 	u32 bias0_en, drvr0_en, bias1_en, drvr1_en;
 	unsigned long pixel_freq;
-	u8 ldo_config = 0x0;
 	int ret;
 	u32 val;
 	u8 cfg1;
@@ -1035,11 +1102,10 @@ static int qcom_edp_phy_power_on(struct phy *phy)
 	if (ret)
 		return ret;
 
-	if (edp->cfg->edp_swing_pre_emph_cfg && !edp->is_edp)
-		ldo_config = 0x1;
+	ret = edp->cfg->ver_ops->com_ldo_config(edp);
+	if (ret)
+		return ret;
 
-	writel(ldo_config, edp->tx0 + TXn_LDO_CONFIG);
-	writel(ldo_config, edp->tx1 + TXn_LDO_CONFIG);
 	writel(0x00, edp->tx0 + TXn_LANE_MODE_1);
 	writel(0x00, edp->tx1 + TXn_LANE_MODE_1);
 

-- 
2.43.0


