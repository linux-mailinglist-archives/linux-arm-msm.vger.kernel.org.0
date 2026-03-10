Return-Path: <linux-arm-msm+bounces-96649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EAEHGowjsGnYgQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 14:58:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE9A251205
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 14:58:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 67F5031BA37B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 13:18:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BD503B2FE8;
	Tue, 10 Mar 2026 13:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e17w+r+a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AUA5rnIZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC9E3B2FD9
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773147822; cv=none; b=QTcnSjbIYh76WOFgbyydqJEQSWgQmr9cHOmmtat9IIZkuRCYIX13pd1Tuuk7A1uZdIHofGL1V5gGJU0OfdRDSPPz99CIZnzX5Y9UtTDLRZbF1QogzJrnpoYK/Mu1ucb1QlnOo8q+FzzqvBfRAy53ODMZrnFvVZuEUxpwPyQLKTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773147822; c=relaxed/simple;
	bh=psq4kDef2EbVIEb96yYBTp8MoHhKgzHGJFRm0IFplqI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u4X7IyqEmUidiK4WC+X1VeeNbp4NDM5RRuupolIQVh9NBS9az09NBg1fUnsHtSxfo4ZsFoS2s1FipSEi5hSPR0qJl/3VQMKXYFAWn72dl6f95RC1HXP1U1AIofdkSteyTvUgoPDLWN/oXu8xZLztsu6WOBpegRHKQGfhjZ8XmSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e17w+r+a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AUA5rnIZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACabxb1503208
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:03:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kvqvf6zlL0yTK2bTnfgDCR6GYEBFrYymNikDUD8Q5JE=; b=e17w+r+a+OTwzD6M
	0gc81uCRRT9uBXceCk1RcFas3USXIP9LZfAS+S/19XL9D5Vq+PFCkxG1CShqvg4X
	qwLodBDhvDckqQLnF5n/jJrElruiJQyBHnDEdf9moZmlETpbQWCte14zb5fm8mh1
	uVC9LHdhFQAl5MtGUajHZ4Px8nxinQl45fW9NFKa7ZVRWdGYS1lKDhKJADbHYCy1
	uj7Mmrx/sUDeW05a0JeQtltWhiVRtsLzYe9+Y0HTQxN4StNtVdhZPQaYVoWijo+q
	5R8G1yTkeYvSABR6EO5Ef6YXlE0G0w+0rKXwtooPsodu+K9G+aiC9+D37gS45qjj
	+nnseA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctdf8hjtv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:03:39 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5ffbab490d3so34764505137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 06:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773147819; x=1773752619; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kvqvf6zlL0yTK2bTnfgDCR6GYEBFrYymNikDUD8Q5JE=;
        b=AUA5rnIZHWuV/mo7IfvfFOI3ct171827X+ArnKHY+fjZDeT2wZe4Ngs8ToEZ/h8Byi
         b+XcDF/wPTcTUCgpTtoU2uKROdGI5ePfB7x5Qao0uf30UPV21bxESiYDIvtHyqdokCit
         CEn4xkaL763R2RrJrGMltkLRBEJe8d5yNTx3ARI0bduREFlw1vwAChbF3GxWWAUleLnb
         3p5c3hhGOoFhzAzdFZOmpUiTmppgOJrO5Tg3NAMLnZcfHSuNw88pnKw8oL30j1NAlM+D
         2qdA5ohX/jMvEHCDoEAKFqnG8T6ndxUT2j65p3aYoM5R8cTRO7x2g6SlWlNHNceTN3pN
         r2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773147819; x=1773752619;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Kvqvf6zlL0yTK2bTnfgDCR6GYEBFrYymNikDUD8Q5JE=;
        b=R/BYK37OY1QtQCMyDEtVplUBNOsfsRTRP9Dv1jYh9WQtqQcx323yxxDrKv+5P9sBzX
         lHicq+OKaEuwkpNcg6fDorvj99eOkCTskOWSpSdAoYzQfORfZsyGq+8IMjwC63Gv/mMV
         C9UXmY4w/UPiuXCSQueqE6/kKfyiTe+rZlrEpVisw3YQQtTNxsMaCtl4TDKtfF/xw3T+
         tkn9Z/ZdvnaaPKkbwj/ZXxYQJPRs2ZE+Xmali2BIp4E8xTKMZKnDCLDLSwFMMis8GlLW
         Xu300DJLEy6wkfRNe/GBeH5t2Pm/bR87twczYWktAvZZBX7q22gZQOLO+y7rRiepsMLp
         5FLA==
