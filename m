Return-Path: <linux-arm-msm+bounces-84051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FBDC9A9D4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 09:11:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 13288344FEB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 08:11:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4D52305E37;
	Tue,  2 Dec 2025 08:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gqqogHVA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Die6nPE+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2977130748D
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Dec 2025 08:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764663046; cv=none; b=FSPJeBmMNSKwNwmCCaY4x2FTcKKR6GtSTxkIhIwX0f2fdXXGGwQ+WcGfqyfb3+QaudAa0BjCJk2ijZ/OtJbsC3qL+BMqfDmnka0iP0b662Ssl/pXDq12AMp+kx8zFlDWpMPaJbZAw77zOFlLKo/odiBSl6tBQ//oX+U/lSKx53Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764663046; c=relaxed/simple;
	bh=LWQNhfUZEI1GGX5ZyBZUvauKVVJJ0GQn6n0JEnmnEWg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DSzN4d9/du0Td2bZa2RtoUs1RdytzKzXfDaMIFTID8HlBOy8/XZ10qzpIBdVRGi9HaRwyxvVSILmMr2QKb9mFkqlbcSARqMomuuMDAc1+gm2T1iXO3C1YsFQzgSyOmvsZshw+9/+J6Lpg9bRE0bNFuulVlNYH6xgfUqHslZrWQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gqqogHVA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Die6nPE+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B1MmY5v1926628
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Dec 2025 08:10:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VM2yQhQ/Z4/
	6ywoq1dTH1jc/6cO6oXXpiNaFFANTIj4=; b=gqqogHVArcMRQ+7YTc5Q+JPusqE
	tINbJ8QIqbZErYDoNyZ32WnRICMZjgjbnOqwJLnvlGan5MLDtB4leiQXLG02z59J
	794pDcA0c5y2AYmY5dhP21ASn2Kg4IkyvU/c2JIoWPivLmUwWJpjFAkz3yiCLDwV
	hR/zf4tC634EIhBIU+w8j4Lv0MR4ExDKcKvYOEYHkwU4zsrcRLAPP2RodU9ONhUh
	/AJDNOpVRIdjY52QicqAmKWg5EzJklp9OgCif9YP/uh5lynjnICcQjc/u9E7dsS6
	5ak3IrLGeAi9c/hF5/pbmDQXXDvRRVrruLtnxLwxASiW+fcCdgheNpKGaBg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asm4xse21-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 08:10:43 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34361263b93so1273935a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 00:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764663043; x=1765267843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VM2yQhQ/Z4/6ywoq1dTH1jc/6cO6oXXpiNaFFANTIj4=;
        b=Die6nPE+FMi6cFYwlBHvjs3KAL4sqjTRfFwU7IFn8JiD/E3cmtDqKRad8SQjTYQKOA
         7Tc4gpYM1H7qUW7vFgAnt4A5F3qTgh6jmUGARAaNTLfS8uUI3dn1cL25YZMQ9lbHK//S
         s42SLM6JZ/oMKL55gPnYiJqY58QbZyKBsIBomMaFXBcIF3iQHsWWZMkfaVlq2GvBS+yU
         0AseenYlYwsk9uzE7jEnRexRyyepNdKOXRkVGoUPJr4IhkKbmgos9dPQrQ5J2G8JTUeT
         E8Tyopo4jamHeECLOWNvrxd2DLG3mBQN3RLdym4IQNsthWJgfegA8B927+tBjYpEgsuR
         LRFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764663043; x=1765267843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VM2yQhQ/Z4/6ywoq1dTH1jc/6cO6oXXpiNaFFANTIj4=;
        b=YO9ATiwd4JaabOw2+zdRj0mGH80luwaJZ55qs+k0VJIBr34x1lM+Q2Gotq9DdIjpiQ
         Ggl3S0JM0tmo/lIkEO02TwcNdsPNvpb/FhfabDlnjittCFIpms0kpNH8ptsNymjRj9z2
         TeEXTH3I/7GxpX/XMkjKPWBzuqe5GFY7cBzEHBdMFl3Is+qAupE9wy4RF7Nkp6Qyz1Yd
         NmnGjvUU4/CInxW1T9++c238v70nMja2pidMADzWQXhrSNKqlKskl4x2P0PzeuacaZY8
         /GjnNJBw0ZjGGZGN22qxWVkPnU48jJcOKTpyvhWfFd7B1i39i1+DJF2C7GOoFUn8vmcp
         h+0Q==
