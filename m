Return-Path: <linux-arm-msm+bounces-96651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AUMBRwhsGmCgAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 14:48:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B0081250CE8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 14:48:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C946D32705A5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 13:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CD9B3B389A;
	Tue, 10 Mar 2026 13:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c9rwNo5A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a6pCUFk0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D794F3B38B7
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773147829; cv=none; b=P5KDW9S6t0o/DOAuJ85YgepTfYe4C71Uwk5YhGEaXD/yu7nMzFy4/iR0QFUlpA0Jrq607/UCytIMUc2dlyZXfG9MyQ2UaWxFkdAaj2mVsG0EIU/N2f1SLJPNY9apQ1TBjAARnr4E6tunGgZLVjTXgkyGJRdUIn/c5AvCmUiOyGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773147829; c=relaxed/simple;
	bh=2ay/T2LVb0KNujzQYVBf/riykk1JFo+21WVSOwmQyzI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UHLSJj6ySiNSCS9EcqEdu7zsIjLEv+HEoOk3/sZVV4CR8pPSyx6FuQYraMjY1LVsqyPreXVbYQWpUNf2JunFsFYpME0tf9GkyErEjucDxmHemyT7/JD1XIsrLTnF81xR3yHv7Prpty6zpIAL9r/sri8ZZY+nucW5Bf63C2vjKQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c9rwNo5A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a6pCUFk0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACamSu964164
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:03:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vlBHU2JjPAiVrIuWbTERfwoxIrXohgluWZVzXjjt9eo=; b=c9rwNo5AStUAaMH+
	nzGuGK4SfJfHMfaqh8CTqNhmyVTtS72UyXkXAIxvZ76GsllFowbiqd7BgYzLPv3O
	SJsWbOyl7v6YtsRQlVJjHDJQblCWzU2cpQctJAF1WlLvscPK/vtWi+5wmdmoCi3H
	Q2yY/eFt48e4Aw0rytnyAxw0wX3muSj+lc5ESnWvA3v59isR2H4UsmHUCmO2WfGI
	Q8KWsEfUM9cJ8B5ohGWMVWTX1j8loygXOaT8BEZ8c9txwkmBTJ9yOnxo1ZAV9gS6
	qWuTx/V4MuRJOwxuqfV4zv0cc/9NQ4lhl3EH5m1roCnH2z/31Kitk5XjlyMe7Yxt
	KV8WYg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct477k92j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:03:46 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-94ac3fcea3bso123063987241.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 06:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773147826; x=1773752626; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vlBHU2JjPAiVrIuWbTERfwoxIrXohgluWZVzXjjt9eo=;
        b=a6pCUFk0nCWlKmSq0wLzgUX/Z52fuqq0vYQaa7ImkGVmgoaRPSJMLBwXQhq39naMLj
         p+PoxT+pw5VEtbOF086JuAI2hAiocK3BUWq5nJgEiBfLZn0CJzKaGFYBiC4DUE66BeKp
         IuZvt4d6K11sv5oQ6Mf+sIYizH4dZauMYTwbSxhnHRIGg6QBbthprc/FjV8UlvYNGQDu
         7cwuiVTF8WIMkySbsnj7q7SfX9L391W9HIe3qywgf2H8BIAqky2FSQ32SzleS+aIwChD
         JLfv1fJduygWHETA00sLjOWuuASNwjaF0+bLXtSBHZUGtslSiySGCUlsvr7FV6WG+TNp
         iPqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773147826; x=1773752626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vlBHU2JjPAiVrIuWbTERfwoxIrXohgluWZVzXjjt9eo=;
        b=BvD/+6OdPthafkxxChjvHWZlT4+2AmLgXxUiuGenvVc85o8TJf9gheNnMvBOQyk9gb
         27rXTiP0R+OHsvX5E7yI8L3l5JsZzVVUDu/QbYfWFuTkpBYvXYVtB1i8+ga7ftSpqDfM
         2tEw1AWjVLEbcP8jMbY9OjGXYOg6QO2i8yfWNnKQB5n4lIIK3sP8XNq6zX0C9EaNe8qB
         CgwXqU8+5rVdgejQKHh5gBv4LWR4OTw4jvtE4v97X9PDYVoGMdPDfqtGlJpICseqfwky
         R3MUCcn1+DXYt08OaYvhkW05DkNSOjTD9DlDO6PMsROdcpU0TWacAX92lgRZdeoVHYNl
         pNHw==
