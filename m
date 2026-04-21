Return-Path: <linux-arm-msm+bounces-103959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOFGCDqA52ku9gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 15:48:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5572A43B839
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 15:48:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8084B30565B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 13:46:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3C413D75DF;
	Tue, 21 Apr 2026 13:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C9OVaH5N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IkwicpxJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2610B3D7D74
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 13:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776779159; cv=none; b=uQom72pWbJwxS3TAfPIN7N42hRJdaP7whB1OxnApRn7uPXqIhksHlHRD9Zc5jRE6sh+eCqA1PsjZVnSvLfDtRU1xskuGha6Ins6zgj/BNZAIIdgA7IJWDoyExAlBi+3IpYkoq6FaSL7Sd+fJd1F7JckaY7/Dvyvm+05v7x/UjRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776779159; c=relaxed/simple;
	bh=mtVJ0HzKUDhK+8r1fEuCK2cHsepYwC1s8XJGYUhNDLY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H0WAXM9AjP24NT5583emlyrxwVMglI6nQ1ly9iBlJDjVDz+twPRWI0fseRJmU6WW5OKVOr8R5NW80cB8I/cx1n7U42avWEaijInB39TFWlF0DCsIhXIFrcc4BZR6cxEVS8q9F/K7Ai9jQtRrGIPIFoEI+RWr6qvFG5x06NCSTEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C9OVaH5N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IkwicpxJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LA5wiW1834756
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 13:45:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mTcdci/gXf+Fz6ArVxe3cPZ/AQHnwCT8gfTTgspxxSI=; b=C9OVaH5NzGpR57nL
	6eSVPPuwYoJaKj88ZBkMzIk6nXIbPalrZKTxdW/OrygN/ArtuukB8a3c6YzuEB3K
	BbNHn0yjSbsAH8kwcQvWvZf+Yqw9efH1M0nZllMPwDZLxaBNJ8Y7Oqe6ehpCCISG
	DQsc8xK6tkUsjS9rd9PeQAwHUFscvD0fjrwW5aypCEioDwov6hSaXG8vrUHtxozj
	RwBuH0DEdzPTycy7fwZ68Qu2JE7jYgIMl1tRg4g5eDyQG5eXMly7+YfrRBlfgvwg
	4Xs9P5RNtR/hNETcOu1tEtECCRh/2IUHmGf5ESNZ6D4cg5sakQBZlCNQ2CYqmLFL
	dFZyaw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp76grqd6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 13:45:55 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-56f6e1969c8so2055785e0c.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 06:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776779154; x=1777383954; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mTcdci/gXf+Fz6ArVxe3cPZ/AQHnwCT8gfTTgspxxSI=;
        b=IkwicpxJRkYt2sAPldq5UPjNtgkOTOP3xJ8CnJwraPXT0bkmgmB7KV4grsMhjZSRl5
         MoearMlSjqUPb2CB0/SwoGXC0E26nkUw022/xR+VFqsL+oqtIdlwXsw6IJYXfSKJ17rv
         wQuR3osRWTPbuX7swiwQWFXLQRlnkdC0FchuViHjs5h4Y7jlnOGXVLEfXxJA0sYRjJjU
         CWUsZDopcTdHrOv5iEy9qutekOhYYm2pxsxzQN2T0Nj2i2dgvEd96OCyq0JymZ975zZt
         OYH75xFYzK/yXz+VCpWg2a+8+mb/Objxs5FxxPx9QVMxoSKepmGuQkmEtsVFVJEd9E0s
         YD/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776779154; x=1777383954;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mTcdci/gXf+Fz6ArVxe3cPZ/AQHnwCT8gfTTgspxxSI=;
        b=YiFd6yZk5Z4z/EWd7BJTDYTnYZaHNWgzyeZ2EZHH1skDLjc9gQOx0JHOWxUZi+uT5J
         sGg2ugLSYRS+HTqzycqG0S4moOMwFa2co5EnloxwDrpQCJTpDsjHt4Ne7yldxJj3O9dY
         8BR+CS3XlpsnSfMqL7PsSa98qq6yg9x0cM928ub08VBF2HnhqTFo1c6NC5BktHaxldzP
         hqAorQ3BymwgAbMaIPuMkw2/y36t0rCNrpjP2+hzLaCU+PnhFnNZpO52+ClislTn9OI1
         LwEBFjBTofh3xRdpEX0gA3tmZ7fjiWQtkzygA4Z5BVW/JXqWaW6LlWT19ODtGOryGkni
         aBug==
