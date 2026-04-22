Return-Path: <linux-arm-msm+bounces-104020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HXFNKVk6GmpJwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 08:03:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 719F54423CF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 08:03:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D74E23052E8E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 06:02:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E5012505AA;
	Wed, 22 Apr 2026 06:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hXrY9D/B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bgSKstV/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CDA2D8DC2
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 06:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776837748; cv=none; b=BWBqfyrHA+nV/PcwG0tloWxubpTGTpJ3zkrI9IyZqYT9zh24DMcua9l8pdTwR//IokFCIOifyBtL54dEQ/PnyF11bFPx3BZan/71qlvbIw3R/IISfWhrPmONDLOIfMMxZh6qBRr3tuqBqs9bHjtG/iqDTnXdQamyM+6A5fccx/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776837748; c=relaxed/simple;
	bh=dDzNaYsr5nzoWKAK9D87YGVdpSmCzuwg6wOFxCDEjk8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wi57v89vlnpdlnMa73dHxBEb9NvnGwGimQl4WMuWo73xYH9F46b1CRxYmpBQpfHZXtyEheEU1YlwSqBwFlPNNSNwAIdJgXtvT3/i34rWKRbrmAAzFBHgEZBT6R3o6F6NYo8uaYJn+LcXgvFT0uhk0rsHFDqHdvbQ91hDYqfZd08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hXrY9D/B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bgSKstV/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M4sgg14051183
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 06:02:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oksW48YDo/iJ7Obeo6EtxigAsB0wziIFhIjb8FZ7kqs=; b=hXrY9D/BdUWacfgT
	lAncsQpG6pm4D1QJz37+XohnMpufauuwpGBslZVI0gZ3pb+4S2JyO3BhC1TVbFWx
	BQZuZPTzoyx+0CqzrZDRt8q33pAV0CDuc74iS4JK03Hj/E84L6GVBE0RZfSbUwCA
	pLOaKpOlCi6Gq4rpSO2TzVOJyiK8RNXKPPtMsxTl5sErdV/7r/bzBTH0t7uh5bJJ
	m1ke1xiz4hJTa5wWbdbtzGETVIrQPHNX2Ipwsb4QxpBxyg187e4GYIbtr6nQx4Xc
	XhLAJhyYIazpQZGvitfv/ovnR+noEXCPg+wl5BO3CY4jIxagDNqVlfAEtFs7lxeh
	vSUNyQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfhxpx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 06:02:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8eb82634cbeso528741085a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 23:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776837745; x=1777442545; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oksW48YDo/iJ7Obeo6EtxigAsB0wziIFhIjb8FZ7kqs=;
        b=bgSKstV/8FvTQhvdHqwC12P2xd4zHuoa6HUJqPhxxRBr9lZ71uBzzW1w2u8De+AsFf
         Nkl0++rxmYenESg2wgQJtGWcH+nOLijNPxeXEuSYcIA2s1zmvWaOQ25Jyhlf+5TJkyve
         53ZXXqIYgphfvtu1SFeZmqhmHsQVcSOW8mD5QLyvM8bXWpVlh4gRttByag90rNvcPtyi
         EZjEwiPE0BSVB1PK90dAREr/5mz/EvDxqnJkIERDfkp9+qcC399lftCEg0FWQDClPwdV
         2DYar9J3iHzDF9oj23p4BYtS3xeBz/eVtfuGDisKr/lXT155rKhVNgct+NJ8iG8Hpwo2
         1eBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776837745; x=1777442545;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oksW48YDo/iJ7Obeo6EtxigAsB0wziIFhIjb8FZ7kqs=;
        b=FAkqgeI/Zncm935UmBGEHqeh3xeM0ajhG3sK2S6jnUggMKLn5N02phRZWPGSyUCWd+
         vCJ7mo/to2K5EDW9EhuTFlLf0JDOInBosQZXGhnjWApK7Be1e9CVFqbrhBv0YifQaE3B
         9DiplIGa7OqJtMto1DaO6WzKdL824Jk624LthIpJpZ/+Bp8127YHD5YfK0l8NBc+Q1ao
         95epLDKy8qdaQkIdsPkJbCro1ESkTQifJ98YygMR+l16pKYxosHADGIxxUGCrecTLJbs
         rhIZLZCGEvjLTCfpHFuaEh4F21RQT3s6yIqpAHDXx9a0BQA3cnrRYt3oGS8kd8zTh1+n
         k29A==
X-Gm-Message-State: AOJu0Yxp2Qr3oVg1pfad6caK/VraNfVqAV70vF9Io9EPtfLFLIkJfCyS
	vPMzAVCGw7Qso+N/2G0m18JExQXuQGrDbV5SUdN6CCkkKZbJUGwxlmBeglSHohAe30hDMo15XHs
	hf5OSiB6Na2Jk18d1PbBfCq6S4kkiIhx+PLM7hGH2t8Pm8NcItUQZJpfCsssc4ksxJYyr