X-Gm-Message-State: AOJu0Yw/bVvzKz+MZL3B/CtqCeCLcx/7PYVWw2oH+brYg4jGr0AeIx8a
	rqvS/Du0rXMsfbiVgtzcRZlNgbXoEAQL+3ZVsJfgtvZDt/eIFUs6MI4wf1hDkja9/8h5/N+XPex
	/2grAbWK/Ls9VFkFb0UwMOmSvhfGDP3/PH22O7EgEtMEVRgv4IliW1J5Rl6nr9neKi4U=
X-Gm-Gg: ASbGncvAK2pC9EkOVQJMHo9MjW/xaGq1QsSEMAKdstcl8CEk+VvfbCoZuuCHmrNASh6
	gLmdb5on8mTL8Yr4z8iMw4fIpMpLLIz1YckbvshZ6RTaVBCvfOCJ0YtvMtWM2HLMD52MG+DfcGu
	x8FkJEIWSVL0N0hwmznDur70WQu18cesQxA+PAcTSjMeWSLeGCpg/KHcNVa8CiEeBH1iw3aCwqp
	vT8+TRJz5l3o5SrU2uf/C1kByry+NLWOiSlxaXiZa20Ikw2ctlWy/SYgX7tXjM/SbWhUznLjgh+
	5JSKVG4nA7DvYNhgm2+ucU5WLssjRps/MXekIe6q7uamtcP6WAd4wrnvJcBB2iJSq3XmAB3NTJX
	h9iTLqd7i2ywX3ztQqXgwY+9W7R5LP7ZtCYPsDTXp
X-Received: by 2002:a17:90b:3ec8:b0:341:124f:4745 with SMTP id 98e67ed59e1d1-34733f58931mr24371977a91.6.1764663043003;
        Tue, 02 Dec 2025 00:10:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGPMcPHuIhKioEHokY/bVjAH6xp7LlaSLimowdCQojXPmek63qfW1QGPGu+Fy0Reo+OhyL+Jg==
X-Received: by 2002:a17:90b:3ec8:b0:341:124f:4745 with SMTP id 98e67ed59e1d1-34733f58931mr24371946a91.6.1764663042597;
        Tue, 02 Dec 2025 00:10:42 -0800 (PST)
Received: from hu-sartgarg-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3477b1cbdc0sm15419794a91.2.2025.12.02.00.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 00:10:42 -0800 (PST)
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
        Abel Vesa <abel.vesa@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH V6 3/3] arm64: dts: qcom: sm8750-qrd: Add SDC2 node for sm8750 qrd board
Date: Tue,  2 Dec 2025 13:40:17 +0530
Message-Id: <20251202081017.2234677-4-sarthak.garg@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251202081017.2234677-1-sarthak.garg@oss.qualcomm.com>
References: <20251202081017.2234677-1-sarthak.garg@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: mq3pLbUsl1dRtWm-O-s_m0a9DUb9hTF9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDA2NCBTYWx0ZWRfXw49+fT9mzC8Q
 oJ+UMQCz0OmeJro5mKS9C1PM2rgynKXyVOVyjsfDUJnsH4zWA5FFyhRJZ42/bLsEmo5TkQFdMQc
 C8m1oMn3FRWFixWz/g/hPR+4y2BNmT7Me6Wk6rlePYwowOnOVKkIeqgm/to2PY5WrzPp5nG5JIh
 8xJOLP59QFuxPVmbf0yZ5qXt+Pi/nG1A7ilAcDKzDHyE4Pc6io3GPNpfNw0GAgikuZV9eLOwLLI
 7d3R1ghq5bg0cO5/9tgG/ak9nu8UBfJjgQEVct9AgxeCuMq6mRX2j5K9XGS6knpt6F5T/rwvQFy
 YkUWJX+hINLT4vHccoMg+LrnnypkhGynkeqEpw2/75YN6mf33PKj3BO723W7JAvhXSIXXkJygIo
 p2Kbivl+D7Ym9eYSDNrRuo3+gIJtXg==
X-Authority-Analysis: v=2.4 cv=cPTtc1eN c=1 sm=1 tr=0 ts=692e9f03 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=CuSXmbl0-BlP8Dydlo4A:9
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: mq3pLbUsl1dRtWm-O-s_m0a9DUb9hTF9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020064

Enable SD Card host controller for sm8750 qrd board.

Signed-off-by: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
index b0cb61c5a603..439ffb202599 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
@@ -961,6 +961,22 @@ &remoteproc_mpss {
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
 
@@ -1053,6 +1069,13 @@ &tlmm {
 	/* reserved for secure world */
 	gpio-reserved-ranges = <36 4>, <74 1>;
 
+	sdc2_card_det_n: sd-card-det-n-state {
+		pins = "gpio55";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
 	spkr_0_sd_n_active: spkr-0-sd-n-active-state {
 		pins = "gpio76";
 		function = "gpio";
-- 
2.34.1