X-Gm-Message-State: AOJu0YwCJa8QNK9r2WVwcWK0CLJuy+5VhJrToOIKsdNMgguCcW5cDOHW
	sNUOwDqEa2TqfL17GZI4EiH40RPJzh9mvBC3B46PDj5MUt7DtpMDYjXYTQDKG45nAEQl2As7NHN
	2JS2d2hPI3do/CO8MTDu2Zv6neRNEw5vEJGs4xMsOdq0+f3NFPGn5NydY/je5adVA1XDM
X-Gm-Gg: AeBDiev8Wf9uNhgpx6Ov9q7QEn4KnDPVK2kuKFnTkniiYknPYeDOgtwmHymNxb237s4
	fh/7LKy8OlFVC557XngBtrnn89ehHKOY0r1AqcQLoNrNbE2SJXNVbRxZHrda5t3iegK/+kuLMqN
	B7cuuufNfW2KKRRE/AB3Z9M7ZktTssdiurTx2FMrkfHAQ8FlSWt3BeM+IlZKsdr5adKDKI3j3AA
	j7S5INf2Ms3rQl7YZ7RFm4hcRvayOVAx+79uzXWCpCTZ1S1m58Yx87sfsjQWXXzIo0ve78jU4rJ
	8s3IILVOqWqvKm20ZuOeLnouqjqulhYdeZzFm3ikK3eiaQpp/E9cAtvRKg4wGL+o0pi4ZeCuBfr
	srPWX7wBOynXPacUeSVD3PZFzedBM5CNstx5u+j/PkPY5S4nygOYuf8s=
X-Received: by 2002:a05:6102:160d:b0:5fe:af0c:79f5 with SMTP id ada2fe7eead31-616f4538251mr9162236137.5.1776779153873;
        Tue, 21 Apr 2026 06:45:53 -0700 (PDT)
X-Received: by 2002:a05:6102:160d:b0:5fe:af0c:79f5 with SMTP id ada2fe7eead31-616f4538251mr9162192137.5.1776779153294;
        Tue, 21 Apr 2026 06:45:53 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb1249sm34508647f8f.5.2026.04.21.06.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 06:45:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 15:45:29 +0200
Subject: [PATCH RFC v2 2/3] arm64: dts: qcom: eliza-mtp: Enable DSI display
 panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-dts-qcom-eliza-display-v2-2-67f8cf155331@oss.qualcomm.com>
