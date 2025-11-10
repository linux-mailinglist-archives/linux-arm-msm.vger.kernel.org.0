Return-Path: <linux-arm-msm+bounces-80941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE5AC4571D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 09:51:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C8773B3EBA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 08:51:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DE5B2FD7A3;
	Mon, 10 Nov 2025 08:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YqLCHXYy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BCTZsh2Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD9F2FE56E
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 08:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762764643; cv=none; b=cYtjXDFDyhkk0bR2hEr8KlWnhNf46EavGKjaADKuU0niH2/Zg11HDhHko0NNepihJiCWSqrtHORX9CzaxO8PfOqlBnzm950sdjGbCT1ptC5BgRVToFZjX3vrurJoBy5NBdSDSfqBNaMLehCRrwBFG0HeZ11M0EjTIHQLV5sKPhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762764643; c=relaxed/simple;
	bh=uI9I1fkK7CXeQsPWFeT+xjn50HGW1cXwe2C64/oLTqU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sG/ScE7j8dNC1DDAnrViMiV0Ni06WUuxMUa/icg1GwHYMKzaj5tVzgm0QialG+WVYbR86GEFdYVSfut0xg3/+WT22TfSLv8Xa05s8J1CeN+R8APUAupHrD7yIdOWbCMcFfZI3NWq3EV39CzRKuaQF92AwH6a+0kBJhiNcR3qgDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YqLCHXYy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BCTZsh2Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AA8T3Jh1494023
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 08:50:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NBZd3PMviR5
	5grv86w6EJGN6jeYZhx9rfGhFYWoVYFI=; b=YqLCHXYyDVoDCN1vQPGojMa18yk
	0Mz1n3jBudvDXD5kvKLAgra/eZ0N3YhsLJUxjalff7AU7PwEfV7gdYzMB8pXUFlN
	ZWiA86zp/eJVMmVhQulQz1g0IkQKbHMJkL5brn8QhpfRmItL6d1qkfFt3OQKCaby
	hvnKh5aA1w8oa5dIO2Lk4xaFqaRcKTkd/m3YLbxA/CEY9BayY1dwUiVQYvJc67XB
	UtwtepHz02red35fuJNCxsbGx+P6cnoewrwTzM7cAv6ltll4BALTwo6K9WySLiQR
	+QAld79/edyCjPhbhrI0p9bGcSx/ly3GftbIhYjkOk74rV7Cj8/boig3MNA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9xs7c12q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 08:50:40 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2964d6164bfso10006185ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 00:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762764640; x=1763369440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NBZd3PMviR55grv86w6EJGN6jeYZhx9rfGhFYWoVYFI=;
        b=BCTZsh2ZtHw0/DHV/KftRlgbVqF/vpO1itFhODSUigJFBFC79SJvpBKpltTNXuu5/f
         L6qmDl3MH82Iyzyy6rCUs9WNwXtq4k6AGEmX2dNCqzQrvQMJ12sxnlQiGdcDQVQblAZR
         1g/g210SBGIH6GJG2ac5WL3/9E9VFWd44Zd/faxL80u5MK1Hnaivm/6ZSsTCu6VW2hwq
         hBeK0dPSQakehzKwxuSov00dIouOSe5+7usZfuiquYF9Q+RQrPDxCAE9YThOPUernOZr
         0tJhL7nb2sY1KGjUh7FXmwbCv0AiYVnae6ANTjfiTN5wKgUroicIKRF7OvllxJgz5ele
         XMSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762764640; x=1763369440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NBZd3PMviR55grv86w6EJGN6jeYZhx9rfGhFYWoVYFI=;
        b=cKTe205hNUQykx1oZs6raaJjjaS6t7YYlckKCHK79LFCf56wFPn6dk+tB13go8KxGY
         5gqNM+KgelRG4u9JWr7lo6deV6vmcYIaDd/NBigjQCp2tGIPB0q0EGIF1OSkPfpJrA86
         gYSBnBqbophvtm7JoqYmeqs6tfLrjiMyxp6FbMJjM3+hvorPmbECxEGGmKJRNQUSjdYT
         wtBIlXX9PIoZz0X5SuO0Q3jK+W+cTyRbKxgIWVBprSv0C3E46tF2PFaMtnlottLZ2RVN
         4DCBegN70w4xy+FRkhsl6Vyb/oeU7IBPcjhIzUdZwHW+LcI36MrB2MDKwks1vicgtMIP
         boAg==
X-Gm-Message-State: AOJu0Yys4JND2EwzvONuO+ssIeqtG2Tq4JorMNo4lX89SRoFdwVpONha
	JFvTeNfry8EM7H3rhqNWWsdAHVWorFZBwhzEhrwIe7HMxToCnNqolL5stajK032k0/MN5F9pJ8A
	W5R9gCQojO94vR2qcFJUOn0D2di9y1pTolzwr9erBA/QEzQInyhkiQOuBGe/ZHRuzUX0=