X-Gm-Message-State: AOJu0YxeUDeU7WFqlkuXv6kRxh3jpljS3tK/YAIVpRdtocm7prviOoC1
	lQiMa3MNbADnDsfhRd/V0fg1FJ0fkaKV7UgAFOpeyEDlYkNuLUyNvLXvn7wiTQgglk2HS2nUETE
	cCx87nAiSxgpjIvDQjanRJI2sfCCuaYA/jJTQ4h/HBx+BMf+vQJECZQudwYfJ8LTP60Gv
X-Gm-Gg: ATEYQzyTcfzCAFu7XSCVhhVlBYOeVP/akNs6xHLKMYJuRF0Qk5WpgSj0TinxU7cDj5u
	iwQkK+BgSojPtUAvueO3Hce3Wy3aKWJaT9+7EbqUkoWT7mvsAXC60VgmdA+St97UrMrgVdfNE4/
	O5LNo7mlP57xr3yTw1ytr1TFFStEyzxQcyZqZsxRt2n4XDkmSYFp+ca3w8PIXpsmVX0AD7jeHBy
	Z9FrPq0ghUFIZ00N3lZV9pqRy0UZbAjwUldmtyhtUYG9YYmQbr4x5hnlbF12/fkHThb1b6UPUyr
	5yMQEQQ2f04/C01I20HhUKt5i0pOs9Bxnnn2yTu4oz7u4kf/AOopvwLp4Y87tO7qmxL62SfAzah
	oug6t6YrCyYTooNk8J9dgly47MBjoFjYv7NrVaFmx8IFP
X-Received: by 2002:a05:6102:38ce:b0:5ff:cc82:744e with SMTP id ada2fe7eead31-5ffe6184000mr7393092137.28.1773147826007;
        Tue, 10 Mar 2026 06:03:46 -0700 (PDT)
X-Received: by 2002:a05:6102:38ce:b0:5ff:cc82:744e with SMTP id ada2fe7eead31-5ffe6184000mr7393021137.28.1773147825523;
        Tue, 10 Mar 2026 06:03:45 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485246ed174sm178732855e9.5.2026.03.10.06.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 06:03:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 14:03:22 +0100
Subject: [PATCH RESEND 4/5] arm64: dts: qcom: sm8550: Drop redundant VSYNC
 pin state
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-qcom-dts-redundant-pins-v1-4-98e2ef430717@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2457;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=2ay/T2LVb0KNujzQYVBf/riykk1JFo+21WVSOwmQyzI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsBaedz20Ure/lTQv2g2FqKb1eosL+gLT6trIz
 cBfihmRil2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabAWngAKCRDBN2bmhouD
 1wJzD/9ZOhYlf9gldA0rvnV4aN4TODKeYDA7hjksidW1IXi/RnfYQvkurJ/Qm/KDM27mMZEvIuK
 HQ9H4piZXKmtK1OTsv0Xs9uwXJpf6GJ1CiBByyH0XlRK7xqUi5QQCvoRMzkS/be9ALgr7ZX6c78
 QGLeetcxV48RMZRrcl6Lwp9XE/kMyK63KTfdkkriFTECZrF7JnlS2PN7LAPKFjltYyUOKFmEglb
 Pm+gaRAKfK1y5rV8c2BkD17Q4EWcpSCdswjQ61GrzhYlHzIF/dXHgz5Xb+xpjN81fUuIUkpEG6q
 It2YLa6+0xb2zt0qdn6UmYmSSK1Z9ODiEFbaDrq/Iv2ETh7Nw1X1jrmKn0+b3pktOmn2m2bVX4S
 aGi48KpolxneO3ClCFIF009nBDWoRCEk0UaRWxNwPPVY3NRqRnC9t3DUS7Q5v0uNB9RC+yW2uc+
 qMzq+6zgqpOnkzNTe4LcFjxw84Xh9U8c8fqpI/w4TZ6a5I+Yg/luUfjkhc4vQZ0nvjhQ+AchOsX
 vR9tQ6Cx5Pk8Xk29BWKWPun+cEgwcQDhF/gaiU6yvTHP4vlRtWPXPhC+22LY7Tb69EmEZdOZcRF
 iaPsIFQcqqTdl2dpjREU/yuQoIq+a09896IibR/svl45h8EEAkvtZNnN/pkZYKmyl0NdPC91lhU
 tXV9cTpdhcuRAeg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDExNCBTYWx0ZWRfXxnRkgX40b9ah
 BPWAFS7aNrMaVauPeorPAJpFo9wC/Ts9P3uX3nO0FrRHH6FxbG/HqVRtNcNaleOTUTcqVdbBINd
 r5Fr1Zu92cIzIQN03Ee2uBpqeIVE0oFLjykct82va+PDTtV15cLoxJT2cwJ0aX/zSnjX8oTUxzK
 /w7BlqDMCw/6w+7P+FGCs+abuSVodtthCYYtHYrhVx8d8jyznzpuO6aO5Vic2zLH7Q7ZlcM5Sqw
 4BRpWLGQ7/0VsBCv2QKzwIgsWElOOquMC0NyeJ5q5rewr94OUOkiKcwxqoOyrZ01cD4Ze2SjmRo
 sU/mlkZkhyiQabG+qQ9QipTXzGqUeGIVuVXb/XHwi+lqutZwEQAJ8V12g/2/Mns2vXbOnjBZC0P
 EPioF6NoanhVq1awrSTh7PARe/FHYkqJ5s0AgzZ++DxMLOa4IC2/24RtwKtkigyXBLTkIFkeaF5
 5Qi/r1C34U2K8siYW5A==