X-Gm-Gg: AeBDiespqv6DaWCeM5V/DIglKb/R/TZa2Kr7FCjZo3PMQIoYxZB2RB0s/y2vgFOoHU4
	SKf753S/HqNdJQLmbGpSzV4ZS6yiCqYWx62DLCjVNq293wgjfr14CpiMa3gT4fd7+w0Q2TIC/Y5
	SohpAfEl11Y9ktN0t2NRLaaUkTOmd9+qTdkkV0R/Yf6/13L65tZJHDTg0AQUueq6Vrat8Usqwgh
	KNEC8ekU+kgl3r1Btsll0wv4i0MFzL0eQoPKhKjeuLY2I5/1NBT7bIp+3h4/PZEl5bQym5eiMNW
	pE6MZAHSBk7xCMT8JvfuiyirPnlCuzyMYjFGUOF8NKXCbSygS+3nE4D9lCB+AogQb29bY5CrwMV
	cXFInp1Mgxws0fdew6Eo+on2GbaSgl0CqjbnPUxb/8tB6OnLcyNNpKHOwQfFuxuO3DSUE5y3pFM
	miMc0oozs/TdQ+7CAQEg==
X-Received: by 2002:a05:620a:4692:b0:8cf:c272:9721 with SMTP id af79cd13be357-8e78f5410efmr2967740885a.6.1776837745541;
        Tue, 21 Apr 2026 23:02:25 -0700 (PDT)
X-Received: by 2002:a05:620a:4692:b0:8cf:c272:9721 with SMTP id af79cd13be357-8e78f5410efmr2967737785a.6.1776837745122;
        Tue, 21 Apr 2026 23:02:25 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ef12122800sm237379985a.18.2026.04.21.23.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 23:02:24 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 14:01:54 +0800
Subject: [PATCH v4 4/5] phy: qcom: edp: Fix AUX_CFG8 programming for DP
 mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-edp_phy-v4-4-c38bef2d027b@oss.qualcomm.com>
References: <20260422-edp_phy-v4-0-c38bef2d027b@oss.qualcomm.com>
In-Reply-To: <20260422-edp_phy-v4-0-c38bef2d027b@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776837726; l=1139;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=dDzNaYsr5nzoWKAK9D87YGVdpSmCzuwg6wOFxCDEjk8=;
 b=zmjWpZaS2g1oSD8spsHnsfW317rDFGb6Syhi6JbVYwE/8xqIXTp3QUk0CKXlinXZ4Wy1FSRln
 RFwGiaDMbVGDrpIcUHwKXy6zsH5oXsrQpkPuRx9qKqyCkuNQ1p341a1
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA1NiBTYWx0ZWRfX+EaStyRlmVuS
 +1fT/tgDNfX02QHte5n1WGZp8cgSoQkpDZdIMupEEKUAYU4gus6MI5TTuGDwE7yPTi32VBVPPx3
 oNWLE10ie7GBpq57CQOr7mIgb9x8n9oXHU7AjISRhSbzTWrajEIHPGA6LV0UG7hOiOkXGzHd6l/
 +3edxcVO08hnHcRIhxU9RcAR2LzYSD7iuKq6b0RNMNXoMuZrWJ4xOqm8diN3xZqdMmIzYaCfhV5
 wZRJEO653EILhc68++Mha5dP7XxtFjU5s8iA4Kvy/pYgKyCSRrLy3FGiwr0NcXq4L28bOgIy4sg
 QydMUVq5e4uadc7HnEbT0hRFrtQPSKcmo8VkdosQ1zChrhu/qsvF51cjVepAZ285l1+4vD6d/ag
 LAR1DkixLZYmzab3HPu0soTh1yb8f32tDGGEA+FkgzYDBnmcceHwx8lBejHoDSaGv2Bq7K5AjhN
 Kj7XT/sTuxNrSioZOew==
X-Authority-Analysis: v=2.4 cv=VMrtWdPX c=1 sm=1 tr=0 ts=69e86472 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=9LehzppxRyMkSVFlbAYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: k5kG6daHOcSeeHq9fXI1VxBw6TefqEDm
X-Proofpoint-ORIG-GUID: k5kG6daHOcSeeHq9fXI1VxBw6TefqEDm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220056
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104020-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 719F54423CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

AUX_CFG8 depends on whether the PHY is operating in eDP or DP mode, not
the selected swing/pre-emphasis table. All supported platforms already
have the proper tables, so remove the unnecessary check.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index 7ac2f502c7a0..bbd45f709a4b 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -312,12 +312,7 @@ static int qcom_edp_phy_init(struct phy *phy)
 	       DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
 	       edp->edp + DP_PHY_PD_CTL);
 
-	/*
-	 * TODO: Re-work the conditions around setting the cfg8 value
-	 * when more information becomes available about why this is
-	 * even needed.
-	 */
-	if (edp->cfg->dp_swing_pre_emph_cfg && !edp->is_edp)
+	if (!edp->is_edp)
 		aux_cfg[8] = 0xb7;
 
 	writel(0xfc, edp->edp + DP_PHY_MODE);

-- 
2.43.0