X-Gm-Gg: ASbGncu6NruWaHCs1yWZ26CeLKcnEWKcyhIyM7DysGthvWlWf35xiGxBHRJNwRT6Isb
	itcwFa5mdYGtbWVYowtt5DnIbHziHGU/5LaHfE0SaWt7bvJ4Lw/VD0ErnfkD5JjkIHGNdnjb+3O
	4EviIGKCiaR/plALrBZaVIdLlDxYWdqcK4/dR1ELLDBp/qv1O37P1ULEj2gI2X1lZ2pX3ccQ5G1
	iXpT20Yz8f9pNd2P+hbnevaeVzQRg0slNeASlg+/ij9sUzeTKKHKh1UATBUEYD820PUb8od3BKb
	DGrPUyi1V9mNNn7AWxzzLpGLtxPHwtRJdCOmfnZmYdIJjeCvbobJR6dCBpJGqLfHcAM47UfJbCm
	U5i/ajqHefvkPsen3g2etCrtNeZl6sA==
X-Received: by 2002:a17:903:244a:b0:295:f960:be2a with SMTP id d9443c01a7336-297e5712034mr48843865ad.8.1762764640156;
        Mon, 10 Nov 2025 00:50:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGbKwjSpzaqIwETQ7AXQ0mZlRymqM+XUs2HO3ow8cFOplYqI2CXTamxE/t21BFzUSI9M3CTZw==
X-Received: by 2002:a17:903:244a:b0:295:f960:be2a with SMTP id d9443c01a7336-297e5712034mr48843745ad.8.1762764639641;
        Mon, 10 Nov 2025 00:50:39 -0800 (PST)
Received: from hu-sartgarg-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29650c5f94fsm138691365ad.40.2025.11.10.00.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 00:50:39 -0800 (PST)
From: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH V4 3/3] arm64: dts: qcom: sm8750-qrd: Add SDC2 node for sm8750 qrd board
Date: Mon, 10 Nov 2025 14:20:13 +0530
Message-Id: <20251110085013.802976-4-sarthak.garg@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251110085013.802976-1-sarthak.garg@oss.qualcomm.com>
References: <20251110085013.802976-1-sarthak.garg@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: d39p_2ZTCrriEhRSau0dc2hCBO9N9dsi
X-Proofpoint-ORIG-GUID: d39p_2ZTCrriEhRSau0dc2hCBO9N9dsi
X-Authority-Analysis: v=2.4 cv=LtifC3dc c=1 sm=1 tr=0 ts=6911a760 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=zXSOlch8-c1XrFqEhSQA:9
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDA3NyBTYWx0ZWRfX+2lZj5ziFKag
 pxrqH5RZpeIstAqYBcXI4g0BGdjJ+4sUw7hrT6T70poD0W3X5JhM0SLf9l3ns1sJ31kJDBMnTrF
 wmy4YeyosfpwSZac6gdlqZE52bgOt/PLpQCiFw/pgOwngnIzFuCREEtTNJqUW+kyeHw/8tJSllc
 vlLBT3BlXqfmPx4rxgXTH9Fe/jHsIO4XVwxZz9lMNrH9qgO3AELSZvEAsGRbvMDwBvphdLmHhIu
 7UxFOo+UpB4TY+4BS7ajLuarnuNoaJrD91+QUQVXJ68AH9qNPhyiSNYUt4QLlXSKwrQjsGyMcm7
 jm35BSo6sAcT4Qkav6lbfbKM51geu6Jq+EwSViDVzRO87ZrWE29TeB85Wso9F1BgDVF5Z4QDnOF
 xABj0yizTOYYvtxVjXrrNAWVYdMwZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100077

Enable SD Card host controller for sm8750 qrd board.

Signed-off-by: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
index 13c7b9664c89..e08bebf93966 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
@@ -916,6 +916,22 @@ &remoteproc_mpss {
 	status = "okay";
 };
 
+&sdhc_2 {
+	cd-gpios = <&tlmm 55 GPIO_ACTIVE_LOW>;
+
+	vmmc-supply = <&vreg_l9b_2p9>;
+	vqmmc-supply = <&vreg_l8b_1p8>;
+
+	no-sdio;
+	no-mmc;
+
+	pinctrl-0 = <&sdc2_default &sdc2_card_det_n>;
+	pinctrl-1 = <&sdc2_sleep &sdc2_card_det_n>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
+};
+
 &swr0 {
 	status = "okay";
 
@@ -1031,6 +1047,13 @@ wcd_default: wcd-reset-n-active-state {
 		bias-disable;
 		output-low;
 	};
+
+	sdc2_card_det_n: sd-card-det-n-state {
+		pins = "gpio55";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
 };
 
 &uart7 {
-- 
2.34.1