X-Gm-Message-State: AOJu0YwMPcxZVT++GcpWTbcPRmGlrRPAfA0k6jB69qimZJZZILWEY3Xl
	XGdexnNTFzAoMTxnrPecvXEUz3r7wTwZ6kH7+xan6Hfvuxe1UNa+dMueKRMpaL7KnaGOZ9kFYO2
	KSPnogofbcD661zdosX7oR0u9Azbtle48h2K0PswJHC4ImTD/LbePCcipzQx9FWvmppsg
X-Gm-Gg: ATEYQzxC6IvBB7gWZt5gg4730glFB7bqFnRzBbZZlhO1ifv2y0STDFqtmO7e407Kv8X
	PILldtS2nujdsnvnd+POyLZV7Zu3m3NG1ktGpoYhG+lliUfXt8aGajwyq0bNO0t6y28o7PJwrlp
	RUSfwA2n5cvv4R+mP/RYs4jfqvUQaOprrA/LulbOzA/9blRMREpzEhxCO3rONGwio6MOf0YFLaV
	SB4xcGsqsGPO2QtpNABDvsAWVV1LiF9jUcmZZAIZQ2Nh6pd2H1hQljGUdr2cFDcrEUu5tbspkQt
	FFNP/ItE7q+ed6IoI79MQEp6IuszIo3Moi1g7aIDUK0fxQnBXHHfZFglYMaA3qElpBnwuLF7jHz
	JpLgqKRmA6JUEd6GqZjrGQ36sK0t7nUkSDTQHZpgnUDqV
X-Received: by 2002:a05:6102:3f4b:b0:5ff:cc82:744b with SMTP id ada2fe7eead31-5ffe6120fa0mr6780460137.19.1773147818973;
        Tue, 10 Mar 2026 06:03:38 -0700 (PDT)
X-Received: by 2002:a05:6102:3f4b:b0:5ff:cc82:744b with SMTP id ada2fe7eead31-5ffe6120fa0mr6780402137.19.1773147818517;
        Tue, 10 Mar 2026 06:03:38 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485246ed174sm178732855e9.5.2026.03.10.06.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 06:03:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 14:03:19 +0100
Subject: [PATCH RESEND 1/5] arm64: dts: qcom: msm8996: Drop redundant VSYNC
 pin state
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-qcom-dts-redundant-pins-v1-1-98e2ef430717@oss.qualcomm.com>
References: <20260310-qcom-dts-redundant-pins-v1-0-98e2ef430717@oss.qualcomm.com>
In-Reply-To: <20260310-qcom-dts-redundant-pins-v1-0-98e2ef430717@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3390;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=psq4kDef2EbVIEb96yYBTp8MoHhKgzHGJFRm0IFplqI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsBachw9SfbeQFXi+5Fsu89JYQNVHE1Iy/vHIt
 gU2uALA1ROJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabAWnAAKCRDBN2bmhouD
 1039D/9K8crxdvVQXfPodhDtaSmptF9fJU2yjlDkL8fU3/vv5JhH0gSbLJtc/V6BBOL1Cm5ARfz
 qpKsEJoD+jWgFKmR9HZ6BhePsg9VQAKeJ1V0vjee33UYUxgMDp0m+vBu5+XQVoilHYcNG11FaMr
 souDB2EVLMyfFsRooDvP5lk7u0FZRqhlj6YdCNly+mvdGhRrMmsyIz7EUEa9D3aYvKbDioOpCUk
 Dsn+YiELN3Wnm3HubYWQluKCgNJhQBGIAW9DRsMA0i8RuKKSqvQhQZwO9EUhNPJqgT0j1df1MCM
 RUyy0SqcI/f1vgl32InfLh1AG8wDh6YlazM6GKy/flZKM0YF4vNmG5bVEFDsr3V2rfu9a1lpZHi
 wgaF+JS0dzyFrsQ3l5R4mOLw2K8vQzoAkPIVjaJL6ZoN2ISrLL/KuDKcHvQTSjAvWc7GzHEwIMO
 Iw2Dpr/BZbQ2Jf21vxwGg/3YttKS7BQunKj0wSrTUCe23n3oNu9/mblUlaZ1GSPZACqMi/WWyJt
 RjqUi6AHuuC6Lv0uTUt/ginyZALdHe3qzggHyCN9Rk/6FCco43pW77c99ng3eP/zcq8ymCN3fd9
 gPH5EeU2hHJgCErbW7oerk+wJ6VaPkenPD8X4Fg/jCgIDE7fsJ9kjZsSdd42xaUnoRQIhZ1shUI
 GiPBlsGw1vYdWnw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDExNCBTYWx0ZWRfX+yIEfXgyD3YX
 cOZs6YvyELWgsVcU0KPwpbLTvWNOOjf9o190cC4QwfdB5YcUj9qoQvoehhSKdSYD4E+JYfq/aSy
 V2905QnRoL02PNn4gn8LrkUZcLOhoiCqJv3yHg3BH+Ub0ONR9A4W3K/i0b28WDN0ZmYNENMwbjP
 azHxzAFGj8s9QiRKcg237UZAL/mzWe0iZXejQUg8h/maP/cB4J5TmDqSTIEUvUys+LI6mpD/Oya
 uluqTq/IWdXnll/rJMikV+puQlfutOeQEzwiAhd5mSVaAfZmzYnbUUyAzXIivKF8UAhdogTep2v
 vlv8H9AdXLcb7j7qtZA/dqUestWyMHWDrutpGrksKFuZW2LCHiIC9NxVeahEpTSUSZq3WeTUMqg
 dKfj2KspmtkwXI3GOEtSmV2hgyLWWy9GEr6BhwnRe2SA/7yWwo8bM5KFuLuAgxERek2Vekisff/
 E/NYPhsWsy3QYHzaIfQ==