X-Proofpoint-GUID: kVh8VIn_gXpRqoUYW7Errn7Pu8lSZjgV
X-Authority-Analysis: v=2.4 cv=KLxXzVFo c=1 sm=1 tr=0 ts=69b016b2 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=kV-nSK4kQYlWBrUG9uwA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: kVh8VIn_gXpRqoUYW7Errn7Pu8lSZjgV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100114
X-Rspamd-Queue-Id: B0081250CE8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.0.0.0:email,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96651-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts | 13 +++----------
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 13 +++----------
 2 files changed, 6 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
index 94ed1c221856..5769be83cfbd 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
@@ -707,8 +707,8 @@ panel@0 {
 		reg = <0>;
 
 		pinctrl-names = "default", "sleep";
-		pinctrl-0 = <&sde_dsi_active>, <&sde_te_active>;
-		pinctrl-1 = <&sde_dsi_suspend>, <&sde_te_suspend>;
+		pinctrl-0 = <&sde_dsi_active>, <&sde_te>;
+		pinctrl-1 = <&sde_dsi_suspend>, <&sde_te>;
 
 		vddio-supply = <&vreg_l12b_1p8>;
 		vci-supply = <&vreg_l13b_3p0>;
@@ -915,14 +915,7 @@ sde_dsi_suspend: sde-dsi-suspend-state {
 		bias-pull-down;
 	};
 
-	sde_te_active: sde-te-active-state {
-		pins = "gpio86";
-		function = "mdp_vsync";
-		drive-strength = <2>;
-		bias-pull-down;
-	};
-
-	sde_te_suspend: sde-te-suspend-state {
+	sde_te: sde-te-state {
 		pins = "gpio86";
 		function = "mdp_vsync";
 		drive-strength = <2>;
diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index c35d4737a412..2fb2e0be5e4c 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -870,8 +870,8 @@ panel@0 {
 		compatible = "visionox,vtdr6130";
 		reg = <0>;
 
-		pinctrl-0 = <&sde_dsi_active>, <&sde_te_active>;
-		pinctrl-1 = <&sde_dsi_suspend>, <&sde_te_suspend>;
+		pinctrl-0 = <&sde_dsi_active>, <&sde_te>;
+		pinctrl-1 = <&sde_dsi_suspend>, <&sde_te>;
 		pinctrl-names = "default", "sleep";
 
 		vci-supply = <&vreg_l13b_3p0>;
@@ -1179,14 +1179,7 @@ sde_dsi_suspend: sde-dsi-suspend-state {
 		bias-pull-down;
 	};
 
-	sde_te_active: sde-te-active-state {
-		pins = "gpio86";
-		function = "mdp_vsync";
-		drive-strength = <2>;
-		bias-pull-down;
-	};
-
-	sde_te_suspend: sde-te-suspend-state {
+	sde_te: sde-te-state {
 		pins = "gpio86";
 		function = "mdp_vsync";
 		drive-strength = <2>;

-- 
2.51.0