References: <20260421-dts-qcom-eliza-display-v2-0-67f8cf155331@oss.qualcomm.com>
In-Reply-To: <20260421-dts-qcom-eliza-display-v2-0-67f8cf155331@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2096;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=mtVJ0HzKUDhK+8r1fEuCK2cHsepYwC1s8XJGYUhNDLY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp53+J8Dm3G7QPAu9quIwoOzKQdreh8YYs4QHAS
 QMUebakB3OJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaed/iQAKCRDBN2bmhouD
 19O/D/9Ts/JJY4RI5YIRqc2+cfsFwkj2tfD3/WzOxy9f0qLvjl/WAJTWfxQ3iuJGozkF7dWRrk7
 72ON8WWCB73/DaqolIBN0GdgaPYSG5DF4EM9fxGRtQ7i7l6w81h6GctlMLpZsv9dbKJQSyDG0LK
 D0utW3cHgMxn065jvpTC3L3kiMAdfQmspZVvUzvXVBQoIvsoSppiHB+tr4z9kJIYB9lYVMZa4fq
 tnrD2/AKe01cbTL+QY6HEAGIxHmDbdaCTcjBF6+N1Y0us9DJ7yiwx079HyOoktR4YoPlTBIkacy
 kT2GwyDYu2/8Wx1ypB3w/aKxLYL9qtuAOGXBI3WLStG+AC5cC5dSWQZ2prFrtUO3f+VxaTGqJTe
 Sk1ikbBwurYVkle7ZIx36B2NF6JMIB9yU1lDoZlypaYf3U4+/eRMVNmnsYL1ZobCqjjP9EDVQmR
 kWsm89t292u0AJoeMvGmPORmDZs1T9ry6YqcfVqoBS3i/9h2zrwRsFNmak5I+hAlSdiUcMm0CeV
 5tfRBUWFq31+ByGFcDJspa6pIfGe4UiCE8C7ocOsTrcd66p6859Z9FJb8IQQ0oubWlgOWLld93x
 zG9T4GEfz9JPjDvN2PQi2KTzu3hLKetW3Uqr60WUUKquCcG3yXaD3wxc+CisrRdYY5yl0gg2Ljn
 kc4O7UvkNZMlXvg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDEzNyBTYWx0ZWRfX2xSRBRE6or/z
 kIfxdBM3JiCH0RcwEp+T9WgHUzEZy3zN6nNn1yLynCBLy4zHSAgzOOPVdOBbpZGiOK9/oMKLKRE
 D2KNsdC4xktewFmZFHMqW8/xAVrkMGjv5OSynPTrewHnvN4P3/ics99To6qEhrS1jQDI297++5B
 JhXkT5vf/hnlIXGT5I6amUIpeOKaxEo2rWc/RXnBGZ0knKoKB5ytDDh2Vc4aROPi+C4fuqMSHQi
 F8kYapwi+ROtQGPP6gS0vBgaUqQnqnpUha2medlWtoV4ssHFpixcZu+HWRLhxslcvqSkIv+bV+0
 lSG6InbVd17AjwicnTacx9s/3hbH2oRk4P9bHhTUc3GCAFokkHq66d8dkTufukh5FXUUI1PwX9z
 nxH75XFIDTROPFPYYvoK2WbgxWLLI9nSDG31gqtoC7g4pmTRsxKakNo+DpjlMhMK4EYYTYzUAGS
 4brdsausFGZ7woSOO8Q==
X-Proofpoint-GUID: quZuN_8iMwGTAg14OG2yp0wuknFKBnvl
X-Authority-Analysis: v=2.4 cv=crWrVV4i c=1 sm=1 tr=0 ts=69e77f93 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=AXhrDi9n0sKHlwrsKv4A:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: quZuN_8iMwGTAg14OG2yp0wuknFKBnvl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604210137
X-Spamd-Result: default: False [3.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103959-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.0.0.0:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.972];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:172.105.105.114:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5572A43B839
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable display on Eliza MTP board with Visionox VTDR6130 panel.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-mtp.dts | 63 ++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
index c31f00e36eee..df0cfffcef61 100644
--- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -417,6 +417,48 @@ vreg_l7k: ldo7 {
 	};
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l4b>;
+
+	status = "okay";
+
+	panel@0 {
+		compatible = "visionox,vtdr6130";
+		reg = <0>;
+
+		reset-gpios = <&tlmm 12 GPIO_ACTIVE_LOW>;
+
+		vci-supply = <&vreg_l19b>;
+		vdd-supply = <&vreg_l1g>;
+		vddio-supply = <&vreg_l8b>;
+
+		pinctrl-0 = <&disp0_reset_n_active>, <&mdp_vsync>;
+		pinctrl-1 = <&disp0_reset_n_suspend>, <&mdp_vsync>;
+		pinctrl-names = "default", "sleep";
+
+		port {
+			panel0_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel0_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l2b>;
+
+	status = "okay";
+};
+
 &pm7550ba_eusb2_repeater {
 	vdd18-supply = <&vreg_l7b>;
 	vdd3-supply = <&vreg_l17b>;
@@ -433,6 +475,27 @@ &tlmm {
 	gpio-reserved-ranges = <20 4>,   /* NFC SPI */
 			       <111 2>,  /* WCN UART1 */
 			       <118 1>;  /* NFC Secure I/O */
+
+	disp0_reset_n_active: disp0-reset-n-active-state {
+		pins = "gpio12";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	disp0_reset_n_suspend: disp0-reset-n-suspend-state {
+		pins = "gpio12";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	mdp_vsync: mdp-vsync-state {
+		pins = "gpio17";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
 };
 
 &uart14 {

-- 
2.51.0