X-Proofpoint-ORIG-GUID: kq8ejmTkkpNDO7Cc1rtYeWd8kO1PAwXn
X-Proofpoint-GUID: kq8ejmTkkpNDO7Cc1rtYeWd8kO1PAwXn
X-Authority-Analysis: v=2.4 cv=b+W/I9Gx c=1 sm=1 tr=0 ts=69b016ab cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=vFSlWfVDKHwDXz86178A:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100114
X-Rspamd-Queue-Id: 1EE9A251205
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.0.0.0:email,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96649-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The active and suspend pin state of VSYNC is exactly the same, so just
use one node for both states.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi   |  9 +--------
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi    | 11 ++---------
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts     |  2 +-
 arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dts |  2 +-
 4 files changed, 5 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
index 63ab564655bc..a4dcc88bb01f 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
@@ -745,14 +745,7 @@ mdss_dsi_suspend: mdss-dsi-suspend-state {
 		bias-pull-down;
 	};
 
-	mdss_te_active: mdss-te-active-state {
-		pins = "gpio10";
-		function = "mdp_vsync";
-		drive-strength = <2>;
-		bias-pull-down;
-	};
-
-	mdss_te_suspend: mdss-te-suspend-state {
+	mdss_te: mdss-te-state {
 		pins = "gpio10";
 		function = "mdp_vsync";
 		drive-strength = <2>;
diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
index 0386636a29f0..77ad613590a3 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
@@ -247,7 +247,7 @@ &mdss_dsi0 {
 
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&mdss_dsi_default &mdss_te_default>;
-	pinctrl-1 = <&mdss_dsi_sleep &mdss_te_sleep>;
+	pinctrl-1 = <&mdss_dsi_sleep &mdss_te_default>;
 };
 
 &mdss_dsi0_out {
@@ -730,14 +730,7 @@ mdss_dsi_sleep: mdss-dsi-sleep-state {
 		bias-pull-down;
 	};
 
-	mdss_te_default: mdss-te-default-state {
-		pins = "gpio10";
-		function = "mdp_vsync";
-		drive-strength = <2>;
-		bias-pull-down;
-	};
-
-	mdss_te_sleep: mdss-te-sleep-state {
+	mdss_te_default: mdss-te-state {
 		pins = "gpio10";
 		function = "mdp_vsync";
 		drive-strength = <2>;
diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts
index 3c6a40212a8d..fd3a2121465b 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts
+++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts
@@ -104,7 +104,7 @@ &mdss_dsi0 {
 
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&mdss_dsi_default &mdss_te_default>;
-	pinctrl-1 = <&mdss_dsi_sleep &mdss_te_sleep>;
+	pinctrl-1 = <&mdss_dsi_sleep &mdss_te_default>;
 
 	panel: panel@0 {
 		compatible = "jdi,fhd-r63452";
diff --git a/arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dts b/arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dts
index f8ab03f106a1..7e2ee9a4e9f0 100644
--- a/arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dts
+++ b/arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dts
@@ -51,7 +51,7 @@ &mdss_dsi0 {
 
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&mdss_dsi_default &mdss_te_default>;
-	pinctrl-1 = <&mdss_dsi_sleep &mdss_te_sleep>;
+	pinctrl-1 = <&mdss_dsi_sleep &mdss_te_default>;
 
 	panel: panel@0 {
 		compatible = "jdi,fhd-r63452";

-- 
2.51.0


